@implementation GKAPIReporter

+ (id)reporter
{
  if (reporter_sDispatchOnceToken != -1)
    dispatch_once(&reporter_sDispatchOnceToken, &__block_literal_global_33);
  return (id)reporter_sReporter;
}

void __25__GKAPIReporter_reporter__block_invoke()
{
  GKAPIReporter *v0;
  void *v1;

  v0 = objc_alloc_init(GKAPIReporter);
  v1 = (void *)reporter_sReporter;
  reporter_sReporter = (uint64_t)v0;

}

- (void)recordVoiceChat
{
  -[GKAPIReporter sendMetrics:](self, "sendMetrics:", &unk_1E75FB258);
}

- (void)recordClickWithAction:(id)a3 targetId:(id)a4 targetType:(id)a5 pageId:(id)a6 pageType:(id)a7
{
  -[GKAPIReporter recordClickWithAction:targetId:targetType:pageId:pageType:additionalFields:](self, "recordClickWithAction:targetId:targetType:pageId:pageType:additionalFields:", a3, a4, a5, a6, a7, 0);
}

- (void)recordClickWithAction:(id)a3 targetId:(id)a4 targetType:(id)a5 pageId:(id)a6 pageType:(id)a7 additionalFields:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("eventType");
  v23[1] = CFSTR("actionType");
  v24[0] = CFSTR("click");
  v24[1] = a3;
  v23[2] = CFSTR("targetId");
  v23[3] = CFSTR("targetType");
  v24[2] = a4;
  v24[3] = a5;
  v23[4] = CFSTR("pageId");
  v23[5] = CFSTR("pageType");
  v24[4] = a6;
  v24[5] = a7;
  v14 = (void *)MEMORY[0x1E0C99D80];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  objc_msgSend(v22, "addEntriesFromDictionary:", v15);

  -[GKAPIReporter sendMetrics:](self, "sendMetrics:", v22);
}

- (void)recordPageWithID:(id)a3 pageContext:(id)a4 pageType:(id)a5 refApp:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v18[0] = CFSTR("eventType");
  v18[1] = CFSTR("pageId");
  v19[0] = CFSTR("page");
  v19[1] = a3;
  v18[2] = CFSTR("pageContext");
  v18[3] = CFSTR("pageType");
  v19[2] = a4;
  v19[3] = a5;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  if (v10)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("refApp"));
  v17 = (void *)objc_msgSend(v16, "copy");
  -[GKAPIReporter sendMetrics:](self, "sendMetrics:", v17);

}

- (void)recordPageWithID:(id)a3 pageContext:(id)a4 pageType:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("eventType");
  v13[1] = CFSTR("pageId");
  v14[0] = CFSTR("page");
  v14[1] = a3;
  v13[2] = CFSTR("pageContext");
  v13[3] = CFSTR("pageType");
  v14[2] = a4;
  v14[3] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKAPIReporter sendMetrics:](self, "sendMetrics:", v12);
}

- (void)recordMultiplayerActivityMetrics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKAPIReporter utilityService](self, "utilityService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportMultiplayerActivityMetricsEvent:", v4);

}

- (void)recordMultiplayerErrorID:(id)a3
{
  -[GKAPIReporter recordPageWithID:pageContext:pageType:](self, "recordPageWithID:pageContext:pageType:", a3, CFSTR("multiplayer"), CFSTR("error"));
}

- (void)recordLoadUrlMetrics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKAPIReporter utilityService](self, "utilityService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportLoadUrlMetricsEvent:", v4);

}

- (void)recordInviteFriendClickEventWithPageType:(id)a3 pageId:(id)a4 pushBased:(BOOL)a5 knownRecipient:(BOOL)a6 location:(id)a7
{
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a6)
    v10 = CFSTR("invite");
  else
    v10 = CFSTR("inviteOthers");
  if (a5)
    v11 = CFSTR("add");
  else
    v11 = CFSTR("navigate");
  v18 = CFSTR("location");
  v19[0] = a7;
  v12 = (void *)MEMORY[0x1E0C99D80];
  if (a5)
    v13 = CFSTR("button");
  else
    v13 = CFSTR("link");
  v14 = a7;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKAPIReporter recordClickWithAction:targetId:targetType:pageId:pageType:additionalFields:](self, "recordClickWithAction:targetId:targetType:pageId:pageType:additionalFields:", v11, v10, v13, v15, v16, v17);
}

- (void)sendMetrics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKAPIReporter utilityService](self, "utilityService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportMetricsEventWithTopic:shouldFlush:metricsFields:", CFSTR("xp_amp_gc_cs"), MEMORY[0x1E0C9AAA0], v4);

}

- (void)sendPerformanceMetrics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKAPIReporter utilityService](self, "utilityService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportPerformanceMetricsEvent:", v4);

}

- (id)utilityService
{
  void *v2;
  void *v3;

  GKGetRuntimeStrategy();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "utilityService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
