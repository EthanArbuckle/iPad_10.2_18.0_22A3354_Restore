@implementation HUCameraAccessLevelOptionItem

- (HUCameraAccessLevelOptionItem)initWithUser:(id)a3 home:(id)a4 accessLevel:(unint64_t)a5
{
  id v9;
  id v10;
  HUCameraAccessLevelOptionItem *v11;
  HUCameraAccessLevelOptionItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraAccessLevelOptionItem;
  v11 = -[HUCameraAccessLevelOptionItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_user, a3);
    objc_storeStrong((id *)&v12->_home, a4);
    v12->_accessLevel = a5;
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  -[HUCameraAccessLevelOptionItem home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraAccessLevelOptionItem user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAccessControlForUser:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "camerasAccessLevel");

  v20[0] = *MEMORY[0x1E0D30D18];
  -[HUCameraAccessLevelOptionItem accessLevel](self, "accessLevel");
  HFLocalizedStringFromHMUserCameraAccessLevel();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v20[1] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HUCameraAccessLevelOptionItem accessLevel](self, "accessLevel") == v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  v20[2] = *MEMORY[0x1E0D30B80];
  v10 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraAccessLevelOptionItem user](self, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  v20[3] = CFSTR("HUCameraSettingResultKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUCameraAccessLevelOptionItem accessLevel](self, "accessLevel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v13;
  v20[4] = *MEMORY[0x1E0D30DA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUCameraAccessLevelOptionItem accessLevel](self, "accessLevel") + 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "futureWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HMUser)user
{
  return self->_user;
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
