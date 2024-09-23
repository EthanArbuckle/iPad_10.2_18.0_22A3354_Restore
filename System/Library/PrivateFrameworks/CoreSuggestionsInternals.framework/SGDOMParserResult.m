@implementation SGDOMParserResult

- (SGDOMParserResult)initWithPlainText:(id)a3 taggedCharacterRanges:(id)a4
{
  id v7;
  id v8;
  SGDOMParserResult *v9;
  SGDOMParserResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGDOMParserResult;
  v9 = -[SGDOMParserResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_plainText, a3);
    objc_storeStrong((id *)&v10->_taggedCharacterRanges, a4);
  }

  return v10;
}

- (void)insertSubject:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *plainText;
  NSArray *v8;
  SGTaggedCharacterRange *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SGTaggedCharacterRange *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SGTaggedCharacterRange *v23;
  NSArray *taggedCharacterRanges;
  void *v25;
  SGDOMParserResult *v26;
  id v27;
  NSArray *obj;
  uint64_t v29;
  NSArray *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ . "), v4);
    v29 = objc_msgSend(v5, "length");
    v25 = v5;
    objc_msgSend(v5, "stringByAppendingString:", self->_plainText);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    plainText = self->_plainText;
    self->_plainText = v6;

    v8 = (NSArray *)objc_opt_new();
    v27 = v4;
    v9 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:]([SGTaggedCharacterRange alloc], "initWithAnnotationType:tags:range:text:", 11, &unk_1E7E10A28, 0, objc_msgSend(v4, "length"), v4);
    v30 = v8;
    -[NSArray addObject:](v8, "addObject:", v9);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = self;
    obj = self->_taggedCharacterRanges;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x1C3BD4F6C]();
          v16 = [SGTaggedCharacterRange alloc];
          v17 = objc_msgSend(v14, "annotationType");
          objc_msgSend(v14, "tags");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v14, "range") + v29;
          objc_msgSend(v14, "range");
          v21 = v20;
          objc_msgSend(v14, "text");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v16, "initWithAnnotationType:tags:range:text:", v17, v18, v19, v21, v22);
          -[NSArray addObject:](v30, "addObject:", v23);

          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v11);
    }

    taggedCharacterRanges = v26->_taggedCharacterRanges;
    v26->_taggedCharacterRanges = v30;

    v4 = v27;
  }

}

- (void)encodeWithCoder:(id)a3
{
  NSString *plainText;
  id v5;

  plainText = self->_plainText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", plainText, CFSTR("plainText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_taggedCharacterRanges, CFSTR("taggedCharacterRanges"));

}

- (SGDOMParserResult)initWithCoder:(id)a3
{
  id v5;
  SGDOMParserResult *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *plainText;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *taggedCharacterRanges;
  void *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGDOMParserResult;
  v6 = -[SGDOMParserResult init](&v19, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("plainText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      plainText = v6->_plainText;
      v6->_plainText = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      plainText = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(plainText, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGDOMParserResult.m"), 66, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "plainText");
    }

    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, CFSTR("taggedCharacterRanges"));
    v15 = objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGDOMParserResult.m"), 67, CFSTR("nonnull NSArray<%@*> *%@ was null when decoded"), CFSTR("SGTaggedCharacterRange"), CFSTR("taggedCharacterRanges"));

    }
    taggedCharacterRanges = v6->_taggedCharacterRanges;
    v6->_taggedCharacterRanges = (NSArray *)v15;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSString *plainText;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  plainText = self->_plainText;
  v7 = (void *)-[NSArray copyWithZone:](self->_taggedCharacterRanges, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithPlainText:taggedCharacterRanges:", plainText, v7);

  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_plainText, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SGDOMParserResult *v4;
  SGDOMParserResult *v5;
  BOOL v6;

  v4 = (SGDOMParserResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGDOMParserResult isEqualToDOMParserResult:](self, "isEqualToDOMParserResult:", v5);

  return v6;
}

- (BOOL)isEqualToDOMParserResult:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *plainText;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSArray *v12;
  NSArray *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  plainText = self->_plainText;
  v7 = (NSString *)*((id *)v4 + 1);
  if (plainText == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = plainText;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_taggedCharacterRanges;
  v13 = v12;
  if (v12 == (NSArray *)v5[2])
    v11 = 1;
  else
    v11 = -[NSArray isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (NSString)plainText
{
  return self->_plainText;
}

- (NSArray)taggedCharacterRanges
{
  return self->_taggedCharacterRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taggedCharacterRanges, 0);
  objc_storeStrong((id *)&self->_plainText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
