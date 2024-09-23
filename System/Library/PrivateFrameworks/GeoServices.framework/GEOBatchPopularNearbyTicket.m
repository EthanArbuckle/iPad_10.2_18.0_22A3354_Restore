@implementation GEOBatchPopularNearbyTicket

void __77___GEOBatchPopularNearbyTicket_submitWithHandler_auditToken_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id *v17;
  id v18;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v5, "globalResult");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult batchPopularNearbySearchResult](v7);
    v8 = (id *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = objc_msgSend(v8[2], "count");
    else
      v9 = 0;
    if (v9 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      v10 = objc_msgSend(v6, "requestType");
      objc_msgSend(v6, "resultsWithResultType:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77___GEOBatchPopularNearbyTicket_submitWithHandler_auditToken_networkActivity___block_invoke_2;
      v16[3] = &unk_1E1C064E0;
      v12 = *(id *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 32);
      v18 = v12;
      v16[4] = v13;
      v17 = v8;
      _attributedGeoMapItemsForPlaceDatasWithHandler(v10, v11, 0, 0, 0, 0, v16);

    }
    else
    {
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Should get back the same number of batch results as we had input categories"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    }
  }

}

void __77___GEOBatchPopularNearbyTicket_submitWithHandler_auditToken_networkActivity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      v6 = 0;
      v22 = a1;
      do
      {
        -[GEOPDBatchPopularNearbySearchResult popularNearbyResultAtIndex:](*(id **)(a1 + 40), v6);
        v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndexedSubscript:", v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v6;
        v8 = (void *)MEMORY[0x1E0C99DE8];
        if (v7)
        {
          -[GEOPDPopularNearbyResult _readLitePlaceResults]((uint64_t)v7);
          v9 = v7[4];
        }
        else
        {
          v9 = 0;
        }
        objc_msgSend(v8, "arrayWithCapacity:", v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        if (v7)
        {
LABEL_8:
          -[GEOPDPopularNearbyResult _readLitePlaceResults]((uint64_t)v7);
          v11 = v7[4];
          goto LABEL_9;
        }
        while (1)
        {
          v11 = 0;
LABEL_9:
          if (v10 >= v11)
            break;
          v12 = -[GEOPDPopularNearbyResult litePlaceResultAtIndex:]((uint64_t)v7, v10);
          if ((~v13 & 0x300000000) == 0)
          {
            v14 = v12;
            v15 = v13;
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v16 = v27;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v29;
              while (2)
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v29 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                  if (objc_msgSend(v21, "_muid") == v14 && objc_msgSend(v21, "_resultProviderID") == v15)
                  {
                    objc_msgSend(v26, "addObject:", v21);
                    goto LABEL_22;
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
                if (v18)
                  continue;
                break;
              }
            }
LABEL_22:

          }
          ++v10;
          if (v7)
            goto LABEL_8;
        }
        objc_msgSend(v23, "setObject:forKey:", v26, v24);

        v6 = v25 + 1;
        a1 = v22;
      }
      while (v25 + 1 < (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(v22 + 32) + 64), "count"));
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    v5 = 0;
  }

}

@end
