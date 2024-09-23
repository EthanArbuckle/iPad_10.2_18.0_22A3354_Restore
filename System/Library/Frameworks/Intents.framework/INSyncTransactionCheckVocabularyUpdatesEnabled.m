@implementation INSyncTransactionCheckVocabularyUpdatesEnabled

void __INSyncTransactionCheckVocabularyUpdatesEnabled_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("VoiceCommandNameType");
  v4 = CFSTR("com.apple.VoiceShortcuts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)INSyncTransactionCheckVocabularyUpdatesEnabled_vocabularyUpdatesOverrides;
  INSyncTransactionCheckVocabularyUpdatesEnabled_vocabularyUpdatesOverrides = v1;

}

@end
