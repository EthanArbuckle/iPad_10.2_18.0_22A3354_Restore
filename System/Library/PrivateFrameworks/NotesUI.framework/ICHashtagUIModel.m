@implementation ICHashtagUIModel

- (id)labelColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[ICInlineAttachmentUIModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__ICHashtagUIModel_labelColor__block_invoke;
  v9[3] = &unk_1E5C20078;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v9);

  if (*((_BYTE *)v11 + 24))
  {
    v8.receiver = self;
    v8.super_class = (Class)ICHashtagUIModel;
    -[ICInlineAttachmentUIModel labelColor](&v8, sel_labelColor);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICHashtagColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __30__ICHashtagUIModel_labelColor__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeletedOrInTrash");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 | v6;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v7 = (void *)MEMORY[0x1E0D63B20];
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tokenContentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hashtagWithStandardizedContent:account:", v9, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v13 == 0;
  }
}

@end
