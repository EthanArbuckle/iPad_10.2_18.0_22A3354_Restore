@implementation SNAudioFileAnalyzer

- (SNAudioFileAnalyzer)initWithURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v6;
  SNAudioFileAnalyzer *v7;
  _SNAudioFileAnalyzer *v8;
  _SNAudioFileAnalyzer *impl;
  SNAudioFileAnalyzer *v10;
  objc_super v12;

  v6 = url;
  v12.receiver = self;
  v12.super_class = (Class)SNAudioFileAnalyzer;
  v7 = -[SNAudioFileAnalyzer init](&v12, sel_init);
  if (v7
    && (v8 = -[_SNAudioFileAnalyzer initWithURL:error:]([_SNAudioFileAnalyzer alloc], "initWithURL:error:", v6, error), impl = v7->_impl, v7->_impl = v8, impl, !v7->_impl))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (SNAudioFileAnalyzer)initWithImpl:(id)a3
{
  id v5;
  SNAudioFileAnalyzer *v6;
  SNAudioFileAnalyzer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNAudioFileAnalyzer;
  v6 = -[SNAudioFileAnalyzer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_impl, a3);

  return v7;
}

- (void)analyze
{
  -[_SNAudioFileAnalyzer analyze](self->_impl, "analyze");
}

- (void)analyzeInRange:(id *)a3
{
  _SNAudioFileAnalyzer *impl;
  __int128 v4;
  _OWORD v5[3];

  impl = self->_impl;
  v4 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  -[_SNAudioFileAnalyzer analyzeInRange:](impl, "analyzeInRange:", v5);
}

- (void)analyzeWithCompletionHandler:(void *)completionHandler
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_analyzeWithCompletionHandler_);
}

- (void)cancelAnalysis
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_cancelAnalysis);
}

- (BOOL)addRequest:(id)request withObserver:(id)observer error:(NSError *)error
{
  return -[_SNAudioFileAnalyzer addRequest:withObserver:error:](self->_impl, "addRequest:withObserver:error:", request, observer, error);
}

- (void)removeRequest:(id)request
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_removeRequest_);
}

- (void)removeAllRequests
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_removeAllRequests);
}

- (id)detailedDescription
{
  return (id)MEMORY[0x1E0DE7D20](self->_impl, sel_detailedDescription);
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
