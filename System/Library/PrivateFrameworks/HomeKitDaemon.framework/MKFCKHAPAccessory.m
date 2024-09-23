@implementation MKFCKHAPAccessory

+ (id)fetchWithLocalModel:(id)a3 context:(id)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MKFCKHAPAccessory;
  objc_msgSendSuper2(&v5, sel_fetchWithLocalModel_context_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fetchLocalModelWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKFCKHAPAccessory;
  -[MKFCKModel fetchLocalModelWithContext:](&v4, sel_fetchLocalModelWithContext_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  id v40;
  _BOOL4 v41;
  id v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)MKFCKHAPAccessory;
  v42 = a3;
  v40 = a5;
  v41 = -[MKFCKAccessory importIntoLocalModel:updatedProperties:context:](&v43, sel_importIntoLocalModel_updatedProperties_context_, v42, a4);
  if (v41)
  {
    objc_msgSend(v42, "pairingUsername");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (v9)
    {
      -[MKFCKHAPAccessory identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setPairingUsername:", v10);

    }
    -[MKFCKHAPAccessory initialServiceTypes](self, "initialServiceTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "initialServiceTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if ((v13 & 1) == 0)
      objc_msgSend(v42, "setInitialServiceTypes:", v11);
    v14 = v42;
    v38 = v40;
    if (self)
    {
      -[MKFCKHAPAccessory serviceProperties](self, "serviceProperties");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mutableSetValueForKey:", CFSTR("services_"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v39, "count"));
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v59 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v21, "instanceID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, v22);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        }
        while (v18);
      }

      v37 = v11;
      v54 = 0;
      v55 = &v54;
      v56 = 0x2020000000;
      v57 = 0;
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __76__MKFCKHAPAccessory_importServicePropertiesIntoLocalModel_context_modified___block_invoke;
      v48[3] = &unk_24E789100;
      v23 = v16;
      v49 = v23;
      v24 = v38;
      v50 = v24;
      v51 = v14;
      v25 = v17;
      v52 = v25;
      v53 = &v54;
      objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v48);
      if (*((_BYTE *)v55 + 24))
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v23, "allValues");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v45 != v28)
                objc_enumerationMutation(v26);
              v30 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_msgSend(v25, "removeObject:", v30, v37);
              objc_msgSend(v24, "deleteObject:", v30);
            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
          }
          while (v27);
        }

        v11 = v37;
        v31 = *((unsigned __int8 *)v55 + 24);
      }
      else
      {
        v31 = 0;
      }

      _Block_object_dispose(&v54, 8);
    }
    else
    {
      v31 = 0;
    }

    -[MKFCKHAPAccessory importServiceDictionary:forLocalModel:withBlock:](self, (uint64_t)CFSTR("serviceAssociatedServiceTypes"), v14, &__block_literal_global_146015);
    -[MKFCKHAPAccessory importServiceDictionary:forLocalModel:withBlock:](self, (uint64_t)CFSTR("serviceConfiguredNames"), v14, &__block_literal_global_10_146016);
    -[MKFCKHAPAccessory importServiceDictionary:forLocalModel:withBlock:](self, (uint64_t)CFSTR("serviceApplicationData"), v14, &__block_literal_global_14_146017);
    if (v31)
    {
      objc_msgSend(v14, "accessoryCategory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHAPAccessory category](self, "category");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = HMFEqualObjects();

      if ((v34 & 1) == 0)
      {
        -[MKFCKHAPAccessory category](self, "category");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAccessoryCategory:", v35);

      }
    }

  }
  return v41;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  char v51;
  id v53;
  BOOL v54;
  id v55;
  MKFCKHAPAccessory *v56;
  id v57;
  id obj;
  objc_super v59;
  __int128 v60;
  __int128 v61;
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
  uint64_t v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _QWORD v75[2];
  _QWORD v76[2];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v59.receiver = self;
  v59.super_class = (Class)MKFCKHAPAccessory;
  v10 = -[MKFCKAccessory exportFromLocalModel:updatedProperties:context:](&v59, sel_exportFromLocalModel_updatedProperties_context_, v8, a4, v9);
  if (!v10)
    goto LABEL_46;
  -[MKFCKHAPAccessory initialServiceTypes](self, "initialServiceTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_5;
  objc_msgSend(v8, "initialServiceTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "initialServiceTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKHAPAccessory setInitialServiceTypes:](self, "setInitialServiceTypes:", v11);
LABEL_5:

  }
  v13 = v8;
  if (self)
  {
    -[MKFCKHAPAccessory serviceProperties](self, "serviceProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    objc_msgSend(v13, "services");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v15;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (v16)
    {
      v53 = v13;
      v54 = v10;
      v55 = v9;
      v56 = self;
      v57 = v8;
      v17 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v69 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v19, "instanceID", v53);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v75[0] = CFSTR("t");
            objc_msgSend(v19, "serviceType");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v75[1] = CFSTR("p");
            v76[0] = v22;
            objc_msgSend(v19, "serviceProperties");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            v25 = &unk_24E96BDB0;
            if (v23)
              v25 = (void *)v23;
            v76[1] = v25;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKFCKHAPAccessory lazyMutableCopy:of:]((void **)&v72, v14);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v20);

          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v16);
      v16 = v72;
      if (v72)
      {
        v28 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend(v14, "allKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setWithArray:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v31 = obj;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
        v9 = v55;
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v65;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v65 != v34)
                objc_enumerationMutation(v31);
              objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "instanceID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "removeObject:", v36);

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
          }
          while (v33);
        }

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v37 = v30;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v61;
          do
          {
            for (k = 0; k != v39; ++k)
            {
              if (*(_QWORD *)v61 != v40)
                objc_enumerationMutation(v37);
              v42 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v16, "setObject:forKeyedSubscript:", v43, v42);

            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
          }
          while (v39);
        }

        self = v56;
        -[MKFCKHAPAccessory serviceProperties](v56, "serviceProperties");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = HMFEqualObjects();

        if ((v45 & 1) == 0)
        {
          v46 = (void *)objc_msgSend((id)v16, "copy");
          -[MKFCKHAPAccessory setServiceProperties:](v56, "setServiceProperties:", v46);

        }
        LODWORD(v16) = 1;
        v8 = v57;
      }
      else
      {
        v8 = v57;
        v9 = v55;
      }
      LOBYTE(v10) = v54;
      v13 = v53;
    }

  }
  else
  {
    LODWORD(v16) = 0;
  }

  -[MKFCKHAPAccessory exportServiceDictionary:forLocalModel:servicesModified:withBlock:](self, CFSTR("serviceAssociatedServiceTypes"), v13, v16, &__block_literal_global_18_145993);
  -[MKFCKHAPAccessory exportServiceDictionary:forLocalModel:servicesModified:withBlock:](self, CFSTR("serviceConfiguredNames"), v13, v16, &__block_literal_global_20);
  -[MKFCKHAPAccessory exportServiceDictionary:forLocalModel:servicesModified:withBlock:](self, CFSTR("serviceApplicationData"), v13, v16, &__block_literal_global_22_145996);
  objc_msgSend(v13, "accessoryCategory");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    -[MKFCKHAPAccessory category](self, "category");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = HMFEqualObjects();

    if ((v49 & 1) == 0)
    {
      -[MKFCKHAPAccessory category](self, "category");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = v16 ^ 1;
      if (!v50)
        v51 = 0;
      if ((v51 & 1) == 0)
        -[MKFCKHAPAccessory setCategory:](self, "setCategory:", v47);
    }
  }

LABEL_46:
  return v10;
}

- (void)exportServiceDictionary:(void *)a3 forLocalModel:(int)a4 servicesModified:(void *)a5 withBlock:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void (**v36)(id, void *);
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v36 = a5;
  if (a1)
  {
    v35 = v9;
    objc_msgSend(a1, "valueForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v45 = 0;
    if (a4)
    {
      v13 = v10;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v11, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v42 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if (!-[MKFCKHAPAccessory hasServicePropertiesForInstanceID:](a1, v19))
            {
              -[MKFCKHAPAccessory lazyMutableCopy:of:](&v45, v12);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "removeObjectForKey:", v19);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v16);
      }

      v10 = v13;
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v10;
    objc_msgSend(v10, "services");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v26, "instanceID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[MKFCKHAPAccessory hasServicePropertiesForInstanceID:](a1, v27))
          {
            v36[2](v36, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = HMFEqualObjects();

            if ((v30 & 1) == 0)
            {
              -[MKFCKHAPAccessory lazyMutableCopy:of:](&v45, v12);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, v27);

            }
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v23);
    }

    v32 = v45;
    v9 = v35;
    if (v45)
    {
      v33 = (void *)objc_msgSend(v45, "copy");
      objc_msgSend(a1, "setValue:forKey:", v33, v35);

    }
    v10 = v34;
  }

}

id __68__MKFCKHAPAccessory_exportFromLocalModel_updatedProperties_context___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[_MKFApplicationData appDataDictionaryForContainer:](_MKFApplicationData, "appDataDictionaryForContainer:", a2);
}

uint64_t __68__MKFCKHAPAccessory_exportFromLocalModel_updatedProperties_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (BOOL)hasServicePropertiesForInstanceID:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(a1, "serviceProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v7 = v6;
  if ((id)*MEMORY[0x24BDBD430] == v6)
    v8 = 0;
  else
    v8 = v6;

  return v8 != 0;
}

- (id)lazyMutableCopy:(void *)a1 of:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *a1;
  if (!*a1)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = *a1;
    *a1 = v7;

    v4 = *a1;
  }
  v9 = v4;

  return v9;
}

uint64_t __68__MKFCKHAPAccessory_exportFromLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "associatedServiceType");
}

- (void)importServiceDictionary:(void *)a3 forLocalModel:(void *)a4 withBlock:
{
  id v7;
  void (**v8)(id, void *, void *);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(a1, "valueForKey:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v7;
    objc_msgSend(v7, "services");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "instanceID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[MKFCKHAPAccessory hasServicePropertiesForInstanceID:](a1, v16))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v8[2](v8, v15, v17);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v7 = v18;
  }

}

uint64_t __68__MKFCKHAPAccessory_importIntoLocalModel_updatedProperties_context___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_MKFApplicationData setAppDataDictionary:forContainer:](_MKFApplicationData, "setAppDataDictionary:forContainer:", a3, a2);
}

uint64_t __68__MKFCKHAPAccessory_importIntoLocalModel_updatedProperties_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setName:");
}

uint64_t __68__MKFCKHAPAccessory_importIntoLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAssociatedServiceType:");
}

void __76__MKFCKHAPAccessory_importServicePropertiesIntoLocalModel_context_modified___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _MKFService *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = v5;
  if ((id)*MEMORY[0x24BDBD430] == v5)
    v7 = 0;
  else
    v7 = v5;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (_MKFService *)v9;
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v14);
    }
    else
    {
      v10 = -[_MKFService initWithContext:]([_MKFService alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
      +[_MKFService modelIDForKeyAttribute:parent:](_MKFService, "modelIDForKeyAttribute:parent:", v14, *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFService setModelID:](v10, "setModelID:", v11);

      -[_MKFService setInstanceID:](v10, "setInstanceID:", v14);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("t"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFService setServiceType:](v10, "setServiceType:", v12);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("p"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFService setServiceProperties:](v10, "setServiceProperties:", v13);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

  }
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKHAPAccessory"));
}

@end
