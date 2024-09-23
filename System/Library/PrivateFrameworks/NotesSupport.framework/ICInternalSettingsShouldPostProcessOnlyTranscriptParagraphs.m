@implementation ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs

void __ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_isEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PostProcessOnlyTranscriptParagraphs"));

}

@end
