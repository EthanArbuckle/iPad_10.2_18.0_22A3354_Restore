@implementation _LTTranslationSpan

- (_LTTranslationSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4
{
  return -[_LTTranslationSpan initWithIdentifier:range:shouldTranslate:metaInfoData:](self, "initWithIdentifier:range:shouldTranslate:metaInfoData:", a3, a4.location, a4.length, 1, 0);
}

- (_LTTranslationSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4 shouldTranslate:(BOOL)a5 metaInfoData:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  _LTTranslationSpan *v14;
  _LTTranslationSpan *v15;
  _LTTranslationSpan *v16;
  objc_super v18;

  length = a4.length;
  location = a4.location;
  v12 = a3;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_LTTranslationSpan;
  v14 = -[_LTTranslationSpan init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    v15->_range.location = location;
    v15->_range.length = length;
    v15->_shouldTranslate = a5;
    objc_storeStrong((id *)&v15->_metaInfoData, a6);
    v16 = v15;
  }

  return v15;
}

- (_LTTranslationSpan)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationSpan *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  NSUInteger v10;
  uint64_t v11;
  NSData *metaInfoData;
  _LTTranslationSpan *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTTranslationSpan;
  v5 = -[_LTTranslationSpan init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("range"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v5->_range.location = objc_msgSend(v8, "rangeValue");
      v5->_range.length = v10;
    }
    v5->_shouldTranslate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldTranslate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaInfoData"));
    v11 = objc_claimAutoreleasedReturnValue();
    metaInfoData = v5->_metaInfoData;
    v5->_metaInfoData = (NSData *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  id v6;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_range.location, self->_range.length);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("range"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldTranslate, CFSTR("shouldTranslate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metaInfoData, CFSTR("metaInfoData"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _LTTranslationSpan *v4;
  _LTTranslationSpan *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v13;

  v4 = (_LTTranslationSpan *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_LTTranslationSpan identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTTranslationSpan identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        v8 = -[_LTTranslationSpan range](self, "range");
        v10 = v9;
        v13 = v8 == -[_LTTranslationSpan range](v5, "range") && v10 == v11;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)shouldTranslate
{
  return self->_shouldTranslate;
}

- (void)setShouldTranslate:(BOOL)a3
{
  self->_shouldTranslate = a3;
}

- (NSData)metaInfoData
{
  return self->_metaInfoData;
}

- (void)setMetaInfoData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaInfoData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
