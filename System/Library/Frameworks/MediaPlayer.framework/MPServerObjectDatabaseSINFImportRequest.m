@implementation MPServerObjectDatabaseSINFImportRequest

- (MPServerObjectDatabaseSINFImportRequest)initWithPayload:(id)a3 requestPayload:(id)a4 hashedPersonID:(id)a5
{
  id v9;
  id v10;
  id *v11;
  MPServerObjectDatabaseSINFImportRequest *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPServerObjectDatabaseSINFImportRequest;
  v11 = -[MPServerObjectDatabaseImportRequest _initWithPayload:](&v14, sel__initWithPayload_, a3);
  v12 = (MPServerObjectDatabaseSINFImportRequest *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 5, a4);
    objc_storeStrong((id *)&v12->_hashedPersonID, a5);
  }

  return v12;
}

- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id obj;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  MPServerObjectDatabaseSINFImportRequest *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  -[MPServerObjectDatabaseImportRequest payload](self, "payload");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E316CA50, "dataUsingEncoding:", 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_requestPayload, "objectForKeyedSubscript:", CFSTR("adamIds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self;
  objc_msgSend(self->_requestPayload, "objectForKeyedSubscript:", CFSTR("flavors"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v25)
  {
    v6 = 1;
    v22 = *(_QWORD *)v36;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(obj);
        v26 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v7);
        objc_msgSend(v24, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v27 = v23;
        v10 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v32 != v12)
                objc_enumerationMutation(v27);
              v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              v15 = v29;
              objc_msgSend(v9, "objectForKeyedSubscript:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "length"))
              {
                v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 0);

                v15 = (id)v17;
              }
              v18 = v14;
              if ((objc_msgSend(&unk_1E31E58D8, "containsObject:", v18) & 1) != 0)
              {
                v19 = 1;
              }
              else if ((objc_msgSend(&unk_1E31E58F0, "containsObject:", v18) & 1) != 0)
              {
                v19 = 2;
              }
              else if ((objc_msgSend(&unk_1E31E5908, "containsObject:", v18) & 1) != 0)
              {
                v19 = 3;
              }
              else if (objc_msgSend(&unk_1E31E5920, "containsObject:", v18))
              {
                v19 = 4;
              }
              else
              {
                v19 = 0;
              }

              v6 &= objc_msgSend(v30, "importAssetSinf:type:forIdentifier:hashedPersonID:flavor:sinfPayload:", v15, 2, v8, v28->_hashedPersonID, v19, 0);
            }
            v11 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v11);
        }

        v7 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v25);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashedPersonID, 0);
  objc_storeStrong(&self->_requestPayload, 0);
}

@end
