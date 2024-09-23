@implementation LACPreboardUPPProfile

- (LACPreboardUPPProfile)initWithUUID:(id)a3 teamID:(id)a4 teamName:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACPreboardUPPProfile *v12;
  LACPreboardUPPProfile *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACPreboardUPPProfile;
  v12 = -[LACPreboardUPPProfile init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeStrong((id *)&v13->_teamID, a4);
    objc_storeStrong((id *)&v13->_teamName, a5);
  }

  return v13;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_storeStrong((id *)&self->_teamID, a3);
}

- (NSString)teamName
{
  return self->_teamName;
}

- (void)setTeamName:(id)a3
{
  objc_storeStrong((id *)&self->_teamName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamName, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
