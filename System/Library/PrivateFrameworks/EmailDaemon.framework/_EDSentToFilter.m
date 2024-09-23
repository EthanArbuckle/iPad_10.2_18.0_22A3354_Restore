@implementation _EDSentToFilter

- (_EDSentToFilter)init
{
  _EDSentToFilter *v2;
  _EDSentToFilter *v3;
  EFBloomFilter *firstFilter;
  EFBloomFilter *secondFilter;
  EFBloomFilter *thirdFilter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_EDSentToFilter;
  v2 = -[_EDSentToFilter init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    firstFilter = v2->_firstFilter;
    v2->_firstFilter = 0;

    secondFilter = v3->_secondFilter;
    v3->_secondFilter = 0;

    thirdFilter = v3->_thirdFilter;
    v3->_thirdFilter = 0;

  }
  return v3;
}

- (void)loadFromDisk
{
  EFBloomFilter *v3;
  EFBloomFilter *firstFilter;
  uint64_t v5;
  EFBloomFilter *v6;
  EFBloomFilter *secondFilter;
  uint64_t v8;
  EFBloomFilter *v9;
  EFBloomFilter *thirdFilter;

  __31___EDSentToFilter_loadFromDisk__block_invoke((uint64_t)self, CFSTR("SentToFilter"), &unk_1E94E4AC0);
  v3 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
  firstFilter = self->_firstFilter;
  self->_firstFilter = v3;

  __31___EDSentToFilter_loadFromDisk__block_invoke(v5, CFSTR("SentToFilter2"), &unk_1E94E4AD8);
  v6 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
  secondFilter = self->_secondFilter;
  self->_secondFilter = v6;

  __31___EDSentToFilter_loadFromDisk__block_invoke(v8, CFSTR("SentToFilter3"), &unk_1E94E4AF0);
  v9 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
  thirdFilter = self->_thirdFilter;
  self->_thirdFilter = v9;

}

- (unint64_t)mayHaveSentToSimpleAddress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  EFBloomFilter *secondFilter;
  EFBloomFilter *thirdFilter;
  unint64_t v9;

  v4 = a3;
  v5 = v4;
  if (self->_firstFilter)
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = objc_claimAutoreleasedReturnValue();

    if ((-[EFBloomFilter mayContainString:](self->_firstFilter, "mayContainString:", v6) & 1) != 0)
    {
      secondFilter = self->_secondFilter;
      if (!secondFilter || !-[EFBloomFilter mayContainString:](secondFilter, "mayContainString:", v6))
      {
        v9 = 2;
        goto LABEL_12;
      }
      thirdFilter = self->_thirdFilter;
      if (thirdFilter)
      {
        if (-[EFBloomFilter mayContainString:](thirdFilter, "mayContainString:", v6))
          v9 = 2;
        else
          v9 = 1;
        goto LABEL_12;
      }
    }
    v9 = 1;
LABEL_12:
    v5 = (void *)v6;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (void)updateWithSentToSimpleAddresses:(id)a3 recentNotSentToSimpleAddresses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  EFBloomFilter *v23;
  EFBloomFilter *firstFilter;
  NSObject *v25;
  NSObject *v26;
  EFBloomFilter *v27;
  EFBloomFilter *v28;
  EFBloomFilter *secondFilter;
  NSObject *v30;
  NSObject *v31;
  EFBloomFilter *v32;
  EFBloomFilter *v33;
  EFBloomFilter *thirdFilter;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  EFBloomFilter *v38;
  EFBloomFilter *v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  NSObject *v44;
  EFBloomFilter *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  EFBloomFilter *v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  char v62;
  BOOL v63;
  BOOL v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v80;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v80 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v12), "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v76;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v76 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v19), "lowercaseString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "containsObject:", v20) & 1) == 0)
          objc_msgSend(v15, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v17);
  }

  objc_msgSend(v15, "allObjects");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  EDSenderLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v14, "count");
    -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.11();
  }

  EDSenderLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v65, "count");
    -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.6();
  }

  v74 = 0;
  objc_msgSend(MEMORY[0x1E0D1EE80], "bestBloomFilterForValues:excludingValues:falsePositiveRate:knownFalsePositives:", v14, v65, &v74, 0.1);
  v23 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
  v66 = v74;
  firstFilter = self->_firstFilter;
  self->_firstFilter = v23;

  if (objc_msgSend(v66, "count"))
  {
    EDSenderLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v66, "count");
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.9();
    }

    EDSenderLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v14, "count");
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.6();
    }

    v73 = 0;
    objc_msgSend(MEMORY[0x1E0D1EE80], "bestBloomFilterForValues:excludingValues:falsePositiveRate:knownFalsePositives:", v66, v14, &v73, 0.01);
    v27 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
    v28 = (EFBloomFilter *)v73;
    secondFilter = self->_secondFilter;
    self->_secondFilter = v27;

    if (-[EFBloomFilter count](v28, "count"))
    {
      EDSenderLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        -[EFBloomFilter count](v28, "count");
        -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.7();
      }

      EDSenderLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v66, "count");
        -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.6();
      }

      v72 = 0;
      objc_msgSend(MEMORY[0x1E0D1EE80], "bestBloomFilterForValues:excludingValues:falsePositiveRate:knownFalsePositives:", v28, v66, &v72, 0.1);
      v32 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
      v33 = (EFBloomFilter *)v72;
      thirdFilter = self->_thirdFilter;
      self->_thirdFilter = v32;

      if (-[EFBloomFilter count](v33, "count"))
      {
        EDSenderLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = -[EFBloomFilter count](v33, "count");
          -[EFBloomFilter ef_map:](v33, "ef_map:", &__block_literal_global_436);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v84 = v36;
          v85 = 2114;
          v86 = v37;
          _os_log_impl(&dword_1D2F2C000, v35, OS_LOG_TYPE_DEFAULT, "'Sent to' filter has %lu known false positives: %{public}@", buf, 0x16u);

        }
      }
    }
    else
    {
      v33 = self->_thirdFilter;
      self->_thirdFilter = 0;
    }

  }
  else
  {
    v38 = self->_secondFilter;
    self->_secondFilter = 0;

    v28 = self->_thirdFilter;
    self->_thirdFilter = 0;
  }

  v39 = self->_firstFilter;
  objc_msgSend(MEMORY[0x1E0D1E2B8], "mailDataDirectory");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "URLByAppendingPathComponent:", CFSTR("SentToFilter"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = 0;
  v42 = -[EFBloomFilter writeToFile:options:error:](v39, "writeToFile:options:error:", v41, 1342177281, &v71);
  v43 = v71;

  if ((v42 & 1) == 0)
  {
    EDSenderLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v43, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.5();
    }

  }
  v45 = self->_secondFilter;
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0D1E2B8], "mailDataDirectory");
    v46 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v46, "URLByAppendingPathComponent:", CFSTR("SentToFilter2"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = v43;
    LOBYTE(v46) = -[EFBloomFilter writeToFile:options:error:](v45, "writeToFile:options:error:", v47, 1342177281, &v70);
    v48 = v70;

    if ((v46 & 1) != 0)
      goto LABEL_49;
    EDSenderLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v48, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.4();
    }
    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v49 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E2B8], "mailDataDirectory");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "URLByAppendingPathComponent:", CFSTR("SentToFilter2"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = v43;
  v52 = -[NSObject removeItemAtURL:error:](v49, "removeItemAtURL:error:", v51, &v69);
  v48 = v69;

  if ((v52 & 1) != 0)
  {

LABEL_48:
    goto LABEL_49;
  }
  v63 = isNoSuchFileError(v48);

  if (!v63)
  {
    EDSenderLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v48, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.3();
    }
    goto LABEL_48;
  }
LABEL_49:
  v53 = v48;
  v54 = self->_thirdFilter;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v59 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E2B8], "mailDataDirectory");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "URLByAppendingPathComponent:", CFSTR("SentToFilter3"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = v53;
    v62 = -[NSObject removeItemAtURL:error:](v59, "removeItemAtURL:error:", v61, &v67);
    v58 = v67;

    if ((v62 & 1) != 0)
    {

    }
    else
    {
      v64 = isNoSuchFileError(v58);

      if (v64)
        goto LABEL_56;
      EDSenderLog();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v58, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.1();
      }
    }
    goto LABEL_55;
  }
  objc_msgSend(MEMORY[0x1E0D1E2B8], "mailDataDirectory");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "URLByAppendingPathComponent:", CFSTR("SentToFilter3"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v53;
  v57 = -[EFBloomFilter writeToFile:options:error:](v54, "writeToFile:options:error:", v56, 1342177281, &v68);
  v58 = v68;

  if ((v57 & 1) == 0)
  {
    EDSenderLog();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v58, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.2();
    }
LABEL_55:

  }
LABEL_56:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdFilter, 0);
  objc_storeStrong((id *)&self->_secondFilter, 0);
  objc_storeStrong((id *)&self->_firstFilter, 0);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to delete sent to addresses filter 3: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to write sent to addresses filter 3: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to delete sent to addresses filter 2: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to write sent to addresses filter 2: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to write sent to addresses filter 1: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_3(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_4_1(&dword_1D2F2C000, "ignoring addresses (%lu): %@", v3, v4);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_3(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_4_1(&dword_1D2F2C000, "Building third filter with addresses (%lu): %@", v3, v4);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_3(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_4_1(&dword_1D2F2C000, "Building second filter with addresses (%lu): %@", v3, v4);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_3(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_4_1(&dword_1D2F2C000, "Building filter with addresses (%lu): %@", v3, v4);
}

@end
