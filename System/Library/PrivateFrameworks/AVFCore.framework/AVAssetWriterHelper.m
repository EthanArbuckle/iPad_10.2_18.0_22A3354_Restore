@implementation AVAssetWriterHelper

- (AVAssetWriterHelper)init
{
  return -[AVAssetWriterHelper initWithConfigurationState:](self, "initWithConfigurationState:", 0);
}

- (AVAssetWriterHelper)initWithConfigurationState:(id)a3
{
  AVAssetWriterHelper *v5;
  uint64_t v6;
  AVAssetWriterHelper *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVAssetWriterHelper;
  v5 = -[AVAssetWriterHelper init](&v15, sel_init);
  v6 = objc_opt_class();
  AVRequireConcreteObject(v5, a2, v6);
  if (!a3)
  {
    v8 = v5;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"configurationState != nil"), 0);
    objc_exception_throw(v14);
  }
  if (v5)
    v5->_configurationState = (AVAssetWriterConfigurationState *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterHelper;
  -[AVAssetWriterHelper dealloc](&v3, sel_dealloc);
}

- (NSURL)outputURL
{
  return -[AVAssetWriterConfigurationState URL](-[AVAssetWriterHelper configurationState](self, "configurationState"), "URL");
}

- (AVMediaFileType)mediaFileType
{
  return -[AVAssetWriterConfigurationState mediaFileType](-[AVAssetWriterHelper configurationState](self, "configurationState"), "mediaFileType");
}

- (NSArray)availableMediaTypes
{
  return -[NSSet allObjects](-[AVMediaFileType supportedMediaTypes](-[AVAssetWriterHelper mediaFileType](self, "mediaFileType"), "supportedMediaTypes"), "allObjects");
}

- (int64_t)status
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSError)error
{
  return 0;
}

- (AVAssetWriterDelegate)delegate
{
  return -[AVAssetWriterConfigurationState delegate](-[AVAssetWriterHelper configurationState](self, "configurationState"), "delegate");
}

- (void)setDelegate:(id)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = -[AVAssetWriterHelper configurationState](self, "configurationState");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE movieFragmentInterval](result, "movieFragmentInterval");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setMovieFragmentInterval:(id *)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialMovieFragmentInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = -[AVAssetWriterHelper configurationState](self, "configurationState");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE initialMovieFragmentInterval](result, "initialMovieFragmentInterval");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setInitialMovieFragmentInterval:(id *)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = -[AVAssetWriterHelper configurationState](self, "configurationState");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE overallDurationHint](result, "overallDurationHint");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setOverallDurationHint:(id *)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)shouldOptimizeForNetworkUse
{
  return -[AVAssetWriterConfigurationState shouldOptimizeForNetworkUse](-[AVAssetWriterHelper configurationState](self, "configurationState"), "shouldOptimizeForNetworkUse");
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSURL)directoryForTemporaryFiles
{
  return -[AVAssetWriterConfigurationState directoryForTemporaryFiles](-[AVAssetWriterHelper configurationState](self, "configurationState"), "directoryForTemporaryFiles");
}

- (void)setDirectoryForTemporaryFiles:(id)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (int)movieTimeScale
{
  return -[AVAssetWriterConfigurationState movieTimeScale](-[AVAssetWriterHelper configurationState](self, "configurationState"), "movieTimeScale");
}

- (void)setMovieTimeScale:(int)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSArray)metadata
{
  return -[AVAssetWriterConfigurationState metadataItems](-[AVAssetWriterHelper configurationState](self, "configurationState"), "metadataItems");
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  result = -[AVAssetWriterHelper configurationState](self, "configurationState");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform preferredTransform](result, "preferredTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (float)preferredVolume
{
  float result;

  -[AVAssetWriterConfigurationState preferredVolume](-[AVAssetWriterHelper configurationState](self, "configurationState"), "preferredVolume");
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (float)preferredRate
{
  float result;

  -[AVAssetWriterConfigurationState preferredRate](-[AVAssetWriterHelper configurationState](self, "configurationState"), "preferredRate");
  return result;
}

- (void)setPreferredRate:(float)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredOutputSegmentInterval
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = -[AVAssetWriterHelper configurationState](self, "configurationState");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE preferredOutputSegmentInterval](result, "preferredOutputSegmentInterval");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setPreferredOutputSegmentInterval:(id *)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialSegmentStartTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = -[AVAssetWriterHelper configurationState](self, "configurationState");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE initialSegmentStartTime](result, "initialSegmentStartTime");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setInitialSegmentStartTime:(id *)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSString)outputFileTypeProfile
{
  return -[AVAssetWriterConfigurationState outputFileTypeProfile](-[AVAssetWriterHelper configurationState](self, "configurationState"), "outputFileTypeProfile");
}

- (void)setOutputFileTypeProfile:(id)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (int64_t)initialMovieFragmentSequenceNumber
{
  return -[AVAssetWriterConfigurationState initialMovieFragmentSequenceNumber](-[AVAssetWriterHelper configurationState](self, "configurationState"), "initialMovieFragmentSequenceNumber");
}

- (void)setInitialMovieFragmentSequenceNumber:(int64_t)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)producesCombinableFragments
{
  return -[AVAssetWriterConfigurationState producesCombinableFragments](-[AVAssetWriterHelper configurationState](self, "configurationState"), "producesCombinableFragments");
}

- (void)setProducesCombinableFragments:(BOOL)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)isVirtualCaptureCardSupported
{
  NSURL *v2;

  v2 = -[AVAssetWriterHelper outputURL](self, "outputURL");
  if (v2)
    LOBYTE(v2) = MEMORY[0x194032B6C]() != 0;
  return (char)v2;
}

- (BOOL)usesVirtualCaptureCard
{
  return -[AVAssetWriterConfigurationState usesVirtualCaptureCard](-[AVAssetWriterHelper configurationState](self, "configurationState"), "usesVirtualCaptureCard");
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)requiresInProcessOperation
{
  return -[AVAssetWriterConfigurationState requiresInProcessOperation](-[AVAssetWriterHelper configurationState](self, "configurationState"), "requiresInProcessOperation");
}

- (void)setRequiresInProcessOperation:(BOOL)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (int64_t)singlePassFileSize
{
  return -[AVAssetWriterConfigurationState singlePassFileSize](-[AVAssetWriterHelper configurationState](self, "configurationState"), "singlePassFileSize");
}

- (void)setSinglePassFileSize:(int64_t)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (int64_t)singlePassMediaDataSize
{
  return -[AVAssetWriterConfigurationState singlePassMediaDataSize](-[AVAssetWriterHelper configurationState](self, "configurationState"), "singlePassMediaDataSize");
}

- (void)setSinglePassMediaDataSize:(int64_t)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (NSArray)inputs
{
  return -[AVAssetWriterConfigurationState inputs](-[AVAssetWriterHelper configurationState](self, "configurationState"), "inputs");
}

- (NSArray)inputGroups
{
  return -[AVAssetWriterConfigurationState inputGroups](-[AVAssetWriterHelper configurationState](self, "configurationState"), "inputGroups");
}

- (BOOL)_canApplyOutputSettings:(id)a3 forMediaType:(id)a4 sourceFormat:(opaqueCMFormatDescription *)a5 exceptionReason:(id *)a6
{
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  AVMediaFileType *v15;
  NSString *v16;
  BOOL v17;
  void *v18;
  void *v19;
  FourCharCode MediaSubType;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = 0;
  if (!-[NSArray containsObject:](-[AVAssetWriterHelper availableMediaTypes](self, "availableMediaTypes"), "containsObject:", a4))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v22 = a4;
    v13 = CFSTR("media type %@ is not allowed for this asset writer");
    goto LABEL_9;
  }
  if (a3)
  {
    if (!objc_msgSend(a4, "isEqualToString:", CFSTR("vide"))
      || (objc_msgSend(a3, "willYieldCompressedSamples") & 1) != 0)
    {
      LODWORD(v11) = -[AVMediaFileType supportsOutputSettings:reason:](-[AVAssetWriterHelper mediaFileType](self, "mediaFileType"), "supportsOutputSettings:reason:", a3, &v25);
      if (!(_DWORD)v11)
        goto LABEL_11;
      if ((objc_msgSend((id)objc_msgSend(a3, "compatibleMediaTypes"), "containsObject:", a4) & 1) == 0)
      {
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output settings must match supplied media type.  Media type %@ is not compatible with output settings %@."), a4, objc_msgSend(a3, "outputSettingsDictionary"), v24);
LABEL_10:
        v14 = (void *)v11;
        LOBYTE(v11) = 0;
        v25 = v14;
        goto LABEL_11;
      }
      goto LABEL_20;
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = CFSTR("AVAssetWriter currently does not support writing uncompressed video in a specific format.");
LABEL_9:
    v11 = objc_msgSend(v12, "stringWithFormat:", v13, v22, v23, v24);
    goto LABEL_10;
  }
  v15 = -[AVAssetWriterHelper mediaFileType](self, "mediaFileType");
  v16 = -[AVMediaFileType UTI](v15, "UTI");
  v17 = -[NSString isEqualToString:](v16, "isEqualToString:", CFSTR("com.apple.quicktime-movie"));
  if (!a5 && !v17)
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("In order to perform passthrough to file type %@, please provide a format hint in the AVAssetWriterInput initializer"), v16, v23, v24);
    goto LABEL_10;
  }
  if ((AVAssetWriterCanAddPassthroughInputWithMediaTypeToAssetWriterWithFileType((uint64_t)a4, v15) & 1) != 0)
  {
    if (a5 && !-[AVMediaFileType supportsFormat:](v15, "supportsFormat:", a5))
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      MediaSubType = CMFormatDescriptionGetMediaSubType(a5);
      v11 = objc_msgSend(v19, "stringWithFormat:", CFSTR("AVAssetWriter does not support passthrough of media with type '%@' and subtype '%@' to file type %@"), a4, AVStringForOSType(MediaSubType), v16);
      goto LABEL_10;
    }
LABEL_20:
    LOBYTE(v11) = 1;
    goto LABEL_11;
  }
  v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVAssetWriter does not support passthrough for media type %@ to file type %@."), a4, v16);
  v25 = v18;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("vide")) & 1) != 0
    || (objc_msgSend(a4, "isEqualToString:", CFSTR("auxv")) & 1) != 0
    || (LODWORD(v11) = objc_msgSend(a4, "isEqualToString:", CFSTR("soun")), (_DWORD)v11))
  {
    v11 = objc_msgSend(v18, "stringByAppendingString:", CFSTR("  Please specify a non-nil output settings dictionary."));
    goto LABEL_10;
  }
LABEL_11:
  if (a6)
    *a6 = v25;
  return v11;
}

- (BOOL)canApplyOutputSettings:(id)a3 forMediaType:(id)a4
{
  id v6;

  if (a3)
  {
    v6 = +[AVOutputSettings _outputSettingsWithOutputSettingsDictionary:mediaType:exceptionReason:](AVOutputSettings, "_outputSettingsWithOutputSettingsDictionary:mediaType:exceptionReason:", a3, a4, 0);
    if (v6)
      LOBYTE(v6) = -[AVAssetWriterHelper _canApplyOutputSettings:forMediaType:sourceFormat:exceptionReason:](self, "_canApplyOutputSettings:forMediaType:sourceFormat:exceptionReason:", v6, a4, 0, 0);
  }
  else
  {
    LOBYTE(v6) = AVAssetWriterCanAddPassthroughInputWithMediaTypeToAssetWriterWithFileType((uint64_t)a4, -[AVAssetWriterHelper mediaFileType](self, "mediaFileType"));
  }
  return (char)v6;
}

- (BOOL)_canApplyTrackReferences:(id)a3 exceptionReason:(id *)a4
{
  void *v6;
  NSString *v7;
  BOOL v8;

  v6 = (void *)objc_msgSend(a3, "count");
  if (v6)
  {
    v7 = -[AVMediaFileType UTI](-[AVAssetWriterHelper mediaFileType](self, "mediaFileType"), "UTI");
    if (!-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.quicktime-movie"))
      && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.m4a-audio"))
      && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.m4v-video"))
      && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("public.3gpp"))
      && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("public.mpeg-4")))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("output file type %@ does not support track associations"), -[AVMediaFileType UTI](-[AVAssetWriterHelper mediaFileType](self, "mediaFileType"), "UTI"));
      v8 = 0;
      if (!a4)
        return v8;
      goto LABEL_9;
    }
    v6 = 0;
  }
  v8 = 1;
  if (a4)
LABEL_9:
    *a4 = v6;
  return v8;
}

- (BOOL)canAddInput:(id)a3
{
  return 0;
}

- (void)addInput:(id)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)canAddInputGroup:(id)a3
{
  return 0;
}

- (void)addInputGroup:(id)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (void)startWriting
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
  v7 = -[AVAssetWriterHelper status](self, "status");
  v13 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithClassAndSelector(v6, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v8, v9, v10, v11, v12, v7), 0);
  objc_exception_throw(v13);
}

- (void)startSessionAtSourceTime:(id *)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (void)endSessionAtSourceTime:(id *)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (void)finishWriting
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
  v7 = -[AVAssetWriterHelper status](self, "status");
  v13 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithClassAndSelector(v6, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v8, v9, v10, v11, v12, v7), 0);
  objc_exception_throw(v13);
}

- (void)finishWritingWithCompletionHandler:(id)a3
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
  v8 = -[AVAssetWriterHelper status](self, "status");
  v14 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v9, v10, v11, v12, v13, v8), 0);
  objc_exception_throw(v14);
}

- (BOOL)_transitionToClientInitiatedTerminalStatus:(int64_t)a3
{
  id v5;
  void *v6;
  AVAssetWriterClientInitiatedTerminalHelper *v7;
  char v8;
  _QWORD v10[6];

  v5 = -[AVWeakReference referencedObject](-[AVAssetWriterHelper weakReferenceToAssetWriter](self, "weakReferenceToAssetWriter"), "referencedObject");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = -[AVAssetWriterClientInitiatedTerminalHelper initWithConfigurationState:terminalStatus:]([AVAssetWriterClientInitiatedTerminalHelper alloc], "initWithConfigurationState:terminalStatus:", -[AVAssetWriterHelper configurationState](self, "configurationState"), a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__AVAssetWriterHelper__transitionToClientInitiatedTerminalStatus___block_invoke;
  v10[3] = &unk_1E302FE78;
  v10[4] = self;
  v10[5] = a3;
  v8 = objc_msgSend(v6, "_setHelper:ifCurrentHelper:withBlock:", v7, self, v10);

  return v8;
}

uint64_t __66__AVAssetWriterHelper__transitionToClientInitiatedTerminalStatus___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "inputs", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_transitionToTerminalStatus:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)transitionToFailedStatusWithError:(id)a3
{
  id v5;
  void *v6;
  AVAssetWriterFailedTerminalHelper *v7;
  _QWORD v8[5];

  v5 = -[AVWeakReference referencedObject](-[AVAssetWriterHelper weakReferenceToAssetWriter](self, "weakReferenceToAssetWriter"), "referencedObject");
  if (v5)
  {
    v6 = v5;
    v7 = -[AVAssetWriterFailedTerminalHelper initWithConfigurationState:terminalError:]([AVAssetWriterFailedTerminalHelper alloc], "initWithConfigurationState:terminalError:", -[AVAssetWriterHelper configurationState](self, "configurationState"), a3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__AVAssetWriterHelper_transitionToFailedStatusWithError___block_invoke;
    v8[3] = &unk_1E302FA10;
    v8[4] = self;
    objc_msgSend(v6, "_setHelper:ifCurrentHelper:withBlock:", v7, self, v8);

  }
}

uint64_t __57__AVAssetWriterHelper_transitionToFailedStatusWithError___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "inputs", 0);
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_transitionToTerminalStatus:", 3);
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)flush
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
  v7 = -[AVAssetWriterHelper status](self, "status");
  v13 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithClassAndSelector(v6, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v8, v9, v10, v11, v12, v7), 0);
  objc_exception_throw(v13);
}

- (void)flushSegment
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
  v7 = -[AVAssetWriterHelper status](self, "status");
  v13 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithClassAndSelector(v6, a2, (uint64_t)CFSTR("Cannot call method when status is %d"), v8, v9, v10, v11, v12, v7), 0);
  objc_exception_throw(v13);
}

- (BOOL)_isDefunct
{
  return 1;
}

- (AVAssetWriterConfigurationState)configurationState
{
  return self->_configurationState;
}

- (AVWeakReference)weakReferenceToAssetWriter
{
  return (AVWeakReference *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWeakReferenceToAssetWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
