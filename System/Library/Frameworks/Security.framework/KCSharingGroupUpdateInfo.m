@implementation KCSharingGroupUpdateInfo

- (KCSharingGroupUpdateInfo)initWithGroup:(id)a3 addedParticipants:(id)a4
{
  id v6;
  id v7;
  KCSharingGroupUpdateInfo *v8;
  KCSharingGroupUpdateInfo *v9;
  uint64_t v10;
  KCSharingGroup *updatedGroup;
  uint64_t v12;
  NSArray *addedParticipants;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)KCSharingGroupUpdateInfo;
  v8 = -[KCSharingGroupUpdateInfo init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_updateType = 0;
    v10 = objc_msgSend(v6, "copy");
    updatedGroup = v9->_updatedGroup;
    v9->_updatedGroup = (KCSharingGroup *)v10;

    v12 = objc_msgSend(v7, "copy");
    addedParticipants = v9->_addedParticipants;
    v9->_addedParticipants = (NSArray *)v12;

  }
  return v9;
}

- (KCSharingGroupUpdateInfo)initWithDepartedGroupID:(id)a3
{
  id v4;
  KCSharingGroupUpdateInfo *v5;
  KCSharingGroupUpdateInfo *v6;
  uint64_t v7;
  NSString *departedGroupID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KCSharingGroupUpdateInfo;
  v5 = -[KCSharingGroupUpdateInfo init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_updateType = 1;
    v7 = objc_msgSend(v4, "copy");
    departedGroupID = v6->_departedGroupID;
    v6->_departedGroupID = (NSString *)v7;

  }
  return v6;
}

- (id)description
{
  int64_t updateType;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  updateType = self->_updateType;
  if (updateType == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KCSharingGroupUpdateInfo(%@, departed group)"), self->_departedGroupID);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (updateType)
  {
    v7 = CFSTR("KCSharingGroupUpdateInfo(Unknown update type)");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[KCSharingGroup groupID](self->_updatedGroup, "groupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCSharingGroup displayName](self->_updatedGroup, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("KCSharingGroupUpdateInfo(%@, name: \"%@\", new participants: %@)"), v5, v6, self->_addedParticipants);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (KCSharingGroupUpdateInfo)initWithCoder:(id)a3
{
  id v4;
  KCSharingGroupUpdateInfo *v5;
  void *v6;
  uint64_t v7;
  KCSharingGroup *updatedGroup;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *addedParticipants;
  uint64_t v14;
  NSString *departedGroupID;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KCSharingGroupUpdateInfo;
  v5 = -[KCSharingGroupUpdateInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_updateType = objc_msgSend(v6, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatedGroup"));
    v7 = objc_claimAutoreleasedReturnValue();
    updatedGroup = v5->_updatedGroup;
    v5->_updatedGroup = (KCSharingGroup *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("addedParticipants"));
    v12 = objc_claimAutoreleasedReturnValue();
    addedParticipants = v5->_addedParticipants;
    v5->_addedParticipants = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("departedGroupID"));
    v14 = objc_claimAutoreleasedReturnValue();
    departedGroupID = v5->_departedGroupID;
    v5->_departedGroupID = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t updateType;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  updateType = self->_updateType;
  v7 = a3;
  objc_msgSend(v4, "numberWithLongLong:", updateType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("updateType"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_updatedGroup, CFSTR("updatedGroup"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_addedParticipants, CFSTR("addedParticipants"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_departedGroupID, CFSTR("departedGroupID"));

}

- (int64_t)updateType
{
  return self->_updateType;
}

- (KCSharingGroup)updatedGroup
{
  return self->_updatedGroup;
}

- (NSArray)addedParticipants
{
  return self->_addedParticipants;
}

- (NSString)departedGroupID
{
  return self->_departedGroupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departedGroupID, 0);
  objc_storeStrong((id *)&self->_addedParticipants, 0);
  objc_storeStrong((id *)&self->_updatedGroup, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
