@implementation NPKPassSyncStateItem

- (NPKPassSyncStateItem)initWithProtoSyncStateItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NPKPassSyncStateItem *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  NPKPassSyncStateItem *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "passTypeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serialNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self;
    if (objc_msgSend(v5, "hasSequenceCounter"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v5, "sequenceCounter"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v5, "manifestHash");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "manifestEntrys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v15, "fileHash");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "relativePath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v16, v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    v7 = -[NPKPassSyncStateItem initWithPassTypeIdentifier:serialNumber:sequenceCounter:manifestHash:manifest:](v20, "initWithPassTypeIdentifier:serialNumber:sequenceCounter:manifestHash:manifest:", v21, v19, v6, v8, v9);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (id)protoSyncStateItem
{
  NPKProtoPassSyncStateItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NPKProtoPassSyncStateItem *v10;
  _QWORD v12[4];
  NPKProtoPassSyncStateItem *v13;

  v3 = objc_alloc_init(NPKProtoPassSyncStateItem);
  -[NPKPassSyncStateItem passTypeIdentifier](self, "passTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateItem setPassTypeIdentifier:](v3, "setPassTypeIdentifier:", v4);

  -[NPKPassSyncStateItem serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateItem setSerialNumber:](v3, "setSerialNumber:", v5);

  -[NPKPassSyncStateItem sequenceCounter](self, "sequenceCounter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NPKPassSyncStateItem sequenceCounter](self, "sequenceCounter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoPassSyncStateItem setSequenceCounter:](v3, "setSequenceCounter:", objc_msgSend(v7, "unsignedIntValue"));

    -[NPKProtoPassSyncStateItem setHasSequenceCounter:](v3, "setHasSequenceCounter:", 1);
  }
  -[NPKPassSyncStateItem manifestHash](self, "manifestHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateItem setManifestHash:](v3, "setManifestHash:", v8);

  -[NPKPassSyncStateItem manifest](self, "manifest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__NPKPassSyncStateItem_ProtobufSupport__protoSyncStateItem__block_invoke;
  v12[3] = &unk_24CFEC0B0;
  v10 = v3;
  v13 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  return v10;
}

void __59__NPKPassSyncStateItem_ProtobufSupport__protoSyncStateItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NPKProtoPassSyncStateManifestEntry *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(NPKProtoPassSyncStateManifestEntry);
  -[NPKProtoPassSyncStateManifestEntry setRelativePath:](v7, "setRelativePath:", v6);

  -[NPKProtoPassSyncStateManifestEntry setFileHash:](v7, "setFileHash:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addManifestEntry:", v7);

}

- (NPKPassSyncStateItem)initWithPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NPKPassSyncStateItem *v10;

  v4 = a3;
  objc_msgSend(v4, "passTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sequenceCounter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NPKManifestHashForPass(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NPKManifestForPass(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NPKPassSyncStateItem initWithPassTypeIdentifier:serialNumber:sequenceCounter:manifestHash:manifest:](self, "initWithPassTypeIdentifier:serialNumber:sequenceCounter:manifestHash:manifest:", v5, v6, v7, v8, v9);
  return v10;
}

- (NPKPassSyncStateItem)initWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 sequenceCounter:(id)a5 manifestHash:(id)a6 manifest:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NPKPassSyncStateItem *v17;
  NPKPassSyncStateItem *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NPKPassSyncStateItem;
  v17 = -[NPKPassSyncStateItem init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_passTypeIdentifier, a3);
    objc_storeStrong((id *)&v18->_serialNumber, a4);
    objc_storeStrong((id *)&v18->_sequenceCounter, a5);
    objc_storeStrong((id *)&v18->_manifestHash, a6);
    objc_storeStrong((id *)&v18->_manifest, a7);
  }

  return v18;
}

- (NSString)uniqueID
{
  return (NSString *)PKGeneratePassUniqueID();
}

- (id)description
{
  NSNumber *sequenceCounter;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  sequenceCounter = self->_sequenceCounter;
  if (sequenceCounter)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", sequence counter %@"), sequenceCounter);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24CFF06D8;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = objc_opt_class();
  -[NPKPassSyncStateItem uniqueID](self, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p unique ID %@ manifest hash %@ manifest %@ (pass type identifier %@, serial number %@%@>"), v6, self, v7, self->_manifestHash, self->_manifest, self->_passTypeIdentifier, self->_serialNumber, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)shortDescription
{
  NSNumber *sequenceCounter;
  __CFString *v4;
  void *v5;
  void *v6;
  NSString *passTypeIdentifier;
  NSString *serialNumber;
  void *v9;
  void *v10;

  sequenceCounter = self->_sequenceCounter;
  if (sequenceCounter)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" seq %@"), sequenceCounter);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24CFF06D8;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPassSyncStateItem uniqueID](self, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  passTypeIdentifier = self->_passTypeIdentifier;
  serialNumber = self->_serialNumber;
  -[NSData hexEncoding](self->_manifestHash, "hexEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@ %@ (hash %@%@)"), v6, passTypeIdentifier, serialNumber, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NPKPassSyncStateItem *v4;
  NPKPassSyncStateItem *v5;
  BOOL v6;

  v4 = (NPKPassSyncStateItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NPKPassSyncStateItem isEqualToPassSyncStateItem:](self, "isEqualToPassSyncStateItem:", v5);

  return v6;
}

- (BOOL)isEqualToPassSyncStateItem:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  char v10;

  v4 = a3;
  if (!PKEqualObjects())
    goto LABEL_11;
  v5 = (void *)v4[2];
  v6 = self->_serialNumber;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

      goto LABEL_11;
    }
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_11;
  }
  if (!PKEqualObjects())
  {
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = PKEqualObjects();
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_passTypeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_sequenceCounter);
  objc_msgSend(v3, "safelyAddObject:", self->_manifestHash);
  v4 = PKCombinedHash();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passTypeIdentifier;
  id v5;

  passTypeIdentifier = self->_passTypeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sequenceCounter, CFSTR("sequenceCounter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manifestHash, CFSTR("manifestHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manifest, CFSTR("manifest"));

}

- (NPKPassSyncStateItem)initWithCoder:(id)a3
{
  id v4;
  NPKPassSyncStateItem *v5;
  uint64_t v6;
  NSString *passTypeIdentifier;
  uint64_t v8;
  NSString *serialNumber;
  uint64_t v10;
  NSNumber *sequenceCounter;
  uint64_t v12;
  NSData *manifestHash;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *manifest;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NPKPassSyncStateItem;
  v5 = -[NPKPassSyncStateItem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sequenceCounter"));
    v10 = objc_claimAutoreleasedReturnValue();
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestHash"));
    v12 = objc_claimAutoreleasedReturnValue();
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v12;

    v14 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v14, objc_opt_class(), CFSTR("manifest"));
    v15 = objc_claimAutoreleasedReturnValue();
    manifest = v5->_manifest;
    v5->_manifest = (NSDictionary *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSNumber)sequenceCounter
{
  return self->_sequenceCounter;
}

- (void)setSequenceCounter:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceCounter, a3);
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
  objc_storeStrong((id *)&self->_manifestHash, a3);
}

- (NSDictionary)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
  objc_storeStrong((id *)&self->_manifest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_sequenceCounter, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end
