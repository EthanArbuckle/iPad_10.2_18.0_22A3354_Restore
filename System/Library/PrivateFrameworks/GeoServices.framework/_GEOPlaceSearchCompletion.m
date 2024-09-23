@implementation _GEOPlaceSearchCompletion

- (_GEOPlaceSearchCompletion)initWithResponse:(id)a3 traits:(id)a4 sessionData:(id)a5 mapItems:(id)a6
{
  id v10;
  id v11;
  _GEOPlaceSearchCompletion *v12;
  _GEOPlaceSearchCompletion *v13;
  _GEOPlaceSearchCompletion *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  id *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  _GEOPlaceSearchCompletionGroup *v30;
  void *v31;
  void *v32;
  _GEOPlaceSearchCompletionGroup *v33;
  id *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  GEOAutocompleteSessionData *sessionData;
  id *v42;
  _GEOPlaceSearchCompletion *v43;
  void *v44;
  void *v45;
  id obj;
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v50 = a4;
  v11 = a5;
  v49 = a6;
  v58.receiver = self;
  v58.super_class = (Class)_GEOPlaceSearchCompletion;
  v12 = -[_GEOPlaceSearchCompletion init](&v58, sel_init);
  v13 = v12;
  v14 = 0;
  if (v10 && v12)
  {
    if (objc_msgSend(v10, "hasGlobalResult"))
    {
      objc_msgSend(v10, "globalResult");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v25 = 0;
        v14 = 0;
        goto LABEL_27;
      }
      v16 = (_QWORD *)v15;
      -[GEOPDPlaceGlobalResult _readAutocompleteResult](v15);
      v17 = v16[8];

      if (v17)
      {
        v43 = v13;
        v44 = v11;
        objc_msgSend(v10, "globalResult");
        v18 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult autocompleteResult](v18);
        v19 = (id *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v10;
        objc_msgSend(v10, "mapsResults");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __74___GEOPlaceSearchCompletion_initWithResponse_traits_sessionData_mapItems___block_invoke;
        v55[3] = &unk_1E1C065D0;
        v48 = v20;
        v56 = v48;
        v47 = v21;
        v57 = v47;
        objc_msgSend(v22, "enumerateObjectsUsingBlock:", v55);

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v42 = v19;
        -[GEOPDAutocompleteResult sections](v19);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v23)
        {
          v24 = v23;
          v25 = 0;
          v26 = 0;
          v27 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v52 != v27)
                objc_enumerationMutation(obj);
              v29 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
              v30 = [_GEOPlaceSearchCompletionGroup alloc];
              v31 = (void *)objc_msgSend(v48, "copy");
              v32 = (void *)objc_msgSend(v47, "copy");
              v33 = -[_GEOPlaceSearchCompletionGroup initWithSection:traits:entryListIndex:mapItems:collections:publishers:](v30, "initWithSection:traits:entryListIndex:mapItems:collections:publishers:", v29, v50, v26 + i, v49, v31, v32);

              if (v33)
              {
                if (!v25)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v25, "addObject:", v33);
              }

            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
            v26 = (v26 + i);
          }
          while (v24);
        }
        else
        {
          v25 = 0;
        }

        v13 = v43;
        v11 = v44;
        if (objc_msgSend(v25, "count"))
          objc_storeStrong((id *)&v43->_groups, v25);
        v10 = v45;
        objc_msgSend(v45, "globalResult");
        v34 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult autocompleteResult](v34);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (_QWORD *)v35;
        if (v35)
        {
          -[GEOPDAutocompleteResult _readAutocompleteSessionData](v35);
          v37 = v36[3];

          if (!v37)
          {
LABEL_26:
            v14 = v43;

LABEL_27:
            goto LABEL_28;
          }
          objc_msgSend(v45, "globalResult");
          v34 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDPlaceGlobalResult autocompleteResult](v34);
          v36 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          -[GEOPDAutocompleteResult autocompleteSessionData]((id *)v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "updateWithAutoCompleteSessionData:", v38);
          v39 = objc_claimAutoreleasedReturnValue();
          sessionData = v43->_sessionData;
          v43->_sessionData = (GEOAutocompleteSessionData *)v39;

        }
        goto LABEL_26;
      }
    }
    v14 = 0;
  }
LABEL_28:

  return v14;
}

- (NSArray)groups
{
  return self->_groups;
}

- (GEOAutocompleteSessionData)sessionData
{
  return self->_sessionData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end
