@implementation SRDismissalClassificationController

- (BOOL)_supportsMitigationOnSource:(int64_t)a3
{
  return ((unint64_t)a3 < 0x34) & (6uLL >> a3);
}

- (void)requestMitigationStatusBasedOnRequestClassification:(BOOL)a3 withRequestSource:(int64_t)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL8 v9;
  _BOOL8 v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;

  v6 = a3;
  v8 = a5;
  v9 = -[SRDismissalClassificationController _supportsMitigationOnSource:](self, "_supportsMitigationOnSource:", a4);
  v10 = v9;
  if (v6 && v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100064A10;
    v12[3] = &unk_100123F98;
    v12[4] = self;
    v13 = v8;
    v14 = 1;
    -[SRDismissalClassificationController queryStreamForCountOfEventsWithCompletion:](self, "queryStreamForCountOfEventsWithCompletion:", v12);

  }
  else if (v8)
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[SRDismissalClassificationController requestMitigationStatusBasedOnRequestClassification:withRequestSource:"
            "withCompletion:]";
      v17 = 1024;
      v18 = v6;
      v19 = 1024;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #HWButtonMitigation Mitigation not needed (unintended: %d, sourceSupportsMitigation: %d)", buf, 0x18u);
    }
    (*((void (**)(id, _QWORD, _BOOL8, _QWORD, _QWORD))v8 + 2))(v8, 0, v10, 0, 0);
  }

}

- (BOOL)shouldMitigateBasedOnActivationHistory:(id)a3
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;

  if (a3)
  {
    v3 = a3;
    v4 = objc_msgSend(v3, "countOfIntendedActivations");
    v5 = objc_msgSend(v3, "countOfUnintendedActivations");

    if (v4)
      v6 = 0;
    else
      v6 = (unint64_t)v5 > 9;
    v7 = v6;
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[SRDismissalClassificationController shouldMitigateBasedOnActivationHistory:]";
      v12 = 1024;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #HWButtonMitigation ShouldMitigate: %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)presentSurveyNotificationWithContext:(id)a3 activationHistory:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a5;
  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "isDeviceUnlocked"))
    v9 = 1;
  else
    v9 = 2;
  v10 = objc_msgSend(v8, "requestSource");
  v11 = objc_msgSend(v8, "dismissalReason");

  +[SRUIDSurveyNotificationUtility postSiriInternalUIDSurveyNotification:activationHistory:requestSource:dismissalReason:](SRUIDSurveyNotificationUtility, "postSiriInternalUIDSurveyNotification:activationHistory:requestSource:dismissalReason:", v9, v7, v10, v11);
  v12 = v13;
  if (v13)
  {
    (*((void (**)(id))v13 + 2))(v13);
    v12 = v13;
  }

}

- (BOOL)canPresentSurveyForContext:(id)a3
{
  unsigned int v3;
  unsigned int v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  unsigned int v14;

  v3 = +[SRUIDSurveyEnablementUtility meetsThresholdForPresenting](SRUIDSurveyEnablementUtility, "meetsThresholdForPresenting", a3);
  v4 = +[SRUIDSurveyEnablementUtility isSurveyEnabled](SRUIDSurveyEnablementUtility, "isSurveyEnabled");
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315906;
    v8 = "-[SRDismissalClassificationController canPresentSurveyForContext:]";
    v9 = 1024;
    v10 = v3 & v4;
    v11 = 1024;
    v12 = v4;
    v13 = 1024;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #survey: %{BOOL}d (surveyEnabled: %{BOOL}d meetsThreshold: %{BOOL}d)", (uint8_t *)&v7, 0x1Eu);
  }
  return v3 & v4;
}

- (id)duetSharedQueue
{
  if (qword_100150410 != -1)
    dispatch_once(&qword_100150410, &stru_100123FB8);
  return (id)qword_100150408;
}

- (void)recordDismissalEventWithContext:(id)a3 markAsUnintended:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];

  v4 = a4;
  v6 = a3;
  v25[0] = CFSTR("requestSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "requestSource")));
  v26[0] = v7;
  v25[1] = CFSTR("dismissalReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "dismissalReason")));
  v26[1] = v8;
  v25[2] = CFSTR("unintended");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v26[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams siriServiceStream](_DKSystemEventStreams, "siriServiceStream"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRDismissalClassificationController duetSharedQueue](self, "duetSharedQueue"));
  AFRecordCoreDuetEventWithStream(v13, CFSTR("com.apple.siri.ui.dismissal.duet"), v12, v10);

  v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136316162;
    v16 = "-[SRDismissalClassificationController recordDismissalEventWithContext:markAsUnintended:]";
    v17 = 2112;
    v18 = CFSTR("com.apple.siri.ui.dismissal.duet");
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #survey Sending event %@ to stream %@ with context: %@, metadata: %@", (uint8_t *)&v15, 0x34u);
  }

}

- (void)queryStreamForCountOfEventsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _DKKnowledgeQuerying *knowledgeStore;
  uint64_t v15;
  _DKKnowledgeQuerying **p_knowledgeStore;
  _DKKnowledgeQuerying *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _BYTE *v25;
  _BYTE buf[24];
  uint64_t v27;
  void *v28;
  void *v29;

  v4 = a3;
  v5 = objc_alloc_init((Class)_DKEventQuery);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams siriServiceStream](_DKSystemEventStreams, "siriServiceStream"));
  v29 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
  objc_msgSend(v5, "setEventStreams:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery startDateSortDescriptorAscending:](_DKQuery, "startDateSortDescriptorAscending:", 1));
  v28 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  objc_msgSend(v5, "setSortDescriptors:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", CFSTR("com.apple.siri.ui.dismissal.duet")));
  objc_msgSend(v5, "setPredicate:", v10);

  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SRDismissalClassificationController queryStreamForCountOfEventsWithCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #survey Starting query with query: %@", buf, 0x16u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v27 = 0;
  knowledgeStore = self->_knowledgeStore;
  if (!knowledgeStore)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStoreWithDirectReadOnlyAccess](_DKKnowledgeStore, "knowledgeStoreWithDirectReadOnlyAccess"));
    v17 = self->_knowledgeStore;
    p_knowledgeStore = &self->_knowledgeStore;
    *p_knowledgeStore = (_DKKnowledgeQuerying *)v15;

    knowledgeStore = *p_knowledgeStore;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000653D8;
  v21[3] = &unk_100123FE0;
  v18 = v12;
  v22 = v18;
  v19 = v13;
  v23 = v19;
  v25 = buf;
  v20 = v4;
  v24 = v20;
  -[_DKKnowledgeQuerying executeQuery:responseQueue:withCompletion:](knowledgeStore, "executeQuery:responseQueue:withCompletion:", v5, 0, v21);

  _Block_object_dispose(buf, 8);
}

- (void)recordDismissalMetricWithContext:(id)a3 inputType:(int64_t)a4 previousLongPressBehavior:(int64_t)a5 longPressBehavior:(int64_t)a6
{
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100065820;
  v10[3] = &unk_100124008;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a5;
  v9 = v11;
  AnalyticsSendEventLazy(CFSTR("com.apple.siri.dismissal.classification"), v10);

}

- (void)recordMitigationStartMetricWithContext:(id)a3 activationHistory:(id)a4 numberOfDaysSinceLastChange:(int64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  int64_t v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100065AE0;
  v9[3] = &unk_100124030;
  v11 = a3;
  v12 = a5;
  v10 = a4;
  v7 = v11;
  v8 = v10;
  AnalyticsSendEventLazy(CFSTR("com.apple.siri.button.mitigation.begin"), v9);

}

- (void)recordMitigationEndMetricWithContext:(id)a3 activationHistory:(id)a4 numberOfDaysSinceLastChange:(int64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  int64_t v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100065CD8;
  v9[3] = &unk_100124030;
  v11 = a3;
  v12 = a5;
  v10 = a4;
  v7 = v11;
  v8 = v10;
  AnalyticsSendEventLazy(CFSTR("com.apple.siri.button.mitigation.end"), v9);

}

- (BOOL)classifyRequestAsUnintendedWithContext:(id)a3
{
  id v4;
  unsigned int v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  uint64_t Name;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = -[SRDismissalClassificationController isDismissalReasonEligibleForSurvey:](self, "isDismissalReasonEligibleForSurvey:", objc_msgSend(v4, "dismissalReason"));
  v6 = objc_msgSend(v4, "contentPresentationState") != (id)2
    && (objc_msgSend(v4, "siriState") != (id)2 || objc_msgSend(v4, "dismissalReason") == (id)32)
    || objc_msgSend(v4, "dismissalReason") == (id)53;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    Name = SASDismissalReasonGetName(objc_msgSend(v4, "dismissalReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(Name);
    v12 = 136316162;
    v13 = "-[SRDismissalClassificationController classifyRequestAsUnintendedWithContext:]";
    v14 = 1024;
    v15 = v5;
    v16 = 2112;
    v17 = v10;
    v18 = 1024;
    v19 = v6;
    v20 = 2048;
    v21 = objc_msgSend(v4, "siriState");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s isDismissalReasonEligible: %d (%@), isEligibleBasedOnContentState: %d (%ld)", (uint8_t *)&v12, 0x2Cu);

  }
  return v6 & v5;
}

- (BOOL)isDismissalReasonEligibleForSurvey:(int64_t)a3
{
  return ((unint64_t)a3 > 0x1D) | (0x1FFCF8E7u >> a3) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
