@implementation ICAppGroupDefaults

void __44__ICAppGroupDefaults_sharedAppGroupDefaults__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[10];
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  ICGroupContainerIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);
  v3 = (void *)sharedAppGroupDefaults_s_sharedUserDefaults;
  sharedAppGroupDefaults_s_sharedUserDefaults = v2;

  v4 = (void *)sharedAppGroupDefaults_s_sharedUserDefaults;
  v6[0] = CFSTR("EnableLinkPresentation");
  v6[1] = CFSTR("EnableXPCPreviewGeneration");
  v7[0] = MEMORY[0x1E0C9AAB0];
  v7[1] = MEMORY[0x1E0C9AAB0];
  v6[2] = CFSTR("EnableSmartTags");
  v6[3] = CFSTR("DefaultToPaperKitAttachments");
  v7[2] = MEMORY[0x1E0C9AAB0];
  v7[3] = MEMORY[0x1E0C9AAB0];
  v6[4] = CFSTR("DefaultToPaperKitPDFsAndScans");
  v6[5] = CFSTR("EnableBlockQuote");
  v7[4] = MEMORY[0x1E0C9AAB0];
  v7[5] = MEMORY[0x1E0C9AAB0];
  v6[6] = CFSTR("EnableNewNoteAccelerator");
  v6[7] = CFSTR("EnableSpotlightInstantAnswers");
  v7[6] = MEMORY[0x1E0C9AAB0];
  v7[7] = MEMORY[0x1E0C9AAB0];
  v6[8] = CFSTR("SpotlightSearchSuggestions");
  v6[9] = CFSTR("EnableEmphasis");
  v7[8] = MEMORY[0x1E0C9AAB0];
  v7[9] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDefaults:", v5);

}

+ (NSUserDefaults)sharedAppGroupDefaults
{
  if (sharedAppGroupDefaults_once != -1)
    dispatch_once(&sharedAppGroupDefaults_once, &__block_literal_global_1);
  return (NSUserDefaults *)(id)sharedAppGroupDefaults_s_sharedUserDefaults;
}

@end
