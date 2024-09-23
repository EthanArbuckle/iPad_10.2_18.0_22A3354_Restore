@implementation CNiOSABContactBuffersDecoder

void __85__CNiOSABContactBuffersDecoder_decodeContactsFromData_moreComing_replyHandler_error___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a2;
  v6 = v5;
  v12 = v5;
  if (v5)
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  v7 = (void *)MEMORY[0x19400675C](v5, v6);
  v8 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v8 == objc_msgSend(*(id *)(a1 + 40), "decodeBatchSize") || (a3 & 1) == 0)
  {
    v9 = *(id *)(a1 + 32);
    if (objc_msgSend(*(id *)(a1 + 40), "unifyResults"))
    {
      if (*(_BYTE *)(a1 + 56))
        v10 = 1;
      else
        v10 = a3;
      objc_msgSend(*(id *)(a1 + 40), "unifyContacts:moreComing:", *(_QWORD *)(a1 + 32), v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v11;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");

  }
  objc_autoreleasePoolPop(v7);

}

- (int64_t)decodeBatchSize
{
  return self->_decodeBatchSize;
}

- (CNiOSABContactBuffersDecoder)initWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  CNContactUnificationOptions *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CNiOSABContactBuffersDecoder *v10;

  v4 = a3;
  +[CNContactBufferDecoderFactory decoderForFetchRequest:](CNContactBufferDecoderFactory, "decoderForFetchRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactUnificationOptions initWithContactFetchRequest:]([CNContactUnificationOptions alloc], "initWithContactFetchRequest:", v4);
  v7 = objc_msgSend(v4, "unifyResults");
  v8 = objc_msgSend(v4, "mutableObjects");
  v9 = objc_msgSend(v4, "decoderBatchSize");

  v10 = -[CNiOSABContactBuffersDecoder initWithDecoder:unifyResults:unificationOptions:mutableResults:decodeBatchLimit:](self, "initWithDecoder:unifyResults:unificationOptions:mutableResults:decodeBatchLimit:", v5, v7, v6, v8, v9);
  return v10;
}

- (CNiOSABContactBuffersDecoder)initWithDecoder:(id)a3 unifyResults:(BOOL)a4 unificationOptions:(id)a5 mutableResults:(BOOL)a6 decodeBatchLimit:(int64_t)a7
{
  id v13;
  id v14;
  CNiOSABContactBuffersDecoder *v15;
  CNiOSABContactBuffersDecoder *v16;
  uint64_t v17;
  NSMutableArray *contactsWaitingForUnification;
  uint64_t v19;
  NSMutableDictionary *matchInfosWaitingForUnification;
  int64_t v21;
  uint64_t v22;
  CNContactUnificationOptions *unificationOptions;
  CNiOSABContactBuffersDecoder *v24;
  objc_super v26;

  v13 = a3;
  v14 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CNiOSABContactBuffersDecoder;
  v15 = -[CNiOSABContactBuffersDecoder init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_decoder, a3);
    v17 = objc_opt_new();
    contactsWaitingForUnification = v16->_contactsWaitingForUnification;
    v16->_contactsWaitingForUnification = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    matchInfosWaitingForUnification = v16->_matchInfosWaitingForUnification;
    v16->_matchInfosWaitingForUnification = (NSMutableDictionary *)v19;

    v21 = 10;
    if (a7 > 0)
      v21 = a7;
    v16->_decodeBatchSize = v21;
    v16->_unifyResults = a4;
    v22 = objc_msgSend(v14, "copy");
    unificationOptions = v16->_unificationOptions;
    v16->_unificationOptions = (CNContactUnificationOptions *)v22;

    v16->_mutableResults = a6;
    v24 = v16;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfosWaitingForUnification, 0);
  objc_storeStrong((id *)&self->_contactsWaitingForUnification, 0);
  objc_storeStrong((id *)&self->_unificationOptions, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
}

- (id)contactMatchInfosFromABMatchInfos:(id)a3 contacts:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id obj;
  id v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CNiOSABContactBuffersDecoder _contactMatchInfosFromABMatchInfos:contacts:](self, "_contactMatchInfosFromABMatchInfos:contacts:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNiOSABContactBuffersDecoder unifyResults](self, "unifyResults"))
  {
    v41 = v7;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[CNiOSABContactBuffersDecoder matchInfosWaitingForUnification](self, "matchInfosWaitingForUnification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  v36 = v9;
  objc_msgSend(v8, "addEntriesFromDictionary:");

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (!v11)
    goto LABEL_25;
  v12 = v11;
  v13 = *(_QWORD *)v49;
  v37 = *(_QWORD *)v49;
  v38 = v6;
  do
  {
    v14 = 0;
    v39 = v12;
    do
    {
      if (*(_QWORD *)v49 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v14);
      if (!objc_msgSend(v15, "isUnified"))
      {
        -[CNiOSABContactBuffersDecoder matchInfosWaitingForUnification](self, "matchInfosWaitingForUnification");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKey:", v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_23;
        objc_msgSend(v15, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKey:", v16, v34);

        -[CNiOSABContactBuffersDecoder matchInfosWaitingForUnification](self, "matchInfosWaitingForUnification");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObjectForKey:", v31);
        goto LABEL_21;
      }
      v43 = v14;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v42 = v15;
      objc_msgSend(v15, "linkedContacts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v45 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            -[CNiOSABContactBuffersDecoder matchInfosWaitingForUnification](self, "matchInfosWaitingForUnification");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKey:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v22, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKey:", v25, v26);

              -[CNiOSABContactBuffersDecoder matchInfosWaitingForUnification](self, "matchInfosWaitingForUnification");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "removeObjectForKey:", v28);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v19);
      }

      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v42, "linkedContacts");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[CN unifyContactMatchInfos:linkedContacts:](CN, "unifyContactMatchInfos:linkedContacts:", v16, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKey:", v30, v31);
        v13 = v37;
        v6 = v38;
        v12 = v39;
        v14 = v43;
LABEL_21:

        goto LABEL_23;
      }
      v13 = v37;
      v6 = v38;
      v12 = v39;
      v14 = v43;
LABEL_23:

      ++v14;
    }
    while (v14 != v12);
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  }
  while (v12);
LABEL_25:

  v7 = v36;
LABEL_27:

  return v41;
}

- (BOOL)unifyResults
{
  return self->_unifyResults;
}

- (NSMutableDictionary)matchInfosWaitingForUnification
{
  return self->_matchInfosWaitingForUnification;
}

- (BOOL)decodeContactsFromData:(id)a3 moreComing:(BOOL)a4 replyHandler:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, unsigned int);
  void *v22;
  id v23;
  CNiOSABContactBuffersDecoder *v24;
  id v25;
  BOOL v26;

  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v12 = a3;
  objc_msgSend(v11, "arrayWithCapacity:", -[CNiOSABContactBuffersDecoder decodeBatchSize](self, "decodeBatchSize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSABContactBuffersDecoder decoder](self, "decoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __85__CNiOSABContactBuffersDecoder_decodeContactsFromData_moreComing_replyHandler_error___block_invoke;
  v22 = &unk_1E29F7F10;
  v15 = v13;
  v23 = v15;
  v24 = self;
  v26 = a4;
  v16 = v10;
  v25 = v16;
  v17 = objc_msgSend(v14, "decodeContactsFromBuffer:replyHandler:", v12, &v19);

  if (a6 && (v17 & 1) == 0)
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1009, v19, v20, v21, v22, v23, v24);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (CNContactBufferDecoder)decoder
{
  return self->_decoder;
}

- (id)_contactMatchInfosFromABMatchInfos:(id)a3 contacts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v13, "isUnified"))
        {
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v13, "linkedContacts");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v22;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v22 != v17)
                  objc_enumerationMutation(v14);
                -[CNiOSABContactBuffersDecoder _addContactMatchInfoFromABMatchInfos:forContact:toDictionary:](self, "_addContactMatchInfoFromABMatchInfos:forContact:toDictionary:", v6, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), v8);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v16);
          }

        }
        else
        {
          -[CNiOSABContactBuffersDecoder _addContactMatchInfoFromABMatchInfos:forContact:toDictionary:](self, "_addContactMatchInfoFromABMatchInfos:forContact:toDictionary:", v6, v13, v8);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  return v8;
}

- (void)_addContactMatchInfoFromABMatchInfos:(id)a3 forContact:(id)a4 toDictionary:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  v8 = a3;
  v9 = objc_msgSend(v14, "iOSLegacyIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[CNiOSABConversions contactMatchInfoFromABMatchMetadataDictionary:]((uint64_t)CNiOSABConversions, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, v13);

  }
}

- (id)unifyContacts:(id)a3 moreComing:(BOOL)a4
{
  id v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v30[4];
  id v31;
  CNiOSABContactBuffersDecoder *v32;
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  _QWORD aBlock[4];
  id v45;
  BOOL v46;

  v5 = a3;
  v6 = -[CNiOSABContactBuffersDecoder mutableResults](self, "mutableResults");
  -[CNiOSABContactBuffersDecoder unificationOptions](self, "unificationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CNiOSABContactBuffersDecoder_unifyContacts_moreComing___block_invoke;
  aBlock[3] = &unk_1E29F7F38;
  v46 = v6;
  v9 = v7;
  v45 = v9;
  v10 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSABContactBuffersDecoder contactsWaitingForUnification](self, "contactsWaitingForUnification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v5, "count");

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__1;
  v42[4] = __Block_byref_object_dispose__1;
  -[CNiOSABContactBuffersDecoder contactsWaitingForUnification](self, "contactsWaitingForUnification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "linkIdentifier");
  v43 = (id)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  v37 = &v36;
  v38 = 0x3010000000;
  v40 = 0;
  v41 = 0;
  v39 = &unk_18FA65AE6;
  -[CNiOSABContactBuffersDecoder contactsWaitingForUnification](self, "contactsWaitingForUnification");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v40 = 0;
  v41 = v18;

  -[CNiOSABContactBuffersDecoder contactsWaitingForUnification](self, "contactsWaitingForUnification");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v5);

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v13, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSABContactBuffersDecoder contactsWaitingForUnification](self, "contactsWaitingForUnification");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __57__CNiOSABContactBuffersDecoder_unifyContacts_moreComing___block_invoke_13;
  v30[3] = &unk_1E29F7F60;
  v34 = v42;
  v35 = &v36;
  v22 = v11;
  v31 = v22;
  v23 = v10;
  v32 = self;
  v33 = v23;
  objc_msgSend(v21, "enumerateObjectsAtIndexes:options:usingBlock:", v20, 0, v30);

  if (!v37[5])
  {
    -[CNiOSABContactBuffersDecoder contactsWaitingForUnification](self, "contactsWaitingForUnification");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeAllObjects");
    goto LABEL_5;
  }
  -[CNiOSABContactBuffersDecoder contactsWaitingForUnification](self, "contactsWaitingForUnification");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObjectsInRange:", 0, v37[4]);

  if (!a4)
  {
    -[CNiOSABContactBuffersDecoder contactsWaitingForUnification](self, "contactsWaitingForUnification");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v23 + 2))(v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v26);

LABEL_5:
  }
  v27 = v22;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);

  return v27;
}

- (NSMutableArray)contactsWaitingForUnification
{
  return self->_contactsWaitingForUnification;
}

void __57__CNiOSABContactBuffersDecoder_unifyContacts_moreComing___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "linkIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  if (v7)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  else
  {
    objc_msgSend(v5, "linkIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "contactsWaitingForUnification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectsAtIndexes:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v16);

    }
    objc_msgSend(v5, "linkIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      *(_QWORD *)(v18 + 32) = a3;
      *(_QWORD *)(v18 + 40) = 1;
    }
    else
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      *(_QWORD *)(v19 + 32) = a3 + 1;
      *(_QWORD *)(v19 + 40) = 0;
      v20 = *(void **)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 48);
      v24[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v23);

    }
  }

}

id __57__CNiOSABContactBuffersDecoder_unifyContacts_moreComing___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 40))
    +[CNMutableContact unifyContacts:](CNMutableContact, "unifyContacts:", a2);
  else
    +[CN contactUnifyingContacts:options:](CN, "contactUnifyingContacts:options:", a2, *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CNContactUnificationOptions)unificationOptions
{
  return self->_unificationOptions;
}

- (BOOL)mutableResults
{
  return self->_mutableResults;
}

- (CNiOSABContactBuffersDecoder)init
{
  CNiOSABContactBuffersDecoder *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end
