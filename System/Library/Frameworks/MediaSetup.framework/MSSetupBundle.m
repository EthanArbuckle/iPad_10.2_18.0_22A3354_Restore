@implementation MSSetupBundle

- (MSSetupBundle)initWithHomeID:(id)a3 homeUserID:(id)a4
{
  id v7;
  id v8;
  MSSetupBundle *v9;
  MSSetupBundle *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSSetupBundle;
  v9 = -[MSSetupBundle init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeID, a3);
    objc_storeStrong((id *)&v10->_homeUserID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSSetupBundle)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *homeID;
  NSUUID *v7;
  NSUUID *homeUserID;
  MSSetupBundle *v9;

  v4 = a3;
  if (!self)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Home_ID"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  homeID = self->_homeID;
  self->_homeID = v5;

  if (!self->_homeID)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Home_User_ID"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  homeUserID = self->_homeUserID;
  self->_homeUserID = v7;

  if (self->_homeUserID)
LABEL_4:
    v9 = self;
  else
LABEL_5:
    v9 = 0;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *homeID;
  id v5;

  homeID = self->_homeID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", homeID, CFSTR("Home_ID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeUserID, CFSTR("Home_User_ID"));

}

- (NSUUID)homeUserID
{
  return self->_homeUserID;
}

- (void)setHomeUserID:(id)a3
{
  objc_storeStrong((id *)&self->_homeUserID, a3);
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
  objc_storeStrong((id *)&self->_homeID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_homeUserID, 0);
}

@end
