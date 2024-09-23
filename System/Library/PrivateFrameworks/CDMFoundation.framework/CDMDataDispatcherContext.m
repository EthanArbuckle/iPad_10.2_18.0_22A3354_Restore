@implementation CDMDataDispatcherContext

- (int)cdmSELFLoggingPolicyType
{
  return self->_cdmSELFLoggingPolicyType;
}

- (BOOL)isSampledForEmission
{
  unint64_t samplingDiceRoll;

  if (self->_cdmSELFLoggingPolicyType == 1)
    return 1;
  samplingDiceRoll = self->_samplingDiceRoll;
  return samplingDiceRoll < +[CDMUserDefaultsUtils readNonSiriSelfSampleRate](CDMUserDefaultsUtils, "readNonSiriSelfSampleRate");
}

- (NSString)callingBundleId
{
  return self->_callingBundleId;
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (CDMDataDispatcherContext)initWithCallingBundleId:(id)a3
{
  id v5;
  CDMDataDispatcherContext *v6;
  CDMDataDispatcherContext *v7;
  uint64_t v8;
  NSUUID *streamUUID;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMDataDispatcherContext;
  v6 = -[CDMDataDispatcherContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callingBundleId, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    streamUUID = v7->_streamUUID;
    v7->_streamUUID = (NSUUID *)v8;

    v7->_cdmSELFLoggingPolicyType = +[CDMSELFLoggingPolicy getSELFCDMLoggingPolicyType:](CDMSELFLoggingPolicy, "getSELFCDMLoggingPolicyType:", v5);
    v7->_samplingDiceRoll = arc4random_uniform(0x64u);
  }

  return v7;
}

- (CDMDataDispatcherContext)init
{
  return -[CDMDataDispatcherContext initWithCallingBundleId:](self, "initWithCallingBundleId:", CFSTR("com.apple.assistant.assistantd"));
}

- (void)setCdmSELFLoggingPolicyType:(int)a3
{
  self->_cdmSELFLoggingPolicyType = a3;
}

- (unint64_t)samplingDiceRoll
{
  return self->_samplingDiceRoll;
}

- (void)setSamplingDiceRoll:(unint64_t)a3
{
  self->_samplingDiceRoll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamUUID, 0);
  objc_storeStrong((id *)&self->_callingBundleId, 0);
}

@end
