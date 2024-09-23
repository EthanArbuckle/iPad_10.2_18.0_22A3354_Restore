@implementation HFServiceStateCharacteristicMatchResult

uint64_t __61__HFServiceStateCharacteristicMatchResult_allCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allObjects");
}

- (HFServiceStateCharacteristicMatchResult)initWithServices:(id)a3 characteristicsByServiceUUID:(id)a4
{
  id v7;
  id v8;
  HFServiceStateCharacteristicMatchResult *v9;
  HFServiceStateCharacteristicMatchResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceStateCharacteristicMatchResult;
  v9 = -[HFServiceStateCharacteristicMatchResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_services, a3);
    objc_storeStrong((id *)&v10->_characteristicsByServiceUUID, a4);
  }

  return v10;
}

- (NSSet)allCharacteristics
{
  NSSet *allCharacteristics;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  allCharacteristics = self->_allCharacteristics;
  if (!allCharacteristics)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[HFServiceStateCharacteristicMatchResult characteristicsByServiceUUID](self, "characteristicsByServiceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_flatMap:", &__block_literal_global_131_2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v7);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_allCharacteristics;
    self->_allCharacteristics = v8;

    allCharacteristics = self->_allCharacteristics;
  }
  return allCharacteristics;
}

- (NSDictionary)characteristicsByServiceUUID
{
  return self->_characteristicsByServiceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicsByServiceUUID, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_servicesByUUID, 0);
  objc_storeStrong((id *)&self->_allCharacteristics, 0);
}

- (HFServiceStateCharacteristicMatchResult)init
{
  void *v3;
  HFServiceStateCharacteristicMatchResult *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFServiceStateCharacteristicMatchResult initWithServices:characteristicsByServiceUUID:](self, "initWithServices:characteristicsByServiceUUID:", v3, MEMORY[0x1E0C9AA70]);

  return v4;
}

- (HFServiceStateCharacteristicMatchResult)initWithServices:(id)a3 characteristics:(id)a4
{
  id v6;
  void *v7;
  HFServiceStateCharacteristicMatchResult *v8;

  v6 = a3;
  objc_msgSend(a4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_126_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFServiceStateCharacteristicMatchResult initWithServices:characteristicsByServiceUUID:](self, "initWithServices:characteristicsByServiceUUID:", v6, v7);

  return v8;
}

id __76__HFServiceStateCharacteristicMatchResult_initWithServices_characteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)servicesByUUID
{
  NSDictionary *servicesByUUID;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  servicesByUUID = self->_servicesByUUID;
  if (!servicesByUUID)
  {
    -[HFServiceStateCharacteristicMatchResult services](self, "services");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_129_3);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_servicesByUUID;
    self->_servicesByUUID = v5;

    servicesByUUID = self->_servicesByUUID;
  }
  return servicesByUUID;
}

uint64_t __57__HFServiceStateCharacteristicMatchResult_servicesByUUID__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

+ (id)matchResultByMergingResults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  HFServiceStateCharacteristicMatchResult *v14;
  id obj;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "services");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v12);

        objc_msgSend(v11, "characteristicsByServiceUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __71__HFServiceStateCharacteristicMatchResult_matchResultByMergingResults___block_invoke;
        v17[3] = &unk_1EA741760;
        v18 = v5;
        objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v14 = -[HFServiceStateCharacteristicMatchResult initWithServices:characteristicsByServiceUUID:]([HFServiceStateCharacteristicMatchResult alloc], "initWithServices:characteristicsByServiceUUID:", v4, v5);
  return v14;
}

void __71__HFServiceStateCharacteristicMatchResult_matchResultByMergingResults___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "na_objectForKey:withDefaultValue:", a2, &__block_literal_global_134_1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v5);

}

uint64_t __71__HFServiceStateCharacteristicMatchResult_matchResultByMergingResults___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  HFServiceStateCharacteristicMatchResult *v13;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceStateCharacteristicMatchResult characteristicsByServiceUUID](self, "characteristicsByServiceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__HFServiceStateCharacteristicMatchResult_description__block_invoke;
  v11 = &unk_1EA7417A8;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v8);

  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

void __54__HFServiceStateCharacteristicMatchResult_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_map:", &__block_literal_global_138_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "servicesByUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hf_prettyDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v7, v10, 0);

}

uint64_t __54__HFServiceStateCharacteristicMatchResult_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyDescription");
}

+ (NAIdentity)na_identity
{
  if (qword_1ED379EF0 != -1)
    dispatch_once(&qword_1ED379EF0, &__block_literal_global_140_0);
  return (NAIdentity *)(id)qword_1ED379EF8;
}

void __54__HFServiceStateCharacteristicMatchResult_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_143_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_145_1);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED379EF8;
  qword_1ED379EF8 = v3;

}

uint64_t __54__HFServiceStateCharacteristicMatchResult_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "services");
}

uint64_t __54__HFServiceStateCharacteristicMatchResult_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicsByServiceUUID");
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

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (NSSet)services
{
  return self->_services;
}

@end
