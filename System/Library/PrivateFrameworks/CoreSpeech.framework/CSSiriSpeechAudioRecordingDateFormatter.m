@implementation CSSiriSpeechAudioRecordingDateFormatter

uint64_t ___CSSiriSpeechAudioRecordingDateFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_CSSiriSpeechAudioRecordingDateFormatter_dateFormatter;
  _CSSiriSpeechAudioRecordingDateFormatter_dateFormatter = (uint64_t)v0;

  v2 = (void *)_CSSiriSpeechAudioRecordingDateFormatter_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en-US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)_CSSiriSpeechAudioRecordingDateFormatter_dateFormatter, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss.SSS"));
}

@end
