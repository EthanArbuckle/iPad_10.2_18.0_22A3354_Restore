@implementation CCDataSite

- (id)description
{
  return self->_description;
}

- (NSURL)dataSiteURL
{
  return self->_dataSiteURL;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)isEquivalentDataSiteURL:(id)a3
{
  NSURL *dataSiteURL;
  id v4;
  void *v5;
  void *v6;

  dataSiteURL = self->_dataSiteURL;
  v4 = a3;
  -[NSURL path](dataSiteURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

+ (id)defaultDataSiteWithRootDirectoryURL:(id)a3 create:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a4;
  CCDefaultDataSite((uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataSiteURL:create:error:", v8, v6, a5);

  return v9;
}

- (CCDataSite)initWithDataSiteURL:(id)a3 create:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  CCDataSite *v10;
  CCDataSite *v11;
  CCDataSite *v12;
  objc_super v14;

  v6 = a4;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CCDataSite;
  v10 = -[CCDataSite init](&v14, sel_init);
  v11 = v10;
  if (!v10
    || (objc_storeStrong((id *)&v10->_dataSiteURL, a3),
        v11->_dataProtectionClass = CCProtectionClassForDataSiteURL(),
        !v6)
    || (CCGetOrCreateDirectoryURL(v11->_dataSiteURL, a5),
        v12 = (CCDataSite *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    v12 = v11;
  }

  return v12;
}

- (CCDataSite)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)dataResourceForSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CCDataResource *v13;

  v4 = a3;
  CCTypeIdentifierRegistryBridge();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifierForItemType:", objc_msgSend(v4, "itemType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE0C0B0]);
    objc_msgSend(v4, "descriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithType:name:descriptors:", 4, v6, v8);

    objc_msgSend(MEMORY[0x24BE0C098], "dataResourcePathComponentFromResource:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CCDataSite dataSiteURL](self, "dataSiteURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = -[CCDataResource initWithDataSite:directoryURL:]([CCDataResource alloc], "initWithDataSite:directoryURL:", self, v12);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)enumerateDataResources:(id *)a3 setIdentifier:(id)a4 descriptors:(id)a5 includingTombstoned:(BOOL)a6 usingBlock:(id)a7
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  CCDataResource *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CCDataResource *v25;
  CCDataResource *v26;
  BOOL v27;
  int v28;
  id v30;
  void (**v31)(id, id, _BYTE *);
  _BOOL4 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  char v45;
  _BYTE v46[128];
  uint64_t v47;

  v32 = a6;
  v47 = *MEMORY[0x24BDAC8D0];
  v33 = a4;
  v30 = a5;
  v31 = (void (**)(id, id, _BYTE *))a7;
  v45 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__1;
  v43 = __Block_byref_object_dispose__1;
  v44 = 0;
  -[CCDataSite dataSiteURL](self, "dataSiteURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v11 = objc_alloc(MEMORY[0x24BE0C0B0]);
    if (v30)
      v12 = v30;
    else
      v12 = (id)MEMORY[0x24BDBD1A8];
    v13 = (id)objc_msgSend(v11, "initWithType:name:descriptors:", 4, v33, v12, v30);
    objc_msgSend(MEMORY[0x24BE0C098], "dataResourcePathComponentFromResource:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_38;
    objc_msgSend(v10, "URLByAppendingPathComponent:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }
  if (+[CCDataResource directoryContainsDataResource:](CCDataResource, "directoryContainsDataResource:", v10, v30))
  {
    v16 = -[CCDataResource initWithDataSite:directoryURL:]([CCDataResource alloc], "initWithDataSite:directoryURL:", self, v10);
    v13 = v16;
    v17 = v16 != 0;
    if (!v16)
      goto LABEL_39;
    if (!CCDataResourceStatusIsNotDiscoverable(-[CCDataResource resourceStatus](v16, "resourceStatus"))
      || v32)
    {
      v31[2](v31, v13, &v45);
      if (v45)
      {
        v17 = 1;
        goto LABEL_39;
      }
    }

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __94__CCDataSite_enumerateDataResources_setIdentifier_descriptors_includingTombstoned_usingBlock___block_invoke;
  v38[3] = &unk_250990978;
  v38[4] = &v39;
  objc_msgSend(v18, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, v19, 4, v38);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_38:
    v17 = 0;
    goto LABEL_39;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v13;
  v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v35;
LABEL_17:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v21)
        objc_enumerationMutation(v13);
      v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v22);
      v24 = (void *)MEMORY[0x23B82079C]();
      if (+[CCDataResource directoryContainsDataResource:](CCDataResource, "directoryContainsDataResource:", v23))
      {
        v25 = -[CCDataResource initWithDataSite:directoryURL:]([CCDataResource alloc], "initWithDataSite:directoryURL:", self, v23);
        v26 = v25;
        if (v25)
        {
          v27 = CCDataResourceStatusIsNotDiscoverable(-[CCDataResource resourceStatus](v25, "resourceStatus"))
             && !v32;
          if (v27 || (v31[2](v31, v26, &v45), !v45))
            v28 = 0;
          else
            v28 = 2;
        }
        else
        {
          v28 = 1;
        }

      }
      else
      {
        v28 = 0;
      }
      objc_autoreleasePoolPop(v24);
      if (v28)
        break;
      if (v20 == ++v22)
      {
        v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        if (v20)
          goto LABEL_17;
        goto LABEL_35;
      }
    }

    if (v28 != 2)
      goto LABEL_38;
  }
  else
  {
LABEL_35:

  }
  v17 = v40[5] == 0;
LABEL_39:

  _Block_object_dispose(&v39, 8);
  return v17;
}

uint64_t __94__CCDataSite_enumerateDataResources_setIdentifier_descriptors_includingTombstoned_usingBlock___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

- (BOOL)remove:(id *)a3
{
  return CCRemoveItemIfExistsAtURL(self->_dataSiteURL, a3);
}

- (BOOL)isEqual:(id)a3
{
  CCDataSite *v4;
  CCDataSite *v5;
  BOOL v6;

  v4 = (CCDataSite *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCDataSite isEqualToDataSite:](self, "isEqualToDataSite:", v5);

  return v6;
}

- (BOOL)isEqualToDataSite:(id)a3
{
  void *v4;

  objc_msgSend(a3, "dataSiteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CCDataSite isEquivalentDataSiteURL:](self, "isEquivalentDataSiteURL:", v4);

  return (char)self;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_dataSiteURL, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSiteURL, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
