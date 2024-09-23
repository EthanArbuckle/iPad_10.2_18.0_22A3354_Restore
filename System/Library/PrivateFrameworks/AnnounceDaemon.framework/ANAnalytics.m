@implementation ANAnalytics

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__ANAnalytics_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, block);
  return (id)shared_shared;
}

void __21__ANAnalytics_shared__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  ANAnalyticsAssistant *v5;
  ANAnalyticsDaily *v6;
  uint64_t v7;
  void *v8;
  ANCoreAnalytics *v9;

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForDefault:", *MEMORY[0x1E0CF7AA8]);

  v4 = objc_alloc(*(Class *)(a1 + 32));
  v9 = objc_alloc_init(ANCoreAnalytics);
  v5 = objc_alloc_init(ANAnalyticsAssistant);
  if (v3)
    v6 = objc_alloc_init(ANAnalyticsDaily);
  else
    v6 = 0;
  v7 = objc_msgSend(v4, "initWithSystem:assistant:dailyReporter:", v9, v5, v6);
  v8 = (void *)shared_shared;
  shared_shared = v7;

  if (v3)
}

- (ANAnalytics)initWithSystem:(id)a3 assistant:(id)a4 dailyReporter:(id)a5
{
  id v9;
  id v10;
  id v11;
  ANAnalytics *v12;
  ANAnalytics *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ANAnalytics;
  v12 = -[ANAnalytics init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_system, a3);
    objc_storeStrong((id *)&v13->_assistant, a4);
    if (v11)
    {
      objc_storeStrong((id *)&v13->_dailyReporter, a5);
      -[ANAnalyticsDailyProtocol setDelegate:](v13->_dailyReporter, "setDelegate:", v13);
      -[ANAnalyticsDailyProtocol start](v13->_dailyReporter, "start");
    }
  }

  return v13;
}

- (void)announcementSent:(id)a3 inHome:(id)a4 withError:(int64_t)a5 withTime:(double)a6 sendType:(unint64_t)a7 ofGroupCount:(int64_t)a8 context:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v42;
  __int128 v43;

  v16 = a3;
  v17 = a4;
  if (v16)
  {
    v18 = a9;
    -[ANAnalytics assistant](self, "assistant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "audioDataForAnnouncement:", v16);
    v22 = v21;

    v43 = 0u;
    -[ANAnalytics assistant](self, "assistant");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      objc_msgSend(v23, "senderDataForAnnouncement:", v16);
    else
      v43 = 0u;

    -[ANAnalytics assistant](self, "assistant");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "boundGroupCount:", a8);

    v27 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("action"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5 != 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("error"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("errorCode"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, CFSTR("groupCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v43);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, CFSTR("location"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, CFSTR("sendType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v35, CFSTR("size"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v43 + 1));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, CFSTR("source"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v37, CFSTR("time"));

    objc_msgSend(v18, "analyticsPayload");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addEntriesFromDictionary:", v38);
    -[ANAnalytics system](self, "system");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v39, "send:withPayload:", CFSTR("announcementSent"), v40);

    -[ANAnalytics dailyReporter](self, "dailyReporter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a7 && v41)
    {
      -[ANAnalytics dailyReporter](self, "dailyReporter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "announcementSent:inHome:", v16, v17);

    }
  }

}

- (void)announcementReceived:(id)a3 withTime:(double)a4 receiveTimeType:(unint64_t)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;

  v10 = a3;
  if (v10)
  {
    v11 = a6;
    -[ANAnalytics assistant](self, "assistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "audioDataForAnnouncement:", v10);
    v15 = v14;

    v51 = 0u;
    v52 = 0u;
    -[ANAnalytics assistant](self, "assistant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "senderDataForAnnouncement:", v10);
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
    }

    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v51);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("action"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v52);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("location"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("receiveType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("size"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v52 + 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("source"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("time"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", SDWORD2(v51));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, CFSTR("fromDevice"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(MEMORY[0x1E0CF7E38], "deviceClass"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, CFSTR("toDevice"));

    objc_msgSend(v11, "analyticsPayload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v28);

    -[ANAnalytics system](self, "system");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v11;
    v30 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v29, "send:withPayload:", CFSTR("announcementTimeToReceive"), v30);

    -[ANAnalytics assistant](self, "assistant");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "bucketFromSize:", v13);

    -[ANAnalytics assistant](self, "assistant");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "bucketFromDuration:", v15);

    -[ANAnalytics assistant](self, "assistant");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "bucketFromReceiveTime:", a4);

    v37 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, CFSTR("sizeBucket"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v34);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("durationBucket"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v40, CFSTR("timeBucket"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, CFSTR("size"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v42, CFSTR("duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v43, CFSTR("time"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v44, CFSTR("receiveType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", SDWORD2(v51));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v45, CFSTR("fromDevice"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(MEMORY[0x1E0CF7E38], "deviceClass"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v46, CFSTR("toDevice"));

    objc_msgSend(v50, "analyticsPayload");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "addEntriesFromDictionary:", v47);
    -[ANAnalytics system](self, "system");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(v48, "send:withPayload:", CFSTR("announcementReceiveMeasure"), v49);

  }
}

- (void)announcementPlayed:(id)a3 withTime:(double)a4 deadlineViolation:(double)a5 playbackSource:(unint64_t)a6 ofGroupCount:(int64_t)a7 context:(id)a8
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;

  v14 = a3;
  if (v14)
  {
    v15 = a8;
    -[ANAnalytics assistant](self, "assistant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "audioDataForAnnouncement:", v14);
    v19 = v18;

    v37 = 0u;
    -[ANAnalytics assistant](self, "assistant");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      objc_msgSend(v20, "senderDataForAnnouncement:", v14);
    else
      v37 = 0u;

    -[ANAnalytics assistant](self, "assistant");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "boundGroupCount:", a7);

    v24 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("action"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5 > 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("deadlineViolation"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("groupCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("location"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, CFSTR("size"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v37 + 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, CFSTR("source"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v32, CFSTR("playbackSource"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v33, CFSTR("time"));

    objc_msgSend(v15, "analyticsPayload");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "addEntriesFromDictionary:", v34);
    -[ANAnalytics system](self, "system");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v35, "send:withPayload:", CFSTR("announcementTimeToPlay"), v36);

  }
}

- (void)announcementFinishedPlaying:(id)a3 withTime:(double)a4 ofGroupCount:(int64_t)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;

  v10 = a3;
  if (v10)
  {
    v11 = a6;
    -[ANAnalytics assistant](self, "assistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "audioDataForAnnouncement:", v10);
    v15 = v14;

    v31 = 0u;
    -[ANAnalytics assistant](self, "assistant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "senderDataForAnnouncement:", v10);
    else
      v31 = 0u;

    -[ANAnalytics assistant](self, "assistant");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "boundGroupCount:", a5);

    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("action"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("duration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("groupCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("location"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("size"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v31 + 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("source"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("time"));

    objc_msgSend(v11, "analyticsPayload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addEntriesFromDictionary:", v28);
    -[ANAnalytics system](self, "system");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v29, "send:withPayload:", CFSTR("announcementFinishedPlaying"), v30);

  }
}

- (void)announcementsExpired:(id)a3 ofGroupCount:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
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
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    -[ANAnalytics assistant](self, "assistant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "boundGroupCount:", a4);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v29 = 0u;
          -[ANAnalytics assistant](self, "assistant", v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
            objc_msgSend(v17, "senderDataForAnnouncement:", v16);
          else
            v29 = 0u;

          v19 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("action"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "hasPlayed"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("played"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("groupCount"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v29 + 1));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("source"));

          objc_msgSend(v9, "analyticsPayload");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addEntriesFromDictionary:", v24);

          -[ANAnalytics system](self, "system");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v19, "copy");
          objc_msgSend(v25, "send:withPayload:", CFSTR("announcementExpiration"), v26);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }

    v8 = v27;
  }

}

- (void)announcementEntryAgeLimit:(id)a3 timeExceeded:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;

  v8 = a3;
  if (v8)
  {
    v20 = 0u;
    v9 = a5;
    -[ANAnalytics assistant](self, "assistant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "senderDataForAnnouncement:", v8);
    else
      v20 = 0u;

    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("action"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("location"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v20 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("source"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("timeExceeded"));

    objc_msgSend(v9, "analyticsPayload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addEntriesFromDictionary:", v17);
    -[ANAnalytics system](self, "system");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v18, "send:withPayload:", CFSTR("announcementEntryAgeLimit"), v19);

  }
}

- (void)announcementsStorageAgeLimit:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "announcements");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v6, "announcements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      -[ANAnalytics assistant](self, "assistant");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "announcements");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v12, "boundGroupCount:", objc_msgSend(v13, "count"));

      objc_msgSend(v6, "announcements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = 0;
        do
        {
          objc_msgSend(v6, "announcements");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "metadata");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = 0u;
          -[ANAnalytics assistant](self, "assistant");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
            objc_msgSend(v21, "senderDataForAnnouncement:", v18);
          else
            v35 = 0u;

          v23 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("action"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v35);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("location"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v18, "hasPlayed"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("played"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v35 + 1));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("source"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v34);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, CFSTR("groupCount"));

          objc_msgSend(v7, "analyticsPayload");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addEntriesFromDictionary:", v29);

          objc_msgSend(v23, "addEntriesFromDictionary:", v20);
          -[ANAnalytics system](self, "system");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v23, "copy");
          objc_msgSend(v30, "send:withPayload:", CFSTR("announcementAgeLimit"), v31);

          ++v16;
          objc_msgSend(v6, "announcements");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "count");

        }
        while (v16 < v33);
      }
    }
  }

}

- (void)error:(int64_t)a3
{
  -[ANAnalytics error:context:](self, "error:context:", a3, 0);
}

- (void)error:(int64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  if ((unint64_t)(a3 - 5035) >= 0xFFFFFFFFFFFFF03DLL)
  {
    v11 = v6;
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("errorCode"));

    if (v11)
    {
      objc_msgSend(v11, "analyticsPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEntriesFromDictionary:", v9);

    }
    -[ANAnalytics system](self, "system");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "send:withPayload:", CFSTR("announcementError"), v7);

    v6 = v11;
  }

}

- (void)playbackAction:(unint64_t)a3 fromSource:(unint64_t)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v14 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("action"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("source"));

  objc_msgSend(v8, "analyticsPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addEntriesFromDictionary:", v11);
  -[ANAnalytics system](self, "system");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v12, "send:withPayload:", CFSTR("playbackAction"), v13);

}

- (void)recordReachableHomes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ANAnalytics dailyReporter](self, "dailyReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordReachableHomes:", v4);

}

- (void)dailyReport:(id)a3 withPayload:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ANAnalytics system](self, "system");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "send:withPayload:", v7, v6);

}

- (void)dailyReportComplete
{
  NSObject *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (ANLogHandleAnalytics_once != -1)
    dispatch_once(&ANLogHandleAnalytics_once, &__block_literal_global_14);
  v2 = (id)ANLogHandleAnalytics_logger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily completed daily report.", (uint8_t *)&v3, 0xCu);
  }

}

- (ANAnalyticsSystemProtocol)system
{
  return (ANAnalyticsSystemProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (ANAnalyticsAssistantProtocol)assistant
{
  return (ANAnalyticsAssistantProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (ANAnalyticsDailyProtocol)dailyReporter
{
  return (ANAnalyticsDailyProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyReporter, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_system, 0);
}

@end
