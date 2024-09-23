@implementation CCSnapshotUtilities

+ (id)_filenameFromDate:(id)a3 set:(id)a4 format:(unsigned __int8)a5
{
  int v5;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  NSObject *v19;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CCTypeIdentifierRegistryBridge();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptionForTypeIdentifier:", objc_msgSend(v8, "itemType"));
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "descriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "encodedDescriptors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("_<%@>"), v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = &stru_250991730;
    }
    objc_msgSend((id)objc_opt_class(), "pathFromDate:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == 1)
    {
      v18 = CFSTR("dat");
    }
    else
    {
      if (v5 != 2)
      {
        __biome_log_for_category();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          +[CCSnapshotUtilities _filenameFromDate:set:format:].cold.1(v5, v19);

        v16 = 0;
        goto LABEL_16;
      }
      v18 = CFSTR("json");
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@_%@.%@"), v10, v15, v17, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[CCSnapshotUtilities _filenameFromDate:set:format:].cold.2((uint64_t)v8, v10);
  v16 = 0;
LABEL_17:

  return v16;
}

+ (id)pathFromDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD15D0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setFormatOptions:", objc_msgSend(v5, "formatOptions") | 0x800);
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)snapshotSets:(id)a3 directory:(id)a4 useCase:(id)a5 format:(unsigned __int8)a6 date:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id obj;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  unsigned int v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  void *v54;
  uint8_t v55[128];
  uint8_t buf[4];
  _BYTE v57[34];
  uint64_t v58;

  v45 = a6;
  v58 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v39 = a5;
  v44 = a7;
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v11, "count");
    objc_msgSend((id)objc_opt_class(), "pathFromDate:", v44);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v57 = v14;
    *(_WORD *)&v57[4] = 2112;
    *(_QWORD *)&v57[6] = v15;
    *(_WORD *)&v57[14] = 2112;
    *(_QWORD *)&v57[16] = v12;
    *(_WORD *)&v57[24] = 2112;
    *(_QWORD *)&v57[26] = v11;
    _os_log_impl(&dword_237B25000, v13, OS_LOG_TYPE_DEFAULT, "Capturing %u set snapshot(s) with timestamp: %@ to directory: %@ [%@]", buf, 0x26u);

  }
  v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v11;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  v16 = 0;
  if (v43)
  {
    v41 = *(_QWORD *)v50;
    v37 = *MEMORY[0x24BDD0BA0];
    v38 = *MEMORY[0x24BDD0B88];
    v42 = v12;
    do
    {
      v17 = 0;
      v18 = v16;
      do
      {
        if (*(_QWORD *)v50 != v41)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v17);
        v20 = (void *)MEMORY[0x23B82079C]();
        objc_msgSend((id)objc_opt_class(), "_filenameFromDate:set:format:", v44, v19, v45);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v21, 0, v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF08], "outputStreamWithURL:append:", v22, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "open");
        if (objc_msgSend(v23, "streamStatus") != 2)
        {
          v30 = (void *)MEMORY[0x24BDD1540];
          v53 = v37;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to open NSOutputStream with filename: %@ directory: %@"), v21, v12);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v31;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "errorWithDomain:code:userInfo:", v38, -1000, v32);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          __biome_log_for_category();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v57 = v19;
            *(_WORD *)&v57[8] = 2112;
            *(_QWORD *)&v57[10] = v16;
            _os_log_error_impl(&dword_237B25000, v33, OS_LOG_TYPE_ERROR, "Failed to create snapshot file for set: %@ error: %@", buf, 0x16u);
          }

          v29 = 0;
          v24 = v46;
          goto LABEL_20;
        }
        v48 = v18;
        objc_msgSend(v19, "serializeWithUseCase:error:", v39, &v48);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v48;

        if (!v24)
        {
          __biome_log_for_category();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v57 = v19;
            *(_WORD *)&v57[8] = 2112;
            *(_QWORD *)&v57[10] = v16;
            _os_log_error_impl(&dword_237B25000, v34, OS_LOG_TYPE_ERROR, "Failed to serialize set: %@ error: %@", buf, 0x16u);
          }

          v29 = 0;
LABEL_20:
          v46 = 0;
          goto LABEL_25;
        }
        v47 = v16;
        v25 = objc_msgSend(v24, "writeToStream:format:error:", v23, v45, &v47);
        v26 = v47;

        __biome_log_for_category();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if ((v25 & 1) != 0)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v57 = v22;
            _os_log_impl(&dword_237B25000, v28, OS_LOG_TYPE_DEFAULT, "Snapshot written to file: %@", buf, 0xCu);
          }

          objc_msgSend(v46, "addObject:", v22);
          v29 = 1;
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v57 = v24;
            *(_WORD *)&v57[8] = 2112;
            *(_QWORD *)&v57[10] = v23;
            *(_WORD *)&v57[18] = 2112;
            *(_QWORD *)&v57[20] = v26;
            _os_log_error_impl(&dword_237B25000, v28, OS_LOG_TYPE_ERROR, "Failed to write serialized set: %@ to stream: %@ error: %@", buf, 0x20u);
          }

          v29 = 0;
          v46 = 0;
        }
        v16 = v26;
LABEL_25:
        v12 = v42;

        objc_autoreleasePoolPop(v20);
        if (!v29)
          goto LABEL_28;
        ++v17;
        v18 = v16;
      }
      while (v43 != v17);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v43);
  }
LABEL_28:

  CCSetError(a8, v16);
  return v46;
}

+ (void)_filenameFromDate:(int)a1 set:(NSObject *)a2 format:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "Unexpected format: %u", (uint8_t *)v2, 8u);
}

+ (void)_filenameFromDate:(uint64_t)a1 set:(NSObject *)a2 format:.cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "Unexpected set: %@", (uint8_t *)&v5, 0xCu);

}

@end
