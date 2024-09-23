@implementation NSManagedObjectModelBundle

- (NSManagedObjectModelBundle)initWithPath:(id)a3
{
  NSManagedObjectModelBundle *v4;
  NSBundle *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSManagedObjectModelBundle;
  v4 = -[NSManagedObjectModelBundle init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSBundle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", a3);
    v4->_bundle = v5;
    if (v5)
    {
      v6 = -[NSBundle pathForResource:ofType:](v5, "pathForResource:ofType:", CFSTR("VersionInfo"), CFSTR("plist"));
      if (v6
        || (v6 = -[NSBundle pathForResource:ofType:](v4->_bundle, "pathForResource:ofType:", CFSTR("Info"), CFSTR("plist"))) != 0)
      {
        v4->_versionInfoDictionary = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
      }
    }
  }
  return v4;
}

- (id)urlForModelVersionWithName:(id)a3
{
  id result;

  if (self)
    self = (NSManagedObjectModelBundle *)self->_bundle;
  result = (id)-[NSManagedObjectModelBundle pathForResource:ofType:](self, "pathForResource:ofType:", a3, CFSTR("mom"));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", result, 0);
  return result;
}

- (id)optimizedVersionURL
{
  NSBundle *bundle;
  id result;

  if (self)
    bundle = self->_bundle;
  else
    bundle = 0;
  result = -[NSBundle pathForResource:ofType:](bundle, "pathForResource:ofType:", -[NSManagedObjectModelBundle currentVersion](self, "currentVersion"), CFSTR("omo"));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", result, 0);
  return result;
}

- (id)currentVersionURL
{
  return -[NSManagedObjectModelBundle urlForModelVersionWithName:](self, "urlForModelVersionWithName:", -[NSManagedObjectModelBundle currentVersion](self, "currentVersion"));
}

- (id)currentVersion
{
  if (self)
    self = (NSManagedObjectModelBundle *)self->_versionInfoDictionary;
  return (id)-[NSManagedObjectModelBundle objectForKey:](self, "objectForKey:", CFSTR("NSManagedObjectModel_CurrentVersionName"));
}

- (void)dealloc
{
  objc_super v3;

  self->_bundle = 0;
  self->_versionInfoDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSManagedObjectModelBundle;
  -[NSManagedObjectModelBundle dealloc](&v3, sel_dealloc);
}

- (id)modelVersions
{
  if (self)
    self = -[NSDictionary objectForKey:](self->_versionInfoDictionary, "objectForKey:", CFSTR("NSManagedObjectModel_VersionHashes"));
  return (id)-[NSManagedObjectModelBundle allKeys](self, "allKeys");
}

- (id)versionChecksums
{
  if (self)
    self = (NSManagedObjectModelBundle *)self->_versionInfoDictionary;
  return (id)-[NSManagedObjectModelBundle objectForKey:](self, "objectForKey:", CFSTR("NSManagedObjectModel_VersionChecksums"));
}

- (id)_modelForVersionHashes:(id)a3 inStyle:(unint64_t)a4
{
  id v6;
  NSArray *v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  unint64_t v17;
  NSManagedObjectModel *v18;
  uint64_t v19;
  void *v20;
  id v22;
  NSManagedObjectModel *v23;
  void *v24;
  NSDictionary *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id k;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  void *v47;
  NSDictionary *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t ii;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  NSArray *obj;
  NSManagedObjectModel *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSDictionary *v62;
  NSManagedObjectModel *v63;
  uint64_t v64;
  id v65;
  void *context;
  void *contexta;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  if (a4 != 1)
    return -[NSManagedObjectModelBundle _modelForVersionHashes:](self, "_modelForVersionHashes:", a3);
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v56 = (void *)objc_msgSend(a3, "allKeys");
  v7 = -[NSBundle URLsForResourcesWithExtension:subdirectory:](self->_bundle, "URLsForResourcesWithExtension:subdirectory:", CFSTR("mom"), 0);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v7;
  v61 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v61)
  {
    v55 = v6;
    v65 = 0;
    v58 = 0;
    v59 = *(_QWORD *)v89;
    while (2)
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v89 != v59)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
        context = (void *)MEMORY[0x18D76B4E4]();
        v63 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", v9);
        v10 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](v63, 1);
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v85;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v85 != v14)
                objc_enumerationMutation(v10);
              v16 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v10, "objectForKey:", v16), "isEqual:", objc_msgSend(a3, "objectForKey:", v16)))
              {
                if (!v13)
                  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                objc_msgSend(v13, "addObject:", v16);
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
          }
          while (v12);
        }
        else
        {
          v13 = 0;
        }
        if (objc_msgSend(v13, "count"))
        {
          v17 = objc_msgSend(v13, "count");
          v18 = v63;
          if (v17 > objc_msgSend(v65, "count"))
          {

            v58 = v63;
            v65 = v13;
            v19 = objc_msgSend(v56, "count");
            if (v19 == objc_msgSend(v13, "count"))
            {

              objc_autoreleasePoolPop(context);
              goto LABEL_30;
            }
          }
          v20 = context;
        }
        else
        {
          v20 = context;
          v18 = v63;
        }

        objc_autoreleasePoolPop(v20);
      }
      v61 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
      if (v61)
        continue;
      break;
    }
LABEL_30:
    v22 = 0;
    v23 = v58;
    if (!v58)
    {
      v6 = v55;
LABEL_73:
      v24 = v65;
      goto LABEL_74;
    }
    v24 = v65;
    if (v65)
    {
      v25 = -[NSManagedObjectModel entitiesByName](v58, "entitiesByName");
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v65, "count"));
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v65, "count"));
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v28 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v81;
        v60 = *(_QWORD *)v81;
        v62 = v25;
        do
        {
          v31 = 0;
          v64 = v29;
          do
          {
            if (*(_QWORD *)v81 != v30)
              objc_enumerationMutation(v24);
            v32 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v31);
            v33 = (void *)MEMORY[0x18D76B4E4]();
            for (k = -[NSDictionary objectForKey:](v25, "objectForKey:", v32); ; k = (id)objc_msgSend(v35, "superentity"))
            {
              v35 = k;
              objc_msgSend(v27, "addObject:", objc_msgSend(k, "name"));
              if (!objc_msgSend(v35, "superentity"))
                break;
            }
            if (!objc_msgSend(v26, "valueForKey:", objc_msgSend(v35, "name")))
            {
              v36 = (void *)objc_msgSend(v35, "copy");
              v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              contexta = v36;
              +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]((uint64_t)NSManagedObjectModel, v37, v36);
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              v77 = 0u;
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
              if (v38)
              {
                v39 = v38;
                v40 = *(_QWORD *)v77;
                do
                {
                  for (m = 0; m != v39; ++m)
                  {
                    if (*(_QWORD *)v77 != v40)
                      objc_enumerationMutation(v37);
                    objc_msgSend(v26, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * m), objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * m), "name"));
                  }
                  v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
                }
                while (v39);
              }

              v29 = v64;
              v24 = v65;
              v30 = v60;
              v25 = v62;
            }
            objc_autoreleasePoolPop(v33);
            ++v31;
          }
          while (v31 != v29);
          v29 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
        }
        while (v29);
      }
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v42 = (void *)objc_msgSend(v26, "allValues");
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v73;
        do
        {
          for (n = 0; n != v44; ++n)
          {
            if (*(_QWORD *)v73 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * n);
            if ((objc_msgSend(v27, "containsObject:", objc_msgSend(v47, "name")) & 1) == 0)
            {
              -[NSEntityDescription _removeSubentity:](objc_msgSend(v47, "superentity"), v47);
              objc_msgSend(v26, "removeObjectForKey:", objc_msgSend(v47, "name"));
            }
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
        }
        while (v44);
      }
      v22 = -[NSManagedObjectModel _initWithEntities:]([NSManagedObjectModel alloc], "_initWithEntities:", objc_msgSend(v26, "allValues"));
      objc_msgSend(v22, "setVersionIdentifiers:", -[NSManagedObjectModel versionIdentifiers](v58, "versionIdentifiers"));
      v48 = -[NSManagedObjectModel fetchRequestTemplatesByName](v58, "fetchRequestTemplatesByName");
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v49 = -[NSDictionary countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v69;
        do
        {
          for (ii = 0; ii != v50; ++ii)
          {
            if (*(_QWORD *)v69 != v51)
              objc_enumerationMutation(v48);
            v53 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * ii);
            v54 = -[NSDictionary objectForKey:](v48, "objectForKey:", v53);
            if (objc_msgSend(v26, "objectForKey:", objc_msgSend((id)objc_msgSend(v54, "entity"), "name")))
              objc_msgSend(v22, "setFetchRequestTemplate:forName:", v54, v53);
          }
          v50 = -[NSDictionary countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
        }
        while (v50);
      }

      v6 = v55;
      v23 = v58;
      goto LABEL_73;
    }
    v6 = v55;
  }
  else
  {
    v23 = 0;
    v24 = 0;
    v22 = 0;
  }
LABEL_74:

  objc_msgSend(v6, "drain");
  return v22;
}

- (id)_modelForVersionHashes:(id)a3
{
  id v5;
  id v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id k;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  NSDictionary *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t ii;
  uint64_t v46;
  id v47;
  NSManagedObjectModelBundle *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  NSManagedObjectModel *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSDictionary *v58;
  void *v59;
  uint64_t v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v59 = (void *)objc_msgSend(a3, "allKeys");
  if (self)
    v6 = -[NSDictionary objectForKey:](self->_versionInfoDictionary, "objectForKey:", CFSTR("NSManagedObjectModel_VersionHashes"));
  else
    v6 = 0;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v55 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
  if (v55)
  {
    v49 = self;
    v50 = v5;
    v61 = 0;
    v51 = 0;
    v52 = v6;
    v53 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v83 != v53)
          objc_enumerationMutation(v6);
        v57 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKey:"), "dictionaryWithValuesForKeys:", v59);
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v79;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v79 != v12)
                objc_enumerationMutation(v8);
              v14 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v8, "objectForKey:", v14), "isEqual:", objc_msgSend(a3, "objectForKey:", v14)))
              {
                if (!v11)
                  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                objc_msgSend(v11, "addObject:", v14);
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
          }
          while (v10);
        }
        else
        {
          v11 = 0;
        }
        if (objc_msgSend(v11, "count") && (v15 = objc_msgSend(v11, "count"), v15 > objc_msgSend(v61, "count")))
        {

          v51 = v57;
          v61 = v11;
          v16 = objc_msgSend(v59, "count");
          v6 = v52;
          if (v16 == objc_msgSend(v11, "count"))
            goto LABEL_28;
        }
        else
        {
          v6 = v52;
        }
      }
      v55 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    }
    while (v55);
LABEL_28:
    v17 = 0;
    v18 = v51;
    if (v51)
    {
      v19 = v61;
      if (v61)
      {
        v54 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", -[NSManagedObjectModelBundle urlForModelVersionWithName:](v49, "urlForModelVersionWithName:", v51));
        v20 = -[NSManagedObjectModel entitiesByName](v54, "entitiesByName");
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v61, "count"));
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v61, "count"));
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v23 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v75;
          v56 = *(_QWORD *)v75;
          v58 = v20;
          do
          {
            v26 = 0;
            v60 = v24;
            do
            {
              if (*(_QWORD *)v75 != v25)
                objc_enumerationMutation(v19);
              for (k = -[NSDictionary objectForKey:](v20, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v26)); ; k = (id)objc_msgSend(v28, "superentity"))
              {
                v28 = k;
                objc_msgSend(v22, "addObject:", objc_msgSend(k, "name"));
                if (!objc_msgSend(v28, "superentity"))
                  break;
              }
              if (!objc_msgSend(v21, "valueForKey:", objc_msgSend(v28, "name")))
              {
                v29 = (void *)objc_msgSend(v28, "copy");
                v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]((uint64_t)NSManagedObjectModel, v30, v29);
                v72 = 0u;
                v73 = 0u;
                v70 = 0u;
                v71 = 0u;
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
                if (v31)
                {
                  v32 = v31;
                  v33 = *(_QWORD *)v71;
                  do
                  {
                    for (m = 0; m != v32; ++m)
                    {
                      if (*(_QWORD *)v71 != v33)
                        objc_enumerationMutation(v30);
                      objc_msgSend(v21, "setObject:forKey:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * m), objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * m), "name"));
                    }
                    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
                  }
                  while (v32);
                }

                v24 = v60;
                v19 = v61;
                v25 = v56;
                v20 = v58;
              }
              ++v26;
            }
            while (v26 != v24);
            v24 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
          }
          while (v24);
        }
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v35 = (void *)objc_msgSend(v21, "allValues");
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v87, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v67;
          do
          {
            for (n = 0; n != v37; ++n)
            {
              if (*(_QWORD *)v67 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * n);
              if ((objc_msgSend(v22, "containsObject:", objc_msgSend(v40, "name")) & 1) == 0)
              {
                -[NSEntityDescription _removeSubentity:](objc_msgSend(v40, "superentity"), v40);
                objc_msgSend(v21, "removeObjectForKey:", objc_msgSend(v40, "name"));
              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v87, 16);
          }
          while (v37);
        }
        v17 = -[NSManagedObjectModel _initWithEntities:]([NSManagedObjectModel alloc], "_initWithEntities:", objc_msgSend(v21, "allValues"));
        objc_msgSend(v17, "setVersionIdentifiers:", -[NSManagedObjectModel versionIdentifiers](v54, "versionIdentifiers"));
        v41 = -[NSManagedObjectModel fetchRequestTemplatesByName](v54, "fetchRequestTemplatesByName");
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v42 = -[NSDictionary countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v62, v86, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v63;
          do
          {
            for (ii = 0; ii != v43; ++ii)
            {
              if (*(_QWORD *)v63 != v44)
                objc_enumerationMutation(v41);
              v46 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * ii);
              v47 = -[NSDictionary objectForKey:](v41, "objectForKey:", v46);
              if (objc_msgSend(v21, "objectForKey:", objc_msgSend((id)objc_msgSend(v47, "entity"), "name")))
                objc_msgSend(v17, "setFetchRequestTemplate:forName:", v47, v46);
            }
            v43 = -[NSDictionary countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v62, v86, 16);
          }
          while (v43);
        }

        v5 = v50;
        v18 = v51;
      }
      else
      {
        v5 = v50;
      }
    }
    else
    {
      v5 = v50;
      v19 = v61;
    }
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v17 = 0;
  }

  objc_msgSend(v5, "drain");
  return v17;
}

@end
