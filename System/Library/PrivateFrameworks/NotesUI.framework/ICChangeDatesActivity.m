@implementation ICChangeDatesActivity

- (ICChangeDatesActivity)initWithObject:(id)a3 activityType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  ICChangeDatesActivity *v7;
  ICChangeDatesActivity *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICChangeDatesActivity;
  v7 = -[UIActivity init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ICChangeDatesActivity setRepresentedObject:](v7, "setRepresentedObject:", v6);
    -[ICChangeDatesActivity setType:](v8, "setType:", v4);
  }

  return v8;
}

- (id)activityViewController
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  ICChangeDatesActivity *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("\n\n\n\n\n\n\n\n\n\n\n\nChange Dates"), CFSTR("Change Modification Date or Creation Date"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0DC36F0]);
  objc_msgSend(v4, "setDatePickerMode:", 2);
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0DC3448];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__ICChangeDatesActivity_activityViewController__block_invoke;
  v20[3] = &unk_1E5C22E18;
  v20[4] = self;
  v8 = v4;
  v21 = v8;
  objc_msgSend(v7, "actionWithTitle:style:handler:", CFSTR("Set Modification Date"), 0, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  v14 = v6;
  v15 = 3221225472;
  v16 = __47__ICChangeDatesActivity_activityViewController__block_invoke_2;
  v17 = &unk_1E5C22E18;
  v18 = self;
  v19 = v8;
  v11 = v8;
  objc_msgSend(v10, "actionWithTitle:style:handler:", CFSTR("Set Creation Date"), 0, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v12, v14, v15, v16, v17, v18);

  return v3;
}

void __47__ICChangeDatesActivity_activityViewController__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v2 == 1)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setModificationDateForAttachmentObject:");
  }
  else
  {
    if (v2)
      return;
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setModificationDateForNoteObject:");
  }

}

void __47__ICChangeDatesActivity_activityViewController__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v2 == 1)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCreationDateForAttachmentObject:");
  }
  else
  {
    if (v2)
      return;
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCreationDateForNoteObject:");
  }

}

- (void)setModificationDateForNoteObject:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  -[ICChangeDatesActivity representedObject](self, "representedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[ICChangeDatesActivity representedObject](self, "representedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "setModificationDate:", v14);
    objc_msgSend(v7, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "ic_isLaterThanDate:", v14);

    if ((v9 & 1) != 0)
LABEL_3:
      objc_msgSend(v7, "setCreationDate:", v14);
  }
  else
  {
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
      goto LABEL_8;
    -[ICChangeDatesActivity representedObject](self, "representedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModificationDate:", v14);
    objc_msgSend(v7, "creationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "ic_isLaterThanDate:", v14);

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(v7, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_save");

LABEL_8:
}

- (void)setCreationDateForNoteObject:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  -[ICChangeDatesActivity representedObject](self, "representedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[ICChangeDatesActivity representedObject](self, "representedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "setCreationDate:", v14);
    objc_msgSend(v7, "modificationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "ic_isEarlierThanDate:", v14);

    if ((v9 & 1) != 0)
LABEL_3:
      objc_msgSend(v7, "setModificationDate:", v14);
  }
  else
  {
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
      goto LABEL_8;
    -[ICChangeDatesActivity representedObject](self, "representedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCreationDate:", v14);
    objc_msgSend(v7, "modificationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "ic_isEarlierThanDate:", v14);

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(v7, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_save");

LABEL_8:
}

- (void)setModificationDateForAttachmentObject:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ICChangeDatesActivity representedObject](self, "representedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICChangeDatesActivity representedObject](self, "representedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModificationDate:", v10);
    objc_msgSend(v6, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ic_isLaterThanDate:", v10);

    if (v8)
      objc_msgSend(v6, "setCreationDate:", v10);
    objc_msgSend(v6, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_save");

  }
}

- (void)setCreationDateForAttachmentObject:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ICChangeDatesActivity representedObject](self, "representedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICChangeDatesActivity representedObject](self, "representedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCreationDate:", v10);
    objc_msgSend(v6, "modificationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ic_isEarlierThanDate:", v10);

    if (v8)
      objc_msgSend(v6, "setModificationDate:", v10);
    objc_msgSend(v6, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_save");

  }
}

- (id)activityType
{
  return CFSTR("com.apple.notes.change-dates");
}

- (id)activityTitle
{
  return CFSTR("Change Dates");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeStrong(&self->_representedObject, a3);
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representedObject, 0);
}

@end
