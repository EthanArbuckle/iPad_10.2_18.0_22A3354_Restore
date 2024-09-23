@implementation HFServiceTreeTypePredicate

+ (id)anyServiceTypePredicate
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithServiceTypes:serviceSubtypes:includeChildServices:", v3, v4, 0);

  return v5;
}

- (HFServiceTreeTypePredicate)initWithServiceTypes:(id)a3 serviceSubtypes:(id)a4 includeChildServices:(BOOL)a5
{
  id v9;
  id v10;
  HFServiceTreeTypePredicate *v11;
  HFServiceTreeTypePredicate *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceTreeTypePredicate;
  v11 = -[HFServiceTreeTypePredicate init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceTypes, a3);
    objc_storeStrong((id *)&v12->_serviceSubtypes, a4);
    v12->_includeChildServices = a5;
  }

  return v12;
}

- (id)matchingServicesForRootService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HFServiceTreeTypePredicate _matchesService:](self, "_matchesService:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HFServiceTreeTypePredicate includeChildServices](self, "includeChildServices"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(v4, "hf_childServices", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v6);
            -[HFServiceTreeTypePredicate matchingServicesForRootService:](self, "matchingServicesForRootService:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "unionSet:", v11);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v8);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)includeChildServices
{
  return self->_includeChildServices;
}

- (BOOL)_matchesService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[HFServiceTreeTypePredicate serviceTypes](self, "serviceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[HFServiceTreeTypePredicate serviceTypes](self, "serviceTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (!v8)
    {
      v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[HFServiceTreeTypePredicate serviceSubtypes](self, "serviceSubtypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[HFServiceTreeTypePredicate serviceSubtypes](self, "serviceSubtypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSubtype");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "containsObject:", v13);

  }
  else
  {
    v9 = 1;
  }
LABEL_8:

  return v9;
}

- (NSSet)serviceTypes
{
  return self->_serviceTypes;
}

- (NSSet)serviceSubtypes
{
  return self->_serviceSubtypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSubtypes, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
}

+ (id)anyServiceTypePredicateIncludingChildServices
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithServiceTypes:serviceSubtypes:includeChildServices:", v3, v4, 1);

  return v5;
}

+ (id)predicateWithServiceType:(id)a3
{
  return (id)objc_msgSend(a1, "predicateWithServiceType:includeChildServices:", a3, 0);
}

+ (id)predicateWithServiceType:(id)a3 includeChildServices:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithServiceTypes:serviceSubtypes:includeChildServices:", v8, v9, v4);

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceTreeTypePredicate serviceTypes](self, "serviceTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_234);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("serviceTypes"), 0);

  -[HFServiceTreeTypePredicate serviceSubtypes](self, "serviceSubtypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("serviceSubtypes"), 1);

  v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[HFServiceTreeTypePredicate includeChildServices](self, "includeChildServices"), CFSTR("includeChildServices"), 1);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

uint64_t __41__HFServiceTreeTypePredicate_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CBA7E0], "localizedDescriptionForServiceType:", a2);
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_330 != -1)
    dispatch_once(&_MergedGlobals_330, &__block_literal_global_12_17);
  return (NAIdentity *)(id)qword_1ED379ED8;
}

void __41__HFServiceTreeTypePredicate_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_17_15);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_18_8);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_20_10);
  objc_msgSend(v0, "build");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)qword_1ED379ED8;
  qword_1ED379ED8 = v4;

}

uint64_t __41__HFServiceTreeTypePredicate_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceTypes");
}

uint64_t __41__HFServiceTreeTypePredicate_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceSubtypes");
}

uint64_t __41__HFServiceTreeTypePredicate_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "includeChildServices"));
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

@end
