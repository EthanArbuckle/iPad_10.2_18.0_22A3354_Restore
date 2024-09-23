@implementation GDHome

- (GDHome)initWithHMHome:(id)a3
{
  id v5;
  GDHome *v6;
  GDHome *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDHome;
  v6 = -[GDHome init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inner, a3);

  return v7;
}

- (HMHome)hmHome
{
  return self->_inner;
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_name(self->_inner, a2, v2, v3);
}

- (NSUUID)uniqueIdentifier
{
  uint64_t v2;
  uint64_t v3;

  return (NSUUID *)objc_msgSend_uniqueIdentifier(self->_inner, a2, v2, v3);
}

- (NSArray)users
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)MEMORY[0x1C3BA7BEC](self, a2);
  objc_msgSend_users(self->_inner, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUser(self->_inner, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObject_(v7, v12, (uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  objc_msgSend__pas_mappedArrayWithTransform_(v14, v15, (uint64_t)&unk_1E7A49820, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v17;
}

- (id)persons
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char isFaceClassificationEnabled;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  dispatch_time_t v21;
  id v22;
  _QWORD v24[4];
  id v25;
  NSObject *v26;

  v3 = (void *)objc_opt_new();
  objc_msgSend_personManagerSettings(self->_inner, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isFaceClassificationEnabled = objc_msgSend_isFaceClassificationEnabled(v7, v8, v9, v10);

  if ((isFaceClassificationEnabled & 1) != 0)
  {
    objc_msgSend_personManager(self->_inner, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = sub_1C1067724;
      v24[3] = &unk_1E7A49848;
      v17 = v3;
      v25 = v17;
      v18 = v16;
      v26 = v18;
      objc_msgSend_fetchAllPersonsWithCompletion_(v15, v19, (uint64_t)v24, v20);
      v21 = dispatch_time(0, 10000000000);
      if (dispatch_group_wait(v18, v21))
        v22 = (id)MEMORY[0x1E0C9AA60];
      else
        v22 = v17;

    }
    else
    {
      v22 = v3;
    }

  }
  else
  {
    v22 = v3;
  }

  return v22;
}

- (CLLocation)location
{
  return (CLLocation *)((uint64_t (*)(HMHome *, char *))MEMORY[0x1E0DE7D20])(self->_inner, sel_location);
}

- (NSArray)allUsers
{
  return self->_allUsers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allUsers, 0);
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
