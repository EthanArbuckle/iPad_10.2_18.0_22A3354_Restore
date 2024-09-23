@implementation WFSearchiTunesAction

- (void)initializeParameters
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _QWORD v14[3];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)WFSearchiTunesAction;
  -[WFSearchiTunesAction initializeParameters](&v13, sel_initializeParameters);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v14[0] = CFSTR("WFMediaType");
  v14[1] = CFSTR("WFEntity");
  v14[2] = CFSTR("WFAttribute");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[WFSearchiTunesAction parameterForKey:](self, "parameterForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDataSource:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v5);
  }

  -[WFSearchiTunesAction updateParameterVisibility](self, "updateParameterVisibility");
}

- (void)updateParameterVisibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[WFSearchiTunesAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFAttribute"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFSerializedNameForAttribute(CFSTR("productID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  -[WFSearchiTunesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFEntity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[WFSearchiTunesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFItemLimit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v5);

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  WFSearchiTunesAction *v36;
  void *v37;
  _QWORD aBlock[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  -[WFSearchiTunesAction mediaType](self, "mediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  -[WFSearchiTunesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAttribute"), objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  WFAttributesForMediaType(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        WFSerializedNameForAttribute(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v37);

        if (v13)
        {
          v14 = v11;

          v8 = v14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[WFSearchiTunesAction parameterValueForKey:ofClass:](v36, "parameterValueForKey:ofClass:", CFSTR("WFEntity"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v34 = v4;
  WFEntityTypesForMediaType(v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        WFSerializedNameForEntityType(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v15);

        if (v24)
        {
          v25 = v22;

          v19 = v25;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  -[WFSearchiTunesAction parameterValueForKey:ofClass:](v36, "parameterValueForKey:ofClass:", CFSTR("WFSearchTerm"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[WFSearchiTunesAction parameterValueForKey:ofClass:](v36, "parameterValueForKey:ofClass:", CFSTR("WFCountry"), objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSearchiTunesAction parameterValueForKey:ofClass:](v36, "parameterValueForKey:ofClass:", CFSTR("WFItemLimit"), objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedIntegerValue");

    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFSearchiTunesAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_24F8BB6B0;
    aBlock[4] = v36;
    v30 = _Block_copy(aBlock);
    v31 = (void *)objc_opt_new();
    v32 = v34;
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("productID")))
    {
      v47 = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lookupMediaWithIdentifiers:countryCode:completion:", v33, v27, v30);

    }
    else
    {
      objc_msgSend(v31, "searchForMediaOfType:limitedToEntityType:withTerm:forAttribute:countryCode:limit:completion:", v34, v19, v26, v8, v27, v29, v30);
    }

  }
  else
  {
    -[WFSearchiTunesAction finishRunningWithError:](v36, "finishRunningWithError:", 0);
    v32 = v34;
  }

}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFSearchiTunesAction;
  v7 = -[WFSearchiTunesAction setParameterState:forKey:](&v11, sel_setParameterState_forKey_, a3, v6);
  if (v7)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFMediaType")))
    {
      -[WFSearchiTunesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFEntity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadPossibleStates");
      objc_msgSend(v8, "defaultSerializedRepresentationDidChange");
      -[WFSearchiTunesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFAttribute"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadPossibleStates");

    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFAttribute")))
    {
      -[WFSearchiTunesAction updateParameterVisibility](self, "updateParameterVisibility");
    }
  }

  return v7;
}

- (id)mediaType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[WFSearchiTunesAction definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Storefront"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Podcasts")))
  {
    v5 = (id)*MEMORY[0x24BEC4978];
  }
  else
  {
    -[WFSearchiTunesAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFMediaType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    WFAllPossibleMediaTypes();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          WFSerializedNameForMediaType(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v7, (_QWORD)v19);

          if ((v15 & 1) != 0)
          {
            v5 = v13;

            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }

    -[WFSearchiTunesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMediaType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v17 = (id *)MEMORY[0x24BEC4950];
    else
      v17 = (id *)MEMORY[0x24BEC4988];
    v5 = *v17;
LABEL_16:

  }
  return v5;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v14;
  int v15;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("WFMediaType"));

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BEC40C8];
    WFSerializedNameForMediaType((void *)*MEMORY[0x24BEC4968]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serializedRepresentationFromValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v4, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("WFEntity"));

  if (v11)
  {
    -[WFSearchiTunesAction possibleStatesForEnumeration:](self, "possibleStatesForEnumeration:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serializedRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  objc_msgSend(v4, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("WFAttribute"));

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BEC40C8], "serializedRepresentationFromValue:", CFSTR("All"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_6:

  return v9;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("WFMediaType"));

  if (v6)
  {
    WFAllPossibleMediaTypes();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_38471);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFSearchiTunesAction mediaType](self, "mediaType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("WFEntity"));

    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDBCF00];
      WFEntityTypesForMediaType(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "if_compactMap:", &__block_literal_global_138_38473);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "orderedSetWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("WFAttribute"));

      if (!v16)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v17 = (void *)MEMORY[0x24BDBCEE0];
      WFAttributesForMediaType(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "if_compactMap:", &__block_literal_global_141_38475);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "orderedSetWithArray:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC40C8]), "initWithValue:", CFSTR("All"));
      objc_msgSend(v12, "insertObject:atIndex:", v20, 0);

      objc_msgSend(v12, "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_9:

  return v8;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  id v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("WFMediaType"));

  if (v9)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    WFAllPossibleMediaTypes();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v57 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          WFSerializedNameForMediaType(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v18 & 1) != 0)
          {
            WFLocalizedNameForMediaType(v15);
            v32 = objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        if (v12)
          continue;
        break;
      }
    }

    WFLocalizedNameForMediaType((void *)*MEMORY[0x24BEC4950]);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  objc_msgSend(v6, "key");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("WFEntity"));

  if (v21)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[WFSearchiTunesAction mediaType](self, "mediaType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    WFEntityTypesForMediaType(v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v53;
      while (2)
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v53 != v25)
            objc_enumerationMutation(v10);
          v27 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
          WFSerializedNameForEntityType(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqualToString:", v29);

          if ((v30 & 1) != 0)
          {
            WFLocalizedNameForEntityType(v27);
            v32 = objc_claimAutoreleasedReturnValue();
            goto LABEL_38;
          }
        }
        v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v24)
          continue;
        break;
      }
    }

    objc_msgSend(v7, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedNameForEntityType(v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "key");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("WFAttribute"));

    if (!v34)
    {
      objc_msgSend(v7, "value");
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v46 = (void *)v19;
      goto LABEL_42;
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[WFSearchiTunesAction mediaType](self, "mediaType", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    WFAttributesForMediaType(v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v49;
      while (2)
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v49 != v38)
            objc_enumerationMutation(v10);
          v40 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
          WFSerializedNameForAttribute(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "value");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v41, "isEqualToString:", v42);

          if ((v43 & 1) != 0)
          {
            WFLocalizedNameForAttribute(v40);
            v32 = objc_claimAutoreleasedReturnValue();
LABEL_38:
            v46 = (void *)v32;
            goto LABEL_41;
          }
        }
        v37 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v37)
          continue;
        break;
      }
    }

    objc_msgSend(v7, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedNameForAttribute(v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44 = v31;
  if (v31)
  {
    v45 = v31;
  }
  else
  {
    objc_msgSend(v7, "value");
    v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  v46 = v45;

LABEL_41:
LABEL_42:

  return v46;
}

id __53__WFSearchiTunesAction_possibleStatesForEnumeration___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = [v2 alloc];
  WFSerializedNameForAttribute(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithValue:", v5);
  return v6;
}

id __53__WFSearchiTunesAction_possibleStatesForEnumeration___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = [v2 alloc];
  WFSerializedNameForEntityType(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithValue:", v5);
  return v6;
}

id __53__WFSearchiTunesAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEC4988]) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BEC40C8]);
    WFSerializedNameForMediaType(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithValue:", v5);

  }
  return v3;
}

void __51__WFSearchiTunesAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
