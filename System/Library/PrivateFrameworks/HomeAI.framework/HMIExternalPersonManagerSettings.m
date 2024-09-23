@implementation HMIExternalPersonManagerSettings

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  _BOOL4 v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMIExternalPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"), v7 == objc_msgSend(v6, "isImportingFromPhotoLibraryEnabled")))
  {
    v9 = -[HMIExternalPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled");
    v8 = v9 ^ objc_msgSend(v6, "isSharingFaceClassificationsEnabled") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  _BOOL4 v3;

  v3 = -[HMIExternalPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled");
  return v3 ^ -[HMIExternalPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMIMutableExternalPersonManagerSettings *v4;

  v4 = -[HMIMutableExternalPersonManagerSettings init](+[HMIMutableExternalPersonManagerSettings allocWithZone:](HMIMutableExternalPersonManagerSettings, "allocWithZone:", a3), "init");
  -[HMIExternalPersonManagerSettings setImportingFromPhotoLibraryEnabled:](v4, "setImportingFromPhotoLibraryEnabled:", -[HMIExternalPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"));
  -[HMIExternalPersonManagerSettings setSharingFaceClassificationsEnabled:](v4, "setSharingFaceClassificationsEnabled:", -[HMIExternalPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMIExternalPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"), CFSTR("HMPMS.ifple"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMIExternalPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled"), CFSTR("HMPMS.sfce"));

}

- (HMIExternalPersonManagerSettings)initWithCoder:(id)a3
{
  id v4;
  HMIExternalPersonManagerSettings *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (HMIExternalPersonManagerSettings *)objc_alloc_init((Class)objc_opt_class());
  -[HMIExternalPersonManagerSettings setImportingFromPhotoLibraryEnabled:](v5, "setImportingFromPhotoLibraryEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMPMS.ifple")));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMPMS.sfce"));

  -[HMIExternalPersonManagerSettings setSharingFaceClassificationsEnabled:](v5, "setSharingFaceClassificationsEnabled:", v6);
  return v5;
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIExternalPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Importing From Photo Library Enabled"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIExternalPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Sharing Face Classifications Enabled"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (BOOL)isImportingFromPhotoLibraryEnabled
{
  return self->_importingFromPhotoLibraryEnabled;
}

- (void)setImportingFromPhotoLibraryEnabled:(BOOL)a3
{
  self->_importingFromPhotoLibraryEnabled = a3;
}

- (BOOL)isSharingFaceClassificationsEnabled
{
  return self->_sharingFaceClassificationsEnabled;
}

- (void)setSharingFaceClassificationsEnabled:(BOOL)a3
{
  self->_sharingFaceClassificationsEnabled = a3;
}

@end
