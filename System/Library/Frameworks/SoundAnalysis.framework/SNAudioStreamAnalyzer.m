@implementation SNAudioStreamAnalyzer

- (SNAudioStreamAnalyzer)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("illegal call to unavailable init selector: %s"), "-[SNAudioStreamAnalyzer init]");

  return 0;
}

- (SNAudioStreamAnalyzer)new
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("illegal call to new"));
  return 0;
}

- (SNAudioStreamAnalyzer)initWithFormat:(AVAudioFormat *)format
{
  AVAudioFormat *v4;
  SNAudioStreamAnalyzer *v5;
  _SNAudioStreamAnalyzer *v6;
  id v7;
  _SNAudioStreamAnalyzer *impl;
  void *v9;
  id v11;
  objc_super v12;

  v4 = format;
  v12.receiver = self;
  v12.super_class = (Class)SNAudioStreamAnalyzer;
  v5 = -[SNAudioStreamAnalyzer init](&v12, sel_init);
  if (v5)
  {
    v11 = 0;
    v6 = -[_SNAudioStreamAnalyzer initWithFormat:error:]([_SNAudioStreamAnalyzer alloc], "initWithFormat:error:", v4, &v11);
    v7 = v11;
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {
      +[SNError exceptionFromError:](SNError, "exceptionFromError:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise");

    }
  }

  return v5;
}

- (SNAudioStreamAnalyzer)initWithImpl:(id)a3
{
  id v5;
  SNAudioStreamAnalyzer *v6;
  SNAudioStreamAnalyzer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNAudioStreamAnalyzer;
  v6 = -[SNAudioStreamAnalyzer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_impl, a3);

  return v7;
}

- (BOOL)addRequest:(id)request withObserver:(id)observer error:(NSError *)error
{
  return -[_SNAudioStreamAnalyzer addRequest:withObserver:error:](self->_impl, "addRequest:withObserver:error:", request, observer, error);
}

- (void)removeRequest:(id)request
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_removeRequest_);
}

- (void)removeAllRequests
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_removeAllRequests);
}

- (void)analyzeAudioBuffer:(AVAudioBuffer *)audioBuffer atAudioFramePosition:(AVAudioFramePosition)audioFramePosition
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_analyzeAudioBuffer_atAudioFramePosition_);
}

- (void)completeAnalysis
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_completeAnalysis);
}

- (id)detailedDescription
{
  return (id)MEMORY[0x1E0DE7D20](self->_impl, sel_detailedDescription);
}

- (BOOL)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5 error:(id *)a6
{
  return MEMORY[0x1E0DE7D20](self->_impl, sel_addRequest_completionHandler_resultsHandler_error_);
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
