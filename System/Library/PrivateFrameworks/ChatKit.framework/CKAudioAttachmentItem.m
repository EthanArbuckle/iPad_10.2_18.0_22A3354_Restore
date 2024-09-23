@implementation CKAudioAttachmentItem

+ (id)UTITypes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexesOfObjectsPassingTest:", &__block_literal_global_135);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __33__CKAudioAttachmentItem_UTITypes__block_invoke(int a1, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E0CA5AC8]) != 0;
}

- (id)cachedPreview
{
  return 0;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKAttachmentItem fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audio Message.caf")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("Audio Message.amr")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SUMMARY_AUDIO_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
