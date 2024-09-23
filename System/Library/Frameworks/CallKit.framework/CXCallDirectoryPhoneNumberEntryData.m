@implementation CXCallDirectoryPhoneNumberEntryData

- (CXCallDirectoryPhoneNumberEntryData)init
{
  CXCallDirectoryPhoneNumberEntryData *v2;
  uint64_t v3;
  NSData *phoneNumberData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXCallDirectoryPhoneNumberEntryData;
  v2 = -[CXCallDirectoryPhoneNumberEntryData init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v3 = objc_claimAutoreleasedReturnValue();
    phoneNumberData = v2->_phoneNumberData;
    v2->_phoneNumberData = (NSData *)v3;

  }
  return v2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p count=%lu phoneNumberData.length=%lu>"), objc_opt_class(), self, -[CXCallDirectoryPhoneNumberEntryData count](self, "count"), -[NSData length](self->_phoneNumberData, "length"));
}

- (unint64_t)count
{
  return -[NSData length](self->_phoneNumberData, "length") >> 3;
}

- (int64_t)phoneNumberAtIndex:(unint64_t)a3
{
  int64_t v4;

  v4 = 0;
  -[NSData getBytes:range:](self->_phoneNumberData, "getBytes:range:", &v4, 8 * a3, 8);
  return v4;
}

- (const)phoneNumbers
{
  return (const int64_t *)-[NSData bytes](self->_phoneNumberData, "bytes");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryPhoneNumberEntryData)initWithCoder:(id)a3
{
  id v4;
  CXCallDirectoryPhoneNumberEntryData *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSData *phoneNumberData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXCallDirectoryPhoneNumberEntryData;
  v5 = -[CXCallDirectoryPhoneNumberEntryData init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_phoneNumberData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    phoneNumberData = v5->_phoneNumberData;
    v5->_phoneNumberData = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CXCallDirectoryPhoneNumberEntryData phoneNumberData](self, "phoneNumberData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_phoneNumberData);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSData)phoneNumberData
{
  return self->_phoneNumberData;
}

- (void)setPhoneNumberData:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberData, 0);
}

@end
