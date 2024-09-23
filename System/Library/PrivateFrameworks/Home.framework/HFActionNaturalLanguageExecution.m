@implementation HFActionNaturalLanguageExecution

- (HFActionNaturalLanguageExecution)initWithOptions:(id)a3
{
  id v5;
  HFActionNaturalLanguageExecution *v6;
  HFActionNaturalLanguageExecution *v7;
  uint64_t v8;
  NSMutableSet *indescribableActionTypes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFActionNaturalLanguageExecution;
  v6 = -[HFActionNaturalLanguageExecution init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v7->_named = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    indescribableActionTypes = v7->_indescribableActionTypes;
    v7->_indescribableActionTypes = (NSMutableSet *)v8;

  }
  return v7;
}

- (HFAccessoryRepresentable)singularInvolvedObject
{
  void *v3;
  void *v4;

  if (-[HFActionNaturalLanguageExecution accessoryCount](self, "accessoryCount") == 1)
  {
    -[HFActionNaturalLanguageExecution allInvolvedObjects](self, "allInvolvedObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (HFAccessoryRepresentable *)v4;
}

- (unint64_t)accessoryCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HFActionNaturalLanguageExecution options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessoryCountType");

  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[HFActionNaturalLanguageExecution allInvolvedObjects](self, "allInvolvedObjects", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "hf_containedServices");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "na_filter:", &__block_literal_global_233_0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "count"))
            v13 = objc_msgSend(v12, "count");
          else
            v13 = 1;
          v8 += v13;

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    return v8;
  }
  else
  {
    -[HFActionNaturalLanguageExecution allInvolvedObjects](self, "allInvolvedObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    return v15;
  }
}

uint64_t __50__HFActionNaturalLanguageExecution_accessoryCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisible");
}

+ (id)executionWithActions:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  HFActionNaturalLanguageExecution *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__HFActionNaturalLanguageExecution_executionWithActions_options___block_invoke;
  v18[3] = &unk_1EA72BC40;
  v19 = v6;
  v8 = v6;
  objc_msgSend(v7, "na_filter:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HFActionNaturalLanguageExecution initWithOptions:]([HFActionNaturalLanguageExecution alloc], "initWithOptions:", v8);
  -[HFActionNaturalLanguageExecution setActions:](v10, "setActions:", v9);
  objc_msgSend(v9, "na_map:", &__block_literal_global_235_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionNaturalLanguageExecution setInvolvedServices:](v10, "setInvolvedServices:", v11);

  -[HFActionNaturalLanguageExecution updateInvolvedObjects](v10, "updateInvolvedObjects");
  -[HFActionNaturalLanguageExecution allInvolvedObjects](v10, "allInvolvedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessoryRepresentingIDsInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectsInContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessoryRepresentingIDsInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionNaturalLanguageExecution setNamed:](v10, "setNamed:", objc_msgSend(v16, "count") != 0);

  return v10;
}

uint64_t __65__HFActionNaturalLanguageExecution_executionWithActions_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    objc_opt_class();
    v7 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "ignoreOptionalCharacteristics"))
      {
        objc_msgSend(v10, "characteristic");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "service");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serviceType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "characteristic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "characteristicType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v14, "containsObject:", v16);

        goto LABEL_14;
      }
    }
    else
    {
      v7 = 0;
    }
    v8 = 1;
    goto LABEL_14;
  }
  objc_msgSend(v6, "mediaProfiles");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;
LABEL_14:

  return v8;
}

id __65__HFActionNaturalLanguageExecution_executionWithActions_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "hf_affectedCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_accessoryRepresentingIDsInSet:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_236_0);
}

id __67__HFActionNaturalLanguageExecution__accessoryRepresentingIDsInSet___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "hf_homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateInvolvedObjects
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSSet *v7;
  uint64_t v8;
  NSSet *allInvolvedObjects;
  NSSet *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  -[HFActionNaturalLanguageExecution actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_238_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke_3;
  v11[3] = &unk_1EA7377F0;
  v11[4] = self;
  v13 = &v14;
  v6 = v5;
  v12 = v6;
  objc_msgSend(v4, "na_map:", v11);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();

  if (!*((_BYTE *)v15 + 24))
  {
    -[NSSet setByAddingObjectsFromSet:](v7, "setByAddingObjectsFromSet:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (NSSet *)v8;
  }
  allInvolvedObjects = self->_allInvolvedObjects;
  self->_allInvolvedObjects = v7;
  v10 = v7;

  _Block_object_dispose(&v14, 8);
}

id __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "hf_affectedCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v2, "hf_affectedCharacteristic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "hf_affectedAccessoryProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "na_map:", &__block_literal_global_240_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F03F05E0))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  if (v4)
  {
    v5 = v2;
  }
  else
  {
    objc_msgSend(v2, "accessory");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

id __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsInContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  if (!v6)
  {
    objc_opt_class();
    v7 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "involvedServices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count") == 1)
      {
        objc_msgSend(v9, "accessory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hf_showAsAccessoryTile");

        if (v12)
        {
          v13 = v9;
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {

      }
    }
    +[HFAccessoryLikeObject accessoryLikeObjectsForAccessoryRepresentable:](HFAccessoryLikeObject, "accessoryLikeObjectsForAccessoryRepresentable:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v14, "anyObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    if (v15)
      v16 = v15;
    else
      v16 = v7;
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 32), "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "useMediaContainersNotInContext") & 1) != 0)
    {

    }
    else
    {
      v19 = objc_msgSend(v15, "conformsToProtocol:", &unk_1F0449888);

      if (v19)
      {
        objc_msgSend(*(id *)(a1 + 32), "options");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectsInContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsObject:", v17);

        if (!v22)
        {
          objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v17);
          v7 = 0;
          goto LABEL_23;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    v7 = v17;
LABEL_23:

    goto LABEL_24;
  }
  v7 = v3;
LABEL_25:

  return v7;
}

- (HFActionNaturalLanguageOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSSet)allInvolvedObjects
{
  return self->_allInvolvedObjects;
}

- (void)setAllInvolvedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_allInvolvedObjects, a3);
}

- (NSSet)involvedServices
{
  return self->_involvedServices;
}

- (void)setInvolvedServices:(id)a3
{
  objc_storeStrong((id *)&self->_involvedServices, a3);
}

- (BOOL)named
{
  return self->_named;
}

- (void)setNamed:(BOOL)a3
{
  self->_named = a3;
}

- (NSMutableSet)indescribableActionTypes
{
  return self->_indescribableActionTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indescribableActionTypes, 0);
  objc_storeStrong((id *)&self->_involvedServices, 0);
  objc_storeStrong((id *)&self->_allInvolvedObjects, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
