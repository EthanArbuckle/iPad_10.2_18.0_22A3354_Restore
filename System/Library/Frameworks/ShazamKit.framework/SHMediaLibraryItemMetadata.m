@implementation SHMediaLibraryItemMetadata

- (SHMediaLibraryItemMetadata)initWithEncodedSystemData:(id)a3
{
  id v5;
  SHMediaLibraryItemMetadata *v6;
  SHMediaLibraryItemMetadata *v7;
  id v9;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHMediaLibraryItemMetadata;
  v6 = -[SHMediaLibraryItemMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!-[SHMediaLibraryItemMetadata validEncodedSystemData:](v6, "validEncodedSystemData:", v5))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("You must provide a valid encoded data."), 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v9);
    }
    objc_storeStrong((id *)&v7->_encodedSystemData, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaLibraryItemMetadata *v5;
  void *v6;
  void *v7;
  SHMediaLibraryItemMetadata *v8;

  v5 = +[SHMediaLibraryItemMetadata allocWithZone:](SHMediaLibraryItemMetadata, "allocWithZone:");
  -[SHMediaLibraryItemMetadata encodedSystemData](self, "encodedSystemData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[SHMediaLibraryItemMetadata initWithEncodedSystemData:](v5, "initWithEncodedSystemData:", v7);

  return v8;
}

- (BOOL)validEncodedSystemData:(id)a3
{
  return objc_msgSend(a3, "length") != 0;
}

- (NSData)encodedSystemData
{
  return self->_encodedSystemData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedSystemData, 0);
}

@end
