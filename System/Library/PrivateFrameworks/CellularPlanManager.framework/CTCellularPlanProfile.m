@implementation CTCellularPlanProfile

- (CTCellularPlanProfile)initWithProfileId:(id)a3 iccid:(id)a4 selected:(BOOL)a5 bootstrap:(BOOL)a6 disableNotAllowed:(BOOL)a7 deleteNotAllowed:(BOOL)a8 requiresUserConsent:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  CTCellularPlanProfile *v17;
  CTCellularPlanProfile *v18;
  objc_super v20;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CTCellularPlanProfile;
  v17 = -[CTCellularPlanProfile init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[CTCellularPlanProfile setProfileId:](v17, "setProfileId:", v15);
    -[CTCellularPlanProfile setIccid:](v18, "setIccid:", v16);
    -[CTCellularPlanProfile setIsSelected:](v18, "setIsSelected:", v12);
    -[CTCellularPlanProfile setIsBootstrap:](v18, "setIsBootstrap:", v11);
    -[CTCellularPlanProfile setIsDisableNotAllowed:](v18, "setIsDisableNotAllowed:", v10);
    -[CTCellularPlanProfile setIsDeleteNotAllowed:](v18, "setIsDeleteNotAllowed:", v9);
    -[CTCellularPlanProfile setRequiresUserConsent:](v18, "setRequiresUserConsent:", a9);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSData copy](self->_profileId, "copy");
  v6 = (void *)-[NSString copy](self->_iccid, "copy");
  LOBYTE(v9) = self->_requiresUserConsent;
  v7 = (void *)objc_msgSend(v4, "initWithProfileId:iccid:selected:bootstrap:disableNotAllowed:deleteNotAllowed:requiresUserConsent:", v5, v6, self->_isSelected, self->_isBootstrap, self->_isDisableNotAllowed, self->_isDeleteNotAllowed, v9);

  return v7;
}

- (CTCellularPlanProfile)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanProfile *v5;
  uint64_t v6;
  NSString *iccid;
  uint64_t v8;
  NSData *profileId;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTCellularPlanProfile;
  v5 = -[CTCellularPlanProfile init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iccid"));
    v6 = objc_claimAutoreleasedReturnValue();
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileId"));
    v8 = objc_claimAutoreleasedReturnValue();
    profileId = v5->_profileId;
    v5->_profileId = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBootstrap"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isBootstrap = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isActive"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSelected = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isDisableNotAllowed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDisableNotAllowed = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isDeleteNotAllowed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDeleteNotAllowed = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiresUserConsent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiresUserConsent = objc_msgSend(v14, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *iccid;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  iccid = self->_iccid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", iccid, CFSTR("iccid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileId, CFSTR("profileId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBootstrap);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("isBootstrap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSelected);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("isSelected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDisableNotAllowed);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("isDisableNotAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeleteNotAllowed);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("isDeleteNotAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresUserConsent);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("requiresUserConsent"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CTCellularPlanProfile iccid](self, "iccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<plan: iccid:%@, isSelected:%d, isDisableNotAllowed:%d, isDeleteNotAllowed:%d, requiresUserConsent:%d>"), v4, -[CTCellularPlanProfile isSelected](self, "isSelected"), -[CTCellularPlanProfile isDisableNotAllowed](self, "isDisableNotAllowed"), -[CTCellularPlanProfile isDeleteNotAllowed](self, "isDeleteNotAllowed"), -[CTCellularPlanProfile requiresUserConsent](self, "requiresUserConsent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<plan: isSelected:%d, isDisableNotAllowed:%d, isDeleteNotAllowed:%d, requiresUserConsent:%d>"), -[CTCellularPlanProfile isSelected](self, "isSelected"), -[CTCellularPlanProfile isDisableNotAllowed](self, "isDisableNotAllowed"), -[CTCellularPlanProfile isDeleteNotAllowed](self, "isDeleteNotAllowed"), -[CTCellularPlanProfile requiresUserConsent](self, "requiresUserConsent"));
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (BOOL)isBootstrap
{
  return self->_isBootstrap;
}

- (void)setIsBootstrap:(BOOL)a3
{
  self->_isBootstrap = a3;
}

- (BOOL)isDisableNotAllowed
{
  return self->_isDisableNotAllowed;
}

- (void)setIsDisableNotAllowed:(BOOL)a3
{
  self->_isDisableNotAllowed = a3;
}

- (BOOL)isDeleteNotAllowed
{
  return self->_isDeleteNotAllowed;
}

- (void)setIsDeleteNotAllowed:(BOOL)a3
{
  self->_isDeleteNotAllowed = a3;
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSData)profileId
{
  return self->_profileId;
}

- (void)setProfileId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_profileId, 0);
}

@end
