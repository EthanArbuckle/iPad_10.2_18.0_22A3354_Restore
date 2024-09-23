@implementation ICDocCamNavigationController

- (ICDocCamNavigationController)initWithImageCache:(id)a3 docCamDelegate:(id)a4 remoteDocCamDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  __objc2_class **v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  ICDocCamNavigationController *v17;
  ICDocCamNavigationController *v18;
  objc_super v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (DCDebugInterfaceEnabled())
    v11 = &off_24C5B6C68;
  else
    v11 = off_24C5B6C60;
  v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithImageCache:", v10);

  v13 = objc_opt_class();
  DCDynamicCast(v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", v9);

  v15 = objc_opt_class();
  DCDynamicCast(v15, (uint64_t)v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", v8);

  v20.receiver = self;
  v20.super_class = (Class)ICDocCamNavigationController;
  v17 = -[ICDocCamNavigationController initWithRootViewController:](&v20, sel_initWithRootViewController_, v12);
  v18 = v17;
  if (v17)
    -[ICDocCamNavigationController setModalPresentationStyle:](v17, "setModalPresentationStyle:", 0);

  return v18;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (void)prepareForDismissal
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[ICDocCamNavigationController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
        v9 = objc_opt_class();
        DCDynamicCast(v9, (uint64_t)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v8, "prepareForDismissal");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ICDocCamNavigationController viewControllers](self, "viewControllers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v17 = objc_opt_class();
        DCDynamicCast(v17, (uint64_t)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v16, "prepareForDismissal");
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
