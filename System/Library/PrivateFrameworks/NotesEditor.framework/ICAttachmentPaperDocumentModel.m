@implementation ICAttachmentPaperDocumentModel

uint64_t __94__ICAttachmentPaperDocumentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__ICAttachmentPaperDocumentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2;
  v9[3] = &unk_1EA7DD3F0;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v7, "performBlock:", v9);

  return 0;
}

void __94__ICAttachmentPaperDocumentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", a1[4], a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = a1[6];
  objc_msgSend(v4, "previewItemURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v2 + 16))(v2, v3, 0, 0);

}

@end
