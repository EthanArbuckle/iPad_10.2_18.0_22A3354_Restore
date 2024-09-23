@implementation KCSharingGroup

- (KCSharingGroup)initWithParticipants:(id)a3 displayName:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  KCSharingGroup *v11;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[KCSharingGroup initWithGroupID:participants:displayName:shareURL:](self, "initWithGroupID:participants:displayName:shareURL:", v10, v8, v7, 0);
  return v11;
}

- (KCSharingGroup)initWithGroupID:(id)a3 participants:(id)a4 displayName:(id)a5 shareURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KCSharingGroup *v15;
  KCSharingGroup *v16;
  uint64_t v17;
  NSArray *participants;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)KCSharingGroup;
  v15 = -[KCSharingGroup init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_groupID, a3);
    if (v12)
    {
      v17 = objc_msgSend(v12, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    participants = v16->_participants;
    v16->_participants = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_displayName, a5);
    objc_storeStrong((id *)&v16->_shareURL, a6);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KCSharingGroup *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  KCSharingGroup *v14;

  v4 = [KCSharingGroup alloc];
  -[KCSharingGroup groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[KCSharingGroup participants](self, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v8, 1);
  -[KCSharingGroup displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[KCSharingGroup shareURL](self, "shareURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  v14 = -[KCSharingGroup initWithGroupID:participants:displayName:shareURL:](v4, "initWithGroupID:participants:displayName:shareURL:", v6, v9, v11, v13);

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[KCSharingGroup groupID](self, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("KCSharingGroup(%@, name: %@, participants: %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)longDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[KCSharingGroup groupID](self, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup shareURL](self, "shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("KCSharingGroup(%@, name: %@ shareURL: %@ participants:\n"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[KCSharingGroup participants](self, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "longDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("\t%@\n"), v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "appendString:", CFSTR(")"));
  v14 = (void *)objc_msgSend(v7, "copy");

  return (NSString *)v14;
}

- (NSDictionary)JSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("groupID");
  -[KCSharingGroup groupID](self, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("participants");
  v14[0] = v3;
  -[KCSharingGroup participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("JSONObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[KCSharingGroup displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("displayName"));

  -[KCSharingGroup shareURL](self, "shareURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("shareURL"));

  v11 = (void *)objc_msgSend(v7, "copy");
  return (NSDictionary *)v11;
}

- (KCSharingGroup)initWithCoder:(id)a3
{
  id v4;
  KCSharingGroup *v5;
  uint64_t v6;
  NSString *groupID;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *participants;
  uint64_t v15;
  NSString *displayName;
  uint64_t v17;
  NSURL *shareURL;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)KCSharingGroup;
  v5 = -[KCSharingGroup init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("participants"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    participants = v5->_participants;
    v5->_participants = v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[KCSharingGroup groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupID"));

  -[KCSharingGroup participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("participants"));

  -[KCSharingGroup displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("displayName"));

  -[KCSharingGroup shareURL](self, "shareURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("shareURL"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[KCSharingGroup groupID](self, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[KCSharingGroup participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[KCSharingGroup displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[KCSharingGroup shareURL](self, "shareURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[KCSharingGroup displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[KCSharingGroup displayName](self, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      objc_msgSend(v5, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 == 0;
    }

    -[KCSharingGroup shareURL](self, "shareURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[KCSharingGroup shareURL](self, "shareURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shareURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

    }
    else
    {
      objc_msgSend(v5, "shareURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 == 0;
    }

    -[KCSharingGroup groupID](self, "groupID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", v16))
    {
      -[KCSharingGroup participants](self, "participants");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "participants");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v17, "isEqual:", v18) & v9 & v14;

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (KCSharingParticipant)currentUserParticipant
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[KCSharingGroup participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isCurrentUser") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (KCSharingParticipant *)v3;
}

- (KCSharingParticipant)ownerParticipant
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[KCSharingGroup participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isOwner") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (KCSharingParticipant *)v3;
}

- (BOOL)isOwned
{
  void *v3;
  void *v4;
  char v5;

  -[KCSharingGroup currentUserParticipant](self, "currentUserParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup ownerParticipant](self, "ownerParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (int64_t)joinState
{
  void *v2;
  int64_t v3;

  -[KCSharingGroup currentUserParticipant](self, "currentUserParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inviteStatus");

  return v3;
}

- (void)addParticipant:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[KCSharingGroup participants](self, "participants");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[KCSharingGroup setParticipants:](self, "setParticipants:", v5);
}

- (void)removeParticipant:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;

  v4 = a3;
  -[KCSharingGroup participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __36__KCSharingGroup_removeParticipant___block_invoke;
  v14 = &unk_1E1FCB7F8;
  v15 = v4;
  v6 = v4;
  v7 = objc_msgSend(v9, "indexOfObjectPassingTest:", &v11);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "removeObjectAtIndex:", v7);
  v8 = (void *)objc_msgSend(v9, "copy", v9, v11, v12, v13, v14);
  -[KCSharingGroup setParticipants:](self, "setParticipants:", v8);

}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

uint64_t __36__KCSharingGroup_removeParticipant___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
