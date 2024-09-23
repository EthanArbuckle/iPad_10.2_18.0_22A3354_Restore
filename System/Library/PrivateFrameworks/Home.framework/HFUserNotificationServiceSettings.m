@implementation HFUserNotificationServiceSettings

- (HFUserNotificationServiceSettings)initWithBulletinBoardNotifications:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  HFUserNotificationServiceSettings *v32;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v34 = v4;
    obj = v4;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    v5 = 0;
    v6 = 0;
    if (v39)
    {
      v38 = *(_QWORD *)v41;
      v35 = *MEMORY[0x1E0CB9A90];
      v36 = *MEMORY[0x1E0CB9A08];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v41 != v38)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v7);
          v9 = objc_msgSend(v8, "isEnabled", v34);
          objc_opt_class();
          v10 = v8;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
          v12 = v11;

          if (v12)
          {
            objc_msgSend(v12, "cameraUserSettings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "accessModeForPresenceType:", 3) == 2)
            {
              v14 = 1;
            }
            else
            {
              objc_msgSend(v12, "cameraUserSettings");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v18, "accessModeForPresenceType:", 4) == 2;

            }
            objc_msgSend(v12, "condition");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
              v20 = 1;
            else
              v20 = !v14;
            if (v20)
            {
              self->_smartDetectionNotificationsEnabled = objc_msgSend(v10, "isEnabled");
            }
            else
            {
              +[HFCameraSignificantEventConfiguration defaultSmartMotionConfiguration](HFCameraSignificantEventConfiguration, "defaultSmartMotionConfiguration");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "predicateRepresentation");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              -[HFUserNotificationServiceSettings setSmartCameraNotificationCondition:](self, "setSmartCameraNotificationCondition:", v22);
              v44 = v12;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[HFUserNotificationServiceSettings applySettingsToBulletinBoardNotifications:](self, "applySettingsToBulletinBoardNotifications:", v23);

              self->_smartDetectionNotificationsEnabled = 1;
            }
            objc_msgSend(v10, "condition");
            v25 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v25;
          }
          else
          {
            objc_msgSend(v10, "service");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "serviceType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v36);

            if (v17)
            {
              self->_doorbellNotificationsEnabled = objc_msgSend(v10, "isEnabled");
            }
            else
            {
              objc_msgSend(v10, "service");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "serviceType");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isEqualToString:", v35);

              if (v28)
                self->_motionNotificationsEnabled = objc_msgSend(v10, "isEnabled");
            }
          }
          v6 |= v9;

          ++v7;
        }
        while (v39 != v7);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        v39 = v29;
      }
      while (v29);
    }

    objc_msgSend(obj, "na_filter:", &__block_literal_global_164);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "combinedConditionForBulletinBoardNotifications:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HFUserNotificationServiceSettings initWithNotificationsEnabled:condition:smartCameraNotificationCondition:](self, "initWithNotificationsEnabled:condition:smartCameraNotificationCondition:", v6 & 1, v31, v5);

    v32 = self;
    v4 = v34;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

BOOL __72__HFUserNotificationServiceSettings_initWithBulletinBoardNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5 == 0;
}

- (HFUserNotificationServiceSettings)initWithNotificationsEnabled:(BOOL)a3 condition:(id)a4 smartCameraNotificationCondition:(id)a5
{
  id v9;
  id v10;
  HFUserNotificationServiceSettings *v11;
  HFUserNotificationServiceSettings *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFUserNotificationServiceSettings;
  v11 = -[HFUserNotificationServiceSettings init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_notificationsEnabled = a3;
    objc_storeStrong((id *)&v11->_notificationCondition, a4);
    objc_storeStrong((id *)&v12->_smartCameraNotificationCondition, a5);
  }

  return v12;
}

- (id)applySettingsToBulletinBoardNotifications:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke;
  v7[3] = &unk_1EA739AE0;
  v7[4] = self;
  objc_msgSend(a3, "na_map:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:", &__block_literal_global_7_9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9A08]);

  objc_msgSend(v3, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9A90]);

  objc_opt_class();
  v10 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v13, "areSmartDetectionNotificationsEnabled"));
    objc_msgSend(*(id *)(a1 + 32), "smartCameraNotificationCondition");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      v15 = objc_msgSend(v13, "areDoorbellNotificationsEnabled");
    }
    else if (v9)
    {
      v15 = objc_msgSend(v13, "areMotionNotificationsEnabled");
    }
    else
    {
      v15 = objc_msgSend(v13, "areNotificationsEnabled");
    }
    objc_msgSend(v10, "setEnabled:", v15);
    objc_msgSend(*(id *)(a1 + 32), "notificationCondition");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v14;
  objc_msgSend(v10, "setCondition:", v14);

  v17 = (void *)MEMORY[0x1E0D519C0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke_2;
  v21[3] = &unk_1EA7268C8;
  v22 = v10;
  v18 = v10;
  objc_msgSend(v17, "futureWithErrorOnlyHandlerAdapterBlock:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitWithCompletionHandler:", a2);
}

uint64_t __79__HFUserNotificationServiceSettings_applySettingsToBulletinBoardNotifications___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

+ (id)combinedConditionForBulletinBoardNotifications:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  objc_msgSend(v3, "na_filter:", &__block_literal_global_8_8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    objc_msgSend(v4, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "condition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__HFUserNotificationServiceSettings_combinedConditionForBulletinBoardNotifications___block_invoke_2;
    v12[3] = &unk_1EA739B48;
    v5 = v8;
    v13 = v5;
    if (objc_msgSend(v4, "na_all:", v12))
    {
      v6 = v5;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(v3, "na_map:", &__block_literal_global_11_10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "orPredicateWithSubpredicates:", v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "condition");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

BOOL __84__HFUserNotificationServiceSettings_combinedConditionForBulletinBoardNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "condition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __84__HFUserNotificationServiceSettings_combinedConditionForBulletinBoardNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "condition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = objc_msgSend(v4, "isEqual:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __84__HFUserNotificationServiceSettings_combinedConditionForBulletinBoardNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "condition");
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFUserNotificationServiceSettings *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  HFUserNotificationServiceSettings *v8;

  v4 = [HFUserNotificationServiceSettings alloc];
  v5 = -[HFUserNotificationServiceSettings areNotificationsEnabled](self, "areNotificationsEnabled");
  -[HFUserNotificationServiceSettings notificationCondition](self, "notificationCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserNotificationServiceSettings smartCameraNotificationCondition](self, "smartCameraNotificationCondition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFUserNotificationServiceSettings initWithNotificationsEnabled:condition:smartCameraNotificationCondition:](v4, "initWithNotificationsEnabled:condition:smartCameraNotificationCondition:", v5, v6, v7);

  -[HFUserNotificationServiceSettings setDoorbellNotificationsEnabled:](v8, "setDoorbellNotificationsEnabled:", -[HFUserNotificationServiceSettings areDoorbellNotificationsEnabled](self, "areDoorbellNotificationsEnabled"));
  -[HFUserNotificationServiceSettings setSmartDetectionNotificationsEnabled:](v8, "setSmartDetectionNotificationsEnabled:", -[HFUserNotificationServiceSettings areSmartDetectionNotificationsEnabled](self, "areSmartDetectionNotificationsEnabled"));
  -[HFUserNotificationServiceSettings setMotionNotificationsEnabled:](v8, "setMotionNotificationsEnabled:", -[HFUserNotificationServiceSettings areMotionNotificationsEnabled](self, "areMotionNotificationsEnabled"));
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HFMutableUserNotificationServiceSettings *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  HFMutableUserNotificationServiceSettings *v8;

  v4 = [HFMutableUserNotificationServiceSettings alloc];
  v5 = -[HFUserNotificationServiceSettings areNotificationsEnabled](self, "areNotificationsEnabled");
  -[HFUserNotificationServiceSettings notificationCondition](self, "notificationCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserNotificationServiceSettings smartCameraNotificationCondition](self, "smartCameraNotificationCondition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFUserNotificationServiceSettings initWithNotificationsEnabled:condition:smartCameraNotificationCondition:](v4, "initWithNotificationsEnabled:condition:smartCameraNotificationCondition:", v5, v6, v7);

  -[HFUserNotificationServiceSettings setDoorbellNotificationsEnabled:](v8, "setDoorbellNotificationsEnabled:", -[HFUserNotificationServiceSettings areDoorbellNotificationsEnabled](self, "areDoorbellNotificationsEnabled"));
  -[HFUserNotificationServiceSettings setSmartDetectionNotificationsEnabled:](v8, "setSmartDetectionNotificationsEnabled:", -[HFUserNotificationServiceSettings areSmartDetectionNotificationsEnabled](self, "areSmartDetectionNotificationsEnabled"));
  -[HFUserNotificationServiceSettings setMotionNotificationsEnabled:](v8, "setMotionNotificationsEnabled:", -[HFUserNotificationServiceSettings areMotionNotificationsEnabled](self, "areMotionNotificationsEnabled"));
  return v8;
}

- (BOOL)areNotificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  self->_notificationsEnabled = a3;
}

- (BOOL)areDoorbellNotificationsEnabled
{
  return self->_doorbellNotificationsEnabled;
}

- (void)setDoorbellNotificationsEnabled:(BOOL)a3
{
  self->_doorbellNotificationsEnabled = a3;
}

- (BOOL)areMotionNotificationsEnabled
{
  return self->_motionNotificationsEnabled;
}

- (void)setMotionNotificationsEnabled:(BOOL)a3
{
  self->_motionNotificationsEnabled = a3;
}

- (BOOL)areSmartDetectionNotificationsEnabled
{
  return self->_smartDetectionNotificationsEnabled;
}

- (void)setSmartDetectionNotificationsEnabled:(BOOL)a3
{
  self->_smartDetectionNotificationsEnabled = a3;
}

- (NSPredicate)notificationCondition
{
  return self->_notificationCondition;
}

- (void)setNotificationCondition:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCondition, a3);
}

- (NSPredicate)smartCameraNotificationCondition
{
  return self->_smartCameraNotificationCondition;
}

- (void)setSmartCameraNotificationCondition:(id)a3
{
  objc_storeStrong((id *)&self->_smartCameraNotificationCondition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCameraNotificationCondition, 0);
  objc_storeStrong((id *)&self->_notificationCondition, 0);
}

@end
