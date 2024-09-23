@implementation IMDHandle

- (NSString)ID
{
  return self->_id;
}

- (NSString)personCentricID
{
  if (IMSharedHelperPersistMergeID())
    return self->_personCentricID;
  else
    return 0;
}

- (NSString)CNContactID
{
  return self->_CNContactID;
}

- (IMDHandle)initWithID:(id)a3 unformattedID:(id)a4 countryCode:(id)a5
{
  return -[IMDHandle initWithID:unformattedID:countryCode:personCentricID:](self, "initWithID:unformattedID:countryCode:personCentricID:", a3, a4, a5, 0);
}

- (IMDHandle)initWithID:(id)a3 unformattedID:(id)a4 countryCode:(id)a5 personCentricID:(id)a6
{
  IMDHandle *v10;
  NSString *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMDHandle;
  v10 = -[IMDHandle init](&v13, sel_init);
  if (v10)
  {
    v10->_id = (NSString *)a3;
    v10->_unformattedID = (NSString *)a4;
    v10->_countryCode = (NSString *)a5;
    if (IMSharedHelperPersistMergeID())
      v11 = (NSString *)a6;
    else
      v11 = 0;
    v10->_personCentricID = v11;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDHandle;
  -[IMDHandle dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSString *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  if (a3 == self)
    goto LABEL_10;
  v5 = -[IMDHandle ID](self, "ID");
  v6 = objc_msgSend(a3, "ID");
  if (v5 == (NSString *)v6 || (v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6)))
  {
    v8 = -[IMDHandle unformattedID](self, "unformattedID");
    v9 = objc_msgSend(a3, "unformattedID");
    if (v8 == (NSString *)v9 || (v7 = -[NSString isEqualToString:](v8, "isEqualToString:", v9)))
    {
      v10 = -[IMDHandle countryCode](self, "countryCode");
      v11 = objc_msgSend(a3, "countryCode");
      if (v10 != (NSString *)v11)
      {
        LOBYTE(v7) = -[NSString isEqualToString:](v10, "isEqualToString:", v11);
        return v7;
      }
LABEL_10:
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (int64_t)compareIDs:(id)a3
{
  return -[NSString caseInsensitiveCompare:](-[IMDHandle ID](self, "ID"), "caseInsensitiveCompare:", objc_msgSend(a3, "ID"));
}

- (BOOL)isBetterDefinedThan:(id)a3
{
  return (-[IMDHandle unformattedID](self, "unformattedID") || !objc_msgSend(a3, "unformattedID"))
      && (-[IMDHandle countryCode](self, "countryCode") || !objc_msgSend(a3, "countryCode"));
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@:%@>"), self->_id, self->_unformattedID, self->_countryCode), "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@: <%@:%@:%@:%@:%@>]"), NSStringFromClass(v4), self->_id, self->_unformattedID, self->_countryCode, self->_personCentricID, self->_CNContactID);
}

- (NSDictionary)handleInfo
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self->_id, *MEMORY[0x1E0D36D90], self->_unformattedID, *MEMORY[0x1E0D36E10], self->_countryCode, *MEMORY[0x1E0D36D68], self->_personCentricID, *MEMORY[0x1E0D36DD0], 0);
}

- (BOOL)isBusiness
{
  JUMPOUT(0x1D17EA338);
}

- (BOOL)isStewie
{
  JUMPOUT(0x1D17EA368);
}

- (void)setPersonCentricID:(id)a3
{
  NSString *personCentricID;

  if (IMSharedHelperPersistMergeID())
  {
    personCentricID = self->_personCentricID;
    if (personCentricID != a3)
    {

      self->_personCentricID = (NSString *)a3;
    }
  }
}

- (NSString)normalizedID
{
  -[IMDHandle ID](self, "ID");
  JUMPOUT(0x1D17EA374);
}

- (BOOL)matchesLoginHandleForAnyAccount
{
  return -[IMDAccountController accountAssociatedWithHandle:](+[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance"), "accountAssociatedWithHandle:", -[IMDHandle ID](self, "ID"));
}

- (BOOL)cachedOffGridMode
{
  int v3;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isCarrierPigeonEnabled");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39878], "sharedInstance"), "offGridModeForHandle:", self) == 2;
  return v3;
}

- (void)cachedOffGridModeAndLastPublisherWithCompletion:(id)a3
{
  void *v5;
  _QWORD v6[5];

  v5 = (void *)objc_msgSend(MEMORY[0x1E0D39878], "sharedInstance");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D15E8160;
  v6[3] = &unk_1E922F340;
  v6[4] = a3;
  objc_msgSend(v5, "cachedOffGridModeAndLastPublisherForHandle:completion:", self, v6);
}

- (void)isOffGridModeWithCompletion:(id)a3
{
  void *v5;
  _QWORD v6[5];

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isCarrierPigeonEnabled"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0D39878], "sharedInstance");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1D15E8214;
    v6[3] = &unk_1E922F368;
    v6[4] = a3;
    objc_msgSend(v5, "offGridModeForHandle:completion:", self, v6);
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (void)setID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)unformattedID
{
  return self->_unformattedID;
}

- (void)setUnformattedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setCNContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
