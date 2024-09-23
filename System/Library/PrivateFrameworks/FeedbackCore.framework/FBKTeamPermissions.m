@implementation FBKTeamPermissions

- (FBKTeamPermissions)init
{
  FBKTeamPermissions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBKTeamPermissions;
  result = -[FBKTeamPermissions init](&v3, sel_init);
  if (result)
  {
    *(_DWORD *)&result->_canDownload = 0;
    *(_DWORD *)&result->_canView = 0;
  }
  return result;
}

- (FBKTeamPermissions)initWithView:(BOOL)a3 respond:(BOOL)a4 close:(BOOL)a5 download:(BOOL)a6 delete:(BOOL)a7 assign:(BOOL)a8 demote:(BOOL)a9
{
  FBKTeamPermissions *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FBKTeamPermissions;
  result = -[FBKTeamPermissions init](&v16, sel_init);
  if (result)
  {
    result->_canView = a3;
    result->_canRespond = a4;
    result->_canClose = a5;
    result->_canDownload = a6;
    result->_canDelete = a7;
    result->_canDemote = a9;
    result->_canAssign = a8;
  }
  return result;
}

- (FBKTeamPermissions)initWithJSONObject:(id)a3
{
  id v4;
  FBKTeamPermissions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FBKTeamPermissions;
  v5 = -[FBKTeamPermissions init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canView = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("respond"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canRespond = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("close"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canClose = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("download"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canDownload = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delete"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canDelete = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("demote"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canDemote = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assign"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canAssign = objc_msgSend(v12, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canView](self, "canView"), CFSTR("view"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canRespond](self, "canRespond"), CFSTR("respond"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canDownload](self, "canDownload"), CFSTR("download"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canDemote](self, "canDemote"), CFSTR("demote"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canDelete](self, "canDelete"), CFSTR("delete"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canAssign](self, "canAssign"), CFSTR("assign"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FBKTeamPermissions canClose](self, "canClose"), CFSTR("close"));

}

- (FBKTeamPermissions)initWithCoder:(id)a3
{
  id v4;
  FBKTeamPermissions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FBKTeamPermissions;
  v5 = -[FBKTeamPermissions init](&v7, sel_init);
  if (v5)
  {
    v5->_canView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("view"));
    v5->_canRespond = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("respond"));
    v5->_canDownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("download"));
    v5->_canDelete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("delete"));
    v5->_canDemote = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("demote"));
    v5->_canAssign = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assign"));
    v5->_canClose = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("close"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)canView
{
  return self->_canView;
}

- (BOOL)canRespond
{
  return self->_canRespond;
}

- (BOOL)canClose
{
  return self->_canClose;
}

- (BOOL)canDownload
{
  return self->_canDownload;
}

- (BOOL)canDelete
{
  return self->_canDelete;
}

- (BOOL)canAssign
{
  return self->_canAssign;
}

- (BOOL)canDemote
{
  return self->_canDemote;
}

+ (FBKTeamPermissions)personalTeamPermissions
{
  if (qword_255398CA0 != -1)
    swift_once();
  return (FBKTeamPermissions *)(id)qword_25539CAA8;
}

@end
