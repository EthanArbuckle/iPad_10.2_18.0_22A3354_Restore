@implementation VKMapSnapshotCreator

void __90__VKMapSnapshotCreator_MapKitAdditions___mapkit_configureWithOptions_configuration_scale___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_overlayRenderersForOverlayLevel:", a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0DC6530];
        objc_msgSend(v9, "overlay");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "overlayWithDrawable:forOverlay:atLevel:", v9, v11, a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setContentScaleFactor:", *(double *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 40), "addOverlay:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

@end
