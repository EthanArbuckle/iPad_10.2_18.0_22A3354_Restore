@implementation _LTTranslationParagraph

- (_LTTranslationParagraph)initWithIdentifier:(id)a3 text:(id)a4 spans:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTTranslationParagraph *v11;
  _LTTranslationParagraph *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_LTTranslationParagraph;
  v11 = -[_LTTranslationParagraph init](&v14, sel_init);
  if (v11)
    v12 = -[_LTTranslationParagraph initWithIdentifier:text:spans:isFinal:](v11, "initWithIdentifier:text:spans:isFinal:", v8, v9, v10, 1);
  else
    v12 = 0;

  return v12;
}

- (_LTTranslationParagraph)initWithIdentifier:(id)a3 text:(id)a4 spans:(id)a5 isFinal:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  _LTTranslationParagraph *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *text;
  uint64_t v18;
  NSArray *spans;
  _LTTranslationParagraph *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_LTTranslationParagraph;
  v13 = -[_LTTranslationParagraph init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    text = v13->_text;
    v13->_text = (NSString *)v16;

    v13->_isFinal = a6;
    v18 = objc_msgSend(v12, "copy");
    spans = v13->_spans;
    v13->_spans = (NSArray *)v18;

    v20 = v13;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spans, CFSTR("spans"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFinal, CFSTR("isFinal"));

}

- (_LTTranslationParagraph)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationParagraph *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *text;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *spans;
  _LTTranslationParagraph *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTTranslationParagraph;
  v5 = -[_LTTranslationParagraph init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("spans"));
    v12 = objc_claimAutoreleasedReturnValue();
    spans = v5->_spans;
    v5->_spans = (NSArray *)v12;

    v5->_isFinal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinal"));
    v14 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)splitIntoSentences
{
  void *v3;
  void *v4;
  NSArray *spans;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _LTTranslationParagraph *v19;
  NSString *identifier;
  void *v21;
  _LTTranslationParagraph *v22;
  id v23;
  void *v24;
  void *v26;
  id obj;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _LTTranslationParagraph *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", self->_text);
  spans = self->_spans;
  v6 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __45___LTTranslationParagraph_splitIntoSentences__block_invoke;
  v36[3] = &unk_250694340;
  v7 = v4;
  v37 = v7;
  -[NSArray enumerateObjectsUsingBlock:](spans, "enumerateObjectsUsingBlock:", v36);
  v26 = v7;
  objc_msgSend(v7, "sentences");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v11 = v3;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
        v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v15 = objc_msgSend(v13, "length");
        v30[0] = v6;
        v30[1] = 3221225472;
        v30[2] = __45___LTTranslationParagraph_splitIntoSentences__block_invoke_2;
        v30[3] = &unk_250694390;
        v16 = v14;
        v31 = v16;
        objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v15, 0, v30);
        if (objc_msgSend(v16, "count"))
        {
          v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v28[0] = v6;
          v28[1] = 3221225472;
          v28[2] = __45___LTTranslationParagraph_splitIntoSentences__block_invoke_4;
          v28[3] = &unk_2506943B8;
          v18 = v17;
          v29 = v18;
          objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v28);

        }
        else
        {
          v18 = 0;
        }
        v19 = [_LTTranslationParagraph alloc];
        identifier = self->_identifier;
        objc_msgSend(v13, "string");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[_LTTranslationParagraph initWithIdentifier:text:spans:isFinal:](v19, "initWithIdentifier:text:spans:isFinal:", identifier, v21, v18, self->_isFinal);
        v3 = v11;
        objc_msgSend(v11, "addObject:", v22);

        ++v12;
        v6 = MEMORY[0x24BDAC760];
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v3, "count") == 1)
  {
    v38 = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v3;
  }
  v24 = v23;

  return v24;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (NSArray)spans
{
  return self->_spans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
