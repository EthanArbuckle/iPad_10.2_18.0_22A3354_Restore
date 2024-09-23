@implementation BLSAssertionDescriptor

- (BLSAssertionDescriptor)initWithExplanation:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  BLSAssertionDescriptor *v8;
  uint64_t v9;
  NSString *explanation;
  uint64_t v11;
  NSArray *attributes;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  id v16;
  NSArray *v17;
  id v18;
  uint64_t v19;
  NSArray *v20;
  NSArray *v21;
  void *v22;
  uint64_t v23;
  NSArray *v24;
  NSArray *v25;
  void *v26;
  uint64_t v27;
  NSArray *v28;
  NSArray *v29;
  void *v30;
  uint64_t v31;
  NSArray *v32;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  objc_super v74;

  v6 = a3;
  v7 = a4;
  v74.receiver = self;
  v74.super_class = (Class)BLSAssertionDescriptor;
  v8 = -[BLSAssertionDescriptor init](&v74, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    explanation = v8->_explanation;
    v8->_explanation = (NSString *)v9;

    v34 = v7;
    v11 = objc_msgSend(v7, "copy");
    attributes = v8->_attributes;
    v8->_attributes = (NSArray *)v11;

    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8->_attributes;
    v15 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __57__BLSAssertionDescriptor_initWithExplanation_attributes___block_invoke;
    v37[3] = &unk_1E621B018;
    v39 = &v66;
    v40 = &v62;
    v16 = v13;
    v38 = v16;
    v41 = &v58;
    v42 = &v54;
    v43 = &v50;
    v44 = &v70;
    v45 = &v46;
    -[NSArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v37);
    v17 = v8->_attributes;
    v35[0] = v15;
    v35[1] = 3221225472;
    v35[2] = __57__BLSAssertionDescriptor_initWithExplanation_attributes___block_invoke_2;
    v35[3] = &unk_1E621B040;
    v18 = v16;
    v36 = v18;
    -[NSArray bs_filter:](v17, "bs_filter:", v35);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v8->_attributes;
    v8->_attributes = (NSArray *)v19;

    if (*((_BYTE *)v71 + 24) && !*((_BYTE *)v67 + 24))
    {
      v21 = v8->_attributes;
      +[BLSValidWhenBacklightInactiveAttribute cancelWhenBacklightInactivates](BLSValidWhenBacklightInactiveAttribute, "cancelWhenBacklightInactivates");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray arrayByAddingObject:](v21, "arrayByAddingObject:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v8->_attributes;
      v8->_attributes = (NSArray *)v23;

    }
    if (*((_BYTE *)v47 + 24) && !*((_BYTE *)v55 + 24))
    {
      v25 = v8->_attributes;
      +[BLSDisableFlipbookAttribute disableFlipbook](BLSDisableFlipbookAttribute, "disableFlipbook");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray arrayByAddingObject:](v25, "arrayByAddingObject:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v8->_attributes;
      v8->_attributes = (NSArray *)v27;

      *((_BYTE *)v55 + 24) = 1;
    }
    if ((*((_BYTE *)v63 + 24) || *((_BYTE *)v59 + 24) || *((_BYTE *)v55 + 24)) && !*((_BYTE *)v51 + 24))
    {
      v29 = v8->_attributes;
      +[BLSInvalidOnSystemSleepAttribute invalidateOnSystemSleep](BLSInvalidOnSystemSleepAttribute, "invalidateOnSystemSleep");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray arrayByAddingObject:](v29, "arrayByAddingObject:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v8->_attributes;
      v8->_attributes = (NSArray *)v31;

    }
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);
    v7 = v34;
  }

  return v8;
}

void __57__BLSAssertionDescriptor_initWithExplanation_attributes___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = a1[5];
LABEL_18:
    *(_BYTE *)(*(_QWORD *)(v3 + 8) + 24) = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v4 = (void *)a1[4];
    objc_msgSend(v6, "sceneIdentityToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = a1[6];
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = a1[7];
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = a1[8];
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v3 = a1[9];
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v3 = a1[10];
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v3 = a1[11];
      goto LABEL_18;
    }
  }
LABEL_19:

}

BOOL __57__BLSAssertionDescriptor_initWithExplanation_attributes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_opt_class();
  v6 = 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "sceneIdentityToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((v4 & 1) != 0)
      v6 = 0;
  }

  return v6;
}

- (id)attributeOfClass:(Class)a3
{
  NSArray *attributes;
  uint64_t v5;
  _QWORD v7[5];

  attributes = self->_attributes;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__BLSAssertionDescriptor_attributeOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e29_B32__0__BLSAttribute_8Q16_B24lu32l8;
  v7[4] = a3;
  v5 = -[NSArray indexOfObjectPassingTest:](attributes, "indexOfObjectPassingTest:", v7);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[NSArray objectAtIndex:](self->_attributes, "objectAtIndex:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __43__BLSAssertionDescriptor_attributeOfClass___block_invoke(uint64_t a1)
{
  return objc_opt_class() == *(_QWORD *)(a1 + 32);
}

- (id)attributesOfClasses:(id)a3
{
  id v4;
  NSArray *attributes;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  attributes = self->_attributes;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__BLSAssertionDescriptor_attributesOfClasses___block_invoke;
  v10[3] = &unk_1E621B088;
  v11 = v4;
  v6 = v4;
  -[NSArray indexesOfObjectsPassingTest:](attributes, "indexesOfObjectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectsAtIndexes:](attributes, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __46__BLSAssertionDescriptor_attributesOfClasses___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_opt_class());
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v27;
  BLSAssertionDescriptor *v28;
  BOOL v29;
  id *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[BLSAssertionDescriptor attributes](self, "attributes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  v10 = v9 == 0;
  if (!v9)
  {
    v12 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v11 = v9;
  v27 = a2;
  v28 = self;
  v30 = a4;
  v29 = v9 == 0;
  v12 = 0;
  v13 = *(_QWORD *)v33;
  v10 = 1;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v33 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      v31 = 0;
      v16 = objc_msgSend(v15, "checkEntitlementSourceForRequiredEntitlements:error:", v7, &v31);
      v17 = v31;
      v18 = v17;
      if ((v16 & 1) == 0)
      {
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("checkEntitlementSourceForRequiredEntitlements returned NO but did not return an error for attribute:%@"), v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[BLSAssertionDescriptor checkEntitlementSourceForRequiredEntitlements:error:].cold.1(v27, (uint64_t)v28, (uint64_t)v25);
          objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1B0C9624CLL);
        }
        if (v12)
        {
          objc_msgSend(v12, "addObject:", v17);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v10 = 0;
      }

    }
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  }
  while (v11);

  if (v30 != 0 && !v10)
  {
    objc_msgSend(v12, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "count") < 2)
    {
      v8 = objc_retainAutorelease(v8);
      *v30 = v8;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v36[0] = *MEMORY[0x1E0CB2D50];
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ missing multiple entitlements including '%@'"), v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = *MEMORY[0x1E0CB2F70];
      v37[0] = v23;
      v37[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.BacklightServices"), 21, v24);
      *v30 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = v29;
    goto LABEL_23;
  }
LABEL_24:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_explanation, CFSTR("explanation"));
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_attributes, CFSTR("attributes"), 0);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_explanation);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_attributes);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BLSAssertionDescriptor *v4;
  BLSAssertionDescriptor *v5;
  NSString *explanation;
  void *v7;
  NSArray *attributes;
  void *v9;
  char v10;

  v4 = (BLSAssertionDescriptor *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      explanation = self->_explanation;
      -[BLSAssertionDescriptor explanation](v5, "explanation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](explanation, "isEqual:", v7))
      {
        attributes = self->_attributes;
        -[BLSAssertionDescriptor attributes](v5, "attributes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSArray isEqual:](attributes, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BLSAssertionDescriptor)initWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *string;
  __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  BLSAssertionDescriptor *v19;
  _QWORD applier[4];
  id v22;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("explanation"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("attributes"), "UTF8String");
  string = xpc_dictionary_get_string(v4, v5);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    bls_assertions_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BLSAssertionDescriptor initWithXPCDictionary:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

    v8 = CFSTR("<NULL>");
  }
  xpc_dictionary_get_array(v4, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke;
  applier[3] = &unk_1E621AE40;
  v22 = v17;
  v18 = v17;
  xpc_array_apply(v16, applier);
  v19 = -[BLSAssertionDescriptor initWithExplanation:attributes:](self, "initWithExplanation:attributes:", v8, v18);

  return v19;
}

uint64_t __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  if (!v5)
  {
    bls_assertions_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    bls_assertions_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke_cold_2((uint64_t)v5, (uint64_t)v4, v6);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
LABEL_9:

  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v4;
  xpc_object_t xdict;

  xdict = a3;
  v4 = (const char *)objc_msgSend(CFSTR("explanation"), "UTF8String");
  objc_msgSend(CFSTR("attributes"), "UTF8String");
  xpc_dictionary_set_string(xdict, v4, -[NSString UTF8String](self->_explanation, "UTF8String"));
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSAssertionDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BLSAssertionDescriptor *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("explanation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("attributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BLSAssertionDescriptor initWithExplanation:attributes:](self, "initWithExplanation:attributes:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *explanation;
  id v5;

  explanation = self->_explanation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", explanation, CFSTR("explanation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("attributes"));

}

- (NSString)explanation
{
  return self->_explanation;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
}

- (void)checkEntitlementSourceForRequiredEntitlements:(uint64_t)a3 error:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BLSAssertionDescriptor.m");
  v16 = 1024;
  v17 = 125;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1B0C75000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)initWithXPCDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1B0C75000, a2, a3, "failed to decode explanation from %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1B0C75000, a2, a3, "unable to decode attribute for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __48__BLSAssertionDescriptor_initWithXPCDictionary___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_fault_impl(&dword_1B0C75000, log, OS_LOG_TYPE_FAULT, "decoded object:%{public}@ for %{public}@ is not a BLSAttribute class", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_6();
}

@end
