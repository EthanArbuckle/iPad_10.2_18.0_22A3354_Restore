@implementation DIIOMedia

- (DIIOMedia)initWithDevName:(id)a3 error:(id *)a4
{
  id v6;
  mach_port_t v7;
  id v8;
  const __CFDictionary *v9;
  uint64_t MatchingService;
  DIIOMedia *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = *MEMORY[0x24BDD8B18];
  objc_msgSend(v6, "lastPathComponent");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = IOBSDNameMatching(v7, 0, (const char *)objc_msgSend(v8, "UTF8String"));
  MatchingService = IOServiceGetMatchingService(v7, v9);

  if ((_DWORD)MatchingService)
  {
    v14.receiver = self;
    v14.super_class = (Class)DIIOMedia;
    self = -[DIIOObject initWithIOObject:](&v14, sel_initWithIOObject_, MatchingService);
    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to find IO media entry for %@"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v12, a4);
    v11 = (DIIOMedia *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (NSString)BSDName
{
  return (NSString *)-[DIIOObject copyPropertyWithClass:key:](self, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("BSD Name"));
}

- (id)copyBlockDeviceWithError:(id *)a3
{
  void *v3;
  DIBlockDevice *v4;

  -[DIIOObject ioObjectWithClassName:iterateParent:error:](self, "ioObjectWithClassName:iterateParent:error:", CFSTR("IOBlockStorageDevice"), 1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIIOObject initWithDIIOObject:]([DIBlockDevice alloc], "initWithDIIOObject:", v3);

  return v4;
}

@end
