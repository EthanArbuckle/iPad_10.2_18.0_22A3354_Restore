@implementation CNChangeHistoryGroupChange

- (CNChangeHistoryGroupChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6 externalID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CNChangeHistoryGroupChange *v16;
  uint64_t v17;
  NSString *groupIdentifier;
  uint64_t v19;
  CNChangeHistoryAnchor *changeAnchor;
  uint64_t v21;
  NSNumber *changeID;
  uint64_t v23;
  NSString *externalID;
  CNChangeHistoryGroupChange *v25;
  objc_super v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CNChangeHistoryGroupChange;
  v16 = -[CNChangeHistoryGroupChange init](&v27, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    groupIdentifier = v16->_groupIdentifier;
    v16->_groupIdentifier = (NSString *)v17;

    v16->_changeType = a4;
    v19 = objc_msgSend(v13, "copy");
    changeAnchor = v16->_changeAnchor;
    v16->_changeAnchor = (CNChangeHistoryAnchor *)v19;

    v21 = objc_msgSend(v14, "copy");
    changeID = v16->_changeID;
    v16->_changeID = (NSNumber *)v21;

    v23 = objc_msgSend(v15, "copy");
    externalID = v16->_externalID;
    v16->_externalID = (NSString *)v23;

    v25 = v16;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryGroupChange)initWithCoder:(id)a3
{
  id v4;
  CNChangeHistoryGroupChange *v5;
  void *v6;
  uint64_t v7;
  NSString *groupIdentifier;
  void *v9;
  uint64_t v10;
  CNChangeHistoryAnchor *changeAnchor;
  void *v12;
  uint64_t v13;
  NSNumber *changeID;
  void *v15;
  uint64_t v16;
  NSString *externalID;
  CNChangeHistoryGroupChange *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNChangeHistoryGroupChange;
  v5 = -[CNChangeHistoryGroupChange init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_groupIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v7;

    v5->_changeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_changeType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_changeAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    changeAnchor = v5->_changeAnchor;
    v5->_changeAnchor = (CNChangeHistoryAnchor *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_changeID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    changeID = v5->_changeID;
    v5->_changeID = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupIdentifier;
  id v5;

  groupIdentifier = self->_groupIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupIdentifier, CFSTR("_groupIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeType, CFSTR("_changeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeAnchor, CFSTR("_changeAnchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeID, CFSTR("_changeID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalID, CFSTR("_externalID"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0D13A08];
  -[CNChangeHistoryGroupChange groupIdentifier](self, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNChangeHistoryGroupChange changeType](self, "changeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryGroupChange changeAnchor](self, "changeAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryGroupChange changeID](self, "changeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryGroupChange externalID](self, "externalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryGroupChange group](self, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, CFSTR("groupIdentifier"), v4, CFSTR("changeType"), v5, CFSTR("changeAnchor"), v6, CFSTR("changeID"), v7, CFSTR("externalID"), v8, CFSTR("group"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (CNGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (CNChangeHistoryAnchor)changeAnchor
{
  return self->_changeAnchor;
}

- (void)setChangeAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_changeAnchor, a3);
}

- (NSNumber)changeID
{
  return self->_changeID;
}

- (void)setChangeID:(id)a3
{
  objc_storeStrong((id *)&self->_changeID, a3);
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
  objc_storeStrong((id *)&self->_externalID, a3);
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
  objc_storeStrong((id *)&self->_externalURI, a3);
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
  objc_storeStrong((id *)&self->_externalModificationTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_changeID, 0);
  objc_storeStrong((id *)&self->_changeAnchor, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
