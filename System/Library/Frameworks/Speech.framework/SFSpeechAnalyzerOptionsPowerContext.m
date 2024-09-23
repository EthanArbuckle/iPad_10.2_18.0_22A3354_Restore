@implementation SFSpeechAnalyzerOptionsPowerContext

- (SFSpeechAnalyzerOptionsPowerContext)initWithAne:(id)a3 cpu:(id)a4 gpu:(id)a5
{
  id v7;
  id v8;
  id v9;
  SFSpeechAnalyzerOptionsPowerContext *v10;
  uint64_t v11;
  NSString *ane;
  uint64_t v13;
  NSString *cpu;
  uint64_t v15;
  NSString *gpu;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SFSpeechAnalyzerOptionsPowerContext;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SFSpeechAnalyzerOptionsPowerContext init](&v18, sel_init);
  v11 = objc_msgSend(v9, "copy", v18.receiver, v18.super_class);

  ane = v10->_ane;
  v10->_ane = (NSString *)v11;

  v13 = objc_msgSend(v8, "copy");
  cpu = v10->_cpu;
  v10->_cpu = (NSString *)v13;

  v15 = objc_msgSend(v7, "copy");
  gpu = v10->_gpu;
  v10->_gpu = (NSString *)v15;

  return v10;
}

- (NSString)ane
{
  return self->_ane;
}

- (NSString)cpu
{
  return self->_cpu;
}

- (NSString)gpu
{
  return self->_gpu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpu, 0);
  objc_storeStrong((id *)&self->_cpu, 0);
  objc_storeStrong((id *)&self->_ane, 0);
}

@end
