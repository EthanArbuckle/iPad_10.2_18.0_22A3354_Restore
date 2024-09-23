@implementation IRSessionAnalytics

- (IRSessionAnalytics)initWithQueue:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  IRSessionAnalytics *v8;
  IRSessionAnalytics *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRSessionAnalytics;
  v8 = -[IRSessionAnalytics init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IRSessionAnalytics setQueue:](v8, "setQueue:", v6);
    -[IRSessionAnalytics setService:](v9, "setService:", v7);
  }

  return v9;
}

- (void)event:(id)a3 forCandidate:(id)a4 miloPrediction:(id)a5 systemState:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;

  v14 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[IRSessionAnalytics queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  if (objc_msgSend(v12, "isBannerEvent"))
    -[IRSessionAnalytics _handleBannerEvent:withCandidate:WithMiLoPrediction:systemState:](self, "_handleBannerEvent:withCandidate:WithMiLoPrediction:systemState:", v12, v11, v14, v10);
  else
    -[IRSessionAnalytics _handleNonBannerEvent:forCandidate:forceStopSession:](self, "_handleNonBannerEvent:forCandidate:forceStopSession:", v12, v11, 0);

}

- (void)contextChangedWithReason:(id)a3 systemState:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[IRSessionAnalytics queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (((objc_msgSend(v8, "isEqual:", CFSTR("Output device")) & 1) != 0
     || objc_msgSend(v8, "isEqual:", CFSTR("Predicted output device")))
    && -[IRSessionAnalytics _isSessionOngoing](self, "_isSessionOngoing")
    && objc_msgSend(v6, "isHeadphonesRoutedOrPredicted"))
  {
    -[IRSessionAnalytics _stopSessionAndSendCA:](self, "_stopSessionAndSendCA:", 3);
  }

}

- (void)_handleBannerEvent:(id)a3 withCandidate:(id)a4 WithMiLoPrediction:(id)a5 systemState:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  IRTimer *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  IRTimer *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v10 = a4;
  v28 = a5;
  v11 = a6;
  if (-[IRSessionAnalytics _isSessionOngoing](self, "_isSessionOngoing"))
    -[IRSessionAnalytics _stopSessionAndSendCA:](self, "_stopSessionAndSendCA:", 6);
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    objc_msgSend(v29, "eventType");
    IRMediaEventTypeToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidateIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v28, "canUse"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "isHeadphonesRoutedOrPredicted"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v33 = "#session-analytics, ";
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v15;
    v38 = 2112;
    v39 = v16;
    v40 = 2112;
    v41 = v17;
    v42 = 2112;
    v43 = v18;
    _os_log_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_INFO, "%s[%@], Starting with eventType: %@, candidateIdentifier: %@, miloCanUse: %@, isHeadphonesRoutedOrPredicted: %@", buf, 0x3Eu);

  }
  -[IRSessionAnalytics setBannerEvent:](self, "setBannerEvent:", v29);
  -[IRSessionAnalytics setBannerCandidate:](self, "setBannerCandidate:", v10);
  -[IRSessionAnalytics setBannerMiLoPrediction:](self, "setBannerMiLoPrediction:", v28);
  if (objc_msgSend(v11, "isHeadphonesRoutedOrPredicted")
    || !v10
    || (objc_msgSend(v10, "candidateIdentifier"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = v19 == 0,
        v19,
        v20))
  {
    -[IRSessionAnalytics _stopSessionAndSendCA:](self, "_stopSessionAndSendCA:", 7);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v21 = [IRTimer alloc];
    +[IRPreferences shared](IRPreferences, "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "coreAnalyticsSessionPeriodInSeconds");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    -[IRSessionAnalytics queue](self, "queue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __86__IRSessionAnalytics__handleBannerEvent_withCandidate_WithMiLoPrediction_systemState___block_invoke;
    v30[3] = &unk_251043FF8;
    objc_copyWeak(&v31, (id *)buf);
    v27 = -[IRTimer initWithInterval:repeats:queue:block:](v21, "initWithInterval:repeats:queue:block:", 0, v26, v30, v25);
    -[IRSessionAnalytics setTimer:](self, "setTimer:", v27);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }

}

void __86__IRSessionAnalytics__handleBannerEvent_withCandidate_WithMiLoPrediction_systemState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleSessionTimeout");
    WeakRetained = v2;
  }

}

- (void)_handleNonBannerEvent:(id)a3 forCandidate:(id)a4 forceStopSession:(BOOL)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  if (-[IRSessionAnalytics _isSessionOngoing](self, "_isSessionOngoing"))
  {
    +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v22, "isEqual:", v9);

    +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v22, "isEqual:", v11);

    if ((v10 & 1) != 0 || v12)
    {
      -[IRSessionAnalytics setChosenCandidate:](self, "setChosenCandidate:", v8);
      if (!v10 || a5)
      {
        -[IRSessionAnalytics bannerCandidate](self, "bannerCandidate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "candidateIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRSessionAnalytics chosenCandidate](self, "chosenCandidate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "candidateIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isEqual:", v16);

        if (!v8)
          goto LABEL_16;
        v18 = 4;
        if (!v17)
          v18 = 5;
        v19 = 1;
        if (!v17)
          v19 = 2;
        v20 = v10 ? v18 : v19;
        objc_msgSend(v8, "candidateIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
LABEL_16:
          v20 = 7;
        -[IRSessionAnalytics _stopSessionAndSendCA:](self, "_stopSessionAndSendCA:", v20);
      }
      else
      {
        -[IRSessionAnalytics setPlaybackStartEvent:](self, "setPlaybackStartEvent:", v22);
      }
    }
  }

}

- (void)_handleSessionTimeout
{
  void *v3;
  void *v4;
  id v5;

  -[IRSessionAnalytics playbackStartEvent](self, "playbackStartEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IRSessionAnalytics playbackStartEvent](self, "playbackStartEvent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[IRSessionAnalytics chosenCandidate](self, "chosenCandidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionAnalytics _handleNonBannerEvent:forCandidate:forceStopSession:](self, "_handleNonBannerEvent:forCandidate:forceStopSession:", v5, v4, 1);

  }
  else
  {
    -[IRSessionAnalytics _stopSessionAndSendCA:](self, "_stopSessionAndSendCA:", 0);
  }
}

- (BOOL)_isSessionOngoing
{
  void *v2;
  BOOL v3;

  -[IRSessionAnalytics timer](self, "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_stopSessionAndSendCA:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IRSessionAnalyticsMetric *v15;
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
  void *v32;
  void *v33;
  IRSessionAnalyticsMetric *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *log;
  os_log_t loga;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    log = v6;
    -[IRSessionAnalytics bannerEvent](self, "bannerEvent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "eventType");
    IRMediaEventTypeToString();
    v47 = a3;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionAnalytics bannerCandidate](self, "bannerCandidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidateIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSessionAnalytics chosenCandidate](self, "chosenCandidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidateIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IRSessionAnalyticsMetricPostBannerInteractionToString(v47);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD16E0];
    -[IRSessionAnalytics bannerEvent](self, "bannerEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isOutsideApp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316674;
    v50 = "#session-analytics, ";
    v51 = 2112;
    v52 = v5;
    v53 = 2112;
    v54 = v41;
    v55 = 2112;
    v56 = v8;
    v57 = 2112;
    v58 = v10;
    v59 = 2112;
    v60 = v11;
    v61 = 2112;
    v62 = v14;
    _os_log_impl(&dword_23FFBA000, log, OS_LOG_TYPE_INFO, "%s[%@], Stopping with eventType: %@, bannerCandidateIdentifier: %@, chosenCandidateIdentifier: %@, postBannerInteraction: %@, isOutsideApp: %@", buf, 0x48u);

    a3 = v47;
  }

  v15 = [IRSessionAnalyticsMetric alloc];
  -[IRSessionAnalytics service](self, "service");
  loga = (os_log_t)objc_claimAutoreleasedReturnValue();
  -[NSObject clientIdentifier](loga, "clientIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[IRSessionAnalytics bannerEvent](self, "bannerEvent");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bundleID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithInteger:", +[IRAnalyticsUtilities getRedactedBundleID:](IRAnalyticsUtilities, "getRedactedBundleID:", v40));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[IRSessionAnalytics bannerEvent](self, "bannerEvent");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", IRSessionAnalyticsMetricEventTypeFromEvent(objc_msgSend(v39, "eventType")));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[IRSessionAnalytics bannerMiLoPrediction](self, "bannerMiLoPrediction");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithBool:", objc_msgSend(v38, "canUse"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionAnalytics bannerCandidate](self, "bannerCandidate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAnalyticsUtilities candidateTypeForCandidate:](IRAnalyticsUtilities, "candidateTypeForCandidate:", v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionAnalytics bannerCandidate](self, "bannerCandidate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAnalyticsUtilities candidateModelTypeForCandidate:](IRAnalyticsUtilities, "candidateModelTypeForCandidate:", v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionAnalytics chosenCandidate](self, "chosenCandidate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAnalyticsUtilities candidateTypeForCandidate:](IRAnalyticsUtilities, "candidateTypeForCandidate:", v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionAnalytics chosenCandidate](self, "chosenCandidate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAnalyticsUtilities candidateModelTypeForCandidate:](IRAnalyticsUtilities, "candidateModelTypeForCandidate:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD16E0];
  -[IRSessionAnalytics bannerEvent](self, "bannerEvent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberWithBool:", objc_msgSend(v25, "isOutsideApp"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[IRSessionAnalyticsMetric initWithClientIdentifier:internalAppName:eventType:miloAvailable:bannerCandidateType:bannerCandidateModelType:chosenCandidateType:chosenCandidateModelType:postBannerInteraction:isOutsideApp:](v15, "initWithClientIdentifier:internalAppName:eventType:miloAvailable:bannerCandidateType:bannerCandidateModelType:chosenCandidateType:chosenCandidateModelType:postBannerInteraction:isOutsideApp:", v48, v46, v35, v19, v32, v31, v20, v22, v23, v26);

  -[IRSessionAnalyticsMetric name](v34, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionAnalytics service](self, "service");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "clientIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSessionAnalyticsMetric dictionaryRepresentation](v34, "dictionaryRepresentation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAnalyticsManager sendEventLazyForEventIdentifier:clientIdentifier:analytics:](IRAnalyticsManager, "sendEventLazyForEventIdentifier:clientIdentifier:analytics:", v27, v29, v30);

  -[IRSessionAnalytics _invalidate](self, "_invalidate");
}

- (void)_invalidate
{
  void *v3;

  -[IRSessionAnalytics timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[IRSessionAnalytics setTimer:](self, "setTimer:", 0);
  -[IRSessionAnalytics setBannerEvent:](self, "setBannerEvent:", 0);
  -[IRSessionAnalytics setBannerCandidate:](self, "setBannerCandidate:", 0);
  -[IRSessionAnalytics setBannerMiLoPrediction:](self, "setBannerMiLoPrediction:", 0);
  -[IRSessionAnalytics setChosenCandidate:](self, "setChosenCandidate:", 0);
  -[IRSessionAnalytics setPlaybackStartEvent:](self, "setPlaybackStartEvent:", 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IRServiceDO)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (IRTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (IREventDO)bannerEvent
{
  return self->_bannerEvent;
}

- (void)setBannerEvent:(id)a3
{
  objc_storeStrong((id *)&self->_bannerEvent, a3);
}

- (IRCandidateDO)bannerCandidate
{
  return self->_bannerCandidate;
}

- (void)setBannerCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_bannerCandidate, a3);
}

- (IRMiloLslPredictionDO)bannerMiLoPrediction
{
  return self->_bannerMiLoPrediction;
}

- (void)setBannerMiLoPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_bannerMiLoPrediction, a3);
}

- (IRCandidateDO)chosenCandidate
{
  return self->_chosenCandidate;
}

- (void)setChosenCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_chosenCandidate, a3);
}

- (IREventDO)playbackStartEvent
{
  return self->_playbackStartEvent;
}

- (void)setPlaybackStartEvent:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStartEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackStartEvent, 0);
  objc_storeStrong((id *)&self->_chosenCandidate, 0);
  objc_storeStrong((id *)&self->_bannerMiLoPrediction, 0);
  objc_storeStrong((id *)&self->_bannerCandidate, 0);
  objc_storeStrong((id *)&self->_bannerEvent, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
