@implementation DYPlaybackViewController

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DYPlaybackViewController;
  -[DYPlaybackViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__DYPlaybackViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_250D7C930;
  v9[4] = self;
  v8 = (void *)MEMORY[0x24262437C](v9);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &__block_literal_global);

}

void __79__DYPlaybackViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CATransform3D v24;
  CATransform3D v25;
  CATransform3D v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "transform");
  else
    memset(&v25, 0, sizeof(v25));
  CATransform3DInvert(&v26, &v25);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v26;
  objc_msgSend(v6, "setSublayerTransform:", &v24);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "view", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sublayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bounds");
        v17 = v16;
        v19 = v18;

        objc_msgSend(v13, "setPosition:", v17 * 0.5, v19 * 0.5);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v10);
  }

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

@end
