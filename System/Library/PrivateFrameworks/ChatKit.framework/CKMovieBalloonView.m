@implementation CKMovieBalloonView

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMovieBalloonView;
  -[CKImageBalloonView prepareForReuse](&v3, sel_prepareForReuse);
  -[CKMovieBalloonView cleanupPlayerIfNeeded](self, "cleanupPlayerIfNeeded");
}

- (void)cleanupPlayerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKMovieBalloonView avPlayerItem](self, "avPlayerItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC58], v8);

    -[CKMovieBalloonView avPlayerLayer](self, "avPlayerLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperlayer");
    -[CKMovieBalloonView setAVPlayerItem:](self, "setAVPlayerItem:", 0);
    -[CKMovieBalloonView setAVPlayer:](self, "setAVPlayer:", 0);
    -[CKMovieBalloonView setAVPlayerLayer:](self, "setAVPlayerLayer:", 0);
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuspended:", 0);

    +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivate");

  }
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  objc_super v11;

  v6 = a6;
  v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CKMovieBalloonView;
  v10 = a3;
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](&v11, sel_configureForMediaObject_previewWidth_orientation_hasInvisibleInkEffect_, v10, v7, v6, a4);
  -[CKMovieBalloonView setMediaObject:](self, "setMediaObject:", v10, v11.receiver, v11.super_class);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKMovieBalloonView;
  -[CKImageBalloonView dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKMovieBalloonView;
  -[CKImageBalloonView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMovieBalloonView mediaObject](self, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ mediaObject: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMovieBalloonView;
  -[CKImageBalloonView layoutSubviews](&v4, sel_layoutSubviews);
  -[CKMovieBalloonView avPlayerLayer](self, "avPlayerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMovieBalloonView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMovieBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v8, sel_prepareForDisplay);
  -[CKMovieBalloonView avPlayerLayer](self, "avPlayerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isScheduledMessagesCoreEnabled");

    -[CKMovieBalloonView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "addSublayer:", v3);
    else
      objc_msgSend(v6, "insertSublayer:atIndex:", v3, 0);

  }
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  double v20;
  double v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  int v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  objc_super v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[16];
  CGPoint v44;
  CGRect v45;

  v4 = a3;
  -[CKMovieBalloonView avPlayerLayer](self, "avPlayerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKMovieBalloonView cleanupPlayerIfNeeded](self, "cleanupPlayerIfNeeded");
    -[CKBalloonView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMovieBalloonView mediaObject](self, "mediaObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balloonView:mediaObjectDidFinishPlaying:", self, v7);
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playButtonImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMovieBalloonView bounds](self, "bounds");
    -[CKMovieBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v6, "size");
    v18 = v17;
    v20 = v19;
    if (CKMainScreenScale_once_55 != -1)
      dispatch_once(&CKMainScreenScale_once_55, &__block_literal_global_136);
    if (*(double *)&CKMainScreenScale_sMainScreenScale_55 == 0.0)
      v21 = 1.0;
    else
      v21 = *(double *)&CKMainScreenScale_sMainScreenScale_55;
    -[CKMovieBalloonView createAVAssetAndValidateCodec](self, "createAVAssetAndValidateCodec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "CKMovieBalloonView: Failed to create AVAsset and/or validate codec", buf, 2u);
      }

    }
    v23 = -[CKObscurableBalloonView isObscured](self, "isObscured");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "playsInlineVideo");

    if (v7
      && !v23
      && v25
      && (objc_msgSend(v4, "locationInView:", self),
          v44.x = v26,
          v44.y = v27,
          v45.origin.x = 1.0 / v21 * (v10 * v21 + floor((v14 * v21 - v18 * v21) * 0.5)),
          v45.origin.y = 1.0 / v21 * (v12 * v21 + floor((v16 * v21 - v20 * v21) * 0.5)),
          v45.size.width = v18 * v21 * (1.0 / v21),
          v45.size.height = v20 * v21 * (1.0 / v21),
          CGRectContainsPoint(v45, v44)))
    {
      objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMovieBalloonView setAVPlayerItem:](self, "setAVPlayerItem:", v28);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObserver:selector:name:object:", self, sel_videoDidReachEnd_, *MEMORY[0x1E0C8AC48], v28);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObserver:selector:name:object:", self, sel_videoDidReachEnd_, *MEMORY[0x1E0C8AC58], v28);

      objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithPlayerItem:", v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMovieBalloonView setAVPlayer:](self, "setAVPlayer:", v31);
      objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setVideoGravity:", *MEMORY[0x1E0C8A6E0]);
      -[CKMovieBalloonView bounds](self, "bounds");
      objc_msgSend(v32, "setFrame:");
      -[CKMovieBalloonView setAVPlayerLayer:](self, "setAVPlayerLayer:", v32);
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isScheduledMessagesCoreEnabled");

      -[CKMovieBalloonView layer](self, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v34)
        objc_msgSend(v35, "addSublayer:", v32);
      else
        objc_msgSend(v35, "insertSublayer:atIndex:", v32, 0);

      -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSuspended:", 1);

      +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __43__CKMovieBalloonView_tapGestureRecognized___block_invoke;
      v41[3] = &unk_1E274A208;
      v42 = v31;
      v39 = v31;
      objc_msgSend(v38, "activateWithOptions:completion:", 1, v41);

    }
    else
    {
      v40.receiver = self;
      v40.super_class = (Class)CKMovieBalloonView;
      -[CKImageBalloonView tapGestureRecognized:](&v40, sel_tapGestureRecognized_, v4);
    }
  }

}

uint64_t __43__CKMovieBalloonView_tapGestureRecognized___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "play");
}

- (BOOL)isCodecTypeAllowed:(unsigned int)a3
{
  NSObject *v4;
  BOOL v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  unsigned int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v11 = 67109888;
      v12 = HIBYTE(a3);
      v13 = 1024;
      v14 = BYTE2(a3);
      v15 = 1024;
      v16 = BYTE1(a3);
      v17 = 1024;
      v18 = a3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Validating Video CodecType: '%c%c%c%c'", (uint8_t *)&v11, 0x1Au);
    }

  }
  if (a3 == 1748121139)
  {
    v5 = 1;
LABEL_11:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 67109888;
        v12 = HIBYTE(a3);
        v13 = 1024;
        v14 = BYTE2(a3);
        v15 = 1024;
        v16 = BYTE1(a3);
        v17 = 1024;
        v18 = a3;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Video CodecType '%c%c%c%c' is allowed", (uint8_t *)&v11, 0x1Au);
      }

    }
  }
  else
  {
    v6 = 1;
    while (v6 != 6)
    {
      v7 = isCodecTypeAllowed__allowableCodecTypes[v6++];
      if (v7 == a3)
      {
        v5 = (unint64_t)(v6 - 2) < 5;
        goto LABEL_11;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 67109888;
        v12 = HIBYTE(a3);
        v13 = 1024;
        v14 = BYTE2(a3);
        v15 = 1024;
        v16 = BYTE1(a3);
        v17 = 1024;
        v18 = a3;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "CKMovieBalloonView: Video CodecType '%c%c%c%c' is not allowed", (uint8_t *)&v11, 0x1Au);
      }

    }
    return 0;
  }
  return v5;
}

- (id)createAVAssetAndValidateCodec
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  _QWORD v39[4];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Creating AVAsset…", buf, 2u);
    }

  }
  v39[0] = *MEMORY[0x1E0C8A2E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMovieBalloonView mediaObject](self, "mediaObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  CKAVURLAssetForURLWithAllowableTypeCategories(v31, v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "pathExtension");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracks");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v28;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Validating FileType: %@", buf, 0xCu);
    }

  }
  v7 = objc_msgSend(v30, "count") == 0;
  v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "CKMovieBalloonView: Unsupported FileType: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Supported FileType: %@", buf, 0xCu);
      }

    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v30;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      v13 = *MEMORY[0x1E0C8A808];
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v15, "isEnabled"))
          {
            objc_msgSend(v15, "mediaType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqual:", v13);

            if (v17)
            {
              objc_msgSend(v15, "formatDescriptions");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "count");
              if (v20)
              {
                v21 = 0;
                while (1)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!-[CKMovieBalloonView isCodecTypeAllowed:](self, "isCodecTypeAllowed:", CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v22)))break;
                  if (v20 == ++v21)
                    goto LABEL_34;
                }
                objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "processName");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                IMLogSimulateCrashForProcess();

                v5 = 0;
              }
LABEL_34:

              goto LABEL_35;
            }
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_35:

  }
  v25 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v25)
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Succesfully created AVAsset", buf, 2u);
      }
LABEL_44:

    }
  }
  else if (v25)
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "CKMovieBalloonView: Failed to create AVAsset", buf, 2u);
    }
    goto LABEL_44;
  }

  return v5;
}

- (void)videoDidReachEnd:(id)a3
{
  void *v4;
  id v5;

  -[CKMovieBalloonView cleanupPlayerIfNeeded](self, "cleanupPlayerIfNeeded", a3);
  -[CKBalloonView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMovieBalloonView mediaObject](self, "mediaObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonView:mediaObjectDidFinishPlaying:", self, v4);

}

- (CKMovieMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObject, a3);
}

- (void)setAVPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayerItem, a3);
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAVPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayer, a3);
}

- (AVPlayerLayer)avPlayerLayer
{
  return self->_avPlayerLayer;
}

- (void)setAVPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayerLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayerLayer, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end
