@implementation GKViceroyLeaderElector

- (GKViceroyLeaderElector)initWithMatchDataDelegate:(id)a3
{
  id v4;
  GKViceroyLeaderElector *v5;
  GKViceroyLeaderElector *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKViceroyLeaderElector;
  v5 = -[GKViceroyLeaderElector init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_matchDataDelegateWeak, v4);

  return v6;
}

- (void)chooseBestHostingPlayerWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  GKViceroyLeaderElector *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[5];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[GKViceroyLeaderElector matchDataDelegate](self, "matchDataDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_chooseHostCompletion
      || v5 && (objc_msgSend(v5, "expectedPlayerCount") || !objc_msgSend(v6, "currentPlayerCount")))
    {
      v4[2](v4, 0);
    }
    else
    {
      v7 = self;
      objc_sync_enter(v7);
      if (!v7->_hostScores)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKViceroyLeaderElector setHostScores:](v7, "setHostScores:", v8);

      }
      objc_sync_exit(v7);

      -[GKViceroyLeaderElector setChooseHostCompletion:](v7, "setChooseHostCompletion:", v4);
      -[GKViceroyLeaderElector calculateHostScore](v7, "calculateHostScore");
      if (!-[GKViceroyLeaderElector selectHostIfRequestedAndAllScored](v7, "selectHostIfRequestedAndAllScored"))
      {
        if (v7->_needHostScore)
          -[GKViceroyLeaderElector setHostScoreForQuery:](v7, "setHostScoreForQuery:", 1);
        else
          -[GKViceroyLeaderElector sendHostScoreAsQuery:](v7, "sendHostScoreAsQuery:", 1);
        v9 = dispatch_time(0, 15000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __71__GKViceroyLeaderElector_chooseBestHostingPlayerWithCompletionHandler___block_invoke;
        block[3] = &unk_1E75B1590;
        block[4] = v7;
        dispatch_after(v9, MEMORY[0x1E0C80D38], block);
      }
    }

  }
}

void __71__GKViceroyLeaderElector_chooseBestHostingPlayerWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  _QWORD block[5];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[2])
  {
    v3 = v1;
    objc_sync_enter(v3);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__GKViceroyLeaderElector_chooseBestHostingPlayerWithCompletionHandler___block_invoke_2;
      block[3] = &unk_1E75B1590;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    objc_sync_exit(v3);

  }
}

uint64_t __71__GKViceroyLeaderElector_chooseBestHostingPlayerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
  {
    (*(void (**)(uint64_t, _QWORD))(result + 16))(result, 0);
    return objc_msgSend(*(id *)(a1 + 32), "setChooseHostCompletion:", 0);
  }
  return result;
}

- (void)networkStatisticsDidChange:(id)a3 localPlayerPeerID:(id)a4
{
  id v6;

  v6 = a4;
  -[GKViceroyLeaderElector setNetworkStatistics:](self, "setNetworkStatistics:", a3);
  -[GKViceroyLeaderElector setLocalPlayerPeerID:](self, "setLocalPlayerPeerID:", v6);

  if (self->_needHostScore)
  {
    -[GKViceroyLeaderElector calculateHostScore](self, "calculateHostScore");
    -[GKViceroyLeaderElector sendHostScoreAsQuery:](self, "sendHostScoreAsQuery:", self->_hostScoreForQuery);
    -[GKViceroyLeaderElector selectHostIfRequestedAndAllScored](self, "selectHostIfRequestedAndAllScored");
    -[GKViceroyLeaderElector setNeedHostScore:](self, "setNeedHostScore:", 0);
    -[GKViceroyLeaderElector setHostScoreForQuery:](self, "setHostScoreForQuery:", 0);
  }
}

- (void)receivedChooseHostData:(id)a3 fromPlayerID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v17 = objc_retainAutorelease(v6);
  v8 = *(unsigned int *)objc_msgSend(v17, "bytes");
  if ((unint64_t)objc_msgSend(v17, "length") >= 5)
  {
    v9 = (void *)MEMORY[0x1E0C99D50];
    v10 = objc_retainAutorelease(v17);
    objc_msgSend(v9, "dataWithBytes:length:", objc_msgSend(v10, "bytes") + 4, objc_msgSend(v10, "length") - 4);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v17, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("query"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

    }
    else
    {
      v14 = 1;
    }

    if (!v7)
      goto LABEL_9;
    goto LABEL_8;
  }
  v14 = 1;
  if (v7)
  {
LABEL_8:
    -[GKViceroyLeaderElector matchDataDelegate](self, "matchDataDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playerFromID:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKViceroyLeaderElector addHostScore:forPlayer:](self, "addHostScore:forPlayer:", v8, v16);

  }
LABEL_9:
  -[GKViceroyLeaderElector calculateHostScore](self, "calculateHostScore");
  if (v14)
    -[GKViceroyLeaderElector sendHostScoreAsQuery:](self, "sendHostScoreAsQuery:", 0);
  -[GKViceroyLeaderElector selectHostIfRequestedAndAllScored](self, "selectHostIfRequestedAndAllScored");

}

- (void)addHostScore:(int)a3 forPlayer:(id)a4
{
  id v6;
  GKViceroyLeaderElector *v7;
  NSMutableDictionary *hostScores;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    hostScores = v7->_hostScores;
    if (!hostScores)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[GKViceroyLeaderElector setHostScores:](v7, "setHostScores:", v9);

      hostScores = v7->_hostScores;
    }
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "referenceKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](hostScores, "setObject:forKey:", v11, v12);

    objc_sync_exit(v7);
  }

}

- (BOOL)haveAllHostScores
{
  GKViceroyLeaderElector *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_hostScores, "count");
  -[GKViceroyLeaderElector matchDataDelegate](v2, "matchDataDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 == objc_msgSend(v4, "currentPlayerCountIncludingLocalPlayer");

  objc_sync_exit(v2);
  return v3;
}

- (BOOL)selectHostIfRequestedAndAllScored
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  GKViceroyLeaderElector *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  NSMutableDictionary *obj;
  id *p_isa;
  _QWORD block[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_chooseHostCompletion)
  {
    v3 = -[GKViceroyLeaderElector haveAllHostScores](self, "haveAllHostScores");
    if (v3)
    {
      +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "referenceKey");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = self;
      objc_sync_enter(v6);
      p_isa = (id *)&v6->super.isa;
      -[NSMutableDictionary objectForKey:](v6->_hostScores, "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "integerValue");

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      obj = v6->_hostScores;
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(p_isa[3], "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v14;
            objc_msgSend(v14, "objectAtIndex:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "integerValue");

            if (v16 > v9 || v16 == v9 && objc_msgSend(v5, "caseInsensitiveCompare:", v13) == -1)
            {
              objc_msgSend(v7, "objectAtIndex:", 0);
              v17 = objc_claimAutoreleasedReturnValue();

              v18 = v13;
              v4 = (void *)v17;
              v5 = v18;
              v9 = v16;
            }
          }
          v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v10);
      }

      objc_msgSend(p_isa, "setHostScores:", 0);
      objc_sync_exit(p_isa);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__GKViceroyLeaderElector_selectHostIfRequestedAndAllScored__block_invoke;
      block[3] = &unk_1E75B1A28;
      block[4] = p_isa;
      v24 = v4;
      v19 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

uint64_t __59__GKViceroyLeaderElector_selectHostIfRequestedAndAllScored__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  if (v1)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 40), "internal");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

    return objc_msgSend(*(id *)(v2 + 32), "setChooseHostCompletion:", 0);
  }
  return result;
}

- (void)calculateHostScore
{
  GKViceroyLeaderElector *v3;
  void *v4;
  NSDictionary *networkStatistics;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  GKViceroyLeaderElector *v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  _BYTE v62[18];
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "referenceKey");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = self;
  objc_sync_enter(v3);
  -[NSMutableDictionary objectForKey:](v3->_hostScores, "objectForKey:", v47);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  if (!v4)
  {
    networkStatistics = v3->_networkStatistics;
    if (networkStatistics
      && v3->_localPlayerPeerID
      && (v49 = v3,
          -[NSDictionary objectForKey:](networkStatistics, "objectForKey:"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "objectForKey:", CFSTR("GKSStatsLinks")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v7))
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v57;
        v50 = 0.0;
        v51 = 0.0;
        v11 = 0.0;
        v12 = 0.0;
        v13 = 0.0;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v57 != v10)
              objc_enumerationMutation(v8);
            objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i), v47);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", CFSTR("GKSStatsSendBWE"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "doubleValue");
            v18 = v17;

            objc_msgSend(v15, "objectForKey:", CFSTR("GKSStatsRecvBWE"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "doubleValue");
            v21 = v20;

            objc_msgSend(v15, "objectForKey:", CFSTR("GKSStatsSendPLR"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValue");
            v24 = v23;

            objc_msgSend(v15, "objectForKey:", CFSTR("GKSStatsRecvPLR"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v27 = v26;

            objc_msgSend(v15, "objectForKey:", CFSTR("GKSStatsRTT"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "doubleValue");
            v30 = v29;

            v13 = v13 + v18;
            v12 = v12 + v21;
            v11 = v11 + v24;
            v50 = v50 + v30;
            v51 = v51 + v27;
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
        }
        while (v9);
      }
      else
      {
        v50 = 0.0;
        v51 = 0.0;
        v11 = 0.0;
        v12 = 0.0;
        v13 = 0.0;
      }

      v31 = objc_msgSend(v8, "count");
      if (v31 < 2)
      {
        v33 = v50;
        v32 = v51;
      }
      else
      {
        v13 = v13 / (double)v31;
        v12 = v12 / (double)v31;
        v11 = v11 / (double)v31;
        v32 = v51 / (double)v31;
        v33 = v50 / (double)v31;
      }
      v34 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v35 = GKOSLoggers();
        v34 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219264;
        *(_QWORD *)v62 = (uint64_t)((double)(uint64_t)((double)(uint64_t)((v12 + v13) * 0.3 + 0.0) - (v32 + v11) * 0.3)
                                 + v33 * -0.4);
        *(_WORD *)&v62[8] = 2048;
        *(double *)&v62[10] = v13;
        v63 = 2048;
        v64 = v12;
        v65 = 2048;
        v66 = v11;
        v67 = 2048;
        v68 = v32;
        v69 = 2048;
        v70 = v33;
        _os_log_impl(&dword_1BCDE3000, v34, OS_LOG_TYPE_INFO, "[GKViceroyLeaderElector] Host score %ld  (sendBandwidth = %f, receiveBandwidth = %f, sendLoss = %f, receiveLoss = %f, rtt = %f)", buf, 0x3Eu);
      }
      -[GKViceroyLeaderElector addHostScore:forPlayer:](v49, "addHostScore:forPlayer:", (uint64_t)((double)(uint64_t)((double)(uint64_t)((v12 + v13) * 0.3 + 0.0) - (v32 + v11) * 0.3) + v33 * -0.4), v48, v47);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[GKViceroyLeaderElector matchDataDelegate](v49, "matchDataDelegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "guestPlayers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v53 != v39)
              objc_enumerationMutation(v37);
            v41 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            -[GKViceroyLeaderElector addHostScore:forPlayer:](v49, "addHostScore:forPlayer:", 0, v41);
            v42 = os_log_GKGeneral;
            if (!os_log_GKGeneral)
            {
              v43 = GKOSLoggers();
              v42 = os_log_GKGeneral;
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              v44 = v42;
              objc_msgSend(v41, "internal");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "playerID");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v62 = 0;
              *(_WORD *)&v62[4] = 2112;
              *(_QWORD *)&v62[6] = v46;
              _os_log_impl(&dword_1BCDE3000, v44, OS_LOG_TYPE_INFO, "[GKViceroyLeaderElector] Added host score of %i for guest player = %@", buf, 0x12u);

            }
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v38);
      }

      -[GKViceroyLeaderElector selectHostIfRequestedAndAllScored](v49, "selectHostIfRequestedAndAllScored");
    }
    else
    {
      -[GKViceroyLeaderElector setNeedHostScore:](v3, "setNeedHostScore:", 1, v47);
    }
  }

}

- (void)sendHostScoreAsQuery:(BOOL)a3
{
  _BOOL8 v3;
  GKViceroyLeaderElector *v4;
  NSMutableDictionary *hostScores;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  int v20;
  uint8_t buf[4];
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v3 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  hostScores = v4->_hostScores;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "referenceKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](hostScores, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  if (v8)
  {
    v23 = CFSTR("query");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v20, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendData:", v11);
    -[GKViceroyLeaderElector matchDataDelegate](v4, "matchDataDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v15, "sendPacketDataToAll:packetType:dataMode:error:", v14, 4, 0, &v19);
    v16 = v19;

    if (v16)
    {
      v17 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v18 = GKOSLoggers();
        v17 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "[GKViceroyLeaderElector] Failed to enqueue GKMatchChooseHostPacketType send to all, error %@", buf, 0xCu);
      }
    }

  }
}

- (id)chooseHostCompletion
{
  return self->_chooseHostCompletion;
}

- (void)setChooseHostCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)hostScores
{
  return self->_hostScores;
}

- (void)setHostScores:(id)a3
{
  objc_storeStrong((id *)&self->_hostScores, a3);
}

- (BOOL)hostScoreForQuery
{
  return self->_hostScoreForQuery;
}

- (void)setHostScoreForQuery:(BOOL)a3
{
  self->_hostScoreForQuery = a3;
}

- (NSString)localPlayerPeerID
{
  return self->_localPlayerPeerID;
}

- (void)setLocalPlayerPeerID:(id)a3
{
  self->_localPlayerPeerID = (NSString *)a3;
}

- (BOOL)needHostScore
{
  return self->_needHostScore;
}

- (void)setNeedHostScore:(BOOL)a3
{
  self->_needHostScore = a3;
}

- (NSDictionary)networkStatistics
{
  return self->_networkStatistics;
}

- (void)setNetworkStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_networkStatistics, a3);
}

- (GKTransportMatchDataDelegate)matchDataDelegate
{
  return (GKTransportMatchDataDelegate *)objc_loadWeakRetained((id *)&self->_matchDataDelegateWeak);
}

- (void)setMatchDataDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_matchDataDelegateWeak, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_matchDataDelegateWeak);
  objc_storeStrong((id *)&self->_networkStatistics, 0);
  objc_storeStrong((id *)&self->_hostScores, 0);
  objc_storeStrong(&self->_chooseHostCompletion, 0);
}

@end
