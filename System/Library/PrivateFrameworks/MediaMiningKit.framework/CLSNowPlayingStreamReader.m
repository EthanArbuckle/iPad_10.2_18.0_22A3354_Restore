@implementation CLSNowPlayingStreamReader

- (CLSNowPlayingStreamReader)init
{
  CLSNowPlayingStreamReader *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSNowPlayingStreamReader;
  v2 = -[CLSNowPlayingStreamReader init](&v4, sel_init);
  if (v2)
    v2->_conversionOptions = +[CLSNowPlayingStreamConverter defaultOptions](CLSNowPlayingStreamConverter, "defaultOptions");
  return v2;
}

- (void)enumerateSessionsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, uint8_t *, double);
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  CLSNowPlayingStreamEventClusterer *v20;
  void *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  CLSNowPlayingStreamConverter *v38;
  void *v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint8_t *, double))a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStartInDateRangeFrom:to:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0D15A08]);
  objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEventStreams:", v9);

  v33 = (void *)v6;
  objc_msgSend(v7, "setPredicate:", v6);
  objc_msgSend(v7, "setLimit:", 500);
  objc_msgSend(v7, "setOffset:", 0);
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(CLSNowPlayingStreamConverter);
  v11 = -[CLSNowPlayingStreamConverter setOptions:](v38, "setOptions:", -[CLSNowPlayingStreamReader conversionOptions](self, "conversionOptions"));
  v12 = MEMORY[0x1E0C81028];
  v36 = v10;
  v37 = v7;
  do
  {
    v13 = (void *)MEMORY[0x1D1796094](v11);
    v46 = 0;
    objc_msgSend(v10, "executeQuery:error:", v7, &v46);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v46;
    if (!v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v15;
        _os_log_error_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_ERROR, "Failed to read playback event stream with error: %@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    v16 = objc_msgSend(v14, "count");
    objc_msgSend(v7, "setOffset:", objc_msgSend(v7, "offset") + v16);
    v17 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v18;
        _os_log_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_INFO, "Will process %@ events from playback stream", buf, 0xCu);

      }
      -[CLSNowPlayingStreamConverter eventsFromDuetKnowledgeEvents:](v38, "eventsFromDuetKnowledgeEvents:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(CLSNowPlayingStreamEventClusterer);
      -[CLSNowPlayingStreamEventClusterer clusterEvents:](v20, "clusterEvents:", v19);
      -[CLSNowPlayingStreamEventClusterer sessions](v20, "sessions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        v39 = v19;
        v40 = v15;
        v41 = v13;
        buf[0] = 0;
        v22 = objc_msgSend(v21, "count");
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v23 = v21;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v24)
        {
          v25 = v24;
          v26 = 1.0 / (double)v22;
          v27 = *(_QWORD *)v43;
          v28 = 0.0;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v43 != v27)
                objc_enumerationMutation(v23);
              v30 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              v31 = (void *)MEMORY[0x1D1796094]();
              v28 = v26 + v28;
              v4[2](v4, v30, buf, v28);
              objc_autoreleasePoolPop(v31);
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          }
          while (v25);
        }

        v10 = v36;
        v7 = v37;
        v12 = MEMORY[0x1E0C81028];
        v15 = v40;
        v13 = v41;
        v19 = v39;
      }

LABEL_18:
      v32 = 0;
      goto LABEL_19;
    }
    if (v17)
    {
      *(_WORD *)buf = 0;
      v32 = 1;
      _os_log_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_INFO, "No more events from playback stream", buf, 2u);
    }
    else
    {
      v32 = 1;
    }
LABEL_19:

    objc_autoreleasePoolPop(v13);
  }
  while (v14 && !v32);

}

- (unint64_t)conversionOptions
{
  return self->_conversionOptions;
}

- (void)setConversionOptions:(unint64_t)a3
{
  self->_conversionOptions = a3;
}

@end
