@implementation IKCSSMediaQueryExpression

- (void)setKey:(id)a3
{
  NSString *v4;
  NSString *key;

  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  key = self->_key;
  self->_key = v4;

}

- (void)setStringValue:(id)a3
{
  NSString *v4;
  NSString *stringValue;

  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  stringValue = self->_stringValue;
  self->_stringValue = v4;

}

- (BOOL)evaluate
{
  return 0;
}

- (id)expressionAsString
{
  NSString *v2;
  void *v3;
  NSString *key;
  void *v5;

  if (self->_type == 4)
  {
    v2 = self->_key;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    key = self->_key;
    -[IKCSSMediaQueryExpression valueAsString](self, "valueAsString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), key, v5);
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)valueAsString
{
  int64_t type;
  __CFString *v4;
  uint64_t v5;

  type = self->_type;
  switch(type)
  {
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f%@"), *(_QWORD *)&self->_doubleValue, self->_dimension);
LABEL_7:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&self->_doubleValue, v5);
      goto LABEL_7;
    case 1:
      return self->_stringValue;
  }
  v4 = &stru_1E9F50578;
  return v4;
}

- (id)description
{
  id result;
  uint64_t v3;
  uint64_t v4;

  switch(self->_type)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(type=string, key=%@, value=%@)"), self->_key, self->_stringValue, v4);
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(type=double, key=%@, value=%.3f)"), self->_key, *(_QWORD *)&self->_doubleValue, v4);
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(type=dimension, key=%@, value=%.3f%@)"), self->_key, *(_QWORD *)&self->_doubleValue, self->_dimension);
      goto LABEL_7;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(type=feature, key=%@)"), self->_key, v3, v4);
LABEL_7:
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = CFSTR("(UNKNOWN EXPRESSION TYPE)");
      break;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)dimension
{
  return self->_dimension;
}

- (void)setDimension:(id)a3
{
  objc_storeStrong((id *)&self->_dimension, a3);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_dimension, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
