@implementation SHMediaLibraryGroup

- (SHMediaLibraryGroup)initWithIdentifier:(id)a3
{
  return (SHMediaLibraryGroup *)-[SHMediaLibraryGroup _initWithIdentifier:metadata:tracksToSave:](self, "_initWithIdentifier:metadata:tracksToSave:", a3, 0, MEMORY[0x24BDBD1A8]);
}

- (SHMediaLibraryGroup)initWithIdentifier:(id)a3 metadata:(id)a4
{
  return (SHMediaLibraryGroup *)-[SHMediaLibraryGroup _initWithIdentifier:metadata:tracksToSave:](self, "_initWithIdentifier:metadata:tracksToSave:", a3, a4, MEMORY[0x24BDBD1A8]);
}

- (SHMediaLibraryGroup)initWithManagedGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SHMediaLibraryItemMetadata *v7;
  void *v8;
  void *v9;
  SHMediaLibraryItemMetadata *v10;
  void *v11;
  SHMediaLibraryGroup *v12;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [SHMediaLibraryItemMetadata alloc];
    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SHMediaLibraryItemMetadata initWithEncodedSystemData:](v7, "initWithEncodedSystemData:", v9);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "syncID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SHMediaLibraryGroup _initWithIdentifier:metadata:tracksToSave:](self, "_initWithIdentifier:metadata:tracksToSave:", v11, v10, MEMORY[0x24BDBD1A8]);

  return v12;
}

- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5
{
  id v8;
  id v9;
  id v10;
  SHMediaLibraryGroup *v11;
  SHMediaLibraryGroup *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSMutableArray *mutableTracksToSave;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SHMediaLibraryGroup;
  v11 = -[SHMediaLibraryGroup init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    if (!-[SHMediaLibraryGroup validIdentifier:](v11, "validIdentifier:", v8))
    {
      v18 = (void *)MEMORY[0x24BDBCE88];
      v19 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not a valid identifier."), v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v21);
    }
    objc_msgSend(v8, "precomposedStringWithCanonicalMapping");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_metadata, a4);
    v15 = objc_msgSend(v10, "mutableCopy");
    mutableTracksToSave = v12->_mutableTracksToSave;
    v12->_mutableTracksToSave = (NSMutableArray *)v15;

  }
  return v12;
}

- (NSArray)tracksToSave
{
  void *v2;
  void *v3;

  -[SHMediaLibraryGroup mutableTracksToSave](self, "mutableTracksToSave");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addTracks:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "associatedGroupIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v14 = (void *)MEMORY[0x24BDBCE88];
          v15 = *MEMORY[0x24BDBCAB8];
          v16 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "associatedGroupIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("Track with identifier %@ is already associated to a group (%@), try removing it first."), v17, v18, (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v19, 0);
          v20 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v20);
        }
        -[SHMediaLibraryGroup identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAssociatedGroupIdentifier:", v11);

        -[SHMediaLibraryGroup mutableTracksToSave](self, "mutableTracksToSave");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v12, "addObject:", v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

}

- (void)removeTracks:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "associatedGroupIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v13 = (void *)MEMORY[0x24BDBCE88];
          v14 = *MEMORY[0x24BDBCAB8];
          v15 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("Track with identifier %@ cannot be removed, try adding it first."), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v17, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v18);
        }
        objc_msgSend(v9, "setAssociatedGroupIdentifier:", 0);
        -[SHMediaLibraryGroup mutableTracksToSave](self, "mutableTracksToSave");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v11, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

}

- (SHMediaLibraryGroup)initWithCoder:(id)a3
{
  id v4;
  SHMediaLibraryGroup *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  SHMediaLibraryItemMetadata *v10;
  SHMediaLibraryItemMetadata *metadata;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *mutableTracksToSave;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SHMediaLibraryGroup;
  v5 = -[SHMediaLibraryGroup init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x219A21784]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryGroupIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryGroupMetadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[SHMediaLibraryItemMetadata initWithEncodedSystemData:]([SHMediaLibraryItemMetadata alloc], "initWithEncodedSystemData:", v9);
      metadata = v5->_metadata;
      v5->_metadata = v10;

    }
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("SHMediaLibraryGroupTracksToSave"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    mutableTracksToSave = v5->_mutableTracksToSave;
    v5->_mutableTracksToSave = (NSMutableArray *)v16;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x219A21784]();
  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("SHLibraryGroupIdentifier"));
  -[SHMediaLibraryItemMetadata encodedSystemData](self->_metadata, "encodedSystemData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("SHLibraryGroupMetadata"));

  -[SHMediaLibraryGroup tracksToSave](self, "tracksToSave");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SHMediaLibraryGroupTracksToSave"));

  objc_autoreleasePoolPop(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaLibraryGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = +[SHMediaLibraryGroup allocWithZone:](SHMediaLibraryGroup, "allocWithZone:");
  -[SHMediaLibraryGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SHMediaLibraryGroup metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[SHMediaLibraryGroup tracksToSave](self, "tracksToSave");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  v12 = -[SHMediaLibraryGroup _initWithIdentifier:metadata:tracksToSave:](v5, "_initWithIdentifier:metadata:tracksToSave:", v7, v9, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  SHMediaLibraryGroup *v4;
  BOOL v5;

  v4 = (SHMediaLibraryGroup *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SHMediaLibraryGroup isEqualGroup:](self, "isEqualGroup:", v4);
  }

  return v5;
}

- (BOOL)isEqualGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SHMediaLibraryGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SHMediaLibraryGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)validIdentifier:(id)a3
{
  return objc_msgSend(a3, "length") != 0;
}

- (SHMediaLibraryItemMetadata)metadata
{
  return self->_metadata;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableArray)mutableTracksToSave
{
  return self->_mutableTracksToSave;
}

- (void)setMutableTracksToSave:(id)a3
{
  objc_storeStrong((id *)&self->_mutableTracksToSave, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTracksToSave, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
