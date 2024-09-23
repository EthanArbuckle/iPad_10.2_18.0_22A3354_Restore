@implementation ICQLItem

- (ICQLItem)initWithAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICQLItem *v7;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isPasswordProtected"))
  {
    objc_msgSend(v4, "typeUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10.receiver = self;
    v10.super_class = (Class)ICQLItem;
    v7 = -[ICQLItem initWithDataProvider:contentType:previewTitle:](&v10, sel_initWithDataProvider_contentType_previewTitle_, self, v5, v6);

  }
  else
  {
    objc_msgSend(v4, "previewItemURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9.receiver = self;
    v9.super_class = (Class)ICQLItem;
    v7 = -[ICQLItem initWithURL:](&v9, sel_initWithURL_, v5);
  }

  if (v7)
    -[ICQLItem setAttachment:](v7, "setAttachment:", v4);

  return v7;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  -[ICQLItem attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewItemTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)provideDataForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__24;
  v14 = __Block_byref_object_dispose__24;
  v15 = 0;
  -[ICQLItem attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__ICQLItem_provideDataForItem___block_invoke;
  v9[3] = &unk_1EA7DE5C8;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __31__ICQLItem_provideDataForItem___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForQuickLook");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_getProperty(self, a2, 360, 1);
}

- (void)setAttachment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
