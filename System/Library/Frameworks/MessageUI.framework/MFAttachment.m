@implementation MFAttachment

BOOL __58__MFAttachment_Utilities__compressContentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "fileName");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __58__MFAttachment_Utilities__compressContentsWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  return v3 == 0;
}

BOOL __60__MFAttachment_Utilities__decompressContentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "fileName");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __60__MFAttachment_Utilities__decompressContentsWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mainEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  }
  return v3 == 0;
}

void __69__MFAttachment_Utilities__enqueueScaleAttachmentWithCompletionBlock___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + (int)*MEMORY[0x1E0D4D628]), "attachmentForURL:error:", a1[5], 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    v2 = (id)objc_msgSend(v3, "scaledImageToFit:saveScaledImage:attachmentContextID:", a1[6], 0, 0);

}

void __69__MFAttachment_Utilities__enqueueScaleAttachmentWithCompletionBlock___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + (int)*MEMORY[0x1E0D4D628]), "attachmentForURL:error:", a1[5], 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

void __48__MFAttachment_Utilities__isBasicImageMimeType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("image/jpeg"), CFSTR("image/png"), CFSTR("image/gif"), 0);
  v1 = (void *)isBasicImageMimeType__sBasicImageMIMETypes;
  isBasicImageMimeType__sBasicImageMIMETypes = v0;

}

void __58__MFAttachment_Utilities__compressContentsWithCompletion___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1AB96A000, "#Attachments Attachment %@ failed to compress due to [%{public}@]", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

void __60__MFAttachment_Utilities__decompressContentsWithCompletion___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1AB96A000, "#Attachments Attachment %@ failed to decompress due to [%{public}@]", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

@end
