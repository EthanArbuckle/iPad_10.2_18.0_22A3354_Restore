@implementation HMShortcutAction

- (HMShortcutAction)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMShortcutAction)initWithUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMShortcutAction)initWithShortcut:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  HMShortcutAction *v8;
  SEL v9;
  id v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = -[HMShortcutAction initWithShortcut:shortcutData:uuid:]((char *)self, v4, 0);

    return (HMShortcutAction *)v6;
  }
  else
  {
    v8 = (HMShortcutAction *)_HMFPreconditionFailure();
    return -[HMShortcutAction initWithDictionary:home:](v8, v9, v10, v11);
  }
}

- (HMShortcutAction)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  HMShortcutAction *v7;
  uint64_t v8;
  NSData *shortcutData;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMShortcutAction;
  v7 = -[HMAction initWithDictionary:home:](&v11, sel_initWithDictionary_home_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HM.workflowDataKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    shortcutData = v7->_shortcutData;
    v7->_shortcutData = (NSData *)v8;

  }
  return v7;
}

- (unint64_t)type
{
  return 2;
}

- (WFHomeWorkflow)shortcut
{
  os_unfair_lock_s *p_lock;
  WFHomeWorkflow *shortcut;
  WFHomeWorkflow *v5;
  void *v6;
  objc_class *v7;
  id v8;
  WFHomeWorkflow *v9;
  WFHomeWorkflow *v10;
  NSData *shortcutData;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  shortcut = self->_shortcut;
  if (!shortcut)
  {
    if (!self->_shortcutData)
      goto LABEL_11;
    if (!WorkflowKitLibraryCore_frameworkLibrary)
    {
      v17 = xmmword_1E3AB4600;
      v18 = 0;
      WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (!WorkflowKitLibraryCore_frameworkLibrary)
    {
LABEL_11:
      v5 = 0;
      goto LABEL_12;
    }
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getWFHomeWorkflowClass_softClass;
    v16 = getWFHomeWorkflowClass_softClass;
    if (!getWFHomeWorkflowClass_softClass)
    {
      *(_QWORD *)&v17 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v17 + 1) = 3221225472;
      v18 = __getWFHomeWorkflowClass_block_invoke;
      v19 = &unk_1E3AB4620;
      v20 = &v13;
      __getWFHomeWorkflowClass_block_invoke((uint64_t)&v17);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    v8 = [v7 alloc];
    v9 = (WFHomeWorkflow *)objc_msgSend(v8, "initWithData:", self->_shortcutData, v13);
    v10 = self->_shortcut;
    self->_shortcut = v9;

    shortcut = self->_shortcut;
    if (shortcut)
    {
      shortcutData = self->_shortcutData;
      self->_shortcutData = 0;

      shortcut = self->_shortcut;
    }
  }
  v5 = shortcut;
LABEL_12:
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)shortcutData
{
  os_unfair_lock_s *p_lock;
  NSData *shortcutData;
  NSData *v5;
  NSData *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  shortcutData = self->_shortcutData;
  if (shortcutData)
  {
    v5 = shortcutData;
  }
  else
  {
    -[WFHomeWorkflow data](self->_shortcut, "data");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v3;
  BOOL v4;

  -[HMShortcutAction shortcutData](self, "shortcutData", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)requiresDeviceUnlock
{
  void *v2;
  char v3;

  -[HMShortcutAction shortcut](self, "shortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresDeviceUnlock");

  return v3;
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[HMShortcutAction shortcutData](self, "shortcutData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMShortcutAction;
    -[HMAction _serializeForAdd](&v8, sel__serializeForAdd);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("HM.workflowDataKey"));
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  NSData *shortcutData;
  void *v10;
  char v11;
  char v12;
  WFHomeWorkflow *shortcut;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "shortcutData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  shortcutData = self->_shortcutData;
  v10 = shortcutData;
  if (!shortcutData)
  {
    -[WFHomeWorkflow data](self->_shortcut, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = HMFEqualObjects();
  v12 = v11;
  if (!shortcutData)
  {

    if ((v12 & 1) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  if ((v11 & 1) == 0)
  {
LABEL_9:
    objc_storeStrong((id *)&self->_shortcutData, v7);
    shortcut = self->_shortcut;
    self->_shortcut = 0;

  }
LABEL_10:
  v14 = v12 ^ 1;
  os_unfair_lock_unlock(p_lock);

LABEL_12:
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  char *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMShortcutAction initWithShortcut:shortcutData:uuid:]((char *)[HMShortcutAction alloc], self->_shortcut, self->_shortcutData);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HMShortcutAction *v4;
  HMShortcutAction *v5;
  HMShortcutAction *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (HMShortcutAction *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMShortcutAction shortcutData](self, "shortcutData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMShortcutAction shortcutData](v6, "shortcutData");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v7 && v8)
      {
        v10 = objc_msgSend(v7, "isEqualToData:", v8);
      }
      else
      {
        -[HMAction uniqueIdentifier](self, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAction uniqueIdentifier](v6, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "isEqual:", v12);

      }
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (HMShortcutAction)initWithCoder:(id)a3
{
  id v4;
  HMShortcutAction *v5;
  uint64_t v6;
  NSData *shortcutData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMShortcutAction;
  v5 = -[HMAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.workflowDataKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    shortcutData = v5->_shortcutData;
    v5->_shortcutData = (NSData *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutData, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
}

- (char)initWithShortcut:(char *)a1 shortcutData:(void *)a2 uuid:(void *)a3
{
  id v5;
  id v6;
  int *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v13;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)HMShortcutAction;
    a1 = (char *)objc_msgSendSuper2(&v13, sel_initWithUUID_, 0);
    if (a1)
    {
      v7 = &OBJC_IVAR___HMShortcutAction__shortcut;
      if (v5)
      {
        v8 = v5;
      }
      else
      {
        v7 = &OBJC_IVAR___HMShortcutAction__shortcutData;
        v8 = v6;
      }
      v9 = *v7;
      v10 = v8;
      v11 = *(void **)&a1[v9];
      *(_QWORD *)&a1[v9] = v10;

    }
  }

  return a1;
}

+ (BOOL)isSupportedForHome:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "residentDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "capabilities") & 0x100) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
