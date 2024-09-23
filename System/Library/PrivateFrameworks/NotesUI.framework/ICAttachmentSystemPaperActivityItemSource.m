@implementation ICAttachmentSystemPaperActivityItemSource

- (id)attachmentTypeUTI
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__30;
  v18 = __Block_byref_object_dispose__30;
  v19 = 0;
  v8 = (void *)MEMORY[0x1AF445E78]();
  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__ICAttachmentSystemPaperActivityItemSource_activityViewController_itemForActivityType___block_invoke;
  v13[3] = &unk_1E5C20078;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v10, "performBlockAndWait:", v13);

  objc_autoreleasePoolPop(v8);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __88__ICAttachmentSystemPaperActivityItemSource_activityViewController_itemForActivityType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  UIImage *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageForActivityItem");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
