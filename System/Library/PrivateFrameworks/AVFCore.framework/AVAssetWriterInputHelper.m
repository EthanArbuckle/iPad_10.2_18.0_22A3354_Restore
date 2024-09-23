@implementation AVAssetWriterInputHelper

- (AVAssetWriterInputHelper)initWithConfigurationState:(id)a3
{
  AVAssetWriterInputHelper *v5;
  uint64_t v6;
  AVAssetWriterInputHelper *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVAssetWriterInputHelper;
  v5 = -[AVAssetWriterInputHelper init](&v15, sel_init);
  v6 = objc_opt_class();
  AVRequireConcreteObject(v5, a2, v6);
  if (!a3)
  {
    v8 = v5;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"configurationState != nil"), 0);
    objc_exception_throw(v14);
  }
  if (v5)
    v5->_configurationState = (AVAssetWriterInputConfigurationState *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputHelper;
  -[AVAssetWriterInputHelper dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, status=%d>"), NSStringFromClass(v4), self, -[AVAssetWriterInputHelper status](self, "status"));
}

- (int64_t)status
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)transitionToAndReturnTerminalHelperWithTerminalStatus:(int64_t)a3
{
  id v5;
  AVAssetWriterInputTerminalHelper *v6;

  v5 = -[AVWeakReference referencedObject](-[AVAssetWriterInputHelper weakReferenceToAssetWriterInput](self, "weakReferenceToAssetWriterInput"), "referencedObject");
  v6 = -[AVAssetWriterInputTerminalHelper initWithConfigurationState:terminalStatus:]([AVAssetWriterInputTerminalHelper alloc], "initWithConfigurationState:terminalStatus:", -[AVAssetWriterInputHelper configurationState](self, "configurationState"), a3);
  objc_msgSend(v5, "_setHelper:", v6);
  return v6;
}

- (void)transitionAssetWriterAndAllInputsToFailedStatusWithError:(id)a3
{
  objc_msgSend(-[AVWeakReference referencedObject](-[AVAssetWriterInputHelper weakReferenceToAssetWriterInput](self, "weakReferenceToAssetWriterInput"), "referencedObject"), "_tellAssetWriterToTransitionToFailedStatusWithError:", a3);
}

- (int)trackID
{
  return -[AVAssetWriterInputConfigurationState trackID](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "trackID");
}

- (NSString)mediaType
{
  return -[AVAssetWriterInputConfigurationState mediaType](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "mediaType");
}

- (AVOutputSettings)outputSettings
{
  return -[AVAssetWriterInputConfigurationState outputSettings](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "outputSettings");
}

- (opaqueCMFormatDescription)sourceFormatHint
{
  return -[AVAssetWriterInputConfigurationState sourceFormatHint](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "sourceFormatHint");
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  result = -[AVAssetWriterInputHelper configurationState](self, "configurationState");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSArray)metadata
{
  return -[AVAssetWriterInputConfigurationState metadataItems](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "metadataItems");
}

- (void)setMetadata:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (int)mediaTimeScale
{
  return -[AVAssetWriterInputConfigurationState mediaTimeScale](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "mediaTimeScale");
}

- (void)setMediaTimeScale:(int)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)isReadyForMoreMediaData
{
  return 0;
}

- (BOOL)expectsMediaDataInRealTime
{
  return -[AVAssetWriterInputConfigurationState expectsMediaDataInRealTime](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "expectsMediaDataInRealTime");
}

- (void)setExpectsMediaDataInRealTime:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)maximizePowerEfficiency
{
  return -[AVAssetWriterInputConfigurationState maximizePowerEfficiency](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "maximizePowerEfficiency");
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVAssetWriterInputConfigurationState naturalSize](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "naturalSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSString)languageCode
{
  return -[AVAssetWriterInputConfigurationState languageCode](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "languageCode");
}

- (void)setLanguageCode:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSString)extendedLanguageTag
{
  return -[AVAssetWriterInputConfigurationState extendedLanguageTag](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "extendedLanguageTag");
}

- (void)setExtendedLanguageTag:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)marksOutputTrackAsEnabled
{
  return -[AVAssetWriterInputConfigurationState marksOutputTrackAsEnabled](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "marksOutputTrackAsEnabled");
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (float)preferredVolume
{
  float result;

  -[AVAssetWriterInputConfigurationState preferredVolume](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "preferredVolume");
  return result;
}

- (void)setPreferredVolume:(float)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (int64_t)layer
{
  return -[AVAssetWriterInputConfigurationState layer](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "layer");
}

- (void)setLayer:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (signed)alternateGroupID
{
  return -[AVAssetWriterInputConfigurationState alternateGroupID](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "alternateGroupID");
}

- (void)setAlternateGroupID:(signed __int16)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (signed)provisionalAlternateGroupID
{
  return -[AVAssetWriterInputConfigurationState provisionalAlternateGroupID](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "provisionalAlternateGroupID");
}

- (void)setProvisionalAlternateGroupID:(signed __int16)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSDictionary)trackReferences
{
  return -[AVAssetWriterInputConfigurationState trackReferences](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "trackReferences");
}

- (BOOL)performsMultiPassEncodingIfSupported
{
  return -[AVAssetWriterInputConfigurationState performsMultiPassEncodingIfSupported](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "performsMultiPassEncodingIfSupported");
}

- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)canPerformMultiplePasses
{
  return 0;
}

- (AVAssetWriterInputPassDescription)currentPassDescription
{
  return 0;
}

- (BOOL)canStartRespondingToEachPassDescriptionReturningReason:(id *)a3
{
  return 1;
}

- (BOOL)shouldRespondToInitialPassDescription
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredMediaChunkDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = -[AVAssetWriterInputHelper configurationState](self, "configurationState");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE preferredMediaChunkDuration](result, "preferredMediaChunkDuration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setPreferredMediaChunkDuration:(id *)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (int64_t)preferredMediaChunkAlignment
{
  return -[AVAssetWriterInputConfigurationState preferredMediaChunkAlignment](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "preferredMediaChunkAlignment");
}

- (void)setPreferredMediaChunkAlignment:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (int64_t)preferredMediaChunkSize
{
  return -[AVAssetWriterInputConfigurationState preferredMediaChunkSize](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "preferredMediaChunkSize");
}

- (void)setPreferredMediaChunkSize:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSString)mediaDataLocation
{
  return -[AVAssetWriterInputConfigurationState mediaDataLocation](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "mediaDataLocation");
}

- (void)setMediaDataLocation:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSURL)sampleReferenceBaseURL
{
  return -[AVAssetWriterInputConfigurationState sampleReferenceBaseURL](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "sampleReferenceBaseURL");
}

- (void)setSampleReferenceBaseURL:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = -[AVAssetWriterInputHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (objc_class *)objc_opt_class();
  v9 = -[AVAssetWriterInputHelper status](self, "status");
  v15 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(v8, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v10, v11, v12, v13, v14, v9), 0);
  objc_exception_throw(v15);
}

- (void)stopRequestingMediaData
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  v7 = -[AVAssetWriterInputHelper status](self, "status");
  v13 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithClassAndSelector(v6, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v8, v9, v10, v11, v12, v7), 0);
  objc_exception_throw(v13);
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot call method when status is %d"), -[AVAssetWriterInputHelper status](self, "status", a3)), 0));
  return 1;
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (objc_class *)objc_opt_class();
  v9 = -[AVAssetWriterInputHelper status](self, "status");
  v15 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(v8, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v10, v11, v12, v13, v14, v9), 0);
  objc_exception_throw(v15);
}

- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (objc_class *)objc_opt_class();
  v9 = -[AVAssetWriterInputHelper status](self, "status");
  v15 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(v8, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v10, v11, v12, v13, v14, v9), 0);
  objc_exception_throw(v15);
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot call method when status is %d"), -[AVAssetWriterInputHelper status](self, "status", a3)), 0));
  return 1;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot call method when status is %d"), -[AVAssetWriterInputHelper status](self, "status", a3)), 0));
  return 1;
}

- (BOOL)prepareToFinishWritingReturningError:(id *)a3
{
  return 1;
}

- (void)markAsFinished
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  v7 = -[AVAssetWriterInputHelper status](self, "status");
  v13 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithClassAndSelector(v6, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v8, v9, v10, v11, v12, v7), 0);
  objc_exception_throw(v13);
}

- (void)markCurrentPassAsFinished
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  v7 = -[AVAssetWriterInputHelper status](self, "status");
  v13 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithClassAndSelector(v6, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v8, v9, v10, v11, v12, v7), 0);
  objc_exception_throw(v13);
}

- (NSDictionary)sourcePixelBufferAttributes
{
  return -[AVAssetWriterInputConfigurationState sourcePixelBufferAttributes](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "sourcePixelBufferAttributes");
}

- (void)setSourcePixelBufferAttributes:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = -[AVAssetWriterInputHelper status](self, "status", a3);
  v13 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v8, v9, v10, v11, v12, v7), 0);
  objc_exception_throw(v13);
}

- (__CVPixelBufferPool)pixelBufferPool
{
  return 0;
}

- (BOOL)canAddTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4
{
  return 0;
}

- (void)addTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4
{
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (objc_class *)objc_opt_class();
  v9 = -[AVAssetWriterInputHelper status](self, "status");
  v15 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(v8, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v10, v11, v12, v13, v14, v9), 0);
  objc_exception_throw(v15);
}

- (id)availableTrackAssociationTypes
{
  return -[NSDictionary allKeys](-[AVAssetWriterInputConfigurationState trackReferences](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "trackReferences"), "allKeys");
}

- (id)associatedInputsWithTrackAssociationType:(id)a3
{
  return -[NSDictionary objectForKey:](-[AVAssetWriterInputConfigurationState trackReferences](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "trackReferences"), "objectForKey:", a3);
}

- (AVAssetWriterInputConfigurationState)configurationState
{
  return self->_configurationState;
}

- (AVWeakReference)weakReferenceToAssetWriterInput
{
  return (AVWeakReference *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWeakReferenceToAssetWriterInput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
