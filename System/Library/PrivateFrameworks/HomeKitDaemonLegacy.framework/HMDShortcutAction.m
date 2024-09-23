@implementation HMDShortcutAction

- (HMDShortcutAction)initWithSerializedShortcut:(id)a3 uuid:(id)a4 actionSet:(id)a5
{
  id v8;
  HMDShortcutAction *v9;
  void *v10;
  HMDShortcutAction *v11;
  objc_super v13;

  v8 = a3;
  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDShortcutAction;
    v9 = -[HMDAction initWithUUID:actionSet:](&v13, sel_initWithUUID_actionSet_, a4, a5);
    if (v9)
    {
      v10 = (void *)objc_msgSend(v8, "copy");
      __HMDShortcutActionInitializeWithSerializedShortcut(v9, v10);

    }
    self = v9;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)removeShortcut
{
  NSData *shortcutData;

  shortcutData = self->_shortcutData;
  self->_shortcutData = 0;

  return self;
}

- (void)dealloc
{
  WFHomeWorkflowController *controller;
  objc_super v4;

  controller = self->_controller;
  if (controller)
    -[WFHomeWorkflowController cancel](controller, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)HMDShortcutAction;
  -[HMDShortcutAction dealloc](&v4, sel_dealloc);
}

- (unint64_t)type
{
  return 2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *shortcutData;
  void *v6;
  void *v7;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)HMDShortcutAction;
  -[HMDAction dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  shortcutData = self->_shortcutData;
  if (shortcutData)
  {
    v10 = *MEMORY[0x1E0CBA100];
    v11[0] = shortcutData;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (id)stateDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHomeWorkflow homeIdentifier](self->_shortcut, "homeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDShortcutAction getCharacteristicsAndActionSetsFromShortcut:characteristicWriteTuples:homeUUID:]((id *)&self->super.super.super.isa, v3, v4, v5);
  objc_msgSend(v4, "na_map:", &__block_literal_global_1852);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HMDShortcutAction;
  -[HMDAction stateDump](&v11, sel_stateDump);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDShortcutAction requiresDeviceUnlock](self, "requiresDeviceUnlock");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(", Shortcut: [DeviceRequiresUnlock: %@] [Home: %@], [ActionSets: %@], [Characteristic: %@]"), v8, v5, v3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  HMDShortcutAction *v10;
  NSObject *v11;
  void *v12;
  WFHomeWorkflow *shortcut;
  WFHomeWorkflowController *controller;
  void *v15;
  HMDShortcutAction *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (!WorkflowKitLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E89A2500;
    *(_QWORD *)&buf[16] = 0;
    WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (WorkflowKitLibraryCore_frameworkLibrary && self->_controller)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      shortcut = v10->_shortcut;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = shortcut;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Executing shortcut action : %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_initWeak((id *)buf, v10);
    controller = self->_controller;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__HMDShortcutAction_executeWithSource_clientName_completionHandler___block_invoke;
    v20[3] = &unk_1E89A2420;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v8;
    -[WFHomeWorkflowController startWithCompletionHandler:](controller, "startWithCompletionHandler:", v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@The shortcut action is unavailable to execute", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v8 + 2))(v8, v19);

    }
  }

}

- (BOOL)requiresDeviceUnlock
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__HMDShortcutAction_requiresDeviceUnlock__block_invoke;
  v4[3] = &unk_1E89A2448;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__HMDShortcutAction_requiresDeviceUnlock__block_invoke_2;
  v3[3] = &unk_1E89A2448;
  return -[HMDShortcutAction doesAnyCharacteristicWriteTuplePassTest:orDoesAnyActionSetPassTest:](self, v4, v3);
}

- (BOOL)isUnsecuringAction
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__HMDShortcutAction_isUnsecuringAction__block_invoke;
  v4[3] = &unk_1E89A2448;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__HMDShortcutAction_isUnsecuringAction__block_invoke_2;
  v3[3] = &unk_1E89A2448;
  return -[HMDShortcutAction doesAnyCharacteristicWriteTuplePassTest:orDoesAnyActionSetPassTest:](self, v4, v3);
}

- (unint64_t)entitlementsForNotification
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDShortcutAction;
  return -[HMDAction entitlementsForNotification](&v3, sel_entitlementsForNotification) | 4;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  return 0;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  _QWORD *v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDShortcutAction;
  if (-[HMDAction isCompatibleWithAction:](&v7, sel_isCompatibleWithAction_, v4))
    v5 = -[NSData isEqual:](self->_shortcutData, "isEqual:", v4[3]);
  else
    v5 = 0;

  return v5;
}

- (id)associatedAccessories
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (HMDShortcutAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  id v18;
  HMDShortcutAction *v19;
  void *v20;
  HMDShortcutAction *v21;
  void *v22;
  uint64_t v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_opt_class();
    v10 = objc_opt_isKindOfClass() & 1;
    if (v10)
      v11 = v8;
    else
      v11 = 0;
    v12 = v11;
    if (!v10)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
        v21 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      goto LABEL_33;
    }
    objc_msgSend(v8, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v21 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      goto LABEL_32;
    }
    objc_msgSend(v8, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (!v9
        || ((v15 = v9, objc_opt_class(), (v16 = objc_opt_isKindOfClass() & 1) == 0)
          ? (v17 = 0)
          : (v17 = v15),
            v18 = v17,
            v15,
            v16))
      {
        v25.receiver = self;
        v25.super_class = (Class)HMDShortcutAction;
        v19 = -[HMDAction initWithUUID:actionSet:](&v25, sel_initWithUUID_actionSet_, v13, v9);
        if (v19)
        {
          v20 = (void *)objc_msgSend(v14, "copy");
          __HMDShortcutActionInitializeWithSerializedShortcut(v19, v20);

        }
        self = v19;

        v21 = self;
        goto LABEL_31;
      }
      if (a5)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v23 = 22;
        goto LABEL_29;
      }
    }
    else if (a5)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = 3;
LABEL_29:
      objc_msgSend(v22, "hmErrorWithCode:", v23);
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

LABEL_32:
LABEL_33:

      goto LABEL_34;
    }
    v21 = 0;
    goto LABEL_31;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_34:

  return v21;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  if (a4 < 4)
  {
    v5 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDShortcutAction;
    -[HMDAction modelObjectWithChangeType:version:](&v10, sel_modelObjectWithChangeType_version_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "setData:", self->_shortcutData);

  }
  return v5;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    if (self)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v17;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to process model update with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }
    objc_msgSend(v10, "responseHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v10, "responseHandler");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v19)[2](v19, v14, 0);

    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)HMDShortcutAction;
    -[HMDAction transactionObjectUpdated:newValues:message:](&v20, sel_transactionObjectUpdated_newValues_message_, v8, v11, v10);
  }

}

- (HMDShortcutAction)initWithCoder:(id)a3
{
  id v4;
  HMDShortcutAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDShortcutAction;
  v5 = -[HMDAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CBA100]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __HMDShortcutActionInitializeWithSerializedShortcut(v5, v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *shortcutData;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HMDShortcutAction;
  -[HMDAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  shortcutData = self->_shortcutData;
  if (shortcutData)
    objc_msgSend(v4, "encodeObject:forKey:", shortcutData, *MEMORY[0x1E0CBA100]);

}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDShortcutAction *v4;
  NSData *shortcutData;
  void *v6;
  void *v7;
  HMDShortcutAction *v8;

  v4 = +[HMDShortcutAction allocWithZone:](HMDShortcutAction, "allocWithZone:", a3);
  shortcutData = self->_shortcutData;
  -[HMDAction uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAction actionSet](self, "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDShortcutAction initWithSerializedShortcut:uuid:actionSet:](v4, "initWithSerializedShortcut:uuid:actionSet:", shortcutData, v6, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_shortcutData, 0);
}

BOOL __39__HMDShortcutAction_isUnsecuringAction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *Property;
  const char *v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__HMDShortcutAction_doesAnyCharacteristicTupleUnsecureAHome___block_invoke;
    v20[3] = &unk_1E89A2498;
    v5 = v4;
    v21 = v5;
    objc_msgSend(v3, "na_firstObjectPassingTest:", v20);
    Property = (void *)objc_claimAutoreleasedReturnValue();
    v8 = Property;
    if (Property)
      Property = objc_getProperty(Property, v7, 8, 1);
    v9 = Property;

    v10 = v9 != 0;
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v2;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accessory");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("does not");
      *(_DWORD *)buf = 138543874;
      v23 = v14;
      v24 = 2112;
      if (v9)
        v18 = &stru_1E89C3E38;
      v25 = v16;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[%@] %@ requires device to be unlock", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __39__HMDShortcutAction_isUnsecuringAction__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__HMDShortcutAction_doesActionSetContainUnsecuringAction___block_invoke;
    v11[3] = &unk_1E89B8BB8;
    v11[4] = v2;
    v4 = -[HMDShortcutAction doesActionSetContainItemsPassingTest:actionSetUUIDs:](v2, v11, v3);
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = v2;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Does this shortcut action contain any unsecuring actions: [%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)doesAnyCharacteristicWriteTuplePassTest:(void *)a3 orDoesAnyActionSetPassTest:
{
  uint64_t (**v5)(id, void *);
  uint64_t (**v6)(id, void *);
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  void *v28;
  _BYTE buf[24];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!WorkflowKitLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E89A2500;
      *(_QWORD *)&buf[16] = 0;
      WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (WorkflowKitLibraryCore_frameworkLibrary)
    {
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Shortcuts framework is available on this OS", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8[4], "homeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actionSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", v13);

      if ((v17 & 1) != 0)
      {
        -[HMDShortcutAction getCharacteristicsAndActionSetsFromShortcut:characteristicWriteTuples:homeUUID:](v8, v11, v12, v13);
        if (objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
        {
          if ((v5[2](v5, v12) & 1) != 0)
            v18 = 1;
          else
            v18 = v6[2](v6, v11);
          goto LABEL_18;
        }
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = v8;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v22;
          v23 = "%{public}@There are no characteristics or actionSets present in this shortcut.";
          v24 = v21;
          v25 = OS_LOG_TYPE_INFO;
          v26 = 12;
          goto LABEL_15;
        }
      }
      else
      {
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = v8;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v13;
          *(_WORD *)&buf[22] = 2112;
          v30 = v15;
          v23 = "%{public}@This shortcut action does not belong to this home. Current: %@, Expected Home UUID: %@";
          v24 = v21;
          v25 = OS_LOG_TYPE_ERROR;
          v26 = 32;
LABEL_15:
          _os_log_impl(&dword_1CD062000, v24, v25, v23, buf, v26);

        }
      }

      objc_autoreleasePoolPop(v19);
      v18 = 0;
LABEL_18:

      objc_autoreleasePoolPop(v28);
      goto LABEL_19;
    }
  }
  v18 = 0;
LABEL_19:

  return v18;
}

- (void)getCharacteristicsAndActionSetsFromShortcut:(void *)a3 characteristicWriteTuples:(void *)a4 homeUUID:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(a1[4], "shortcutsDictionaryRepresentations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v14;
      v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to deserialize shortcut dictionary [%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __100__HMDShortcutAction_getCharacteristicsAndActionSetsFromShortcut_characteristicWriteTuples_homeUUID___block_invoke;
    v30[3] = &unk_1E89A24C0;
    v30[4] = v12;
    v15 = v7;
    v31 = v15;
    v16 = v8;
    v32 = v16;
    v33 = v9;
    v17 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30));
    v18 = v12;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Found actionSets from shortcut dictionary : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v26 = (void *)MEMORY[0x1D17BA0A0](v21, v22, v23, v24, v25);
    v27 = v18;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v29;
      v36 = 2112;
      v37 = v16;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Found characteristics from shortcut dictionary : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);

  }
}

void __100__HMDShortcutAction_getCharacteristicsAndActionSetsFromShortcut_characteristicWriteTuples_homeUUID___block_invoke(void **a1, void *a2)
{
  -[HMDShortcutAction unpackActionsAndActionSets:actionSets:characteristicWriteTuples:homeUUID:](a1[4], a2, a1[5], a1[6], a1[7]);
}

- (void)unpackActionsAndActionSets:(void *)a3 actionSets:(void *)a4 characteristicWriteTuples:(void *)a5 homeUUID:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  char v62;
  id v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  const char *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  const char *v82;
  void *v83;
  id v84;
  NSObject *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  const char *v91;
  void *v92;
  id v93;
  NSObject *v94;
  void *v95;
  void *v96;
  id v97;
  NSObject *v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  id v105;
  NSObject *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  uint64_t v114;
  void *v115;
  void *v116;
  char v117;
  void *v118;
  id v119;
  NSObject *v120;
  void *v121;
  void *v122;
  id v123;
  NSObject *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  NSObject *v133;
  void *v134;
  HMDCharacteristicWriteTuple *v135;
  id v136;
  id v137;
  HMDCharacteristicWriteTuple *v138;
  void *v139;
  id v140;
  NSObject *v141;
  void *v142;
  void *v143;
  id v144;
  NSObject *v145;
  void *v146;
  void *v147;
  id v148;
  NSObject *v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  NSObject *v157;
  void *v158;
  void *v159;
  id v160;
  NSObject *v161;
  void *v162;
  void *v163;
  id v164;
  NSObject *v165;
  void *v166;
  const char *v167;
  void *v168;
  void *v169;
  id v170;
  NSObject *v171;
  void *v172;
  void *v173;
  id v174;
  NSObject *v175;
  void *v176;
  __int128 v177;
  void *v178;
  void *v179;
  id v180;
  id v181;
  id v182;
  id v183;
  void *v184;
  id v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  uint64_t v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  id v204;
  void *v205;
  id v206;
  uint64_t v207;
  id obj;
  uint64_t v209;
  id v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  uint8_t v223[128];
  uint8_t v224[4];
  void *v225;
  __int16 v226;
  void *v227;
  uint8_t v228[4];
  void *v229;
  __int16 v230;
  void *v231;
  _BYTE buf[22];
  __int16 v233;
  id v234;
  __int16 v235;
  void *v236;
  __int16 v237;
  id v238;
  uint64_t v239;

  v239 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v206 = a4;
  v204 = a5;
  if (a1)
  {
    v11 = *MEMORY[0x1E0CB81F0];
    objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x1E0CB81F0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB81F8]) & 1) != 0)
    {
      objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x1E0CB8200]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB8208]);

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v9, "hmf_dataForKey:", *MEMORY[0x1E0CB81E8]);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v154 = 0;
          v155 = (void *)MEMORY[0x1D17BA0A0]();
          v156 = a1;
          HMFGetOSLogHandle();
          v157 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v158;
            _os_log_impl(&dword_1CD062000, v157, OS_LOG_TYPE_ERROR, "%{public}@Did not find any serialized homekit data in this shortcut dictionary", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v155);
          goto LABEL_159;
        }
        v201 = (void *)v15;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA730]), "initWithData:", v15);
        v202 = v16;
        if (!v16)
        {
          v159 = (void *)MEMORY[0x1D17BA0A0]();
          v160 = a1;
          HMFGetOSLogHandle();
          v161 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v162;
            _os_log_impl(&dword_1CD062000, v161, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize PB actionSet data", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v159);
          v154 = v201;
          goto LABEL_158;
        }
        v17 = (void *)MEMORY[0x1E0CB3A28];
        v18 = v16;
        objc_msgSend(v16, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hmf_UUIDWithBytesAsData:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v203 = (void *)v20;
        if (v20)
        {
          if ((objc_msgSend(v18, "hasHomeUUID") & 1) != 0)
          {
            v21 = (void *)MEMORY[0x1E0CB3A28];
            objc_msgSend(v18, "homeUUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "hmf_UUIDWithBytesAsData:", v22);
            v23 = objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v192 = (void *)v23;
              if ((objc_msgSend(v204, "isEqual:", v23) & 1) != 0)
              {
                v180 = v10;
                v181 = v9;
                objc_msgSend(v10, "addObject:", v203);
                objc_msgSend(a1, "actionSet");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "home");
                v205 = (void *)objc_claimAutoreleasedReturnValue();

                v213 = 0u;
                v214 = 0u;
                v211 = 0u;
                v212 = 0u;
                objc_msgSend(v202, "actions");
                obj = (id)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v211, v223, 16);
                if (!v25)
                  goto LABEL_132;
                v27 = v25;
                v209 = *(_QWORD *)v212;
                *(_QWORD *)&v26 = 138544130;
                v177 = v26;
                v199 = a1;
                while (1)
                {
                  v28 = 0;
                  v207 = v27;
                  do
                  {
                    if (*(_QWORD *)v212 != v209)
                      objc_enumerationMutation(obj);
                    v29 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * v28);
                    if (objc_msgSend(v29, "type", v177) != 1)
                    {
                      v63 = 0;
                      goto LABEL_123;
                    }
                    objc_msgSend(v29, "characteristicWriteAction");
                    v30 = (id)objc_claimAutoreleasedReturnValue();
                    v31 = v205;
                    objc_msgSend(v30, "characteristicReference");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v32, "hasUniqueIdentifier") & 1) != 0)
                    {
                      if ((objc_msgSend(v32, "hasServiceReference") & 1) != 0)
                      {
                        v33 = (void *)MEMORY[0x1E0CB3A28];
                        objc_msgSend(v32, "uniqueIdentifier");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v33, "hmf_UUIDWithBytesAsData:", v34);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v35)
                        {
                          v70 = (void *)MEMORY[0x1D17BA0A0]();
                          v71 = a1;
                          HMFGetOSLogHandle();
                          v72 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                          {
                            HMFGetLogIdentifier();
                            v73 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543362;
                            *(_QWORD *)&buf[4] = v73;
                            _os_log_impl(&dword_1CD062000, v72, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode characteristic uniqueIdentifier", buf, 0xCu);

                          }
                          objc_autoreleasePoolPop(v70);
                          v63 = 0;
                          goto LABEL_111;
                        }
                        objc_msgSend(v32, "serviceReference");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v36, "hasUniqueIdentifier") & 1) != 0)
                        {
                          if ((objc_msgSend(v36, "hasAccessoryReference") & 1) != 0)
                          {
                            objc_msgSend(v36, "accessoryReference");
                            v37 = (void *)objc_claimAutoreleasedReturnValue();
                            v200 = v37;
                            if ((objc_msgSend(v37, "hasUniqueIdentifier") & 1) != 0)
                            {
                              if ((objc_msgSend(v37, "hasHomeReference") & 1) != 0)
                              {
                                v198 = v36;
                                v38 = (void *)MEMORY[0x1E0CB3A28];
                                objc_msgSend(v37, "uniqueIdentifier");
                                v39 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v38, "hmf_UUIDWithBytesAsData:", v39);
                                v40 = (void *)objc_claimAutoreleasedReturnValue();

                                v197 = v40;
                                if (v40)
                                {
                                  objc_msgSend(v37, "homeReference");
                                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                                  v191 = v41;
                                  if ((objc_msgSend(v41, "hasUniqueIdentifier") & 1) != 0)
                                  {
                                    v193 = (void *)MEMORY[0x1E0CB3A28];
                                    objc_msgSend(v41, "uniqueIdentifier");
                                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v193, "hmf_UUIDWithBytesAsData:", v42);
                                    v184 = (void *)objc_claimAutoreleasedReturnValue();

                                    objc_msgSend(v41, "uniqueIdentifier");
                                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                                    if (v43)
                                    {
                                      objc_msgSend(v31, "spiClientIdentifier");
                                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                                      v45 = objc_msgSend(v184, "isEqual:", v44);

                                      if ((v45 & 1) != 0
                                        || (objc_msgSend(v31, "uuid"),
                                            v46 = (void *)objc_claimAutoreleasedReturnValue(),
                                            v47 = objc_msgSend(v184, "isEqual:", v46),
                                            v46,
                                            (v47 & 1) != 0))
                                      {
                                        objc_msgSend(v31, "accessoryWithSPIClientIdentifier:", v40);
                                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (!v48)
                                        {
                                          objc_msgSend(v31, "accessoryWithUUID:", v40);
                                          v48 = (void *)objc_claimAutoreleasedReturnValue();
                                        }
                                        v49 = v48;
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                          v50 = v49;
                                        else
                                          v50 = 0;
                                        v51 = v50;
                                        v178 = v49;

                                        v179 = v51;
                                        if (v51)
                                        {
                                          v52 = (void *)MEMORY[0x1E0CB3A28];
                                          objc_msgSend(v198, "uniqueIdentifier");
                                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v52, "hmf_UUIDWithBytesAsData:", v53);
                                          v54 = objc_claimAutoreleasedReturnValue();

                                          v189 = (void *)v54;
                                          if (!v54)
                                          {
                                            v55 = (void *)MEMORY[0x1D17BA0A0]();
                                            v56 = a1;
                                            HMFGetOSLogHandle();
                                            v57 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                                            {
                                              HMFGetLogIdentifier();
                                              v58 = (void *)objc_claimAutoreleasedReturnValue();
                                              *(_DWORD *)buf = 138543362;
                                              *(_QWORD *)&buf[4] = v58;
                                              _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode service uniqueIdentifier", buf, 0xCu);

                                            }
                                            objc_autoreleasePoolPop(v55);
                                            v51 = v179;
                                          }
                                          v221 = 0u;
                                          v222 = 0u;
                                          v219 = 0u;
                                          v220 = 0u;
                                          objc_msgSend(v51, "services");
                                          v182 = (id)objc_claimAutoreleasedReturnValue();
                                          v36 = v198;
                                          v187 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v219, buf, 16);
                                          if (v187)
                                          {
                                            v185 = *(id *)v220;
LABEL_40:
                                            v59 = 0;
                                            while (1)
                                            {
                                              if (*(id *)v220 != v185)
                                                objc_enumerationMutation(v182);
                                              v194 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * v59);
                                              objc_msgSend(v194, "uuid");
                                              v60 = (void *)objc_claimAutoreleasedReturnValue();
                                              if (objc_msgSend(v60, "isEqual:", v189))
                                                break;
                                              objc_msgSend(v194, "spiClientIdentifier");
                                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                                              v62 = objc_msgSend(v61, "isEqual:", v189);

                                              v36 = v198;
                                              if ((v62 & 1) != 0)
                                                goto LABEL_86;
                                              if (v187 == ++v59)
                                              {
                                                v187 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v219, buf, 16);
                                                if (v187)
                                                  goto LABEL_40;
                                                goto LABEL_47;
                                              }
                                            }

LABEL_86:
                                            v113 = v194;

                                            if (!v113)
                                              goto LABEL_96;
                                            v217 = 0u;
                                            v218 = 0u;
                                            v215 = 0u;
                                            v216 = 0u;
                                            v183 = v113;
                                            objc_msgSend(v113, "characteristics");
                                            v186 = (id)objc_claimAutoreleasedReturnValue();
                                            v196 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v215, v228, 16);
                                            if (v196)
                                            {
                                              v188 = *(_QWORD *)v216;
LABEL_89:
                                              v114 = 0;
                                              while (1)
                                              {
                                                if (*(_QWORD *)v216 != v188)
                                                  objc_enumerationMutation(v186);
                                                v115 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * v114);
                                                objc_msgSend(v115, "spiClientIdentifier");
                                                v116 = (void *)objc_claimAutoreleasedReturnValue();
                                                v117 = objc_msgSend(v116, "isEqual:", v35);

                                                if ((v117 & 1) != 0)
                                                  break;
                                                ++v114;
                                                v36 = v198;
                                                if (v196 == v114)
                                                {
                                                  v196 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v215, v228, 16);
                                                  if (v196)
                                                    goto LABEL_89;
                                                  goto LABEL_95;
                                                }
                                              }
                                              v63 = v115;

                                              v36 = v198;
                                              if (v63)
                                                goto LABEL_103;
                                            }
                                            else
                                            {
LABEL_95:

                                            }
                                            v122 = (void *)MEMORY[0x1D17BA0A0]();
                                            v123 = a1;
                                            HMFGetOSLogHandle();
                                            v124 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
                                            {
                                              HMFGetLogIdentifier();
                                              v125 = (void *)objc_claimAutoreleasedReturnValue();
                                              *(_DWORD *)v224 = 138543618;
                                              v225 = v125;
                                              v226 = 2112;
                                              v227 = v35;
                                              _os_log_impl(&dword_1CD062000, v124, OS_LOG_TYPE_INFO, "%{public}@Unable to find the characteristic with uniqueIdentifier: %@", v224, 0x16u);

                                              v36 = v198;
                                            }

                                            objc_autoreleasePoolPop(v122);
                                            v63 = 0;
LABEL_103:

                                          }
                                          else
                                          {
LABEL_47:

LABEL_96:
                                            v118 = (void *)MEMORY[0x1D17BA0A0]();
                                            v119 = a1;
                                            HMFGetOSLogHandle();
                                            v120 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
                                            {
                                              HMFGetLogIdentifier();
                                              v121 = (void *)objc_claimAutoreleasedReturnValue();
                                              *(_DWORD *)v228 = 138543618;
                                              v229 = v121;
                                              v230 = 2112;
                                              v231 = v189;
                                              _os_log_impl(&dword_1CD062000, v120, OS_LOG_TYPE_INFO, "%{public}@Unable to find the service with uniqueIdentifier : %@", v228, 0x16u);

                                              v36 = v198;
                                            }

                                            objc_autoreleasePoolPop(v118);
                                            v63 = 0;
                                          }
                                          v40 = v197;

                                        }
                                        else
                                        {
                                          v104 = (void *)MEMORY[0x1D17BA0A0]();
                                          v105 = a1;
                                          HMFGetOSLogHandle();
                                          v106 = objc_claimAutoreleasedReturnValue();
                                          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                                          {
                                            HMFGetLogIdentifier();
                                            v107 = (void *)objc_claimAutoreleasedReturnValue();
                                            *(_DWORD *)buf = 138543618;
                                            *(_QWORD *)&buf[4] = v107;
                                            *(_WORD *)&buf[12] = 2112;
                                            *(_QWORD *)&buf[14] = v197;
                                            _os_log_impl(&dword_1CD062000, v106, OS_LOG_TYPE_ERROR, "%{public}@Can't find accessory %@", buf, 0x16u);

                                          }
                                          objc_autoreleasePoolPop(v104);
                                          v63 = 0;
                                          v40 = v197;
                                          v36 = v198;
                                        }
                                        v37 = v200;

                                      }
                                      else
                                      {
                                        v108 = (void *)MEMORY[0x1D17BA0A0]();
                                        v195 = a1;
                                        HMFGetOSLogHandle();
                                        v109 = objc_claimAutoreleasedReturnValue();
                                        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                                        {
                                          HMFGetLogIdentifier();
                                          v190 = v108;
                                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v31, "spiClientIdentifier");
                                          v111 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v31, "uuid");
                                          v112 = (void *)objc_claimAutoreleasedReturnValue();
                                          *(_DWORD *)buf = v177;
                                          *(_QWORD *)&buf[4] = v110;
                                          *(_WORD *)&buf[12] = 2112;
                                          *(_QWORD *)&buf[14] = v184;
                                          v233 = 2112;
                                          v234 = v111;
                                          v235 = 2112;
                                          v236 = v112;
                                          _os_log_impl(&dword_1CD062000, v109, OS_LOG_TYPE_ERROR, "%{public}@Trying to dereference characteristic reference from different home [Looking for :%@] against [spiIdenfitifer : %@], [UUID : %@]", buf, 0x2Au);

                                          v40 = v197;
                                          v37 = v200;

                                          v108 = v190;
                                        }

                                        objc_autoreleasePoolPop(v108);
                                        v63 = 0;
                                        v36 = v198;
                                      }
                                    }
                                    else
                                    {
                                      v100 = (void *)MEMORY[0x1D17BA0A0]();
                                      v101 = a1;
                                      HMFGetOSLogHandle();
                                      v102 = objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                                      {
                                        HMFGetLogIdentifier();
                                        v103 = (void *)objc_claimAutoreleasedReturnValue();
                                        *(_DWORD *)buf = 138543362;
                                        *(_QWORD *)&buf[4] = v103;
                                        _os_log_impl(&dword_1CD062000, v102, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Home uniqueIdentifier", buf, 0xCu);

                                      }
                                      objc_autoreleasePoolPop(v100);
                                      v63 = 0;
                                      v40 = v197;
                                      v36 = v198;
                                      v37 = v200;
                                    }

                                  }
                                  else
                                  {
                                    v96 = (void *)MEMORY[0x1D17BA0A0]();
                                    v97 = a1;
                                    HMFGetOSLogHandle();
                                    v98 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                                    {
                                      HMFGetLogIdentifier();
                                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                                      *(_DWORD *)buf = 138543362;
                                      *(_QWORD *)&buf[4] = v99;
                                      _os_log_impl(&dword_1CD062000, v98, OS_LOG_TYPE_ERROR, "%{public}@Characteristic write action's HomeReference does not have uniqueIdentifier set", buf, 0xCu);

                                    }
                                    objc_autoreleasePoolPop(v96);
                                    v63 = 0;
                                    v40 = v197;
                                    v36 = v198;
                                    v37 = v200;
                                  }

                                }
                                else
                                {
                                  v92 = (void *)MEMORY[0x1D17BA0A0]();
                                  v93 = a1;
                                  HMFGetOSLogHandle();
                                  v94 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                                  {
                                    HMFGetLogIdentifier();
                                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)buf = 138543362;
                                    *(_QWORD *)&buf[4] = v95;
                                    _os_log_impl(&dword_1CD062000, v94, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode accessory uniqueIdentifier", buf, 0xCu);

                                  }
                                  objc_autoreleasePoolPop(v92);
                                  v63 = 0;
                                  v40 = 0;
                                  v36 = v198;
                                  v37 = v200;
                                }

LABEL_109:
LABEL_110:

LABEL_111:
                                goto LABEL_112;
                              }
                              v83 = (void *)MEMORY[0x1D17BA0A0]();
                              v84 = a1;
                              HMFGetOSLogHandle();
                              v85 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                              {
                                HMFGetLogIdentifier();
                                v86 = v31;
                                v87 = v35;
                                v88 = v36;
                                v89 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138543362;
                                *(_QWORD *)&buf[4] = v89;
                                v90 = v85;
                                v91 = "%{public}@Characteristic write action does not have home reference";
LABEL_68:
                                _os_log_impl(&dword_1CD062000, v90, OS_LOG_TYPE_ERROR, v91, buf, 0xCu);

                                v36 = v88;
                                v35 = v87;
                                v31 = v86;
                                a1 = v199;
                              }
                            }
                            else
                            {
                              v83 = (void *)MEMORY[0x1D17BA0A0]();
                              v84 = a1;
                              HMFGetOSLogHandle();
                              v85 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                              {
                                HMFGetLogIdentifier();
                                v86 = v31;
                                v87 = v35;
                                v88 = v36;
                                v89 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138543362;
                                *(_QWORD *)&buf[4] = v89;
                                v90 = v85;
                                v91 = "%{public}@Characteristic write action does not have accessory uniqueIdentifier";
                                goto LABEL_68;
                              }
                            }

                            objc_autoreleasePoolPop(v83);
                            v63 = 0;
                            v37 = v200;
                            goto LABEL_109;
                          }
                          v74 = (void *)MEMORY[0x1D17BA0A0]();
                          v75 = a1;
                          HMFGetOSLogHandle();
                          v76 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                          {
                            HMFGetLogIdentifier();
                            v77 = v31;
                            v78 = v35;
                            v79 = v36;
                            v80 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543362;
                            *(_QWORD *)&buf[4] = v80;
                            v81 = v76;
                            v82 = "%{public}@Characteristic write action does not have reference to the accessory";
LABEL_62:
                            _os_log_impl(&dword_1CD062000, v81, OS_LOG_TYPE_ERROR, v82, buf, 0xCu);

                            v36 = v79;
                            v35 = v78;
                            v31 = v77;
                            a1 = v199;
                          }
                        }
                        else
                        {
                          v74 = (void *)MEMORY[0x1D17BA0A0]();
                          v75 = a1;
                          HMFGetOSLogHandle();
                          v76 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                          {
                            HMFGetLogIdentifier();
                            v77 = v31;
                            v78 = v35;
                            v79 = v36;
                            v80 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543362;
                            *(_QWORD *)&buf[4] = v80;
                            v81 = v76;
                            v82 = "%{public}@Characteristic write action's service uniqueIdentifier is nil'";
                            goto LABEL_62;
                          }
                        }

                        objc_autoreleasePoolPop(v74);
                        v63 = 0;
                        goto LABEL_110;
                      }
                      v64 = (void *)MEMORY[0x1D17BA0A0]();
                      v65 = a1;
                      HMFGetOSLogHandle();
                      v66 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        *(_QWORD *)&buf[4] = v67;
                        v68 = v66;
                        v69 = "%{public}@Characteristic write action does not have reference to the service";
                        goto LABEL_53;
                      }
                    }
                    else
                    {
                      v64 = (void *)MEMORY[0x1D17BA0A0]();
                      v65 = a1;
                      HMFGetOSLogHandle();
                      v66 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        *(_QWORD *)&buf[4] = v67;
                        v68 = v66;
                        v69 = "%{public}@Characteristic write action does not have reference to the characteristic";
LABEL_53:
                        _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_ERROR, v69, buf, 0xCu);

                      }
                    }

                    objc_autoreleasePoolPop(v64);
                    v63 = 0;
LABEL_112:

                    v126 = (void *)MEMORY[0x1E0CB3710];
                    objc_msgSend(MEMORY[0x1E0CBA480], "allowedTargetValueClassesForShortcuts");
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "targetValue");
                    v128 = (void *)objc_claimAutoreleasedReturnValue();
                    v210 = 0;
                    objc_msgSend(v126, "unarchivedObjectOfClasses:fromData:error:", v127, v128, &v210);
                    v129 = (void *)objc_claimAutoreleasedReturnValue();
                    v130 = v210;

                    if (v130)
                    {
                      v131 = (void *)MEMORY[0x1D17BA0A0]();
                      v132 = a1;
                      HMFGetOSLogHandle();
                      v133 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v134 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544386;
                        *(_QWORD *)&buf[4] = v134;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = v130;
                        v233 = 2112;
                        v234 = v63;
                        v235 = 2112;
                        v236 = v203;
                        v237 = 2112;
                        v238 = v204;
                        _os_log_impl(&dword_1CD062000, v133, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive allowed target value from target value data (%@) for characteristic: %@ in action set: %@ home: %@", buf, 0x34u);

                      }
                      objc_autoreleasePoolPop(v131);
                    }

                    if (v63)
                    {
                      if (v129)
                      {
                        v135 = [HMDCharacteristicWriteTuple alloc];
                        v136 = v63;
                        v137 = v129;
                        if (v135)
                        {
                          *(_QWORD *)buf = v135;
                          *(_QWORD *)&buf[8] = HMDCharacteristicWriteTuple;
                          v138 = (HMDCharacteristicWriteTuple *)objc_msgSendSuper2((objc_super *)buf, sel_init);
                          v135 = v138;
                          if (v138)
                          {
                            objc_storeStrong((id *)&v138->_characteristic, v63);
                            objc_storeStrong(&v135->_targetValue, v129);
                          }
                        }

                        objc_msgSend(v206, "addObject:", v135);
                        v63 = v136;
                      }
                      else
                      {
                        v143 = (void *)MEMORY[0x1D17BA0A0]();
                        v144 = a1;
                        HMFGetOSLogHandle();
                        v145 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543362;
                          *(_QWORD *)&buf[4] = v146;
                          _os_log_impl(&dword_1CD062000, v145, OS_LOG_TYPE_INFO, "%{public}@Did not find the target value belonging to the write action", buf, 0xCu);

                        }
                        objc_autoreleasePoolPop(v143);
                      }
                      v27 = v207;
                      goto LABEL_130;
                    }
                    v63 = v129;
                    v27 = v207;
LABEL_123:
                    v139 = (void *)MEMORY[0x1D17BA0A0]();
                    v140 = a1;
                    HMFGetOSLogHandle();
                    v141 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v142 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      *(_QWORD *)&buf[4] = v142;
                      _os_log_impl(&dword_1CD062000, v141, OS_LOG_TYPE_INFO, "%{public}@Did not find the accessory/characteristic belonging to the write action", buf, 0xCu);

                    }
                    objc_autoreleasePoolPop(v139);
LABEL_130:

                    ++v28;
                  }
                  while (v28 != v27);
                  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v211, v223, 16);
                  if (!v27)
                  {
LABEL_132:

                    v10 = v180;
                    v9 = v181;
                    goto LABEL_155;
                  }
                }
              }
              v173 = (void *)MEMORY[0x1D17BA0A0]();
              v174 = a1;
              HMFGetOSLogHandle();
              v175 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v176;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v204;
                v233 = 2112;
                v234 = v192;
                _os_log_impl(&dword_1CD062000, v175, OS_LOG_TYPE_ERROR, "%{public}@Cannot deserialize actionSet for different home. expected home :%@, found home :%@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v173);
LABEL_155:
              v154 = v201;
              v168 = v192;
            }
            else
            {
              v168 = 0;
              v169 = (void *)MEMORY[0x1D17BA0A0]();
              v170 = a1;
              HMFGetOSLogHandle();
              v171 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v172;
                _os_log_impl(&dword_1CD062000, v171, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Home UUID", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v169);
              v154 = v201;
            }

            goto LABEL_157;
          }
          v163 = (void *)MEMORY[0x1D17BA0A0]();
          v164 = a1;
          HMFGetOSLogHandle();
          v165 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v166;
            v167 = "%{public}@homeUUID not set while decoding ActionSet";
            goto LABEL_147;
          }
        }
        else
        {
          v163 = (void *)MEMORY[0x1D17BA0A0]();
          v164 = a1;
          HMFGetOSLogHandle();
          v165 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v166;
            v167 = "%{public}@Couldn't decode ActionSet UUID";
LABEL_147:
            _os_log_impl(&dword_1CD062000, v165, OS_LOG_TYPE_ERROR, v167, buf, 0xCu);

          }
        }

        objc_autoreleasePoolPop(v163);
        v154 = v201;
LABEL_157:

LABEL_158:
LABEL_159:

        goto LABEL_160;
      }
    }
    else
    {

    }
    v147 = (void *)MEMORY[0x1D17BA0A0]();
    v148 = a1;
    HMFGetOSLogHandle();
    v149 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v150 = v10;
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmf_stringForKey:", v11);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x1E0CB8200]);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v151;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v152;
      v233 = 2112;
      v234 = v153;
      _os_log_impl(&dword_1CD062000, v149, OS_LOG_TYPE_ERROR, "%{public}@Protobuf version mismatch : ProtoKey: %@, ProtoVersion: %@", buf, 0x20u);

      v10 = v150;
    }

    objc_autoreleasePoolPop(v147);
  }
LABEL_160:

}

uint64_t __58__HMDShortcutAction_doesActionSetContainUnsecuringAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "containsUnsecuringAction");
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("does not");
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    if ((_DWORD)v4)
      v9 = CFSTR("does");
    v14 = v9;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@ActionSet %@ unsecure the home : %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);

  return v4;
}

- (uint64_t)doesActionSetContainItemsPassingTest:(void *)a3 actionSetUUIDs:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HMDShortcutAction_doesActionSetContainItemsPassingTest_actionSetUUIDs___block_invoke;
  v12[3] = &unk_1E89A2470;
  v13 = v7;
  v14 = a1;
  v8 = v5;
  v15 = v8;
  v9 = v7;
  v10 = objc_msgSend(v6, "na_any:", v12);

  return v10;
}

uint64_t __73__HMDShortcutAction_doesActionSetContainItemsPassingTest_actionSetUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqual:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "spiClientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v3);

    if (v6)
      goto LABEL_4;
    objc_msgSend(*(id *)(a1 + 32), "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionSetWithUUID:", v3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Could not find actionSet based on actionSet.uuid. Now searching using spiClientIdentifier", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v14, "actionSets");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __73__HMDShortcutAction_doesActionSetContainItemsPassingTest_actionSetUUIDs___block_invoke_132;
      v27[3] = &unk_1E89B8BB8;
      v21 = v3;
      v28 = v21;
      objc_msgSend(v20, "na_firstObjectPassingTest:", v27);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v26;
          v31 = 2112;
          v32 = v21;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not find actionSet [%@]", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        v13 = 0;
        v15 = v28;
        goto LABEL_13;
      }

    }
    v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_13:

    goto LABEL_14;
  }

LABEL_4:
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "spiClientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v10;
    v31 = 2112;
    v32 = v3;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Skipping actionSet to avoid cycle. [Checking ActionSet : %@] against [ActionSetUUID: %@] [ActionSet SPI Identifier: %@]", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  v13 = 0;
LABEL_14:

  return v13;
}

uint64_t __73__HMDShortcutAction_doesActionSetContainItemsPassingTest_actionSetUUIDs___block_invoke_132(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "spiClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __61__HMDShortcutAction_doesAnyCharacteristicTupleUnsecureAHome___block_invoke(uint64_t a1, void *a2)
{
  id Property;
  const char *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  uint64_t v15;

  Property = a2;
  v5 = Property;
  if (Property)
    Property = objc_getProperty(Property, v4, 8, 1);
  v6 = Property;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "requiresDeviceUnlock:forService:", v8, v10))
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v6, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v14 = objc_getProperty(v5, v12, 16, 1);
    else
      v14 = 0;
    v15 = objc_msgSend(v11, "allowsSecuringWriteFor:withValue:", v13, v14) ^ 1;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __41__HMDShortcutAction_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *Property;
  const char *v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __67__HMDShortcutAction_doesAnyCharacteristicTupleRequireDeviceUnlock___block_invoke;
    v20[3] = &unk_1E89A2498;
    v5 = v4;
    v21 = v5;
    objc_msgSend(v3, "na_firstObjectPassingTest:", v20);
    Property = (void *)objc_claimAutoreleasedReturnValue();
    v8 = Property;
    if (Property)
      Property = objc_getProperty(Property, v7, 8, 1);
    v9 = Property;

    v10 = v9 != 0;
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v2;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accessory");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("does not");
      *(_DWORD *)buf = 138543874;
      v23 = v14;
      v24 = 2112;
      if (v9)
        v18 = &stru_1E89C3E38;
      v25 = v16;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[%@] %@ requires device to be unlock", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __41__HMDShortcutAction_requiresDeviceUnlock__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__HMDShortcutAction_doesActionSetContainSecureCharacteristic___block_invoke;
    v11[3] = &unk_1E89B8BB8;
    v11[4] = v2;
    v4 = -[HMDShortcutAction doesActionSetContainItemsPassingTest:actionSetUUIDs:](v2, v11, v3);
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = v2;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Does this shortcut action contain any secure class accessories: [%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __62__HMDShortcutAction_doesActionSetContainSecureCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "containsSecureCharacteristic");
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("does not");
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    if ((_DWORD)v4)
      v9 = CFSTR("does");
    v14 = v9;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@ActionSet %@ contain secure class accessory : %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);

  return v4;
}

uint64_t __67__HMDShortcutAction_doesAnyCharacteristicTupleRequireDeviceUnlock___block_invoke(uint64_t a1, id self)
{
  id Property;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (self)
    Property = objc_getProperty(self, (SEL)self, 8, 1);
  else
    Property = 0;
  v4 = *(void **)(a1 + 32);
  v5 = Property;
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "requiresDeviceUnlock:forService:", v6, v8);

  return v9;
}

void __68__HMDShortcutAction_executeWithSource_clientName_completionHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8[4];
      v21 = 138543874;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      v25 = 2114;
      v26 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute shortcut action %{public}@ with error: %{public}@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", -1, 0, 0, 0, v5);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v17 = (void *)v13;
    goto LABEL_10;
  }
  v14 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8[4];
      v21 = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@shortcut action execution was cancelled : %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v14)
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8[4];
    v21 = 138543618;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Shortcut action successfully executed : %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v17 = 0;
LABEL_10:
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v17);

}

id __30__HMDShortcutAction_stateDump__block_invoke(int a1, id self)
{
  if (self)
    return objc_getProperty(self, (SEL)self, 8, 1);
  else
    return 0;
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  return (id)objc_msgSend(a1, "actionWithDictionaryRepresentation:home:actionSet:", a3, a4, 0);
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4 actionSet:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "hmf_numberForKey:", CFSTR("kActionType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "unsignedIntegerValue") == 2)
  {
    objc_msgSend(v8, "hmf_dataForKey:", *MEMORY[0x1E0CBA100]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc((Class)a1);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithSerializedShortcut:uuid:actionSet:", v12, v14, v10);

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v8;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized shortcut: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v15 = 0;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid action type: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t53 != -1)
    dispatch_once(&logCategory__hmf_once_t53, &__block_literal_global_160);
  return (id)logCategory__hmf_once_v54;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __32__HMDShortcutAction_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v54;
  logCategory__hmf_once_v54 = v0;

}

@end
