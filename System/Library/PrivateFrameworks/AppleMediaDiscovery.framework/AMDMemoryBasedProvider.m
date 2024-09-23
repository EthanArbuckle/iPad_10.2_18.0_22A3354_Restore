@implementation AMDMemoryBasedProvider

+ (id)sharedProvider
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedProvider_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_2);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedProvider_sharedProvider;
}

void __40__AMDMemoryBasedProvider_sharedProvider__block_invoke()
{
  AMDMemoryBasedProvider *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(AMDMemoryBasedProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)sharedProvider_sharedProvider, "setFeatureStore:");

}

- (id)getFeatureWithName:(id)a3 withColumn:(id)a4 error:(id *)a5
{
  id v5;
  NSMutableDictionary *v9;
  os_log_t oslog;
  id v11;
  id v12;
  id *v13;
  id v14;
  id location[2];
  AMDMemoryBasedProvider *v16;
  id v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = a5;
  v9 = -[AMDMemoryBasedProvider featureStore](v16, "featureStore");
  v12 = (id)-[NSMutableDictionary objectForKey:](v9, "objectForKey:", location[0]);

  if (v12)
  {
    v17 = +[AMDFeature featureFromValue:](AMDFeature, "featureFromValue:", v12);
  }
  else
  {
    v11 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not find in-memory feature with id %@"), location[0]);
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v11);
      _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v18, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v11);
    *v13 = v5;
    v17 = 0;
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (id)fetchOutputRemapDictForUsecase:(id)a3
{
  NSMutableDictionary *v4;
  id v5;
  id location[2];
  AMDMemoryBasedProvider *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[AMDMemoryBasedProvider featureStore](v7, "featureStore");
  v5 = (id)-[NSMutableDictionary objectForKey:](v4, "objectForKey:", location[0]);

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v5;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)storeFeatureData:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  NSMutableDictionary *v6;
  NSObject *log;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  os_log_t oslog;
  id v16;
  id v17;
  _QWORD __b[8];
  uint64_t v19;
  id v20;
  int v21;
  __CFString *v22;
  id *v23;
  id location[2];
  AMDMemoryBasedProvider *v25;
  uint8_t v26[24];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = location[0];
    memset(__b, 0, sizeof(__b));
    obj = v20;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
    if (v13)
    {
      v9 = *(_QWORD *)__b[2];
      v10 = 0;
      v11 = v13;
      while (1)
      {
        v8 = v10;
        if (*(_QWORD *)__b[2] != v9)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(__b[1] + 8 * v10);
        v17 = (id)objc_msgSend(v20, "objectForKey:", v19);
        if (+[AMDMemoryBasedProvider isValidFeatureObject:](AMDMemoryBasedProvider, "isValidFeatureObject:", v17))
        {
          v21 = 0;
        }
        else
        {
          v16 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid data for feature '%@'"), v19);
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            log = oslog;
            __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v16);
            _os_log_error_impl(&dword_1DC678000, log, OS_LOG_TYPE_ERROR, "%@", v26, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v16);
          *v23 = v5;
          v21 = 1;
          objc_storeStrong(&v16, 0);
        }
        objc_storeStrong(&v17, 0);
        if (v21)
          break;
        ++v10;
        if (v8 + 1 >= v11)
        {
          v10 = 0;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
          if (!v11)
            goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      v21 = 0;
    }

    if (!v21)
    {
      v6 = -[AMDMemoryBasedProvider featureStore](v25, "featureStore");
      -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v20);

      v21 = 0;
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v22 = CFSTR("Inference input data not a dictionary");
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v22);
    *v23 = v4;
    v21 = 1;
    objc_storeStrong((id *)&v22, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)storeOutputRemapData:(id)a3 error:(id *)a4
{
  id v4;
  NSMutableDictionary *v5;
  id v7;
  int v8;
  __CFString *v9;
  id *v10;
  id location[2];
  AMDMemoryBasedProvider *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = location[0];
    v5 = -[AMDMemoryBasedProvider featureStore](v12, "featureStore");
    -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v7);

    objc_storeStrong(&v7, 0);
    v8 = 0;
  }
  else
  {
    v9 = CFSTR("Output mapping is data not a dictionary");
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v9);
    *v10 = v4;
    v8 = 1;
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

+ (BOOL)isValidMultiArray:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obj;
  uint64_t v15;
  _QWORD v16[9];
  _QWORD __b[8];
  uint64_t v18;
  int v19;
  id v20;
  id location[2];
  id v22;
  char v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = (id)objc_msgSend(location[0], "firstObject");
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(__b, 0, sizeof(__b));
      obj = location[0];
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
      if (v15)
      {
        v11 = *(_QWORD *)__b[2];
        v12 = 0;
        v13 = v15;
        while (1)
        {
          v10 = v12;
          if (*(_QWORD *)__b[2] != v11)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(__b[1] + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v23 = 0;
            v19 = 1;
            goto LABEL_15;
          }
          if ((objc_msgSend(v22, "isValidMultiArray:", v18) & 1) == 0)
            break;
          ++v12;
          if (v10 + 1 >= v13)
          {
            v12 = 0;
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
            if (!v13)
              goto LABEL_14;
          }
        }
        v23 = 0;
        v19 = 1;
      }
      else
      {
LABEL_14:
        v19 = 0;
      }
LABEL_15:

      if (!v19)
      {
        v23 = 1;
        v19 = 1;
      }
    }
    else
    {
      memset(v16, 0, 0x40uLL);
      v8 = location[0];
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v16, v24, 16);
      if (v9)
      {
        v5 = *(_QWORD *)v16[2];
        v6 = 0;
        v7 = v9;
        while (1)
        {
          v4 = v6;
          if (*(_QWORD *)v16[2] != v5)
            objc_enumerationMutation(v8);
          v16[8] = *(_QWORD *)(v16[1] + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          ++v6;
          if (v4 + 1 >= v7)
          {
            v6 = 0;
            v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v16, v24, 16);
            if (!v7)
              goto LABEL_25;
          }
        }
        v23 = 0;
        v19 = 1;
      }
      else
      {
LABEL_25:
        v19 = 0;
      }

      if (!v19)
      {
        v23 = 1;
        v19 = 1;
      }
    }
  }
  else
  {
    v23 = 0;
    v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23 & 1;
}

+ (BOOL)isValidFeatureObject:(id)a3
{
  id v3;
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v17;
  _QWORD v18[9];
  _QWORD __b[9];
  id v20;
  int v21;
  id v22;
  id location[2];
  id v24;
  char v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(location[0], "allValues");
    v4 = v22;
    v22 = v3;

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong(&v22, location[0]);
LABEL_9:
    v20 = (id)objc_msgSend(v22, "firstObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(__b, 0, 0x40uLL);
      obj = v22;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
      if (v17)
      {
        v13 = *(_QWORD *)__b[2];
        v14 = 0;
        v15 = v17;
        while (1)
        {
          v12 = v14;
          if (*(_QWORD *)__b[2] != v13)
            objc_enumerationMutation(obj);
          __b[8] = *(_QWORD *)(__b[1] + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          ++v14;
          if (v12 + 1 >= v15)
          {
            v14 = 0;
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
            if (!v15)
              goto LABEL_18;
          }
        }
        v25 = 0;
        v21 = 1;
      }
      else
      {
LABEL_18:
        v21 = 0;
      }

      if (v21)
        goto LABEL_38;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = objc_msgSend(v24, "isValidMultiArray:", v22) & 1;
        else
          v25 = 0;
        v21 = 1;
        goto LABEL_38;
      }
      memset(v18, 0, 0x40uLL);
      v10 = v22;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v18, v26, 16);
      if (v11)
      {
        v7 = *(_QWORD *)v18[2];
        v8 = 0;
        v9 = v11;
        while (1)
        {
          v6 = v8;
          if (*(_QWORD *)v18[2] != v7)
            objc_enumerationMutation(v10);
          v18[8] = *(_QWORD *)(v18[1] + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          ++v8;
          if (v6 + 1 >= v9)
          {
            v8 = 0;
            v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v18, v26, 16);
            if (!v9)
              goto LABEL_30;
          }
        }
        v25 = 0;
        v21 = 1;
      }
      else
      {
LABEL_30:
        v21 = 0;
      }

      if (v21)
        goto LABEL_38;
    }
    v25 = 1;
    v21 = 1;
LABEL_38:
    objc_storeStrong(&v20, 0);
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v25 = 1;
    v21 = 1;
  }
  else
  {
    v25 = 0;
    v21 = 1;
  }
LABEL_39:
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v25 & 1;
}

- (NSMutableDictionary)featureStore
{
  return self->_featureStore;
}

- (void)setFeatureStore:(id)a3
{
  objc_storeStrong((id *)&self->_featureStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureStore, 0);
}

@end
