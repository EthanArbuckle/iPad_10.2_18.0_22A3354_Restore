@implementation DKReporterAttributes

- (void)_validateAndAddDomain:(id)a3 withInfo:(id)a4 toManifest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v19 = a5;
  objc_msgSend(v8, "alwaysGetKey:ofType:", CFSTR("DKReporterManifestVersion"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alwaysGetKey:ofType:", CFSTR("DKReporterManifestResources"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  +[DKComponentIdentity componentIdentityWithDomain:version:resources:](DKComponentIdentity, "componentIdentityWithDomain:version:resources:", v7, v9, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v19, "addObject:", v18);

}

- (void)_validateAndAddExtensionManifest:(id)a3 toManifest:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "alwaysGetKey:ofType:", v12, objc_opt_class());
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[DKReporterAttributes _validateAndAddDomain:withInfo:toManifest:](self, "_validateAndAddDomain:withInfo:toManifest:", v12, v13, v7);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (DKReporterAttributes)initWithExtension:(id)a3
{
  id v5;
  DKReporterAttributes *v6;
  uint64_t v7;
  NSUUID *uuid;
  void *v9;
  uint64_t v10;
  NSString *version;
  void *v12;
  uint64_t v13;
  NSString *name;
  void *v15;
  uint64_t v16;
  NSString *bundleIdentifier;
  uint64_t v18;
  void *v19;
  void *v20;
  NSSet *manifest;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DKReporterAttributes;
  v6 = -[DKReporterAttributes init](&v23, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_extension, a3);
    objc_msgSend(v5, "infoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1E0]);
    v10 = objc_claimAutoreleasedReturnValue();
    version = v6->_version;
    v6->_version = (NSString *)v10;

    objc_msgSend(v5, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DKReporterName"));
    v13 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v13;

    objc_msgSend(v5, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DKBundleIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v16;

    if (!v6->_bundleIdentifier)
      objc_storeStrong((id *)&v6->_bundleIdentifier, CFSTR("Default"));
    v6->_headless = 1;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "alwaysGetKey:ofType:", CFSTR("DKReporterManifest"), objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[DKReporterAttributes _validateAndAddExtensionManifest:toManifest:](v6, "_validateAndAddExtensionManifest:toManifest:", v20, v18);
    manifest = v6->_manifest;
    v6->_manifest = (NSSet *)v18;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSSet copyWithZone:](self->_manifest, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  objc_storeStrong((id *)(v5 + 16), self->_extension);
  v12 = -[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  return (id)v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DKReporterAttributes uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToReportGeneratorAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DKReporterAttributes uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  DKReporterAttributes *v4;
  BOOL v5;

  v4 = (DKReporterAttributes *)a3;
  v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[DKReporterAttributes isEqualToReportGeneratorAttributes:](self, "isEqualToReportGeneratorAttributes:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKReporterAttributes name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKReporterAttributes version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKReporterAttributes uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@, version: %@, uuid: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (BOOL)isHeadless
{
  return self->_headless;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSSet)manifest
{
  return self->_manifest;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
