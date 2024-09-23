sqlite3 **DBIOOpenDatabaseFromURL(void *a1, _QWORD *a2)
{
  id v3;
  sqlite3 **v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = (sqlite3 **)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  *v4 = 0;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  LODWORD(v5) = sqlite3_open_v2((const char *)objc_msgSend(v6, "fileSystemRepresentation"), v4, 1, 0);

  if ((_DWORD)v5)
  {
    sqlite3_close(*v4);
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to open SQLite database: '%s'."), sqlite3_errmsg(*v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0FC8];
      v12[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 10, v9);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
    free(v4);
    return 0;
  }
  return v4;
}

uint64_t DBIOCloseDatabase(void **a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!*a1)
    return 1;
  if (!sqlite3_close(*(sqlite3 **)*a1))
  {
    *(_QWORD *)*a1 = 0;
    free(*a1);
    *a1 = 0;
    return 1;
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to close SQLite database [%s]"), sqlite3_errmsg(*(sqlite3 **)*a1));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FC8];
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 10, v6);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

uint64_t DBIODatabaseValidatedWithoutError(sqlite3 **a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  DBIOFetchDatabaseResults(a1, CFSTR("pragma integrity_check"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("integrity_check"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ok"));

  if (a2 && (v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Database integrity test failed: %s"), sqlite3_errmsg(*a1), v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 10, v9);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

_QWORD *DBIOFetchDatabaseResults(sqlite3 **a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  double v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t *v22;
  void *v23;
  _QWORD *v25;
  sqlite3_stmt *ppStmt;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  ppStmt = 0;
  v5 = objc_retainAutorelease(a2);
  if (sqlite3_prepare_v2(*a1, (const char *)objc_msgSend(v5, "UTF8String"), -1, &ppStmt, 0))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to prepare query statement: '%s'."), sqlite3_errmsg(*a1));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0FC8];
      v32[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      a3 = 0;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v25 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (sqlite3_step(ppStmt) == 100)
  {
    v9 = 0;
    while (sqlite3_column_count(ppStmt) < 1)
    {
LABEL_20:
      if (sqlite3_step(ppStmt) != 100)
        goto LABEL_21;
    }
    v10 = 0;
    v11 = 0;
    while (1)
    {
      if (sqlite3_column_type(ppStmt, v10) == 1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(ppStmt, v10));
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else if (sqlite3_column_type(ppStmt, v10) == 2)
      {
        v13 = (void *)MEMORY[0x24BDD16E0];
        v14 = sqlite3_column_double(ppStmt, v10);
        *(float *)&v14 = v14;
        objc_msgSend(v13, "numberWithFloat:", v14);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!sqlite3_column_text(ppStmt, v10))
        {

          v11 = &stru_24DE11450;
          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, v10));
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (__CFString *)v12;

      v11 = v15;
      if (!v15)
      {
        a3 = v25;
        if (v25)
        {
          v19 = (void *)MEMORY[0x24BDD1540];
          v29 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Database query [%@] did not return any results"), v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v8;
          v20 = (void *)MEMORY[0x24BDBCE70];
          v21 = &v30;
          v22 = &v29;
          goto LABEL_28;
        }
        goto LABEL_30;
      }
LABEL_15:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_name(ppStmt, v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@(%d)"), v16, v9);
        v18 = objc_claimAutoreleasedReturnValue();

        v9 = (v9 + 1);
        v16 = (void *)v18;
      }
      objc_msgSend(v6, "setObject:forKey:", v11, v16);

      if (++v10 >= sqlite3_column_count(ppStmt))
      {

        goto LABEL_20;
      }
    }
  }
LABEL_21:
  sqlite3_finalize(ppStmt);
  if (objc_msgSend(v6, "count"))
  {
    a3 = (_QWORD *)objc_msgSend(v6, "copy");
    goto LABEL_30;
  }
  a3 = v25;
  if (v25)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Database query did not return any results"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v8;
    v20 = (void *)MEMORY[0x24BDBCE70];
    v21 = &v28;
    v22 = &v27;
LABEL_28:
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v23);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
LABEL_30:

LABEL_31:
  return a3;
}

id DBIOFetchDatabaseResultsExt(sqlite3 **a1, id a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  sqlite3_stmt *ppStmt;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  ppStmt = 0;
  if (sqlite3_prepare_v2(*a1, (const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"), -1, &ppStmt, 0))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to prepare query statement: '%s'."), sqlite3_errmsg(*a1));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FC8];
      v29[0] = v5;
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = (void **)v29;
      v9 = &v28;
LABEL_23:
      objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v10);
      v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (sqlite3_step(ppStmt) != 100)
  {
    if (a3)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Database query did not return any results"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v5;
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = &v27;
      v9 = &v26;
      goto LABEL_23;
    }
LABEL_25:
    v18 = 0;
    return v18;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", sqlite3_column_count(ppStmt));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    if (sqlite3_column_count(ppStmt) < 1)
      goto LABEL_18;
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = v12;
      if (sqlite3_column_type(ppStmt, v11) == 1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(ppStmt, v11));
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v12 = (__CFString *)v14;
        goto LABEL_15;
      }
      if (sqlite3_column_type(ppStmt, v11) == 2)
      {
        v15 = (void *)MEMORY[0x24BDD16E0];
        v16 = sqlite3_column_double(ppStmt, v11);
        *(float *)&v16 = v16;
        objc_msgSend(v15, "numberWithFloat:", v16);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (sqlite3_column_text(ppStmt, v11))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, v11));
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      v12 = &stru_24DE11450;
LABEL_15:

      objc_msgSend(v5, "addObject:", v12);
      ++v11;
    }
    while (v11 < sqlite3_column_count(ppStmt));

LABEL_18:
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);

    objc_msgSend(v5, "removeAllObjects");
  }
  while (sqlite3_step(ppStmt) == 100);
  sqlite3_finalize(ppStmt);
  if (objc_msgSend(v10, "count"))
  {
    v18 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    if (a3)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Database query did not return any results"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v22);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
  }
LABEL_24:

  return v18;
}

BOOL operator==(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

void sub_21ADCB7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, materialsForPair *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{

  _Unwind_Resume(a1);
}

void *AbsorptionTable::get(AbsorptionTable *this)
{
  unsigned __int8 v1;

  {
    AbsorptionTable::AbsorptionTable((AbsorptionTable *)&AbsorptionTable::get(void)::instance);
    __cxa_atexit((void (*)(void *))AbsorptionTable::~AbsorptionTable, &AbsorptionTable::get(void)::instance, &dword_21ADC8000);
  }
  return &AbsorptionTable::get(void)::instance;
}

void sub_21ADCB914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *materialCachedTable<AMAbsorption>::getMaterial(_QWORD *a1, void *a2, uint64_t *a3)
{
  id v5;
  uint64_t **v6;
  void *v7;
  void *v8;
  void *v9;
  AMAbsorption *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v11 = -[AMAbsorption initWithMaterialName:]([AMAbsorption alloc], "initWithMaterialName:", v5);
  v6 = std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::find<AMAbsorption * {__strong}>(a1, (void **)&v11);
  if (v6)
  {
    a3 = v6[2];
  }
  else if (a3)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Material %@ is not found in %@"), v5, a1[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 4, v9);
    *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

void sub_21ADCBA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void *ScatteringTable::get(ScatteringTable *this)
{
  unsigned __int8 v1;

  {
    ScatteringTable::ScatteringTable((ScatteringTable *)&ScatteringTable::get(void)::instance);
    __cxa_atexit((void (*)(void *))ScatteringTable::~ScatteringTable, &ScatteringTable::get(void)::instance, &dword_21ADC8000);
  }
  return &ScatteringTable::get(void)::instance;
}

void sub_21ADCBB30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *materialCachedTable<AMScattering>::getMaterial(_QWORD *a1, void *a2, uint64_t *a3)
{
  id v5;
  uint64_t **v6;
  void *v7;
  void *v8;
  void *v9;
  AMScattering *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v11 = -[AMScattering initWithMaterialName:]([AMScattering alloc], "initWithMaterialName:", v5);
  v6 = std::__hash_table<AMScattering * {__strong},material_hash<AMScattering * {__strong}>,material_equal_to<AMScattering * {__strong}>,std::allocator<AMScattering * {__strong}>>::find<AMScattering * {__strong}>(a1, (void **)&v11);
  if (v6)
  {
    a3 = v6[2];
  }
  else if (a3)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Material %@ is not found in %@"), v5, a1[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 4, v9);
    *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

void sub_21ADCBC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void *SoundReductionTable::get(SoundReductionTable *this)
{
  unsigned __int8 v1;

  {
    SoundReductionTable::SoundReductionTable((SoundReductionTable *)&SoundReductionTable::get(void)::instance);
    __cxa_atexit((void (*)(void *))SoundReductionTable::~SoundReductionTable, &SoundReductionTable::get(void)::instance, &dword_21ADC8000);
  }
  return &SoundReductionTable::get(void)::instance;
}

void sub_21ADCBD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *materialCachedTable<AMSoundReductionIndex>::getMaterial(_QWORD *a1, void *a2, uint64_t *a3)
{
  id v5;
  uint64_t **v6;
  void *v7;
  void *v8;
  void *v9;
  AMSoundReductionIndex *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v11 = -[AMSoundReductionIndex initWithMaterialName:]([AMSoundReductionIndex alloc], "initWithMaterialName:", v5);
  v6 = std::__hash_table<AMSoundReductionIndex * {__strong},material_hash<AMSoundReductionIndex * {__strong}>,material_equal_to<AMSoundReductionIndex * {__strong}>,std::allocator<AMSoundReductionIndex * {__strong}>>::find<AMSoundReductionIndex * {__strong}>(a1, (void **)&v11);
  if (v6)
  {
    a3 = v6[2];
  }
  else if (a3)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Material %@ is not found in %@"), v5, a1[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 4, v9);
    *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

void sub_21ADCBEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void materialsForPair::~materialsForPair(materialsForPair *this)
{

}

void sub_21ADCC09C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21ADCC138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_21ADCC1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void __assign_helper_atomic_property_(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *> *>>((_QWORD *)a1, *(uint64_t **)(a2 + 16), 0);
  }
}

void __assign_helper_atomic_property__32(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *> *>>((_QWORD *)a1, *(uint64_t **)(a2 + 16), 0);
  }
}

void __assign_helper_atomic_property__34(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *> *>>((_QWORD *)a1, *(uint64_t **)(a2 + 16), 0);
  }
}

void sub_21ADCC49C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void materialCachedTable<AMAbsorption>::readTable(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  AMAbsorption *v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT * FROM [%@]"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DBIOFetchDatabaseResultsExt((sqlite3 **)_dbPtr, v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::clear(a1);
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, objc_msgSend(v5, "count"));
    for (i = 0; i < objc_msgSend(v5, "count"); ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v7, *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AMAbsorption initWithValues:error:]([AMAbsorption alloc], "initWithValues:error:", v8, a2);
      std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__emplace_unique_key_args<AMAbsorption * {__strong},AMAbsorption * const {__strong}&>(a1, (void **)&v9, (id *)&v9);

    }
  }

}

void sub_21ADCC60C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void materialCachedTable<AMScattering>::readTable(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  AMScattering *v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT * FROM [%@]"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DBIOFetchDatabaseResultsExt((sqlite3 **)_dbPtr, v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::clear(a1);
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, objc_msgSend(v5, "count"));
    for (i = 0; i < objc_msgSend(v5, "count"); ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v7, *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AMScattering initWithValues:error:]([AMScattering alloc], "initWithValues:error:", v8, a2);
      std::__hash_table<AMScattering * {__strong},material_hash<AMScattering * {__strong}>,material_equal_to<AMScattering * {__strong}>,std::allocator<AMScattering * {__strong}>>::__emplace_unique_key_args<AMScattering * {__strong},AMScattering * const {__strong}&>(a1, (void **)&v9, (id *)&v9);

    }
  }

}

void sub_21ADCC790(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void materialCachedTable<AMSoundReductionIndex>::readTable(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  AMSoundReductionIndex *v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT * FROM [%@]"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DBIOFetchDatabaseResultsExt((sqlite3 **)_dbPtr, v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::clear(a1);
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, objc_msgSend(v5, "count"));
    for (i = 0; i < objc_msgSend(v5, "count"); ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v7, *(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AMSoundReductionIndex initWithValues:error:]([AMSoundReductionIndex alloc], "initWithValues:error:", v8, a2);
      std::__hash_table<AMSoundReductionIndex * {__strong},material_hash<AMSoundReductionIndex * {__strong}>,material_equal_to<AMSoundReductionIndex * {__strong}>,std::allocator<AMSoundReductionIndex * {__strong}>>::__emplace_unique_key_args<AMSoundReductionIndex * {__strong},AMSoundReductionIndex * const {__strong}&>(a1, (void **)&v9, (id *)&v9);

    }
  }

}

void sub_21ADCC914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void materialCachedTable<AMAbsorption>::applyAbsFilter(uint64_t a1, void *a2)
{
  uint64_t **i;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t j;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = a2;
  for (i = *(uint64_t ***)(a1 + 16); i; i = (uint64_t **)*i)
  {
    v4 = objc_msgSend(v19, "count");
    objc_msgSend(i[2], "absorptionUserData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v4 <= v6)
    {
      v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
      objc_msgSend(i[2], "absorptionUserData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

      for (j = 0; objc_msgSend(v19, "count") > j; ++j)
      {
        v11 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v9, "objectAtIndexedSubscript:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;
        objc_msgSend(v19, "objectAtIndexedSubscript:", j);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v14 * v16;
        if (v17 < 0.0)
          v17 = 0.0;
        if (v17 > 1.0)
          v17 = 1.0;
        objc_msgSend(v11, "numberWithDouble:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v18, j);

      }
      objc_msgSend(i[2], "setAbsorptionUserData:", v9);

    }
  }

}

void sub_21ADCCB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21ADCCC70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21ADCCE18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id materialCachedTable<AMAbsorption>::materialNames(uint64_t a1)
{
  void *v2;
  uint64_t **i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = *(uint64_t ***)(a1 + 16); i; i = (uint64_t **)*i)
  {
    objc_msgSend(i[2], "materialName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

void sub_21ADCCEC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id materialCachedTable<AMScattering>::materialNames(uint64_t a1)
{
  void *v2;
  uint64_t **i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = *(uint64_t ***)(a1 + 16); i; i = (uint64_t **)*i)
  {
    objc_msgSend(i[2], "materialName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

void sub_21ADCCF60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id materialCachedTable<AMSoundReductionIndex>::materialNames(uint64_t a1)
{
  void *v2;
  uint64_t **i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = *(uint64_t ***)(a1 + 16); i; i = (uint64_t **)*i)
  {
    objc_msgSend(i[2], "materialName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

void sub_21ADCCFFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21ADCD080(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21ADCD2B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21ADCD99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void AbsorptionTable::~AbsorptionTable(id *this)
{

  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table((uint64_t)this);
}

void AbsorptionTable::AbsorptionTable(AbsorptionTable *this)
{
  uint64_t v2;
  void *v3;

  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((_QWORD *)this + 5) = CFSTR("acoustic absorption");
  *((_QWORD *)this + 6) = 0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("materialName"), CFSTR("materialDescription"), CFSTR("frequencyBands"), CFSTR("absorptionUserData"), CFSTR("absorptionReferenceData"), CFSTR("uncertaintyReferenceData"), CFSTR("numDataPointsReferenceData"), CFSTR("totalNumDataSetsReferenceData"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)*((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = v2;

}

void sub_21ADCDB84(_Unwind_Exception *a1)
{
  uint64_t v1;

  materialCachedTable<AMAbsorption>::~materialCachedTable(v1);
  _Unwind_Resume(a1);
}

uint64_t materialCachedTable<AMAbsorption>::~materialCachedTable(uint64_t a1)
{

  return std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void ScatteringTable::~ScatteringTable(id *this)
{

  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table((uint64_t)this);
}

void ScatteringTable::ScatteringTable(ScatteringTable *this)
{
  uint64_t v2;
  void *v3;

  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((_QWORD *)this + 5) = CFSTR("acoustic scattering");
  *((_QWORD *)this + 6) = 0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("materialName"), CFSTR("materialDescription"), CFSTR("frequencyBands"), CFSTR("scatteringUserData"), CFSTR("scatteringReferenceData"), CFSTR("uncertaintyReferenceData"), CFSTR("numDataPointsReferenceData"), CFSTR("totalNumDataSetsReferenceData"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)*((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = v2;

}

void sub_21ADCDD2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  materialCachedTable<AMAbsorption>::~materialCachedTable(v1);
  _Unwind_Resume(a1);
}

void SoundReductionTable::~SoundReductionTable(id *this)
{

  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table((uint64_t)this);
}

void SoundReductionTable::SoundReductionTable(SoundReductionTable *this)
{
  uint64_t v2;
  void *v3;

  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((_QWORD *)this + 5) = CFSTR("acoustic sound reduction index");
  *((_QWORD *)this + 6) = 0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("materialName"), CFSTR("materialDescription"), CFSTR("frequencyBands"), CFSTR("soundReductionIndexUserData"), CFSTR("soundReductionIndexReferenceData"), CFSTR("uncertaintyReferenceData"), CFSTR("numDataPointsReferenceData"), CFSTR("averageSoundReductionIndex"), CFSTR("totalNumDataSetsReferenceData"), CFSTR("materialDepth"), CFSTR("uncertaintyMaterialDepth"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)*((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = v2;

}

void sub_21ADCDE40(_Unwind_Exception *a1)
{
  uint64_t v1;

  materialCachedTable<AMAbsorption>::~materialCachedTable(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<semantic_pair,materialsForPair>::unordered_map(uint64_t a1, uint64_t a2)
{
  __int128 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(__int128 **)(a2 + 16); i; i = *(__int128 **)i)
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_unique_key_args<semantic_pair,std::pair<semantic_pair const,materialsForPair> const&>(a1, (_QWORD *)i + 2, i + 1);
  return a1;
}

void sub_21ADCDEB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_QWORD *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_unique_key_args<semantic_pair,std::pair<semantic_pair const,materialsForPair> const&>(uint64_t a1, _QWORD *a2, __int128 *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v24[2];
  char v25;

  v6 = a2[2];
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a2[2];
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = (_QWORD *)*v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == *a2 && v10[3] == a2[1])
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v13 = a1 + 16;
  v14 = operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *v14 = 0;
  v14[1] = v6;
  std::pair<semantic_pair const,materialsForPair>::pair[abi:ne180100]((uint64_t)(v14 + 2), a3);
  v25 = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    v17 = 1;
    if (v7 >= 3)
      v17 = (v7 & (v7 - 1)) != 0;
    v18 = v17 | (2 * v7);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v20);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *(_QWORD *)v24[0] = *v21;
    *v21 = v24[0];
  }
  else
  {
    *(_QWORD *)v24[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v24[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = v13;
    if (*(_QWORD *)v24[0])
    {
      v22 = *(_QWORD *)(*(_QWORD *)v24[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v22 >= v7)
          v22 %= v7;
      }
      else
      {
        v22 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = v24[0];
    }
  }
  v10 = (_QWORD *)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)v24, 0);
  return v10;
}

void sub_21ADCE368(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t std::pair<semantic_pair const,materialsForPair>::pair[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v4;

  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 24) = *((id *)a2 + 3);
  *(_QWORD *)(a1 + 32) = *((id *)a2 + 4);
  *(_QWORD *)(a1 + 40) = *((id *)a2 + 5);
  return a1;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  id *v2;

  v2 = *(id **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<semantic_pair const,materialsForPair>,0>(v2 + 2);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<semantic_pair const,materialsForPair>,0>(id *a1)
{

}

uint64_t std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<semantic_pair const,materialsForPair>,0>(v2 + 2);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *> *>>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  __int128 *v4;
  uint64_t v6;
  uint64_t i;
  id *v8;
  BOOL v9;
  id *v10;
  unint64_t v11;
  _QWORD *inserted;
  BOOL v13;
  uint64_t v14[2];

  v4 = (__int128 *)a2;
  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = (id *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8)
      v9 = a2 == a3;
    else
      v9 = 1;
    if (v9)
    {
      v10 = v8;
    }
    else
    {
      do
      {
        v14[0] = (uint64_t)(v8 + 2);
        v14[1] = (uint64_t)(v8 + 5);
        std::pair<semantic_pair &,materialsForPair &>::operator=[abi:ne180100]<semantic_pair const,materialsForPair,(void *)0>(v14, v4 + 1);
        v10 = (id *)*v8;
        v11 = (unint64_t)v8[4];
        v8[1] = (id)v11;
        inserted = std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_prepare((uint64_t)a1, v11, v8 + 2);
        std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_perform(a1, v8, inserted);
        v4 = *(__int128 **)v4;
        if (v10)
          v13 = v4 == (__int128 *)a3;
        else
          v13 = 1;
        v8 = v10;
      }
      while (!v13);
    }
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__deallocate_node((uint64_t)a1, v10);
  }
  while (v4 != (__int128 *)a3)
  {
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_multi<std::pair<semantic_pair const,materialsForPair> const&>(a1, v4 + 1);
    v4 = *(__int128 **)v4;
  }
}

void sub_21ADCE5B4(void *a1)
{
  uint64_t v1;
  id *v2;

  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_21ADCE5CC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t *std::pair<semantic_pair &,materialsForPair &>::operator=[abi:ne180100]<semantic_pair const,materialsForPair,(void *)0>(uint64_t *a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  id *v6;

  v4 = *a1;
  v5 = *a2;
  *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)v4 = v5;
  v6 = (id *)a1[1];
  objc_storeStrong(v6, *((id *)a2 + 3));
  objc_storeStrong(v6 + 1, *((id *)a2 + 4));
  objc_storeStrong(v6 + 2, *((id *)a2 + 5));
  return a1;
}

_QWORD *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  _BOOL8 v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  _QWORD *v16;
  int v17;
  _QWORD *result;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  _BOOL4 v22;
  int v23;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 2 * v6;
    v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    v11 = v10 | v9;
    v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<false>(a1, v13);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = (_QWORD *)*v16;
    if (!v16)
      break;
    v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      v20 = v16[1];
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    if (v19 == a2)
    {
      v21 = v16[2] == *a3 && v16[3] == a3[1];
      v22 = v21;
    }
    else
    {
      v22 = 0;
    }
    v23 = v17 & !v22;
    v17 |= v22;
  }
  while (v23 != 1);
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_perform(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__do_rehash<false>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      for (i = (_QWORD *)*v7; *v7; i = (_QWORD *)*v7)
      {
        v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2)
            v12 %= a2;
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          v7 = i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (_QWORD *)*v13;
              if (!v13)
                break;
            }
            while (i[2] == v13[2] && i[3] == v13[3]);
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = i;
            v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_multi<std::pair<semantic_pair const,materialsForPair> const&>(_QWORD *a1, __int128 *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *inserted;
  _QWORD v9[2];
  char v10;

  v4 = a1 + 2;
  v5 = operator new(0x40uLL);
  v9[0] = v5;
  v9[1] = v4;
  *v5 = 0;
  v5[1] = 0;
  std::pair<semantic_pair const,materialsForPair>::pair[abi:ne180100]((uint64_t)(v5 + 2), a2);
  v10 = 1;
  v6 = v5[4];
  v5[1] = v6;
  inserted = std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_prepare((uint64_t)a1, v6, v5 + 2);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_perform(a1, v5, inserted);
  v9[0] = 0;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)v9, 0);
  return v5;
}

void sub_21ADCEB70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<NSString * {__strong},long long>::unordered_map(uint64_t a1, uint64_t a2)
{
  id *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(id **)(a2 + 16); i; i = (id *)*i)
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},long long> const&>(a1, i + 2, (uint64_t)(i + 2));
  return a1;
}

void sub_21ADCEBE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},long long> const&>(uint64_t a1, id *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  void **v12;
  void *i;
  unint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;

  v7 = objc_msgSend(*a2, "hash");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      for (i = *v12; i; i = *(void **)i)
      {
        v14 = *((_QWORD *)i + 1);
        if (v14 == v8)
        {
          if ((objc_msgSend(*((id *)i + 2), "isEqualToString:", *a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3)
            break;
        }
      }
    }
  }
  v15 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v8;
  v16 = *(id *)a3;
  v17 = *(_QWORD *)(a3 + 8);
  *((_QWORD *)i + 2) = v16;
  *((_QWORD *)i + 3) = v17;
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    v20 = 1;
    if (v9 >= 3)
      v20 = (v9 & (v9 - 1)) != 0;
    v21 = v20 | (2 * v9);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v23);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v24 = *(_QWORD *)a1;
  v25 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v25)
  {
    *(_QWORD *)i = *v25;
LABEL_38:
    *v25 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v15;
  *v15 = i;
  *(_QWORD *)(v24 + 8 * v3) = v15;
  if (*(_QWORD *)i)
  {
    v26 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v26 >= v9)
        v26 %= v9;
    }
    else
    {
      v26 &= v9 - 1;
    }
    v25 = (_QWORD *)(*(_QWORD *)a1 + 8 * v26);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_21ADCEE44(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *> *>>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t i;
  id *v8;
  BOOL v9;
  id *v10;
  BOOL v11;

  v4 = a2;
  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = (id *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8)
      v9 = a2 == a3;
    else
      v9 = 1;
    if (v9)
    {
      v10 = v8;
    }
    else
    {
      do
      {
        objc_storeStrong(v8 + 2, (id)v4[2]);
        v8[3] = (id)v4[3];
        v10 = (id *)*v8;
        std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi(a1, v8);
        v4 = (uint64_t *)*v4;
        if (v10)
          v11 = v4 == a3;
        else
          v11 = 1;
        v8 = v10;
      }
      while (!v11);
    }
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node((uint64_t)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_multi<std::pair<NSString * const {__strong},long long> const&>(a1, (uint64_t)(v4 + 2));
    v4 = (uint64_t *)*v4;
  }
}

void sub_21ADCEF74(void *a1)
{
  uint64_t v1;
  id *v2;

  __cxa_begin_catch(a1);
  std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_21ADCEF8C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *inserted;

  v4 = a2 + 2;
  v5 = objc_msgSend((id)a2[2], "hash");
  a2[1] = v5;
  inserted = std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4);
  std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__node_insert_multi_perform(a1, a2, inserted);
  return a2;
}

_QWORD *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  _BOOL8 v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  int v21;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 1;
    if (v6 >= 3)
      v9 = (v6 & (v6 - 1)) != 0;
    v10 = v9 | (2 * v6);
    v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11)
      v12 = v11;
    else
      v12 = v10;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__rehash<false>(a1, v12);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v13 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v13.i16[0] = vaddlv_u8(v13);
  v14 = v13.u32[0];
  if (v13.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
  if (v16)
  {
    v17 = (_QWORD *)*v16;
    if (*v16)
    {
      v18 = 0;
      do
      {
        v19 = v17[1];
        if (v14 > 1)
        {
          v20 = v17[1];
          if (v19 >= v6)
            v20 = v19 % v6;
        }
        else
        {
          v20 = v19 & (v6 - 1);
        }
        if (v20 != v15)
          break;
        v21 = v19 == a2 ? objc_msgSend((id)v17[2], "isEqualToString:", *a3) : 0;
        if ((v18 & (v21 ^ 1) & 1) != 0)
          break;
        v18 |= v21;
        v16 = (_QWORD *)*v16;
        v17 = (_QWORD *)*v16;
      }
      while (*v16);
    }
  }
  return v16;
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__do_rehash<false>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  void *v11;
  uint64_t i;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  int v16;
  _QWORD *v17;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(uint64_t **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      v10 = v9.u32[0];
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      for (i = *v7; *v7; i = *v7)
      {
        v13 = *(_QWORD *)(i + 8);
        if (v10 > 1)
        {
          if (v13 >= a2)
            v13 %= a2;
        }
        else
        {
          v13 &= a2 - 1;
        }
        if (v13 == v8)
        {
          v7 = (uint64_t *)i;
        }
        else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
        {
          v14 = *(_QWORD **)i;
          v15 = (_QWORD *)i;
          if (*(_QWORD *)i)
          {
            while (1)
            {
              v16 = objc_msgSend(*(id *)(i + 16), "isEqualToString:", v14[2]);
              v17 = (_QWORD *)*v15;
              if (!v16)
                break;
              v14 = (_QWORD *)*v17;
              v15 = (_QWORD *)*v15;
              if (!*v17)
                goto LABEL_30;
            }
            v14 = (_QWORD *)*v15;
            v17 = v15;
          }
          else
          {
            v17 = (_QWORD *)i;
          }
LABEL_30:
          *v7 = (uint64_t)v14;
          *v17 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v13);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v13) = i;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
          v7 = (uint64_t *)i;
          v8 = v13;
        }
      }
    }
  }
  else
  {
    v11 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v11)
      operator delete(v11);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_multi<std::pair<NSString * const {__strong},long long> const&>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__construct_node<std::pair<NSString * const {__strong},long long> const&>((uint64_t)a1, a2, (uint64_t)&v4);
  return std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__node_insert_multi(a1, v4);
}

void sub_21ADCF420(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11)
{
  if (a10)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, a10);
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__construct_node<std::pair<NSString * const {__strong},long long> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t result;

  v5 = a1 + 16;
  v6 = operator new(0x20uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *v6 = 0;
  v6[1] = 0;
  v7 = *(id *)a2;
  v8 = *(_QWORD *)(a2 + 8);
  v6[2] = v7;
  v6[3] = v8;
  *(_BYTE *)(a3 + 16) = 1;
  result = objc_msgSend(v7, "hash");
  v6[1] = result;
  return result;
}

void sub_21ADCF4B4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  id *v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::find<AMAbsorption * {__strong}>(_QWORD *a1, void **a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **v11;
  uint64_t v12;
  unint64_t v13;

  v4 = material_hash<AMAbsorption * {__strong}>::operator()((uint64_t)(a1 + 3), *a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if ((material_equal_to<AMAbsorption * {__strong}>::operator()(v12, v11[2], *a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t material_hash<AMAbsorption * {__strong}>::operator()(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "materialName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

void sub_21ADCF60C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t material_equal_to<AMAbsorption * {__strong}>::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "materialName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "materialName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

void sub_21ADCF688(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<AMScattering * {__strong},material_hash<AMScattering * {__strong}>,material_equal_to<AMScattering * {__strong}>,std::allocator<AMScattering * {__strong}>>::find<AMScattering * {__strong}>(_QWORD *a1, void **a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **v11;
  uint64_t v12;
  unint64_t v13;

  v4 = material_hash<AMScattering * {__strong}>::operator()((uint64_t)(a1 + 3), *a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if ((material_equal_to<AMScattering * {__strong}>::operator()(v12, v11[2], *a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t material_hash<AMScattering * {__strong}>::operator()(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "materialName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

void sub_21ADCF7F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t material_equal_to<AMScattering * {__strong}>::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "materialName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "materialName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

void sub_21ADCF86C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<AMSoundReductionIndex * {__strong},material_hash<AMSoundReductionIndex * {__strong}>,material_equal_to<AMSoundReductionIndex * {__strong}>,std::allocator<AMSoundReductionIndex * {__strong}>>::find<AMSoundReductionIndex * {__strong}>(_QWORD *a1, void **a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **v11;
  uint64_t v12;
  unint64_t v13;

  v4 = material_hash<AMSoundReductionIndex * {__strong}>::operator()((uint64_t)(a1 + 3), *a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if ((material_equal_to<AMSoundReductionIndex * {__strong}>::operator()(v12, v11[2], *a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t material_hash<AMSoundReductionIndex * {__strong}>::operator()(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "materialName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

void sub_21ADCF9D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t material_equal_to<AMSoundReductionIndex * {__strong}>::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "materialName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "materialName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

void sub_21ADCFA50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>(uint64_t a1, id *a2, uint64_t a3, id **a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  void **v13;
  void *i;
  unint64_t v15;
  _QWORD *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v8 = objc_msgSend(*a2, "hash");
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v4 = v8;
      if (v8 >= v10)
        v4 = v8 % v10;
    }
    else
    {
      v4 = (v10 - 1) & v8;
    }
    v13 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v13)
    {
      for (i = *v13; i; i = *(void **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((objc_msgSend(*((id *)i + 2), "isEqualToString:", *a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v4)
            break;
        }
      }
    }
  }
  v16 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v9;
  *((_QWORD *)i + 2) = **a4;
  *((_QWORD *)i + 3) = 0;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    v19 = 1;
    if (v10 >= 3)
      v19 = (v10 & (v10 - 1)) != 0;
    v20 = v19 | (2 * v10);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v24)
  {
    *(_QWORD *)i = *v24;
LABEL_38:
    *v24 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v16;
  *v16 = i;
  *(_QWORD *)(v23 + 8 * v4) = v16;
  if (*(_QWORD *)i)
  {
    v25 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10)
        v25 %= v10;
    }
    else
    {
      v25 &= v10 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_21ADCFCC4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__emplace_unique_key_args<semantic_pair,std::piecewise_construct_t const&,std::tuple<semantic_pair const&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[2];
  char v27;

  v7 = a2[2];
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = a2[2];
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *a2 && v11[3] == a2[1])
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v14 = a1 + 16;
  v15 = operator new(0x40uLL);
  v26[0] = v15;
  v26[1] = a1 + 16;
  *v15 = 0;
  v15[1] = v7;
  v16 = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v15 + 1) = **a4;
  v15[4] = v16;
  v15[5] = 0;
  v15[6] = 0;
  v15[7] = 0;
  v27 = 1;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    v19 = 1;
    if (v8 >= 3)
      v19 = (v8 & (v8 - 1)) != 0;
    v20 = v19 | (2 * v8);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v14;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v24 >= v8)
          v24 %= v8;
      }
      else
      {
        v24 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  v11 = (_QWORD *)v26[0];
  v26[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return v11;
}

void sub_21ADCFF34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<semantic_pair,materialsForPair>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::find<NSString * {__strong}>(_QWORD *a1, id *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **i;
  unint64_t v12;

  v4 = objc_msgSend(*a2, "hash");
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  for (i = *v10; i; i = (uint64_t **)*i)
  {
    v12 = (unint64_t)i[1];
    if (v12 == v6)
    {
      if ((objc_msgSend(i[2], "isEqualToString:", *a2) & 1) != 0)
        return i;
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(_QWORD *)&v5)
          v12 %= *(_QWORD *)&v5;
      }
      else
      {
        v12 &= *(_QWORD *)&v5 - 1;
      }
      if (v12 != v9)
        return 0;
    }
  }
  return i;
}

_QWORD *std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::find<semantic_pair>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = a2[2];
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = a2[2];
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2 && result[3] == a2[1])
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

void std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__deallocate_node(a1, *(id **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void *std::__hash_table<AMAbsorption * {__strong},material_hash<AMAbsorption * {__strong}>,material_equal_to<AMAbsorption * {__strong}>,std::allocator<AMAbsorption * {__strong}>>::__emplace_unique_key_args<AMAbsorption * {__strong},AMAbsorption * const {__strong}&>(uint64_t a1, void **a2, id *a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  void **v13;
  void *i;
  unint64_t v15;
  _QWORD *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v7 = (_QWORD *)(a1 + 24);
  v8 = material_hash<AMAbsorption * {__strong}>::operator()(a1 + 24, *a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(void **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((material_equal_to<AMAbsorption * {__strong}>::operator()(a1 + 32, *((void **)i + 2), *a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  v16 = (_QWORD *)(a1 + 16);
  i = operator new(0x18uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v9;
  *((_QWORD *)i + 2) = *a3;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    v19 = 1;
    if (v10 >= 3)
      v19 = (v10 & (v10 - 1)) != 0;
    v20 = v19 | (2 * v10);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    *(_QWORD *)i = *v24;
LABEL_38:
    *v24 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v16;
  *v16 = i;
  *(_QWORD *)(v23 + 8 * v3) = v16;
  if (*(_QWORD *)i)
  {
    v25 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10)
        v25 %= v10;
    }
    else
    {
      v25 &= v10 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_21ADD03B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<AMScattering * {__strong},material_hash<AMScattering * {__strong}>,material_equal_to<AMScattering * {__strong}>,std::allocator<AMScattering * {__strong}>>::__emplace_unique_key_args<AMScattering * {__strong},AMScattering * const {__strong}&>(uint64_t a1, void **a2, id *a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  void **v13;
  void *i;
  unint64_t v15;
  _QWORD *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v7 = (_QWORD *)(a1 + 24);
  v8 = material_hash<AMScattering * {__strong}>::operator()(a1 + 24, *a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(void **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((material_equal_to<AMScattering * {__strong}>::operator()(a1 + 32, *((void **)i + 2), *a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  v16 = (_QWORD *)(a1 + 16);
  i = operator new(0x18uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v9;
  *((_QWORD *)i + 2) = *a3;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    v19 = 1;
    if (v10 >= 3)
      v19 = (v10 & (v10 - 1)) != 0;
    v20 = v19 | (2 * v10);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    *(_QWORD *)i = *v24;
LABEL_38:
    *v24 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v16;
  *v16 = i;
  *(_QWORD *)(v23 + 8 * v3) = v16;
  if (*(_QWORD *)i)
  {
    v25 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10)
        v25 %= v10;
    }
    else
    {
      v25 &= v10 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_21ADD0628(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<AMSoundReductionIndex * {__strong},material_hash<AMSoundReductionIndex * {__strong}>,material_equal_to<AMSoundReductionIndex * {__strong}>,std::allocator<AMSoundReductionIndex * {__strong}>>::__emplace_unique_key_args<AMSoundReductionIndex * {__strong},AMSoundReductionIndex * const {__strong}&>(uint64_t a1, void **a2, id *a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  void **v13;
  void *i;
  unint64_t v15;
  _QWORD *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v7 = (_QWORD *)(a1 + 24);
  v8 = material_hash<AMSoundReductionIndex * {__strong}>::operator()(a1 + 24, *a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(void **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((material_equal_to<AMSoundReductionIndex * {__strong}>::operator()(a1 + 32, *((void **)i + 2), *a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  v16 = (_QWORD *)(a1 + 16);
  i = operator new(0x18uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v9;
  *((_QWORD *)i + 2) = *a3;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    v19 = 1;
    if (v10 >= 3)
      v19 = (v10 & (v10 - 1)) != 0;
    v20 = v19 | (2 * v10);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<semantic_pair,materialsForPair>,std::__unordered_map_hasher<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::hash<semantic_pair>,std::equal_to<semantic_pair>,true>,std::__unordered_map_equal<semantic_pair,std::__hash_value_type<semantic_pair,materialsForPair>,std::equal_to<semantic_pair>,std::hash<semantic_pair>,true>,std::allocator<std::__hash_value_type<semantic_pair,materialsForPair>>>::__rehash<true>(a1, v22);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    *(_QWORD *)i = *v24;
LABEL_38:
    *v24 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v16;
  *v16 = i;
  *(_QWORD *)(v23 + 8 * v3) = v16;
  if (*(_QWORD *)i)
  {
    v25 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10)
        v25 %= v10;
    }
    else
    {
      v25 &= v10 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_21ADD08A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},long long>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

BOOL valueIsBetween(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (objc_msgSend(v6, "compare:", v5) == -1 || !objc_msgSend(v6, "compare:", v5))
    && (objc_msgSend(v7, "compare:", v5) == 1 || !objc_msgSend(v7, "compare:", v5));

  return v8;
}

id decimalValuesFromCSV(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v1;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("NaN")))
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        }
        else
        {
          v9 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v8, "doubleValue");
          objc_msgSend(v9, "numberWithDouble:");
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

id clampArrayValues(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "doubleValue", (_QWORD)v23);
        v16 = v15;
        objc_msgSend(v6, "doubleValue");
        v17 = v6;
        if (v16 >= v18)
        {
          objc_msgSend(v14, "doubleValue", v6);
          v20 = v19;
          objc_msgSend(v7, "doubleValue");
          if (v20 <= v21)
            v17 = v14;
          else
            v17 = v7;
        }
        objc_msgSend(v8, "addObject:", v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  return v8;
}

id integerValuesFromCSV(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v1;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("NaN")))
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        else
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "intValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24DE11100(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DE11108(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x24BEDD010](dest, src, copyHelper);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

