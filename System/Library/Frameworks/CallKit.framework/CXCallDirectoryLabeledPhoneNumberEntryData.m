@implementation CXCallDirectoryLabeledPhoneNumberEntryData

- (CXCallDirectoryLabeledPhoneNumberEntryData)init
{
  CXCallDirectoryLabeledPhoneNumberEntryData *v2;
  uint64_t v3;
  NSData *phoneNumberData;
  uint64_t v5;
  NSData *labelData;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXCallDirectoryLabeledPhoneNumberEntryData;
  v2 = -[CXCallDirectoryLabeledPhoneNumberEntryData init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v3 = objc_claimAutoreleasedReturnValue();
    phoneNumberData = v2->_phoneNumberData;
    v2->_phoneNumberData = (NSData *)v3;

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = objc_claimAutoreleasedReturnValue();
    labelData = v2->_labelData;
    v2->_labelData = (NSData *)v5;

  }
  return v2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p count=%lu phoneNumberData.length=%lu labelData.length=%lu>"), objc_opt_class(), self, -[CXCallDirectoryLabeledPhoneNumberEntryData count](self, "count"), -[NSData length](self->_phoneNumberData, "length"), -[NSData length](self->_labelData, "length"));
}

- (unint64_t)count
{
  return -[NSData length](self->_phoneNumberData, "length") >> 4;
}

- (int64_t)phoneNumberAtIndex:(unint64_t)a3
{
  unint64_t v4;
  NSObject *v6;
  _QWORD v7[2];

  v7[0] = 0;
  v7[1] = 0;
  v4 = 16 * a3;
  if (16 * a3 + 16 > -[NSData length](self->_phoneNumberData, "length"))
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryLabeledPhoneNumberEntryData phoneNumberAtIndex:].cold.1();

    return 0;
  }
  else
  {
    -[NSData getBytes:range:](self->_phoneNumberData, "getBytes:range:", v7, v4, 16);
    return v7[0];
  }
}

- (const)utf8LabelAtIndex:(unint64_t)a3 length:(unsigned __int16 *)a4
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  NSObject *v13;
  unsigned __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0;
  v6 = 16 * a3;
  if (16 * a3 + 16 > -[NSData length](self->_phoneNumberData, "length"))
  {
    CXDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CXCallDirectoryLabeledPhoneNumberEntryData utf8LabelAtIndex:length:].cold.1();
  }
  else
  {
    -[NSData getBytes:range:](self->_phoneNumberData, "getBytes:range:", &v15, v6, 16);
    v14 = 0;
    v7 = v16;
    v8 = v16 + 2;
    if (v8 > -[NSData length](self->_labelData, "length"))
    {
      CXDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CXCallDirectoryLabeledPhoneNumberEntryData utf8LabelAtIndex:length:].cold.2();
    }
    else
    {
      -[NSData getBytes:range:](self->_labelData, "getBytes:range:", &v14, v7, 2);
      v9 = v14;
      *a4 = v14;
      v10 = v9 + v16 + 2;
      if (v10 <= -[NSData length](self->_labelData, "length"))
      {
        v11 = -[NSData bytes](self->_labelData, "bytes");
        return &v11[v16 + 2];
      }
      CXDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CXCallDirectoryLabeledPhoneNumberEntryData utf8LabelAtIndex:length:].cold.3();
    }
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryLabeledPhoneNumberEntryData)initWithCoder:(id)a3
{
  id v4;
  CXCallDirectoryLabeledPhoneNumberEntryData *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSData *phoneNumberData;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSData *labelData;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CXCallDirectoryLabeledPhoneNumberEntryData;
  v5 = -[CXCallDirectoryLabeledPhoneNumberEntryData init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_phoneNumberData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    phoneNumberData = v5->_phoneNumberData;
    v5->_phoneNumberData = (NSData *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_labelData);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    labelData = v5->_labelData;
    v5->_labelData = (NSData *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CXCallDirectoryLabeledPhoneNumberEntryData phoneNumberData](self, "phoneNumberData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_phoneNumberData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXCallDirectoryLabeledPhoneNumberEntryData labelData](self, "labelData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_labelData);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (NSData)phoneNumberData
{
  return self->_phoneNumberData;
}

- (void)setPhoneNumberData:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberData, a3);
}

- (NSData)labelData
{
  return self->_labelData;
}

- (void)setLabelData:(id)a3
{
  objc_storeStrong((id *)&self->_labelData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelData, 0);
  objc_storeStrong((id *)&self->_phoneNumberData, 0);
}

- (void)phoneNumberAtIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A402D000, v0, v1, "Assertion failure: %s in %s:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)utf8LabelAtIndex:length:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A402D000, v0, v1, "Assertion failure: %s in %s:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)utf8LabelAtIndex:length:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A402D000, v0, v1, "Assertion failure: %s in %s:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)utf8LabelAtIndex:length:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A402D000, v0, v1, "Assertion failure: %s in %s:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
