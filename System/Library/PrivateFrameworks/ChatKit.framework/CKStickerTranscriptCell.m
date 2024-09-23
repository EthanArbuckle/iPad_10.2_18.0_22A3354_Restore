@implementation CKStickerTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;

  v9 = a5;
  v56.receiver = self;
  v56.super_class = (Class)CKStickerTranscriptCell;
  v12 = a3;
  -[CKAssociatedStickerTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v56, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "mediaObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "previewMaxWidth");
  objc_msgSend(v13, "previewForWidth:orientation:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKStickerTranscriptCell setAnimatedImage:](self, "setAnimatedImage:", v15);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CKStickerTranscriptCell setImage:](self, "setImage:", v15);
  }
  objc_msgSend(v13, "transfer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributionInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D37F10]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length"))
  {
    -[CKStickerTranscriptCell imageView](self, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStickerAccessibilityDescription:", v18);

  }
  objc_msgSend(v13, "transfer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKStickerTranscriptCell setCommSafetyState:](self, "setCommSafetyState:", objc_msgSend(v20, "commSafetySensitive"));

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isClingEnabled");

  if (!v22)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v23 = v13;
  v24 = objc_msgSend(v23, "stickerEffectType");
  -[CKAssociatedStickerTranscriptCell sticker](self, "sticker");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setStickerEffectType:", v24);

  if ((objc_msgSend(v23, "needsAnimation") & 1) != 0 || (IMStickerEffectTypeShouldAvoidEffectView() & 1) != 0)
  {

LABEL_12:
    -[CKStickerTranscriptCell imageView](self, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v52 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v53 = v28;
    v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v54 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v55 = v29;
    v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v48 = *MEMORY[0x1E0CD2610];
    v49 = v30;
    v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v51 = v31;
    objc_msgSend(v27, "setTransform:", &v48);

    -[CKStickerTranscriptCell imageView](self, "imageView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeAllAnimations");

    -[CKStickerTranscriptCell imageView](self, "imageView");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[CKAssociatedStickerTranscriptCell setAssociatedItemView:](self, "setAssociatedItemView:", v23);
    goto LABEL_13;
  }
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = MTLCreateSystemDefaultDevice();
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6DF0]), "initWithDevice:", v35);

    objc_msgSend(v36, "setContentMode:", 1);
    objc_msgSend(v36, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v52 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v53 = v38;
    v39 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v54 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v55 = v39;
    v40 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v48 = *MEMORY[0x1E0CD2610];
    v49 = v40;
    v41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v51 = v41;
    objc_msgSend(v37, "setTransform:", &v48);

    objc_msgSend(v36, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeAllAnimations");

    -[CKStickerTranscriptCell image](self, "image");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setImage:", v43);

    v44 = (void *)MEMORY[0x1E0DC6DE8];
    -[CKAssociatedStickerTranscriptCell sticker](self, "sticker");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "effectWithType:", objc_msgSend(v45, "stickerEffectType"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setEffect:", v46);

    -[CKAssociatedStickerTranscriptCell setAssociatedItemView:](self, "setAssociatedItemView:", v36);
    v34 = v36;
  }
  -[CKStickerTranscriptCell imageView](self, "imageView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "frame");
  objc_msgSend(v34, "setFrame:");

LABEL_13:
}

- (CKStickerTranscriptCell)initWithFrame:(CGRect)a3
{
  CKStickerTranscriptCell *v3;
  CKBalloonImageView *v4;
  uint64_t v5;
  CKBalloonImageView *imageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKStickerTranscriptCell;
  v3 = -[CKAssociatedStickerTranscriptCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKBalloonImageView alloc];
    v5 = -[CKBalloonImageView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (CKBalloonImageView *)v5;

    -[CKBalloonImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[CKAssociatedStickerTranscriptCell setAssociatedItemView:](v3, "setAssociatedItemView:", v3->_imageView);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationTimerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKStickerTranscriptCell;
  -[CKPhoneTranscriptMessageCell dealloc](&v4, sel_dealloc);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[8];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKStickerTranscriptCell;
  -[CKAssociatedStickerTranscriptCell prepareForReuse](&v13, sel_prepareForReuse);
  -[CKStickerTranscriptCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[CKStickerTranscriptCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  -[CKStickerTranscriptCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v12[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v12[5] = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v12[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v12[7] = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v12[0] = *MEMORY[0x1E0CD2610];
  v12[1] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v12[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v12[3] = v11;
  objc_msgSend(v7, "setTransform:", v12);

  -[CKStickerTranscriptCell setImage:](self, "setImage:", 0);
  -[CKStickerTranscriptCell setAnimatedImage:](self, "setAnimatedImage:", 0);
  -[CKStickerTranscriptCell setCommSafetyState:](self, "setCommSafetyState:", 0);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKStickerTranscriptCell;
  -[CKStickerTranscriptCell didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CKStickerTranscriptCell updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
}

- (void)setImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[CKStickerTranscriptCell imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)setCurrentFrameIndex:(int64_t)a3
{
  id v4;

  -[CKStickerTranscriptCell imageView](self, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentFrameIndex:", a3);

}

- (void)setSticker:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[CKAssociatedStickerTranscriptCell sticker](self, "sticker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKStickerTranscriptCell;
    -[CKAssociatedStickerTranscriptCell setSticker:](&v8, sel_setSticker_, v4);
    -[CKAssociatedStickerTranscriptCell sticker](self, "sticker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStickerTranscriptCell setInitialFrameIndex:](self, "setInitialFrameIndex:", objc_msgSend(v7, "initialFrameIndex"));

    -[CKStickerTranscriptCell updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
  }

}

- (void)setAnimatedImage:(id)a3
{
  CKAnimatedImage *v5;
  void *v6;
  void *v7;
  void *v8;
  CKAnimatedImage *v9;

  v5 = (CKAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    -[CKAnimatedImage frames](self->_animatedImage, "frames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStickerTranscriptCell setFrames:](self, "setFrames:", v6);
    -[CKStickerTranscriptCell updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
    if (+[CKImageAnimationTimer accessibilityAnimatedImagesDisabled](CKImageAnimationTimer, "accessibilityAnimatedImagesDisabled"))
    {
      -[CKStickerTranscriptCell frames](self, "frames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKStickerTranscriptCell setImage:](self, "setImage:", v8);
    }
    else
    {
      if (-[CKStickerTranscriptCell hasCommittedFirstFrame](self, "hasCommittedFirstFrame"))
      {
LABEL_7:

        v5 = v9;
        goto LABEL_8;
      }
      +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "animationTime");
      -[CKStickerTranscriptCell _commitFirstFrameWithAnimationTime:](self, "_commitFirstFrameWithAnimationTime:");
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)setCommSafetyState:(int64_t)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_commSafetyState != a3)
  {
    self->_commSafetyState = a3;
    v3 = a3 == 1;
    -[CKEditableCollectionViewCell contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)animationTimerFired:(double)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if ((-[CKTranscriptMessageContentCell animationPauseReasons](self, "animationPauseReasons") & 2) == 0)
  {
    if (-[CKStickerTranscriptCell hasCommittedFirstFrame](self, "hasCommittedFirstFrame"))
    {
      v5 = -[CKAnimatedImage frameIndexForAnimationTime:](self->_animatedImage, "frameIndexForAnimationTime:", a3);
      -[CKStickerTranscriptCell frames](self, "frames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 >= 2)
      {
        v8 = -[CKStickerTranscriptCell initialFrameIndex](self, "initialFrameIndex") + v5;
        -[CKStickerTranscriptCell frames](self, "frames");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v8 % objc_msgSend(v9, "count");

      }
      -[CKStickerTranscriptCell frames](self, "frames");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v5);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      -[CKStickerTranscriptCell setImage:](self, "setImage:", v11);
      -[CKStickerTranscriptCell setCurrentFrameIndex:](self, "setCurrentFrameIndex:", v5);

    }
    else
    {
      -[CKStickerTranscriptCell _commitFirstFrameWithAnimationTime:](self, "_commitFirstFrameWithAnimationTime:", a3);
    }
  }
}

- (void)_commitFirstFrameWithAnimationTime:(double)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  -[CKAssociatedStickerTranscriptCell sticker](self, "sticker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "initialFrameIndex");

  -[CKStickerTranscriptCell animatedImage](self, "animatedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[CKStickerTranscriptCell animatedImage](self, "animatedImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5 >= v8)
    objc_msgSend(v10, "firstObject");
  else
    objc_msgSend(v10, "objectAtIndex:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKStickerTranscriptCell imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__CKStickerTranscriptCell__commitFirstFrameWithAnimationTime___block_invoke;
  v14[3] = &unk_1E274C9C0;
  v14[4] = self;
  v14[5] = v5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v14);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __62__CKStickerTranscriptCell__commitFirstFrameWithAnimationTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "setHasCommittedFirstFrame:", 1);
  objc_msgSend(*(id *)(a1 + 32), "animatedImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationTime");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "animatedImage");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnimationStartTimeOffset:", v6 + v9);

}

- (void)updateAnimationTimerObserving
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKStickerTranscriptCell frames](self, "frames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {

  }
  else
  {
    -[CKStickerTranscriptCell window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

LABEL_7:
      -[CKStickerTranscriptCell setHasCommittedFirstFrame:](self, "setHasCommittedFirstFrame:", 0);
      +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAnimationTimerObserver:", self);
      goto LABEL_8;
    }
    -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_7;
  }
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAnimationTimerObserver:", self);
LABEL_8:

}

- (CKBalloonImageView)imageView
{
  return self->_imageView;
}

- (UIImage)image
{
  return self->_image;
}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (int64_t)commSafetyState
{
  return self->_commSafetyState;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (unint64_t)initialFrameIndex
{
  return self->_initialFrameIndex;
}

- (void)setInitialFrameIndex:(unint64_t)a3
{
  self->_initialFrameIndex = a3;
}

- (BOOL)hasCommittedFirstFrame
{
  return self->_hasCommittedFirstFrame;
}

- (void)setHasCommittedFirstFrame:(BOOL)a3
{
  self->_hasCommittedFirstFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
