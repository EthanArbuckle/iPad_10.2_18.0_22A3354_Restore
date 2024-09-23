@implementation HDFHIRExtensionElement

- (HDFHIRExtensionElement)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDFHIRExtensionElement)initWithJSONDictionary:(id)a3 URI:(id)a4 value:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDFHIRExtensionElement *v12;
  uint64_t v13;
  NSDictionary *JSONDictionary;
  uint64_t v15;
  NSString *URI;
  uint64_t v17;
  NSCopying *value;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDFHIRExtensionElement.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[JSONDictionary isKindOfClass:[NSDictionary class]]"));

  }
  v21.receiver = self;
  v21.super_class = (Class)HDFHIRExtensionElement;
  v12 = -[HDFHIRExtensionElement init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    JSONDictionary = v12->_JSONDictionary;
    v12->_JSONDictionary = (NSDictionary *)v13;

    v15 = objc_msgSend(v10, "copy");
    URI = v12->_URI;
    v12->_URI = (NSString *)v15;

    v17 = objc_msgSend(v11, "copyWithZone:", 0);
    value = v12->_value;
    v12->_value = (NSCopying *)v17;

  }
  return v12;
}

+ (id)FHIRExtensionElementWithJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    HKSafeObject();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "hk_safeStringForKeyPath:error:", CFSTR("url"), a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hk_firstObjectPassingTest:", &__block_literal_global_5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithJSONDictionary:URI:value:", v8, v9, v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("nil JSON object"));
    v13 = 0;
  }

  return v13;
}

uint64_t __67__HDFHIRExtensionElement_FHIRExtensionElementWithJSONObject_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("value"));
}

+ (id)FHIRExtensionElementsFromJSONExtensionObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  os_log_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id *v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("nil JSON object"));
    v22 = 0;
    goto LABEL_34;
  }
  objc_opt_class();
  HKSafeObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v22 = 0;
    goto LABEL_33;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v22 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_33;
  }
  v27 = a4;
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = v7;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (!v10)
    goto LABEL_20;
  v11 = v10;
  v12 = *(_QWORD *)v32;
  v13 = (os_log_t *)MEMORY[0x24BDD2FF8];
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v9);
      v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v14);
      v30 = 0;
      +[HDFHIRExtensionElement FHIRExtensionElementWithJSONObject:error:](HDFHIRExtensionElement, "FHIRExtensionElementWithJSONObject:error:", v15, &v30, v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v30;
      if (v16)
      {
        v18 = v8;
        v19 = v16;
        goto LABEL_14;
      }
      _HKInitializeLogging();
      v20 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        if (!v17)
          goto LABEL_15;
LABEL_13:
        v18 = v29;
        v19 = v17;
LABEL_14:
        objc_msgSend(v18, "addObject:", v19);
        goto LABEL_15;
      }
      +[HDFHIRExtensionElement FHIRExtensionElementsFromJSONExtensionObject:error:].cold.1(v35, v20, (uint64_t)v17, &v36);
      if (v17)
        goto LABEL_13;
LABEL_15:

      ++v14;
    }
    while (v11 != v14);
    v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    v11 = v21;
  }
  while (v21);
LABEL_20:

  if (objc_msgSend(v8, "count"))
  {
    v22 = v8;
    v7 = v28;
    v23 = v29;
  }
  else
  {
    v23 = v29;
    if (objc_msgSend(v29, "count"))
    {
      objc_msgSend(v29, "firstObject");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v7 = v28;
      if (v24)
      {
        if (v27)
          *v27 = objc_retainAutorelease(v24);
        else
          _HKLogDroppedError();
      }

      v22 = 0;
    }
    else
    {
      v22 = 0;
      v7 = v28;
    }
  }

LABEL_33:
LABEL_34:

  return v22;
}

- (NSString)URI
{
  return self->_URI;
}

- (NSCopying)value
{
  return self->_value;
}

- (NSDictionary)JSONDictionary
{
  return self->_JSONDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONDictionary, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_URI, 0);
}

+ (void)FHIRExtensionElementsFromJSONExtensionObject:(uint64_t)a3 error:(_QWORD *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v6;
  void *v7;

  v6 = a2;
  HKSensitiveLogItem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v7;
  _os_log_error_impl(&dword_224DAC000, v6, OS_LOG_TYPE_ERROR, "Invalid extension element: %@", a1, 0xCu);

}

@end
