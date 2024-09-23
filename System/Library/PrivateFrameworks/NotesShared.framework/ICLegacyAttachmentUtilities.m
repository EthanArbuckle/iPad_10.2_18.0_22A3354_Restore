@implementation ICLegacyAttachmentUtilities

+ (id)contentIDStringFromCIDURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cid")))
  {
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "length") < 5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v5, "substringFromIndex:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)importLegacyAttachment:(id)a3 toNote:(id)a4 attachmentPreviewGenerator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38 = 0;
  v39[0] = &v38;
  v39[1] = 0x3032000000;
  v39[2] = __Block_byref_object_copy__58;
  v39[3] = __Block_byref_object_dispose__58;
  v40 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__58;
  v36 = __Block_byref_object_dispose__58;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__58;
  v30 = __Block_byref_object_dispose__58;
  v31 = 0;
  objc_msgSend(v8, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __88__ICLegacyAttachmentUtilities_importLegacyAttachment_toNote_attachmentPreviewGenerator___block_invoke;
  v21 = &unk_1E76CD6E8;
  v23 = &v38;
  v12 = v8;
  v22 = v12;
  v24 = &v32;
  v25 = &v26;
  objc_msgSend(v11, "performBlockAndWait:", &v18);

  v13 = *(_QWORD *)(v39[0] + 40);
  objc_msgSend(v9, "managedObjectContext", v18, v19, v20, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment attachmentWithIdentifier:context:](ICAttachment, "attachmentWithIdentifier:context:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[ICLegacyAttachmentUtilities importLegacyAttachment:toNote:attachmentPreviewGenerator:].cold.1((uint64_t)v39, v16, v17);

    objc_msgSend(v9, "addAttachmentWithIdentifier:", *(_QWORD *)(v39[0] + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Imported HTML attachment"));
  }
  objc_msgSend(v15, "setIdentifier:", *(_QWORD *)(v39[0] + 40));
  objc_msgSend(v15, "setTypeUTI:", v33[5]);
  objc_msgSend(v15, "setNote:", v9);
  objc_msgSend(v9, "addAttachmentsObject:", v15);
  objc_msgSend(a1, "importFileAtURL:toAttachment:attachmentPreviewGenerator:", v27[5], v15, v10);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
}

void __88__ICLegacyAttachmentUtilities_importLegacyAttachment_toNote_attachmentPreviewGenerator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "typeUTI");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

+ (void)importFileAtURL:(id)a3 toAttachment:(id)a4 attachmentPreviewGenerator:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
    goto LABEL_9;
  v25 = 0;
  v10 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", &v25);
  v11 = v25;
  v12 = v11;
  if (v10)
  {
    v24 = 0;
    v13 = *MEMORY[0x1E0C99A70];
    v23 = 0;
    v14 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v24, v13, &v23);
    v15 = v24;
    v16 = v23;
    if (v14)
    {
      objc_msgSend(v8, "setTitle:", v15);
    }
    else
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v7, 0);
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v19);

    }
    objc_msgSend(v8, "media");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v21 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        +[ICLegacyAttachmentUtilities importFileAtURL:toAttachment:attachmentPreviewGenerator:].cold.2(v8, v21);

      objc_msgSend(v8, "addMediaWithURL:updateFileBasedAttributes:", v7, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateChangeCountWithReason:", CFSTR("Imported HTML media"));
      objc_msgSend(v22, "updateChangeCountWithReason:", CFSTR("Imported HTML media"));
      objc_msgSend(v8, "ic_postNotificationOnMainThreadWithName:", CFSTR("ICAttachmentDidLoadNotification"));

    }
    goto LABEL_18;
  }
  if (v11)
  {
    v15 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ICLegacyAttachmentUtilities importFileAtURL:toAttachment:attachmentPreviewGenerator:].cold.3(v8, (uint64_t)v12, v15);

  }
  else
  {
LABEL_9:
    v15 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[ICLegacyAttachmentUtilities importFileAtURL:toAttachment:attachmentPreviewGenerator:].cold.1(v8, v15);
    v12 = v15;
  }
LABEL_18:

  objc_msgSend(v9, "generatePreviewIfNeededForAttachment:", v8);
}

+ (id)typeUTIFromFileURL:(id)a3 mimeType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  CGImageSource *v17;
  CGImageSource *v18;
  __CFString *Type;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  id v24;
  id v25;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v11 = 0;
    v10 = 0;
    if (!v6)
      goto LABEL_11;
    goto LABEL_9;
  }
  v25 = 0;
  v8 = *MEMORY[0x1E0C99AD0];
  v24 = 0;
  v9 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v25, v8, &v24);
  v10 = v25;
  v11 = v24;
  if ((v9 & 1) == 0)
  {
    v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ICLegacyAttachmentUtilities typeUTIFromFileURL:mimeType:].cold.1();

  }
  if (v7)
  {
LABEL_9:
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferredMIMEType");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_11:
  if (v5)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CEC4A0]))
      {

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isDynamic");

        if (!v16)
          goto LABEL_22;
      }
    }
    v17 = CGImageSourceCreateWithURL((CFURLRef)v5, 0);
    if (v17)
    {
      v18 = v17;
      Type = (__CFString *)CGImageSourceGetType(v17);
      CFRelease(v18);
      v20 = Type;
      v21 = v20;
      if (v20)
      {
        v22 = v20;

        v10 = v22;
      }

    }
  }
  if (!v10)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:

  return v10;
}

+ (id)attachmentWithContentID:(id)a3 context:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;

  v5 = (objc_class *)MEMORY[0x1E0C97B48];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithEntityName:", CFSTR("NoteAttachment"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contentID"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v9);
  v15 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v8, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v15;
  if (v11)
  {
    v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ICLegacyAttachmentUtilities attachmentWithContentID:context:].cold.1();

  }
  objc_msgSend(v10, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)importLegacyAttachment:(uint64_t)a1 toNote:(NSObject *)a2 attachmentPreviewGenerator:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Importing legacy attachment %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

+ (void)importFileAtURL:(void *)a1 toAttachment:(NSObject *)a2 attachmentPreviewGenerator:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "No file URL for legacy attachment %@", v5);

  OUTLINED_FUNCTION_4_0();
}

+ (void)importFileAtURL:(void *)a1 toAttachment:(NSObject *)a2 attachmentPreviewGenerator:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Importing media for legacy attachment %@", v5);

  OUTLINED_FUNCTION_4_0();
}

+ (void)importFileAtURL:(void *)a1 toAttachment:(uint64_t)a2 attachmentPreviewGenerator:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "No reachable file for legacy attachment %@: %@", v6, 0x16u);

}

+ (void)typeUTIFromFileURL:mimeType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error getting type UTI for legacy attachment: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)attachmentWithContentID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error fetching attachments: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
