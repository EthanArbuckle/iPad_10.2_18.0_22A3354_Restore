@implementation HDSPSGHelper

- (HDSPSGHelper)initWithHome:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSArray *allHomePods;
  void *v9;
  uint64_t v10;
  NSArray *allStereoPairs;
  uint64_t v12;
  NSMutableDictionary *psgStereoPairMap;
  id *p_isa;
  uint64_t v15;
  NSMutableDictionary *psgHomePodMap;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  NSArray *allPSGs;
  void *v45;
  id v46;
  NSArray *obj;
  uint64_t v48;
  HDSPSGHelper *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSArray *v53;
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
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v66.receiver = self;
  v66.super_class = (Class)HDSPSGHelper;
  v49 = -[HDSPSGHelper init](&v66, sel_init);
  if (v49)
  {
    objc_storeStrong((id *)&v49->_currentHome, a3);
    -[HMHome accessories](v49->_currentHome, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    allHomePods = v49->_allHomePods;
    v49->_allHomePods = (NSArray *)v7;

    -[HMHome mediaSystems](v49->_currentHome, "mediaSystems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    allStereoPairs = v49->_allStereoPairs;
    v49->_allStereoPairs = (NSArray *)v10;

    if (gLogCategory_HDSPSGHelper <= 30)
    {
      if (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (gLogCategory_HDSPSGHelper <= 30)
      {
        if (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize())
        {
          allPSGs = v49->_allPSGs;
          LogPrintF();
        }
        if (gLogCategory_HDSPSGHelper <= 30)
        {
          if (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize())
          {
            allPSGs = v49->_allHomePods;
            LogPrintF();
          }
          if (gLogCategory_HDSPSGHelper <= 30
            && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
          {
            allPSGs = v49->_allStereoPairs;
            LogPrintF();
          }
        }
      }
    }
    v46 = v5;
    v12 = objc_opt_new();
    psgStereoPairMap = v49->_psgStereoPairMap;
    v49->_psgStereoPairMap = (NSMutableDictionary *)v12;

    p_isa = (id *)&v49->super.isa;
    v15 = objc_opt_new();
    psgHomePodMap = v49->_psgHomePodMap;
    v49->_psgHomePodMap = (NSMutableDictionary *)v15;

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v49->_allPSGs;
    v50 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v50)
    {
      v48 = *(_QWORD *)v63;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v63 != v48)
            objc_enumerationMutation(obj);
          v51 = v17;
          v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v17);
          objc_msgSend(v18, "identifier", allPSGs, v45);
          v53 = (NSArray *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "destinationIdentifiers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)objc_opt_new();
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v20 = p_isa[3];
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v59 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                objc_msgSend(v25, "audioDestinationIdentifier", allPSGs);
                v26 = objc_claimAutoreleasedReturnValue();
                if (v26)
                {
                  v27 = (void *)v26;
                  objc_msgSend(v25, "audioDestinationIdentifier");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v19, "containsObject:", v28);

                  if (v29)
                  {
                    if (gLogCategory_HDSPSGHelper <= 30
                      && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                    {
                      v45 = v25;
                      LogPrintF();
                      objc_msgSend(v52, "addObject:", v25, v53);
                    }
                    else
                    {
                      objc_msgSend(v52, "addObject:", v25, allPSGs);
                    }
                  }
                }
                if (gLogCategory_HDSPSGHelper <= 30
                  && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                {
                  allPSGs = v53;
                  v45 = v52;
                  LogPrintF();
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
            }
            while (v22);
          }

          v30 = (void *)objc_msgSend(v52, "copy");
          objc_msgSend(p_isa[5], "setObject:forKeyedSubscript:", v30, v53);

          v31 = (void *)objc_opt_new();
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v32 = p_isa[4];
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v55 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
                objc_msgSend(v37, "audioDestinationIdentifier", allPSGs);
                v38 = objc_claimAutoreleasedReturnValue();
                if (v38)
                {
                  v39 = (void *)v38;
                  objc_msgSend(v37, "audioDestinationIdentifier");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v19, "containsObject:", v40);

                  if (v41)
                  {
                    if (gLogCategory_HDSPSGHelper <= 30
                      && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                    {
                      v45 = v37;
                      LogPrintF();
                      objc_msgSend(v31, "addObject:", v37, v53);
                    }
                    else
                    {
                      objc_msgSend(v31, "addObject:", v37, allPSGs);
                    }
                  }
                }
                if (gLogCategory_HDSPSGHelper <= 30
                  && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                {
                  allPSGs = v53;
                  v45 = v31;
                  LogPrintF();
                }
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
            }
            while (v34);
          }

          v42 = (void *)objc_msgSend(v31, "copy");
          p_isa = (id *)&v49->super.isa;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v49->_psgStereoPairMap, "setObject:forKeyedSubscript:", v42, v53);

          v17 = v51 + 1;
        }
        while (v51 + 1 != v50);
        v50 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v50);
    }

    v5 = v46;
    if (gLogCategory_HDSPSGHelper <= 30)
    {
      if (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (gLogCategory_HDSPSGHelper <= 30
        && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }

  return v49;
}

- (id)allPSGsInRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v4)
  {
    v33 = v4;
    objc_msgSend(v4, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[NSMutableDictionary allKeys](self->_psgHomePodMap, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v50;
      v34 = v6;
      do
      {
        for (i = 0; i != v37; i = v27 + 1)
        {
          if (*(_QWORD *)v50 != v36)
            objc_enumerationMutation(obj);
          v39 = i;
          v9 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_psgHomePodMap, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v9;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_psgStereoPairMap, "objectForKeyedSubscript:", v9);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v46;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v46 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "room");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "uniqueIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v7, "hmf_isEqualToUUID:", v17);

                if (v18)
                {
                  -[HDSPSGHelper fetchPSG:](self, "fetchPSG:", v38);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (gLogCategory_HDSPSGHelper <= 30
                    && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                  {
                    v31 = v7;
                    v32 = v24;
                    LogPrintF();
                  }
                  objc_msgSend(v6, "addObject:", v24, v31, v32);
                  v19 = v11;
LABEL_35:
                  v27 = v39;

                  goto LABEL_36;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
              if (v13)
                continue;
              break;
            }
          }

          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v19 = v40;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v42;
            while (2)
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v42 != v22)
                  objc_enumerationMutation(v19);
                -[HDSPSGHelper roomForStereoPair:](self, "roomForStereoPair:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "uniqueIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v7, "hmf_isEqualToUUID:", v25);

                if (v26)
                {
                  -[HDSPSGHelper fetchPSG:](self, "fetchPSG:", v38);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (gLogCategory_HDSPSGHelper <= 30
                    && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                  {
                    v31 = v7;
                    v32 = v28;
                    LogPrintF();
                  }
                  v6 = v34;
                  objc_msgSend(v34, "addObject:", v28, v31, v32);

                  goto LABEL_35;
                }

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
              if (v21)
                continue;
              break;
            }
            v6 = v34;
          }
          v27 = v39;
LABEL_36:

        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v37);
    }

    if (gLogCategory_HDSPSGHelper <= 30 && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
    {
      v31 = v33;
      v32 = v6;
      LogPrintF();
    }
    v29 = (id)objc_msgSend(v6, "copy", v31, v32);

    v4 = v33;
  }
  else
  {
    v29 = v5;
  }

  return v29;
}

- (id)roomsForPSG:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_psgHomePodMap, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v8;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_psgStereoPairMap, "objectForKeyedSubscript:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (gLogCategory_HDSPSGHelper <= 30
            && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v14, "room");
            v24 = v7;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

          }
          objc_msgSend(v14, "room", v24, v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v11);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v26;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          -[HDSPSGHelper roomForStereoPair:](self, "roomForStereoPair:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (gLogCategory_HDSPSGHelper <= 30
            && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
          {
            v24 = v7;
            v25 = v21;
            LogPrintF();
          }
          objc_msgSend(v6, "addObject:", v21, v24, v25);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v18);
    }

    v4 = v7;
    if (gLogCategory_HDSPSGHelper <= 30 && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
    {
      v24 = v7;
      v25 = v6;
      LogPrintF();
    }
    v22 = (id)objc_msgSend(v6, "copy", v24, v25);

  }
  else
  {
    v22 = v5;
  }

  return v22;
}

- (id)roomForStereoPair:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchPSG:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  id v13;
  NSArray *allPSGs;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogCategory_HDSPSGHelper <= 30 && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
  {
    v13 = v4;
    allPSGs = self->_allPSGs;
    LogPrintF();
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_allPSGs;
  v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", v13, allPSGs, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "hmf_isEqualToUUID:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = (void *)objc_msgSend(v9, "copy");
          goto LABEL_15;
        }
      }
      v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psgRoomMap, 0);
  objc_storeStrong((id *)&self->_psgStereoPairMap, 0);
  objc_storeStrong((id *)&self->_psgHomePodMap, 0);
  objc_storeStrong((id *)&self->_allStereoPairs, 0);
  objc_storeStrong((id *)&self->_allHomePods, 0);
  objc_storeStrong((id *)&self->_allPSGs, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
}

@end
