@implementation HURestrictedGuestScheduleItemManager

- (HURestrictedGuestScheduleItemManager)initWithHome:(id)a3 user:(id)a4 delegate:(id)a5
{
  id v10;
  id v11;
  id v12;
  HURestrictedGuestScheduleItemManager *v13;
  HURestrictedGuestScheduleItemManager *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleItemManager.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleItemManager.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

LABEL_3:
  if ((objc_msgSend(v10, "hf_userIsRestrictedGuest:", v11) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleItemManager.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[home hf_userIsRestrictedGuest:user]"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HURestrictedGuestScheduleItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v19, sel_initWithDelegate_sourceItem_, v12, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_overrideHome, a3);
    objc_storeStrong((id *)&v14->_user, a4);
    v14->_scheduleContext = 0;
  }

  return v14;
}

- (HURestrictedGuestScheduleItemManager)initWithSchedule:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  HURestrictedGuestScheduleItemManager *v10;
  HURestrictedGuestScheduleItemManager *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleItemManager.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("schedule"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HURestrictedGuestScheduleItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v14, sel_initWithDelegate_sourceItem_, v9, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_inviteUserSchedule, a3);
    v11->_scheduleContext = 1;
  }

  return v11;
}

- (id)_buildItemModulesForHome:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HUScheduleEditorItemModule *v19;
  void *v20;
  HUScheduleEditorItemModule *v22;
  uint8_t buf[4];
  HURestrictedGuestScheduleItemManager *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[HURestrictedGuestScheduleItemManager scheduleContext](self, "scheduleContext", a3))
  {
    if (-[HURestrictedGuestScheduleItemManager scheduleContext](self, "scheduleContext") != 1)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v5 = (void *)MEMORY[0x1E0D31728];
    -[HURestrictedGuestScheduleItemManager inviteUserSchedule](self, "inviteUserSchedule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleBuilderFromSchedule:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HURestrictedGuestScheduleItemManager inviteUserSchedule](self, "inviteUserSchedule");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HURestrictedGuestScheduleItemManager scheduleContext](self, "scheduleContext"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v24 = self;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed new schedule builder [%@] from home schedule [%@] with context [%@].", buf, 0x34u);

    }
  }
  else
  {
    -[HURestrictedGuestScheduleItemManager overrideHome](self, "overrideHome");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURestrictedGuestScheduleItemManager user](self, "user");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeAccessControlForUser:", v13);
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject restrictedGuestAccessSettings](v8, "restrictedGuestAccessSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "guestAccessSchedule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31728], "scheduleBuilderFromHomeAccessSchedule:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HURestrictedGuestScheduleItemManager scheduleContext](self, "scheduleContext"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v24 = self;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed new schedule builder [%@] from guest access schedule [%@] with context [%@].", buf, 0x34u);

    }
  }

LABEL_10:
  v19 = -[HUScheduleEditorItemModule initWithItemUpdater:scheduleBuilder:]([HUScheduleEditorItemModule alloc], "initWithItemUpdater:scheduleBuilder:", self, v7);
  v22 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)scheduleContext
{
  return self->_scheduleContext;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HMUser)user
{
  return self->_user;
}

- (HFSchedule)inviteUserSchedule
{
  return self->_inviteUserSchedule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteUserSchedule, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
}

@end
