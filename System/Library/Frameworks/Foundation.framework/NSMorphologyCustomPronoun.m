@implementation NSMorphologyCustomPronoun

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMorphologyCustomPronoun;
  -[NSMorphologyCustomPronoun dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[NSString hash](-[NSMorphologyCustomPronoun subjectForm](self, "subjectForm"), "hash") ^ v3;
  v5 = -[NSString hash](-[NSMorphologyCustomPronoun objectForm](self, "objectForm"), "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](-[NSMorphologyCustomPronoun possessiveForm](self, "possessiveForm"), "hash");
  v7 = -[NSString hash](-[NSMorphologyCustomPronoun possessiveAdjectiveForm](self, "possessiveAdjectiveForm"), "hash");
  return v6 ^ v7 ^ -[NSString hash](-[NSMorphologyCustomPronoun reflexiveForm](self, "reflexiveForm"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSString *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSMorphologyCustomPronoun subjectForm](self, "subjectForm");
    v6 = objc_msgSend(a3, "subjectForm");
    if (v5 == (NSString *)v6 || (v7 = -[NSString isEqual:](v5, "isEqual:", v6)))
    {
      v8 = -[NSMorphologyCustomPronoun objectForm](self, "objectForm");
      v9 = objc_msgSend(a3, "objectForm");
      if (v8 == (NSString *)v9 || (v7 = -[NSString isEqual:](v8, "isEqual:", v9)))
      {
        v10 = -[NSMorphologyCustomPronoun possessiveForm](self, "possessiveForm");
        v11 = objc_msgSend(a3, "possessiveForm");
        if (v10 == (NSString *)v11 || (v7 = -[NSString isEqual:](v10, "isEqual:", v11)))
        {
          v12 = -[NSMorphologyCustomPronoun possessiveAdjectiveForm](self, "possessiveAdjectiveForm");
          v13 = objc_msgSend(a3, "possessiveAdjectiveForm");
          if (v12 == (NSString *)v13 || (v7 = -[NSString isEqual:](v12, "isEqual:", v13)))
          {
            v14 = -[NSMorphologyCustomPronoun reflexiveForm](self, "reflexiveForm");
            v15 = objc_msgSend(a3, "reflexiveForm");
            LOBYTE(v7) = v14 == (NSString *)v15 || -[NSString isEqual:](v14, "isEqual:", v15);
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (BOOL)isSupportedForLanguage:(NSString *)language
{
  if (-[NSString length](language, "length") < 2
    || -[NSString caseInsensitiveCompare:](-[NSString substringToIndex:](language, "substringToIndex:", 2), "caseInsensitiveCompare:", CFSTR("en")))
  {
    return 0;
  }
  if (-[NSString length](language, "length") == 2
    || -[NSString characterAtIndex:](language, "characterAtIndex:", 2) == 45)
  {
    return 1;
  }
  return -[NSString characterAtIndex:](language, "characterAtIndex:", 2) == 95;
}

+ (NSArray)requiredKeysForLanguage:(NSString *)language
{
  if (objc_msgSend(a1, "isSupportedForLanguage:", language))
    return (NSArray *)&unk_1E0FCCA90;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = -[NSString copy](-[NSMorphologyCustomPronoun subjectForm](self, "subjectForm"), "copy");
  v4[2] = -[NSString copy](-[NSMorphologyCustomPronoun objectForm](self, "objectForm"), "copy");
  v4[3] = -[NSString copy](-[NSMorphologyCustomPronoun possessiveForm](self, "possessiveForm"), "copy");
  v4[4] = -[NSString copy](-[NSMorphologyCustomPronoun possessiveAdjectiveForm](self, "possessiveAdjectiveForm"), "copy");
  v4[5] = -[NSString copy](-[NSMorphologyCustomPronoun reflexiveForm](self, "reflexiveForm"), "copy");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_subjectForm, CFSTR("subjectForm"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_objectForm, CFSTR("objectForm"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_possessiveForm, CFSTR("possessiveForm"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_possessiveAdjectiveForm, CFSTR("possessiveAdjectiveForm"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_reflexiveForm, CFSTR("reflexiveForm"));
}

- (NSMorphologyCustomPronoun)initWithCoder:(id)a3
{
  NSMorphologyCustomPronoun *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSMorphologyCustomPronoun;
  v4 = -[NSMorphologyCustomPronoun init](&v6, sel_init);
  if (v4)
  {
    v4->_subjectForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subjectForm")), "copy");
    v4->_objectForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectForm")), "copy");
    v4->_possessiveForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("possessiveForm")), "copy");
    v4->_possessiveAdjectiveForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("possessiveAdjectiveForm")), "copy");
    v4->_reflexiveForm = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reflexiveForm")), "copy");
  }
  return v4;
}

- (NSString)subjectForm
{
  return self->_subjectForm;
}

- (void)setSubjectForm:(NSString *)subjectForm
{
  objc_setProperty_nonatomic_copy(self, a2, subjectForm, 8);
}

- (NSString)objectForm
{
  return self->_objectForm;
}

- (void)setObjectForm:(NSString *)objectForm
{
  objc_setProperty_nonatomic_copy(self, a2, objectForm, 16);
}

- (NSString)possessiveForm
{
  return self->_possessiveForm;
}

- (void)setPossessiveForm:(NSString *)possessiveForm
{
  objc_setProperty_nonatomic_copy(self, a2, possessiveForm, 24);
}

- (NSString)possessiveAdjectiveForm
{
  return self->_possessiveAdjectiveForm;
}

- (void)setPossessiveAdjectiveForm:(NSString *)possessiveAdjectiveForm
{
  objc_setProperty_nonatomic_copy(self, a2, possessiveAdjectiveForm, 32);
}

- (NSString)reflexiveForm
{
  return self->_reflexiveForm;
}

- (void)setReflexiveForm:(NSString *)reflexiveForm
{
  objc_setProperty_nonatomic_copy(self, a2, reflexiveForm, 40);
}

- (BOOL)_autocompleteEnglishPronounFromSubjectForm
{
  return 0;
}

- (id)_initWithExternalRepresentationDictionary:(id)a3
{
  NSMorphologyCustomPronoun *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSMorphologyCustomPronoun;
  v4 = -[NSMorphologyCustomPronoun init](&v11, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("subjectForm"));
    if (v5 && (_NSIsNSString() & 1) == 0
      || (v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("objectForm"))) != 0
      && (_NSIsNSString() & 1) == 0
      || (v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("possessiveForm"))) != 0
      && (_NSIsNSString() & 1) == 0
      || (v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("possessiveAdjectiveForm"))) != 0
      && (_NSIsNSString() & 1) == 0
      || (v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("reflexiveForm"))) != 0
      && (_NSIsNSString() & 1) == 0)
    {

      return 0;
    }
    else
    {
      v4->_subjectForm = (NSString *)objc_msgSend(v5, "copy");
      v4->_objectForm = (NSString *)objc_msgSend(v6, "copy");
      v4->_possessiveForm = (NSString *)objc_msgSend(v7, "copy");
      v4->_possessiveAdjectiveForm = (NSString *)objc_msgSend(v8, "copy");
      v4->_reflexiveForm = (NSString *)objc_msgSend(v9, "copy");
    }
  }
  return v4;
}

- (NSDictionary)_externalRepresentationDictionary
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun subjectForm](self, "subjectForm"), CFSTR("subjectForm"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun objectForm](self, "objectForm"), CFSTR("objectForm"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun possessiveForm](self, "possessiveForm"), CFSTR("possessiveForm"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun possessiveAdjectiveForm](self, "possessiveAdjectiveForm"), CFSTR("possessiveAdjectiveForm"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSMorphologyCustomPronoun reflexiveForm](self, "reflexiveForm"), CFSTR("reflexiveForm"));
  return (NSDictionary *)v3;
}

- (id)_externalRepresentation
{
  return +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[NSMorphologyCustomPronoun _externalRepresentationDictionary](self, "_externalRepresentationDictionary"), 0, 0);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSMorphologyCustomPronoun;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ { subject: '%@', object: '%@', possessive: '%@', possessive adjective: '%@', reflexive: '%@' }"), -[NSMorphologyCustomPronoun description](&v3, sel_description), -[NSMorphologyCustomPronoun subjectForm](self, "subjectForm"), -[NSMorphologyCustomPronoun objectForm](self, "objectForm"), -[NSMorphologyCustomPronoun possessiveForm](self, "possessiveForm"), -[NSMorphologyCustomPronoun possessiveAdjectiveForm](self, "possessiveAdjectiveForm"), -[NSMorphologyCustomPronoun reflexiveForm](self, "reflexiveForm"));
}

+ (BOOL)_validateCustomPronounWithAccessor:(id)a3 forLanguage:(id)a4 error:(id *)a5
{
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL result;
  void *v16;
  uint64_t *v17;
  const __CFString **v18;
  NSError *v19;
  const __CFString *v20;
  uint64_t v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (+[NSMorphologyCustomPronoun isSupportedForLanguage:](NSMorphologyCustomPronoun, "isSupportedForLanguage:", a4))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = +[NSMorphologyCustomPronoun requiredKeysForLanguage:](NSMorphologyCustomPronoun, "requiredKeysForLanguage:", a4);
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        v14 = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, v13);
        if (!v14 || v14 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
          break;
        if (v10 == ++v12)
        {
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
          result = 1;
          if (v10)
            goto LABEL_4;
          return result;
        }
      }
      if (!a5)
        return 0;
      v20 = CFSTR("NSInvalidValue");
      v21 = v13;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v21;
      v18 = &v20;
      goto LABEL_16;
    }
    return 1;
  }
  else
  {
    if (a5)
    {
      v27 = CFSTR("NSInvalidValue");
      v28[0] = CFSTR("self");
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v28;
      v18 = &v27;
LABEL_16:
      v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 1024, objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v20, v21));
      result = 0;
      *a5 = v19;
      return result;
    }
    return 0;
  }
}

@end
