@implementation NTKFaceSupportPartialNotificationPresentationEvent

- (NTKFaceSupportPartialNotificationPresentationEvent)initWithIdentifier:(id)a3 pushDate:(id)a4
{
  id v6;
  id v7;
  NTKFaceSupportPartialNotificationPresentationEvent *v8;
  NTKFaceSupportPartialNotificationPresentationEvent *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSDate *creationDate;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length")
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("NTKFaceSupportPartialNotificationPresentationEventInvalidIdentifier")) & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKFaceSupportPartialNotificationPresentationEvent;
    v9 = -[NTKFaceSupportPartialNotificationPresentationEvent init](&v15, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v6, "copy");
      identifier = v9->_identifier;
      v9->_identifier = (NSString *)v10;

      objc_storeStrong((id *)&v9->_pushDate, a4);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = objc_claimAutoreleasedReturnValue();
      creationDate = v9->_creationDate;
      v9->_creationDate = (NSDate *)v12;

    }
    self = v9;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NTKFaceSupportPartialNotificationPresentationEvent)presentationEventWithStatus:(int64_t)a3 artworkUsed:(int64_t)a4 errorCode:(int64_t)a5 optOutStatus:(int64_t)a6
{
  NTKFaceSupportNotificationPresentationEvent *v6;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  if (a3 == 777777)
  {
    v6 = 0;
  }
  else
  {
    -[NTKFaceSupportPartialNotificationPresentationEvent identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSupportPartialNotificationPresentationEvent pushDate](self, "pushDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSupportPartialNotificationPresentationEvent creationDate](self, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v14);
    v17 = v16;
    objc_msgSend(v13, "timeIntervalSinceDate:", v15);
    v6 = -[NTKFaceSupportNotificationPresentationEvent initWithBundleIdentifier:status:artworkUsed:delayFromServerPush:delayFromBundleUnlock:schedulingErrorCode:optOutSources:]([NTKFaceSupportNotificationPresentationEvent alloc], "initWithBundleIdentifier:status:artworkUsed:delayFromServerPush:delayFromBundleUnlock:schedulingErrorCode:optOutSources:", v12, a3, a4, a5, a6, v17, v18);

  }
  return (NTKFaceSupportPartialNotificationPresentationEvent *)v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)pushDate
{
  return self->_pushDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pushDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
