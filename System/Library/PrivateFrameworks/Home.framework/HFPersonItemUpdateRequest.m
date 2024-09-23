@implementation HFPersonItemUpdateRequest

- (HFPersonItemUpdateRequest)initWithPerson:(id)a3 personManager:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFPersonItemUpdateRequest *v12;
  HFPersonItemUpdateRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFPersonItemUpdateRequest;
  v12 = -[HFPersonItemUpdateRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_person, a3);
    objc_storeStrong((id *)&v13->_personManager, a4);
    objc_storeStrong((id *)&v13->_home, a5);
  }

  return v13;
}

- (id)updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  HFPersonItemUpdateRequest *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPersonItemUpdateRequest home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personManagerSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFaceClassificationEnabled");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HFPersonItemUpdateRequest person](self, "person");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_safeSetObject:forKey:", v10, CFSTR("title"));

    -[HFPersonItemUpdateRequest person](self, "person");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_safeSetObject:forKey:", v12, CFSTR("personIdentifier"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[HFPersonItemUpdateRequest personManager](self, "personManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v13, "numberWithBool:", objc_opt_isKindOfClass() & 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("HFPersonResultIsHomeOriginatedKey"));

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("dependentHomeKitClasses"));

    v17 = (void *)MEMORY[0x1E0C99E20];
    -[HFPersonItemUpdateRequest person](self, "person");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "na_setWithSafeObject:", v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("dependentHomeKitObjects"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("shouldDisableForNonAdminUsers"));
    objc_msgSend(v4, "objectForKeyedSubscript:", HFPersonItemUpdateOptionSkipFaceCrop);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "futureWithResult:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFPersonItemUpdateRequest personManager](self, "personManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFPersonItemUpdateRequest person](self, "person");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hf_faceCropsForPersonWithIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke;
      v35[3] = &unk_1EA728A30;
      v30 = v8;
      v36 = v30;
      v19 = v19;
      v37 = v19;
      v38 = self;
      objc_msgSend(v28, "flatMap:", v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v29;
      v33[1] = 3221225472;
      v33[2] = __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke_100;
      v33[3] = &unk_1EA726990;
      v33[4] = self;
      v8 = v30;
      v34 = v8;
      objc_msgSend(v31, "recover:", v33);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1E0D519C0];
    v39 = CFSTR("hidden");
    v40[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "futureWithResult:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

id __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a2;
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = a1[4];
  objc_msgSend(v7, "hf_imageRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_safeSetObject:forKey:", v9, CFSTR("HFPersonResultFaceCropImageKey"));

  v10 = a1[4];
  objc_msgSend(v7, "dateCreated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_safeSetObject:forKey:", v11, CFSTR("HFPersonResultFaceCropDateKey"));

  objc_msgSend(a1[4], "na_safeSetObject:forKey:", v6, CFSTR("HFPersonResultFaceCropIdentifiersKey"));
  objc_msgSend(a1[5], "na_safeAddObject:", v7);
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", a1[5], CFSTR("dependentHomeKitObjects"));
  HFLogForCategory(0x13uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1[6], "person");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v17;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEBUG, "Person %@ using face crop %@", (uint8_t *)&v18, 0x16u);

  }
  v13 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", a1[4]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

id __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x13uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "%@: Face crop update failed with error %@. Recovering and hiding face crop result.", (uint8_t *)&v10, 0x16u);
  }

  v5 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMPerson)person
{
  return self->_person;
}

- (HMPersonManager)personManager
{
  return self->_personManager;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
