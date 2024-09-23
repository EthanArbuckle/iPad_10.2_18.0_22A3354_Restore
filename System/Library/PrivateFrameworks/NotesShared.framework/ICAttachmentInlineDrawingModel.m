@implementation ICAttachmentInlineDrawingModel

- (BOOL)previewsSupportMultipleAppearances
{
  return 1;
}

- (BOOL)showThumbnailInNoteList
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[ICAttachmentModel hasThumbnailImage](self, "hasThumbnailImage"))
    return 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)shouldShowInContentInfoText
{
  return 1;
}

- (BOOL)isIncludedInGenericAttachmentCount
{
  return 0;
}

- (BOOL)hasPreviews
{
  return 1;
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Handwritten note"), CFSTR("Handwritten note"), 0, 1);
}

- (BOOL)preferLocalPreviewImages
{
  return 1;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  return 1;
}

- (BOOL)providesStandaloneTitleForNote
{
  return 1;
}

- (id)standaloneTitleForNote
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v5, "length"))
  {
    +[ICNote defaultTitleForEmptyNote](ICNote, "defaultTitleForEmptyNote");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }

  return v5;
}

- (id)additionalIndexableTextContentInNote
{
  void *v2;
  void *v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalIndexableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchableTextContentInNote
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  *a3 = CFSTR("img");
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fallbackImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachment fallbackImageUTI](ICAttachment, "fallbackImageUTI");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachment mimeTypeFromUTI:](ICAttachment, "mimeTypeFromUTI:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("style=\"max-width: 100%%; max-height: 100%%;\" src=\"data:%@;base64,%@\"),
      v8,
      v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3
{
  return CFSTR("png");
}

- (PKDrawing)handwritingRecognitionDrawing
{
  return (PKDrawing *)objc_getAssociatedObject(self, (const void *)ICHandwritingRecognitionDrawingKey);
}

- (void)setHandwritingRecognitionDrawing:(id)a3
{
  objc_setAssociatedObject(self, (const void *)ICHandwritingRecognitionDrawingKey, a3, (void *)1);
}

- (id)newDrawingFromMergeableData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v8 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1158]), "initWithData:error:", v3, &v8);
    v5 = v8;
    if (v5)
    {
      v6 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[ICAttachmentInlineDrawingModel newDrawingFromMergeableData].cold.1((uint64_t)v5, v6);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)newDrawingFromMergeableData
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "newDrawingFromMergeableData error creating currentDrawing %@", (uint8_t *)&v2, 0xCu);
}

@end
