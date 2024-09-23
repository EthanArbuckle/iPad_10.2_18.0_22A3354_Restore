@implementation CKAudioReplyPreviewBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKAudioReplyPreviewBalloonView;
  v8 = a3;
  -[CKBalloonView configureForMediaObject:previewWidth:orientation:](&v12, sel_configureForMediaObject_previewWidth_orientation_, v8, v5, a4);
  objc_msgSend(v8, "waveformForOrientation:", v5, v12.receiver, v12.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAudioReplyPreviewBalloonView setWaveform:](self, "setWaveform:", v9);

  objc_msgSend(v8, "duration");
  v11 = v10;

  -[CKAudioReplyPreviewBalloonView setDuration:](self, "setDuration:", v11);
}

- (void)configureForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAudioReplyPreviewBalloonView;
  v4 = a3;
  -[CKColoredBalloonView configureForComposition:](&v8, sel_configureForComposition_, v4);
  objc_msgSend(v4, "mediaObjects", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewMaxWidth");
  -[CKAudioReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);

}

- (CKAudioReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKAudioReplyPreviewBalloonView *v7;
  CKWaveformProgressView *v8;
  CKWaveformProgressView *waveformProgressView;
  CKWaveformProgressView *v10;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CKAudioReplyPreviewBalloonView;
  v7 = -[CKColoredBalloonView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[CKWaveformProgressView initWithFrame:]([CKWaveformProgressView alloc], "initWithFrame:", x, y, width, height);
    waveformProgressView = v7->_waveformProgressView;
    v7->_waveformProgressView = v8;

    -[CKWaveformProgressView setColor:](v7->_waveformProgressView, "setColor:", -[CKBalloonView color](v7, "color"));
    -[CKWaveformProgressView setPlaying:](v7->_waveformProgressView, "setPlaying:", 0);
    -[CKWaveformProgressView setPlayed:](v7->_waveformProgressView, "setPlayed:", 0);
    -[CKWaveformProgressView setCurrentTime:](v7->_waveformProgressView, "setCurrentTime:", 0.0);
    v10 = v7->_waveformProgressView;
    -[CKAudioReplyPreviewBalloonView duration](v7, "duration");
    -[CKWaveformProgressView setDuration:](v10, "setDuration:");
    -[CKWaveformProgressView setContentMode:](v7->_waveformProgressView, "setContentMode:", 1);
    -[CKAudioReplyPreviewBalloonView addSubview:](v7, "addSubview:", v7->_waveformProgressView);
    -[CKBalloonView doubleTapGestureRecognizer](v7, "doubleTapGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CKAudioReplyPreviewBalloonView;
  -[CKColoredBalloonView layoutSubviews](&v27, sel_layoutSubviews);
  -[CKAudioReplyPreviewBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CKAudioReplyPreviewBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CKAudioReplyPreviewBalloonView waveformProgressView](self, "waveformProgressView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  objc_msgSend(v15, "sizeThatFits:", v4, v6);
  v17 = v16;
  v19 = v18;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "audioReplyPreviewBalloonAlignmentInsets");
  v23 = v17 - (v21 + v22);
  v26 = v19 - (v24 + v25);

  objc_msgSend(v15, "setFrame:", v8 + floor((v12 - v23) * 0.5), v10 + floor((v14 - v26) * 0.5), v23, v26);
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[CKBalloonImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CKColoredBalloonView mask](self, "mask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v14 = *MEMORY[0x1E0CEB4B0];
      v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
      goto LABEL_9;
    }
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonMaskTailSizeForTailShape:", 1);
  v7 = v6;

  v8 = objc_msgSend(v3, "imageOrientation");
  v9 = 0.0;
  if (!v8)
    goto LABEL_7;
  v10 = v8;
  if (v8 != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("CKGeometry.h"), 429, CFSTR("CKEdgeInsetsWithImageOrientation %ld hasn't been implemented"), v10);

LABEL_7:
    v11 = v7;
    v7 = 0.0;
    goto LABEL_8;
  }
  v11 = 0.0;
LABEL_8:
  v14 = 0.0;
LABEL_9:

  v15 = v14;
  v16 = v7;
  v17 = v9;
  v18 = v11;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  CGSize result;

  width = a3.width;
  -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", a3.width, a3.height);
  v8 = v7;
  v10 = v9;
  -[CKAudioReplyPreviewBalloonView waveformProgressView](self, "waveformProgressView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  v13 = v12;

  v14 = 0.0;
  -[UIView __ck_frameSizeForAlignmentRectSize:](self, "__ck_frameSizeForAlignmentRectSize:", v13, 0.0);
  v16 = v15;
  v17 = v15 - width;
  if (v17 > 0.0)
  {
    v18 = fmod(v17, 1.0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "waveformPowerLevelWidthIncrement");

    v14 = v17 + (double)v20 - (v18 + (double)((unint64_t)v17 % v20));
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
  objc_msgSend(v21, "balloonMaskSizeWithBalloonDescriptor:", &v38);
  v23 = v22;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "audioReplyPreviewBalloonAlignmentInsets");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  if (a4)
  {
    a4->top = v26;
    a4->left = v28;
    a4->bottom = v30;
    a4->right = v32;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "audioReplyPreviewBalloonInset");
  v35 = v16 - v14 - v34;

  v36 = v35;
  v37 = v23;
  result.height = v37;
  result.width = v36;
  return result;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAudioReplyPreviewBalloonView;
  -[CKColoredBalloonView prepareForDisplay](&v5, sel_prepareForDisplay);
  -[CKAudioReplyPreviewBalloonView waveformProgressView](self, "waveformProgressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", -[CKBalloonView color](self, "color"));

  -[CKAudioReplyPreviewBalloonView waveformProgressView](self, "waveformProgressView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForDisplayIfNeeded");

}

- (void)setDuration:(double)a3
{
  void *v5;

  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[CKAudioReplyPreviewBalloonView waveformProgressView](self, "waveformProgressView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDuration:", a3);

    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setWaveform:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CKAudioReplyPreviewBalloonView *v14;
  double v15;
  double v16;

  v11 = a3;
  objc_msgSend(v11, "size");
  if (v5 != 0.0)
  {
    v6 = v4;
    if (v4 != 0.0)
    {
      v7 = v5;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v4, v5);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __46__CKAudioReplyPreviewBalloonView_setWaveform___block_invoke;
      v12[3] = &unk_1E2756778;
      v13 = v11;
      v14 = self;
      v15 = v6;
      v16 = v7;
      objc_msgSend(v8, "imageWithActions:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAudioReplyPreviewBalloonView waveformProgressView](self, "waveformProgressView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWaveform:", v9);

    }
  }

}

void __46__CKAudioReplyPreviewBalloonView_setWaveform___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CGRect v5;

  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonTextColorForColorType:", objc_msgSend(*(id *)(a1 + 40), "color"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  v5.size.width = *(CGFloat *)(a1 + 48);
  v5.size.height = *(CGFloat *)(a1 + 56);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  UIRectFillUsingBlendMode(v5, kCGBlendModeSourceIn);
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)waveformContentMode
{
  return self->_waveformContentMode;
}

- (void)setWaveformContentMode:(int64_t)a3
{
  self->_waveformContentMode = a3;
}

- (CKWaveformProgressView)waveformProgressView
{
  return self->_waveformProgressView;
}

- (void)setWaveformProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_waveformProgressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformProgressView, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8[5];
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAudioReplyPreviewBalloonView;
  -[CKColoredBalloonView configureForMessagePart:](&v9, sel_configureForMessagePart_, v4);
  objc_msgSend(v4, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewMaxWidth");
  -[CKAudioReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v5, objc_msgSend(v4, "balloonOrientation"), v7);

  if (v4)
    objc_msgSend(v4, "balloonDescriptor");
  else
    memset(v8, 0, sizeof(v8));
  -[CKColoredBalloonView setBalloonDescriptor:](self, "setBalloonDescriptor:", v8);

}

@end
