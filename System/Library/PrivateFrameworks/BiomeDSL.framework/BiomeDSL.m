id BMDSLValueForKeyPath(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  unint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  +[BMDSLGraphValidator currentProcessValidator](BMDSLGraphValidator, "currentProcessValidator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "passthrough"))
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      BMDSLValueForKeyPath_cold_1();

    objc_msgSend(v3, "valueForKeyPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  objc_msgSend(v5, "validKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v11 = v10;

  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v29;
    while (2)
    {
      v16 = 0;
      v17 = (unint64_t)v13 + v14;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        if (!objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v16)))
        {
          v17 = (unint64_t)v16 + v14;
          goto LABEL_18;
        }
        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v14 = v17;
      if (v13)
        continue;
      break;
    }
LABEL_18:

    if (!v17)
    {
      v13 = 0;
      v20 = v3;
      goto LABEL_23;
    }
    objc_msgSend(v12, "subarrayWithRange:", 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR("."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKeyPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v20;
  }
  else
  {
    v17 = 0;
    v18 = v12;
    v20 = v3;
  }

LABEL_23:
  if (v17 >= objc_msgSend(v12, "count"))
  {
    v7 = v13;
  }
  else
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", v27);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v17 + 1;
      if (v23 >= objc_msgSend(v12, "count"))
      {
        v22 = v22;
        v7 = v22;
      }
      else
      {
        objc_msgSend(v12, "subarrayWithRange:", v23, objc_msgSend(v12, "count") - v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        BMDSLValueForKeyPath(v22, v24);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      __biome_log_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        BMDSLValueForKeyPath_cold_2();
      v7 = 0;
    }

  }
LABEL_34:

  return v7;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id BMDSLFilterCast(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      BMDSLFilterCast_cold_1((uint64_t)v3, a2, v5);

    v4 = 0;
  }

  return v4;
}

uint64_t BMDSLFilterCheckResponds(void *a1, const char *a2)
{
  id v3;
  char v4;
  NSObject *v5;

  v3 = a1;
  v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) == 0)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      BMDSLFilterCheckResponds_cold_1((uint64_t)v3, a2, v5);

  }
  return v4 & 1;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1AEB1D344(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id BMDSLRegisterJSONTransformerNameFromEncodingDescriptor(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (!JSONTransformerNamesByEncodingDescriptor)
  {
    v2 = objc_opt_new();
    v3 = (void *)JSONTransformerNamesByEncodingDescriptor;
    JSONTransformerNamesByEncodingDescriptor = v2;

  }
  objc_msgSend(CFSTR("JSONValueTransformer:"), "stringByAppendingString:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)JSONTransformerNamesByEncodingDescriptor, "setObject:forKeyedSubscript:", v4, v1);

  return v4;
}

uint64_t BMDSLJSONTransformerNameFromEncodingDescriptor(uint64_t a1)
{
  return objc_msgSend((id)JSONTransformerNamesByEncodingDescriptor, "objectForKeyedSubscript:", a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id BMDSLValidateDictionary(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isEqual:", v7) & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v12, "isEqualToNumber:", v13),
          v13,
          (v14 & 1) != 0))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      obj = v9;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v15)
      {
        v16 = v15;
        v27 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v30 != v27)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v8, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(obj, "objectForKeyedSubscript:", v18);
            if (!v19 || (objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing or bad value for %@: %@. expected %@"), v18, v19, v20);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              BMDSLDecodeError((uint64_t)v26);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_18;
            }

          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v16)
            continue;
          break;
        }
      }

      v21 = 0;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("incompatible version (%@) for %@, expected: %@"), v12, v7, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      BMDSLDecodeError((uint64_t)v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected 'name' to be %@"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BMDSLDecodeError((uint64_t)v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

  return v21;
}

id BMDSLDecodeError(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error decoding BMDSL operation, %@"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 4864, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1AEB263C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMDSLPersistentDerivativesClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLPersistentDerivatives");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLPersistentDerivativesClass_block_invoke_cold_1();
  getBMDSLPersistentDerivativesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BiomeStreamsLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E5E36538;
    v2 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
    BiomeStreamsLibrary_cold_1(&v0);
}

Class __getBMDSLStreamPublisherClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLStreamPublisher");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLStreamPublisherClass_block_invoke_cold_1();
  getBMDSLStreamPublisherClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableMapClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLTableMap");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLTableMapClass_block_invoke_cold_1();
  getBMDSLTableMapClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableStreamClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLTableStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLTableStreamClass_block_invoke_cold_1();
  getBMDSLTableStreamClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableAggregatorClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLTableAggregator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLTableAggregatorClass_block_invoke_cold_1();
  getBMDSLTableAggregatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLKeyPathRowTransformClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLKeyPathRowTransform");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLKeyPathRowTransformClass_block_invoke_cold_1();
  getBMDSLKeyPathRowTransformClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableUpsertSubscriberClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLTableUpsertSubscriber");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLTableUpsertSubscriberClass_block_invoke_cold_1();
  getBMDSLTableUpsertSubscriberClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableSQLQueryTransformClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLTableSQLQueryTransform");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLTableSQLQueryTransformClass_block_invoke_cold_1();
  getBMDSLTableSQLQueryTransformClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableTransformClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDSLTableTransform");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDSLTableTransformClass_block_invoke_cold_1();
  getBMDSLTableTransformClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMTableSchemaClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BiomeFlexibleStorageLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E5E36550;
    v5 = 0;
    BiomeFlexibleStorageLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeFlexibleStorageLibraryCore_frameworkLibrary)
    __getBMTableSchemaClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BMTableSchema");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMTableSchemaClass_block_invoke_cold_2();
  getBMTableSchemaClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BMDSLValueForKeyPath_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AEB18000, v0, v1, "BMDSLValueForKeyPath allowing keyPath by passthrough for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BMDSLValueForKeyPath_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AEB18000, v0, v1, "Encountered non-allowed key %@ in BMDSLValueForKeyPath(...)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BMDSLValueForKeyPath_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AEB18000, v0, v1, "Unknown key when evaluating BMDSLValueForKeyPath(...) with keypath %@ on %@");
  OUTLINED_FUNCTION_1();
}

void BMDSLFilterCast_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_0(&dword_1AEB18000, a3, (uint64_t)a3, "Unrecognized type %@ (expected %@) when evaluating BMDSLFilter isIncluded", (uint8_t *)&v3);
}

void BMDSLFilterCheckResponds_cold_1(uint64_t a1, SEL aSelector, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(aSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_0(&dword_1AEB18000, a3, v6, "Unrecognized type %@ (doesn't respond to %@) when evaluating BMDSLFilter isIncluded", (uint8_t *)&v7);

}

void __getBMDSLPersistentDerivativesClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLPersistentDerivativesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 18, CFSTR("Unable to find class %s"), "BMDSLPersistentDerivatives");

  __break(1u);
}

void BiomeStreamsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMDSLJSONAllowedClasses.m"), 14, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBMDSLStreamPublisherClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLStreamPublisherClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 19, CFSTR("Unable to find class %s"), "BMDSLStreamPublisher");

  __break(1u);
}

void __getBMDSLTableMapClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLTableMapClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 21, CFSTR("Unable to find class %s"), "BMDSLTableMap");

  __break(1u);
}

void __getBMDSLTableStreamClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLTableStreamClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 23, CFSTR("Unable to find class %s"), "BMDSLTableStream");

  __break(1u);
}

void __getBMDSLTableAggregatorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLTableAggregatorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 20, CFSTR("Unable to find class %s"), "BMDSLTableAggregator");

  __break(1u);
}

void __getBMDSLKeyPathRowTransformClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLKeyPathRowTransformClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 17, CFSTR("Unable to find class %s"), "BMDSLKeyPathRowTransform");

  __break(1u);
}

void __getBMDSLTableUpsertSubscriberClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLTableUpsertSubscriberClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 25, CFSTR("Unable to find class %s"), "BMDSLTableUpsertSubscriber");

  __break(1u);
}

void __getBMDSLTableSQLQueryTransformClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLTableSQLQueryTransformClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 22, CFSTR("Unable to find class %s"), "BMDSLTableSQLQueryTransform");

  __break(1u);
}

void __getBMDSLTableTransformClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDSLTableTransformClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 24, CFSTR("Unable to find class %s"), "BMDSLTableTransform");

  __break(1u);
}

void __getBMTableSchemaClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeFlexibleStorageLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMDSLJSONAllowedClasses.m"), 15, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBMTableSchemaClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;
  CFAllocatorRef v2;
  CFNumberType v3;
  const void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMTableSchemaClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDSLJSONAllowedClasses.m"), 26, CFSTR("Unable to find class %s"), "BMTableSchema");

  __break(1u);
  CFNumberCreate(v2, v3, v4);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __biome_log_for_category()
{
  return MEMORY[0x1E0D01D58]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

