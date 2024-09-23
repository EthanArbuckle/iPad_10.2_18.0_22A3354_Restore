@implementation MPCMediaRemoteMiddlewareMetadataOperation

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)inputProtocols
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

void __52__MPCMediaRemoteMiddlewareMetadataOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void (**v65)(_QWORD, _QWORD);
  void *v66;
  _QWORD aBlock[4];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if (v15 || v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v15);
  }
  else if (objc_msgSend(v11, "count"))
  {
    v17 = *(void **)(a1 + 32);
    if (v12)
    {
      v58 = v14;
      v59 = v13;
      v63 = v12;
      objc_msgSend(v17, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "queueSectionProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "queueItemProperties");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc_init(MEMORY[0x24BDDCA88]);
      v22 = objc_alloc_init(MEMORY[0x24BDDCA88]);
      objc_msgSend(MEMORY[0x24BDDC820], "translatorForMPModelClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc_init(MEMORY[0x24BDDC828]);
      objc_msgSend(*(id *)(a1 + 32), "middleware");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "controller");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setArtworkGenerator:", v26);

      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __52__MPCMediaRemoteMiddlewareMetadataOperation_execute__block_invoke_2;
      aBlock[3] = &unk_24CAB10E0;
      v60 = v22;
      v68 = v60;
      v62 = v23;
      v69 = v62;
      v57 = v19;
      v70 = v57;
      v61 = v24;
      v71 = v61;
      v64 = v21;
      v72 = v64;
      v27 = _Block_copy(aBlock);
      objc_msgSend(v11, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void (**)(_QWORD, _QWORD))v27;
      (*((void (**)(void *, void *))v27 + 2))(v27, v28);
      if (objc_msgSend(v11, "count"))
      {
        v29 = 0;
        while (1)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "collectionIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(v30, "collectionIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "collectionIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v32, "isEqualToString:", v33) ^ 1;

          }
          else
          {
            v34 = 0;
          }

          objc_msgSend(v30, "collectionInfo");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_msgSend(v30, "collectionInfo");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "collectionInfo");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v36, "isEqualToDictionary:", v37) ^ 1;

          }
          else
          {
            v38 = 0;
          }

          if ((v34 | v38) == 1)
          {
            v39 = v30;

            ((void (**)(_QWORD, id))v65)[2](v65, v39);
            v28 = v39;
          }
          v40 = v66;
          objc_msgSend(*(id *)(a1 + 32), "middleware");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "playingIndexPath");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            goto LABEL_18;
          objc_msgSend(v30, "identifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isEqualToString:", v63);

          if (v44)
            break;
LABEL_19:
          if (v40)
          {
            objc_msgSend(*(id *)(a1 + 32), "_itemGenericObjectPropertySetForContentItem:propertySet:", v30, v40);
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v49;
            if (v30 && v49)
            {
              objc_msgSend(v62, "objectForPropertySet:contentItem:context:", v49, v30, v61);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              if (v51)
              {
                objc_msgSend(v64, "appendItem:", v51);
                objc_msgSend(v60, "appendItem:", v30);
              }

            }
          }

          if (++v29 >= (unint64_t)objc_msgSend(v11, "count"))
            goto LABEL_27;
        }
        v45 = objc_msgSend(v64, "numberOfSections") - 1;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v64, "numberOfItemsInSection:", v45), v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "middleware");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setPlayingIndexPath:", v46);

        objc_msgSend(*(id *)(a1 + 32), "request");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "playingItemProperties");
        v48 = objc_claimAutoreleasedReturnValue();
        v42 = v40;
        v40 = (id)v48;
LABEL_18:

        goto LABEL_19;
      }
LABEL_27:
      objc_msgSend(*(id *)(a1 + 32), "middleware");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setQueueContentItems:", v60);

      objc_msgSend(*(id *)(a1 + 32), "middleware");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setQueueModelObjects:", v64);

      objc_msgSend(*(id *)(a1 + 32), "middleware");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v59;
      objc_msgSend(v54, "setQueueIdentifier:", v59);

      objc_msgSend(*(id *)(a1 + 32), "middleware");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v58;
      objc_msgSend(v55, "setQueueProperties:", v58);

      objc_msgSend(*(id *)(a1 + 32), "finish");
      v12 = v63;
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 2000, CFSTR("Failed to get playing identifier"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "finishWithError:", v56);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }

}

- (void)execute
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[MPCMediaRemoteMiddlewareMetadataOperation middleware](self, "middleware");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__MPCMediaRemoteMiddlewareMetadataOperation_execute__block_invoke;
    v5[3] = &unk_24CAB1108;
    v5[4] = self;
    -[MPCMediaRemoteMiddlewareMetadataOperation _loadPlaybackQueueWithCompletion:](self, "_loadPlaybackQueueWithCompletion:", v5);
  }
  else
  {
    -[MPAsyncOperation cancel](self, "cancel");
    -[MPAsyncOperation finish](self, "finish");
  }

}

void __52__MPCMediaRemoteMiddlewareMetadataOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendSection:", v6);
  if (!v6
    || (objc_msgSend(*(id *)(a1 + 40), "sectionObjectForPropertySet:contentItem:context:", *(_QWORD *)(a1 + 48), v6, *(_QWORD *)(a1 + 56)), (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = objc_alloc(MEMORY[0x24BDDC890]);
    objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithIdentifiers:block:", v5, &__block_literal_global_634);

  }
  objc_msgSend(*(id *)(a1 + 64), "appendSection:", v3);

}

- (MPCMediaRemoteMiddleware)middleware
{
  return self->_middleware;
}

- (MPCMediaRemoteMiddlewareMetadataOperationConfiguration)request
{
  return self->_request;
}

- (MPCFuture)playQueueIdentifiersFuture
{
  return self->_playQueueIdentifiersFuture;
}

- (void)setPlayQueueIdentifiersFuture:(id)a3
{
  objc_storeStrong((id *)&self->_playQueueIdentifiersFuture, a3);
}

- (_MSVSignedRange)rangeFromTracklistRange:(id)a3
{
  int64_t var1;
  int64_t var0;
  int64_t v5;
  int64_t v6;
  _MSVSignedRange result;

  if (a3.var1 >= 0)
    var1 = a3.var1;
  else
    var1 = -a3.var1;
  if (a3.var0 >= 0)
    var0 = a3.var0;
  else
    var0 = -a3.var0;
  v5 = -var0;
  v6 = var1 + var0 + 1;
  result.length = v6;
  result.location = v5;
  return result;
}

- (MPCFuture)queueIdentifierFuture
{
  return self->_queueIdentifierFuture;
}

- (id)_itemGenericObjectPropertySetForContentItem:(id)a3 propertySet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[3];
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];
  _QWORD v46[2];
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deviceSpecificUserInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDDC470]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "relationships");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDDC2C0];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDDC2C0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_24;
  }
  v15 = objc_msgSend(v6, "mediaType");
  v14 = (void *)MEMORY[0x24BDBD1A8];
  if (v15 <= 511)
  {
    if (v15 != 1)
    {
      if (v15 != 2)
      {
        if (v15 != 256)
          goto LABEL_21;
LABEL_16:
        v18 = *MEMORY[0x24BDDC350];
        v46[0] = *MEMORY[0x24BDDC348];
        v46[1] = v18;
        v16 = (void *)MEMORY[0x24BDBCE30];
        v17 = v46;
        v19 = 2;
LABEL_20:
        objc_msgSend(v16, "arrayWithObjects:count:", v17, v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      v44 = *MEMORY[0x24BDDC350];
      v16 = (void *)MEMORY[0x24BDBCE30];
      v17 = &v44;
LABEL_18:
      v19 = 1;
      goto LABEL_20;
    }
LABEL_15:
    v47[0] = *MEMORY[0x24BDDC350];
    v16 = (void *)MEMORY[0x24BDBCE30];
    v17 = v47;
    goto LABEL_18;
  }
  switch(v15)
  {
    case 0x200:
      v20 = *MEMORY[0x24BDDC348];
      v45[0] = *MEMORY[0x24BDDC358];
      v45[1] = v20;
      v45[2] = *MEMORY[0x24BDDC350];
      v16 = (void *)MEMORY[0x24BDBCE30];
      v17 = v45;
      v19 = 3;
      goto LABEL_20;
    case 0x2000:
      goto LABEL_16;
    case 0x800:
      goto LABEL_15;
  }
LABEL_21:
  -[MPCMediaRemoteMiddlewareMetadataOperation _genericObjectPropertySetForContentItem:preferredRelationships:propertySet:](self, "_genericObjectPropertySetForContentItem:preferredRelationships:propertySet:", v6, v14, v12);
  v21 = objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x24BDDCB30]);
    v42 = v11;
    v43 = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithProperties:relationships:", 0, v23);

    v12 = (void *)v21;
    goto LABEL_46;
  }
  v12 = 0;
LABEL_24:
  v25 = objc_msgSend(v6, "mediaType");
  if (v25 <= 255)
  {
    if (v25 != 1)
    {
      if (v25 == 2)
      {
        v31 = *MEMORY[0x24BDDC2F8];
        v38[0] = *MEMORY[0x24BDDC2D0];
        v38[1] = v31;
        v27 = (void *)MEMORY[0x24BDBCE30];
        v28 = v38;
        goto LABEL_39;
      }
      if (v25 != 4)
        goto LABEL_41;
      v37 = *MEMORY[0x24BDDC2F8];
      v27 = (void *)MEMORY[0x24BDBCE30];
      v28 = &v37;
LABEL_36:
      v29 = 1;
      goto LABEL_40;
    }
LABEL_35:
    v41 = *MEMORY[0x24BDDC2F8];
    v27 = (void *)MEMORY[0x24BDBCE30];
    v28 = &v41;
    goto LABEL_36;
  }
  if (v25 > 2047)
  {
    if (v25 == 0x2000)
      goto LABEL_37;
    if (v25 != 2048)
      goto LABEL_41;
    goto LABEL_35;
  }
  if (v25 == 256)
  {
LABEL_37:
    v30 = *MEMORY[0x24BDDC2F8];
    v40[0] = *MEMORY[0x24BDDC2B0];
    v40[1] = v30;
    v27 = (void *)MEMORY[0x24BDBCE30];
    v28 = v40;
LABEL_39:
    v29 = 2;
    goto LABEL_40;
  }
  if (v25 == 512)
  {
    v26 = *MEMORY[0x24BDDC2B0];
    v39[0] = *MEMORY[0x24BDDC300];
    v39[1] = v26;
    v39[2] = *MEMORY[0x24BDDC2F8];
    v27 = (void *)MEMORY[0x24BDBCE30];
    v28 = v39;
    v29 = 3;
LABEL_40:
    objc_msgSend(v27, "arrayWithObjects:count:", v28, v29);
    v32 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v32;
  }
LABEL_41:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPCMediaRemoteMiddlewareMetadataOperation request](self, "request");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "preferredFallbackItemRelationship");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v14, "arrayByAddingObject:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v35;
    }

  }
  -[MPCMediaRemoteMiddlewareMetadataOperation _genericObjectPropertySetForContentItem:preferredRelationships:propertySet:](self, "_genericObjectPropertySetForContentItem:preferredRelationships:propertySet:", v6, v14, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:

  return v24;
}

- (id)_genericObjectPropertySetForContentItem:(id)a3 preferredRelationships:(id)a4 propertySet:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
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
  uint64_t v30;
  void *v32;
  void *v33;
  _OWORD v34[4];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDDC890], "requiredStoreLibraryPersonalizationProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v7, "relationships");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v8, "relationships");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
          {
            objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v17, "propertySetByCombiningWithPropertySet:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v15);

          if (!v19)
          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

  if (!objc_msgSend(v9, "count"))
  {
    memset(v34, 0, sizeof(v34));
    objc_msgSend(v7, "relationships");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", v34, v39, 16))
    {
      v23 = **((_QWORD **)&v34[0] + 1);
      objc_msgSend(v7, "relationships");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v8;
      objc_msgSend(v8, "relationships");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (!v26)
      {
        objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "propertySetByCombiningWithPropertySet:", v27);
      v28 = v24;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, v23);

      if (!v26)
      v8 = v32;
    }

  }
  if (objc_msgSend(v9, "count"))
  {
    v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDDCB30]), "initWithProperties:relationships:", 0, v9);

    v7 = (id)v30;
  }

  return v7;
}

- (void)setQueueIdentifierFuture:(id)a3
{
  objc_storeStrong((id *)&self->_queueIdentifierFuture, a3);
}

- (MPCFuture)playingIdentifierFuture
{
  return self->_playingIdentifierFuture;
}

- (void)setPlayingIdentifierFuture:(id)a3
{
  objc_storeStrong((id *)&self->_playingIdentifierFuture, a3);
}

- (MPCMediaRemoteMiddlewareMetadataOperation)initWithMiddleware:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  MPCMediaRemoteMiddlewareMetadataOperation *v9;
  MPCMediaRemoteMiddlewareMetadataOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCMediaRemoteMiddlewareMetadataOperation;
  v9 = -[MPAsyncOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_request, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueFuture, 0);
  objc_storeStrong((id *)&self->_queueIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_playingIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_playQueueIdentifiersFuture, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_inputOperations, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

- (NSArray)outputProtocols
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_254A9E068;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_loadPlaybackQueueWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  NSArray *v31;
  NSArray *invalidationObservers;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD v49[4];
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD v53[3];
  char v54;
  _QWORD v55[3];
  char v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v41 = _Block_copy(self->_invalidationHandler);
  -[MPCMediaRemoteMiddlewareMetadataOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tracklistRange");
  -[MPCMediaRemoteMiddlewareMetadataOperation rangeFromTracklistRange:](self, "rangeFromTracklistRange:", v5, v6);

  v7 = (const void *)MRPlaybackQueueRequestCreate();
  -[MPCMediaRemoteMiddlewareMetadataOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playingItemProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relationships");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDDC2D0];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDDC2D0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else
  {
    -[MPCMediaRemoteMiddlewareMetadataOperation request](self, "request", v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queueItemProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "relationships");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_7;
  }
  MRPlaybackQueueRequestSetIncludeInfo();
  MRPlaybackQueueRequestSetIncludeSections();
  -[MPCMediaRemoteMiddlewareMetadataOperation request](self, "request");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playingItemProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "relationships");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "properties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v21, "containsObject:", *MEMORY[0x24BDDBFC0]);

  if ((_DWORD)v19)
    MRPlaybackQueueRequestSetIncludeAlignments();

LABEL_7:
  -[MPCMediaRemoteMiddlewareMetadataOperation request](self, "request", v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "label");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  MRPlaybackQueueRequestSetLabel();

  -[MPCMediaRemoteMiddlewareMetadataOperation middleware](self, "middleware");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "controller");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "playbackQueueForRequest:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaRemoteMiddlewareMetadataOperation setPlaybackQueueFuture:](self, "setPlaybackQueueFuture:", v26);

  CFRelease(v7);
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v56 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0;
  -[MPCMediaRemoteMiddlewareMetadataOperation playbackQueueFuture](self, "playbackQueueFuture");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke;
  v49[3] = &unk_24CAB1780;
  v51 = v55;
  v29 = v41;
  v50 = v29;
  v52 = v53;
  objc_msgSend(v27, "onInvalid:", v49);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v57[0] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 1);
  v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
  invalidationObservers = self->_invalidationObservers;
  self->_invalidationObservers = v31;

  -[MPCMediaRemoteMiddlewareMetadataOperation playbackQueueFuture](self, "playbackQueueFuture");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v28;
  v44[1] = 3221225472;
  v44[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_2;
  v44[3] = &unk_24CAB1098;
  v44[4] = self;
  v34 = v29;
  v45 = v34;
  v47 = v53;
  v35 = v40;
  v46 = v35;
  v48 = v55;
  objc_msgSend(v33, "onSuccess:", v44);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v28;
  v42[1] = 3221225472;
  v42[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_17;
  v42[3] = &unk_24CAB9A98;
  v37 = v35;
  v43 = v37;
  v38 = (id)objc_msgSend(v36, "onFailure:", v42);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);

}

- (id)timeoutDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MPCMediaRemoteMiddlewareMetadataOperation playQueueIdentifiersFuture](self, "playQueueIdentifiersFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaRemoteMiddlewareMetadataOperation playingIdentifierFuture](self, "playingIdentifierFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCPlayerPathCache sharedCache](MPCPlayerPathCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaRemoteMiddlewareMetadataOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "observationTokenDescriptionForPlayerPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("playQueueIdentifiersFuture=%@ playingIdentifierFuture=%@ playerPathObserver=%@"), v4, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (void)setInputOperations:(id)a3
{
  objc_storeStrong((id *)&self->_inputOperations, a3);
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (MPCFuture)playbackQueueFuture
{
  return self->_playbackQueueFuture;
}

- (void)setPlaybackQueueFuture:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueFuture, a3);
}

uint64_t __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  return result;
}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_group_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  int v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  intptr_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(v3, "identifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__639;
    v39[4] = __Block_byref_object_dispose__640;
    v40 = 0;
    v7 = dispatch_group_create();
    v8 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_5;
    v32[3] = &unk_24CAB1048;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    v33 = v9;
    v34 = v10;
    v11 = v5;
    v35 = v11;
    v12 = v6;
    v36 = v12;
    v37 = *(id *)(a1 + 40);
    v38 = v39;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v32);
    v13 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v14 = *(id **)(a1 + 32);
    if (v13)
    {
      objc_msgSend(v14, "finish");
    }
    else
    {
      objc_msgSend(v14[35], "arrayByAddingObject:", v12);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 280);
      *(_QWORD *)(v16 + 280) = v15;

      objc_msgSend(*(id *)(a1 + 32), "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "qualityOfService");
      if ((unint64_t)(v19 + 1) > 0x22 || ((1 << (v19 + 1)) & 0x404040400) == 0)
        v19 = 0;
      dispatch_get_global_queue(v19, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_4;
      block[3] = &unk_24CAB1070;
      v21 = *(_QWORD *)(a1 + 32);
      v29 = v39;
      block[4] = v21;
      v22 = *(void **)(a1 + 48);
      v30 = *(_QWORD *)(a1 + 56);
      v28 = v22;
      v26 = v11;
      v23 = v3;
      v24 = *(_QWORD *)(a1 + 64);
      v27 = v23;
      v31 = v24;
      dispatch_group_notify(v9, v20, block);

    }
    _Block_object_dispose(v39, 8);

  }
}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 2000, a2, CFSTR("Failed to get playback queue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, 0, 0, v3);

}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "middleware");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentItemForIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  v9 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_2_6;
  v22[3] = &unk_24CAB9830;
  v10 = *(void **)(a1 + 56);
  v24 = *(id *)(a1 + 64);
  v11 = v5;
  v23 = v11;
  objc_msgSend(v8, "onInvalid:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_3;
  v16[3] = &unk_24CAB1020;
  v13 = *(id *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 72);
  v21 = a3;
  v17 = v13;
  v18 = v11;
  v19 = *(id *)(a1 + 32);
  v14 = v11;
  v15 = (id)objc_msgSend(v8, "onCompletion:", v16);

}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 2000, v2, CFSTR("Failed to get play queue identifers"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "middleware");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controllerFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInvalid");

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) || (v6 & 1) != 0 || v3)
  {
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "playingIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "queueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "queueProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, void *, void *, void *))(v9 + 16))(v9, v10, v11, v12, v13, v3);

  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Middleware");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134217984;
      v15 = v8;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "INVALIDATE: %p: Invalidated before returning a response. Re-requesting items.", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_loadPlaybackQueueWithCompletion:", *(_QWORD *)(a1 + 56));
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;

}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_2_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(CFSTR("Item Changed: "), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 64), v8);
  }
  else
  {
    v7 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 2000, CFSTR("Content item completed without error or value: %@"), *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
    if (!v6)

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (NSIndexPath)playingIndexPath
{
  void *v2;
  void *v3;

  -[MPCMediaRemoteMiddlewareMetadataOperation middleware](self, "middleware");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playingIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexPath *)v3;
}

- (MPSectionedCollection)modelObjects
{
  void *v2;
  void *v3;

  -[MPCMediaRemoteMiddlewareMetadataOperation middleware](self, "middleware");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueModelObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSectionedCollection *)v3;
}

- (MPSectionedCollection)sourceContentItems
{
  void *v2;
  void *v3;

  -[MPCMediaRemoteMiddlewareMetadataOperation middleware](self, "middleware");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueContentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPSectionedCollection *)v3;
}

@end
