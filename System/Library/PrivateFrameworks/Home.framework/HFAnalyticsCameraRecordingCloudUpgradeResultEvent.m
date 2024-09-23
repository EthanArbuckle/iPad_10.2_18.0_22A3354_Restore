@implementation HFAnalyticsCameraRecordingCloudUpgradeResultEvent

- (HFAnalyticsCameraRecordingCloudUpgradeResultEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  HFAnalyticsCameraRecordingCloudUpgradeResultEvent *v14;
  objc_super v16;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCameras"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("Error: HFAnalyticsNumCamerasKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerPresented"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    NSLog(CFSTR("Error: HFAnalyticsOfferPresentedKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iCloudUpgradeState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    NSLog(CFSTR("Error: HFAnalyticsiCloudUpgradeStateKey is nil"));
  v16.receiver = self;
  v16.super_class = (Class)HFAnalyticsCameraRecordingCloudUpgradeResultEvent;
  v14 = -[HFAnalyticsEvent initWithEventType:](&v16, sel_initWithEventType_, 2);
  if (v14)
  {
    v14->_numCamerasWithRecording = objc_msgSend(v7, "integerValue");
    v14->_iCloudUpgradeOfferPresented = objc_msgSend(v10, "integerValue");
    v14->_iCloudPlanUpgradeState = objc_msgSend(v13, "integerValue");
  }

  return v14;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsCameraRecordingCloudUpgradeResultEvent;
  -[HFAnalyticsEvent payload](&v9, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFAnalyticsCameraRecordingCloudUpgradeResultEvent numCamerasWithRecording](self, "numCamerasWithRecording"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("numCamerasWithRecording"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFAnalyticsCameraRecordingCloudUpgradeResultEvent iCloudUpgradeOfferPresented](self, "iCloudUpgradeOfferPresented"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("iCloudUpgradeOfferPresented"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFAnalyticsCameraRecordingCloudUpgradeResultEvent iCloudPlanUpgradeState](self, "iCloudPlanUpgradeState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("iCloudPlanUpgradeState"));

  return v4;
}

- (unint64_t)numCamerasWithRecording
{
  return self->_numCamerasWithRecording;
}

- (void)setNumCamerasWithRecording:(unint64_t)a3
{
  self->_numCamerasWithRecording = a3;
}

- (unint64_t)iCloudUpgradeOfferPresented
{
  return self->_iCloudUpgradeOfferPresented;
}

- (void)setICloudUpgradeOfferPresented:(unint64_t)a3
{
  self->_iCloudUpgradeOfferPresented = a3;
}

- (unint64_t)iCloudPlanUpgradeState
{
  return self->_iCloudPlanUpgradeState;
}

- (void)setICloudPlanUpgradeState:(unint64_t)a3
{
  self->_iCloudPlanUpgradeState = a3;
}

@end
