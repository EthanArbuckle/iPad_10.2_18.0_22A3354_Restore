@implementation HULinkedApplicationStoreItem

- (HULinkedApplicationStoreItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithStoreItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULinkedApplicationItem.m"), 222, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULinkedApplicationStoreItem init]",
    v5);

  return 0;
}

- (HULinkedApplicationStoreItem)initWithStoreItem:(id)a3
{
  id v5;
  HULinkedApplicationStoreItem *v6;
  HULinkedApplicationStoreItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationStoreItem;
  v6 = -[HULinkedApplicationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storeItem, a3);

  return v7;
}

- (HULinkedApplicationStoreItem)initWithStoreItem:(id)a3 associatedAccessories:(id)a4
{
  id v6;
  HULinkedApplicationStoreItem *v7;
  HULinkedApplicationStoreItem *v8;

  v6 = a4;
  v7 = -[HULinkedApplicationStoreItem initWithStoreItem:](self, "initWithStoreItem:", a3);
  v8 = v7;
  if (v7)
    -[HULinkedApplicationItem setAssociatedAccessories:](v7, "setAssociatedAccessories:", v6);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HULinkedApplicationStoreItem storeItem](self, "storeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationItem associatedAccessories](self, "associatedAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithStoreItem:associatedAccessories:", v5, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[HULinkedApplicationStoreItem storeItem](self, "storeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HULinkedApplicationStoreItem;
  -[HULinkedApplicationItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6F4C8A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v35 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "storeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("iosSoftware"));

  if (!v6)
  {
    v9 = 0;
    v11 = 0;
    v14 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = v35;
LABEL_16:
    objc_msgSend(WeakRetained, "_failedUpdateOutcome");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(WeakRetained, "storeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v33 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "storeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "storeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artistName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "storeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userRating");
  objc_msgSend(v12, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "storeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "offers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "price");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

    if (v20 == 0.0)
      _HULocalizedStringWithDefaultValue(CFSTR("HULinkedApplicationPriceFree"), CFSTR("HULinkedApplicationPriceFree"), 1);
    else
      objc_msgSend(v17, "formattedPrice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v35;

  }
  else
  {
    v21 = 0;
    v25 = v35;
  }
  objc_msgSend(WeakRetained, "storeItem", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "productPageURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "storeItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "artwork");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v34;
  if (!v9 || !v11 || !v14 || !v21 || !v22 || !v34)
    goto LABEL_16;
  objc_msgSend(WeakRetained, "_loadStoreIconWithArtwork:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke_2;
  v37[3] = &unk_1E6F59C68;
  v38 = v25;
  v39 = v22;
  v40 = v9;
  v41 = v11;
  v42 = v14;
  v43 = v21;
  objc_msgSend(v28, "flatMap:", v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v29;
  v36[1] = 3221225472;
  v36[2] = __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke_3;
  v36[3] = &unk_1E6F4F2D0;
  v36[4] = WeakRetained;
  objc_msgSend(v30, "recover:", v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v35;
  v24 = v34;
LABEL_17:

  return v31;
}

id __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a1[5], CFSTR("HFResultApplicationStoreURL"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a1[6], *MEMORY[0x1E0D30D18]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a1[7], CFSTR("HFResultApplicationPublisher"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a1[8], CFSTR("HFResultApplicationAverageRating"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a1[9], CFSTR("HFResultApplicationPrice"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("HFResultApplicationIsInstalled"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30C70]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_failedUpdateOutcome");
}

- (id)_loadStoreIconWithArtwork:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[4];
  id v23;
  double v24;
  int v25;

  v4 = (void *)MEMORY[0x1E0CEA950];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  v9 = -[HULinkedApplicationItem _iconVariantForScale:](self, "_iconVariantForScale:", v8);
  -[HULinkedApplicationStoreItem _imageForSize:fromArtwork:](self, "_imageForSize:fromArtwork:", v5, 60.0, 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLWithHeight:width:cropStyle:format:", (uint64_t)(v8 * 60.0), (uint64_t)(v8 * 60.0), *MEMORY[0x1E0CFD878], *MEMORY[0x1E0CFD880]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__HULinkedApplicationStoreItem__loadStoreIconWithArtwork___block_invoke;
    aBlock[3] = &unk_1E6F59C90;
    v23 = v11;
    v24 = v8;
    v25 = v9;
    v13 = _Block_copy(aBlock);
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lazyFutureWithBlock:scheduler:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reschedule:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1008, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

void __58__HULinkedApplicationStoreItem__loadStoreIconWithArtwork___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:scale:", v5, *(double *)(a1 + 40)));
    objc_msgSend(v9, "CGImage");
    v10 = LICreateIconForImage();
    v11 = v9;
    if (v10)
    {
      v12 = (const void *)v10;
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v10, 0, *(double *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      CFRelease(v12);
    }
    if (v11)
    {
      objc_msgSend(v3, "finishWithResult:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1008, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithError:", v13);

    }
  }
  else
  {
    objc_msgSend(v3, "finishWithError:", v6);
  }

}

- (id)_imageForSize:(CGSize)a3 fromArtwork:(id)a4
{
  double height;
  double width;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  id v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  height = a3.height;
  width = a3.width;
  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v11 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v12 = *(_QWORD *)v27;
    while (2)
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v15, "width", (_QWORD)v26);
        v17 = v16;
        objc_msgSend(v15, "height");
        if (v17 == width && v18 == height)
        {
          v24 = v15;

          goto LABEL_36;
        }
        v10 = v18;
        if (!v9)
          goto LABEL_29;
        if (v14 >= height)
          v20 = 1;
        else
          v20 = -1;
        if (v18 <= v14)
          v20 = 0;
        if (v18 < height)
          v21 = 1;
        else
          v21 = -1;
        if (v18 < v14)
          v20 = v21;
        if (v17 >= v11)
          v22 = v17 > v11 && v11 < width;
        else
          v22 = v17 >= width;
        if (v20 == -1 || v22)
        {
LABEL_29:
          v23 = v15;

          v9 = v23;
          v11 = v17;
          v14 = v10;
        }
        else
        {
          v10 = v14;
        }
        ++v13;
      }
      while (v8 != v13);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v9 = v9;
  v24 = v9;
LABEL_36:

  return v24;
}

- (AMSLookupItem)storeItem
{
  return self->_storeItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItem, 0);
}

@end
