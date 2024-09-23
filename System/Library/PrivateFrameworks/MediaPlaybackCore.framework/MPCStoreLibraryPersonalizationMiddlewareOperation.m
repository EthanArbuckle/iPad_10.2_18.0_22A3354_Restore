@implementation MPCStoreLibraryPersonalizationMiddlewareOperation

- (void)setInputOperations:(id)a3
{
  objc_storeStrong((id *)&self->_inputOperations, a3);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)outputProtocols
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)execute
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[MPCStoreLibraryPersonalizationMiddlewareOperation inputOperations](self, "inputOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_254AAD420);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v62;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v62 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "controller");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  objc_msgSend(v10, "resolvedPlayerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isSystemMusicPath") & 1) != 0 && !objc_msgSend(v11, "isLocal"))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[MPCStoreLibraryPersonalizationMiddlewareOperation inputOperations](self, "inputOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", &unk_254A9E068);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v58;
      while (2)
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v58 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_msgSend(v18, "modelObjects");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            objc_msgSend(v18, "playingIndexPath");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_24;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v15)
          continue;
        break;
      }
    }
    v20 = 0;
    v21 = 0;
LABEL_24:

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[MPCStoreLibraryPersonalizationMiddlewareOperation inputOperations](self, "inputOperations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", &unk_254AA8F28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v54;
      while (2)
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v54 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * k), "overridePlayingItem");
          v28 = objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v29 = (void *)v28;
            goto LABEL_34;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
        if (v25)
          continue;
        break;
      }
    }
    v29 = 0;
LABEL_34:

    if (v20)
    {
      v30 = objc_alloc_init(MEMORY[0x24BDDCA88]);
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke;
      v48[3] = &unk_24CAB5928;
      v31 = v30;
      v49 = v31;
      v50 = v20;
      v45 = v21;
      v43 = v21;
      v51 = v43;
      v52 = v29;
      objc_msgSend(v50, "enumerateSectionsUsingBlock:", v48);
      v44 = v31;
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC60]), "initWithUnpersonalizedContentDescriptors:", v31);
      -[MPCPlayerRequest userIdentity](self->_playerRequest, "userIdentity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setUserIdentity:", v33);

      objc_msgSend(MEMORY[0x24BDDCC58], "lightweightPersonalizationPropertiesForModelClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayerRequest queueSectionProperties](self->_playerRequest, "queueSectionProperties");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "propertySetByCombiningWithPropertySet:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setSectionProperties:", v36);

      -[MPCPlayerRequest queueItemProperties](self->_playerRequest, "queueItemProperties");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "propertySetByCombiningWithPropertySet:", v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setItemProperties:", v38);

      objc_msgSend(v32, "setMatchAlbumArtistsOnNameAndStoreID:", 0);
      -[MPCPlayerRequest playingItemProperties](self->_playerRequest, "playingItemProperties");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "propertySetByCombiningWithPropertySet:", v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43 && v40)
        objc_msgSend(v32, "setProperties:forItemAtIndexPath:", v40);
      v41 = _Block_copy(self->_invalidationHandler);
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_3;
      v46[3] = &unk_24CAB5978;
      v46[4] = self;
      v47 = v41;
      v42 = v41;
      objc_msgSend(v32, "performWithResponseHandler:", v46);

      v21 = v45;
    }
    else
    {
      -[MPAsyncOperation finish](self, "finish");
    }

  }
  else
  {
    -[MPAsyncOperation finish](self, "finish");
  }

}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_inputOperations, 0);
}

- (MPCStoreLibraryPersonalizationMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4
{
  id v7;
  id v8;
  MPCStoreLibraryPersonalizationMiddlewareOperation *v9;
  MPCStoreLibraryPersonalizationMiddlewareOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCStoreLibraryPersonalizationMiddlewareOperation;
  v9 = -[MPAsyncOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerRequest, a4);
  }

  return v10;
}

- (NSArray)inputProtocols
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_254AA8F28;
  v3[1] = &unk_254A9E068;
  v3[2] = &unk_254AAD420;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (MPCStoreLibraryPersonalizationMiddleware)middleware
{
  return self->_middleware;
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

- (MPCPlayerRequest)playerRequest
{
  return self->_playerRequest;
}

- (void)setPlayerRequest:(id)a3
{
  objc_storeStrong((id *)&self->_playerRequest, a3);
}

void __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v9 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC58]), "initWithModel:personalizationStyle:", v5, 1);
    objc_msgSend(v6, "appendSection:", v7);

  }
  else
  {
    objc_msgSend(v6, "appendSection:", &stru_24CABB5D0);
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_2;
  v10[3] = &unk_24CAB5900;
  v8 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v14 = a3;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v8, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v10);

}

void __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v3 = a2;
  objc_msgSend(v3, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "middleware");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonalizedModelObjects:", v4);

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDDCAA0]);
    v8 = *MEMORY[0x24BDDC3F8];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_4;
    v16 = &unk_24CAB5950;
    v17 = v3;
    v18 = *(id *)(a1 + 40);
    v9 = (void *)objc_msgSend(v7, "initWithName:object:handler:", v8, v17, &v13);
    objc_msgSend(v6, "addObject:", v9, v13, v14, v15, v16);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 288);
    *(_QWORD *)(v10 + 288) = v6;
    v12 = v6;

  }
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

void __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t, const __CFString *);
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void (**)(uint64_t, const __CFString *))(v1 + 16);
  v3 = *(id *)(a1 + 32);
  v2(v1, CFSTR("Personalization response did invalidate"));

}

void __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v6 && *(_QWORD *)(a1 + 40))
  {
    v10 = v5;
    if (objc_msgSend(v6, "section") == *(_QWORD *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "item") == a3)
    {
      v7 = *(id *)(a1 + 40);

      v5 = v7;
    }
    else
    {
      v5 = v10;
    }
  }
  if (v5)
  {
    v8 = *(void **)(a1 + 48);
    v11 = v5;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC58]), "initWithModel:personalizationStyle:", v5, 1);
    objc_msgSend(v8, "appendItem:", v9);

    v5 = v11;
  }

}

@end
