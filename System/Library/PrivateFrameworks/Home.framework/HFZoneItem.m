@implementation HFZoneItem

- (HFZoneItem)initWithHome:(id)a3 zone:(id)a4
{
  id v7;
  id v8;
  HFZoneItem *v9;
  HFZoneItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFZoneItem;
  v9 = -[HFZoneItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_zone, a4);
  }

  return v10;
}

- (HFZoneItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_zone_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFZoneItem.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFZoneItem init]",
    v5);

  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneItem zone](self, "zone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_3 != -1)
    dispatch_once(&_MergedGlobals_2_3, &__block_literal_global_10_9);
  return (NAIdentity *)(id)qword_1ED378A18;
}

void __25__HFZoneItem_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCharacteristic:", &__block_literal_global_13_10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_14_10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378A18;
  qword_1ED378A18 = v2;

}

uint64_t __25__HFZoneItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "home");
}

uint64_t __25__HFZoneItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zone");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (BOOL)hf_canDeleteItem
{
  return 1;
}

- (id)hf_deleteItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  -[HFZoneItem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneItem zone](self, "zone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__HFZoneItem_hf_deleteItem__block_invoke;
  v10[3] = &unk_1EA729F18;
  v11 = v4;
  v12 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "futureWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __27__HFZoneItem_hf_deleteItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "rooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __27__HFZoneItem_hf_deleteItem__block_invoke_2;
  v17[3] = &unk_1EA7396C0;
  v18 = v4;
  v19 = *(id *)(a1 + 32);
  v7 = v4;
  objc_msgSend(v5, "na_each:", v17);

  v8 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "combineAllFutures:ignoringErrors:scheduler:", v7, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __27__HFZoneItem_hf_deleteItem__block_invoke_4;
  v13[3] = &unk_1EA7396E8;
  v14 = v3;
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  v11 = v3;
  v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v13);

}

void __27__HFZoneItem_hf_deleteItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __27__HFZoneItem_hf_deleteItem__block_invoke_3;
  v11 = &unk_1EA728590;
  v5 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v3;
  v6 = v3;
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7, v8, v9, v10, v11);

}

uint64_t __27__HFZoneItem_hf_deleteItem__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRoom:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void __27__HFZoneItem_hf_deleteItem__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __27__HFZoneItem_hf_deleteItem__block_invoke_5;
    v5[3] = &unk_1EA726968;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "removeZone:completionHandler:", v3, v5);

  }
}

uint64_t __27__HFZoneItem_hf_deleteItem__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneItem zone](self, "zone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

  -[HFZoneItem zone](self, "zone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("zoneIdentifier"));

  v16[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("dependentHomeKitClasses"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HFZoneItem home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "hf_currentUserIsAdministrator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("administrator"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("shouldDisableForNonAdminUsers"));
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v14);

  return v4;
}

- (HMZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

@end
