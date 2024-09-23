@implementation CKAnimatedStickerMediaObject

- (id)attachmentSummary:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    v6 = CFSTR("SUMMARY_STICKER_TYPE");
  else
    v6 = CFSTR("SUMMARY_STICKER_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)shouldShadePreview
{
  return 0;
}

@end
