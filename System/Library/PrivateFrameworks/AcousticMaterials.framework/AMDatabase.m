@implementation AMDatabase

+ (BOOL)openDatabase:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  sqlite3 **v9;
  uint64_t v10;
  void *v11;
  ScatteringTable *v12;
  void *v13;
  SoundReductionTable *v14;
  void *v15;
  void *v16;
  SemanticsTable *v17;
  void *v18;
  __int128 v19;
  BOOL v20;
  __int128 v22;
  uint64_t v23;

  if (_dbPtr)
    DBIOCloseDatabase((void **)&_dbPtr, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("AMDatabase.db"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = DBIOOpenDatabaseFromURL(v8, a3);
  _dbPtr = (uint64_t)v9;
  if (!v9)
    goto LABEL_9;
  v10 = DBIODatabaseValidatedWithoutError(v9, a3);
  if ((v10 & 1) == 0)
  {
    DBIOCloseDatabase((void **)&_dbPtr, a3);
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v11 = AbsorptionTable::get((AbsorptionTable *)v10);
  materialCachedTable<AMAbsorption>::readTable((uint64_t)v11, a3);
  v13 = ScatteringTable::get(v12);
  materialCachedTable<AMScattering>::readTable((uint64_t)v13, a3);
  v15 = SoundReductionTable::get(v14);
  materialCachedTable<AMSoundReductionIndex>::readTable((uint64_t)v15, a3);
  v16 = (void *)SemanticsTableCached;
  if (!SemanticsTableCached)
  {
    v17 = objc_alloc_init(SemanticsTable);
    v18 = (void *)SemanticsTableCached;
    SemanticsTableCached = (uint64_t)v17;

    v16 = (void *)SemanticsTableCached;
  }
  objc_msgSend(v16, "readTable:", a3);
  _parameterFilter = 0;
  *(_QWORD *)&v19 = 255;
  *((_QWORD *)&v19 + 1) = 255;
  v22 = v19;
  v23 = 0xFFFFLL;
  _defaultMaterial = objc_msgSend((id)SemanticsTableCached, "getMaterialsForPair:", &v22);
  v20 = 1;
LABEL_10:

  return v20;
}

+ (BOOL)openDatabaseWithAcousticParameterFilter:(unint64_t)a3 error:(id *)a4
{
  AbsorptionTable *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v5 = (AbsorptionTable *)+[AMDatabase openDatabase:](AMDatabase, "openDatabase:", a4);
  v6 = (char)v5;
  if ((_DWORD)v5)
  {
    if (a3 - 1 <= 2)
    {
      v7 = *(&off_24DE11350 + a3 - 1);
      v8 = AbsorptionTable::get(v5);
      materialCachedTable<AMAbsorption>::applyAbsFilter((uint64_t)v8, v7);
    }
    _parameterFilter = a3;
  }
  return v6;
}

+ (BOOL)closeDatabase:(id *)a3
{
  return DBIOCloseDatabase((void **)&_dbPtr, a3);
}

+ (BOOL)checkDatabaseReadAccess:(id *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  if (_dbPtr)
    return 1;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.acousticmaterials.parameterfilter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "unsignedIntValue") <= 7)
    v5 = objc_msgSend(v4, "unsignedIntValue");
  else
    v5 = 1;
  _parameterFilter = v5;
  v6 = +[AMDatabase openDatabaseWithAcousticParameterFilter:error:](AMDatabase, "openDatabaseWithAcousticParameterFilter:error:");

  return v6;
}

+ (id)materialNamesForAcousticParameterType:(id)a3 error:(id *)a4
{
  id v5;
  AbsorptionTable *v6;
  void *v7;
  uint64_t v8;
  ScatteringTable *v9;
  void *v10;
  SoundReductionTable *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!+[AMDatabase checkDatabaseReadAccess:](AMDatabase, "checkDatabaseReadAccess:", a4))
    goto LABEL_10;
  v6 = (AbsorptionTable *)objc_msgSend(v5, "isEqualToString:", CFSTR("acoustic absorption"));
  if ((_DWORD)v6)
  {
    v7 = AbsorptionTable::get(v6);
    materialCachedTable<AMAbsorption>::materialNames((uint64_t)v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v9 = (ScatteringTable *)objc_msgSend(v5, "isEqualToString:", CFSTR("acoustic scattering"));
  if ((_DWORD)v9)
  {
    v10 = ScatteringTable::get(v9);
    materialCachedTable<AMScattering>::materialNames((uint64_t)v10);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v11 = (SoundReductionTable *)objc_msgSend(v5, "isEqualToString:", CFSTR("acoustic sound reduction index"));
  if (!(_DWORD)v11)
  {
LABEL_10:
    v13 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v12 = SoundReductionTable::get(v11);
  materialCachedTable<AMSoundReductionIndex>::materialNames((uint64_t)v12);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = (void *)v8;
  if (!a4)
    goto LABEL_13;
LABEL_11:
  if (!v13)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Materials for %@ don't exist in the database."), v5, *MEMORY[0x24BDD0FC8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v13;
}

+ (id)labelsForSemanticType:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (+[AMDatabase checkDatabaseReadAccess:](AMDatabase, "checkDatabaseReadAccess:", a4))
  {
    objc_msgSend((id)SemanticsTableCached, "labelsForSemanticType:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)acousticParameters:(id)a3 forMaterialName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  AbsorptionTable *v10;
  _QWORD *v11;
  void *v12;
  ScatteringTable *v13;
  _QWORD *v14;
  SoundReductionTable *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (+[AMDatabase checkDatabaseReadAccess:](AMDatabase, "checkDatabaseReadAccess:", a5))
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = (AbsorptionTable *)objc_msgSend(v7, "isEqualToString:", CFSTR("acoustic absorption"));
    if ((_DWORD)v10)
    {
      v11 = AbsorptionTable::get(v10);
      materialCachedTable<AMAbsorption>::getMaterial(v11, v8, (uint64_t *)a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_11;
    }
    else
    {
      v13 = (ScatteringTable *)objc_msgSend(v7, "isEqualToString:", CFSTR("acoustic scattering"));
      if ((_DWORD)v13)
      {
        v14 = ScatteringTable::get(v13);
        materialCachedTable<AMScattering>::getMaterial(v14, v8, (uint64_t *)a5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_11;
      }
      else
      {
        v15 = (SoundReductionTable *)objc_msgSend(v7, "isEqualToString:", CFSTR("acoustic sound reduction index"));
        if ((_DWORD)v15)
        {
          v16 = SoundReductionTable::get(v15);
          materialCachedTable<AMSoundReductionIndex>::getMaterial(v16, v8, (uint64_t *)a5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
LABEL_11:
            objc_msgSend(v9, "setObject:forKey:", v12, v7);

            a5 = (id *)objc_msgSend(v9, "copy");
LABEL_15:

            goto LABEL_16;
          }
        }
        else
        {
          if (!a5)
            goto LABEL_15;
          v17 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown acoustic parameter type [%@]"), v7, *MEMORY[0x24BDD0FC8]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = v18;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v19);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    a5 = 0;
    goto LABEL_15;
  }
  a5 = 0;
LABEL_16:

  return a5;
}

+ (id)acousticParameters:(id)a3 forSemanticLabels:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  unint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  char v42;
  id *v43;
  const __CFString *v44;
  char v45;
  int v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[3];
  unint64_t v59;
  unint64_t v60;
  _BYTE v61[128];
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v52 = a3;
  v53 = a4;
  if (!v52 || !v53 || !objc_msgSend(v52, "count") || !objc_msgSend(v53, "count"))
  {
    if (!a5)
      goto LABEL_13;
    v22 = (void *)MEMORY[0x24BDD1540];
    v66 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("At least one query input (parameterTypes, semanticQuery) was empty."));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v24);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
    a5 = 0;
    goto LABEL_13;
  }
  if (!+[AMDatabase checkDatabaseReadAccess:](AMDatabase, "checkDatabaseReadAccess:", a5))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v52);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("acoustic absorption"), CFSTR("acoustic scattering"), CFSTR("acoustic sound reduction index"), 0);
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isSubsetOfSet:", v10);

  if ((v11 & 1) == 0)
  {
    if (!a5)
      goto LABEL_13;
    v26 = (void *)MEMORY[0x24BDD1540];
    v64 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("At least one requested acoustic parameter type not found in database."));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v28);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v53, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("visual material"), CFSTR("ARMeshMaterial"), CFSTR("object"), CFSTR("ARMeshClassification"), 0);
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "isSubsetOfSet:", v17);

  if ((v18 & 1) == 0)
  {
    if (!a5)
      goto LABEL_13;
    v49 = (void *)MEMORY[0x24BDD1540];
    v62 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("At least one requested semantic type not found in database."));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 11, v51);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_8:
  v60 = 255;
  objc_msgSend(v53, "objectForKey:", CFSTR("visual material"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)SemanticsTableCached;
    objc_msgSend(v53, "objectForKey:", CFSTR("visual material"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "getARMeshMaterialID:ARMeshMaterialID:", v21, &v60);

  }
  else
  {
    objc_msgSend(v53, "objectForKey:", CFSTR("ARMeshMaterial"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v53, "objectForKey:", CFSTR("ARMeshMaterial"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v60 = objc_msgSend(v30, "longValue");

    }
  }
  v59 = 255;
  objc_msgSend(v53, "objectForKey:", CFSTR("object"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (!v32)
  {
    v33 = (void *)SemanticsTableCached;
    objc_msgSend(v53, "objectForKey:", CFSTR("object"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "getARMeshClassificationID:ARMeshClassificationID:", v34, &v59);
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(v53, "objectForKey:", CFSTR("ARMeshClassification"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47 == 0;

  if (!v48)
  {
    objc_msgSend(v53, "objectForKey:", CFSTR("ARMeshClassification"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v59 = objc_msgSend(v34, "longValue");
    goto LABEL_22;
  }
LABEL_23:
  v58[0] = v60;
  v58[1] = v59;
  if (v60 >= v59)
    v35 = v60 + v60 * v60 + v59;
  else
    v35 = v60 + v59 * v59;
  v58[2] = v35;
  a5 = (id *)objc_msgSend((id)SemanticsTableCached, "getMaterialsForPair:", v58);
  if (a5)
  {
    v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v37 = v52;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v55 != v39)
            objc_enumerationMutation(v37);
          v41 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("acoustic absorption"));
          v43 = a5;
          v44 = CFSTR("acoustic absorption");
          if ((v42 & 1) == 0)
          {
            v45 = objc_msgSend(v41, "isEqualToString:", CFSTR("acoustic scattering"), CFSTR("acoustic absorption"));
            v43 = a5 + 1;
            v44 = CFSTR("acoustic scattering");
            if ((v45 & 1) == 0)
            {
              v46 = objc_msgSend(v41, "isEqualToString:", CFSTR("acoustic sound reduction index"), CFSTR("acoustic scattering"));
              v43 = a5 + 2;
              v44 = CFSTR("acoustic sound reduction index");
              if (!v46)
                continue;
            }
          }
          objc_msgSend(v36, "setObject:forKey:", *v43, v44);
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      }
      while (v38);
    }

    a5 = (id *)objc_msgSend(v36, "copy");
  }
LABEL_13:

  return a5;
}

@end
