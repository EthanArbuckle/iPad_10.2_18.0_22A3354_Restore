@implementation AKSignInWithAppleAccountShareInfo

- (AKSignInWithAppleAccountShareInfo)initWithGroupID:(id)a3 participantID:(id)a4 participantName:(id)a5
{
  id v9;
  id v10;
  id v11;
  AKSignInWithAppleAccountShareInfo *v12;
  AKSignInWithAppleAccountShareInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKSignInWithAppleAccountShareInfo;
  v12 = -[AKSignInWithAppleAccountShareInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_groupID, a3);
    objc_storeStrong((id *)&v13->_participantID, a4);
    objc_storeStrong((id *)&v13->_participantName, a5);
  }

  return v13;
}

- (AKSignInWithAppleAccountShareInfo)initWithGroupID:(id)a3 participantID:(id)a4
{
  return -[AKSignInWithAppleAccountShareInfo initWithGroupID:participantID:participantName:](self, "initWithGroupID:participantID:participantName:", a3, a4, &stru_1E2E647A8);
}

- (AKSignInWithAppleAccountShareInfo)initWithCoder:(id)a3
{
  id v4;
  AKSignInWithAppleAccountShareInfo *v5;
  uint64_t v6;
  NSString *groupID;
  uint64_t v8;
  NSString *participantID;
  uint64_t v10;
  NSString *participantName;
  uint64_t v12;
  NSString *participantHandle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKSignInWithAppleAccountShareInfo;
  v5 = -[AKSignInWithAppleAccountShareInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantID"));
    v8 = objc_claimAutoreleasedReturnValue();
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantName"));
    v10 = objc_claimAutoreleasedReturnValue();
    participantName = v5->_participantName;
    v5->_participantName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantHandle"));
    v12 = objc_claimAutoreleasedReturnValue();
    participantHandle = v5->_participantHandle;
    v5->_participantHandle = (NSString *)v12;

    v5->_isCurrentUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCurrentUser"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupID;
  id v5;

  groupID = self->_groupID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupID, CFSTR("groupID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participantID, CFSTR("participantID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participantName, CFSTR("participantName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participantHandle, CFSTR("participantHandle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCurrentUser, CFSTR("isCurrentUser"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_groupID, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSString copy](self->_participantID, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSString copy](self->_participantName, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  v11 = -[NSString copy](self->_participantHandle, "copy");
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  *(_BYTE *)(v4 + 8) = self->_isCurrentUser;
  return (id)v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isCurrentUser)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tgroupID: %@, \n\tparticipantID: %@, \n\tparticipantHandle: %@, \n\tisCurrentUser: %@, \n}>"), v5, self, *(_OWORD *)&self->_groupID, self->_participantHandle, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)participantName
{
  return self->_participantName;
}

- (NSString)participantHandle
{
  return self->_participantHandle;
}

- (void)setParticipantHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (NSString)shareToken
{
  return self->_shareToken;
}

- (void)setShareToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareToken, 0);
  objc_storeStrong((id *)&self->_participantHandle, 0);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

@end
