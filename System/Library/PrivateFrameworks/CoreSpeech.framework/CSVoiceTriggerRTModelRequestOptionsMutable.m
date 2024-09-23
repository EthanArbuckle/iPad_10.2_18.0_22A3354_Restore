@implementation CSVoiceTriggerRTModelRequestOptionsMutable

- (void)setAllowMph:(BOOL)a3
{
  self->_mAllowMph = a3;
}

- (void)setEndpointId:(id)a3
{
  objc_storeStrong((id *)&self->_mEndpointId, a3);
}

- (void)setEngineMajorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_mEngineMajorVersion, a3);
}

- (void)setEngineMinorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_mEngineMinorVersion, a3);
}

- (void)setAccessoryModelType:(id)a3
{
  objc_storeStrong((id *)&self->_mAccessoryModelType, a3);
}

- (void)setSiriLocale:(id)a3
{
  objc_storeStrong((id *)&self->_mSiriLocale, a3);
}

- (void)setCSCoreSpeechServicesAccessoryInfo:(id)a3
{
  CSCoreSpeechServicesAccessoryInfo *v4;
  CSCoreSpeechServicesAccessoryInfo *mAccessoryInfo;

  v4 = (CSCoreSpeechServicesAccessoryInfo *)objc_msgSend(a3, "copy");
  mAccessoryInfo = self->_mAccessoryInfo;
  self->_mAccessoryInfo = v4;

}

- (void)setUserSelectedPhraseType:(id)a3
{
  objc_storeStrong((id *)&self->_mUserSelectedPhrasetype, a3);
}

- (BOOL)mAllowMph
{
  return self->_mAllowMph;
}

- (void)setMAllowMph:(BOOL)a3
{
  self->_mAllowMph = a3;
}

- (NSNumber)mUserSelectedPhrasetype
{
  return self->_mUserSelectedPhrasetype;
}

- (void)setMUserSelectedPhrasetype:(id)a3
{
  objc_storeStrong((id *)&self->_mUserSelectedPhrasetype, a3);
}

- (NSString)mFallbackPhraseType
{
  return self->_mFallbackPhraseType;
}

- (void)setMFallbackPhraseType:(id)a3
{
  objc_storeStrong((id *)&self->_mFallbackPhraseType, a3);
}

- (NSUUID)mEndpointId
{
  return self->_mEndpointId;
}

- (NSNumber)mEngineMajorVersion
{
  return self->_mEngineMajorVersion;
}

- (NSNumber)mEngineMinorVersion
{
  return self->_mEngineMinorVersion;
}

- (NSNumber)mAccessoryModelType
{
  return self->_mAccessoryModelType;
}

- (NSString)mSiriLocale
{
  return self->_mSiriLocale;
}

- (void)setMSiriLocale:(id)a3
{
  objc_storeStrong((id *)&self->_mSiriLocale, a3);
}

- (CSCoreSpeechServicesAccessoryInfo)mAccessoryInfo
{
  return self->_mAccessoryInfo;
}

- (void)setMAccessoryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mAccessoryInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_mSiriLocale, 0);
  objc_storeStrong((id *)&self->_mAccessoryModelType, 0);
  objc_storeStrong((id *)&self->_mEngineMinorVersion, 0);
  objc_storeStrong((id *)&self->_mEngineMajorVersion, 0);
  objc_storeStrong((id *)&self->_mEndpointId, 0);
  objc_storeStrong((id *)&self->_mFallbackPhraseType, 0);
  objc_storeStrong((id *)&self->_mUserSelectedPhrasetype, 0);
}

@end
