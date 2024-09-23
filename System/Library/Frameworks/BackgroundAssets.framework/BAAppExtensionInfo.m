@implementation BAAppExtensionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAAppExtensionInfo)init
{
  BAAppExtensionInfo *result;
  int v3;
  const char *v4;

  result = (BAAppExtensionInfo *)os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BAAppExtensionInfo cannot be constructed using -init.";
    _os_log_fault_impl(&dword_21ABD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BAAppExtensionInfo cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BAAppExtensionInfo)initWithCoder:(id)a3
{
  id v4;
  BAAppExtensionInfo *v5;
  void *v6;
  uint64_t v7;
  NSNumber *restrictedDownloadSizeRemaining;
  void *v9;
  uint64_t v10;
  NSNumber *restrictedEssentialDownloadSizeRemaining;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BAAppExtensionInfo;
  v5 = -[BAAppExtensionInfo init](&v13, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("restrictedDownloadSizeRemaining")))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("restrictedDownloadSizeRemaining"));
      v7 = objc_claimAutoreleasedReturnValue();
      restrictedDownloadSizeRemaining = v5->_restrictedDownloadSizeRemaining;
      v5->_restrictedDownloadSizeRemaining = (NSNumber *)v7;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("restrictedEssentialDownloadSizeRemaining")))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("restrictedEssentialDownloadSizeRemaining"));
      v10 = objc_claimAutoreleasedReturnValue();
      restrictedEssentialDownloadSizeRemaining = v5->_restrictedEssentialDownloadSizeRemaining;
      v5->_restrictedEssentialDownloadSizeRemaining = (NSNumber *)v10;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[BAAppExtensionInfo restrictedDownloadSizeRemaining](self, "restrictedDownloadSizeRemaining");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BAAppExtensionInfo restrictedDownloadSizeRemaining](self, "restrictedDownloadSizeRemaining");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("restrictedDownloadSizeRemaining"));

  }
  -[BAAppExtensionInfo restrictedEssentialDownloadSizeRemaining](self, "restrictedEssentialDownloadSizeRemaining");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BAAppExtensionInfo restrictedEssentialDownloadSizeRemaining](self, "restrictedEssentialDownloadSizeRemaining");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("restrictedEssentialDownloadSizeRemaining"));

  }
}

- (NSNumber)restrictedDownloadSizeRemaining
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)restrictedEssentialDownloadSizeRemaining
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedEssentialDownloadSizeRemaining, 0);
  objc_storeStrong((id *)&self->_restrictedDownloadSizeRemaining, 0);
}

@end
