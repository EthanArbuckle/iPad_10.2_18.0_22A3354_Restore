@implementation CHSWidgetDescriptorsBox

- (CHSWidgetDescriptorsBox)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CHSWidgetDescriptorsBox *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("descriptors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __41__CHSWidgetDescriptorsBox_initWithCoder___block_invoke(v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    self = -[CHSWidgetDescriptorsBox initWithDescriptors:](self, "initWithDescriptors:", v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[CHSWidgetDescriptorsBox _performValidation](self, "_performValidation");
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptorsByExtensionIdentifier, CFSTR("descriptors"));

}

- (CHSWidgetDescriptorsBox)initWithDescriptors:(id)a3
{
  id v4;
  CHSWidgetDescriptorsBox *v5;
  uint64_t v6;
  NSDictionary *descriptorsByExtensionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetDescriptorsBox;
  v5 = -[CHSWidgetDescriptorsBox init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    descriptorsByExtensionIdentifier = v5->_descriptorsByExtensionIdentifier;
    v5->_descriptorsByExtensionIdentifier = (NSDictionary *)v6;

    -[CHSWidgetDescriptorsBox _performValidation](v5, "_performValidation");
  }

  return v5;
}

- (void)_performValidation
{
  NSDictionary *descriptorsByExtensionIdentifier;
  _QWORD v3[6];

  descriptorsByExtensionIdentifier = self->_descriptorsByExtensionIdentifier;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__CHSWidgetDescriptorsBox__performValidation__block_invoke;
  v3[3] = &unk_1E2A5AA70;
  v3[4] = self;
  v3[5] = a2;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](descriptorsByExtensionIdentifier, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __45__CHSWidgetDescriptorsBox__performValidation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = objc_opt_class();
    objc_msgSend(v5, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Key for CHSWidgetDescriptorsBox was of unexpected type: %@, value: %@"), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544642;
      v45 = v25;
      v46 = 2114;
      v47 = v27;
      v48 = 2048;
      v49 = v28;
      v50 = 2114;
      v51 = CFSTR("CHSWidgetDescriptorsBox.m");
      v52 = 1024;
      v53 = 36;
      v54 = 2114;
      v55 = v24;
      _os_log_error_impl(&dword_18FB18000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    v29 = _bs_set_crash_log_message();
    __45__CHSWidgetDescriptorsBox__performValidation__block_invoke_cold_1(v29);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = objc_opt_class();
    objc_msgSend(v6, "description");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Array type for CHSWidgetDescriptorsBox at key: %@ was of unexpected type: %@, value: %@"), v5, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544642;
      v45 = v34;
      v46 = 2114;
      v47 = v36;
      v48 = 2048;
      v49 = v37;
      v50 = 2114;
      v51 = CFSTR("CHSWidgetDescriptorsBox.m");
      v52 = 1024;
      v53 = 37;
      v54 = 2114;
      v55 = v33;
      _os_log_error_impl(&dword_18FB18000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    v38 = _bs_set_crash_log_message();
    __45__CHSWidgetDescriptorsBox__performValidation__block_invoke_cold_1(v38);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          v13 = objc_opt_class();
          objc_msgSend(v11, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("Array value for CHSWidgetDescriptorsBox at key: %@ was of unexpected type: %@, value: %@"), v5, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 40));
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v45 = v16;
            v46 = 2114;
            v47 = v18;
            v48 = 2048;
            v49 = v19;
            v50 = 2114;
            v51 = CFSTR("CHSWidgetDescriptorsBox.m");
            v52 = 1024;
            v53 = 39;
            v54 = 2114;
            v55 = v15;
            _os_log_error_impl(&dword_18FB18000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
          v20 = _bs_set_crash_log_message();
          __45__CHSWidgetDescriptorsBox__performValidation__block_invoke_cold_1(v20);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v8);
  }

}

id __41__CHSWidgetDescriptorsBox_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v21;
      v14 = v3;
      v15 = v2;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v21 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_20:

            goto LABEL_21;
          }
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v3, "objectForKeyedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v17;
            while (2)
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v17 != v10)
                  objc_enumerationMutation(v8);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v3 = v14;
                  v2 = v15;
                  goto LABEL_20;
                }
                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
              if (v9)
                continue;
              break;
            }
          }

          v3 = v14;
          v2 = v15;
          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v4)
          continue;
        break;
      }
    }

    v12 = v3;
  }
  else
  {
LABEL_21:
    v12 = 0;
  }

  return v12;
}

- (NSSet)descriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSDictionary allValues](self->_descriptorsByExtensionIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptorsByExtensionIdentifier, 0);
}

- (NSDictionary)descriptorsByExtensionIdentifier
{
  return self->_descriptorsByExtensionIdentifier;
}

@end
