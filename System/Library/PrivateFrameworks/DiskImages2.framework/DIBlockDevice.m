@implementation DIBlockDevice

- (id)copyIOMediaWithError:(id *)a3
{
  void *v3;
  DIIOMedia *v4;

  -[DIIOObject ioObjectWithClassName:iterateParent:error:](self, "ioObjectWithClassName:iterateParent:error:", CFSTR("IOMedia"), 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIOObject initWithDIIOObject:]([DIIOMedia alloc], "initWithDIIOObject:", v3);

  return v4;
}

- (BOOL)diskImageDevice
{
  return IOObjectConformsTo(-[DIIOObject ioObj](self, "ioObj"), "AppleDiskImageDevice") != 0;
}

- (NSString)mediumType
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[DIIOObject copyPropertyWithClass:key:](self, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("Device Characteristics"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Medium Type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (id)copyRootBlockDeviceWithError:(id *)a3
{
  id v5;
  DIBlockDevice *v6;
  uint64_t v7;
  void *v8;

  v5 = -[DIIOObject copyPropertyWithClass:key:](self, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("RootDeviceEntryID"));
  v6 = [DIBlockDevice alloc];
  if (v5)
    v7 = -[DIIOObject initWithRegistryEntryID:error:](v6, "initWithRegistryEntryID:error:", objc_msgSend(v5, "unsignedLongLongValue"), a3);
  else
    v7 = -[DIIOObject initWithDIIOObject:](v6, "initWithDIIOObject:", self);
  v8 = (void *)v7;

  return v8;
}

+ (id)copyUnmatchedDiskImageWithRegEntryID:(unint64_t)a3 error:(id *)a4
{
  DIIOObject *v6;
  id v7;
  DIBlockDevice *v8;
  DIBlockDevice *v9;
  void *v10;

  v6 = -[DIIOObject initWithClassName:error:]([DIIOObject alloc], "initWithClassName:error:", CFSTR("AppleDiskImagesController"), a4);
  v7 = -[DIIOObject newIteratorWithOptions:error:](v6, "newIteratorWithOptions:error:", 0, a4);
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      v9 = -[DIIOObject initWithIteratorNext:]([DIBlockDevice alloc], "initWithIteratorNext:", v7);

      if (!v9)
        break;
      v8 = v9;
      if (-[DIIOObject registryEntryIDWithError:](v9, "registryEntryIDWithError:", 0) == a3)
        goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find disk image with reg entry ID 0x%llx"), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v10, a4);
    v9 = (DIBlockDevice *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
LABEL_8:

  return v9;
}

@end
