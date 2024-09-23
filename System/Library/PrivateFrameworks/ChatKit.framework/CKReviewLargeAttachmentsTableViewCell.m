@implementation CKReviewLargeAttachmentsTableViewCell

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKReviewLargeAttachmentsTableViewCell;
  -[CKAbstractReviewTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKReviewLargeAttachmentsTableViewCell previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[CKReviewLargeAttachmentsTableViewCell setAttachmentItem:](self, "setAttachmentItem:", 0);
}

+ (double)requestedHeight
{
  return 58.0;
}

+ (CGSize)leftHandSideViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 56.0;
  v3 = 56.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)leftHandSideView
{
  void *v3;
  id v4;
  void *v5;

  -[CKReviewLargeAttachmentsTableViewCell previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v5, "setContentMode:", 2);
    objc_msgSend(v5, "setClipsToBounds:", 1);
    -[CKReviewLargeAttachmentsTableViewCell setPreviewView:](self, "setPreviewView:", v5);
    -[CKReviewLargeAttachmentsTableViewCell _updateImageViewForAttachmentItem](self, "_updateImageViewForAttachmentItem");

  }
  return -[CKReviewLargeAttachmentsTableViewCell previewView](self, "previewView");
}

- (void)setModelObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v17 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("guid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("filename"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__ck_stringByExpandingTildeInPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v8, 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAbstractReviewTableViewCell setMainText:](self, "setMainText:", v9);

    }
    else
    {
      -[CKAbstractReviewTableViewCell setMainText:](self, "setMainText:", 0);
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("size"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "unsignedLongLongValue");
    else
      v12 = 0;
    -[CKAbstractReviewTableViewCell setSize:](self, "setSize:", v12);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAttachmentItemManager attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:](CKAttachmentItemManager, "attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v13, v5, v5, v8, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKReviewLargeAttachmentsTableViewCell setAttachmentItem:](self, "setAttachmentItem:", v14);

    -[CKReviewLargeAttachmentsTableViewCell attachmentItem](self, "attachmentItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[CKReviewLargeAttachmentsTableViewCell attachmentItem](self, "attachmentItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setShowDocumentIcon:", 0);

      -[CKReviewLargeAttachmentsTableViewCell _updateImageViewForAttachmentItem](self, "_updateImageViewForAttachmentItem");
    }
    else
    {
      -[CKAbstractReviewTableViewCell setMainText:](self, "setMainText:", 0);
      -[CKAbstractReviewTableViewCell setSize:](self, "setSize:", 0);
      -[CKReviewLargeAttachmentsTableViewCell setAttachmentItem:](self, "setAttachmentItem:", 0);
    }

  }
  else
  {
    -[CKAbstractReviewTableViewCell setMainText:](self, "setMainText:", 0);
    -[CKAbstractReviewTableViewCell setSize:](self, "setSize:", 0);
    -[CKReviewLargeAttachmentsTableViewCell setAttachmentItem:](self, "setAttachmentItem:", 0);
  }

}

- (void)_updateImageViewForAttachmentItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id from;
  id location;

  -[CKReviewLargeAttachmentsTableViewCell previewView](self, "previewView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[CKReviewLargeAttachmentsTableViewCell attachmentItem](self, "attachmentItem"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[CKReviewLargeAttachmentsTableViewCell attachmentItem](self, "attachmentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedPreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "image");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = v7;
      }
      v12 = v8;
      -[CKReviewLargeAttachmentsTableViewCell previewView](self, "previewView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImage:", v12);

    }
    else
    {
      location = 0;
      -[CKReviewLargeAttachmentsTableViewCell attachmentItem](self, "attachmentItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v9);

      from = 0;
      objc_initWeak(&from, self);
      +[CKPreviewDispatchCache detailsPreviewCache](CKPreviewDispatchCache, "detailsPreviewCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resume");

      -[CKReviewLargeAttachmentsTableViewCell attachmentItem](self, "attachmentItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __74__CKReviewLargeAttachmentsTableViewCell__updateImageViewForAttachmentItem__block_invoke;
      v15[3] = &unk_1E274A3A8;
      objc_copyWeak(&v16, &location);
      objc_copyWeak(&v17, &from);
      v15[4] = self;
      objc_msgSend(v11, "generatePreviewWithCompletion:", v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    -[CKReviewLargeAttachmentsTableViewCell previewView](self, "previewView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", 0);

  }
}

void __74__CKReviewLargeAttachmentsTableViewCell__updateImageViewForAttachmentItem__block_invoke(id *a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v4 = objc_loadWeakRetained(a1 + 6);
  v5 = v4;
  if (WeakRetained)
  {
    if (v4)
    {
      objc_msgSend(v4, "attachmentItem");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == WeakRetained)
      {
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(a1[4], "previewView");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setImage:", v10);
            goto LABEL_10;
          }
          objc_msgSend(v10, "image");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(WeakRetained, "fileIcon");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        v8 = (void *)v7;
        objc_msgSend(a1[4], "previewView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setImage:", v8);

LABEL_10:
      }
    }
  }

}

- (UIImageView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (CKAttachmentItem)attachmentItem
{
  return self->_attachmentItem;
}

- (void)setAttachmentItem:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentItem, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
}

@end
