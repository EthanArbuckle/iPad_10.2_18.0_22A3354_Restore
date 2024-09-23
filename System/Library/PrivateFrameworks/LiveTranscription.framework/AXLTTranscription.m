@implementation AXLTTranscription

- (BOOL)_shouldUseNonUpdatingSegments
{
  if (_shouldUseNonUpdatingSegments_onceToken != -1)
    dispatch_once(&_shouldUseNonUpdatingSegments_onceToken, &__block_literal_global_0);
  return objc_msgSend((id)_shouldUseNonUpdatingSegments_s_userDefaults, "BOOLForKey:", CFSTR("DoNotUpdatePastCaptionsKey"));
}

void __50__AXLTTranscription__shouldUseNonUpdatingSegments__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.accessibility.LiveCaptions"));
  v1 = (void *)_shouldUseNonUpdatingSegments_s_userDefaults;
  _shouldUseNonUpdatingSegments_s_userDefaults = v0;

}

- (AXLTTranscription)initWithRecognitionTask:(id)a3 transcription:(id)a4 previousTranscription:(id)a5
{
  id v9;
  id v10;
  id v11;
  AXLTTranscription *v12;
  AXLTTranscription *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *nonUpdatingSegments;
  uint64_t v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AXLTTranscription;
  v12 = -[AXLTTranscription init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_task, a3);
    objc_storeStrong((id *)&v13->_transcription, a4);
    if (-[AXLTTranscription _shouldUseNonUpdatingSegments](v13, "_shouldUseNonUpdatingSegments"))
    {
      objc_msgSend(v11, "nonUpdatingSegments");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "segments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXLTSegmentUtilities mergeOldSegments:withNewSegments:](AXLTSegmentUtilities, "mergeOldSegments:withNewSegments:", v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      nonUpdatingSegments = v13->_nonUpdatingSegments;
      v13->_nonUpdatingSegments = (NSArray *)v16;

    }
    else
    {
      objc_msgSend(v10, "segments");
      v18 = objc_claimAutoreleasedReturnValue();
      v14 = v13->_nonUpdatingSegments;
      v13->_nonUpdatingSegments = (NSArray *)v18;
    }

  }
  return v13;
}

- (NSString)formattedString
{
  void *v2;
  void *v3;

  -[AXLTTranscription transcription](self, "transcription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)segments
{
  void *v2;
  void *v3;

  -[AXLTTranscription transcription](self, "transcription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)taskIdentifier
{
  void *v2;
  void *v3;

  -[AXLTTranscription task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SFSpeechRecognitionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSArray)nonUpdatingSegments
{
  return self->_nonUpdatingSegments;
}

- (void)setNonUpdatingSegments:(id)a3
{
  objc_storeStrong((id *)&self->_nonUpdatingSegments, a3);
}

- (SFTranscription)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
  objc_storeStrong((id *)&self->_transcription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_nonUpdatingSegments, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
