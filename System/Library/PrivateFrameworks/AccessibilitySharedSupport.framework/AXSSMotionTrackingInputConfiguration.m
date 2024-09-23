@implementation AXSSMotionTrackingInputConfiguration

- (AXSSMotionTrackingInputConfiguration)initWithOrderedInputPreference:(id)a3 allowedTrackingTypes:(id)a4 allowSeparateInputForExpressions:(BOOL)a5
{
  id v8;
  id v9;
  AXSSMotionTrackingInputConfiguration *v10;
  uint64_t v11;
  NSArray *orderedInputPreference;
  uint64_t v13;
  NSSet *allowedTrackingTypes;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXSSMotionTrackingInputConfiguration;
  v10 = -[AXSSMotionTrackingInputConfiguration init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    orderedInputPreference = v10->_orderedInputPreference;
    v10->_orderedInputPreference = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    allowedTrackingTypes = v10->_allowedTrackingTypes;
    v10->_allowedTrackingTypes = (NSSet *)v13;

    v10->_allowSeparateInputForExpressions = a5;
  }

  return v10;
}

- (AXSSMotionTrackingInputConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSSMotionTrackingInputConfiguration;
  return -[AXSSMotionTrackingInputConfiguration init](&v3, sel_init);
}

- (AXSSMotionTrackingInputConfiguration)initWithPlistDictionary:(id)a3
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
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  AXSSMotionTrackingInputConfiguration *v20;
  uint64_t v21;
  NSArray *orderedInputPreference;
  uint64_t v23;
  NSSet *allowedTrackingTypes;
  objc_super v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    NSStringFromSelector(sel_orderedInputPreference);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __64__AXSSMotionTrackingInputConfiguration_initWithPlistDictionary___block_invoke;
      v29[3] = &unk_1E5F98E58;
      v29[4] = &v36;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v29);
    }
    NSStringFromSelector(sel_allowedTrackingTypes);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = (void *)MEMORY[0x1E0C99E60];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v28;

    if (!v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v31[5])
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v31[5];
          v31[5] = v15;

        }
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __64__AXSSMotionTrackingInputConfiguration_initWithPlistDictionary___block_invoke_2;
        v27[3] = &unk_1E5F98E80;
        v27[4] = &v30;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v27);
      }
    }
    NSStringFromSelector(sel_allowSeparateInputForExpressions);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = objc_msgSend(v18, "BOOLValue");
    else
      v19 = 0;

  }
  else
  {
    v19 = 0;
  }
  v26.receiver = self;
  v26.super_class = (Class)AXSSMotionTrackingInputConfiguration;
  v20 = -[AXSSMotionTrackingInputConfiguration init](&v26, sel_init);
  if (v20)
  {
    v21 = objc_msgSend((id)v37[5], "copy");
    orderedInputPreference = v20->_orderedInputPreference;
    v20->_orderedInputPreference = (NSArray *)v21;

    v23 = objc_msgSend((id)v31[5], "copy");
    allowedTrackingTypes = v20->_allowedTrackingTypes;
    v20->_allowedTrackingTypes = (NSSet *)v23;

    v20->_allowSeparateInputForExpressions = v19;
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v20;
}

void __64__AXSSMotionTrackingInputConfiguration_initWithPlistDictionary___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    +[AXSSMotionTrackingInput motionTrackingInputFromPlistDictionary:](AXSSMotionTrackingInput, "motionTrackingInputFromPlistDictionary:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      objc_msgSend(v6, "addObject:", v5);
    }

    v4 = v10;
  }

}

void __64__AXSSMotionTrackingInputConfiguration_initWithPlistDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") <= 3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

- (NSDictionary)plistDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  -[AXSSMotionTrackingInputConfiguration orderedInputPreference](self, "orderedInputPreference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__AXSSMotionTrackingInputConfiguration_plistDictionary__block_invoke;
  v22[3] = &unk_1E5F98EA8;
  v22[4] = &v23;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v22);

  v5 = (void *)v24[5];
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "copy");
    NSStringFromSelector(sel_orderedInputPreference);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  }
  -[AXSSMotionTrackingInputConfiguration allowedTrackingTypes](self, "allowedTrackingTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0CB36F8];
    -[AXSSMotionTrackingInputConfiguration allowedTrackingTypes](self, "allowedTrackingTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    NSStringFromSelector(sel_allowedTrackingTypes);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v14);

    if (v13)
    {
      AXSSLogForCategory(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[AXSSMotionTrackingInputConfiguration allowedTrackingTypes](self, "allowedTrackingTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSSMotionTrackingInputConfiguration plistDictionary].cold.1(v16, (uint64_t)v13, buf, v15);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSMotionTrackingInputConfiguration allowSeparateInputForExpressions](self, "allowSeparateInputForExpressions"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_allowSeparateInputForExpressions);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v18);

  v19 = (void *)objc_msgSend(v3, "copy");
  _Block_object_dispose(&v23, 8);

  return (NSDictionary *)v19;
}

void __55__AXSSMotionTrackingInputConfiguration_plistDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a2, "plistDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v10 = v3;
    v5 = objc_msgSend(v3, "count");
    v4 = v10;
    if (v5)
    {
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      objc_msgSend(v6, "addObject:", v10);
      v4 = v10;
    }
  }

}

- (NSArray)orderedCameraInputPreference
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[AXSSMotionTrackingInputConfiguration orderedInputPreference](self, "orderedInputPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return (NSArray *)0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[AXSSMotionTrackingInputConfiguration orderedInputPreference](self, "orderedInputPreference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__AXSSMotionTrackingInputConfiguration_orderedCameraInputPreference__block_invoke;
  v8[3] = &unk_1E5F98EA8;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __68__AXSSMotionTrackingInputConfiguration_orderedCameraInputPreference__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)AXSSMotionTrackingInputConfiguration;
  -[AXSSMotionTrackingInputConfiguration description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingInputConfiguration orderedInputPreference](self, "orderedInputPreference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingInputConfiguration allowedTrackingTypes](self, "allowedTrackingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <orderedInputPreference %@ allowedTrackingTypes %@ allowSeparateInputForExpressions %d>"), v4, v5, v6, -[AXSSMotionTrackingInputConfiguration allowSeparateInputForExpressions](self, "allowSeparateInputForExpressions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)supportsTrackingType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[AXSSMotionTrackingInputConfiguration allowedTrackingTypes](self, "allowedTrackingTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  if (!a3)
    return 0;
  -[AXSSMotionTrackingInputConfiguration allowedTrackingTypes](self, "allowedTrackingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AXSSMotionTrackingInputConfiguration orderedInputPreference](self, "orderedInputPreference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXSSMotionTrackingInputConfiguration orderedInputPreference](self, "orderedInputPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_orderedInputPreference);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v5, v6);

  }
  -[AXSSMotionTrackingInputConfiguration allowedTrackingTypes](self, "allowedTrackingTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXSSMotionTrackingInputConfiguration allowedTrackingTypes](self, "allowedTrackingTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_allowedTrackingTypes);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v8, v9);

  }
  v10 = -[AXSSMotionTrackingInputConfiguration allowSeparateInputForExpressions](self, "allowSeparateInputForExpressions");
  NSStringFromSelector(sel_allowSeparateInputForExpressions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeBool:forKey:", v10, v11);

}

- (AXSSMotionTrackingInputConfiguration)initWithCoder:(id)a3
{
  id v4;
  AXSSMotionTrackingInputConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *orderedInputPreference;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSSet *allowedTrackingTypes;
  void *v22;

  v4 = a3;
  v5 = -[AXSSMotionTrackingInputConfiguration init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_orderedInputPreference);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    orderedInputPreference = v5->_orderedInputPreference;
    v5->_orderedInputPreference = (NSArray *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_allowedTrackingTypes);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v19 = v18;
    v20 = objc_msgSend(v18, "copy");
    allowedTrackingTypes = v5->_allowedTrackingTypes;
    v5->_allowedTrackingTypes = (NSSet *)v20;

    NSStringFromSelector(sel_allowSeparateInputForExpressions);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowSeparateInputForExpressions = objc_msgSend(v4, "decodeBoolForKey:", v22);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  AXSSMotionTrackingInputConfiguration *v4;

  -[AXSSMotionTrackingInputConfiguration plistDictionary](self, "plistDictionary", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXSSMotionTrackingInputConfiguration initWithPlistDictionary:]([AXSSMotionTrackingInputConfiguration alloc], "initWithPlistDictionary:", v3);

  return v4;
}

- (BOOL)isEqualToMotionTrackingInputConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSSMotionTrackingInputConfiguration plistDictionary](self, "plistDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plistDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXSSMotionTrackingInputConfiguration plistDictionary](self, "plistDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[AXSSMotionTrackingInputConfiguration isEqualToMotionTrackingInputConfiguration:](self, "isEqualToMotionTrackingInputConfiguration:", v4);

  return v5;
}

- (NSArray)orderedInputPreference
{
  return self->_orderedInputPreference;
}

- (void)setOrderedInputPreference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)allowedTrackingTypes
{
  return self->_allowedTrackingTypes;
}

- (void)setAllowedTrackingTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)allowSeparateInputForExpressions
{
  return self->_allowSeparateInputForExpressions;
}

- (void)setAllowSeparateInputForExpressions:(BOOL)a3
{
  self->_allowSeparateInputForExpressions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTrackingTypes, 0);
  objc_storeStrong((id *)&self->_orderedInputPreference, 0);
}

- (void)plistDictionary
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1AF5CC000, log, OS_LOG_TYPE_ERROR, "ERROR: Couldn't encode object %@, encountered error: %@", buf, 0x16u);

}

@end
