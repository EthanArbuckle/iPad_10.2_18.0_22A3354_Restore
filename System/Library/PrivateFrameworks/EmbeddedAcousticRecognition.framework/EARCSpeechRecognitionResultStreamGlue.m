@implementation EARCSpeechRecognitionResultStreamGlue

- (EARCSpeechRecognitionResultStreamGlue)initWithStream:(EARCSpeechRecognitionResultStream *)a3
{
  EARCSpeechRecognitionResultStreamGlue *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EARCSpeechRecognitionResultStreamGlue;
  result = -[EARCSpeechRecognitionResultStreamGlue init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->ctx;
    v6 = *(_OWORD *)&a3->DidRecognizePartialResultTokens;
    *(_OWORD *)&result->_stream.DidRecognizeFinalResults = *(_OWORD *)&a3->DidRecognizeFinalResults;
    *(_OWORD *)&result->_stream.DidRecognizePartialResultTokens = v6;
    *(_OWORD *)&result->_stream.ctx = v5;
  }
  return result;
}

- (void)dealloc
{
  void (*DisposeContext)(void *, SEL);
  objc_super v4;

  DisposeContext = (void (*)(void *, SEL))self->_stream.DisposeContext;
  if (DisposeContext)
    DisposeContext(self->_stream.ctx, a2);
  v4.receiver = self;
  v4.super_class = (Class)EARCSpeechRecognitionResultStreamGlue;
  -[EARCSpeechRecognitionResultStreamGlue dealloc](&v4, sel_dealloc);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  if (self->_stream.DidRecognizePartialResultTokens)
    ((void (*)(void *, uint64_t))self->_stream.DidRecognizePartialResultTokens)(self->_stream.ctx, objc_msgSend(a4, "tokens", a3));
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  void (*DidFinishRecognitionWithError)(void *, id);

  DidFinishRecognitionWithError = (void (*)(void *, id))self->_stream.DidFinishRecognitionWithError;
  if (DidFinishRecognitionWithError)
    DidFinishRecognitionWithError(self->_stream.ctx, a4);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6
{
  void (*DidRecognizeFinalResults)(void *, id, id, id);

  DidRecognizeFinalResults = (void (*)(void *, id, id, id))self->_stream.DidRecognizeFinalResults;
  if (DidRecognizeFinalResults)
    DidRecognizeFinalResults(self->_stream.ctx, a5, a6, a4);
}

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  void (*DidProcessAudioDuration)(void *, double);

  DidProcessAudioDuration = (void (*)(void *, double))self->_stream.DidProcessAudioDuration;
  if (DidProcessAudioDuration)
    DidProcessAudioDuration(self->_stream.ctx, a4);
}

@end
