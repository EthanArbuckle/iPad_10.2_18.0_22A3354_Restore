@implementation HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent

- (HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent *v11;
  HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceRecognitionNotificationAssociatePersonCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("HFAnalyticsFaceRecognitionNotificationAssociatePersonCountKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceRecognitionNotificationAssociatePersonSuccess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    NSLog(CFSTR("HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent's NSNumber wrapping BOOLean about open url success is nil"));
  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent;
  v11 = -[HFAnalyticsEvent initWithEventType:](&v14, sel_initWithEventType_, 5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_unknownPersonsTagCount, v6);
    objc_storeStrong((id *)&v12->_openURLSuccess, v9);
  }

  return v12;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent unknownPersonsTagCount](self, "unknownPersonsTagCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("faceRecognitionNotificationAssociatePersonCount"));

  -[HFAnalyticsFaceRecognitionNotificationAssociatePersonEvent openURLSuccess](self, "openURLSuccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("faceRecognitionNotificationAssociatePersonSuccess"));

  return v4;
}

- (NSNumber)unknownPersonsTagCount
{
  return self->_unknownPersonsTagCount;
}

- (void)setUnknownPersonsTagCount:(id)a3
{
  objc_storeStrong((id *)&self->_unknownPersonsTagCount, a3);
}

- (NSNumber)openURLSuccess
{
  return self->_openURLSuccess;
}

- (void)setOpenURLSuccess:(id)a3
{
  objc_storeStrong((id *)&self->_openURLSuccess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openURLSuccess, 0);
  objc_storeStrong((id *)&self->_unknownPersonsTagCount, 0);
}

@end
