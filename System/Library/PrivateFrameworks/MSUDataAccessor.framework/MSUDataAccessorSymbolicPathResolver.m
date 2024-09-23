@implementation MSUDataAccessorSymbolicPathResolver

+ (id)symbolicPathResolver
{
  return objc_alloc_init(MSUDataAccessorSymbolicPathResolver);
}

+ (id)resolvedSymbol:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (resolvedSymbol_error__onceToken != -1)
    dispatch_once(&resolvedSymbol_error__onceToken, &__block_literal_global_0);
  v7 = (id)resolvedSymbol_error__symbolCache;
  objc_sync_enter(v7);
  v8 = (id)objc_msgSend((id)resolvedSymbol_error__symbolCache, "objectForKeyedSubscript:", v6);
  v9 = v8;
  if (!v8)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("ecid")))
    {
      v45 = 0;
      v12 = +[MSUDataAccessor ioreg:property:error:](MSUDataAccessor, "ioreg:property:error:", CFSTR("IODeviceTree:/chosenmanifest-properties"), CFSTR("ECID"), &v45);
      v11 = v45;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "length") == 8)
      {
        v13 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        v10 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llX"), *v13);
      }
      else
      {
        v16 = (id)MGCopyAnswer();
        v17 = v16;
        if (v16)
          v10 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llX"), objc_msgSend(v16, "longLongValue"));
        else
          v10 = 0;

      }
LABEL_24:
      if (v10)
        goto LABEL_25;
      goto LABEL_29;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("boardid")))
    {
      v14 = (id)MGCopyAnswer();
      v15 = v14;
      if (v14)
        goto LABEL_16;
      goto LABEL_17;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("chipid")))
    {
      v14 = (id)MGCopyAnswer();
      v15 = v14;
      if (v14)
      {
LABEL_16:
        v10 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%X"), objc_msgSend(v14, "intValue"));
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:
      v10 = 0;
      goto LABEL_18;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("hwmodel")))
    {
      v44 = 0;
      v10 = (__CFString *)+[MSUDataAccessor hardwareModelWithError:](MSUDataAccessor, "hardwareModelWithError:", &v44);
      v18 = v44;
      goto LABEL_28;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("nsih")))
    {
      v22 = +[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor");
      v43 = 0;
      v10 = (__CFString *)objc_msgSend(v22, "copyBootManifestHashWithError:", &v43);
      v11 = v43;

      goto LABEL_24;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("volguuid")))
    {
      v42 = 0;
      v10 = (__CFString *)+[MSUDataAccessor bootUUIDWithError:](MSUDataAccessor, "bootUUIDWithError:", &v42);
      v18 = v42;
LABEL_28:
      v11 = v18;
      if (v10)
        goto LABEL_25;
      goto LABEL_29;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("preboot")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("sourcepreboot")) & 1) != 0)
    {
      v11 = 0;
      v10 = CFSTR("/private/preboot");
      goto LABEL_25;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("iscpreboot")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("hardware")) & 1) != 0)
    {
LABEL_44:
      v11 = 0;
      if (a4)
        goto LABEL_30;
      goto LABEL_33;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("bootobjectspath")))
    {
      v41 = 0;
      v23 = +[MSUDataAccessor ioreg:property:error:](MSUDataAccessor, "ioreg:property:error:", CFSTR("IODeviceTree:/chosen"), CFSTR("boot-objects-path"), &v41);
      v11 = v41;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v23), "bytes"));
        v10 = (__CFString *)(id)objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v24);

      }
      else
      {
        v10 = 0;
      }

      goto LABEL_24;
    }
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("cryptex1ticketpath")))
    {
      v30 = MSUDASharedLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        +[MSUDataAccessorSymbolicPathResolver resolvedSymbol:error:].cold.1((uint64_t)v6, v30, v31, v32, v33, v34, v35, v36);

      goto LABEL_44;
    }
    v25 = +[MSUDataAccessor cryptex1TicketType](MSUDataAccessor, "cryptex1TicketType");
    if (!v25)
      goto LABEL_44;
    v40 = (id)objc_msgSend(a1, "resolvedSymbol:error:", CFSTR("preboot"), 0);
    v26 = (id)objc_msgSend(a1, "resolvedSymbol:error:", CFSTR("hwmodel"), 0);
    v27 = (id)objc_msgSend(a1, "resolvedSymbol:error:", CFSTR("ecid"), 0);
    v28 = v27;
    if (v25 == 1 && v26 && v27)
    {
      v29 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("apticket.%@.%@.im4m"), v26, v27);
LABEL_63:
      v37 = v29;
      v10 = 0;
      if (v40 && v29)
      {
        v38 = (void *)MEMORY[0x24BDD17C8];
        v48[0] = v40;
        v48[1] = CFSTR("cryptex1");
        v48[2] = CFSTR("current");
        v48[3] = v29;
        v39 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
        v10 = (__CFString *)(id)objc_msgSend(v38, "pathWithComponents:", v39);

      }
      goto LABEL_67;
    }
    v37 = 0;
    if (v25 == 2)
    {
      v10 = 0;
      if (v26)
      {
        v29 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("apticket.%@.im4m"), v26);
        goto LABEL_63;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_67:

LABEL_19:
    v11 = 0;
    if (v10)
    {
LABEL_25:
      objc_msgSend((id)resolvedSymbol_error__symbolCache, "setObject:forKeyedSubscript:", v10, v6);
      goto LABEL_34;
    }
LABEL_29:
    if (a4)
    {
LABEL_30:
      v46[0] = *MEMORY[0x24BDD0BA0];
      v46[1] = CFSTR("symbol");
      v47[0] = CFSTR("Path symbol resolution failure");
      v47[1] = v6;
      v19 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      if (v11)
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD1398]);
      *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MSUDAError"), 6007, v20);

    }
LABEL_33:
    v10 = 0;
    goto LABEL_34;
  }
  v10 = (__CFString *)v8;
  v11 = 0;
LABEL_34:

  objc_sync_exit(v7);
  return v10;
}

void __60__MSUDataAccessorSymbolicPathResolver_resolvedSymbol_error___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)resolvedSymbol_error__symbolCache;
  resolvedSymbol_error__symbolCache = (uint64_t)v0;

}

- (MSUDataAccessorSymbolicPathResolver)init
{
  MSUDataAccessorSymbolicPathResolver *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *overrides;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSUDataAccessorSymbolicPathResolver;
  v2 = -[MSUDataAccessorSymbolicPathResolver init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    overrides = v2->_overrides;
    v2->_overrides = v3;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *overrides;
  objc_super v4;

  overrides = self->_overrides;
  self->_overrides = 0;

  v4.receiver = self;
  v4.super_class = (Class)MSUDataAccessorSymbolicPathResolver;
  -[MSUDataAccessorSymbolicPathResolver dealloc](&v4, sel_dealloc);
}

- (void)overrideSymbol:(id)a3 resolvedPath:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *overrides;

  v6 = a3;
  v7 = a4;
  v8 = self->_overrides;
  objc_sync_enter(v8);
  overrides = self->_overrides;
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](overrides, "setObject:forKeyedSubscript:", v7, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](overrides, "removeObjectForKey:", v6);
  objc_sync_exit(v8);

}

- (id)resolve:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  NSObject *v45;
  id v46;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, id, uint64_t, _BYTE *);
  void *v51;
  id v52;
  id v53;
  MSUDataAccessorSymbolicPathResolver *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[3];
  _QWORD v68[5];

  v68[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v62 = 0;
  v63[0] = &v62;
  v63[1] = 0x3032000000;
  v63[2] = __Block_byref_object_copy_;
  v63[3] = __Block_byref_object_dispose_;
  v64 = 0;
  v61 = 0;
  v7 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])"), 0, &v61);
  v8 = v61;
  if (v8)
  {
    v9 = MSUDASharedLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSUDataAccessorSymbolicPathResolver resolve:error:].cold.4(v9, v10, v11, v12, v13, v14, v15, v16);

    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD1398];
    v67[0] = *MEMORY[0x24BDD0BA0];
    v67[1] = v18;
    v68[0] = CFSTR("bad regex");
    v68[1] = v8;
    v67[2] = CFSTR("regex");
    v68[2] = CFSTR("(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])");
    v19 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
    v20 = (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MSUDASymbolicPathResolverError"), 102, v19);
    v21 = *(void **)(v63[0] + 40);
    *(_QWORD *)(v63[0] + 40) = v20;

    goto LABEL_5;
  }
  if (!v7)
  {
    v33 = MSUDASharedLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[MSUDataAccessorSymbolicPathResolver resolve:error:].cold.2(v33, v34, v35, v36, v37, v38, v39, v40);

    v41 = (void *)MEMORY[0x24BDD1540];
    v65[0] = *MEMORY[0x24BDD0BA0];
    v65[1] = CFSTR("regex");
    v66[0] = CFSTR("could not alloc/init regex");
    v66[1] = CFSTR("(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])");
    v42 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v43 = (id)objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("MSUDASymbolicPathResolverError"), 101, v42);
    v44 = *(void **)(v63[0] + 40);
    *(_QWORD *)(v63[0] + 40) = v43;

LABEL_5:
    v22 = 0;
    if (!a4)
      goto LABEL_6;
LABEL_20:
    *a4 = objc_retainAutorelease(*(id *)(v63[0] + 40));
    if (!v22)
      goto LABEL_24;
    goto LABEL_21;
  }
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v23 = (id)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v24 = v58[3];
  v25 = objc_msgSend(v6, "length");
  v48 = MEMORY[0x24BDAC760];
  v49 = 3254779904;
  v50 = __53__MSUDataAccessorSymbolicPathResolver_resolve_error___block_invoke;
  v51 = &__block_descriptor_72_e8_32s40s48s56r64r_e37_v32__0__NSTextCheckingResult_8Q16_B24l;
  v55 = &v57;
  v26 = v6;
  v52 = v26;
  v27 = v23;
  v53 = v27;
  v54 = self;
  v56 = &v62;
  objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, v24, v25, &v48);
  v28 = objc_msgSend(v26, "length", v48, v49, v50, v51);
  v29 = v58[3];
  if (v28 != v29)
  {
    v30 = objc_msgSend(v26, "length");
    v31 = (id)objc_msgSend(v26, "substringWithRange:", v29, v30 - v58[3]);
    objc_msgSend(v27, "appendString:", v31);

  }
  if (*(_QWORD *)(v63[0] + 40))
  {
    v32 = MSUDASharedLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MSUDataAccessorSymbolicPathResolver resolve:error:].cold.3((uint64_t)v63, (uint64_t)v27, v32);

    v22 = 0;
  }
  else
  {
    v22 = v27;
  }

  _Block_object_dispose(&v57, 8);
  if (a4)
    goto LABEL_20;
LABEL_6:
  if (!v22)
    goto LABEL_24;
LABEL_21:
  v45 = MSUDASharedLogger();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    -[MSUDataAccessorSymbolicPathResolver resolve:error:].cold.1((uint64_t)v6, (uint64_t)v22, v45);

LABEL_24:
  v46 = v22;

  _Block_object_dispose(&v62, 8);
  return v46;
}

void __53__MSUDataAccessorSymbolicPathResolver_resolve_error___block_invoke(uint64_t a1, id a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  id obj;

  v6 = a2;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "range");
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v8 != v9)
    {
      v10 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v9, objc_msgSend(v7, "range")- *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      objc_msgSend(*(id *)(a1 + 40), "appendString:", v10);

    }
    v11 = *(void **)(a1 + 32);
    v12 = objc_msgSend(v7, "range");
    v14 = (id)objc_msgSend(v11, "substringWithRange:", v12, v13);
    if (objc_msgSend(v7, "rangeAtIndex:", 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v7, "rangeAtIndex:", 2) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v7, "rangeAtIndex:", 3) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v7, "rangeAtIndex:", 4) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = (id)objc_msgSend(v14, "substringWithRange:", 1, objc_msgSend(v14, "length") - 2);
            v16 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "objectForKeyedSubscript:", v15);
            if (!v16)
            {
              v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
              obj = *(id *)(v17 + 40);
              v16 = +[MSUDataAccessorSymbolicPathResolver resolvedSymbol:error:](MSUDataAccessorSymbolicPathResolver, "resolvedSymbol:error:", v15, &obj);
              objc_storeStrong((id *)(v17 + 40), obj);
              if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
              {
                *a4 = 1;
              }
              else if (v16)
              {
                objc_msgSend(*(id *)(a1 + 40), "appendString:", v16);
              }
            }

          }
          goto LABEL_15;
        }
        v18 = *(void **)(a1 + 40);
        v19 = CFSTR("]");
      }
      else
      {
        v18 = *(void **)(a1 + 40);
        v19 = CFSTR("[");
      }
    }
    else
    {
      v18 = *(void **)(a1 + 40);
      v19 = CFSTR("\\");
    }
    objc_msgSend(v18, "appendString:", v19);
LABEL_15:
    v20 = objc_msgSend(v7, "range");
    objc_msgSend(v7, "range");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v21 + v20;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrides, 0);
}

+ (void)resolvedSymbol:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_206350000, a2, a3, "Unknown symbol:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)resolve:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_206350000, log, OS_LOG_TYPE_DEBUG, "returning resolved path for symbolic path %@: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)resolve:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_206350000, a1, a3, "could not alloc/init regex:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)resolve:(os_log_t)log error:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_206350000, log, OS_LOG_TYPE_ERROR, "error %@ ; discarding incomplete unresolved path: %@",
    (uint8_t *)&v4,
    0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)resolve:(uint64_t)a3 error:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_206350000, a1, a3, "bad regex:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
