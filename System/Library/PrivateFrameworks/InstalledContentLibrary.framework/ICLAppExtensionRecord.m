@implementation ICLAppExtensionRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLAppExtensionRecord)initWithCoder:(id)a3
{
  id v4;
  ICLAppExtensionRecord *v5;
  uint64_t v6;
  NSString *extensionOwnerBundleID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLAppExtensionRecord;
  v5 = -[ICLBundleRecord initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionOwnerBundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    extensionOwnerBundleID = v5->_extensionOwnerBundleID;
    v5->_extensionOwnerBundleID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICLAppExtensionRecord;
  v4 = a3;
  -[ICLBundleRecord encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ICLAppExtensionRecord extensionOwnerBundleID](self, "extensionOwnerBundleID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("extensionOwnerBundleID"));

}

- (ICLAppExtensionRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4;
  ICLAppExtensionRecord *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLAppExtensionRecord;
  v5 = -[ICLBundleRecord initWithLegacyRecordDictionary:](&v10, sel_initWithLegacyRecordDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PluginOwnerBundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    -[ICLAppExtensionRecord setExtensionOwnerBundleID:](v5, "setExtensionOwnerBundleID:", v8);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICLAppExtensionRecord;
  v5 = -[ICLBundleRecord copyWithZone:](&v9, sel_copyWithZone_);
  -[ICLAppExtensionRecord extensionOwnerBundleID](self, "extensionOwnerBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setExtensionOwnerBundleID:", v7);

  return v5;
}

- (id)legacyRecordDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)ICLAppExtensionRecord;
  -[ICLBundleRecord legacyRecordDictionary](&v8, sel_legacyRecordDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("PluginKitPlugin"), CFSTR("ApplicationType"));
  -[ICLAppExtensionRecord extensionOwnerBundleID](self, "extensionOwnerBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PluginOwnerBundleID"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ICLAppExtensionRecord *v4;
  ICLAppExtensionRecord *v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = (ICLAppExtensionRecord *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)ICLAppExtensionRecord,
          -[ICLBundleRecord isEqual:](&v10, sel_isEqual_, v4)))
    {
      v5 = v4;
      -[ICLAppExtensionRecord extensionOwnerBundleID](self, "extensionOwnerBundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLAppExtensionRecord extensionOwnerBundleID](v5, "extensionOwnerBundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (!v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
        MOLogWrite();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICLAppExtensionRecord;
  v3 = -[ICLBundleRecord hash](&v7, sel_hash);
  -[ICLAppExtensionRecord extensionOwnerBundleID](self, "extensionOwnerBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)extensionOwnerBundleID
{
  return self->_extensionOwnerBundleID;
}

- (void)setExtensionOwnerBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionOwnerBundleID, 0);
}

@end
