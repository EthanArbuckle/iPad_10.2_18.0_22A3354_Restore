@implementation BRCStringAdditions

+ (id)_br_currentMobileDocumentsDirForLegacy
{
  void *v2;
  void *v3;
  void *v4;

  if (BRCurrentPersonaIsDataSeparated())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_personaGroupDirForFPFS:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("File Provider Storage/Library/Mobile Documents"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentHomeDir");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", *MEMORY[0x1E0D10DA8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
