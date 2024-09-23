@implementation SGEntityMatchingTransformer

- (SGEntityMatchingTransformer)initWithTargetMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 addressMapping:(id)a6 andDateMapping:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SGEntityMatchingTransformer *v17;
  SGEntityMatchingTransformer *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SGEntityMatchingTransformer;
  v17 = -[SGEntityMatchingTransformer init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[SGEntityMatchingTransformer setTargetMapping:](v17, "setTargetMapping:", v12);
    -[SGEntityMatchingTransformer setPhoneMapping:](v18, "setPhoneMapping:", v13);
    -[SGEntityMatchingTransformer setEmailMapping:](v18, "setEmailMapping:", v14);
    -[SGEntityMatchingTransformer setAddressMapping:](v18, "setAddressMapping:", v15);
    -[SGEntityMatchingTransformer setDateMapping:](v18, "setDateMapping:", v16);
  }

  return v18;
}

- (id)transform:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  SGDataDetectorMatch *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SGDataDetectorMatch *v28;
  void *v29;
  void *v30;
  char v31;
  __CFString *v32;
  NSObject *v33;
  void *v35;
  _QWORD v36[4];
  SGDataDetectorMatch *v37;
  SGEntityMatchingTransformer *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("INPUT_TEXT")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntityMatchingTransformer.m"), 72, CFSTR("Unexpected input: %@. %@ requires dictionary with SG_MODEL_INPUT_TEXT key."), v5, v9);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SG_MODEL_DISABLE_TARGET_MAPPING"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_13;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TARGET_MATCH"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DD_MATCHES"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SG_MODEL_INPUT_TARGET_RANGE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGEntityMatchingTransformer.m"), 81, CFSTR("Unexpected input: %@. %@ requires SG_MODEL_DISABLE_TARGET_MAPPING to be setif neither SG_MODEL_TARGET_DD_MATCH and SG_MODEL_INPUT_TARGET_RANGE are provied."), v5, v12);
    goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("INPUT_TEXT"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TARGET_MATCH"));
  v16 = (SGDataDetectorMatch *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DD_MATCHES"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SG_MODEL_INPUT_TARGET_RANGE"));
    v16 = (SGDataDetectorMatch *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SG_MODEL_INPUT_TARGET_RANGE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "rangeValue");
      v21 = v20;

      v16 = -[SGDataDetectorMatch initWithMatchType:range:labelRange:labelString:valueRange:valueString:]([SGDataDetectorMatch alloc], "initWithMatchType:range:labelRange:labelString:valueRange:valueString:", 9, 0, 0, 0, 0, 0, v19, v21, 0);
      if (v17 && objc_msgSend(v17, "count"))
      {
        -[SGEntityMatchingTransformer extendMatchArray:withTarget:](self, "extendMatchArray:withTarget:", v17, v16);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v23 = (void *)v22;

      v17 = v23;
    }
  }
  v24 = objc_msgSend(v15, "range");
  if (v17)
  {
    v26 = v24;
    v27 = v25;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __41__SGEntityMatchingTransformer_transform___block_invoke;
    v36[3] = &unk_1E7DB44D0;
    v28 = v16;
    v37 = v28;
    v38 = self;
    v39 = v15;
    objc_msgSend(v39, "stringByReplacingMatches:inRange:withBlock:", v17, v26, v27, v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28
      && (-[SGEntityMatchingTransformer targetMapping](self, "targetMapping"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v29, "containsString:", v30),
          v30,
          (v31 & 1) == 0))
    {
      sgLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        -[SGEntityMatchingTransformer targetMapping](self, "targetMapping");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v35;
        _os_log_fault_impl(&dword_1C3607000, v33, OS_LOG_TYPE_FAULT, "Could not find %@ in message", buf, 0xCu);

      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
      v32 = &stru_1E7DB83A8;
    }
    else
    {
      v32 = v29;
    }

  }
  else
  {
    v32 = v15;
  }

  return v32;
}

- (id)extendMatchArray:(id)a3 withTarget:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count") + 1);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    obj = v8;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1C3BD4F6C]();
        if (v11)
          goto LABEL_10;
        v16 = objc_msgSend(v14, "valueRange");
        if (v16 + v17 >= (unint64_t)objc_msgSend(v6, "valueRange"))
        {
          objc_msgSend(v7, "addObject:", v6);
LABEL_10:
          v19 = objc_msgSend(v6, "valueRange", obj);
          v18 = 0;
          v21 = 0;
          v11 = 1;
          if (v19 + v20 >= (unint64_t)objc_msgSend(v14, "valueRange"))
            goto LABEL_12;
          goto LABEL_11;
        }
        v11 = 0;
        v18 = 1;
LABEL_11:
        objc_msgSend(v7, "addObject:", v14, obj);
        v21 = v18;
LABEL_12:
        objc_autoreleasePoolPop(v15);
      }
      v8 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v10)
      {

        if (!v21)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
  }

LABEL_17:
  objc_msgSend(v7, "addObject:", v6);
LABEL_18:
  v22 = (void *)objc_msgSend(v7, "copy");

  return v22;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("TARGET_MAPPING");
  -[SGEntityMatchingTransformer targetMapping](self, "targetMapping", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("PHONE_MAPPING");
  -[SGEntityMatchingTransformer phoneMapping](self, "phoneMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("EMAIL_MAPPING");
  -[SGEntityMatchingTransformer emailMapping](self, "emailMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("ADDRESS_MAPPING");
  -[SGEntityMatchingTransformer addressMapping](self, "addressMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  v11[4] = CFSTR("DATE_MAPPING");
  -[SGEntityMatchingTransformer dateMapping](self, "dateMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SGEntityMatchingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SGEntityMatchingTransformer *v12;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TARGET_MAPPING"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHONE_MAPPING"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EMAIL_MAPPING"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ADDRESS_MAPPING"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DATE_MAPPING"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SGEntityMatchingTransformer initWithTargetMapping:phoneMapping:emailMapping:addressMapping:andDateMapping:](self, "initWithTargetMapping:phoneMapping:emailMapping:addressMapping:andDateMapping:", v7, v8, v9, v10, v11);
  return v12;
}

- (BOOL)isEqualToEntityMatchingTransformer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;

  v7 = a3;
  if (v7)
  {
    -[SGEntityMatchingTransformer targetMapping](self, "targetMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[SGEntityMatchingTransformer targetMapping](self, "targetMapping");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "targetMapping");
      v37 = v10;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqual:"))
      {
        v11 = 0;
        goto LABEL_29;
      }
    }
    -[SGEntityMatchingTransformer phoneMapping](self, "phoneMapping");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneMapping");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != v13)
    {
      -[SGEntityMatchingTransformer phoneMapping](self, "phoneMapping");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "phoneMapping");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isEqual:", v3))
      {
        v11 = 0;
LABEL_27:

LABEL_28:
        if (v8 == v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    -[SGEntityMatchingTransformer emailMapping](self, "emailMapping");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailMapping");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v14;
    if (v14 == v35)
    {
      v32 = v3;
    }
    else
    {
      -[SGEntityMatchingTransformer emailMapping](self, "emailMapping");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emailMapping");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        v11 = 0;
        v19 = (void *)v35;
        v18 = v36;
LABEL_25:

LABEL_26:
        if (v12 == v13)
          goto LABEL_28;
        goto LABEL_27;
      }
      v32 = v3;
    }
    -[SGEntityMatchingTransformer addressMapping](self, "addressMapping");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addressMapping");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {
      v29 = v5;
      v30 = v13;
    }
    else
    {
      -[SGEntityMatchingTransformer addressMapping](self, "addressMapping");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addressMapping");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isEqual:"))
      {
        v11 = 0;
        goto LABEL_23;
      }
      v29 = v5;
      v30 = v13;
    }
    -[SGEntityMatchingTransformer dateMapping](self, "dateMapping");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateMapping");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

      v11 = 1;
    }
    else
    {
      v22 = (void *)v21;
      -[SGEntityMatchingTransformer dateMapping](self, "dateMapping");
      v27 = v4;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateMapping");
      v28 = v12;
      v24 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v23, "isEqual:", v25);

      v16 = v24;
      v12 = v28;

      v4 = v27;
    }
    v5 = v29;
    v13 = v30;
    if (v16 == v17)
    {
LABEL_24:

      v19 = (void *)v35;
      v18 = v36;
      v3 = v32;
      if (v36 == (void *)v35)
        goto LABEL_26;
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  v11 = 0;
LABEL_31:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SGEntityMatchingTransformer *v4;
  SGEntityMatchingTransformer *v5;
  BOOL v6;

  v4 = (SGEntityMatchingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGEntityMatchingTransformer isEqualToEntityMatchingTransformer:](self, "isEqualToEntityMatchingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[SGEntityMatchingTransformer targetMapping](self, "targetMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[SGEntityMatchingTransformer phoneMapping](self, "phoneMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[SGEntityMatchingTransformer emailMapping](self, "emailMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[SGEntityMatchingTransformer addressMapping](self, "addressMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  -[SGEntityMatchingTransformer dateMapping](self, "dateMapping");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10;

  return v12;
}

- (NSString)targetMapping
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTargetMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)phoneMapping
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPhoneMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)emailMapping
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEmailMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)addressMapping
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAddressMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)dateMapping
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDateMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateMapping, 0);
  objc_storeStrong((id *)&self->_addressMapping, 0);
  objc_storeStrong((id *)&self->_emailMapping, 0);
  objc_storeStrong((id *)&self->_phoneMapping, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
}

id __41__SGEntityMatchingTransformer_transform___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  v4 = v3;
  v5 = *(id *)(a1 + 32);
  if (v5)
    v6 = v5 == v3;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "targetMapping");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (void *)v7;
  }
  else
  {
    switch(objc_msgSend(v3, "matchType"))
    {
      case 0u:
        objc_msgSend(*(id *)(a1 + 40), "phoneMapping");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 1u:
        objc_msgSend(*(id *)(a1 + 40), "addressMapping");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 2u:
        objc_msgSend(*(id *)(a1 + 40), "emailMapping");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 3u:
        objc_msgSend(*(id *)(a1 + 40), "dateMapping");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      default:
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v4, "valueString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          v14 = *(void **)(a1 + 48);
          v15 = objc_msgSend(v4, "valueRange");
          objc_msgSend(v14, "substringWithRange:", v15, v16);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v8 = v13;

        objc_autoreleasePoolPop(v10);
        break;
    }
  }

  return v8;
}

+ (id)withTargetMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 addressMapping:(id)a6 andDateMapping:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTargetMapping:phoneMapping:emailMapping:addressMapping:andDateMapping:", v16, v15, v14, v13, v12);

  return v17;
}

@end
