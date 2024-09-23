@implementation NPEdgeSelection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPEdgeSelection)initWithCoder:(id)a3
{
  id v4;
  NPEdgeSelection *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *bestEdge;
  NSString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *nextBestEdge;
  NSString *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPEdgeSelection;
  v5 = -[EdgeSelection initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("BestEdge"));
    v9 = objc_claimAutoreleasedReturnValue();
    bestEdge = v5->_bestEdge;
    v5->_bestEdge = (NSString *)v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v5->_bestEdge;
      v5->_bestEdge = 0;

    }
    v5->_bestEdgeRTT = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BestEdgeRTT"));
    v5->_bestEdgeProbedRTT = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BestEdgeProbedRTT"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("NextBestEdge"));
    v15 = objc_claimAutoreleasedReturnValue();
    nextBestEdge = v5->_nextBestEdge;
    v5->_nextBestEdge = (NSString *)v15;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v5->_nextBestEdge;
      v5->_nextBestEdge = 0;

    }
    v5->_nextBestEdgeRTT = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NextBestEdgeRTT"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPEdgeSelection;
  v4 = a3;
  -[EdgeSelection encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[NPEdgeSelection bestEdge](self, "bestEdge", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("BestEdge"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPEdgeSelection bestEdgeRTT](self, "bestEdgeRTT"), CFSTR("BestEdgeRTT"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[NPEdgeSelection bestEdgeProbedRTT](self, "bestEdgeProbedRTT"), CFSTR("BestEdgeProbedRTT"));
  -[NPEdgeSelection nextBestEdge](self, "nextBestEdge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("NextBestEdge"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPEdgeSelection nextBestEdgeRTT](self, "nextBestEdgeRTT"), CFSTR("NextBestEdgeRTT"));
}

- (NPEdgeSelection)initWithWaldo:(id)a3 signature:(id)a4 interfaceType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NPEdgeSelection *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "edgeSelectionAlpha");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "edgeSelectionAlpha");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &unk_1E41514C8;
  }

  objc_msgSend(v8, "edgeSelectionWindowSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v8, "edgeSelectionWindowSize");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &unk_1E41514E0;
  }

  v19[0] = CFSTR("kESSAlpha");
  v19[1] = CFSTR("kESSWindowSize");
  v20[0] = v12;
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)NPEdgeSelection;
  v16 = -[EdgeSelection initWithNetworkSignature:interfaceType:modelParams:](&v18, sel_initWithNetworkSignature_interfaceType_modelParams_, v10, v9, v15);

  if (v16)
  {
    objc_storeWeak((id *)&v16->_waldoInfo, v8);
    -[NPEdgeSelection trainEdgeSelection:edgeRank:rtt:](v16, "trainEdgeSelection:edgeRank:rtt:", 0, 0, 0);
  }

  return v16;
}

- (void)getBestEdgeFromEdgeSelection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__NPEdgeSelection_getBestEdgeFromEdgeSelection__block_invoke;
  v2[3] = &unk_1E41374A0;
  v2[4] = self;
  -[EdgeSelection getMinimumLatencyEdge:](self, "getMinimumLatencyEdge:", v2);
}

void __47__NPEdgeSelection_getBestEdgeFromEdgeSelection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  NPGetInternalQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NPEdgeSelection_getBestEdgeFromEdgeSelection__block_invoke_2;
  block[3] = &unk_1E4137348;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __47__NPEdgeSelection_getBestEdgeFromEdgeSelection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "networkSignature");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "interfaceType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v3;
      v25 = 2112;
      v26 = (uint64_t)v4;
      v27 = 2112;
      v28 = v5;
      v6 = "Edge selection get edge, failed get min with error: %@ (%@ %@)";
LABEL_16:
      v11 = v2;
      v12 = 32;
      goto LABEL_17;
    }
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kESSSelectedEdgeLabel"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("kESSSelectedEdgeLabel"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("kESSRTT"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("kESSSelectedEdgeLabel"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setNextBestEdge:", v14);

            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("kESSRTT"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setNextBestEdgeRTT:", objc_msgSend(v15, "unsignedIntegerValue"));

            nplog_obj();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(*(id *)(a1 + 40), "nextBestEdge");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(*(id *)(a1 + 40), "nextBestEdgeRTT");
              objc_msgSend(*(id *)(a1 + 40), "networkSignature");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "interfaceType");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 138413058;
              v24 = v19;
              v25 = 2048;
              v26 = v20;
              v27 = 2112;
              v28 = v21;
              v29 = 2112;
              v30 = v22;
              _os_log_debug_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_DEBUG, "Edge selection get edge: next best edge %@ Last RTT %lu (%@ %@)", (uint8_t *)&v23, 0x2Au);

            }
            objc_msgSend(*(id *)(a1 + 40), "waldoInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setShouldSave:", 1);

            objc_msgSend(*(id *)(a1 + 40), "waldoInfo");
            v2 = objc_claimAutoreleasedReturnValue();
            -[NSObject saveToKeychain](v2, "saveToKeychain");
            goto LABEL_18;
          }
        }
      }
      nplog_obj();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v18 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "networkSignature");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "interfaceType");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v18;
        v25 = 2112;
        v26 = (uint64_t)v4;
        v27 = 2112;
        v28 = v5;
        v6 = "Edge selection get edge, failed get min, no selected edge / rtt: %@ (%@ %@)";
        goto LABEL_16;
      }
    }
    else
    {
      nplog_obj();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "networkSignature");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "interfaceType");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v4;
        v25 = 2112;
        v26 = (uint64_t)v5;
        v6 = "Edge selection get edge, failed get min, no result dictionary (%@ %@)";
        v11 = v2;
        v12 = 22;
LABEL_17:
        _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v23, v12);

      }
    }
  }
LABEL_18:

}

- (void)trainEdgeSelection:(id)a3 edgeRank:(unint64_t)a4 rtt:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  NPEdgeSelection *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v8)
  {
    v43[0] = CFSTR("kESSRTT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v10;
    v44[1] = MEMORY[0x1E0C9AAB0];
    v43[1] = CFSTR("kESSIsSelected");
    v43[2] = CFSTR("kESSRank");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v8);

LABEL_13:
    nplog_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      -[EdgeSelection networkSignature](self, "networkSignature");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EdgeSelection interfaceType](self, "interfaceType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v36 = v9;
      v37 = 2112;
      v38 = v28;
      v39 = 2112;
      v40 = v29;
      _os_log_debug_impl(&dword_19E8FE000, v26, OS_LOG_TYPE_DEBUG, "Edge selection train with edge data %@ (%@ %@)", buf, 0x20u);

    }
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __51__NPEdgeSelection_trainEdgeSelection_edgeRank_rtt___block_invoke;
    v32[3] = &unk_1E4137398;
    v33 = v9;
    v34 = self;
    -[EdgeSelection trainEdgeSelectionModel:reply:](self, "trainEdgeSelectionModel:reply:", v33, v32);
    v10 = v33;
    goto LABEL_16;
  }
  -[NPEdgeSelection waldoInfo](self, "waldoInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentEdgeList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[NPEdgeSelection waldoInfo](self, "waldoInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "edges");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v15, "edgeIndex"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v18, "label");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v15, "roundTripAverageObserved");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "average");

            v41[0] = CFSTR("kESSRTT");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = v22;
            v42[1] = MEMORY[0x1E0C9AAB0];
            v41[1] = CFSTR("kESSIsSelected");
            v41[2] = CFSTR("kESSRank");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14 + 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v42[2] = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "label");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, v25);

          }
        }
      }
      else
      {
        v18 = 0;
      }

      ++v14;
    }
    while (v14 < objc_msgSend(v10, "count"));
  }
  if (objc_msgSend(v9, "count"))
  {
    v8 = 0;
    goto LABEL_13;
  }
  nplog_obj();
  v27 = objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    -[EdgeSelection networkSignature](self, "networkSignature");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EdgeSelection interfaceType](self, "interfaceType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v36 = v30;
    v37 = 2112;
    v38 = v31;
    _os_log_error_impl(&dword_19E8FE000, v27, OS_LOG_TYPE_ERROR, "Edge selection train, no edge data (%@ %@)", buf, 0x16u);

  }
LABEL_16:

}

void __51__NPEdgeSelection_trainEdgeSelection_edgeRank_rtt___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  NPGetInternalQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NPEdgeSelection_trainEdgeSelection_edgeRank_rtt___block_invoke_2;
  block[3] = &unk_1E4137348;
  v9 = v3;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __51__NPEdgeSelection_trainEdgeSelection_edgeRank_rtt___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "networkSignature");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "interfaceType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138413058;
      v8 = v3;
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_ERROR, "Edge selection train failed for edge data %@, error: %@ (%@ %@)", (uint8_t *)&v7, 0x2Au);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "getBestEdgeFromEdgeSelection");
  }
}

- (BOOL)shouldProbeForEdgeSelection:(id)a3 edgeRank:(int64_t *)a4 edgeIndex:(int64_t *)a5 bestEdgeLabel:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int64_t *v39;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[NPEdgeSelection waldoInfo](self, "waldoInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentEdgeList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = 0;
  *a4 = -1;
  *a5 = -1;
  v14 = 0;
  if (!v9 || !v11)
    goto LABEL_27;
  v39 = a5;
  if (!objc_msgSend(v11, "count"))
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  while (1)
  {
    v17 = v14;
    objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      break;

    v13 = 0;
LABEL_15:
    ++v16;
    v15 = v13;
    if (v16 >= objc_msgSend(v11, "count"))
      goto LABEL_18;
  }
  -[NPEdgeSelection waldoInfo](self, "waldoInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "edges");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v14, "edgeIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_15;
  objc_msgSend(v13, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_15;
  if (!v16)
  {
    nplog_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "label");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "roundTripAverageObserved");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v37, "average");
      -[EdgeSelection networkSignature](self, "networkSignature");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[EdgeSelection interfaceType](self, "interfaceType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v42 = v38;
      v43 = 2048;
      v44 = v36;
      v45 = 2112;
      v46 = v24;
      v47 = 2112;
      v48 = v25;
      _os_log_debug_impl(&dword_19E8FE000, v21, OS_LOG_TYPE_DEBUG, "Edge selection update, current best edge %@, avg RTT: %ld (%@ %@)", buf, 0x2Au);

    }
    objc_msgSend(v13, "label");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "label");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", v9);

  if (!v23)
    goto LABEL_15;
  if (objc_msgSend(v13, "probePending"))
  {
    nplog_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      -[EdgeSelection networkSignature](self, "networkSignature");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[EdgeSelection interfaceType](self, "interfaceType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v9;
      v43 = 2112;
      v44 = (uint64_t)v32;
      v45 = 2112;
      v46 = v33;
      _os_log_debug_impl(&dword_19E8FE000, v27, OS_LOG_TYPE_DEBUG, "Edge selection update, edge %@ is already being probed currently, skip probe (%@ %@)", buf, 0x20u);
      goto LABEL_35;
    }
    goto LABEL_25;
  }
  *a4 = v16;
  *v39 = objc_msgSend(v14, "edgeIndex");
LABEL_18:
  if (*a4 == -1 || *v39 == -1)
  {
    nplog_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[EdgeSelection networkSignature](self, "networkSignature");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[EdgeSelection interfaceType](self, "interfaceType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v9;
      v43 = 2112;
      v44 = (uint64_t)v32;
      v45 = 2112;
      v46 = v33;
      _os_log_error_impl(&dword_19E8FE000, v27, OS_LOG_TYPE_ERROR, "Failed edge selection update, edge %@ does not match any edge in edge list (%@ %@)", buf, 0x20u);
LABEL_35:

    }
LABEL_25:

LABEL_26:
    v12 = 0;
    goto LABEL_27;
  }
  if (!*a4)
  {
    -[NPEdgeSelection waldoInfo](self, "waldoInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "currentEdgeIndex");

    if (v30)
    {
      v12 = 0;
      *a4 = -1;
      *v39 = -1;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  nplog_obj();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    -[EdgeSelection networkSignature](self, "networkSignature");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[EdgeSelection interfaceType](self, "interfaceType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v42 = v9;
    v43 = 2112;
    v44 = (uint64_t)v34;
    v45 = 2112;
    v46 = v35;
    _os_log_debug_impl(&dword_19E8FE000, v26, OS_LOG_TYPE_DEBUG, "Edge %@ does not match current best edge, should probe (%@ %@)", buf, 0x20u);

  }
  v12 = 1;
LABEL_27:

  return v12;
}

- (void)updateEdgeSelection:(unint64_t)a3
{
  uint64_t v5;
  BOOL v6;
  __CFString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD v56[4];
  NSObject *v57;
  NPEdgeSelection *v58;
  __CFString *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint8_t buf[4];
  unint64_t v77;
  __int16 v78;
  unint64_t v79;
  __int16 v80;
  unint64_t v81;
  __int16 v82;
  unint64_t v83;
  __int16 v84;
  unint64_t v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v74 = 0;
  v75 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__0;
  v69 = __Block_byref_object_dispose__0;
  -[NPEdgeSelection nextBestEdge](self, "nextBestEdge");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v66[5];
  v64 = 0;
  v6 = -[NPEdgeSelection shouldProbeForEdgeSelection:edgeRank:edgeIndex:bestEdgeLabel:](self, "shouldProbeForEdgeSelection:edgeRank:edgeIndex:bestEdgeLabel:", v5, v72 + 3, &v75, &v64);
  v7 = (__CFString *)v64;
  if (v6)
  {
    -[NPEdgeSelection waldoInfo](self, "waldoInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "reprocessPending");

    if (v9)
    {
      nplog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = v66[5];
        v12 = v72[3];
        v13 = v75;
        -[EdgeSelection networkSignature](self, "networkSignature");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[EdgeSelection interfaceType](self, "interfaceType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v77 = v11;
        v78 = 2048;
        v79 = v12;
        v80 = 2048;
        v81 = v13;
        v82 = 2112;
        v83 = (unint64_t)v14;
        v84 = 2112;
        v85 = (unint64_t)v15;
        _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "Edge selection update, reprocess probe pending, skip probe for %@ (rank %lu, index %lu) (%@ %@)", buf, 0x34u);

      }
LABEL_24:

      goto LABEL_25;
    }
    -[NPEdgeSelection bestEdge](self, "bestEdge");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", v66[5]))
    {
      v18 = -[NPEdgeSelection bestEdgeProbedRTT](self, "bestEdgeProbedRTT") == 0;

      if (!v18)
      {
        -[NPEdgeSelection probeDate](self, "probeDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[NPEdgeSelection probeDate](self, "probeDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "compare:", v21) == 1;

          if (v22)
          {
            nplog_obj();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v43 = v66[5];
              -[NPEdgeSelection probeDate](self, "probeDate");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[EdgeSelection networkSignature](self, "networkSignature");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[EdgeSelection interfaceType](self, "interfaceType");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v77 = v43;
              v78 = 2112;
              v79 = (unint64_t)v44;
              v80 = 2112;
              v81 = (unint64_t)v45;
              v82 = 2112;
              v83 = (unint64_t)v46;
              _os_log_debug_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_DEBUG, "Edge selection update, skip probe for %@ because the probe date (%@) has not passed (%@ %@)", buf, 0x2Au);

            }
            -[NPEdgeSelection setBestEdge:](self, "setBestEdge:", v66[5]);
            -[NPEdgeSelection setBestEdgeRTT:](self, "setBestEdgeRTT:", a3);
            nplog_obj();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              v47 = CFSTR("<unknown>");
              if (v7)
                v47 = v7;
              v48 = -[NPEdgeSelection bestEdgeRTT](self, "bestEdgeRTT", v47);
              -[NPEdgeSelection bestEdge](self, "bestEdge");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = -[NPEdgeSelection nextBestEdgeRTT](self, "nextBestEdgeRTT");
              v51 = -[NPEdgeSelection bestEdgeProbedRTT](self, "bestEdgeProbedRTT");
              -[EdgeSelection networkSignature](self, "networkSignature");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[EdgeSelection interfaceType](self, "interfaceType");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413826;
              v77 = v55;
              v78 = 2048;
              v79 = v48;
              v80 = 2112;
              v81 = (unint64_t)v49;
              v82 = 2048;
              v83 = v50;
              v84 = 2048;
              v85 = v51;
              v86 = 2112;
              v87 = v52;
              v88 = 2112;
              v89 = v53;
              _os_log_debug_impl(&dword_19E8FE000, v24, OS_LOG_TYPE_DEBUG, "Edge selection update, best edge mismatched (%@ RTT %lu, ES %@ last RTT %lu, current RTT %lu) (%@ %@)", buf, 0x48u);

            }
            -[NPEdgeSelection bestEdge](self, "bestEdge");
            v10 = objc_claimAutoreleasedReturnValue();
            -[NPEdgeSelection trainEdgeSelection:edgeRank:rtt:](self, "trainEdgeSelection:edgeRank:rtt:", v10, v72[3], -[NPEdgeSelection bestEdgeProbedRTT](self, "bestEdgeProbedRTT"));
            goto LABEL_24;
          }
        }
      }
    }
    else
    {

    }
    -[NPEdgeSelection waldoInfo](self, "waldoInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "edges");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v75);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    nplog_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    v10 = v28;
    if (v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v39 = v66[5];
        v40 = v72[3];
        v54 = v75;
        -[EdgeSelection networkSignature](self, "networkSignature");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[EdgeSelection interfaceType](self, "interfaceType");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v77 = v39;
        v78 = 2048;
        v79 = v40;
        v80 = 2048;
        v81 = v54;
        v82 = 2112;
        v83 = (unint64_t)v41;
        v84 = 2112;
        v85 = (unint64_t)v42;
        _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "Edge selection update, probing %@ (rank %lu, index %lu) (%@ %@)", buf, 0x34u);

      }
      objc_msgSend(v27, "setProbePending:", 1);
      v29 = objc_alloc(MEMORY[0x1E0C99D68]);
      -[NPEdgeSelection waldoInfo](self, "waldoInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "probePause");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v32 = (void *)objc_msgSend(v29, "initWithTimeIntervalSinceNow:");
      -[NPEdgeSelection setProbeDate:](self, "setProbeDate:", v32);

      -[NPEdgeSelection waldoInfo](self, "waldoInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v75;
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __39__NPEdgeSelection_updateEdgeSelection___block_invoke;
      v56[3] = &unk_1E41374C8;
      v10 = v27;
      v57 = v10;
      v58 = self;
      v60 = &v65;
      v62 = 1;
      v63 = a3;
      v59 = v7;
      v61 = &v71;
      objc_msgSend(v33, "reprocessAdHocWithEdgeIndex:completionHandler:", v34, v56);

    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v77 = v75;
      _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, "Edge selection probe skipped, no edge for index %lu", buf, 0xCu);
    }
    goto LABEL_24;
  }
  if ((v72[3] & 0x8000000000000000) == 0)
  {
    -[NPEdgeSelection setBestEdge:](self, "setBestEdge:", v66[5]);
    -[NPEdgeSelection setBestEdgeRTT:](self, "setBestEdgeRTT:", a3);
    -[NPEdgeSelection setBestEdgeProbedRTT:](self, "setBestEdgeProbedRTT:", 0);
    nplog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v35 = v66[5];
      v36 = -[NPEdgeSelection nextBestEdgeRTT](self, "nextBestEdgeRTT");
      -[EdgeSelection networkSignature](self, "networkSignature");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[EdgeSelection interfaceType](self, "interfaceType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v77 = v35;
      v78 = 2048;
      v79 = v36;
      v80 = 2048;
      v81 = a3;
      v82 = 2112;
      v83 = (unint64_t)v37;
      v84 = 2112;
      v85 = (unint64_t)v38;
      _os_log_debug_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_DEBUG, "Edge selection update, best edge matched (%@ last RTT %lu, current RTT %lu) (%@ %@)", buf, 0x34u);

    }
    -[NPEdgeSelection trainEdgeSelection:edgeRank:rtt:](self, "trainEdgeSelection:edgeRank:rtt:", v66[5], v72[3], -[NPEdgeSelection bestEdgeRTT](self, "bestEdgeRTT"));
  }
LABEL_25:

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);
}

void __39__NPEdgeSelection_updateEdgeSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setProbePending:", 0);
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "networkSignature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "interfaceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v10;
    v26 = 2112;
    v27 = (uint64_t)v11;
    v28 = 2112;
    v29 = v12;
    _os_log_debug_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEBUG, "Edge selection probe, got sorted result for %@ (%@ %@)", (uint8_t *)&v24, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "waldoInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEdgeList:debug:toStdout:", v3, 1, 0);

  if (objc_msgSend(v3, "count") == *(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "setBestEdge:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 40), "setBestEdgeRTT:", *(_QWORD *)(a1 + 80));
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setBestEdgeProbedRTT:", objc_msgSend(v6, "roundTripTime"));

    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (*(_QWORD *)(a1 + 48))
        v13 = *(const __CFString **)(a1 + 48);
      else
        v13 = CFSTR("<unknown>");
      v14 = objc_msgSend(*(id *)(a1 + 40), "bestEdgeRTT");
      objc_msgSend(*(id *)(a1 + 40), "bestEdge");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(*(id *)(a1 + 40), "nextBestEdgeRTT");
      v17 = objc_msgSend(*(id *)(a1 + 40), "bestEdgeProbedRTT");
      objc_msgSend(*(id *)(a1 + 40), "networkSignature");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "interfaceType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138413826;
      v25 = (uint64_t)v13;
      v26 = 2048;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      v30 = 2048;
      v31 = v16;
      v32 = 2048;
      v33 = v17;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v19;
      _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Edge selection update, best edge mismatched (%@ RTT %lu, ES %@ last RTT %lu, current RTT %lu) (%@ %@)", (uint8_t *)&v24, 0x48u);

    }
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "bestEdge");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trainEdgeSelection:edgeRank:rtt:", v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "bestEdgeProbedRTT"));
  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v3, "count");
      v21 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "networkSignature");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "interfaceType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 134218754;
      v25 = v20;
      v26 = 2048;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = (uint64_t)v23;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Edge selection probe, sorted result count (%lu) != %lu (%@ %@)", (uint8_t *)&v24, 0x2Au);

    }
  }

}

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NPEdgeSelection bestEdge](self, "bestEdge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NPEdgeSelection bestEdgeRTT](self, "bestEdgeRTT");
  v6 = -[NPEdgeSelection bestEdgeProbedRTT](self, "bestEdgeProbedRTT");
  -[NPEdgeSelection nextBestEdge](self, "nextBestEdge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Edge Selection: best edge <%@, rtt %lu, probed rtt %lu> next best edge <%@, rtt %lu> trialCount %ld"), v4, v5, v6, v7, -[NPEdgeSelection nextBestEdgeRTT](self, "nextBestEdgeRTT"), -[EdgeSelection trialCount](self, "trialCount"));

  v10.receiver = self;
  v10.super_class = (Class)NPEdgeSelection;
  -[EdgeSelection description](&v10, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\n%@"), v8);

  return v3;
}

- (id)copyEdgeSelectionTelemetry
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NPEdgeSelection bestEdge](self, "bestEdge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bestEdge"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NPEdgeSelection bestEdgeRTT](self, "bestEdgeRTT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bestEdgeRTT"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NPEdgeSelection bestEdgeProbedRTT](self, "bestEdgeProbedRTT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bestEdgeProbedRTT"));

  -[NPEdgeSelection nextBestEdge](self, "nextBestEdge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("nextBestEdge"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NPEdgeSelection nextBestEdgeRTT](self, "nextBestEdgeRTT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nextBestEdgeRTT"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EdgeSelection trialCount](self, "trialCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("trialCount"));

  return v3;
}

- (NPWaldo)waldoInfo
{
  return (NPWaldo *)objc_loadWeakRetained((id *)&self->_waldoInfo);
}

- (void)setWaldoInfo:(id)a3
{
  objc_storeWeak((id *)&self->_waldoInfo, a3);
}

- (NSString)bestEdge
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBestEdge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)bestEdgeRTT
{
  return self->_bestEdgeRTT;
}

- (void)setBestEdgeRTT:(unint64_t)a3
{
  self->_bestEdgeRTT = a3;
}

- (unint64_t)bestEdgeProbedRTT
{
  return self->_bestEdgeProbedRTT;
}

- (void)setBestEdgeProbedRTT:(unint64_t)a3
{
  self->_bestEdgeProbedRTT = a3;
}

- (NSString)nextBestEdge
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNextBestEdge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (unint64_t)nextBestEdgeRTT
{
  return self->_nextBestEdgeRTT;
}

- (void)setNextBestEdgeRTT:(unint64_t)a3
{
  self->_nextBestEdgeRTT = a3;
}

- (NSDate)probeDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProbeDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeDate, 0);
  objc_storeStrong((id *)&self->_nextBestEdge, 0);
  objc_storeStrong((id *)&self->_bestEdge, 0);
  objc_destroyWeak((id *)&self->_waldoInfo);
}

@end
