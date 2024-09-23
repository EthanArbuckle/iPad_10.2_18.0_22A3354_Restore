@implementation MediaCaptureStatusBarManager

- (void)browserControllerWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v17;

  v17 = a3;
  -[SFMediaCaptureStatusBarManager _recordingDocument](self, "_recordingDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MediaCaptureStatusBarManager recordingTabDocument](self, "recordingTabDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ownerUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      -[MediaCaptureStatusBarManager recordingTabDocument](self, "recordingTabDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "browserController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tabCollectionViewProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tabThumbnailCollectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v12;
      if (objc_msgSend(v13, "presentationState") == 1)
      {

      }
      else
      {
        v14 = objc_msgSend(v13, "presentationState");

        if (v14 != 2)
        {
          -[MediaCaptureStatusBarManager recordingTabDocument](self, "recordingTabDocument");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isActive") & 1) == 0)
          {

            goto LABEL_14;
          }
          v16 = -[SFMediaCaptureStatusBarManager _hasStatusBarOverride](self, "_hasStatusBarOverride");

          if (!v16)
            goto LABEL_14;
          goto LABEL_9;
        }
      }
      if (!-[SFMediaCaptureStatusBarManager _hasStatusBarOverride](self, "_hasStatusBarOverride"))
      {
LABEL_14:

        goto LABEL_15;
      }
LABEL_9:
      -[SFMediaCaptureStatusBarManager _releaseStatusBarOverride](self, "_releaseStatusBarOverride");
      goto LABEL_14;
    }
    if (!-[SFMediaCaptureStatusBarManager _hasStatusBarOverride](self, "_hasStatusBarOverride"))
      -[SFMediaCaptureStatusBarManager _acquireStatusBarOverride](self, "_acquireStatusBarOverride");
  }
LABEL_15:

}

+ (MediaCaptureStatusBarManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_65);
  return (MediaCaptureStatusBarManager *)(id)sharedManager_sharedInstance_0;
}

void __45__MediaCaptureStatusBarManager_sharedManager__block_invoke()
{
  MediaCaptureStatusBarManager *v0;
  void *v1;

  v0 = objc_alloc_init(MediaCaptureStatusBarManager);
  v1 = (void *)sharedManager_sharedInstance_0;
  sharedManager_sharedInstance_0 = (uint64_t)v0;

}

- (void)tabDidBecomeActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SFMediaCaptureStatusBarManager _recordingDocument](self, "_recordingDocument");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v12, "browserController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabCollectionViewProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabThumbnailCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    if (objc_msgSend(v8, "presentationState") == 1)
    {

    }
    else
    {
      v9 = objc_msgSend(v8, "presentationState");

      if (v9 != 2)
      {
        -[MediaCaptureStatusBarManager recordingTabDocument](self, "recordingTabDocument");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "browserController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5 == v11)
        {
          if (v4 == v12 && -[SFMediaCaptureStatusBarManager _hasStatusBarOverride](self, "_hasStatusBarOverride"))
          {
            -[SFMediaCaptureStatusBarManager _releaseStatusBarOverride](self, "_releaseStatusBarOverride");
          }
          else if (!-[SFMediaCaptureStatusBarManager _hasStatusBarOverride](self, "_hasStatusBarOverride"))
          {
            -[SFMediaCaptureStatusBarManager _acquireStatusBarOverride](self, "_acquireStatusBarOverride");
          }
        }
      }
    }

  }
}

- (void)browserControllerWillEnterTabView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SFMediaCaptureStatusBarManager _recordingDocument](self, "_recordingDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || !-[SFMediaCaptureStatusBarManager _hasStatusBarOverride](self, "_hasStatusBarOverride"))
  {

    goto LABEL_6;
  }
  -[MediaCaptureStatusBarManager recordingTabDocument](self, "recordingTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "browserController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 == v8)
  {
    -[SFMediaCaptureStatusBarManager _releaseStatusBarOverride](self, "_releaseStatusBarOverride");
LABEL_6:
    v7 = v8;
  }

}

- (void)browserControllerWillExitTabView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  -[SFMediaCaptureStatusBarManager _recordingDocument](self, "_recordingDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || -[SFMediaCaptureStatusBarManager _hasStatusBarOverride](self, "_hasStatusBarOverride"))
    goto LABEL_5;
  -[MediaCaptureStatusBarManager recordingTabDocument](self, "recordingTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "browserController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v9)
  {

LABEL_5:
    goto LABEL_6;
  }
  -[MediaCaptureStatusBarManager recordingTabDocument](self, "recordingTabDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  if ((v8 & 1) == 0)
    -[SFMediaCaptureStatusBarManager _acquireStatusBarOverride](self, "_acquireStatusBarOverride");
LABEL_6:

}

- (void)browserControllerDidEnterBackground:(id)a3
{
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  -[SFMediaCaptureStatusBarManager _recordingDocument](self, "_recordingDocument");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[SFMediaCaptureStatusBarManager _hasStatusBarOverride](self, "_hasStatusBarOverride");

    if (!v6)
    {
      -[MediaCaptureStatusBarManager recordingTabDocument](self, "recordingTabDocument");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ownerUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v10)
        -[SFMediaCaptureStatusBarManager _acquireStatusBarOverride](self, "_acquireStatusBarOverride");
    }
  }

}

- (void)activateApp
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportsMultipleScenes") & 1) == 0 && objc_msgSend(v5, "applicationState"))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openApplicationWithBundleID:", v4);

  }
}

- (id)statusString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMediaCaptureStatusBarManager simplifiedURLString](self, "simplifiedURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
