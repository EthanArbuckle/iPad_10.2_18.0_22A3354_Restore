@implementation SFTranscriberModelOptions

- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7 atypicalSpeech:(BOOL)a8 enableParallelLoading:(BOOL)a9
{
  NSArray *v15;
  id v16;
  id v17;
  id v18;
  SFTranscriberModelOptions *v19;
  uint64_t v20;
  NSURL *supplementalModelURL;
  uint64_t v22;
  NSURL *modelOverrideURL;
  NSArray *speechProfileURLs;
  NSArray *v25;
  uint64_t v26;
  NSString *taskForMemoryLock;
  objc_super v29;

  v15 = (NSArray *)a6;
  v29.receiver = self;
  v29.super_class = (Class)SFTranscriberModelOptions;
  v16 = a7;
  v17 = a5;
  v18 = a3;
  v19 = -[SFTranscriberModelOptions init](&v29, sel_init);
  v20 = objc_msgSend(v18, "copy", v29.receiver, v29.super_class);

  supplementalModelURL = v19->_supplementalModelURL;
  v19->_supplementalModelURL = (NSURL *)v20;

  v19->_farField = a4;
  v22 = objc_msgSend(v17, "copy");

  modelOverrideURL = v19->_modelOverrideURL;
  v19->_modelOverrideURL = (NSURL *)v22;

  speechProfileURLs = v19->_speechProfileURLs;
  v19->_speechProfileURLs = v15;
  v25 = v15;

  v26 = objc_msgSend(v16, "copy");
  taskForMemoryLock = v19->_taskForMemoryLock;
  v19->_taskForMemoryLock = (NSString *)v26;

  v19->_atypicalSpeech = a8;
  v19->_enableParallelLoading = a9;
  return v19;
}

- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7 atypicalSpeech:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[SFTranscriberModelOptions initWithSupplementalModelURL:farField:modelOverrideURL:speechProfileURLs:taskForMemoryLock:atypicalSpeech:enableParallelLoading:](self, "initWithSupplementalModelURL:farField:modelOverrideURL:speechProfileURLs:taskForMemoryLock:atypicalSpeech:enableParallelLoading:", a3, a4, a5, a6, a7, 0, v9);
}

- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[SFTranscriberModelOptions initWithSupplementalModelURL:farField:modelOverrideURL:speechProfileURLs:taskForMemoryLock:atypicalSpeech:enableParallelLoading:](self, "initWithSupplementalModelURL:farField:modelOverrideURL:speechProfileURLs:taskForMemoryLock:atypicalSpeech:enableParallelLoading:", a3, a4, a5, a6, a7, 0, v8);
}

- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 taskForMemoryLock:(id)a6 atypicalSpeech:(BOOL)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[SFTranscriberModelOptions initWithSupplementalModelURL:farField:modelOverrideURL:speechProfileURLs:taskForMemoryLock:atypicalSpeech:enableParallelLoading:](self, "initWithSupplementalModelURL:farField:modelOverrideURL:speechProfileURLs:taskForMemoryLock:atypicalSpeech:enableParallelLoading:", a3, a4, a5, MEMORY[0x1E0C9AA60], a6, a7, v8);
}

- (NSURL)supplementalModelURL
{
  return self->_supplementalModelURL;
}

- (BOOL)farField
{
  return self->_farField;
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (NSString)taskForMemoryLock
{
  return self->_taskForMemoryLock;
}

- (NSArray)speechProfileURLs
{
  return self->_speechProfileURLs;
}

- (BOOL)atypicalSpeech
{
  return self->_atypicalSpeech;
}

- (BOOL)enableParallelLoading
{
  return self->_enableParallelLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechProfileURLs, 0);
  objc_storeStrong((id *)&self->_taskForMemoryLock, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_supplementalModelURL, 0);
}

@end
