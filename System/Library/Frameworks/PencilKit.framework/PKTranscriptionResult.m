@implementation PKTranscriptionResult

- (PKTranscriptionResult)initWithTranscription:(id)a3 didShowHUD:(BOOL)a4
{
  id v7;
  PKTranscriptionResult *v8;
  PKTranscriptionResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTranscriptionResult;
  v8 = -[PKTranscriptionResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transcription, a3);
    v9->_didShowHUD = a4;
  }

  return v9;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (BOOL)didShowHUD
{
  return self->_didShowHUD;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcription, 0);
}

@end
