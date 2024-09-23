@implementation AVSpeechSynthesisProviderAudioUnit

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1)
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_4333);
}

- (NSArray)speechVoices
{
  return self->_speechVoices;
}

- (void)setSpeechVoices:(NSArray *)speechVoices
{
  objc_storeStrong((id *)&self->_speechVoices, speechVoices);
}

- (AVSpeechSynthesisProviderOutputBlock)speechSynthesisOutputMetadataBlock
{
  return self->_speechSynthesisOutputMetadataBlock;
}

- (void)setSpeechSynthesisOutputMetadataBlock:(AVSpeechSynthesisProviderOutputBlock)speechSynthesisOutputMetadataBlock
{
  objc_setProperty_nonatomic_copy(self, a2, speechSynthesisOutputMetadataBlock, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_speechSynthesisOutputMetadataBlock, 0);
  objc_storeStrong((id *)&self->_speechVoices, 0);
}

@end
