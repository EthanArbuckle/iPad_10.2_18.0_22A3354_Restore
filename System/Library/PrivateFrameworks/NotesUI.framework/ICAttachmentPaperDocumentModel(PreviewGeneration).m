@implementation ICAttachmentPaperDocumentModel(PreviewGeneration)

- (BOOL)tooLargeForPreviewGeneration
{
  void *v2;
  int v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "attachmentType");

  if (v3 == 15)
  {
    v4 = objc_msgSend(a1, "paperPageCount");
    objc_msgSend(MEMORY[0x1E0D63A78], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "maxSubAttachmentsPerAttachment");

    if (v4 > v6)
      return 1;
  }
  objc_msgSend(a1, "paperBundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ic_fileOrDirectorySize");

  return v9 > 209715200;
}

@end
