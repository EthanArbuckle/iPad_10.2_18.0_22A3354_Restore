@implementation FHDatabaseInsertFieldValuePair

- (FHDatabaseInsertFieldValuePair)initWithQuoteWrapOption:(id)a3 fieldValue:(id)a4 quoteWrap:(BOOL)a5
{
  id v8;
  id v9;
  FHDatabaseInsertFieldValuePair *v10;
  void *v11;
  uint64_t v12;
  NSString *fieldName;
  void *v14;
  NSString *v15;
  uint64_t v16;
  NSString *fieldValue;
  uint64_t v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FHDatabaseInsertFieldValuePair;
  v10 = -[FHDatabaseInsertFieldValuePair init](&v20, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v11, "lowercaseString");
    v12 = objc_claimAutoreleasedReturnValue();
    fieldName = v10->_fieldName;
    v10->_fieldName = (NSString *)v12;

    if (a5)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = (NSString *)objc_msgSend(v9, "copy");
      objc_msgSend(v14, "stringWithFormat:", CFSTR("'%@'"), v15);
      v16 = objc_claimAutoreleasedReturnValue();
      fieldValue = v10->_fieldValue;
      v10->_fieldValue = (NSString *)v16;

    }
    else
    {
      v18 = objc_msgSend(v9, "copy");
      v15 = v10->_fieldValue;
      v10->_fieldValue = (NSString *)v18;
    }

  }
  return v10;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fieldName: '%@'; "), self->_fieldName);
  objc_msgSend(v3, "appendFormat:", CFSTR("fieldValue: '%@'; "), self->_fieldValue);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fieldValue
{
  return self->_fieldValue;
}

- (void)setFieldValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end
