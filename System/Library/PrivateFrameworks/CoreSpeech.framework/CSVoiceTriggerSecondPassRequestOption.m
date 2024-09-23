@implementation CSVoiceTriggerSecondPassRequestOption

- (CSVoiceTriggerSecondPassRequestOption)initWithFirstPassSource:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rejectionMHUUID:(id)a7 isSecondChanceRun:(BOOL)a8 firstpassMetrics:(id)a9 rtModelRequestOptions:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  CSVoiceTriggerSecondPassRequestOption *v20;
  CSVoiceTriggerSecondPassRequestOption *v21;
  uint64_t v22;
  NSDictionary *firstPassTriggerInfo;
  uint64_t v24;
  NSUUID *rejectionMHUUID;
  id v28;
  id v29;
  objc_super v30;

  v29 = a4;
  v28 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CSVoiceTriggerSecondPassRequestOption;
  v20 = -[CSVoiceTriggerSecondPassRequestOption init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_firstPassSource = a3;
    objc_storeStrong((id *)&v20->_deviceId, a4);
    objc_storeStrong((id *)&v21->_audioProviderUUID, a5);
    v22 = objc_msgSend(v16, "copy");
    firstPassTriggerInfo = v21->_firstPassTriggerInfo;
    v21->_firstPassTriggerInfo = (NSDictionary *)v22;

    v24 = objc_msgSend(v17, "copy");
    rejectionMHUUID = v21->_rejectionMHUUID;
    v21->_rejectionMHUUID = (NSUUID *)v24;

    v21->_isSecondChanceRun = a8;
    objc_storeStrong((id *)&v21->_firstpassMetrics, a9);
    objc_storeStrong((id *)&v21->_rtModelRequestOptions, a10);
  }

  return v21;
}

- (unint64_t)firstPassSource
{
  return self->_firstPassSource;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (NSDictionary)firstPassTriggerInfo
{
  return self->_firstPassTriggerInfo;
}

- (NSUUID)rejectionMHUUID
{
  return self->_rejectionMHUUID;
}

- (BOOL)isSecondChanceRun
{
  return self->_isSecondChanceRun;
}

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (CSVoiceTriggerRTModelRequestOptions)rtModelRequestOptions
{
  return self->_rtModelRequestOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtModelRequestOptions, 0);
  objc_storeStrong((id *)&self->_firstpassMetrics, 0);
  objc_storeStrong((id *)&self->_rejectionMHUUID, 0);
  objc_storeStrong((id *)&self->_firstPassTriggerInfo, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end
