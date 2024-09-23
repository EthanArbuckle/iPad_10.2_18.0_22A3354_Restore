@implementation _DPSubmissionRateLimiter

- (_DPSubmissionRateLimiter)init
{

  return 0;
}

- (_DPSubmissionRateLimiter)initWithLimits:(id)a3
{
  id v5;
  _DPSubmissionRateLimiter *v6;
  _DPSubmissionRateLimiter *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *limiterQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DPSubmissionRateLimiter;
  v6 = -[_DPSubmissionRateLimiter init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_limitDictionary, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.DifferentialPrivacy.ratelimiter", v8);
    limiterQueue = v7->_limiterQueue;
    v7->_limiterQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___DPSubmissionRateLimiter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance;
}

+ (id)rateLimitsFromBudgetProperties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  +[_DPPrivacyBudgetProperties allBudgetPropertiesKeys](_DPPrivacyBudgetProperties, "allBudgetPropertiesKeys");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        +[_DPPrivacyBudgetProperties budgetPropertiesForKey:](_DPPrivacyBudgetProperties, "budgetPropertiesForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v7);
        objc_msgSend(v8, "refillInterval");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("interval"));

        objc_msgSend(v8, "refillAmount");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("refill_amount"));

        objc_msgSend(v8, "intervalChunksValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("chunks_amount"));

        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "refillAmount");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");
        objc_msgSend(v8, "intervalChunksValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") * v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("limit"));

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("checkpoint"));

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v2;
}

- (unint64_t)debit:(unint64_t)a3 forKey:(id)a4
{
  id v6;
  NSObject *limiterQueue;
  id v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  limiterQueue = self->_limiterQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41___DPSubmissionRateLimiter_debit_forKey___block_invoke;
  v11[3] = &unk_1E95D9538;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a3;
  v8 = v6;
  dispatch_sync(limiterQueue, v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)credit:(id)a3 amount:(unint64_t)a4
{
  id v6;
  NSObject *limiterQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  limiterQueue = self->_limiterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___DPSubmissionRateLimiter_credit_amount___block_invoke;
  block[3] = &unk_1E95D9560;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(limiterQueue, block);

}

+ (id)budgetNameForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "budget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (OS_dispatch_queue)limiterQueue
{
  return self->_limiterQueue;
}

- (NSMutableDictionary)limitDictionary
{
  return self->_limitDictionary;
}

- (void)setLimitDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_limitDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitDictionary, 0);
  objc_storeStrong((id *)&self->_limiterQueue, 0);
}

@end
