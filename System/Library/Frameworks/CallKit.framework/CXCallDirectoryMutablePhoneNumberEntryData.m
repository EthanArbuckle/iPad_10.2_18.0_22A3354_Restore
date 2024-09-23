@implementation CXCallDirectoryMutablePhoneNumberEntryData

- (CXCallDirectoryMutablePhoneNumberEntryData)initWithCapacity:(unint64_t)a3
{
  CXCallDirectoryMutablePhoneNumberEntryData *v4;
  uint64_t v5;
  NSMutableData *mutablePhoneNumberData;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CXCallDirectoryMutablePhoneNumberEntryData;
  v4 = -[CXCallDirectoryPhoneNumberEntryData init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 8 * a3);
    mutablePhoneNumberData = v4->_mutablePhoneNumberData;
    v4->_mutablePhoneNumberData = (NSMutableData *)v5;

    -[CXCallDirectoryPhoneNumberEntryData setPhoneNumberData:](v4, "setPhoneNumberData:", v4->_mutablePhoneNumberData);
  }
  return v4;
}

- (CXCallDirectoryMutablePhoneNumberEntryData)init
{
  return -[CXCallDirectoryMutablePhoneNumberEntryData initWithCapacity:](self, "initWithCapacity:", 0);
}

- (void)appendPhoneNumber:(int64_t)a3
{
  int64_t v3;

  v3 = a3;
  -[NSMutableData appendBytes:length:](self->_mutablePhoneNumberData, "appendBytes:length:", &v3, 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CXCallDirectoryPhoneNumberEntryData *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(CXCallDirectoryPhoneNumberEntryData);
  -[CXCallDirectoryMutablePhoneNumberEntryData mutablePhoneNumberData](self, "mutablePhoneNumberData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[CXCallDirectoryPhoneNumberEntryData setPhoneNumberData:](v5, "setPhoneNumberData:", v7);

  return v5;
}

- (NSMutableData)mutablePhoneNumberData
{
  return self->_mutablePhoneNumberData;
}

- (void)setMutablePhoneNumberData:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePhoneNumberData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePhoneNumberData, 0);
}

@end
