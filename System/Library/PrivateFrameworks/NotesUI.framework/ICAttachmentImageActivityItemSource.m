@implementation ICAttachmentImageActivityItemSource

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__50;
  v17 = __Block_byref_object_dispose__50;
  v18 = 0;
  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__ICAttachmentImageActivityItemSource_activityViewController_dataTypeIdentifierForActivityType___block_invoke;
  v12[3] = &unk_1E5C1D9D0;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v9, "performBlockAndWait:", v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __96__ICAttachmentImageActivityItemSource_activityViewController_dataTypeIdentifierForActivityType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typeUTI");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__50;
  v22 = __Block_byref_object_dispose__50;
  v23 = 0;
  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__ICAttachmentImageActivityItemSource_activityViewController_itemForActivityType___block_invoke;
  v14[3] = &unk_1E5C228F0;
  v14[4] = self;
  v10 = v7;
  v15 = v10;
  v17 = &v18;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __82__ICAttachmentImageActivityItemSource_activityViewController_itemForActivityType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(*(id *)(a1 + 32), "handleActivityTypeAsURL:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "media");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mediaURL");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  if (v7)
  {
    v8 = v7;
    v9 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "image");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

}

- (BOOL)handleActivityTypeAsURL:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB230]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB228]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB220]);

  return v4;
}

@end
