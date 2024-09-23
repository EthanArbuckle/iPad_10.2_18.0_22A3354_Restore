@implementation CKPassbookMediaObject

- (BOOL)isSupported
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsPassbookAttachments");

  return v3;
}

+ (BOOL)isPreviewable
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsPassbookAttachments");

  return v3;
}

+ (id)UTITypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.pkpass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E0D386E0];
}

+ (id)fallbackFilenamePrefix
{
  return CFSTR("PASS");
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
    v6 = CFSTR("SUMMARY_PASS_TYPE");
  else
    v6 = CFSTR("SUMMARY_PASS_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)mediaType
{
  return 7;
}

- (Class)previewBalloonViewClass
{
  void *v3;
  objc_super v5;

  if (-[CKPassbookMediaObject isSupported](self, "isSupported"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKPassbookMediaObject;
    -[CKMediaObject previewBalloonViewClass](&v5, sel_previewBalloonViewClass);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKMediaObject placeholderBalloonViewClass](self, "placeholderBalloonViewClass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  objc_super v9;

  v4 = a4;
  if (-[CKPassbookMediaObject isSupported](self, "isSupported"))
  {
    v9.receiver = self;
    v9.super_class = (Class)CKPassbookMediaObject;
    -[CKMediaObject previewForWidth:orientation:](&v9, sel_previewForWidth_orientation_, v4, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v4 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", a3, 3.0, 4.0);
  v9 = v8;
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thumbnailContentAlignmentInsetsForOrientation:", v4);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  return -[CKMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", v9, v11, v14, v16, v18, v20);
}

- (BOOL)shouldShowViewer
{
  void *v2;
  char v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFileDataReady");

  return v3;
}

- (BOOL)shouldBeQuickLooked
{
  return 0;
}

- (BOOL)shouldShowDisclosure
{
  return 0;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SUMMARY_PASS_TYPE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKPass)pass
{
  PKPass *v3;
  PKPass *pass;
  id v5;
  void *v6;
  PKPass *v7;
  PKPass *v8;

  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    _IMWarn();
    v3 = 0;
  }
  else
  {
    pass = self->_pass;
    if (!pass)
    {
      if (pass_onceToken != -1)
        dispatch_once(&pass_onceToken, &__block_literal_global_227);
      v5 = objc_alloc((Class)sPKPassClass);
      -[CKMediaObject data](self, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (PKPass *)objc_msgSend(v5, "initWithData:error:", v6, 0);
      v8 = self->_pass;
      self->_pass = v7;

      -[PKPass loadContentSync](self->_pass, "loadContentSync");
      pass = self->_pass;
    }
    v3 = pass;
  }
  return v3;
}

uint64_t __29__CKPassbookMediaObject_pass__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("PKPass"), CFSTR("PassKit"));
  sPKPassClass = result;
  return result;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
