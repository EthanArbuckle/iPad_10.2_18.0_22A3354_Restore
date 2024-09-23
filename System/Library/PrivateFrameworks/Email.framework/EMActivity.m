@implementation EMActivity

- (NSString)localizedDescription
{
  EMActivity *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  switch(self->_activityType)
  {
    case 0:
    case 2:
    case 3:
      _EFLocalizedString();
      self = (EMActivity *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v2 = self;
      -[EMActivity userInfo](self, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("activityFetchState"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "integerValue");

      -[EMActivity userInfo](v2, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("useIsIndeterminateForFetchState"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if (v8)
      {
        if (v5 == 2)
        {
          if (-[NSProgress isIndeterminate](v2->_progress, "isIndeterminate"))
            v5 = 1;
          else
            v5 = 2;
        }
      }
      else
      {
        v9 = -[NSProgress totalUnitCount](v2->_progress, "totalUnitCount");
        if (v5 != 3 && v9 < 1)
          v11 = 0;
        else
          v11 = v5;
        v12 = -[NSProgress completedUnitCount](v2->_progress, "completedUnitCount");
        if (v11 != 3 && v12 < 1)
          v5 = 1;
        else
          v5 = v11;
      }
      -[EMActivity _localizedDescriptionForFetchState:](v2, "_localizedDescriptionForFetchState:", v5);
      self = (EMActivity *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (NSString *)self;
  }
  return (NSString *)self;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[EMActivity objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_objectID"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[EMActivity activityType](self, "activityType"), CFSTR("EFPropertyKey_activityType"));
  -[EMActivity started](self, "started");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_started"));

  -[EMActivity finished](self, "finished");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_finished"));

  -[EMActivity userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_userInfo"));

  -[EMActivity error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_error"));

}

- (NSDictionary)userInfo
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_userInfo, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (NSDate)started
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)finished
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (EMActivityObjectID)objectID
{
  return (EMActivityObjectID *)objc_getProperty(self, a2, 88, 1);
}

- (id)_localizedDescriptionForFetchState:(int64_t)a3
{
  EMActivity *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  void *v8;
  EMStatusUpdateProvider *statusUpdateProvider;
  EMStatusUpdateProvider *v10;
  EMStatusUpdateProvider *v11;
  NSDate *finished;

  v4 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ESTABLISHING_CONNECTION"), &stru_1E70F6E90, CFSTR("Main"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CHECKING_FOR_MAIL"), &stru_1E70F6E90, CFSTR("Main"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      if (-[NSProgress completedUnitCount](v4->_progress, "completedUnitCount"))
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        _EFLocalizedString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithFormat:", v6, -[NSProgress completedUnitCount](v4->_progress, "completedUnitCount"), -[NSProgress totalUnitCount](v4->_progress, "totalUnitCount"));
      }
      else
      {
        _EFLocalizedString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, -[NSProgress totalUnitCount](v4->_progress, "totalUnitCount"));
      }
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      statusUpdateProvider = v4->_statusUpdateProvider;
      if (!statusUpdateProvider)
      {
        v10 = objc_alloc_init(EMStatusUpdateProvider);
        v11 = v4->_statusUpdateProvider;
        v4->_statusUpdateProvider = v10;

        statusUpdateProvider = v4->_statusUpdateProvider;
      }
      finished = v4->_finished;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMStatusUpdateProvider statusUpdateStringWithDate:now:nextTransition:](statusUpdateProvider, "statusUpdateStringWithDate:now:nextTransition:", finished, v6, 0);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v4 = (EMActivity *)v7;

      break;
    default:
      break;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (EMActivity)initWithActivityType:(int64_t)a3 userInfo:(id)a4
{
  id v7;
  EMActivity *v8;
  EMActivityObjectID *v9;
  EMActivityObjectID *objectID;
  uint64_t v11;
  NSDate *started;
  uint64_t v13;
  NSProgress *progress;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EMActivity;
  v8 = -[EMActivity init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(EMActivityObjectID);
    objectID = v8->_objectID;
    v8->_objectID = v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    started = v8->_started;
    v8->_started = (NSDate *)v11;

    v8->_activityType = a3;
    objc_storeStrong((id *)&v8->_userInfo, a4);
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v13 = objc_claimAutoreleasedReturnValue();
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v13;

    -[EMActivity _observeProgress](v8, "_observeProgress");
  }

  return v8;
}

- (EMActivity)initWithCoder:(id)a3
{
  id v4;
  EMActivity *v5;
  uint64_t v6;
  EMActivityObjectID *objectID;
  uint64_t v8;
  NSDate *started;
  uint64_t v10;
  NSDate *finished;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *userInfo;
  uint64_t v22;
  NSError *error;
  uint64_t v24;
  NSProgress *progress;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)EMActivity;
  v5 = -[EMActivity init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_objectID"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectID = v5->_objectID;
    v5->_objectID = (EMActivityObjectID *)v6;

    v5->_activityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_activityType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_started"));
    v8 = objc_claimAutoreleasedReturnValue();
    started = v5->_started;
    v5->_started = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_finished"));
    v10 = objc_claimAutoreleasedReturnValue();
    finished = v5->_finished;
    v5->_finished = (NSDate *)v10;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v27 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v28, v27, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("EFPropertyKey_userInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_error"));
    v22 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v22;

    if (!v5->_error)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
      v24 = objc_claimAutoreleasedReturnValue();
      progress = v5->_progress;
      v5->_progress = (NSProgress *)v24;

      -[EMActivity _observeProgress](v5, "_observeProgress");
    }
  }

  return v5;
}

- (void)_observeProgress
{
  void *v3;
  id v4;
  EFCancelable *v5;
  EFCancelable *progressKVOCancellation;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  -[EMActivity progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__EMActivity__observeProgress__block_invoke;
  v7[3] = &unk_1E70F20E8;
  objc_copyWeak(&v9, &location);
  v8 = v3;
  v4 = v3;
  objc_msgSend(v4, "ef_observeKeyPath:options:usingBlock:", CFSTR("fractionCompleted"), 1, v7);
  v5 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  progressKVOCancellation = self->_progressKVOCancellation;
  self->_progressKVOCancellation = v5;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSProgress)progress
{
  return self->_progress;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_finished, 0);
  objc_storeStrong((id *)&self->_started, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_progressKVOCancellation, 0);
  objc_storeStrong((id *)&self->_statusUpdateProvider, 0);
}

- (void)dealloc
{
  EFCancelable *progressKVOCancellation;
  objc_super v4;

  -[EFCancelable cancel](self->_progressKVOCancellation, "cancel");
  progressKVOCancellation = self->_progressKVOCancellation;
  self->_progressKVOCancellation = 0;

  v4.receiver = self;
  v4.super_class = (Class)EMActivity;
  -[EMActivity dealloc](&v4, sel_dealloc);
}

+ (id)keyPathsForValuesAffectingLocalizedDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("error"), CFSTR("fractionCompleted"), CFSTR("finished"), CFSTR("userInfo"), 0);
}

- (BOOL)isEqualToActivityWithType:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a4;
  if (a3 == 1 && -[EMActivity activityType](self, "activityType") == 1)
  {
    -[EMActivity userInfo](self, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mailboxObjectID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mailboxObjectID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __17__EMActivity_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (OS_os_log *)(id)log_log_1;
}

void __17__EMActivity_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

void __30__EMActivity__observeProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "fractionCompleted");
  objc_msgSend(WeakRetained, "setFractionCompleted:");

}

- (void)setCompletedCount:(int64_t)a3 totalCount:(int64_t)a4
{
  void *v7;
  void *v8;

  -[EMActivity willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("localizedDescription"));
  -[EMActivity progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompletedUnitCount:", a3);

  -[EMActivity progress](self, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTotalUnitCount:", a4);

  -[EMActivity didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("localizedDescription"));
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSDictionary *v7;
  void *v8;
  NSDictionary *userInfo;
  id v10;

  v10 = a3;
  v6 = a4;
  -[EMActivity willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("userInfo"));
  os_unfair_lock_lock(&self->_lock);
  v7 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_userInfo);
  v8 = (void *)objc_msgSend(v10, "copy");
  -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, v6);

  userInfo = self->_userInfo;
  self->_userInfo = v7;

  os_unfair_lock_unlock(&self->_lock);
  -[EMActivity didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("userInfo"));

}

- (void)finishWithError:(id)a3
{
  NSProgress *progress;
  NSDate *v6;
  NSDate *finished;
  id v8;

  v8 = a3;
  -[EMActivity willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("progress"));
  -[EMActivity willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("finished"));
  -[EMActivity willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
  os_unfair_lock_lock(&self->_lock);
  if (!self->_finished)
  {
    progress = self->_progress;
    self->_progress = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    finished = self->_finished;
    self->_finished = v6;

    objc_storeStrong((id *)&self->_error, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
  -[EMActivity setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", &unk_1E711F2C0, CFSTR("activityFetchState"));
  -[EMActivity didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
  -[EMActivity didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("finished"));
  -[EMActivity didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("progress"));

}

- (BOOL)needsPersistentHistory
{
  return -[EMActivity activityType](self, "activityType") == 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t activityType;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  activityType = self->_activityType;
  if (activityType > 3)
    v6 = CFSTR("EMActivityTypeFetch");
  else
    v6 = off_1E70F2108[activityType];
  -[EMActivity userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mailboxObjectID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMActivity localizedDescription](self, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@: %@ - %@"), v4, self, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (double)fractionCompleted
{
  return self->_fractionCompleted;
}

- (void)setFractionCompleted:(double)a3
{
  self->_fractionCompleted = a3;
}

@end
