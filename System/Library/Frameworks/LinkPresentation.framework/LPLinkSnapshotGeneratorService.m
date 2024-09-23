@implementation LPLinkSnapshotGeneratorService

- (void)snapshotForMetadata:(id)a3 configurations:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__LPLinkSnapshotGeneratorService_snapshotForMetadata_configurations_completionHandler___block_invoke;
  block[3] = &unk_1E44A8220;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __87__LPLinkSnapshotGeneratorService_snapshotForMetadata_configurations_completionHandler___block_invoke(uint64_t a1)
{
  LPLinkView *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
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
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  CGContext *CurrentContext;
  CGContext *v31;
  UIImage *v32;
  void *v33;
  void *context;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGSize v42;
  CGRect v43;

  v41 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A1B02C1C]();
  v35 = a1;
  v2 = -[LPLinkView initWithMetadata:]([LPLinkView alloc], "initWithMetadata:", *(_QWORD *)(a1 + 32));
  -[LPLinkView _setUseLowMemoryImageFilters:](v2, "_setUseLowMemoryImageFilters:", 1);
  -[LPLinkView _setDisableAutoPlay:](v2, "_setDisableAutoPlay:", 1);
  -[LPLinkView _setAllowsAsynchronousImageDecoding:](v2, "_setAllowsAsynchronousImageDecoding:", 0);
  -[LPLinkView _setUseCPURenderingForMaterials:](v2, "_setUseCPURenderingForMaterials:", 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(v35 + 40), "count"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = *(id *)(v35 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v37;
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        v11 = objc_alloc_init(MEMORY[0x1E0DC3F98]);
        objc_msgSend(v10, "traitCollection", context);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setOverrideUserInterfaceStyle:", objc_msgSend(v12, "userInterfaceStyle"));

        objc_msgSend(v11, "addSubview:", v2);
        -[LPLinkView _setPreferredSizeClass:](v2, "_setPreferredSizeClass:", objc_msgSend(v10, "preferredSizeClass"));
        objc_msgSend(v10, "sizeClassParameters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPLinkView _setSizeClassParameters:](v2, "_setSizeClassParameters:", v13);

        objc_msgSend(v10, "size");
        if (v15 == v7 && v14 == v8)
        {
          objc_msgSend(v10, "maximumSize");
          v17 = v16;
          objc_msgSend(v10, "maximumSize");
          -[LPLinkView sizeThatFits:](v2, "sizeThatFits:");
        }
        else
        {
          objc_msgSend(v10, "size");
          v17 = v19;
          objc_msgSend(v10, "size");
        }
        -[LPLinkView setFrame:](v2, "setFrame:", 0.0, 0.0, v17, v18);
        -[LPLinkView _effectiveCornerRadius](v2, "_effectiveCornerRadius");
        v21 = v20;
        -[LPLinkView layer](v2, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setCornerRadius:", v21);

        -[LPLinkView layoutIfNeeded](v2, "layoutIfNeeded");
        -[LPLinkView bounds](v2, "bounds");
        v24 = v23;
        v26 = v25;
        objc_msgSend(v10, "scale");
        v28 = v27;
        v42.width = v24;
        v42.height = v26;
        UIGraphicsBeginImageContextWithOptions(v42, 0, v28);
        -[LPLinkView layer](v2, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "renderInContext:", UIGraphicsGetCurrentContext());

        if (objc_msgSend(v10, "showDebugIndicators"))
        {
          CurrentContext = UIGraphicsGetCurrentContext();
          CGContextSetRGBFillColor(CurrentContext, 0.0, 0.0, 1.0, 0.2);
          v31 = UIGraphicsGetCurrentContext();
          -[LPLinkView bounds](v2, "bounds");
          CGContextFillRect(v31, v43);
        }
        UIGraphicsGetImageFromCurrentImageContext();
        v32 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIImagePNGRepresentation(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v33);

        UIGraphicsEndImageContext();
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(v35 + 48) + 16))();
  objc_autoreleasePoolPop(context);
}

@end
