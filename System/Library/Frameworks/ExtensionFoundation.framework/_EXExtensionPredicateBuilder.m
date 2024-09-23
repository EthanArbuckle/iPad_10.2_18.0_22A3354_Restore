@implementation _EXExtensionPredicateBuilder

- (_EXExtensionPredicateBuilder)initWithActivationRules:(_EXExtensionActivationRules *)a3 predicateDictionary:(id)a4
{
  id v7;
  _EXExtensionPredicateBuilder *v8;
  void *v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_EXExtensionPredicateBuilder;
  v8 = -[_EXExtensionPredicateBuilder init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationDictionaryVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_version = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationUsesStrictMatching"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_strictMatchingSpecified = objc_msgSend(v10, "BOOLValue");

    v11 = v8->_strictMatchingSpecified || v8->_version < 2;
    v8->_usesStrictMatching = v11;
    objc_storeStrong((id *)&v8->_predicateDictionary, a4);
    v8->_activationRules = a3;
  }

  return v8;
}

- (id)predicateForCountingRule:(id)a3 type:(id)a4 exceptTypes:(id)a5 specifiedCount:(int)a6
{
  uint64_t v6;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  _QWORD v21[2];

  v6 = *(_QWORD *)&a6;
  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  if (v9 | v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v9)
    {
      v20 = CFSTR("SPECIFIED_COUNT");
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _EXPredicateWithString((void *)v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "predicateWithSubstitutionVariables:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18[0] = CFSTR("SPECIFIED_COUNT");
      v18[1] = CFSTR("TYPE");
      v19[0] = v12;
      v19[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(self->_activationRules->var0, "predicateWithSubstitutionVariables:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v11)
    {
      _EXDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[_EXExtensionPredicateBuilder predicateForCountingRule:type:exceptTypes:specifiedCount:].cold.1();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)predicateForRejectExceptOtherTypesRule:(id)a3 type:(id)a4 otherTypes:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id *p_var1;
  void *v15;
  NSObject *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  v11 = v10;
  if (v8 | v9)
  {
    if (!v8 && v10 && objc_msgSend(v10, "count"))
    {
      if ((unint64_t)objc_msgSend(v11, "count") < 2)
      {
        v18[0] = CFSTR("TYPE");
        v18[1] = CFSTR("OTHER_TYPE");
        v19[0] = v9;
        objc_msgSend(v11, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        p_var1 = &self->_activationRules->var1;
      }
      else
      {
        v20[0] = CFSTR("TYPE");
        v20[1] = CFSTR("OTHER_TYPES");
        v21[0] = v9;
        v21[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        p_var1 = &self->_activationRules->var2;
      }
      objc_msgSend(*p_var1, "predicateWithSubstitutionVariables:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        _EXDefaultLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[_EXExtensionPredicateBuilder predicateForRejectExceptOtherTypesRule:type:otherTypes:].cold.1();

      }
    }
    else
    {
      -[_EXExtensionPredicateBuilder predicateForCountingRule:type:exceptTypes:specifiedCount:](self, "predicateForCountingRule:type:exceptTypes:specifiedCount:", v8, v9, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)applyRuleWithRuleName:(id)a3 acceptRule:(id)a4 rejectRule:(id)a5 types:(id)a6 exceptTypes:(id)a7 parentType:(id)a8 children:(id)a9 parentAccepted:(BOOL)a10 accepted:(BOOL *)a11 acceptedTypesInSubtree:(id *)a12 exceptTypesInSubtree:(id *)a13
{
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _EXExtensionPredicateBuilder *v32;
  void *v33;
  id *v34;
  id *v35;
  void *v36;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48[2];

  v19 = a3;
  v39 = a4;
  v42 = a5;
  v44 = a6;
  v43 = a7;
  v20 = a8;
  v21 = a9;
  -[NSDictionary objectForKey:](self->_predicateDictionary, "objectForKey:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "intValue");
  v24 = v23;
  v25 = v22 == 0;
  if ((_DWORD)v23)
    v25 = 1;
  if ((int)v23 > 0 == v25)
    v26 = 0;
  else
    v26 = !self->_usesStrictMatching || a10;
  if (objc_msgSend(v44, "count"))
  {
    objc_msgSend(v44, "objectAtIndex:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  v40 = v21;
  v41 = v20;
  if (v26)
  {
    v47 = 0;
    v48[0] = 0;
    -[_EXExtensionPredicateBuilder gatherChildrenPredicateWithRuleDictionary:parentType:parentAccepted:acceptedChildTypes:exceptChildTypes:](self, "gatherChildrenPredicateWithRuleDictionary:parentType:parentAccepted:acceptedChildTypes:exceptChildTypes:", v21, v20, a10, v48, &v47);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v48[0];
    v30 = v47;
    if ((int)v24 <= 0)
    {
LABEL_13:
      v31 = 0;
      goto LABEL_27;
    }
LABEL_15:
    v32 = self;
    v33 = v39;
    -[_EXExtensionPredicateBuilder predicateForCountingRule:type:exceptTypes:specifiedCount:](v32, "predicateForCountingRule:type:exceptTypes:specifiedCount:", v39, v27, v43, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *a11 = 1;
    v34 = a12;
    v35 = a13;
    if (!a12)
      goto LABEL_17;
    goto LABEL_16;
  }
  v45 = 0;
  v46 = 0;
  -[_EXExtensionPredicateBuilder gatherChildrenPredicateWithRuleDictionary:parentType:parentAccepted:acceptedChildTypes:exceptChildTypes:](self, "gatherChildrenPredicateWithRuleDictionary:parentType:parentAccepted:acceptedChildTypes:exceptChildTypes:", v21, v27, (int)v24 > 0, &v46, &v45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v46;
  v30 = v45;
  if ((int)v24 >= 1)
    goto LABEL_15;
  *a11 = 0;
  if (!v42 && self->_usesStrictMatching)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObjectsFromArray:", v29);
  if (a10)
    objc_msgSend(v38, "addObject:", v41);
  -[_EXExtensionPredicateBuilder predicateForRejectExceptOtherTypesRule:type:otherTypes:](self, "predicateForRejectExceptOtherTypesRule:type:otherTypes:", v42, v27, v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
  v35 = a13;
  v33 = v39;
  v34 = a12;
  if (a12)
LABEL_16:
    *v34 = objc_retainAutorelease(v29);
LABEL_17:
  if (v35)
    *v35 = objc_retainAutorelease(v30);
  _EXExtensionMakeAndPredicate(v31, v28);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[EXConcreteExtension _shouldLogExtensionDiscovery](EXConcreteExtension, "_shouldLogExtensionDiscovery"))
  {
    NSLog(CFSTR("Generated predicate %@ for rule %@"), v36, v19);
  }

  return v36;
}

- (id)gatherChildrenPredicateWithRuleDictionary:(id)a3 parentType:(id)a4 parentAccepted:(BOOL)a5 acceptedChildTypes:(id *)a6 exceptChildTypes:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v12 = a3;
  v13 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1;
  v39 = __Block_byref_object_dispose__1;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v28 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __136___EXExtensionPredicateBuilder_gatherChildrenPredicateWithRuleDictionary_parentType_parentAccepted_acceptedChildTypes_exceptChildTypes___block_invoke;
  v17[3] = &unk_1E2CFCEE8;
  v17[4] = self;
  v14 = v13;
  v22 = a5;
  v18 = v14;
  v19 = &v35;
  v20 = &v29;
  v21 = &v23;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
  if (a6)
    *a6 = objc_retainAutorelease((id)v30[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v24[5]);
  _EXExtensionMakeAndPredicateWithArray((void *)v36[5]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v15;
}

- (id)makePredicate
{
  id var7;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _EXExtensionActivationRules *activationRules;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD *v13;
  const __CFString **v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  var7 = self->_activationRules->var7;
  v21 = 0;
  v22 = 0;
  -[_EXExtensionPredicateBuilder gatherChildrenPredicateWithRuleDictionary:parentType:parentAccepted:acceptedChildTypes:exceptChildTypes:](self, "gatherChildrenPredicateWithRuleDictionary:parentType:parentAccepted:acceptedChildTypes:exceptChildTypes:", var7, 0, 0, &v22, &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v22;
  v6 = v21;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "removeObjectsInArray:", v5);
    v8 = objc_msgSend(v7, "count");
    activationRules = self->_activationRules;
    if (v8)
    {
      v10 = 40;
      if (!self->_usesStrictMatching)
        v10 = 48;
      v11 = *(id *)((char *)&activationRules->var0 + v10);
      v23[0] = CFSTR("TYPES");
      v23[1] = CFSTR("REJECTED_TYPES");
      v24[0] = v5;
      v24[1] = v7;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = v24;
      v14 = (const __CFString **)v23;
      v15 = 2;
    }
    else
    {
      v17 = 24;
      if (!self->_usesStrictMatching)
        v17 = 32;
      v11 = *(id *)((char *)&activationRules->var0 + v17);
      v25 = CFSTR("TYPES");
      v26[0] = v5;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = v26;
      v14 = &v25;
      v15 = 1;
    }
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithSubstitutionVariables:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  _EXExtensionMakeAndPredicate(v4, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)strictMatchingSpecified
{
  return self->_strictMatchingSpecified;
}

- (BOOL)usesStrictMatching
{
  return self->_usesStrictMatching;
}

- (NSDictionary)predicateDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (_EXExtensionActivationRules)activationRules
{
  return self->_activationRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateDictionary, 0);
}

- (void)predicateForCountingRule:type:exceptTypes:specifiedCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: Unable to create predicate!", v2, v3, v4, v5, 2u);
}

- (void)predicateForRejectExceptOtherTypesRule:type:otherTypes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: Unable to create predicate!", v2, v3, v4, v5, 2u);
}

@end
