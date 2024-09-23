@implementation MDMPowerAssertion

- (MDMPowerAssertion)initWithReason:(id)a3
{
  id v4;
  MDMPowerAssertion *v5;
  uint64_t v6;
  NSDate *creationDate;
  uint64_t v8;
  UMUserSwitchBlockingTask *blockingTask;
  NSObject *v10;
  NSObject *v11;
  MDMPowerAssertion *v12;
  _QWORD block[4];
  MDMPowerAssertion *v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MDMPowerAssertion;
  v5 = -[DMCPowerAssertion initWithReason:](&v16, sel_initWithReason_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    if (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad"))
    {
      objc_msgSend(DMCUMUserSwitchBlockingTaskClass(), "taskWithName:reason:", CFSTR("MDMBlockingTask"), v4);
      v8 = objc_claimAutoreleasedReturnValue();
      blockingTask = v5->_blockingTask;
      v5->_blockingTask = (UMUserSwitchBlockingTask *)v8;

      -[UMUserSwitchBlockingTask begin](v5->_blockingTask, "begin");
    }
    else
    {
      v10 = DMCLogObjects()[2];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v4;
        _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_DEFAULT, "Starting MDM power assertion with reason: %{public}@", buf, 0xCu);
      }
    }
  }
  _assertionQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MDMPowerAssertion_initWithReason___block_invoke;
  block[3] = &unk_1E4D37148;
  v12 = v5;
  v15 = v12;
  dispatch_sync(v11, block);

  return v12;
}

void __36__MDMPowerAssertion_initWithReason___block_invoke(uint64_t a1)
{
  id v2;

  +[MDMPowerAssertion _currentAssertions](MDMPowerAssertion, "_currentAssertions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPointer:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[DMCMultiUserModeUtilities isSharediPad](DMCMultiUserModeUtilities, "isSharediPad"))
  {
    -[UMUserSwitchBlockingTask end](self->_blockingTask, "end");
  }
  else
  {
    v3 = DMCLogObjects()[2];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[DMCProcessAssertion reason](self, "reason");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEFAULT, "Ending MDM power assertion with reason: %{public}@", buf, 0xCu);

    }
  }
  _assertionQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MDMPowerAssertion_dealloc__block_invoke;
  block[3] = &unk_1E4D37148;
  block[4] = self;
  dispatch_sync(v6, block);

  v7.receiver = self;
  v7.super_class = (Class)MDMPowerAssertion;
  -[DMCPowerAssertion dealloc](&v7, sel_dealloc);
}

void __28__MDMPowerAssertion_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  +[MDMPowerAssertion _currentAssertions](MDMPowerAssertion, "_currentAssertions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v7, "count");
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    while (1)
    {
      objc_msgSend(v7, "pointerAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 == *(void **)(a1 + 32))
        break;

      if (v3 == ++v4)
        goto LABEL_7;
    }
    objc_msgSend(v7, "removePointerAtIndex:", v4);

  }
LABEL_7:

}

+ (id)assertionDescriptions
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v3 = (void *)objc_opt_new();
  _assertionQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __42__MDMPowerAssertion_assertionDescriptions__block_invoke;
  v11 = &unk_1E4D37E38;
  v12 = v3;
  v13 = a1;
  v5 = v3;
  dispatch_sync(v4, &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

void __42__MDMPowerAssertion_assertionDescriptions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_currentAssertions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if (v7)
        {
          v8 = *(void **)(a1 + 32);
          objc_msgSend(v7, "description");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v9);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_class();
  objc_msgSend(v3, "_dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMPowerAssertion creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[DMCProcessAssertion reason](self, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p {\n\tReason  : %@\n\tCreated : %@\n}>"), v3, self, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_currentAssertions
{
  if (_currentAssertions_onceToken != -1)
    dispatch_once(&_currentAssertions_onceToken, &__block_literal_global_42_0);
  return (id)_currentAssertions_currentAssertions;
}

void __39__MDMPowerAssertion__currentAssertions__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_currentAssertions_currentAssertions;
  _currentAssertions_currentAssertions = v0;

}

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1)
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_44);
  return (id)_dateFormatter_dateFormatter;
}

uint64_t __35__MDMPowerAssertion__dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)_dateFormatter_dateFormatter;
  _dateFormatter_dateFormatter = v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_dateFormatter_dateFormatter, "setLocale:", v2);

  return objc_msgSend((id)_dateFormatter_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSSSSZZZ"));
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (UMUserSwitchBlockingTask)blockingTask
{
  return self->_blockingTask;
}

- (void)setBlockingTask:(id)a3
{
  objc_storeStrong((id *)&self->_blockingTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingTask, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
