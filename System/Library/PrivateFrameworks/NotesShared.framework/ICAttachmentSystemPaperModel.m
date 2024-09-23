@implementation ICAttachmentSystemPaperModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  return +[ICAttachmentInlineDrawingModel contentInfoTextWithAttachmentCount:](ICAttachmentInlineDrawingModel, "contentInfoTextWithAttachmentCount:", a3);
}

- (CGRect)paperContentBoundsHint
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_17;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("paperContentBoundsOriginXKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("paperContentBoundsOriginYKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("paperContentBoundsWidthKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("paperContentBoundsHeightKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = !v8 || v9 == 0;
  v14 = v13 || v10 == 0;
  v15 = v14 || v11 == 0;
  v16 = !v15;
  if (!v15)
  {
    objc_msgSend(v8, "doubleValue");
    v2 = v17;
    objc_msgSend(v9, "doubleValue");
    v3 = v18;
    objc_msgSend(v10, "doubleValue");
    v4 = v19;
    objc_msgSend(v12, "doubleValue");
    v5 = v20;
  }

  if (!v16)
  {
LABEL_17:
    v2 = *MEMORY[0x1E0C9D628];
    v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v21 = v2;
  v22 = v3;
  v23 = v4;
  v24 = v5;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)setPaperContentBoundsHint:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  _QWORD v8[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICAttachmentModel attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__ICAttachmentSystemPaperModel_setPaperContentBoundsHint___block_invoke;
  v8[3] = &__block_descriptor_64_e29_v16__0__NSMutableDictionary_8l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  *(CGFloat *)&v8[6] = width;
  *(CGFloat *)&v8[7] = height;
  objc_msgSend(v7, "updateAttachmentMetadataWithBlock:", v8);

}

void __58__ICAttachmentSystemPaperModel_setPaperContentBoundsHint___block_invoke(double *a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  CGRect v13;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v12 = a2;
  v13.origin.x = v3;
  v13.origin.y = v4;
  v13.size.width = v5;
  v13.size.height = v6;
  if (CGRectIsNull(v13))
  {
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("paperContentBoundsOriginXKey"));
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("paperContentBoundsOriginYKey"));
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("paperContentBoundsWidthKey"));
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("paperContentBoundsHeightKey"));
    v7 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1[4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("paperContentBoundsOriginXKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("paperContentBoundsOriginYKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1[6]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("paperContentBoundsWidthKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1[7]);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("paperContentBoundsHeightKey"));

    v7 = (void *)v11;
  }

}

- (void)setHasDeepLink:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ICAttachmentSystemPaperModel_setHasDeepLink___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v6 = a3;
  objc_msgSend(v4, "updateAttachmentMetadataWithBlock:", v5);

}

uint64_t __47__ICAttachmentSystemPaperModel_setHasDeepLink___block_invoke(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return objc_msgSend(a2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasDeepLinkKey"));
  else
    return objc_msgSend(a2, "removeObjectForKey:", CFSTR("hasDeepLinkKey"));
}

- (BOOL)hasDeepLink
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasDeepLinkKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a4 == 1)
  {
    if (a5)
    {
      v6 = a5;
      -[ICAttachmentModel attachment](self, "attachment");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("TokenContentIdentifierEncrypted"));

    }
  }
}

- (void)updateAfterLoadWithInlineAttachmentIdentifierMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _TtC11NotesShared21ICSystemPaperDocument *v7;
  void *v8;
  _TtC11NotesShared21ICSystemPaperDocument *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortLoggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [_TtC11NotesShared21ICSystemPaperDocument alloc];
  -[ICAttachmentModel attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICSystemPaperDocument initWithPaperAttachment:](v7, "initWithPaperAttachment:", v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke;
  v11[3] = &unk_1E76C92E0;
  v12 = v6;
  v10 = v6;
  -[ICSystemPaperDocument updateGraphDestinationsUsingInlineAttachmentIdentifierMap:completion:](v9, "updateGraphDestinationsUsingInlineAttachmentIdentifierMap:completion:", v4, v11);

}

void __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "SystemPaper");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_cold_2(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_cold_1(a1, v5);
  }

}

- (void)fixupMetadataAndMinimumSupportedNotesVersion
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "minimumSupportedNotesVersion is (%lld), but attachment is missing compatibility metadata; setting paperHasEnhancedCa"
    "nvas now. Attachment: %@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2();
}

- (BOOL)shouldShowInContentInfoText
{
  return 1;
}

- (BOOL)isIncludedInGenericAttachmentCount
{
  return 0;
}

- (BOOL)previewsSupportMultipleAppearances
{
  return 1;
}

- (BOOL)preferLocalPreviewImages
{
  return 0;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  return 1;
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

- (id)account
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__ICAttachmentSystemPaperModel_account__block_invoke;
  v7[3] = &unk_1E76C7730;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__ICAttachmentSystemPaperModel_account__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3
{
  return CFSTR("png");
}

void __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Updated graph destinations after load {attachment: %@}", (uint8_t *)&v3, 0xCu);
}

void __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Error updating graph destinations after load {attachment: %@, error: %@}", (uint8_t *)&v4, 0x16u);
}

@end
