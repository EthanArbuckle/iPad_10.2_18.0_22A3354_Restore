@implementation MKCuratedCollectionItemsTicket

void __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  MKPlaceCollectionMapItem *v36;
  MKMapItem *v37;
  MKPlaceCollectionMapItem *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  unint64_t v49;
  _QWORD v50[4];
  id v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD block[4];
  id v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    if (v12)
    {
      v15 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
      block[3] = &unk_1E20D7F70;
      v16 = v14;
      v60 = v16;
      v17 = v13;
      v59 = v17;
      if (v15)
      {
        dispatch_async(v15, block);
        v18 = v59;
      }
      else
      {
        v18 = v17;
        (*((void (**)(id, _QWORD, _QWORD, id))v16 + 2))(v16, 0, 0, v17);
      }

      v42 = v60;
    }
    else
    {
      v44 = a1;
      v45 = v9;
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v47 = v11;
      if (objc_msgSend(v11, "count"))
      {
        v19 = 0;
        v46 = v10;
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v19, v44);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v19;
          if (v19 >= objc_msgSend(v10, "count"))
            goto LABEL_10;
          objc_msgSend(v20, "_identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "itemIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v21, "isEqualToGEOMapItemIdentifier:", v23);

          if (v24)
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_10:
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v26 = v10;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
            if (v27)
            {
              v28 = v27;
              v25 = 0;
              v29 = *(_QWORD *)v55;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v55 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                  objc_msgSend(v20, "_identifier");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "itemIdentifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v32, "isEqualToGEOMapItemIdentifier:", v33);

                  if (v34)
                  {
                    v35 = v31;

                    v25 = v35;
                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
              }
              while (v28);
            }
            else
            {
              v25 = 0;
            }

            v10 = v46;
            v11 = v47;
          }
          v36 = [MKPlaceCollectionMapItem alloc];
          v37 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:]([MKMapItem alloc], "initWithGeoMapItem:isPlaceHolderPlace:", v20, 0);
          v38 = -[MKPlaceCollectionMapItem initWithMapItem:placeCollectionItem:](v36, "initWithMapItem:placeCollectionItem:", v37, v25);

          objc_msgSend(v48, "addObject:", v38);
          v19 = v49 + 1;
        }
        while (v49 + 1 < objc_msgSend(v11, "count"));
      }
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
      v50[3] = &unk_1E20D8028;
      v39 = *(NSObject **)(v44 + 32);
      v40 = *(id *)(v44 + 40);
      v53 = v40;
      v9 = v45;
      v41 = v45;
      v51 = v41;
      v52 = v48;
      v42 = v48;
      if (v39)
      {
        dispatch_async(v39, v50);
        v43 = v52;
      }
      else
      {
        (*((void (**)(id, id, id, _QWORD))v40 + 2))(v40, v41, v42, 0);
        v43 = v42;
      }

      v11 = v47;
      v13 = 0;
    }

  }
}

uint64_t __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end
