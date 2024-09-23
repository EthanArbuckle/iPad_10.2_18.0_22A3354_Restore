@implementation PlistProcessor

+ (id)sharedPlistProcessor
{
  if (sharedPlistProcessor_onceToken != -1)
    dispatch_once(&sharedPlistProcessor_onceToken, &__block_literal_global_1);
  return (id)sharedPlistProcessor_gPP;
}

void __38__PlistProcessor_sharedPlistProcessor__block_invoke()
{
  PlistProcessor *v0;
  void *v1;

  v0 = objc_alloc_init(PlistProcessor);
  v1 = (void *)sharedPlistProcessor_gPP;
  sharedPlistProcessor_gPP = (uint64_t)v0;

}

- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (uint64_t (**)(id, void *, _QWORD))a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumeratorAtPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "stringByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 && (v6[2](v6, v15, v13) & 1) == 0)
        {

          goto LABEL_12;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)copyAndFixPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v45;
  void *v46;

  v7 = a3;
  v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    createMobileStorageError((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 107, -3, 0, CFSTR("Invalid input(s)."), v9, v10, v11, v45);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v46 = 0;
    v37 = 0;
    v28 = 0;
    v18 = 0;
    v36 = 0;
    goto LABEL_15;
  }
  normalizePrivateVar(v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  normalizePrivateVar(CFSTR("/private/var/personalized_factory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "hasPrefix:", v14);

  v46 = v13;
  if ((v15 & 1) == 0)
  {
    v39 = v7;
    v34 = 0;
    v38 = 0;
    v36 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("Label"));
  v16 = objc_claimAutoreleasedReturnValue();
  copyProgramArgs(v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v36 = (void *)v16;
    objc_msgSend(v7, "objectForKey:", CFSTR("XPCServiceName"));
    v37 = (id)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      createMobileStorageError((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 127, -2, 0, CFSTR("Missing program arguments."), v40, v41, v42, v45);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v28 = 0;
      v18 = 0;
      goto LABEL_15;
    }
    v39 = v7;
    v34 = 0;
    v38 = 0;
LABEL_19:
    v18 = 0;
    v28 = 0;
    v37 = 0;
    v23 = 0;
    goto LABEL_28;
  }
  v18 = v17;
  objc_msgSend(v17, "objectAtIndex:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  if (v19)
  {
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("/Developer")) & 1) != 0)
    {
      objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("/"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "mutableCopy");

      objc_msgSend(v28, "objectAtIndex:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", &stru_24CE04C20);

      if (v30)
        objc_msgSend(v28, "removeObjectAtIndex:", 0);
      objc_msgSend(v28, "replaceObjectAtIndex:withObject:", 0, v13);
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("/"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v18, "replaceObjectAtIndex:withObject:", 0, v34);
        objc_msgSend(v35, "setObject:forKey:", v18, CFSTR("ProgramArguments"));
        objc_msgSend(v35, "removeObjectForKey:", CFSTR("Program"));
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          -[PlistProcessor copyAndFixPlist:forMountPoint:withError:].cold.1();
        v36 = (void *)v16;
        v37 = v35;
        v38 = 0;
        if (!a5)
          goto LABEL_27;
      }
      else
      {
        v36 = (void *)v16;
        createMobileStorageError((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 158, -2, 0, CFSTR("Failed to update program path %@."), v31, v32, v33, (uint64_t)v23);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        if (!a5)
          goto LABEL_27;
      }
      goto LABEL_16;
    }
    v36 = (void *)v16;
    createMobileStorageError((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 144, -2, 0, CFSTR("Invalid program path: %@"), v24, v25, v26, (uint64_t)v23);
  }
  else
  {
    v36 = (void *)v16;
    createMobileStorageError((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 135, -2, 0, CFSTR("Invalid program arguments: %@"), v20, v21, v22, (uint64_t)v18);
  }
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v28 = 0;
LABEL_15:
  v34 = 0;
  if (!a5)
  {
LABEL_27:
    v39 = v37;
    goto LABEL_28;
  }
LABEL_16:
  if (v37)
    goto LABEL_27;
  v38 = objc_retainAutorelease(v38);
  v39 = 0;
  *a5 = v38;
LABEL_28:
  v43 = v39;

  return v43;
}

- (id)copyPlistWithMSMKeys:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  if (v5)
  {
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v9, "objectForKey:", CFSTR("_AdditionalProperties"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    isNSDictionary(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v11);
    else
      v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v19 = v13;
    if (v13)
    {
      v24 = CFSTR("ManagedByMobileStorageMounter");
      v25[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("MobileStorageMounter"));

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("_AdditionalProperties"));
      v18 = v10;
      v17 = 0;
      v10 = v18;
      if (!a4)
        goto LABEL_13;
    }
    else
    {
      createMobileStorageError((uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]", 208, -2, 0, CFSTR("Failed to allocate dictionary."), v14, v15, v16, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      if (!a4)
        goto LABEL_13;
    }
  }
  else
  {
    createMobileStorageError((uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]", 192, -2, 0, CFSTR("Invalid input."), v6, v7, v8, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v10 = 0;
    v11 = 0;
    v19 = 0;
    if (!a4)
      goto LABEL_13;
  }
  if (!v18)
    *a4 = objc_retainAutorelease(v17);
LABEL_13:
  v21 = v18;

  return v21;
}

- (BOOL)jobIsManagedByMSM:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v14)
      -[PlistProcessor jobIsManagedByMSM:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_22;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Label"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v22)
      -[PlistProcessor jobIsManagedByMSM:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_22;
  }
  v6 = (void *)v5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_AdditionalProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[PlistProcessor jobIsManagedByMSM:].cold.3();

    goto LABEL_21;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MobileStorageMounter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[PlistProcessor jobIsManagedByMSM:].cold.4((uint64_t)v6, v30, v31, v32, v33, v34, v35, v36);

    goto LABEL_20;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ManagedByMobileStorageMounter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[PlistProcessor jobIsManagedByMSM:].cold.5((uint64_t)v6, v37, v38, v39, v40, v41, v42, v43);

LABEL_20:
LABEL_21:

LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  v13 = objc_msgSend(v11, "BOOLValue");

LABEL_23:
  return v13;
}

- (BOOL)verifyPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;

  v7 = a3;
  v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    createMobileStorageError((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 282, -3, 0, CFSTR("Invalid input(s)."), v9, v10, v11, v42);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v23 = 0;
    v27 = 0;
    v16 = 0;
    if (!a5)
      goto LABEL_20;
    goto LABEL_16;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("Label"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    createMobileStorageError((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 288, -2, 0, CFSTR("Failed to retrieve job label."), v13, v14, v15, v42);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    goto LABEL_15;
  }
  copyProgramArgs(v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  if (!v17)
  {
    createMobileStorageError((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 294, -2, 0, CFSTR("Failed to retrieve program arguments."), v18, v19, v20, v42);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v17, "objectAtIndex:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  normalizePrivateVar(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(v21, "objectAtIndex:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    createMobileStorageError((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 300, -2, 0, CFSTR("Failed to normalize %@."), v38, v39, v40, (uint64_t)v37);
    v35 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    v23 = 0;
    v27 = 0;
    if (!a5)
    {
LABEL_20:
      v36 = 0;
      goto LABEL_21;
    }
LABEL_16:
    v35 = objc_retainAutorelease(v35);
    v36 = 0;
    *a5 = v35;
    goto LABEL_21;
  }
  normalizePrivateVar(v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    createMobileStorageError((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 306, -2, 0, CFSTR("Failed to normalize %@."), v24, v25, v26, (uint64_t)v12);
    goto LABEL_19;
  }
  normalizePrivateVar(CFSTR("/Developer"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "hasPrefix:", v28);

  if (v29)
  {
    normalizePrivateVar(CFSTR("/Developer"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v23, "hasPrefix:", v30);

    if ((v31 & 1) == 0)
    {
      createMobileStorageError((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 315, -2, 0, CFSTR("Invalid program path: %@"), v32, v33, v34, (uint64_t)v23);
LABEL_19:
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (!a5)
        goto LABEL_20;
      goto LABEL_16;
    }
  }
  v35 = 0;
  v36 = 1;
LABEL_21:

  return v36;
}

- (void)copyAndFixPlist:forMountPoint:withError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2126BE000, MEMORY[0x24BDACB70], v0, "Updated launchd job (%@) program path from %@ to %@.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)jobIsManagedByMSM:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "Invalid input.", a5, a6, a7, a8, 0);
}

- (void)jobIsManagedByMSM:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "No job label.", a5, a6, a7, a8, 0);
}

- (void)jobIsManagedByMSM:.cold.3()
{
  uint8_t v0[14];
  const __CFString *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v1 = CFSTR("_AdditionalProperties");
  _os_log_debug_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Job '%@' lacks a '%@' dictionary.", v0, 0x16u);
}

- (void)jobIsManagedByMSM:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "Job '%@': '%@' lacks a '%@' dictionary.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)jobIsManagedByMSM:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "Job '%@': '%@' lacks a '%@' BOOLean.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
