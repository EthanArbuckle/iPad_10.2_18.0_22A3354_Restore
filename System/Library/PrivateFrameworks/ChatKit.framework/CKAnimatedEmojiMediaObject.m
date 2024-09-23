@implementation CKAnimatedEmojiMediaObject

+ (id)UTITypes
{
  __CFString *PreferredIdentifierForTag;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], CFSTR("emoji.gif"), (CFStringRef)*MEMORY[0x1E0CA5B68]);
  v5[0] = PreferredIdentifierForTag;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SUMMARY_ANIMATED_EMOJI"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)backgroundColorOverride
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
}

- (id)icon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (id)*MEMORY[0x1E0CA5B68];
  if (v2)
  {
    +[CKMediaObject iconCache](CKMediaObject, "iconCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForName:type:MIMEType:", 0, v2, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v5, 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        +[CKMediaObject iconCache](CKMediaObject, "iconCache");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v4, v2);

      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

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
    v6 = CFSTR("SUMMARY_ANIMATED_EMOJI");
  else
    v6 = CFSTR("SUMMARY_ANIMATED_EMOJIS");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)shouldScaleUpPreview
{
  return 1;
}

+ (BOOL)shouldShadePreview
{
  return 0;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emojiPreviewMaxWidth");
  v9 = v8;

  if (v9 <= a3)
    v10 = v9;
  else
    v10 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKAnimatedEmojiMediaObject;
  -[CKAnimatedImageMediaObject previewForWidth:orientation:](&v12, sel_previewForWidth_orientation_, v4, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
