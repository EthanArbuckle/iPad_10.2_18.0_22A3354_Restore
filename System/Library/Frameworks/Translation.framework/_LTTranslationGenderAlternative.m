@implementation _LTTranslationGenderAlternative

+ (id)genderAlternativesFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("group"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("spans"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = (void *)MEMORY[0x24BDBD1A8];
  if (v6 && v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68___LTTranslationGenderAlternative_genderAlternativesFromDictionary___block_invoke;
    v12[3] = &unk_250694318;
    v13 = v6;
    objc_msgSend(v9, "_ltCompactMap:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)genderAlternativeFromDictionary:(id)a3 withGroup:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _LTTranslationGenderAlternative *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("start"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("end"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("projection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("start"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("end"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("default_gender"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (v7 && v8 && v10 && v11)
  {
    v13 = objc_alloc_init(_LTTranslationGenderAlternative);
    -[_LTTranslationGenderAlternative setGroup:](v13, "setGroup:", v5);
    -[_LTTranslationGenderAlternative setSourceRange:](v13, "setSourceRange:", (int)objc_msgSend(v7, "intValue"), (int)(objc_msgSend(v8, "intValue") - objc_msgSend(v7, "intValue") + 1));
    -[_LTTranslationGenderAlternative setTargetRange:](v13, "setTargetRange:", (int)objc_msgSend(v10, "intValue"), (int)(objc_msgSend(v11, "intValue") - objc_msgSend(v10, "intValue") + 1));
    -[_LTTranslationGenderAlternative setDefaultGender:](v13, "setDefaultGender:", v12);
  }

  return v13;
}

- (_LTTranslationGenderAlternative)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationGenderAlternative *v5;
  uint64_t v6;
  NSNumber *group;
  void *v8;
  NSUInteger v9;
  void *v10;
  NSUInteger v11;
  uint64_t v12;
  NSString *defaultGender;
  _LTTranslationGenderAlternative *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTTranslationGenderAlternative;
  v5 = -[_LTTranslationGenderAlternative init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("group"));
    v6 = objc_claimAutoreleasedReturnValue();
    group = v5->_group;
    v5->_group = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceRange.location = objc_msgSend(v8, "rangeValue");
    v5->_sourceRange.length = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetRange"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetRange.location = objc_msgSend(v10, "rangeValue");
    v5->_targetRange.length = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultGender"));
    v12 = objc_claimAutoreleasedReturnValue();
    defaultGender = v5->_defaultGender;
    v5->_defaultGender = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *group;
  id v5;
  void *v6;
  id v7;

  group = self->_group;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", group, CFSTR("group"));
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_sourceRange.location, self->_sourceRange.length);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("sourceRange"));
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_targetRange.location, self->_targetRange.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("targetRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultGender, CFSTR("defaultGender"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_NSRange)sourceRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_sourceRange.length;
  location = self->_sourceRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSourceRange:(_NSRange)a3
{
  self->_sourceRange = a3;
}

- (_NSRange)targetRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_targetRange.length;
  location = self->_targetRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTargetRange:(_NSRange)a3
{
  self->_targetRange = a3;
}

- (NSString)defaultGender
{
  return self->_defaultGender;
}

- (void)setDefaultGender:(id)a3
{
  objc_storeStrong((id *)&self->_defaultGender, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGender, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
