id RecordDirPathForRecordType(void *a1)
{
  void *v1;
  void *v2;

  RecordDirURLForRecordType(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id RecordDirURLForRecordType(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCF48];
  v2 = a1;
  objc_msgSend(v1, "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/DES/Records"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id DESAmendedRecordInfo(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  size_t v22;
  _BYTE v23[256];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v22 = 256;
  v6 = a3;
  v7 = a2;
  v8 = 0;
  if (!sysctlbyname("kern.osversion", v23, &v22, 0, 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  DESGetDeviceType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "length");
  if (v10 <= 4)
    v11 = 4;
  else
    v11 = v10;
  objc_msgSend(v6, "substringFromIndex:", (v11 - 4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length")
    && ((v13 = objc_msgSend(v12, "length"), v13 <= 1) ? (v14 = 1) : (v14 = v13),
        v15 = (char)objc_msgSend(v12, "characterAtIndex:", (v14 - 1)) - 48,
        v15 <= 3))
  {
    v16 = off_2510B5F48[v15];
  }
  else
  {
    v16 = CFSTR("train");
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v8, CFSTR("$device_os"));
  objc_msgSend(v17, "setValue:forKey:", v9, CFSTR("$device_type"));
  objc_msgSend(v17, "setValue:forKey:", v12, CFSTR("$dodml_device_identifier"));
  objc_msgSend(v17, "setValue:forKey:", v16, CFSTR("$dodml_dataset"));
  objc_msgSend(v17, "setValue:forKey:", v7, CFSTR("$record_type"));
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("InfoKeys-%@"), v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "dictionaryForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v17, "addEntriesFromDictionary:", v20);
  objc_msgSend(v17, "addEntriesFromDictionary:", v5);

  return v17;
}

void GarbageCollectOldRecords(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  RecordDirPathForRecordType(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v62 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v2, &v62);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v62;
  v6 = v5;
  if (v4)
  {
    v42 = v1;
    v43 = v2;
    objc_msgSend(v3, "changeCurrentDirectoryPath:", v2);
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v4;
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, -28, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v59;
      v15 = *MEMORY[0x24BDD0C58];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          v17 = v6;
          if (*(_QWORD *)v59 != v14)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v57 = v6;
          objc_msgSend(v3, "attributesOfItemAtPath:error:", v18, &v57);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v57;

          objc_msgSend(v19, "objectForKey:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            if (objc_msgSend(v20, "compare:", v11) == -1)
            {
              objc_msgSend(v18, "stringByDeletingPathExtension");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObject:", v21);

            }
            else
            {
              objc_msgSend(v44, "addObject:", v20);
            }
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      }
      while (v13);
    }

    if ((unint64_t)objc_msgSend(v44, "count") < 0x14)
    {
      v46 = v11;
    }
    else
    {
      objc_msgSend(v44, "sortUsingComparator:", &__block_literal_global_30);
      objc_msgSend(v44, "objectAtIndex:", 19);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v43, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v54;
        v26 = *MEMORY[0x24BDD0C58];
        do
        {
          v27 = 0;
          v28 = v6;
          do
          {
            if (*(_QWORD *)v54 != v25)
              objc_enumerationMutation(v22);
            v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v27);
            v52 = v28;
            objc_msgSend(v3, "attributesOfItemAtPath:error:", v29, &v52);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v52;

            objc_msgSend(v30, "objectForKey:", v26);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v31, "compare:", v46) == -1)
            {
              objc_msgSend(v29, "stringByDeletingPathExtension");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObject:", v32);

            }
            ++v27;
            v28 = v6;
          }
          while (v24 != v27);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        }
        while (v24);
      }

    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v33 = v45;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    if (v34)
    {
      v35 = v34;
      v36 = 0;
      v37 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v49 != v37)
            objc_enumerationMutation(v33);
          v39 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          v40 = v36 + DeleteFileWithBasePath(v3, v39, (uint64_t)CFSTR("json"));
          v36 = v40 + DeleteFileWithBasePath(v3, v39, (uint64_t)CFSTR("desdata"));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      }
      while (v35);
    }
    else
    {
      v36 = 0;
    }

    v1 = v42;
    NSLog(CFSTR("Found %lu record(s) to garbage collect and deleted %lu file(s) for %@"), objc_msgSend(v33, "count"), v36, v42);

    v2 = v43;
    v4 = v41;
  }
  else if (objc_msgSend(v5, "code") != 260)
  {
    NSLog(CFSTR("Couldn't read old DES records: %@"), v6);
  }

}

uint64_t DeleteFileWithBasePath(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v11;

  v5 = a1;
  objc_msgSend(a2, "stringByAppendingPathExtension:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v5, "_fides_removeItemAtPath:error:", v6, &v11);

  v8 = v11;
  v9 = v8;
  if ((_DWORD)v7)
    NSLog(CFSTR("Garbage collected old DES record file %@"), v6);
  else
    NSLog(CFSTR("Could not garbage collect old DES record file %@: %@"), v6, v8);

  return v7;
}

BOOL AddRecordsForTypeWithUUIDs(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  _QWORD *v31;
  id v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v34 = a1;
  v9 = a2;
  v33 = a3;
  v32 = a4;
  if (a5)
    *a5 = 0;
  RecordDirPathForRecordType(v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v9;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v36)
  {
    v11 = *(_QWORD *)v38;
    v12 = CFSTR("json");
    v13 = 0x24BDBC000uLL;
    v31 = a5;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingPathExtension:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 3664)), "initWithContentsOfFile:options:error:", v18, 1, a5);
        if (v19)
        {
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v19, 0, a5);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            DESAmendedRecordInfo(v20, v34, v32);
            v21 = v13;
            v22 = v11;
            v23 = v10;
            v24 = v12;
            v25 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "setObject:forKey:", v25, v15);
            v20 = (void *)v25;
            v12 = v24;
            v10 = v23;
            v11 = v22;
            v13 = v21;
            a5 = v31;
          }
          else
          {
            if (a5)
              v27 = *a5;
            else
              v27 = 0;
            NSLog(CFSTR("Skipping unparsable record: %@, %@"), v18, v27);
          }

        }
        else
        {
          if (a5)
            v26 = *a5;
          else
            v26 = 0;
          NSLog(CFSTR("Skipping unreadable record: %@, %@"), v18, v26);
        }

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v36);
  }

  v28 = objc_msgSend(obj, "count");
  v29 = !a5 || v28 || !*a5;

  return v29;
}

id AddRecordsForType(void *a1, void *a2, void *a3, id *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v39 = a2;
  v38 = a3;
  GarbageCollectOldRecords(v7);
  if (a4)
    *a4 = 0;
  v40 = v7;
  RecordDirPathForRecordType(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Searching in path %@"), v8);
  v9 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v9, "enumeratorAtPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v9;
  v36 = (void *)v8;
  objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v8, a4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSUserName();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Found at location: %@ as user %@"), v11, v12);

  v37 = a4;
  objc_msgSend(*a4, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Failed to find anything: %@"), v13);

  v41 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        NSLog(CFSTR("Found path %@"), v19);
        objc_msgSend(v14, "skipDescendants");
        objc_msgSend(v19, "pathExtension");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("json"));

        if (v21)
        {
          v22 = objc_alloc(MEMORY[0x24BDD1880]);
          objc_msgSend(v19, "stringByDeletingPathExtension");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v22, "initWithUUIDString:", v23);

          if (v24)
            objc_msgSend(v41, "addObject:", v24);
          else
            NSLog(CFSTR("Skipping bad record name: %@"), v19);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v16);
  }

  v25 = v41;
  if (objc_msgSend(v41, "count"))
  {
    v27 = v39;
    v26 = v40;
    v28 = v37;
    v29 = v38;
  }
  else
  {
    v28 = v37;
    v29 = v38;
    v27 = v39;
    v26 = v40;
    if (*v37)
    {

      v25 = 0;
    }
  }

  NSLog(CFSTR("Found %u record UUIDs"), objc_msgSend(v25, "count"));
  if (v25 && AddRecordsForTypeWithUUIDs(v26, v25, v27, v29, v28))
  {
    v30 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v27, "allKeys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

id FindRecordTypeForRecordUUID(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a1;
  v4 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __FindRecordTypeForRecordUUID_block_invoke;
  v8[3] = &unk_2510B5F00;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_2409806D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id RecordDataForUUID(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  RecordDirPathForRecordType(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("desdata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v9, 1, a3);
  return v10;
}

id RecordInfoForUUID(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v17;
  id v18;

  v5 = a2;
  RecordDirPathForRecordType(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v9, 1, &v18);
  v11 = v18;
  v12 = v11;
  if (v10)
  {
    v17 = v11;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v10, 0, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v13;
    }
    else
    {
      NSLog(CFSTR("Unparsable record: %@, %@"), v9, v14);
      v15 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v14);
    }

  }
  else
  {
    NSLog(CFSTR("Unreadable record: %@, %@"), v9, v11);
    if (a3)
    {
      v14 = objc_retainAutorelease(v12);
      v15 = 0;
      *a3 = v14;
    }
    else
    {
      v15 = 0;
      v14 = v12;
    }
  }

  return v15;
}

void sub_240982524(_Unwind_Exception *a1, int a2)
{
  id v2;
  os_log_t *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(a1);
    v3 = (os_log_t *)MEMORY[0x24BE08FD0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FD0], OS_LOG_TYPE_ERROR))
      -[LoggingHelper _decodingMetricsFromMetricsDict:].cold.2();
    v4 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      -[LoggingHelper _decodingMetricsFromMetricsDict:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_end_catch();
    JUMPOUT(0x2409824B0);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t DESGetDeviceType()
{
  return MEMORY[0x24BE2D0E8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x24BDD13F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

