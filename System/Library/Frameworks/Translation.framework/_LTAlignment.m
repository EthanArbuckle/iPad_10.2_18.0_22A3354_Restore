@implementation _LTAlignment

- (id)jsonRepresentation
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("identifier");
  -[_LTAlignment identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("<no value>");
  if (v3)
    v5 = (const __CFString *)v3;
  v19[0] = v5;
  v18[1] = CFSTR("text");
  -[_LTAlignment text](self, "text");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_250695360;
  if (v6)
    v8 = (const __CFString *)v6;
  v19[1] = v8;
  v18[2] = CFSTR("targetRange");
  v16[0] = CFSTR("start");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_LTAlignment targetRange](self, "targetRange"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("length");
  v17[0] = v9;
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[_LTAlignment targetRange](self, "targetRange");
  objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_sourceRange.location, self->_sourceRange.length);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("sourceRange"));
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_targetRange.location, self->_targetRange.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("targetRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldTranslate, CFSTR("shouldTranslate"));

}

- (_LTAlignment)initWithCoder:(id)a3
{
  id v4;
  _LTAlignment *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  NSUInteger v9;
  void *v10;
  NSUInteger v11;
  uint64_t v12;
  NSString *text;
  _LTAlignment *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTAlignment;
  v5 = -[_LTAlignment init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceRange.location = objc_msgSend(v8, "rangeValue");
    v5->_sourceRange.length = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetRange"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetRange.location = objc_msgSend(v10, "rangeValue");
    v5->_targetRange.length = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v12 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v12;

    v5->_shouldTranslate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldTranslate"));
    v14 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _LTAlignment *v4;
  _LTAlignment *v5;
  NSString *identifier;
  void *v7;
  NSString *text;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  _BOOL4 shouldTranslate;

  v4 = (_LTAlignment *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      -[_LTAlignment identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](identifier, "isEqualToString:", v7))
      {
        text = self->_text;
        -[_LTAlignment text](v5, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](text, "isEqualToString:", v9))
        {
          v11 = 0;
          if (self->_sourceRange.location == -[_LTAlignment sourceRange](v5, "sourceRange")
            && self->_sourceRange.length == v10)
          {
            v11 = 0;
            if (self->_targetRange.location == -[_LTAlignment targetRange](v5, "targetRange")
              && self->_targetRange.length == v12)
            {
              shouldTranslate = self->_shouldTranslate;
              v11 = shouldTranslate == -[_LTAlignment shouldTranslate](v5, "shouldTranslate");
            }
          }
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldTranslate
{
  return self->_shouldTranslate;
}

- (void)setShouldTranslate:(BOOL)a3
{
  self->_shouldTranslate = a3;
}

- (NSDictionary)sourceAttributes
{
  return self->_sourceAttributes;
}

- (void)setSourceAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
