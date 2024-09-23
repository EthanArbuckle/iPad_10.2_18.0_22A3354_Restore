@implementation SGEventActivity

- (SGEventActivity)initWithTeamIdentifier:(id)a3 type:(unsigned __int8)a4 userActivity:(id)a5 validStartDate:(double)a6 validEndDate:(double)a7
{
  id v13;
  id v14;
  SGEventActivity *v15;
  SGEventActivity *v16;
  objc_super v18;

  v13 = a3;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SGEventActivity;
  v15 = -[SGEventActivity init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_teamIdentifier, a3);
    v16->_type = a4;
    objc_storeStrong((id *)&v16->_userActivity, a5);
    v16->_validStartDate = a6;
    v16->_validEndDate = a7;
  }

  return v16;
}

- (SGEventActivity)initWithDictionary:(id)a3
{
  id v4;
  SGEventActivity *v5;
  uint64_t v6;
  NSString *teamIdentifier;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSUserActivity *userActivity;
  void *v14;
  double v15;
  void *v16;
  double v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGEventActivity;
  v5 = -[SGEventActivity init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SGEventActivityTeamIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v6;

    v8 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SGEventActivityTypeKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v8, "typeForString:", v9);

    v10 = objc_alloc(MEMORY[0x1E0CA5920]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SGEventActivityUserActivityStringKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_initWithUserActivityStrings:secondaryString:optionalData:", v11, 0, 0);
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SGEventActivityStartDateKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_validStartDate = v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SGEventActivityEndDateKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_validEndDate = v17;

  }
  return v5;
}

- (id)jsonObject
{
  dispatch_semaphore_t v3;
  NSUserActivity *userActivity;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v3 = dispatch_semaphore_create(0);
  userActivity = self->_userActivity;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__SGEventActivity_jsonObject__block_invoke;
  v12[3] = &unk_1E475FF40;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  -[NSUserActivity _createUserActivityStringsWithOptions:completionHandler:](userActivity, "_createUserActivityStringsWithOptions:completionHandler:", 0, v12);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v5, 1.0) == 1)
  {
    v6 = 0;
  }
  else
  {
    v22[0] = self->_teamIdentifier;
    v21[0] = CFSTR("SGEventActivityTeamIdentifierKey");
    v21[1] = CFSTR("SGEventActivityTypeKey");
    objc_msgSend((id)objc_opt_class(), "describeType:", self->_type);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16[5];
    v22[1] = v7;
    v22[2] = v8;
    v21[2] = CFSTR("SGEventActivityUserActivityStringKey");
    v21[3] = CFSTR("SGEventActivityStartDateKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_validStartDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v9;
    v21[4] = CFSTR("SGEventActivityEndDateKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_validEndDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v15, 8);

  return v6;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (unsigned)type
{
  return self->_type;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (double)validStartDate
{
  return self->_validStartDate;
}

- (double)validEndDate
{
  return self->_validEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
}

void __29__SGEventActivity_jsonObject__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)describeType:(unsigned __int8)a3
{
  if (a3 == 1)
    return CFSTR("CheckIn");
  else
    return CFSTR("Unknown");
}

+ (unsigned)typeForString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("CheckIn"));
}

@end
