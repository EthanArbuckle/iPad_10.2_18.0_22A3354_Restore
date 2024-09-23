@implementation CKVideoPlayerBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  objc_super v11;

  v6 = a6;
  v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CKVideoPlayerBalloonView;
  v10 = a3;
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](&v11, sel_configureForMediaObject_previewWidth_orientation_hasInvisibleInkEffect_, v10, v7, v6, a4);
  -[CKVideoPlayerBalloonView setMediaObject:](self, "setMediaObject:", v10, v11.receiver, v11.super_class);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKVideoPlayerBalloonView;
  -[CKImageBalloonView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoPlayerBalloonView mediaObject](self, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ mediaObject: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CKVideoPlayerBalloonView)initWithFrame:(CGRect)a3
{
  CKVideoPlayerBalloonView *v3;
  CKVideoPlayerBalloonView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKVideoPlayerBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKBalloonView doubleTapGestureRecognizer](v3, "doubleTapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_applicationDidEnterBackground_, *MEMORY[0x1E0CEB358], 0);

  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  if (-[CKVideoPlayerBalloonView gestureIsOurGesture:](self, "gestureIsOurGesture:", a3)
    && (-[CKVideoPlayerBalloonView playerView](self, "playerView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v6, "preciseLocationInView:", self);
    -[CKVideoPlayerBalloonView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v9 = 1;
  }

  return v9 & 1;
}

- (BOOL)gestureIsOurGesture:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;

  v4 = a3;
  -[CKBalloonView doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    -[CKBalloonView tapGestureRecognizer](self, "tapGestureRecognizer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v4;

  }
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v4;
  id v7;
  id v8;
  _BOOL4 v9;
  char v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[CKVideoPlayerBalloonView gestureIsOurGesture:](self, "gestureIsOurGesture:", v7);
  if (v9)
  {
    objc_msgSend(v8, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isDescendantOfView:", self) & 1) != 0)
    {
      v10 = 1;
LABEL_10:

      goto LABEL_11;
    }
    if (!-[CKVideoPlayerBalloonView gestureIsOurGesture:](self, "gestureIsOurGesture:", v8))
    {
      v10 = 0;
      goto LABEL_10;
    }
LABEL_7:
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isDescendantOfView:", self);

    if (!v9)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (-[CKVideoPlayerBalloonView gestureIsOurGesture:](self, "gestureIsOurGesture:", v8))
    goto LABEL_7;
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)reusablePlayerDidStart
{
  id v2;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 1);

}

- (void)reusablePlayerDidStop
{
  id v2;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 0);

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
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKVideoPlayerBalloonView;
  -[CKImageBalloonView layoutSubviews](&v21, sel_layoutSubviews);
  -[CKVideoPlayerBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CKBalloonView canUseOpaqueMask](self, "canUseOpaqueMask"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
    objc_msgSend(v11, "balloonMaskFrameInsetsWithBalloonShape:", v20);
    v4 = v4 - v12;
    v6 = v6 - v13;
    v8 = v8 + v12 + v14;
    v10 = v10 + v13 + v15;

  }
  -[CKImageBalloonView tailMask](self, "tailMask");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

  -[CKImageBalloonView outlineMask](self, "outlineMask");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  -[CKImageBalloonView tailMask](self, "tailMask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoPlayerBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v18);

  -[CKImageBalloonView outlineMask](self, "outlineMask");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoPlayerBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v19);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[CKVideoPlayerBalloonView cleanUpPlayerIfNeeded](self, "cleanUpPlayerIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)CKVideoPlayerBalloonView;
  -[CKImageBalloonView prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKVideoPlayerBalloonView;
  -[CKVideoPlayerBalloonView willMoveToWindow:](&v3, sel_willMoveToWindow_, a3);
}

- (void)prepareForDisplay
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKVideoPlayerBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v5, sel_prepareForDisplay);
  +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CKVideoPlayerBalloonView_prepareForDisplay__block_invoke;
  v4[3] = &unk_1E274A208;
  v4[4] = self;
  objc_msgSend(v3, "activateWithOptions:completion:", 8, v4);

}

void __45__CKVideoPlayerBalloonView_prepareForDisplay__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "playerPool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingVideoPlayerForTransferGUID:", v4);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 832), obj);
    objc_msgSend(*(id *)(a1 + 32), "showPlayerViewController");
    v5 = obj;
  }

}

- (CKReusableVideoPlayer)reusablePlayer
{
  CKReusableVideoPlayer *reusablePlayer;
  void *v4;
  CKReusableVideoPlayer *v5;
  CKReusableVideoPlayer *v6;
  void *v7;
  void *v8;
  CKReusableVideoPlayer *v9;
  void *v10;

  reusablePlayer = self->_reusablePlayer;
  if (!reusablePlayer)
  {
    -[CKVideoPlayerBalloonView playerPool](self, "playerPool");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dequeueAvailableVideoPlayer");
    v5 = (CKReusableVideoPlayer *)objc_claimAutoreleasedReturnValue();
    v6 = self->_reusablePlayer;
    self->_reusablePlayer = v5;

    -[CKMediaObject transferGUID](self->_mediaObject, "transferGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKReusableVideoPlayer setVideoTransferGUID:](self->_reusablePlayer, "setVideoTransferGUID:", v7);

    -[CKReusableVideoPlayer playerViewController](self->_reusablePlayer, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsPictureInPicturePlayback:", 1);

    v9 = self->_reusablePlayer;
    -[CKVideoPlayerBalloonView playerItem](self, "playerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKReusableVideoPlayer configureWithPlayerItem:](v9, "configureWithPlayerItem:", v10);

    -[CKReusableVideoPlayer setDelegate:](self->_reusablePlayer, "setDelegate:", self);
    reusablePlayer = self->_reusablePlayer;
  }
  return reusablePlayer;
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  _BOOL4 v33;
  void *v34;
  objc_super v35;
  objc_super v36;
  objc_super v37;
  CGPoint v38;
  CGRect v39;

  v4 = a3;
  if (!-[CKObscurableBalloonView isObscured](self, "isObscured"))
  {
    if (self->_playerView && CKIsRunningInMacCatalyst())
    {
      v36.receiver = self;
      v36.super_class = (Class)CKVideoPlayerBalloonView;
      -[CKImageBalloonView tapGestureRecognized:](&v36, sel_tapGestureRecognized_, v4);
      goto LABEL_19;
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playButtonImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKVideoPlayerBalloonView bounds](self, "bounds");
    -[CKVideoPlayerBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "size");
    v16 = v15;
    v18 = v17;
    if (CKMainScreenScale_once_27 != -1)
      dispatch_once(&CKMainScreenScale_once_27, &__block_literal_global_59);
    v19 = *(double *)&CKMainScreenScale_sMainScreenScale_27;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "playsInlineVideo"))
    {
      if (v19 == 0.0)
        v21 = 1.0;
      else
        v21 = v19;
      v22 = 1.0 / v21;
      v23 = v16 * v21;
      v24 = 1.0 / v21 * (v8 * v21 + floor((v12 * v21 - v16 * v21) * 0.5));
      v25 = v10 * v21;
      v26 = v14 * v21;
      v27 = v18 * v21;
      v28 = v22 * (v25 + floor((v26 - v27) * 0.5));
      v29 = v23 * v22;
      v30 = v27 * v22;
      objc_msgSend(v4, "locationInView:", self);
      v38.x = v31;
      v38.y = v32;
      v39.origin.x = v24;
      v39.origin.y = v28;
      v39.size.width = v29;
      v39.size.height = v30;
      v33 = CGRectContainsPoint(v39, v38);

      if (v33)
      {
        -[CKVideoPlayerBalloonView startPlayingInlineVideo](self, "startPlayingInlineVideo");
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    if (CKIsRunningInMacCatalyst())
    {
      v35.receiver = self;
      v35.super_class = (Class)CKVideoPlayerBalloonView;
      -[CKImageBalloonView tapGestureRecognized:](&v35, sel_tapGestureRecognized_, v4);
    }
    else
    {
      -[CKVideoPlayerBalloonView playerViewController](self, "playerViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "showFullScreenPresentationFromView:completion:", self, 0);

    }
    goto LABEL_18;
  }
  v37.receiver = self;
  v37.super_class = (Class)CKVideoPlayerBalloonView;
  -[CKImageBalloonView tapGestureRecognized:](&v37, sel_tapGestureRecognized_, v4);
LABEL_19:

}

- (void)doubleTapGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[CKVideoPlayerBalloonView reusablePlayer](self, "reusablePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPictureInPictureActive");

  if ((v6 & 1) == 0)
  {
    -[CKVideoPlayerBalloonView playerViewController](self, "playerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pause");

  }
  v9.receiver = self;
  v9.super_class = (Class)CKVideoPlayerBalloonView;
  -[CKBalloonView doubleTapGestureRecognized:](&v9, sel_doubleTapGestureRecognized_, v4);

}

- (void)pausePlayback
{
  void *v2;
  id v3;

  -[CKVideoPlayerBalloonView playerViewController](self, "playerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)cleanUpPlayerIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  CKVideoPlayerBalloonView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_reusablePlayer)
  {
    -[CKVideoPlayerBalloonView reusablePlayer](self, "reusablePlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "willDisappear");

    -[CKVideoPlayerBalloonView reusablePlayer](self, "reusablePlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isReadyForReuse");

    if (v5)
    {
      -[CKVideoPlayerBalloonView reusablePlayer](self, "reusablePlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "playerViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pause");

    }
  }
  -[CKVideoPlayerBalloonView playerView](self, "playerView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v9 = (CKVideoPlayerBalloonView *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    -[CKVideoPlayerBalloonView playerViewController](self, "playerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "willMoveToParentViewController:", 0);

    objc_msgSend(v14, "removeFromSuperview");
    -[CKVideoPlayerBalloonView playerViewController](self, "playerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromParentViewController");

  }
  if (self->_reusablePlayer)
  {
    -[CKVideoPlayerBalloonView playerPool](self, "playerPool");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoPlayerBalloonView reusablePlayer](self, "reusablePlayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "returnPlayerToPool:", v13);

  }
  -[CKVideoPlayerBalloonView setReusablePlayer:](self, "setReusablePlayer:", 0);
  -[CKVideoPlayerBalloonView setPlayerView:](self, "setPlayerView:", 0);

}

- (void)showPlayerViewController
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  char v26;

  -[CKBalloonView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE1B0F10);

  if (v4)
  {
    -[CKBalloonView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoPlayerBalloonView reusablePlayer](self, "reusablePlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentViewControllerForReusableVideoPlayer:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKVideoPlayerBalloonView playerViewController](self, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultAVPlayerViewContorllerControlsInsets");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    if (-[CKBalloonView hasTail](self, "hasTail"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "balloonMaskTailWidth");
      v20 = v19;

      -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
      v21 = v13 + v20;
      if (v26)
        v21 = v13;
      if (v26 == 1)
        v17 = v17 + v20;
      else
        v13 = v21;
    }
    v25[0] = v11;
    *(double *)&v25[1] = v13;
    v25[2] = v15;
    *(double *)&v25[3] = v17;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v25, "{UIEdgeInsets=dddd}");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOverrideLayoutMarginsWhenEmbeddedInline:", v22);

    objc_msgSend(v7, "addChildViewController:", v8);
    objc_msgSend(v8, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoPlayerBalloonView setPlayerView:](self, "setPlayerView:", v23);

    objc_msgSend(v8, "didMoveToParentViewController:", v7);
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSuspended:", 1);

  }
}

- (void)startPlayingInlineVideo
{
  void *v3;
  _QWORD v4[5];

  -[CKVideoPlayerBalloonView showPlayerViewController](self, "showPlayerViewController");
  +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CKVideoPlayerBalloonView_startPlayingInlineVideo__block_invoke;
  v4[3] = &unk_1E274A208;
  v4[4] = self;
  objc_msgSend(v3, "activateWithOptions:completion:", 8, v4);

}

void __51__CKVideoPlayerBalloonView_startPlayingInlineVideo__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "playerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "play");

}

- (id)playerViewController
{
  void *v2;
  void *v3;

  -[CKVideoPlayerBalloonView reusablePlayer](self, "reusablePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CKVideoPlayerReusePool)playerPool
{
  CKVideoPlayerReusePool *playerPool;
  void *v4;
  int v5;
  void *v6;
  CKVideoPlayerReusePool *v7;
  CKVideoPlayerReusePool *v8;
  CKVideoPlayerReusePool *v9;

  playerPool = self->_playerPool;
  if (!playerPool)
  {
    -[CKBalloonView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EE1B0F10);

    if (!v5)
    {
      v9 = 0;
      return v9;
    }
    -[CKBalloonView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerReusePool");
    v7 = (CKVideoPlayerReusePool *)objc_claimAutoreleasedReturnValue();
    v8 = self->_playerPool;
    self->_playerPool = v7;

    playerPool = self->_playerPool;
  }
  v9 = playerPool;
  return v9;
}

- (id)playerItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKVideoPlayerBalloonView mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CKAVURLAssetForURL(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPlayerView:(id)a3
{
  UIView *v5;
  UIView **p_playerView;
  UIView *playerView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *v14;
  UIView *v15;

  v5 = (UIView *)a3;
  p_playerView = &self->_playerView;
  playerView = self->_playerView;
  if (playerView != v5)
  {
    v15 = v5;
    if (-[UIView isDescendantOfView:](playerView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_playerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_playerView, a3);
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](*p_playerView, "setBackgroundColor:", v8);
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "theme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transcriptBackgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](*p_playerView, "setBackgroundColor:", v10);

    }
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "effectView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *p_playerView;
    if (v12)
      -[CKVideoPlayerBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v13, v12);
    else
      -[CKVideoPlayerBalloonView addSubview:](self, "addSubview:", v13);
    v14 = *p_playerView;
    -[CKVideoPlayerBalloonView bounds](self, "bounds");
    -[UIView setFrame:](v14, "setFrame:");
    -[UIView setAutoresizingMask:](*p_playerView, "setAutoresizingMask:", 18);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    -[UIView setAlpha:](*p_playerView, "setAlpha:", 1.0);

    v5 = v15;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKVideoPlayerBalloonView;
  -[CKBalloonView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  if (self->_playerView)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transcriptBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_playerView, "setBackgroundColor:", v6);

  }
}

- (CKMovieMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObject, a3);
}

- (UIView)playerView
{
  return self->_playerView;
}

- (void)setReusablePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_reusablePlayer, a3);
}

- (void)setPlayerPool:(id)a3
{
  objc_storeStrong((id *)&self->_playerPool, a3);
}

- (BOOL)isObservingSceneDisconnects
{
  return self->_observingSceneDisconnects;
}

- (void)setObservingSceneDisconnects:(BOOL)a3
{
  self->_observingSceneDisconnects = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPool, 0);
  objc_storeStrong((id *)&self->_reusablePlayer, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end
