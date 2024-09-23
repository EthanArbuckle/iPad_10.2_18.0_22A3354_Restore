@implementation CNPropertyBestIDSValueQuery

- (CNPropertyBestIDSValueQuery)initWithPropertyItems:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CNPropertyBestIDSValueQuery *v11;

  v6 = a4;
  v7 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idsAvailabilityProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultSchedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNPropertyBestIDSValueQuery initWithPropertyItems:service:idsAvailabilityProvider:schedulerProvider:](self, "initWithPropertyItems:service:idsAvailabilityProvider:schedulerProvider:", v7, v6, v9, v10);

  return v11;
}

- (CNPropertyBestIDSValueQuery)initWithPropertyItems:(id)a3 service:(id)a4 idsAvailabilityProvider:(id)a5 schedulerProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNPropertyBestIDSValueQuery *v14;
  CNPropertyBestIDSValueQuery *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CNPropertyBestIDSValueQuery *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  CNPropertyBestIDSValueQuery *v39;
  id v40;
  objc_super v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)CNPropertyBestIDSValueQuery;
  v14 = -[CNPropertyBestIDSValueQuery init](&v41, sel_init);
  v15 = v14;
  if (v14)
  {
    -[CNPropertyBestIDSValueQuery setPropertyItems:](v14, "setPropertyItems:", v10);
    -[CNPropertyBestIDSValueQuery propertyItems](v15, "propertyItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      -[CNPropertyBestIDSValueQuery propertyItems](v15, "propertyItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_cn_filter:", &__block_literal_global_2_54958);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_cn_map:", &__block_literal_global_54954);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyBestIDSValueQuery setIdsHandles:](v15, "setIdsHandles:", v20);

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __103__CNPropertyBestIDSValueQuery_initWithPropertyItems_service_idsAvailabilityProvider_schedulerProvider___block_invoke;
      v38 = &unk_1E204FD48;
      v22 = v15;
      v39 = v22;
      v23 = v21;
      v40 = v23;
      v24 = _Block_copy(&v35);
      getIDSServiceNameFaceTime_43459[0]();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v11, "isEqualToString:", v25, v35, v36, v37, v38);

      if (v26)
      {
        v27 = (void *)MEMORY[0x1E0D13D00];
        -[CNPropertyBestIDSValueQuery idsHandles](v22, "idsHandles");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "validateHandlesForFaceTime:availabilityProvider:schedulerProvider:handler:", v28, v12, v13, v24);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        getIDSServiceNameiMessage_43463();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v11, "isEqualToString:", v30);

        if (!v31)
        {
LABEL_8:

          goto LABEL_9;
        }
        v32 = (void *)MEMORY[0x1E0D13D00];
        -[CNPropertyBestIDSValueQuery idsHandles](v22, "idsHandles");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "validateHandlesForIMessage:availabilityProvider:schedulerProvider:handler:", v28, v12, v13, v24);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v33 = (void *)v29;
      -[CNPropertyBestIDSValueQuery setIdsLookupToken:](v22, "setIdsLookupToken:", v29);

      goto LABEL_8;
    }
  }
LABEL_9:

  return v15;
}

- (void)cancel
{
  void *v3;

  -[CNPropertyBestIDSValueQuery idsLookupToken](self, "idsLookupToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNPropertyBestIDSValueQuery setDelegate:](self, "setDelegate:", 0);
}

- (CNPropertyGroupItem)bestIDSProperty
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id obj;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[5];

  v47[3] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C97058];
  v47[0] = *MEMORY[0x1E0C97028];
  v47[1] = v3;
  v47[2] = *MEMORY[0x1E0C97008];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[CNPropertyBestIDSValueQuery validIDSHandles](self, "validIDSHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v6)
  {
    v8 = 0;
    v32 = 0;
LABEL_25:

    goto LABEL_27;
  }
  v7 = v6;
  v35 = v4;
  v8 = 0;
  v37 = *(_QWORD *)v43;
  v9 = *MEMORY[0x1E0C967C0];
  v36 = *MEMORY[0x1E0C967C0];
  obj = v5;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v43 != v37)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      -[CNPropertyBestIDSValueQuery validIDSHandles](self, "validIDSHandles", obj);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "containsObject:", v11) & 1) != 0)
      {
        -[CNPropertyBestIDSValueQuery validIDSHandles](self, "validIDSHandles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v8);

        if ((v14 & 1) == 0)
        {
          v15 = v11;

          v8 = v15;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v11, "contactProperty");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", v9) & 1) != 0)
      {
        objc_msgSend(v8, "contactProperty");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "key");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v9);

        if ((v20 & 1) == 0)
          goto LABEL_16;
      }
      else
      {

      }
      objc_msgSend(v11, "contactProperty");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v35, "containsObject:", v22) & 1) != 0)
      {
        objc_msgSend(v8, "contactProperty");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "label");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v35, "containsObject:", v24);

        if ((v25 & 1) == 0)
        {
LABEL_16:
          v26 = v11;

          v8 = v26;
          v9 = v36;
          continue;
        }
      }
      else
      {

      }
      v9 = v36;
      if (!v8)
        v8 = v11;
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v7);

  if (v8)
  {
    -[CNPropertyBestIDSValueQuery idsHandles](self, "idsHandles");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __46__CNPropertyBestIDSValueQuery_bestIDSProperty__block_invoke;
    v40[3] = &unk_1E204FCF8;
    v8 = v8;
    v41 = v8;
    objc_msgSend(v27, "_cn_firstObjectPassingTest:", v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPropertyBestIDSValueQuery propertyItems](self, "propertyItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v28;
    v38[1] = 3221225472;
    v38[2] = __46__CNPropertyBestIDSValueQuery_bestIDSProperty__block_invoke_2;
    v38[3] = &unk_1E204FD20;
    v39 = v29;
    v31 = v29;
    objc_msgSend(v30, "_cn_firstObjectPassingTest:", v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v41;
    v4 = v35;
    goto LABEL_25;
  }
  v32 = 0;
  v4 = v35;
LABEL_27:

  return (CNPropertyGroupItem *)v32;
}

- (NSMutableArray)validIDSItems
{
  return self->_validIDSItems;
}

- (CNPropertyBestIDSValueQueryDelegate)delegate
{
  return (CNPropertyBestIDSValueQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)propertyItems
{
  return self->_propertyItems;
}

- (void)setPropertyItems:(id)a3
{
  objc_storeStrong((id *)&self->_propertyItems, a3);
}

- (NSArray)idsHandles
{
  return self->_idsHandles;
}

- (void)setIdsHandles:(id)a3
{
  objc_storeStrong((id *)&self->_idsHandles, a3);
}

- (CNCancelable)idsLookupToken
{
  return self->_idsLookupToken;
}

- (void)setIdsLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_idsLookupToken, a3);
}

- (NSMutableArray)validIDSHandles
{
  return self->_validIDSHandles;
}

- (void)setValidIDSHandles:(id)a3
{
  objc_storeStrong((id *)&self->_validIDSHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validIDSHandles, 0);
  objc_storeStrong((id *)&self->_idsLookupToken, 0);
  objc_storeStrong((id *)&self->_idsHandles, 0);
  objc_storeStrong((id *)&self->_propertyItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_validIDSItems, 0);
}

uint64_t __46__CNPropertyBestIDSValueQuery_bestIDSProperty__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

uint64_t __46__CNPropertyBestIDSValueQuery_bestIDSProperty__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "contactProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __103__CNPropertyBestIDSValueQuery_initWithPropertyItems_service_idsAvailabilityProvider_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v16 = v5;

  v6 = objc_msgSend(v3, "isAvailable");
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "validIDSHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setValidIDSHandles:", v8);

    }
    objc_msgSend(*(id *)(a1 + 32), "validIDSHandles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v16);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "validIDSHandles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v16);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
  v12 = objc_msgSend(*(id *)(a1 + 40), "count");
  objc_msgSend(*(id *)(a1 + 32), "idsHandles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryComplete");

  }
}

@end
