@implementation MPCVideoViewControllerMediaFoundationImplementation

uint64_t __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v1 = MEMORY[0x24BDAC9B8];
  objc_copyWeak(&v4, &location);
  v2 = MSVLogAddStateHandler();
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
  return v2;
}

void __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(WeakRetained, "_stateDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v3;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "com.apple.mediaplaybackcore.videodebug: %@", (uint8_t *)&v28, 0xCu);

  }
  objc_msgSend(WeakRetained, "internalController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "borderWidth");
  v8 = v7;

  if (v8 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

    objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "CGColor");
    objc_msgSend(WeakRetained, "internalController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBorderColor:", v21);

    objc_msgSend(WeakRetained, "internalController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBorderWidth:", 2.0);

    objc_msgSend(WeakRetained, "internalController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 0.85;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    objc_msgSend(WeakRetained, "internalController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderWidth:", 0.0);

    objc_msgSend(WeakRetained, "internalController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1.0;
  }
  objc_msgSend(v15, "setAlpha:", v17);

}

uint64_t __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_stateDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5[2](v5, v9);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
