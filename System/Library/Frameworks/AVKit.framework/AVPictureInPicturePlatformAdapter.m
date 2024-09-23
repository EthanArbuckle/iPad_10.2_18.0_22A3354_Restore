@implementation AVPictureInPicturePlatformAdapter

- (void)_updateStatusUsingProposedStatus:(int64_t)a3
{
  void *v3;
  NSObject *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  void *v17;
  int64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  char v30;
  int64_t v31;
  int64_t v32;
  AVPictureInPicturePlatformAdapter *v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  unint64_t v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int64_t v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  const char *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v55 = "-[AVPictureInPicturePlatformAdapter(Common) _updateStatusUsingProposedStatus:]";
    v56 = 2048;
    v57 = -[AVPictureInPicturePlatformAdapter status](self, "status");
    v58 = 2048;
    v59 = a3;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s current status: %ld -> proposed status: %ld", buf, 0x20u);
  }

  v7 = -[AVPictureInPicturePlatformAdapter status](self, "status");
  if (!-[AVPictureInPicturePlatformAdapter isContentSourceSupported](self, "isContentSourceSupported"))
  {
    v10 = 1;
    goto LABEL_12;
  }
  -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isPictureInPicturePossible")
    && -[AVPictureInPicturePlatformAdapter isSystemPictureInPicturePossible](self, "isSystemPictureInPicturePossible")
    && -[AVPictureInPicturePlatformAdapter allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback"))
  {
    -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isPlayingOnSecondScreen") & 1) != 0)
    {
      v10 = 1;
LABEL_75:

      goto LABEL_11;
    }
    if (v7 == 1)
    {
      -[AVPictureInPicturePlatformAdapter source](self, "source");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "avkit_isVisible"))
      {
        v10 = 1;
        goto LABEL_74;
      }
    }
    if ((unint64_t)a3 > 1)
    {
      v37 = a3;
      v38 = 0;
      v39 = 0;
    }
    else
    {
      -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "contentDimensions");
      if ((CGFloatIsValid() & 1) != 0)
      {
        v52 = v36;
        v37 = a3;
        v38 = 0;
        v39 = 0;
      }
      else
      {
        -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "contentDimensions");
        if ((CGFloatIsValid() & 1) != 0)
        {
          v50 = v40;
          v52 = v36;
          v37 = a3;
          v39 = 0;
          v38 = 1;
        }
        else
        {
          -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "contentDimensions");
          if (*MEMORY[0x1E0C9D820] != v43 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v42)
          {

            v10 = 1;
            goto LABEL_71;
          }
          v48 = v41;
          v50 = v40;
          v52 = v36;
          v37 = a3;
          v38 = 1;
          v39 = 1;
        }
      }
    }
    v10 = objc_msgSend((id)objc_opt_class(), "isPictureInPictureSupported") ^ 1;
    if (v39)
    {

      if ((v38 & 1) == 0)
        goto LABEL_66;
    }
    else if (!v38)
    {
LABEL_66:
      a3 = v37;
      if (v37 > 1)
      {
LABEL_71:
        if (v7 != 1)
          goto LABEL_75;
LABEL_74:

        goto LABEL_75;
      }
LABEL_70:

      goto LABEL_71;
    }

    a3 = v37;
    if (v37 >= 2)
      goto LABEL_71;
    goto LABEL_70;
  }
  v10 = 1;
LABEL_11:

LABEL_12:
  _AVLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10)
      v12 = "YES";
    else
      v12 = "NO";
    v49 = v12;
    if (-[AVPictureInPicturePlatformAdapter isContentSourceSupported](self, "isContentSourceSupported"))
      v13 = "YES";
    else
      v13 = "NO";
    v47 = v13;
    -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "isPictureInPicturePossible"))
      v14 = "YES";
    else
      v14 = "NO";
    v46 = v14;
    if (-[AVPictureInPicturePlatformAdapter isSystemPictureInPicturePossible](self, "isSystemPictureInPicturePossible"))
      v15 = "YES";
    else
      v15 = "NO";
    v45 = v15;
    if (-[AVPictureInPicturePlatformAdapter allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback"))
      v16 = "YES";
    else
      v16 = "NO";
    v44 = v16;
    -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = a3;
    if (objc_msgSend(v17, "isPlayingOnSecondScreen"))
      v19 = "YES";
    else
      v19 = "NO";
    -[AVPictureInPicturePlatformAdapter source](self, "source");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "avkit_isVisible"))
      v21 = "YES";
    else
      v21 = "NO";
    -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
    v53 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentDimensions");
    v24 = v23;
    -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentDimensions");
    v27 = v26;
    v28 = objc_msgSend((id)objc_opt_class(), "isPictureInPictureSupported");
    *(_DWORD *)buf = 136317698;
    v29 = "YES";
    if (!v28)
      v29 = "NO";
    v55 = "-[AVPictureInPicturePlatformAdapter(Common) _updateStatusUsingProposedStatus:]";
    v56 = 2080;
    v57 = v49;
    v58 = 2080;
    v59 = (int64_t)v47;
    v60 = 2080;
    v61 = v46;
    v62 = 2080;
    v63 = v45;
    v64 = 2080;
    v65 = v44;
    v66 = 2080;
    v67 = v19;
    a3 = v18;
    v68 = 2080;
    v69 = v21;
    v70 = 2048;
    v71 = v24;
    v72 = 2048;
    v73 = v27;
    v74 = 2080;
    v75 = v29;
    _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s isPictureInPictureProhibited: %s {\n\tisContentSourceSupported: %s\n\tisPictureInPicturePossible: %s\n\tisSystemPictureInPicturePossible: %s\n\tallowsPictureInPicturePlayback: %s\n\tisPlayingOnSecondScreen: %s\n\tsourceIsVisible: %s\n\tcontentDimensions: (%.01f, %.01f)\n\tisPictureInPictureSupported: %s\n}", buf, 0x70u);

    v10 = v53;
  }

  if (a3 == 7)
  {
    -[AVPictureInPicturePlatformAdapter _setStatusAndNotifyDelegateIfNeeded:](self, "_setStatusAndNotifyDelegateIfNeeded:", 7);
    -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", v10 ^ 1u);
    goto LABEL_52;
  }
  v30 = v10 ^ 1;
  if (a3 == 6)
    v30 = 1;
  if ((v30 & 1) != 0)
  {
    if (a3 <= 1)
      v32 = 1;
    else
      v32 = a3;
    v33 = self;
    goto LABEL_51;
  }
  v31 = -[AVPictureInPicturePlatformAdapter status](self, "status");
  if ((unint64_t)(v31 - 2) < 4)
  {
    -[AVPictureInPicturePlatformAdapter stopPictureInPictureAndRestoreUserInterface:](self, "stopPictureInPictureAndRestoreUserInterface:", -[AVPictureInPicturePlatformAdapter canAnimatePictureInPictureTransition](self, "canAnimatePictureInPictureTransition"));
    goto LABEL_52;
  }
  if (v31 == 7 || v31 == 1)
  {
    v33 = self;
    v32 = 0;
LABEL_51:
    -[AVPictureInPicturePlatformAdapter _setStatusAndNotifyDelegateIfNeeded:](v33, "_setStatusAndNotifyDelegateIfNeeded:", v32);
  }
LABEL_52:
  _AVLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    if (-[AVPictureInPicturePlatformAdapter status](self, "status"))
      v35 = "YES";
    else
      v35 = "NO";
    *(_DWORD *)buf = 136315650;
    v55 = "-[AVPictureInPicturePlatformAdapter(Common) _updateStatusUsingProposedStatus:]";
    v56 = 2080;
    v57 = "self.status != AVPictureInPictureControllerStatusProhibited";
    v58 = 2080;
    v59 = (int64_t)v35;
    _os_log_impl(&dword_1AC4B1000, v34, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

}

- (int64_t)status
{
  return self->_status;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (BOOL)isContentSourceSupported
{
  void *v2;
  unint64_t v3;

  -[AVPictureInPicturePlatformAdapter source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "avkit_contentSourceType");

  return v3 < 4;
}

- (AVPictureInPictureContentSource)source
{
  return (AVPictureInPictureContentSource *)objc_loadWeakRetained((id *)&self->_source);
}

+ (BOOL)isPictureInPictureSupported
{
  if (isPictureInPictureSupported_onceToken != -1)
    dispatch_once(&isPictureInPictureSupported_onceToken, &__block_literal_global_874);
  return isPictureInPictureSupported_isPictureInPictureSupported;
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_allowsPictureInPicturePlayback;
}

- (BOOL)isSystemPictureInPicturePossible
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isPictureInPicturePossible") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isPictureInPictureSuspended") & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v7, "isPictureInPictureActive");

      }
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (PGPictureInPictureProxy)pegasusProxy
{
  return self->_pegasusProxy;
}

- (void)_updateStatus
{
  -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", -[AVPictureInPicturePlatformAdapter status](self, "status"));
}

uint64_t __52__AVPictureInPicturePlatformAdapter_initWithSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setupPipAdapter");
}

- (void)_setupPipAdapter
{
  -[AVPictureInPicturePlatformAdapter _updateStatus](self, "_updateStatus");
  -[AVPictureInPicturePlatformAdapter _createProxyIfNeeded](self, "_createProxyIfNeeded");
}

- (void)_updateVideoRectInScreenIfNeeded
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  if (a1)
  {
    objc_msgSend(a1, "source");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "avkit_window");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avkit_videoRectInWindow");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    objc_msgSend(v23, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fixedCoordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:toCoordinateSpace:", v13, v5, v7, v9, v11);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    objc_msgSend(a1, "videoRectInScreen");
    v25.origin.x = v15;
    v25.origin.y = v17;
    v25.size.width = v19;
    v25.size.height = v21;
    if (!CGRectEqualToRect(v24, v25))
    {
      objc_msgSend(a1, "setVideoRectInScreen:", v15, v17, v19, v21);
      objc_msgSend(a1, "pegasusProxy");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController");

    }
  }
}

- (CGRect)videoRectInScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_videoRectInScreen.origin.x;
  y = self->_videoRectInScreen.origin.y;
  width = self->_videoRectInScreen.size.width;
  height = self->_videoRectInScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_isFullScreen
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v29;
  CGFloat rect_8;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  -[AVPictureInPicturePlatformAdapter source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[AVPictureInPicturePlatformAdapter source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend(v5, "avkit_isFullScreen");
  }
  else
  {
    objc_msgSend(v5, "avkit_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVPictureInPicturePlatformAdapter source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avkit_videoRectInWindow");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[AVPictureInPicturePlatformAdapter _updateVideoRectInScreenIfNeeded](self);
    if (v8)
    {
      v31.origin.x = v11;
      v31.origin.y = v13;
      v31.size.width = v15;
      v31.size.height = v17;
      if (CGRectIsEmpty(v31))
        goto LABEL_7;
      v32.origin.x = v11;
      v32.origin.y = v13;
      v32.size.width = v15;
      v32.size.height = v17;
      if (CGRectIsInfinite(v32))
        goto LABEL_7;
      -[AVPictureInPicturePlatformAdapter source](self, "source");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "avkit_window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      UIRectGetCenter();
      objc_msgSend(v19, "_largestInscribedRectInBoundingPathWithCenter:aspectRatio:");
      v21 = v20;
      rect_8 = v22;
      v24 = v23;
      v26 = v25;

      v33.origin.x = v11;
      v33.origin.y = v13;
      v33.size.width = v15;
      v33.size.height = v17;
      v27 = CGRectGetWidth(v33) + 2.0;
      v34.origin.x = v21;
      v34.origin.y = rect_8;
      v34.size.width = v24;
      v34.size.height = v26;
      if (v27 < floor(CGRectGetWidth(v34)))
      {
LABEL_7:
        v7 = 0;
      }
      else
      {
        v35.origin.x = v11;
        v35.origin.y = v13;
        v35.size.width = v15;
        v35.size.height = v17;
        v29 = CGRectGetHeight(v35) + 2.0;
        v36.origin.x = v21;
        v36.origin.y = rect_8;
        v36.size.width = v24;
        v36.size.height = v26;
        v7 = v29 >= floor(CGRectGetHeight(v36));
      }
      v6 = v8;
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
  }

  return v7;
}

- (void)setVideoRectInScreen:(CGRect)a3
{
  self->_videoRectInScreen = a3;
}

- (void)updateLayoutDependentBehaviors
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[AVPictureInPicturePlatformAdapter updateLayoutDependentBehaviors]";
    v6 = 1024;
    v7 = 371;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v4, 0x12u);
  }

  -[AVPictureInPicturePlatformAdapter _updateStatus](self, "_updateStatus");
  -[AVPictureInPicturePlatformAdapter _updateTimeResolver]((id *)&self->super.isa);
  -[AVPictureInPicturePlatformAdapter _updatePictureInPictureShouldStartWhenEnteringBackground](self, "_updatePictureInPictureShouldStartWhenEnteringBackground");
}

- (void)_updateTimeResolver
{
  double v2;
  double v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (a1 && a1[1])
  {
    v2 = 1.0;
    v3 = 3.40282347e38;
    if (objc_msgSend(a1, "status") == 7 || objc_msgSend(a1, "status") == 1 || !objc_msgSend(a1, "status"))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(a1, "playerController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v4;
      if (objc_msgSend(v4, "avkit_isAVPlayerControllerOrSubclass"))
      {
        objc_msgSend(v4, "interstitialController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "currentInterstitialTimeRange");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v4;
        if (v6)
        {
          objc_msgSend(v5, "interstitialTimingController");
          v8 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

      v3 = 1.0;
      v2 = 1000.0;
    }
    objc_msgSend(a1[1], "playerController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
      objc_msgSend(a1[1], "setPlayerController:", v8);
    objc_msgSend(a1[1], "setInterval:", v3);
    objc_msgSend(a1[1], "setResolution:", v2);

  }
}

- (void)_updatePictureInPictureShouldStartWhenEnteringBackground
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  _BOOL8 v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[AVPictureInPicturePlatformAdapter _createProxyIfNeeded](self, "_createProxyIfNeeded");
  v3 = -[AVPictureInPicturePlatformAdapter _isFullScreen](self, "_isFullScreen");
  -[AVPictureInPicturePlatformAdapter activitySessionIdentifier](self, "activitySessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPlaying");
  if (v4)
    v7 = 1;
  else
    v7 = v6;

  v8 = -[AVPictureInPicturePlatformAdapter canStartAutomaticallyWhenEnteringBackground](self, "canStartAutomaticallyWhenEnteringBackground")&& (v3|| -[AVPictureInPicturePlatformAdapter alwaysStartsAutomaticallyWhenEnteringBackground](self, "alwaysStartsAutomaticallyWhenEnteringBackground"))&& (-[AVPictureInPicturePlatformAdapter allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback") & v7) == 1&& -[AVPictureInPicturePlatformAdapter status](self, "status") != 0;
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (-[AVPictureInPicturePlatformAdapter canStartAutomaticallyWhenEnteringBackground](self, "canStartAutomaticallyWhenEnteringBackground"))
    {
      v10 = "YES";
    }
    else
    {
      v10 = "NO";
    }
    if (v3)
      v11 = "YES";
    else
      v11 = "NO";
    if (-[AVPictureInPicturePlatformAdapter alwaysStartsAutomaticallyWhenEnteringBackground](self, "alwaysStartsAutomaticallyWhenEnteringBackground", v11, v10))
    {
      v12 = "YES";
    }
    else
    {
      v12 = "NO";
    }
    if (-[AVPictureInPicturePlatformAdapter allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback"))
      v13 = "YES";
    else
      v13 = "NO";
    -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isPlaying"))
      v15 = "YES";
    else
      v15 = "NO";
    if (v4)
      v16 = "YES";
    else
      v16 = "NO";
    *(_DWORD *)buf = 136316930;
    if (-[AVPictureInPicturePlatformAdapter status](self, "status"))
      v17 = "YES";
    else
      v17 = "NO";
    v24 = "-[AVPictureInPicturePlatformAdapter _updatePictureInPictureShouldStartWhenEnteringBackground]";
    v25 = 2080;
    v26 = v22;
    v27 = 2080;
    v28 = v21;
    v29 = 2080;
    v30 = v12;
    v31 = 2080;
    v32 = v13;
    v33 = 2080;
    v34 = v15;
    v35 = 2080;
    v36 = v16;
    v37 = 2080;
    v38 = v17;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s canStartAutomaticallyWhenEnteringBackground: %s isFullScreen - %s alwaysStartsAutomaticallyWhenEnteringBackground - %s allowsPictureInPicturePlayback - %s playerController.isPlaying - %s inSharePlaySession - %s status != prohibited - %s", buf, 0x52u);

  }
  _AVLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v19 = "YES";
    else
      v19 = "NO";
    *(_DWORD *)buf = 136315650;
    v24 = "-[AVPictureInPicturePlatformAdapter _updatePictureInPictureShouldStartWhenEnteringBackground]";
    v25 = 2080;
    v26 = "pictureInPictureShouldStartWhenEnteringBackground";
    v27 = 2080;
    v28 = v19;
    _os_log_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPictureInPictureShouldStartWhenEnteringBackground:", v8);

}

- (BOOL)canStartAutomaticallyWhenEnteringBackground
{
  return self->_canStartAutomaticallyWhenEnteringBackground;
}

- (void)_createProxyIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  void *v7;
  PGPictureInPictureProxy *v8;
  PGPictureInPictureProxy *pegasusProxy;
  void *v10;
  AVPlayerControllerTimeResolver *v11;
  AVPlayerControllerTimeResolver *timeResolver;
  void *v13;
  AVPlayerControllerTimeResolver *v14;
  void *v15;
  id v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[AVPictureInPicturePlatformAdapter status](self, "status")
         || (-[AVPictureInPicturePlatformAdapter activitySessionIdentifier](self, "activitySessionIdentifier"),
             v4 = (void *)objc_claimAutoreleasedReturnValue(),
             v4,
             v4))
  {
    v5 = objc_alloc(MEMORY[0x1E0D6C9C0]);
    v6 = -[AVPictureInPicturePlatformAdapter _proxyControlsStyle](self, "_proxyControlsStyle");
    -[AVPictureInPicturePlatformAdapter pictureInPictureViewController](self, "pictureInPictureViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PGPictureInPictureProxy *)objc_msgSend(v5, "initWithControlsStyle:viewController:", v6, v7);
    pegasusProxy = self->_pegasusProxy;
    self->_pegasusProxy = v8;

    if (!self->_pegasusProxy)
      -[AVPictureInPicturePlatformAdapter setStatus:](self, "setStatus:", 0);
    -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    -[AVPictureInPicturePlatformAdapter _startObservation](self, "_startObservation");
    if (!self->_timeResolver)
    {
      v11 = objc_alloc_init(AVPlayerControllerTimeResolver);
      timeResolver = self->_timeResolver;
      self->_timeResolver = v11;

      -[AVPictureInPicturePlatformAdapter _updateTimeResolver]((id *)&self->super.isa);
      -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_timeResolver;
      v17[0] = CFSTR("minTime");
      v17[1] = CFSTR("maxTime");
      v17[2] = CFSTR("playerController.timing");
      v17[3] = CFSTR("playerController.seekableTimeRanges");
      v17[4] = CFSTR("playerController.hasSeekableLiveStreamingContent");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v13, "startObserving:keyPaths:observationHandler:", v14, v15, &__block_literal_global_121);

    }
    -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
  }
}

- (NSString)activitySessionIdentifier
{
  return self->_activitySessionIdentifier;
}

- (BOOL)alwaysStartsAutomaticallyWhenEnteringBackground
{
  return self->_alwaysStartsAutomaticallyWhenEnteringBackground;
}

- (void)_updateProxyPlaybackState
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "controlsStyle");
  v5 = -[AVPictureInPicturePlatformAdapter _proxyControlsStyle](self, "_proxyControlsStyle");

  if (v4 != v5)
  {
    v6 = -[AVPictureInPicturePlatformAdapter _proxyControlsStyle](self, "_proxyControlsStyle");
    -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setControlsStyle:", v6);

  }
  -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__AVPictureInPicturePlatformAdapter__updateProxyPlaybackState__block_invoke;
  v9[3] = &unk_1E5BB0960;
  v9[4] = self;
  objc_msgSend(v8, "updatePlaybackStateUsingBlock:", v9);

}

- (int64_t)_proxyControlsStyle
{
  unint64_t v2;

  v2 = -[AVPictureInPicturePlatformAdapter controlsStyle](self, "controlsStyle");
  if (v2 > 2)
    return 1;
  else
    return qword_1AC5F8088[v2];
}

- (int64_t)controlsStyle
{
  return self->_controlsStyle;
}

- (BOOL)isAnyPictureInPictureActive
{
  return self->_anyPictureInPictureActive;
}

void __64__AVPictureInPicturePlatformAdapter_isPictureInPictureSupported__block_invoke()
{
  NSObject *v0;
  const char *v1;
  int v2;
  const char *v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  isPictureInPictureSupported_isPictureInPictureSupported = objc_msgSend(MEMORY[0x1E0D6C9C0], "isPictureInPictureSupported");
  _AVLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = "YES";
    v2 = 136315650;
    v3 = "+[AVPictureInPicturePlatformAdapter isPictureInPictureSupported]_block_invoke";
    v5 = "isPictureInPictureSupported";
    v4 = 2080;
    if (!isPictureInPictureSupported_isPictureInPictureSupported)
      v1 = "NO";
    v6 = 2080;
    v7 = v1;
    _os_log_impl(&dword_1AC4B1000, v0, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v2, 0x20u);
  }

}

- (void)setPlayerController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AVPictureInPictureViewController *v10;
  AVPictureInPictureViewController *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_storeStrong((id *)&self->_playerController, a3);
  -[AVPictureInPicturePlatformAdapter contentSourceAwaitingSetup](self, "contentSourceAwaitingSetup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVPictureInPicturePlatformAdapter contentSourceAwaitingInvalidation](self, "contentSourceAwaitingInvalidation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPicturePlatformAdapter contentSourceAwaitingSetup](self, "contentSourceAwaitingSetup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avkit_pictureInPictureViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = -[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:]([AVPictureInPictureViewController alloc], "initWithPictureInPicturePlayerLayerView:", 0);
    v11 = v10;

    v12 = -[AVPictureInPicturePlatformAdapter status](self, "status");
    if (v12 <= 7)
    {
      if (((1 << v12) & 0x7C) != 0)
      {
        -[AVPictureInPicturePlatformAdapter pictureInPictureViewController](self, "pictureInPictureViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          -[AVPictureInPicturePlatformAdapter pictureInPictureViewController](self, "pictureInPictureViewController");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;

        objc_msgSend(v6, "avkit_stopRoutingVideoToPictureInPictureViewController:", v17);
        -[AVPictureInPicturePlatformAdapter pictureInPictureViewController](self, "pictureInPictureViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setContentViewController:", v11);

        objc_msgSend(v7, "avkit_startRoutingVideoToPictureInPictureViewController:", v11);
      }
      else
      {
        -[AVPictureInPicturePlatformAdapter pictureInPictureViewController](self, "pictureInPictureViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setContentViewController:", v11);
      }

    }
    -[AVPictureInPicturePlatformAdapter setContentSourceAwaitingInvalidation:](self, "setContentSourceAwaitingInvalidation:", 0);
    -[AVPictureInPicturePlatformAdapter setContentSourceAwaitingSetup:](self, "setContentSourceAwaitingSetup:", 0);

  }
}

- (void)setManagesWiredSecondScreenPlayback:(BOOL)a3
{
  self->_managesWiredSecondScreenPlayback = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCanStartAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  if (self->_canStartAutomaticallyWhenEnteringBackground != a3)
  {
    self->_canStartAutomaticallyWhenEnteringBackground = a3;
    -[AVPictureInPicturePlatformAdapter _updatePictureInPictureShouldStartWhenEnteringBackground](self, "_updatePictureInPictureShouldStartWhenEnteringBackground");
  }
}

- (void)setBackgroundPlaybackPolicy:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_backgroundPlaybackPolicy != a3)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[AVPictureInPicturePlatformAdapter setBackgroundPlaybackPolicy:]";
      v8 = 2050;
      v9 = a3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s backgroundPlaybackPolicy %{public}ld", (uint8_t *)&v6, 0x16u);
    }

    self->_backgroundPlaybackPolicy = a3;
    -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
  }
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  self->_allowsPictureInPicturePlayback = a3;
  -[AVPictureInPicturePlatformAdapter _updateStatus](self, "_updateStatus");
  -[AVPictureInPicturePlatformAdapter _createProxyIfNeeded](self, "_createProxyIfNeeded");
}

- (void)setActivitySessionIdentifier:(id)a3
{
  NSString *v4;
  NSString *activitySessionIdentifier;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  activitySessionIdentifier = self->_activitySessionIdentifier;
  if (activitySessionIdentifier != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](activitySessionIdentifier, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_activitySessionIdentifier;
      self->_activitySessionIdentifier = v7;

      -[AVPictureInPicturePlatformAdapter _createProxyIfNeeded](self, "_createProxyIfNeeded");
      -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setClientSessionIdentifier:", v10);

      -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
      -[AVPictureInPicturePlatformAdapter _updatePictureInPictureShouldStartWhenEnteringBackground](self, "_updatePictureInPictureShouldStartWhenEnteringBackground");
      v4 = v10;
    }
  }

}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (AVPictureInPictureViewController)pictureInPictureViewController
{
  return self->_pictureInPictureViewController;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (AVPictureInPicturePlatformAdapter)initWithSource:(id)a3
{
  id v4;
  AVPictureInPicturePlatformAdapter *v5;
  char v6;
  void *v7;
  void *v8;
  AVPictureInPictureViewController *v9;
  AVPictureInPictureViewController *pictureInPictureViewController;
  AVObservationController *v11;
  AVObservationController *observationController;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVPictureInPicturePlatformAdapter;
  v5 = -[AVPictureInPicturePlatformAdapter init](&v17, sel_init);
  if (v5)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0)
      v6 = 0;
    else
      v6 = _os_feature_enabled_impl() ^ 1;
    v5->_requiresLinearPlayback = v6;
    objc_storeWeak((id *)&v5->_source, v4);
    objc_msgSend(v4, "avkit_pictureInPictureViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = -[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:]([AVPictureInPictureViewController alloc], "initWithPictureInPicturePlayerLayerView:", 0);
    pictureInPictureViewController = v5->_pictureInPictureViewController;
    v5->_pictureInPictureViewController = v9;

    -[AVPictureInPictureViewController setDelegate:](v5->_pictureInPictureViewController, "setDelegate:", v5);
    v5->_controlsStyle = 0;
    v11 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v5);
    observationController = v5->_observationController;
    v5->_observationController = v11;

    *(_WORD *)&v5->_canStartAutomaticallyWhenEnteringBackground = 257;
    -[AVPictureInPicturePlatformAdapter observationController](v5, "observationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = CFSTR("playerController.pictureInPicturePossible");
    v18[1] = CFSTR("playerController.playingOnSecondScreen");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "startObserving:keyPaths:observationHandler:", v5, v14, &__block_literal_global_18);

  }
  return v5;
}

- (AVPictureInPictureContentSource)contentSourceAwaitingSetup
{
  return (AVPictureInPictureContentSource *)objc_loadWeakRetained((id *)&self->_contentSourceAwaitingSetup);
}

- (void)dealloc
{
  AVObservationController *observationController;
  objc_super v4;

  -[AVPictureInPicturePlatformAdapter _removeSecondScreenConnection](self, "_removeSecondScreenConnection");
  -[NSTimer invalidate](self->_layoutCheckTimer, "invalidate");
  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  observationController = self->_observationController;
  self->_observationController = 0;

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPicturePlatformAdapter;
  -[AVPictureInPicturePlatformAdapter dealloc](&v4, sel_dealloc);
}

- (void)startPictureInPicture
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = -[AVPictureInPicturePlatformAdapter _sceneActivationState](self);
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "_sceneActivationState == %ld for start pictureinpicture", buf, 0xCu);
  }

  if (-[AVPictureInPicturePlatformAdapter _sceneActivationState](self))
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *MEMORY[0x1E0CB2D68];
    v9[0] = *MEMORY[0x1E0CB2D50];
    v9[1] = v5;
    v10[0] = CFSTR("Failed to start picture in picture.");
    v10[1] = CFSTR("The UIScene for the content source has an activation state other than UISceneActivationStateForegroundActive, which is not allowed.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("AVKitErrorDomain"), -1001, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pictureInPicturePlatformAdapter:failedToStartError:", self, v7);

  }
  else
  {
    -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 2);
    -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startPictureInPicture");
  }

}

- (void)stopPictureInPictureAndRestoreUserInterface:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BYTE v10[24];
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    *(_DWORD *)v10 = 136315650;
    *(_QWORD *)&v10[4] = "-[AVPictureInPicturePlatformAdapter stopPictureInPictureAndRestoreUserInterface:]";
    *(_QWORD *)&v10[14] = "shouldRestore";
    *(_WORD *)&v10[12] = 2080;
    if (v3)
      v6 = "YES";
    *(_WORD *)&v10[22] = 2080;
    v11 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v10, 0x20u);
  }

  if (v3)
  {
    if (!-[AVPictureInPicturePlatformAdapter _sceneActivationState](self))
    {
      -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 6);
      v7 = 1;
      goto LABEL_12;
    }
    v7 = -[AVPictureInPicturePlatformAdapter _sceneActivationState](self);
    -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 6);
    if (v7 == 1)
      goto LABEL_12;
  }
  else
  {
    -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 6);
  }
  -[AVPictureInPicturePlatformAdapter delegate](self, "delegate", *(_OWORD *)v10, *(_QWORD *)&v10[16]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pictureInPicturePlatformAdapterPrepareToStopForDismissal:", self);

  v7 = 0;
LABEL_12:
  -[AVPictureInPicturePlatformAdapter updateLayoutDependentBehaviors](self, "updateLayoutDependentBehaviors", *(_QWORD *)v10, *(_OWORD *)&v10[8]);
  -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopPictureInPictureAndRestoreUserInterface:", v7);

}

- (BOOL)canAnimatePictureInPictureTransition
{
  return -[AVPictureInPicturePlatformAdapter _sceneActivationState](self) == 0;
}

- (void)setInterruptedForAudioSession:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_interruptedForAudioSession != a3)
  {
    v3 = a3;
    self->_interruptedForAudioSession = a3;
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = "NO";
      v6 = 136315650;
      v7 = "-[AVPictureInPicturePlatformAdapter setInterruptedForAudioSession:]";
      v9 = "interruptedForAudioSession";
      v8 = 2080;
      if (v3)
        v5 = "YES";
      v10 = 2080;
      v11 = v5;
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v6, 0x20u);
    }

  }
}

- (void)setWasPlayingWhenSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_wasPlayingWhenSuspended != a3)
  {
    v3 = a3;
    self->_wasPlayingWhenSuspended = a3;
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = "NO";
      v6 = 136315650;
      v7 = "-[AVPictureInPicturePlatformAdapter setWasPlayingWhenSuspended:]";
      v9 = "wasPlayingWhenSuspended";
      v8 = 2080;
      if (v3)
        v5 = "YES";
      v10 = 2080;
      v11 = v5;
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v6, 0x20u);
    }

  }
}

- (void)setControlsStyle:(int64_t)a3
{
  if (self->_controlsStyle != a3)
  {
    self->_controlsStyle = a3;
    -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
  }
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  self->_microphoneEnabled = a3;
  -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
  -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
}

- (void)setAlwaysStartsAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  self->_alwaysStartsAutomaticallyWhenEnteringBackground = a3;
  -[AVPictureInPicturePlatformAdapter updateLayoutDependentBehaviors](self, "updateLayoutDependentBehaviors");
}

- (void)setPrerollAttributes:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "pegasusAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPicturePlatformAdapter prerollAttributes](self, "prerollAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pegasusAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v7))
  {

LABEL_5:
    v9 = v10;
    goto LABEL_6;
  }
  -[AVPictureInPicturePlatformAdapter prerollAttributes](self, "prerollAttributes");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8 != v10)
  {
    objc_storeStrong((id *)&self->_prerollAttributes, a3);
    -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    -[AVPictureInPicturePlatformAdapter _updatePictureInPictureShouldStartWhenEnteringBackground](self, "_updatePictureInPictureShouldStartWhenEnteringBackground");
    -[AVPictureInPicturePlatformAdapter _updateTimeResolver]((id *)&self->super.isa);
  }
}

- (void)setSource:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  if (WeakRetained != v4)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = "-[AVPictureInPicturePlatformAdapter setSource:]";
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %@ --> %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeWeak((id *)&self->_source, v4);
    -[AVPictureInPicturePlatformAdapter setContentSourceAwaitingInvalidation:](self, "setContentSourceAwaitingInvalidation:", WeakRetained);
    -[AVPictureInPicturePlatformAdapter setContentSourceAwaitingSetup:](self, "setContentSourceAwaitingSetup:", v4);
  }

}

- (void)_startObservation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *, void *);
  void *v25;
  id v26;
  id location;

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.contentDimensions"), 1, &__block_literal_global_37);

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "startObserving:keyPath:includeInitialValue:observationHandler:", v6, CFSTR("pictureInPicturePossible"), 1, &__block_literal_global_40);

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPicturePlatformAdapter pegasusProxy](self, "pegasusProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", v9, CFSTR("pictureInPictureWasStartedWhenEnteringBackground"), 1, &__block_literal_global_43);

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.playing"), 1, &__block_literal_global_46);

  -[AVPictureInPicturePlatformAdapter _startObservingForPlaybackStateUpdates](self, "_startObservingForPlaybackStateUpdates");
  if (-[AVPictureInPicturePlatformAdapter managesWiredSecondScreenPlayback](self, "managesWiredSecondScreenPlayback"))
  {
    -[AVPictureInPicturePlatformAdapter source](self, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVPictureInPicturePlatformAdapter source](self, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v14);

    }
    else
    {
      location = 0;
    }

    v15 = objc_loadWeakRetained(&location);
    if (v15)
    {
      -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_5;
      v25 = &unk_1E5BB09F0;
      objc_copyWeak(&v26, &location);
      v17 = (id)objc_msgSend(v16, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.player"), 1, &v22);

      objc_destroyWeak(&v26);
    }
    objc_destroyWeak(&location);
  }
  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController", v22, v23, v24, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC80], 0, 0, &__block_literal_global_66);

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C896F0], 0, 0, &__block_literal_global_67);

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC88], 0, 0, &__block_literal_global_68);

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC30], 0, 0, &__block_literal_global_70);

}

- (void)_startObservingForPlaybackStateUpdates
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = CFSTR("playerController.rate");
  v25[1] = CFSTR("playerController.muted");
  v25[2] = CFSTR("playerController.status");
  v25[3] = CFSTR("playerController.hasLiveStreamingContent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v4, 1, &__block_literal_global_81);

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerCurrentTimeJumpedNotification"), 0, 0, &__block_literal_global_82);

  -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.seeking"), 1, &__block_literal_global_87);

  }
  -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.seekToTime"), 1, &__block_literal_global_92);

  }
  -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.scrubbing"), 1, &__block_literal_global_97);

  }
  -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  -[AVPictureInPicturePlatformAdapter observationController](self, "observationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((v19 & 1) != 0)
  {
    v22 = CFSTR("playerController.timeControlStatus");
    v23 = &__block_literal_global_102;
  }
  else
  {
    v22 = CFSTR("playerController.playing");
    v23 = &__block_literal_global_103;
  }
  v24 = (id)objc_msgSend(v20, "startObserving:keyPath:includeInitialValue:observationHandler:", self, v22, 1, v23);

}

- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[AVPictureInPicturePlatformAdapter _updateVideoRectInScreenIfNeeded](self);
  -[AVPictureInPicturePlatformAdapter videoRectInScreen](self, "videoRectInScreen");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)pictureInPictureProxy:(id)a3 willStartPictureInPictureWithAnimationType:(int64_t)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:willStartPictureInPictureWithAnimationType:]";
    v10 = 1024;
    v11 = 728;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v8, 0x12u);
  }

  -[AVPictureInPicturePlatformAdapter source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avkit_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPicturePlatformAdapter setSourceWindowWhenPictureInPictureStarted:](self, "setSourceWindowWhenPictureInPictureStarted:", v7);

  -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 2);
}

- (void)pictureInPictureProxy:(id)a3 didStartPictureInPictureWithAnimationType:(int64_t)a4
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didStartPictureInPictureWithAnimationType:]";
    v11 = 1024;
    v12 = 737;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v9, 0x12u);
  }

  v7 = objc_msgSend(v5, "pictureInPictureWasStartedWhenEnteringBackground");
  if (v7)
    v8 = 4;
  else
    v8 = 3;
  -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", v8);
}

- (void)pictureInPictureProxy:(id)a3 failedToStartPictureInPictureWithAnimationType:(int64_t)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:failedToStartPictureInPictureWithAnimationType:error:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s error: %@", (uint8_t *)&v9, 0x16u);
  }

  -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 1);
  -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pictureInPicturePlatformAdapter:failedToStartError:", self, v6);

  -[AVPictureInPicturePlatformAdapter setSourceWindowWhenPictureInPictureStarted:](self, "setSourceWindowWhenPictureInPictureStarted:", 0);
}

- (void)pictureInPictureProxy:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@", buf, 0x16u);
  }

  -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __124__AVPictureInPicturePlatformAdapter_pictureInPictureProxy_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5BB1E80;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "pictureInPicturePlatformAdapter:prepareToStopForRestoringUserInterface:", self, v11);

}

- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:willStopPictureInPictureWithAnimationType:reason:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2048;
    v18 = a5;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@ reason: %ld", (uint8_t *)&v13, 0x20u);
  }

  if (a4 == 2 || a5 == 1)
  {
    -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pictureInPicturePlatformAdapterPrepareToStopForDismissal:", self);

  }
  -[AVPictureInPicturePlatformAdapter source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPicturePlatformAdapter pictureInPictureViewController](self, "pictureInPictureViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:", v12);

  -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 6);
}

- (void)pictureInPictureProxy:(id)a3 didStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didStopPictureInPictureWithAnimationType:reason:]";
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = a5;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@ reason: %ld", (uint8_t *)&v10, 0x20u);
  }

  -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pictureInPicturePlatformAdapterEndReducingResourcesForEligibleOffScreenState");

  -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 7);
  -[AVPictureInPicturePlatformAdapter setSourceWindowWhenPictureInPictureStarted:](self, "setSourceWindowWhenPictureInPictureStarted:", 0);

}

- (void)pictureInPictureProxyPictureInPictureInterruptionBegan:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxyPictureInPictureInterruptionBegan:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@", (uint8_t *)&v7, 0x16u);
  }

  -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pictureInPicturePlatformAdapter:handlePlaybackCommand:", self, 3);

}

- (void)pictureInPictureProxyPictureInPictureInterruptionEnded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxyPictureInPictureInterruptionEnded:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@", (uint8_t *)&v7, 0x16u);
  }

  -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pictureInPicturePlatformAdapter:handlePlaybackCommand:", self, 4);

}

- (int64_t)pictureInPictureProxyInterfaceOrientationForTransitionAnimation:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[AVPictureInPicturePlatformAdapter source](self, "source", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  return v5;
}

- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3
{
  void *v3;
  void *v4;

  -[AVPictureInPicturePlatformAdapter source](self, "source", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)pictureInPictureProxy:(id)a3 didUpdateResourcesUsageReductionReasons:(unint64_t)a4 oldReasons:(unint64_t)a5
{
  char v5;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v5 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "YES";
    v11 = 136315650;
    v12 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didUpdateResourcesUsageReductionReasons:oldReasons:]";
    v14 = "shouldReduceResources";
    v13 = 2080;
    if ((v5 & 1) == 0)
      v8 = "NO";
    v15 = 2080;
    v16 = v8;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v11, 0x20u);
  }

  -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v5 & 1) != 0)
    objc_msgSend(v9, "pictureInPicturePlatformAdapterBeginReducingResourcesForEligibleOffScreenState");
  else
    objc_msgSend(v9, "pictureInPicturePlatformAdapterEndReducingResourcesForEligibleOffScreenState");

}

- (void)pictureInPictureProxy:(id)a3 didReceivePlaybackCommand:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  AVPictureInPicturePlatformAdapter *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  void *v20;
  AVPictureInPicturePlatformAdapter *v21;
  uint64_t v22;
  int64_t v23;
  int v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[5];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didReceivePlaybackCommand:]";
    v40 = 2048;
    v41 = objc_msgSend(v7, "playbackAction");
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s playbackCommand: %ld", buf, 0x16u);
  }

  switch(objc_msgSend(v7, "playbackAction"))
  {
    case 1:
      objc_msgSend(v7, "associatedDoubleValue");
      v10 = v9;
      -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "associatedDoubleValue");
      objc_msgSend(v11, "seekByTimeInterval:toleranceBefore:toleranceAfter:");

      -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();
      if (v10 <= 0.0)
      {
        if ((v13 & 1) == 0)
          goto LABEL_44;
        -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = self;
        v17 = 10;
      }
      else
      {
        if ((v13 & 1) == 0)
          goto LABEL_44;
        -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = self;
        v17 = 11;
      }
      objc_msgSend(v14, "pictureInPicturePlatformAdapter:handlePlaybackCommand:", v16, v17);

      goto LABEL_44;
    case 2:
      -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "gotoEndOfSeekableRanges:", self);
      goto LABEL_44;
    case 3:
      v19 = objc_msgSend(v7, "associatedBoolValue");
      -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
      v21 = self;
      if (v19)
        v22 = 1;
      else
        v22 = 2;
      goto LABEL_43;
    case 4:
      v23 = -[AVPictureInPicturePlatformAdapter controlsStyle](self, "controlsStyle");
      v24 = objc_msgSend(v7, "associatedBoolValue");
      if (v23 == 1)
      {
        if (v24 != -[AVPictureInPicturePlatformAdapter isMicrophoneEnabled](self, "isMicrophoneEnabled"))
          goto LABEL_45;
        -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v20;
        v21 = self;
        v22 = 8;
      }
      else
      {
        -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v20;
        v21 = self;
        if (v24)
          v22 = 6;
        else
          v22 = 7;
      }
LABEL_43:
      objc_msgSend(v20, "pictureInPicturePlatformAdapter:handlePlaybackCommand:", v21, v22);
LABEL_44:

      goto LABEL_45;
    case 5:
      if (objc_msgSend(v7, "associatedBoolValue"))
      {
        -[AVPictureInPicturePlatformAdapter setWasPlayingWhenSuspended:](self, "setWasPlayingWhenSuspended:", -[AVPictureInPicturePlatformAdapter observedTimeControlStatus](self, "observedTimeControlStatus") == 2);
        -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "isPlaying"))
        {
          v26 = -[AVPictureInPicturePlatformAdapter canPausePlaybackWhenClosingPictureInPicture](self, "canPausePlaybackWhenClosingPictureInPicture");

          if (!v26)
          {
LABEL_48:
            -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", 5);
            goto LABEL_45;
          }
          -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_opt_respondsToSelector();

          -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v29;
          if ((v28 & 1) != 0)
            objc_msgSend(v29, "pauseForAllCoordinatedPlaybackParticipants:", 0);
          else
            objc_msgSend(v29, "setPlaying:", 0);
        }

        goto LABEL_48;
      }
      if (objc_msgSend(v6, "pictureInPictureWasStartedWhenEnteringBackground"))
        v32 = 4;
      else
        v32 = 3;
      -[AVPictureInPicturePlatformAdapter _updateStatusUsingProposedStatus:](self, "_updateStatusUsingProposedStatus:", v32);
      if (-[AVPictureInPicturePlatformAdapter wasPlayingWhenSuspended](self, "wasPlayingWhenSuspended"))
      {
        if (!-[AVPictureInPicturePlatformAdapter isInterruptedForAudioSession](self, "isInterruptedForAudioSession"))
        {
          -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isPictureInPictureInterrupted");

          if ((v34 & 1) == 0)
          {
            -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "play:", self);

          }
        }
      }
      -[AVPictureInPicturePlatformAdapter setWasPlayingWhenSuspended:](self, "setWasPlayingWhenSuspended:", 0);
LABEL_45:

      return;
    case 6:
      -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
      v21 = self;
      v22 = 3;
      goto LABEL_43;
    case 7:
      if (objc_msgSend(v7, "associatedBoolValue")
        && !-[AVPictureInPicturePlatformAdapter isInterruptedForAudioSession](self, "isInterruptedForAudioSession"))
      {
        -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v20;
        v21 = self;
        v22 = 5;
      }
      else
      {
        -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v20;
        v21 = self;
        v22 = 4;
      }
      goto LABEL_43;
    case 8:
      -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
      v21 = self;
      v22 = 9;
      goto LABEL_43;
    case 9:
      -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "player");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __85__AVPictureInPicturePlatformAdapter_pictureInPictureProxy_didReceivePlaybackCommand___block_invoke;
      v37[3] = &unk_1E5BB3010;
      v37[4] = self;
      +[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:](AVDismissalExpanseCoordinator, "coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:", v31, 1, v37);

      goto LABEL_45;
    default:
      _AVLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_msgSend(v7, "playbackAction");
        *(_DWORD *)buf = 134217984;
        v39 = (const char *)v36;
        _os_log_error_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_ERROR, "Error: Unrecognized PGPlaybackAction - %ld", buf, 0xCu);
      }

      goto LABEL_45;
  }
}

- (void)pictureInPictureProxy:(id)a3 didReceiveTestingCommand:(id)a4
{
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "testingAction", a3) == 1)
  {
    v5 = -[AVPictureInPicturePlatformAdapter status](self, "status");
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5 == 1)
    {
      if (v7)
      {
        -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didReceiveTestingCommand:]";
        v11 = 2114;
        v12 = v8;
        _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s starting for playerController %{public}@", (uint8_t *)&v9, 0x16u);

      }
      -[AVPictureInPicturePlatformAdapter startPictureInPicture](self, "startPictureInPicture");
    }
    else
    {
      if (v7)
      {
        v9 = 136315394;
        v10 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didReceiveTestingCommand:]";
        v11 = 1024;
        LODWORD(v12) = -[AVPictureInPicturePlatformAdapter status](self, "status");
        _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s failed; status = %d", (uint8_t *)&v9, 0x12u);
      }

    }
  }
}

- (BOOL)pictureInPictureProxyCanIssueOptionalCommand:(id)a3
{
  return objc_msgSend(a3, "playbackAction") < 10;
}

- (void)pictureInPictureViewControllerViewDidAppear:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVPictureInPicturePlatformAdapter pictureInPictureViewControllerViewDidAppear:]";
    v9 = 1024;
    v10 = 1003;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  -[AVPictureInPicturePlatformAdapter source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPicturePlatformAdapter _setRoutingVideoToHostedWindow:pictureInPictureViewController:source:](self, "_setRoutingVideoToHostedWindow:pictureInPictureViewController:source:", 1, v4, v6);

}

- (void)pictureInPictureViewControllerViewWillDisappear:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVPictureInPicturePlatformAdapter pictureInPictureViewControllerViewWillDisappear:]";
    v9 = 1024;
    v10 = 1009;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  -[AVPictureInPicturePlatformAdapter source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPicturePlatformAdapter _setRoutingVideoToHostedWindow:pictureInPictureViewController:source:](self, "_setRoutingVideoToHostedWindow:pictureInPictureViewController:source:", 0, v4, v6);

}

- (void)_removeSecondScreenConnection
{
  void *v3;
  void *v4;
  void *v5;
  AVSecondScreenConnection *secondScreenConnection;

  -[AVPictureInPicturePlatformAdapter secondScreenConnection](self, "secondScreenConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[AVSecondScreenController sharedInstance](AVSecondScreenController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPictureInPicturePlatformAdapter secondScreenConnection](self, "secondScreenConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeConnection:", v5);

    secondScreenConnection = self->_secondScreenConnection;
    self->_secondScreenConnection = 0;

  }
}

- (void)setObservedTimeControlStatus:(int64_t)a3
{
  if (self->_observedTimeControlStatus != a3)
  {
    self->_observedTimeControlStatus = a3;
    -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
    if (a3 == 2)
    {
      -[AVPictureInPicturePlatformAdapter setInterruptedForAudioSession:](self, "setInterruptedForAudioSession:", 0);
      -[AVPictureInPicturePlatformAdapter setWasPlayingWhenSuspended:](self, "setWasPlayingWhenSuspended:", 0);
    }
  }
}

- (void)setRoutingVideoToHostedWindow:(BOOL)a3
{
  if (self->_routingVideoToHostedWindow != a3)
  {
    self->_routingVideoToHostedWindow = a3;
    -[AVPictureInPicturePlatformAdapter _updateProxyPlaybackState](self, "_updateProxyPlaybackState");
  }
}

- (void)setScrubbingOrSeeking:(BOOL)a3
{
  id v4;

  if (self->_scrubbingOrSeeking != a3)
  {
    self->_scrubbingOrSeeking = a3;
    if (a3)
    {
      -[AVPictureInPicturePlatformAdapter playerController](self, "playerController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rate");
      -[AVPictureInPicturePlatformAdapter setRateWhenScrubbingOrSeekingBegan:](self, "setRateWhenScrubbingOrSeekingBegan:");

    }
  }
}

- (void)setScrubbing:(BOOL)a3
{
  _BOOL8 v4;

  self->_scrubbing = a3;
  v4 = -[AVPictureInPicturePlatformAdapter isSeeking](self, "isSeeking")
    || -[AVPictureInPicturePlatformAdapter isScrubbing](self, "isScrubbing");
  -[AVPictureInPicturePlatformAdapter setScrubbingOrSeeking:](self, "setScrubbingOrSeeking:", v4);
}

- (void)setSeeking:(BOOL)a3
{
  _BOOL8 v4;

  self->_seeking = a3;
  v4 = -[AVPictureInPicturePlatformAdapter isSeeking](self, "isSeeking")
    || -[AVPictureInPicturePlatformAdapter isScrubbing](self, "isScrubbing");
  -[AVPictureInPicturePlatformAdapter setScrubbingOrSeeking:](self, "setScrubbingOrSeeking:", v4);
}

- (AVPictureInPicturePlatformAdapterDelegate)delegate
{
  return (AVPictureInPicturePlatformAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)canPausePlaybackWhenClosingPictureInPicture
{
  return self->_canPausePlaybackWhenClosingPictureInPicture;
}

- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3
{
  self->_canPausePlaybackWhenClosingPictureInPicture = a3;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (AVPictureInPicturePrerollAttributes)prerollAttributes
{
  return self->_prerollAttributes;
}

- (BOOL)managesWiredSecondScreenPlayback
{
  return self->_managesWiredSecondScreenPlayback;
}

- (int64_t)backgroundPlaybackPolicy
{
  return self->_backgroundPlaybackPolicy;
}

- (NSTimer)layoutCheckTimer
{
  return self->_layoutCheckTimer;
}

- (AVSecondScreenConnection)secondScreenConnection
{
  return self->_secondScreenConnection;
}

- (void)setSecondScreenConnection:(id)a3
{
  objc_storeStrong((id *)&self->_secondScreenConnection, a3);
}

- (UIWindow)sourceWindowWhenPictureInPictureStarted
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_sourceWindowWhenPictureInPictureStarted);
}

- (void)setSourceWindowWhenPictureInPictureStarted:(id)a3
{
  objc_storeWeak((id *)&self->_sourceWindowWhenPictureInPictureStarted, a3);
}

- (AVPictureInPictureContentSource)contentSourceAwaitingInvalidation
{
  return (AVPictureInPictureContentSource *)objc_loadWeakRetained((id *)&self->_contentSourceAwaitingInvalidation);
}

- (void)setContentSourceAwaitingInvalidation:(id)a3
{
  objc_storeWeak((id *)&self->_contentSourceAwaitingInvalidation, a3);
}

- (void)setContentSourceAwaitingSetup:(id)a3
{
  objc_storeWeak((id *)&self->_contentSourceAwaitingSetup, a3);
}

- (int64_t)observedTimeControlStatus
{
  return self->_observedTimeControlStatus;
}

- (BOOL)isScrubbingOrSeeking
{
  return self->_scrubbingOrSeeking;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)isSeeking
{
  return self->_seeking;
}

- (double)rateWhenScrubbingOrSeekingBegan
{
  return self->_rateWhenScrubbingOrSeekingBegan;
}

- (void)setRateWhenScrubbingOrSeekingBegan:(double)a3
{
  self->_rateWhenScrubbingOrSeekingBegan = a3;
}

- (BOOL)isInterruptedForAudioSession
{
  return self->_interruptedForAudioSession;
}

- (BOOL)wasPlayingWhenSuspended
{
  return self->_wasPlayingWhenSuspended;
}

- (BOOL)isRoutingVideoToHostedWindow
{
  return self->_routingVideoToHostedWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_contentSourceAwaitingSetup);
  objc_destroyWeak((id *)&self->_contentSourceAwaitingInvalidation);
  objc_destroyWeak((id *)&self->_sourceWindowWhenPictureInPictureStarted);
  objc_storeStrong((id *)&self->_secondScreenConnection, 0);
  objc_storeStrong((id *)&self->_layoutCheckTimer, 0);
  objc_storeStrong((id *)&self->_pegasusProxy, 0);
  objc_storeStrong((id *)&self->_pictureInPictureViewController, 0);
  objc_storeStrong((id *)&self->_activitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_prerollAttributes, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeResolver, 0);
}

uint64_t __85__AVPictureInPicturePlatformAdapter_pictureInPictureProxy_didReceivePlaybackCommand___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "stopPictureInPictureAndRestoreUserInterface:", 0);
  return result;
}

uint64_t __124__AVPictureInPicturePlatformAdapter_pictureInPictureProxy_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "updateLayoutDependentBehaviors");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
    v6 = 2;
  else
    v6 = 0;

  objc_msgSend(v7, "setObservedTimeControlStatus:", v6);
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v7, "setObservedTimeControlStatus:", v6);
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setScrubbing:", v6);
}

uint64_t __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateProxyPlaybackState");
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setSeeking:", v6);
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    objc_msgSend(v7, "_updateProxyPlaybackState");

}

uint64_t __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateProxyPlaybackState");
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "_removeSecondScreenConnection");
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (AVSecondScreenTVSupportEnabled_onceToken != -1)
    dispatch_once(&AVSecondScreenTVSupportEnabled_onceToken, &__block_literal_global_100);
  if (AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled)
  {
    objc_msgSend(WeakRetained, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceIdiom");

      if (v14 == 1)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.avkit.SharedPreferences"));
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECF1C60);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setRemoteObjectInterface:", v16);

        objc_msgSend(v15, "resume");
        objc_initWeak(&location, v7);
        objc_msgSend(v15, "remoteObjectProxy");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_6;
        v21[3] = &unk_1E5BB09C8;
        objc_copyWeak(&v23, &location);
        objc_copyWeak(&v24, v10);
        v18 = v15;
        v22 = v18;
        objc_msgSend(v17, "extendedDisplayActive:", v21);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      else
      {
        +[AVSecondScreenController sharedInstance](AVSecondScreenController, "sharedInstance");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "player");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addConnectionForPlayer:playerLayer:", v19, WeakRetained);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSecondScreenConnection:", v20);

      }
    }
  }

}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_69(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a4;
  objc_msgSend(v13, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interstitialPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interstitialController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interstitialPlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v12)
      -[AVPictureInPicturePlatformAdapter _updateTimeResolver]((id *)v13);
  }

}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  NSObject *v14;
  void *v15;
  int v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  objc_msgSend(v6, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    objc_msgSend(v5, "playerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rate");
    v13 = v12;

    if (objc_msgSend(v5, "status") >= 2 && v13 != 0.0)
    {
      _AVLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218242;
        v17 = v13;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "Interruption notification: AVPlayerPlaybackWasInterruptedNotification player.rate: %.1f userinfo: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_msgSend(v5, "setInterruptedForAudioSession:", 1);
    }
  }

}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(a4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C89718]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (!v7)
    goto LABEL_6;
  v8 = v12;
  if (v7 == 1)
  {
    objc_msgSend(v12, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v12;
    if (!v10)
    {
      if (objc_msgSend(v12, "status") > 1)
      {
        objc_msgSend(v12, "playerController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setInterruptedForAudioSession:", objc_msgSend(v11, "isPlaying"));

LABEL_7:
        v8 = v12;
        goto LABEL_8;
      }
LABEL_6:
      objc_msgSend(v12, "setInterruptedForAudioSession:", 0);
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a4;
  objc_msgSend(v8, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    objc_msgSend(v8, "updateLayoutDependentBehaviors");

}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_6(id *a1, char a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v4 = objc_loadWeakRetained(a1 + 6);
  if ((a2 & 1) == 0)
  {
    if (AVSecondScreenTVSupportEnabled_onceToken != -1)
      dispatch_once(&AVSecondScreenTVSupportEnabled_onceToken, &__block_literal_global_100);
    if (AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled)
    {
      if (WeakRetained)
      {
        objc_msgSend(v4, "player");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          +[AVSecondScreenController sharedInstance](AVSecondScreenController, "sharedInstance");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "player");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addConnectionForPlayer:playerLayer:", v7, v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setSecondScreenConnection:", v8);

        }
      }
    }
  }
  objc_msgSend(a1[4], "invalidate");

}

uint64_t __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateLayoutDependentBehaviors");
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a4;
  if ((unint64_t)(objc_msgSend(v8, "status") - 3) <= 1)
  {
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLValue"))
      v7 = 4;
    else
      v7 = 3;
    objc_msgSend(v8, "_updateStatusUsingProposedStatus:", v7);

  }
}

uint64_t __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateStatus");
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(a4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGSizeValue");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v12, "pictureInPictureViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferredContentSize:", v7, v9);

  objc_msgSend(v12, "pegasusProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeDidChangeForViewController");

}

uint64_t __63__AVPictureInPicturePlatformAdapter__setupTimeResolverIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateProxyPlaybackState");
}

void __62__AVPictureInPicturePlatformAdapter__updateProxyPlaybackState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  float v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "controlsStyle");
  switch(v3)
  {
    case 2:
      objc_msgSend(v22, "setContentType:", 4);
      break;
    case 1:
      objc_msgSend(v22, "setContentType:", 3);
      objc_msgSend(v22, "setMuted:", objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled") ^ 1);
      break;
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rate");
      v6 = v5;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "targetTime");
      v8 = v7;
      v9 = 0.0;
      if (objc_msgSend(v4, "status") == 2)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "playerController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contentDurationWithinEndTimes");
        v9 = v11;

      }
      v12 = objc_msgSend(*(id *)(a1 + 32), "observedTimeControlStatus");
      if (objc_msgSend(*(id *)(a1 + 32), "isScrubbingOrSeeking"))
      {
        objc_msgSend(*(id *)(a1 + 32), "rateWhenScrubbingOrSeekingBegan");
        objc_msgSend(*(id *)(a1 + 32), "rateWhenScrubbingOrSeekingBegan");
        if (v13 != 0.0)
          v12 = 1;
      }
      v14 = v6;
      if (objc_msgSend(v4, "hasLiveStreamingContent"))
      {
        objc_msgSend(v22, "setContentType:", 2);
        if ((objc_msgSend(*(id *)(a1 + 32), "requiresLinearPlayback") & 1) != 0)
          v15 = 1;
        else
          v15 = objc_msgSend(v4, "hasSeekableLiveStreamingContent") ^ 1;
      }
      else
      {
        objc_msgSend(v22, "setContentType:", 1);
        v15 = objc_msgSend(*(id *)(a1 + 32), "requiresLinearPlayback");
      }
      objc_msgSend(v22, "setRequiresLinearPlayback:", v15);
      objc_msgSend(v22, "setContentDuration:", v9);
      objc_msgSend(v22, "setPlaybackRate:elapsedTime:timeControlStatus:", v12, v14, v8);
      objc_msgSend(v22, "setMuted:", objc_msgSend(v4, "isMuted"));
      objc_msgSend(*(id *)(a1 + 32), "prerollAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pegasusAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPrerollAttributes:", v17);

      break;
  }
  objc_msgSend(v22, "setRoutingVideoToHostedWindow:", objc_msgSend(*(id *)(a1 + 32), "isRoutingVideoToHostedWindow"));
  v18 = objc_msgSend(*(id *)(a1 + 32), "backgroundPlaybackPolicy");
  objc_msgSend(*(id *)(a1 + 32), "activitySessionIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = objc_msgSend(*(id *)(a1 + 32), "backgroundPlaybackPolicy");

    if (v21 == 1)
      v18 = 3;
  }
  objc_msgSend(v22, "setBackgroundAudioPolicy:", v18);

}

- (uint64_t)_sceneActivationState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avkit_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "sourceWindowWhenPictureInPictureStarted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v5)
  {
    v7 = -1;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "activationState");
  if (v7)
  {
LABEL_9:
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "source");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "source");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "avkit_window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "sourceWindowWhenPictureInPictureStarted");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315906;
      v16 = "-[AVPictureInPicturePlatformAdapter _sceneActivationState]";
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s source = %{public}@; source.avkit_window = %{public}@; sourceWindowWhenPictureInPictureStarted = %{public}@",
        (uint8_t *)&v15,
        0x2Au);

    }
    _AVLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = "-[AVPictureInPicturePlatformAdapter _sceneActivationState]";
      v17 = 2114;
      v18 = v5;
      v19 = 1024;
      LODWORD(v20) = v7;
      _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s windowScene = %{public}@;  activationState = %d",
        (uint8_t *)&v15,
        0x1Cu);
    }

  }
  return v7;
}

+ (NSString)startPictureInPictureButtonImageName
{
  __CFString *v2;

  v2 = CFSTR("pip.enter");
  return (NSString *)CFSTR("pip.enter");
}

+ (NSString)stopPictureInPictureButtonImageName
{
  __CFString *v2;

  v2 = CFSTR("pip.exit");
  return (NSString *)CFSTR("pip.exit");
}

+ (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return (UIImageSymbolConfiguration *)objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, v4);
}

- (void)_setStatusAndNotifyDelegateIfNeeded:(int64_t)a3
{
  NSObject *v5;
  int64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[AVPictureInPicturePlatformAdapter status](self, "status") != a3)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[AVPictureInPicturePlatformAdapter(Common) _setStatusAndNotifyDelegateIfNeeded:]";
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s  newStatus: %ld", (uint8_t *)&v8, 0x16u);
    }

    v6 = -[AVPictureInPicturePlatformAdapter status](self, "status");
    -[AVPictureInPicturePlatformAdapter setStatus:](self, "setStatus:", a3);
    -[AVPictureInPicturePlatformAdapter delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pictureInPicturePlatformAdapter:statusDidChange:fromStatus:", self, a3, v6);

  }
}

- (void)_setRoutingVideoToHostedWindow:(BOOL)a3 pictureInPictureViewController:(id)a4 source:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "avkit_startRoutingVideoToPictureInPictureViewController:", v8);
  else
    objc_msgSend(v9, "avkit_stopRoutingVideoToPictureInPictureViewController:", v8);
  _AVLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "NO";
    v13 = 136315650;
    v14 = "-[AVPictureInPicturePlatformAdapter(Common) _setRoutingVideoToHostedWindow:pictureInPictureViewController:source:]";
    v16 = "shouldRoute";
    v15 = 2080;
    if (v6)
      v12 = "YES";
    v17 = 2080;
    v18 = v12;
    _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v13, 0x20u);
  }

  -[AVPictureInPicturePlatformAdapter setRoutingVideoToHostedWindow:](self, "setRoutingVideoToHostedWindow:", v6);
}

@end
