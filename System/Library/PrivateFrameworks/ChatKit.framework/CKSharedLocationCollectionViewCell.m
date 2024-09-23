@implementation CKSharedLocationCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKSharedLocationCollectionViewCell_reuseIdentifier");
}

- (void)configureWithAttachmentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  -[CKSharedAssetCollectionViewCell previewTitleLabel](self, "previewTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSharedAssetCollectionViewCell formattedTitleFromPreviewTitle:](self, "formattedTitleFromPreviewTitle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v7);

  +[CKPreviewDispatchCache detailsPreviewCache](CKPreviewDispatchCache, "detailsPreviewCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__CKSharedLocationCollectionViewCell_configureWithAttachmentItem___block_invoke;
  v9[3] = &unk_1E27504B8;
  v9[4] = self;
  objc_msgSend(v4, "generatePreviewWithCompletion:", v9);

}

void __66__CKSharedLocationCollectionViewCell_configureWithAttachmentItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "previewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "CGImage");

  objc_msgSend(v7, "setContents:", v6);
  objc_msgSend(v7, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  objc_msgSend(v7, "setMasksToBounds:", 1);

}

@end
