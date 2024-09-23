@implementation SRPreSynthesisTask

- (SRPreSynthesisTask)init
{
  SRPreSynthesisTask *v2;
  uint64_t v3;
  AFVoiceInfo *outputVoice;
  SiriTTSDaemonSession *v5;
  SiriTTSDaemonSession *speechSynthesizer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SRPreSynthesisTask;
  v2 = -[SRPreSynthesisTask init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[AFConnection outputVoice](AFConnection, "outputVoice"));
    outputVoice = v2->_outputVoice;
    v2->_outputVoice = (AFVoiceInfo *)v3;

    v5 = (SiriTTSDaemonSession *)objc_alloc_init((Class)SiriTTSDaemonSession);
    speechSynthesizer = v2->_speechSynthesizer;
    v2->_speechSynthesizer = v5;

  }
  return v2;
}

- (void)setPreSynthesizeTTSCommand:(id)a3
{
  SAPreSynthesizeTTS *v5;
  SAPreSynthesizeTTS **p_preSynthesizeTTSCommand;
  NSMutableArray *preSynthesizedTTSAudioDurations;
  NSArray *parsedDialogStringsForPreSynthesis;
  NSMutableDictionary *parsedDialogStringIndicies;
  NSError *currentError;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  id v20;
  __int128 v21;
  NSMutableDictionary *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  NSMutableArray *v41;
  void *v42;
  id v43;
  unint64_t v44;
  void *v45;
  id v46;
  SAPreSynthesizeTTS *preSynthesizeTTSCommand;
  NSObject *v48;
  void *v49;
  NSMutableDictionary *v50;
  __int128 v51;
  void *v52;
  SAPreSynthesizeTTS *v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  NSMutableDictionary *v62;

  v5 = (SAPreSynthesizeTTS *)a3;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    sub_1000A0458();
  p_preSynthesizeTTSCommand = &self->_preSynthesizeTTSCommand;
  if (self->_preSynthesizeTTSCommand != v5)
  {
    objc_storeStrong((id *)&self->_preSynthesizeTTSCommand, a3);
    preSynthesizedTTSAudioDurations = self->_preSynthesizedTTSAudioDurations;
    self->_preSynthesizedTTSAudioDurations = 0;

    parsedDialogStringsForPreSynthesis = self->_parsedDialogStringsForPreSynthesis;
    self->_parsedDialogStringsForPreSynthesis = 0;

    parsedDialogStringIndicies = self->_parsedDialogStringIndicies;
    self->_parsedDialogStringIndicies = 0;

    currentError = self->_currentError;
    self->_currentError = 0;

    if (self->_preSynthesizeTTSCommand)
    {
      v53 = v5;
      v11 = objc_alloc((Class)NSLocale);
      v12 = AFUIGetLanguageCode();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_msgSend(v11, "initWithLocaleIdentifier:", v13);

      v52 = v14;
      v15 = objc_msgSend(objc_alloc((Class)AFSpeakableUtteranceParser), "initWithLocale:", v14);
      objc_msgSend(v15, "setHandleTTSCodes:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v18 = self->_parsedDialogStringIndicies;
      self->_parsedDialogStringIndicies = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
      v20 = objc_msgSend(v19, "count");

      v22 = 0;
      if (v20)
      {
        v23 = 0;
        *(_QWORD *)&v21 = 136315906;
        v51 = v21;
        do
        {

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](*p_preSynthesizeTTSCommand, "dialogStrings"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v23));

          v54 = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parseStringWithFormat:error:", v25, &v54));
          v22 = (NSMutableDictionary *)v54;
          if (objc_msgSend(v26, "length"))
          {
            objc_msgSend(v16, "addObject:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v23));
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parsedDialogStringIndicies, "setObject:forKeyedSubscript:", v27, v26);

          }
          if (v22)
          {
            v28 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              v31 = v28;
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](v53, "dialogStrings"));
              *(_DWORD *)buf = v51;
              v56 = "-[SRPreSynthesisTask setPreSynthesizeTTSCommand:]";
              v57 = 2114;
              v58 = v32;
              v59 = 2114;
              v60 = v15;
              v61 = 2114;
              v62 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s #presynthesize Speakable utterance parser failed to parse presynthesis dialogStrings. (speakableText = %{public}@, speakableUtteranceParser = %{public}@, error = %{public}@)", buf, 0x2Au);

            }
          }

          ++v23;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](*p_preSynthesizeTTSCommand, "dialogStrings"));
          v30 = objc_msgSend(v29, "count");

        }
        while (v23 < (unint64_t)v30);
      }
      v33 = objc_msgSend(v16, "count", v51);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](*p_preSynthesizeTTSCommand, "dialogStrings"));
      if (v33 == objc_msgSend(v34, "count"))
      {
        v35 = -[NSMutableDictionary count](self->_parsedDialogStringIndicies, "count");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
        v37 = objc_msgSend(v36, "count");

        if (v35 == v37)
        {
LABEL_19:
          if (objc_msgSend(v16, "count"))
            objc_storeStrong((id *)&self->_parsedDialogStringsForPreSynthesis, v16);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
          v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v39, "count")));
          v41 = self->_preSynthesizedTTSAudioDurations;
          self->_preSynthesizedTTSAudioDurations = v40;

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
          v43 = objc_msgSend(v42, "count");

          if (v43)
          {
            v44 = 0;
            do
            {
              -[NSMutableArray setObject:atIndexedSubscript:](self->_preSynthesizedTTSAudioDurations, "setObject:atIndexedSubscript:", &off_100128B40, v44++);
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
              v46 = objc_msgSend(v45, "count");

            }
            while (v44 < (unint64_t)v46);
          }

          v5 = v53;
          goto LABEL_25;
        }
      }
      else
      {

      }
      v38 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        preSynthesizeTTSCommand = self->_preSynthesizeTTSCommand;
        v48 = v38;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](preSynthesizeTTSCommand, "dialogStrings"));
        v50 = self->_parsedDialogStringIndicies;
        *(_DWORD *)buf = 136315906;
        v56 = "-[SRPreSynthesisTask setPreSynthesizeTTSCommand:]";
        v57 = 2114;
        v58 = v49;
        v59 = 2114;
        v60 = v16;
        v61 = 2114;
        v62 = v50;
        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s #presynthesize Failed to generate same number of utterances for dialogStrings = %{public}@, parsedDialogs = %{public}@, _parsedDialogStringIndicies = %{public}@)", buf, 0x2Au);

      }
      goto LABEL_19;
    }
  }
LABEL_25:

}

- (SAAceCommand)replyAceCommand
{
  SAPreSynthesizeTTS **p_preSynthesizeTTSCommand;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  SAPreSynthesizeTTS *v9;
  void *v10;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  int v17;
  const char *v18;
  __int16 v19;
  SAPreSynthesizeTTS *v20;

  p_preSynthesizeTTSCommand = &self->_preSynthesizeTTSCommand;
  if (!self->_preSynthesizeTTSCommand || -[NSMutableDictionary count](self->_parsedDialogStringIndicies, "count"))
  {
    v4 = 0;
    return (SAAceCommand *)v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS aceAudioData](*p_preSynthesizeTTSCommand, "aceAudioData"));
  if (v5)
  {

LABEL_7:
    v7 = AFSiriLogContextConnection;
    if (self->_currentError)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        sub_1000A04C4((uint64_t *)p_preSynthesizeTTSCommand, v7);
      v8 = (objc_class *)SACommandFailed;
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *p_preSynthesizeTTSCommand;
        v17 = 136315394;
        v18 = "-[SRPreSynthesisTask replyAceCommand]";
        v19 = 2112;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s PreSynthesizeTTS command (%@) succeeded", (uint8_t *)&v17, 0x16u);
      }
      v8 = (objc_class *)SACommandSucceeded;
    }
    v4 = objc_alloc_init(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS aceId](*p_preSynthesizeTTSCommand, "aceId"));
    objc_msgSend(v4, "setRefId:", v10);

    return (SAAceCommand *)v4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS streamIds](*p_preSynthesizeTTSCommand, "streamIds"));

  if (v6)
    goto LABEL_7;
  v4 = objc_alloc_init((Class)SAPreSynthesizeTTSCompleted);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS aceId](self->_preSynthesizeTTSCommand, "aceId"));
  objc_msgSend(v4, "setRefId:", v12);

  if (-[NSMutableArray count](self->_preSynthesizedTTSAudioDurations, "count"))
  {
    v13 = 0;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_preSynthesizedTTSAudioDurations, "objectAtIndexedSubscript:", v13));
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      if (v16 < 0.0)
        -[NSMutableArray setObject:atIndexedSubscript:](self->_preSynthesizedTTSAudioDurations, "setObject:atIndexedSubscript:", &off_100128B50, v13);
      ++v13;
    }
    while (v13 < (unint64_t)-[NSMutableArray count](self->_preSynthesizedTTSAudioDurations, "count"));
  }
  objc_msgSend(v4, "setApproximateSpeechDuration:", self->_preSynthesizedTTSAudioDurations);
  return (SAAceCommand *)v4;
}

- (BOOL)handlePreSynthesisCommandWithError:(id *)a3
{
  SRPreSynthesisTask *v4;
  NSObject *v5;
  id *p_preSynthesizeTTSCommand;
  NSArray *v7;
  id *p_parsedDialogStringsForPreSynthesis;
  NSArray *parsedDialogStringsForPreSynthesis;
  NSArray *v10;
  __int128 v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSError *v26;
  NSError *currentError;
  BOOL v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  SiriTTSDaemonSession *speechSynthesizer;
  id v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSError *v58;
  NSError *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  BOOL v69;
  NSObject *v70;
  __int128 v72;
  id *v73;
  uint64_t v74;
  _QWORD v76[4];
  id v77;
  _BYTE *v78;
  id v79;
  id location;
  _QWORD v81[5];
  _BYTE buf[24];
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint8_t v86[4];
  uint64_t v87;

  v4 = self;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    sub_1000A06E8(v5);
    v4 = self;
  }
  v73 = a3;
  if (a3)
  {
    if (*a3)
      *a3 = 0;
    p_preSynthesizeTTSCommand = (id *)&v4->_preSynthesizeTTSCommand;
    if (v4->_preSynthesizeTTSCommand)
    {
      parsedDialogStringsForPreSynthesis = v4->_parsedDialogStringsForPreSynthesis;
      p_parsedDialogStringsForPreSynthesis = (id *)&v4->_parsedDialogStringsForPreSynthesis;
      v7 = parsedDialogStringsForPreSynthesis;
      if (!parsedDialogStringsForPreSynthesis)
      {
        *v73 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kAFAssistantErrorDomain, 11, &__NSDictionary0__struct));
LABEL_49:
        v50 = AFSiriLogContextConnection;
        v42 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
        if (!v42)
          return v42;
        sub_1000A05BC(v50, v51, v52, v53, v54, v55, v56, v57);
        goto LABEL_55;
      }
      goto LABEL_11;
    }
    *v73 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kAFAssistantErrorDomain, 11, &__NSDictionary0__struct));
LABEL_47:
    v41 = AFSiriLogContextConnection;
    v42 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
    if (!v42)
      return v42;
    sub_1000A054C(v41, v43, v44, v45, v46, v47, v48, v49);
    goto LABEL_55;
  }
  p_preSynthesizeTTSCommand = (id *)&v4->_preSynthesizeTTSCommand;
  if (!v4->_preSynthesizeTTSCommand)
    goto LABEL_47;
  v10 = v4->_parsedDialogStringsForPreSynthesis;
  p_parsedDialogStringsForPreSynthesis = (id *)&v4->_parsedDialogStringsForPreSynthesis;
  v7 = v10;
  if (!v10)
    goto LABEL_49;
LABEL_11:
  if (-[NSArray count](v7, "count"))
  {
    if (objc_msgSend(*p_parsedDialogStringsForPreSynthesis, "count"))
    {
      v12 = 0;
      v74 = kAFAssistantErrorDomain;
      *(_QWORD *)&v11 = 136315650;
      v72 = v11;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "aceAudioData", v72));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "aceAudioData"));
          if (v12 >= (unint64_t)objc_msgSend(v14, "count"))
          {
            v16 = 0;
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "aceAudioData"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v12));

          }
        }
        else
        {
          v16 = 0;
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "streamIds"));
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "streamIds"));
          if (v12 >= (unint64_t)objc_msgSend(v18, "count"))
          {
            v22 = 0;
          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "streamIds"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v12));
            if (objc_msgSend(v20, "length"))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "streamIds"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v12));

            }
            else
            {
              v22 = 0;
            }

          }
        }
        else
        {
          v22 = 0;
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_parsedDialogStringsForPreSynthesis, "objectAtIndexedSubscript:", v12));
        if (!objc_msgSend(v23, "length"))
        {
          v25 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            sub_1000A069C(v86, &v87, v25);
          v26 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v74, 11, &__NSDictionary0__struct));
          currentError = self->_currentError;
          self->_currentError = v26;
          goto LABEL_37;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "audioBuffer"));
        if (objc_msgSend(v24, "length"))
        {

        }
        else
        {
          v28 = objc_msgSend(v22, "length") == 0;

          if (v28)
          {
            v29 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v30 = *p_preSynthesizeTTSCommand;
              v31 = v29;
              v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "speakableContextInfo"));
              *(_DWORD *)buf = v72;
              *(_QWORD *)&buf[4] = "-[SRPreSynthesisTask handlePreSynthesisCommandWithError:]";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v23;
              *(_WORD *)&buf[22] = 2112;
              v83 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Presynthesizing text:%@, context:%@)", buf, 0x20u);

            }
            v33 = objc_alloc((Class)SiriTTSSynthesisVoice);
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo languageCode](self->_outputVoice, "languageCode"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo name](self->_outputVoice, "name"));
            currentError = (NSError *)objc_msgSend(v33, "initWithLanguage:name:", v34, v35);

            v36 = objc_msgSend(objc_alloc((Class)SiriTTSSynthesisRequest), "initWithText:voice:", v23, currentError);
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS speakableContextInfo](self->_preSynthesizeTTSCommand, "speakableContextInfo"));
            objc_msgSend(v36, "setContextInfo:", v37);

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v83 = sub_100062A44;
            v84 = sub_100062A54;
            v85 = 0;
            v81[0] = _NSConcreteStackBlock;
            v81[1] = 3221225472;
            v81[2] = sub_100062A5C;
            v81[3] = &unk_100123ED8;
            v81[4] = buf;
            objc_msgSend(v36, "setDidReportInstrument:", v81);
            objc_initWeak(&location, self);
            speechSynthesizer = self->_speechSynthesizer;
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472;
            v76[2] = sub_100062A6C;
            v76[3] = &unk_100123F00;
            objc_copyWeak(&v79, &location);
            v39 = v36;
            v77 = v39;
            v78 = buf;
            -[SiriTTSDaemonSession synthesizeWithRequest:didFinish:](speechSynthesizer, "synthesizeWithRequest:didFinish:", v39, v76);

            objc_destroyWeak(&v79);
            objc_destroyWeak(&location);
            _Block_object_dispose(buf, 8);

            goto LABEL_37;
          }
        }
        currentError = (NSError *)objc_msgSend(objc_alloc((Class)SiriTTSInlineStreamingSignal), "initWithText:identifier:", v23, v22);
        -[SiriTTSDaemonSession signalWithInlineStreaming:](self->_speechSynthesizer, "signalWithInlineStreaming:", currentError);
LABEL_37:

        ++v12;
      }
      while (v12 < (unint64_t)objc_msgSend(*p_parsedDialogStringsForPreSynthesis, "count"));
    }
    if (v73)
      *v73 = objc_retainAutorelease(self->_currentError);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "aceAudioData"));
    if (v40)
    {

    }
    else
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "streamIds"));
      v69 = v68 == 0;

      if (v69)
      {
        v70 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[SRPreSynthesisTask handlePreSynthesisCommandWithError:]";
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%s Defer calling completion for PreSynthesisTTS to SiriTTSDaemonSession didFinish callback", buf, 0xCu);
        }
        goto LABEL_58;
      }
    }
    (*((void (**)(void))self->_completion + 2))();
LABEL_58:
    LOBYTE(v42) = 1;
    return v42;
  }
  if (self->_completion)
  {
    v58 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kAFAssistantErrorDomain, 11, &__NSDictionary0__struct));
    v59 = self->_currentError;
    self->_currentError = v58;

    v60 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_1000A062C(v60, v61, v62, v63, v64, v65, v66, v67);
    (*((void (**)(void))self->_completion + 2))();
  }
LABEL_55:
  LOBYTE(v42) = 0;
  return v42;
}

- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SRPreSynthesisTask *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    sub_1000A0764();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100062BCC;
  v14[3] = &unk_100122C68;
  v15 = v8;
  v16 = self;
  v17 = v10;
  v18 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

- (SAPreSynthesizeTTS)preSynthesizeTTSCommand
{
  return self->_preSynthesizeTTSCommand;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setReplyAceCommand:(id)a3
{
  objc_storeStrong((id *)&self->_replyAceCommand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyAceCommand, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_preSynthesizeTTSCommand, 0);
  objc_storeStrong((id *)&self->_parsedDialogStringIndicies, 0);
  objc_storeStrong((id *)&self->_preSynthesizedTTSAudioDurations, 0);
  objc_storeStrong((id *)&self->_parsedDialogStringsForPreSynthesis, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_outputVoice, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

@end
