@implementation CKSharedAudioCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKSharedAudioCollectionViewCell_reuseIdentifier");
}

- (void)configureWithAttachmentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "fileURL");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  CKAVURLAssetForURL(v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[CKSharedAudioCollectionViewCell formattedDurationTextForAsset:](self, "formattedDurationTextForAsset:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createdDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSharedAudioCollectionViewCell formattedCreatedDateTextFromDate:](self, "formattedCreatedDateTextFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@\n%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSharedAssetCollectionViewCell previewTitleLabel](self, "previewTitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSharedAssetCollectionViewCell formattedTitleFromPreviewTitle:](self, "formattedTitleFromPreviewTitle:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v12);

  -[CKSharedAudioCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  -[CKSharedAudioCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");

}

- (id)formattedDurationTextForAsset:(id)a3
{
  id v3;
  double (*v4)(_QWORD *);
  double v5;
  void *v6;
  _QWORD v8[3];

  v3 = a3;
  if (formattedDurationTextForAsset___pred_CMTimeGetSecondsCoreMedia != -1)
    dispatch_once(&formattedDurationTextForAsset___pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_196);
  v4 = (double (*)(_QWORD *))formattedDurationTextForAsset___CMTimeGetSeconds;
  if (v3)
    objc_msgSend(v3, "duration");
  else
    memset(v8, 0, sizeof(v8));
  v5 = v4(v8);
  CKLocalizedStringForDuration(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void *__65__CKSharedAudioCollectionViewCell_formattedDurationTextForAsset___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CMTimeGetSeconds", CFSTR("CoreMedia"));
  formattedDurationTextForAsset___CMTimeGetSeconds = result;
  return result;
}

- (id)formattedCreatedDateTextFromDate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", a3, 1, 0);
}

- (CKAudioProgressView)audioPlaybackView
{
  CKAudioProgressView *audioPlaybackView;
  CKAudioProgressView *v4;
  CKAudioProgressView *v5;
  void *v6;

  audioPlaybackView = self->_audioPlaybackView;
  if (!audioPlaybackView)
  {
    v4 = objc_alloc_init(CKAudioProgressView);
    v5 = self->_audioPlaybackView;
    self->_audioPlaybackView = v4;

    -[CKAudioProgressView setColor:](self->_audioPlaybackView, "setColor:", 0xFFFFFFFFLL);
    -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_audioPlaybackView);

    audioPlaybackView = self->_audioPlaybackView;
  }
  return audioPlaybackView;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect rect;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = CKSharedAudioCollectionViewCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[CKSharedAssetCollectionViewCell previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKSharedAudioCollectionViewCell audioPlaybackView](self, "audioPlaybackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v14 = CGRectGetWidth(v20) * 0.5;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  v15 = CGRectGetHeight(v21) * 0.5;
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v16 = CGRectGetWidth(v22) * 0.5;
  v23.origin.x = rect.origin.x;
  v23.origin.y = v13;
  v23.size.width = v14;
  v23.size.height = v15;
  v17 = v16 - CGRectGetWidth(v23) * 0.5;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  v18 = CGRectGetHeight(v24) * 0.5;
  v25.origin.x = v17;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  objc_msgSend(v12, "setFrame:", v17, v18 - CGRectGetHeight(v25) * 0.5, v14, v15);
  objc_msgSend(v12, "prepareForDisplayIfNeeded");

}

- (void)setAudioPlaybackView:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlaybackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlaybackView, 0);
}

@end
