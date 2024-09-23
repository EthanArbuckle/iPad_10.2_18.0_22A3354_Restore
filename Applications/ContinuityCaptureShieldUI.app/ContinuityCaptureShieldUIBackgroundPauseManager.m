@implementation ContinuityCaptureShieldUIBackgroundPauseManager

+ (id)sharedInstance
{
  if (qword_100020090 != -1)
    dispatch_once(&qword_100020090, &stru_100018808);
  return (id)qword_100020088;
}

- (void)requestDefaultScreenPauseEvent:(int64_t)a3
{
  int BoolAnswer;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  ContinuityCaptureShieldUIBackgroundPauseManager *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;

  BoolAnswer = AVGestaltGetBoolAnswer(AVGQBPMGIAYPLJA32XFRAAWDO5G4G4, a2);
  v6 = sub_100007074();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136316162;
    v10 = "-[ContinuityCaptureShieldUIBackgroundPauseManager requestDefaultScreenPauseEvent:]";
    v11 = 2048;
    v12 = self;
    v13 = 2048;
    v14 = a3;
    v15 = 1024;
    v16 = BoolAnswer;
    v17 = 1024;
    v18 = BoolAnswer;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: <%p> Called pauseEvent:%zu. Ignoring event: %d. supportsCCMultitasking:%d", (uint8_t *)&v9, 0x2Cu);
  }

  if ((BoolAnswer & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance"));
    objc_msgSend(v8, "pauseSessionForEvent:", a3);

  }
}

- (void)requestDefaultScreenResumeEvent:(int64_t)a3
{
  int BoolAnswer;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  ContinuityCaptureShieldUIBackgroundPauseManager *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;

  BoolAnswer = AVGestaltGetBoolAnswer(AVGQBPMGIAYPLJA32XFRAAWDO5G4G4, a2);
  v6 = sub_100007074();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136316162;
    v10 = "-[ContinuityCaptureShieldUIBackgroundPauseManager requestDefaultScreenResumeEvent:]";
    v11 = 2048;
    v12 = self;
    v13 = 2048;
    v14 = a3;
    v15 = 1024;
    v16 = BoolAnswer;
    v17 = 1024;
    v18 = BoolAnswer;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: <%p> Called resumeEvent:%zu. Ignoring event: %d. supportsCCMultitasking:%d", (uint8_t *)&v9, 0x2Cu);
  }

  if ((BoolAnswer & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance"));
    objc_msgSend(v8, "resumeStreamingForEvent:", a3);

  }
}

@end
