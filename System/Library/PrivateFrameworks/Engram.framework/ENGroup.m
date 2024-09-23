@implementation ENGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sortedGroupsFromGroups:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D4D02DF8;
  v8[3] = &unk_1E987B708;
  v8[4] = &v9;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*((_BYTE *)v10 + 24))
    v6 = v4;
  else
    v6 = 0;

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (ENGroup)initWithGroupInfo:(id)a3 groupID:(id)a4 cypher:(id)a5
{
  id v9;
  id v10;
  id v11;
  ENGroup *v12;
  ENGroup *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ENGroup;
  v12 = -[ENGroup init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_groupInfo, a3);
    objc_storeStrong((id *)&v13->_groupID, a4);
    objc_storeStrong((id *)&v13->_cypher, a5);
  }

  return v13;
}

- (ENGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kENGroupGroupInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kENGroupGroupIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ENGroup groupInfo](self, "groupInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kENGroupGroupInfoKey"));

  -[ENGroup groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kENGroupGroupIDKey"));

  -[ENGroup cypher](self, "cypher");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kENGroupCypherKey"));

}

- (id)signAndConcealData:(id)a3 cypherIdentifier:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  -[ENGroup cypher](self, "cypher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENGroup accountIdentity](self, "accountIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cypherData:withAccountIdentity:identifier:error:", v8, v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)verifyAndRevealData:(id)a3 sendingDevice:(id)a4 cypherIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[ENGroup cypher](self, "cypher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENGroup accountIdentity](self, "accountIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "devicePublicKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "decypherData:withAccountIdentity:signingDevicePublicKey:identifier:error:", v12, v14, v15, v10, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSSet)destinations
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ENGroup participants](self, "participants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "aliases");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ENGroup groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENGroup participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p groupID: %@ participants: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accountIdentity
{
  void *v2;
  void *v3;

  -[ENGroup groupInfo](self, "groupInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)participants
{
  void *v2;
  void *v3;

  -[ENGroup groupInfo](self, "groupInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSData)sharedApplicationData
{
  void *v2;
  void *v3;

  -[ENGroup groupInfo](self, "groupInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedApplicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "groupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENGroup groupID](self, "groupID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  -[ENGroup groupID](self, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (ENGroupID)groupID
{
  return self->_groupID;
}

- (ENCypher)cypher
{
  return self->_cypher;
}

- (void)setCypher:(id)a3
{
  objc_storeStrong((id *)&self->_cypher, a3);
}

- (_ENGroupInfo)groupInfo
{
  return self->_groupInfo;
}

- (void)setGroupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_groupInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupInfo, 0);
  objc_storeStrong((id *)&self->_cypher, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

@end
