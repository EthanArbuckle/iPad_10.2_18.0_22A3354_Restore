@implementation ICAttachmentImageModel

void __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isChildOfDocumentGallery"))
    {
      v5 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v4);

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_74;
      v11[3] = &unk_1EA7DD3A0;
      v12 = *(id *)(a1 + 56);
      v6 = (id)objc_msgSend(v4, "loadImage:aboutToLoadHandler:forceFullSizeImage:", v11, 0, 1);

    }
    else
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 56);
      v10.receiver = *(id *)(a1 + 48);
      v10.super_class = (Class)&off_1F0483C10;
      v9 = objc_msgSendSuper2(&v10, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v7, v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "ic_JPEGData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

}

void __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviderWritingURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v5, v6, "Providing gallery image attachment: %@ => %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

@end
