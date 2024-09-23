@implementation OSLogMessageComponent

- (OSLogMessageComponent)initWithDecomposedMessage:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  OSLogMessageComponent *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  OSLogMessageComponent *v17;
  uint64_t v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)OSLogMessageComponent;
  v7 = -[OSLogMessageComponent init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "literalPrefixAtIndex:", a4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = &stru_1E977B6D8;
    -[OSLogMessageComponent setFormatSubstring:](v7, "setFormatSubstring:", v10);

    objc_msgSend(v6, "placeholderAtIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rawString");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = &stru_1E977B6D8;
    -[OSLogMessageComponent setPlaceholder:](v7, "setPlaceholder:", v14);

    if (v11)
    {
      objc_msgSend(v6, "argumentAtIndex:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "availability"))
      {
        v19 = objc_msgSend(v16, "category");
        switch(v19)
        {
          case 3:
            -[OSLogMessageComponent fillWithData:](v7, "fillWithData:", v16);
            break;
          case 2:
            -[OSLogMessageComponent fillWithString:](v7, "fillWithString:", v16);
            break;
          case 1:
            -[OSLogMessageComponent fillWithScalar:](v7, "fillWithScalar:", v16);
            break;
        }
      }

    }
    v17 = v7;

  }
  return v7;
}

- (void)fillWithScalar:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "scalarCategory");
  if (v4 == 3)
  {
    self->_argumentCategory = 2;
    objc_msgSend(v8, "doubleValue");
    v5 = v8;
    self->_argumentDoubleValue = v6;
  }
  else
  {
    if (v4 == 2)
    {
      self->_argumentCategory = 3;
      self->_argumentInt64Value = objc_msgSend(v8, "int64Value");
    }
    else if (v4 == 1)
    {
      self->_argumentCategory = 5;
      self->_argumentUInt64Value = objc_msgSend(v8, "unsignedInt64Value");
    }
    else
    {
      self->_argumentCategory = 0;
    }
    v5 = v8;
  }
  objc_msgSend(v5, "objectRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogMessageComponent setArgumentNumberValue:](self, "setArgumentNumberValue:", v7);

}

- (void)fillWithString:(id)a3
{
  id v4;

  self->_argumentCategory = 4;
  objc_msgSend(a3, "objectRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OSLogMessageComponent setArgumentStringValue:](self, "setArgumentStringValue:", v4);

}

- (void)fillWithData:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_argumentCategory = 4;
    -[OSLogMessageComponent setArgumentStringValue:](self, "setArgumentStringValue:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_argumentCategory = 1;
      -[OSLogMessageComponent setArgumentDataValue:](self, "setArgumentDataValue:", v4);
    }
    else
    {
      self->_argumentCategory = 0;
    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a3;
  -[OSLogMessageComponent formatSubstring](self, "formatSubstring");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("formatSubstring"));

  -[OSLogMessageComponent placeholder](self, "placeholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("placeholder"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[OSLogMessageComponent argumentCategory](self, "argumentCategory"), CFSTR("argumentCategory"));
  switch(-[OSLogMessageComponent argumentCategory](self, "argumentCategory"))
  {
    case OSLogMessageComponentArgumentCategoryData:
      -[OSLogMessageComponent argumentDataValue](self, "argumentDataValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("argumentDataValue");
      goto LABEL_7;
    case OSLogMessageComponentArgumentCategoryDouble:
      -[OSLogMessageComponent argumentDoubleValue](self, "argumentDoubleValue");
      objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("argumentDoubleValue"));
      break;
    case OSLogMessageComponentArgumentCategoryInt64:
      objc_msgSend(v8, "encodeInt64:forKey:", -[OSLogMessageComponent argumentInt64Value](self, "argumentInt64Value"), CFSTR("argumentInt64Value"));
      break;
    case OSLogMessageComponentArgumentCategoryString:
      -[OSLogMessageComponent argumentStringValue](self, "argumentStringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("argumentStringValue");
      goto LABEL_7;
    case OSLogMessageComponentArgumentCategoryUInt64:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSLogMessageComponent argumentUInt64Value](self, "argumentUInt64Value"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("argumentUInt64Value");
LABEL_7:
      objc_msgSend(v8, "encodeObject:forKey:", v6, v7);

      break;
    default:
      break;
  }

}

- (OSLogMessageComponent)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *formatSubstring;
  NSString *v7;
  NSString *placeholder;
  int64_t v9;
  NSData *v10;
  void *argumentDataValue;
  double v12;
  NSNumber *v13;
  int64_t v14;
  NSString *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatSubstring"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  formatSubstring = self->_formatSubstring;
  self->_formatSubstring = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholder"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  placeholder = self->_placeholder;
  self->_placeholder = v7;

  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("argumentCategory"));
  self->_argumentCategory = v9;
  switch(v9)
  {
    case 1:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("argumentDataValue"));
      v10 = (NSData *)objc_claimAutoreleasedReturnValue();
      argumentDataValue = self->_argumentDataValue;
      self->_argumentDataValue = v10;
      goto LABEL_8;
    case 2:
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("argumentDoubleValue"));
      self->_argumentDoubleValue = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      v14 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("argumentInt64Value"));
      self->_argumentInt64Value = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("argumentStringValue"));
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      argumentDataValue = self->_argumentStringValue;
      self->_argumentStringValue = v15;
      goto LABEL_8;
    case 5:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("argumentUInt64Value"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_argumentUInt64Value = objc_msgSend(v16, "unsignedLongLongValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_argumentUInt64Value);
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      argumentDataValue = self->_argumentNumberValue;
      self->_argumentNumberValue = v13;
LABEL_8:

      break;
    default:
      break;
  }

  return self;
}

- (NSString)formatSubstring
{
  return self->_formatSubstring;
}

- (void)setFormatSubstring:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OSLogMessageComponentArgumentCategory)argumentCategory
{
  return self->_argumentCategory;
}

- (NSData)argumentDataValue
{
  return self->_argumentDataValue;
}

- (void)setArgumentDataValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)argumentDoubleValue
{
  return self->_argumentDoubleValue;
}

- (int64_t)argumentInt64Value
{
  return self->_argumentInt64Value;
}

- (NSNumber)argumentNumberValue
{
  return self->_argumentNumberValue;
}

- (void)setArgumentNumberValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)argumentStringValue
{
  return self->_argumentStringValue;
}

- (void)setArgumentStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (uint64_t)argumentUInt64Value
{
  return self->_argumentUInt64Value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argumentStringValue, 0);
  objc_storeStrong((id *)&self->_argumentNumberValue, 0);
  objc_storeStrong((id *)&self->_argumentDataValue, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_formatSubstring, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
