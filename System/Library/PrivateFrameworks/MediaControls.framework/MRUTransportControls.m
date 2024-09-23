@implementation MRUTransportControls

- (MRUTransportControls)initWithMPCResponse:(id)a3
{
  id v4;
  MRUTransportControls *v5;
  MRUTransportControls *v6;
  uint64_t v7;
  MRUTransportControlItem *leadingItem;
  uint64_t v9;
  MRUTransportControlItem *leftItem;
  uint64_t v11;
  MRUTransportControlItem *centerItem;
  uint64_t v13;
  MRUTransportControlItem *rightItem;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRUTransportControls;
  v5 = -[MRUTransportControls init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MRUTransportControls leadingItemFromResponse:](v5, "leadingItemFromResponse:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    leadingItem = v6->_leadingItem;
    v6->_leadingItem = (MRUTransportControlItem *)v7;

    -[MRUTransportControls leftItemFromResponse:](v6, "leftItemFromResponse:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    leftItem = v6->_leftItem;
    v6->_leftItem = (MRUTransportControlItem *)v9;

    -[MRUTransportControls centerItemFromResponse:](v6, "centerItemFromResponse:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    centerItem = v6->_centerItem;
    v6->_centerItem = (MRUTransportControlItem *)v11;

    -[MRUTransportControls rightItemFromResponse:](v6, "rightItemFromResponse:", v4);
    v13 = objc_claimAutoreleasedReturnValue();
    rightItem = v6->_rightItem;
    v6->_rightItem = (MRUTransportControlItem *)v13;

  }
  return v6;
}

- (MRUTransportControls)init
{
  return -[MRUTransportControls initWithMPCResponse:](self, "initWithMPCResponse:", 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("leading %@ | %@ left: %@ | center: %@ | right: %@"), objc_opt_class(), self->_leadingItem, self->_leftItem, self->_centerItem, self->_rightItem);
}

- (BOOL)isEqual:(id)a3
{
  MRUTransportControls *v4;
  MRUTransportControls *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;

  v4 = (MRUTransportControls *)a3;
  if (self == v4)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRUTransportControls leftItem](v5, "leftItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", self->_leftItem);

      -[MRUTransportControls centerItem](v5, "centerItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 & objc_msgSend(v8, "isEqual:", self->_centerItem);

      -[MRUTransportControls rightItem](v5, "rightItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", self->_rightItem);

      -[MRUTransportControls leadingItem](v5, "leadingItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v9 & v11 & objc_msgSend(v12, "isEqual:", self->_leadingItem);
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (id)leadingItemFromResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  MRUTransportControlItem *v22;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id v27;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v3, "tracklist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "likeCommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "value");
      +[MRUAssetsProvider favoritePackageName](MRUAssetsProvider, "favoritePackageName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v11 = CFSTR("On");
      else
        v11 = CFSTR("Off");
      if (v9)
        v12 = CFSTR(".On");
      else
        v12 = CFSTR(".Off");
      +[MRUCAPackageAsset packageNamed:glyphState:](MRUCAPackageAsset, "packageNamed:glyphState:", v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[MRUAssetsProvider favoriteSymbol](MRUAssetsProvider, "favoriteSymbol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MRUAsset packageAsset:symbolName:image:](MRUAsset, "packageAsset:symbolName:image:", v13, v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("favorite"));
      objc_msgSend(v6, "changeValue:", v9 ^ 1u);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("favorite"), "stringByAppendingString:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__MRUTransportControls_leadingItemFromResponse___block_invoke;
      aBlock[3] = &unk_1E5819160;
      v25 = v16;
      v26 = v8;
      v27 = v17;
      v18 = v17;
      v19 = v8;
      v20 = v16;
      v21 = _Block_copy(aBlock);
      v22 = -[MRUTransportControlItem initWithIdentifier:asset:mainAction:holdBeganAction:holdEndAction:]([MRUTransportControlItem alloc], "initWithIdentifier:asset:mainAction:holdBeganAction:holdEndAction:", v18, v15, v21, 0, 0);

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __48__MRUTransportControls_leadingItemFromResponse___block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D4B358];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MRUTransportControls_leadingItemFromResponse___block_invoke_2;
  v4[3] = &unk_1E5819A50;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  objc_msgSend(v2, "performRequest:completion:", v3, v4);

}

void __48__MRUTransportControls_leadingItemFromResponse___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

- (id)leftItemFromResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  MRUTransportControlItem *v48;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  __CFString *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  _QWORD aBlock[4];
  id v62;
  id v63;
  id v64;
  CATransform3D v65;
  CATransform3D v66;

  v3 = a3;
  objc_msgSend(v3, "tracklist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "tracklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "changeItemCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUAssetsProvider forwardBackwardPackageName](MRUAssetsProvider, "forwardBackwardPackageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v65.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v65.m33 = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v65.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v65.m43 = v12;
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v65.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v65.m13 = v13;
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v65.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v65.m23 = v14;
  CATransform3DRotate(&v66, &v65, 3.14159265, 0.0, 0.0, 1.0);
  +[MRUCAPackageAsset packageNamed:glyphState:permanentTransform:](MRUCAPackageAsset, "packageNamed:glyphState:permanentTransform:", v10, 0, &v66);
  v15 = objc_claimAutoreleasedReturnValue();

  +[MRUAssetsProvider backwardSymbol](MRUAssetsProvider, "backwardSymbol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUAsset packageAsset:symbolName:image:](MRUAsset, "packageAsset:symbolName:image:", v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("backward"));
  objc_msgSend(v5, "seekCommand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferredBackwardJumpIntervals");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  v50 = (void *)v15;
  v51 = v5;
  if (v20)
  {
    objc_msgSend(v5, "seekCommand");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preferredBackwardJumpIntervals");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    objc_msgSend(CFSTR("backward"), "stringByAppendingFormat:", CFSTR(".jump: %f"), *(_QWORD *)&v25);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seekCommand");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "jumpByInterval:", v25);
    v28 = objc_claimAutoreleasedReturnValue();

    +[MRUAssetsProvider goBackwardSymbolForTimeInterval:](MRUAssetsProvider, "goBackwardSymbolForTimeInterval:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUAsset symbolNamed:](MRUAsset, "symbolNamed:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v8 = 0;
    v36 = (void *)v28;
    v17 = (void *)v30;
    v37 = v52;
    if (!v28)
      goto LABEL_10;
  }
  else
  {
    if (!v8)
    {
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v26 = CFSTR("backward");
      v37 = v52;
      goto LABEL_10;
    }
    objc_msgSend(v5, "seekCommand");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "beginSeekWithDirection:", -1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "seekCommand");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "endSeek");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    v31 = 0;
    if (v39 && v41)
    {
      objc_msgSend(CFSTR("backward"), "stringByAppendingString:", CFSTR(".seek.began"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke;
      aBlock[3] = &unk_1E5819160;
      v62 = v39;
      v44 = v52;
      v63 = v44;
      v64 = v42;
      v45 = v42;
      v31 = _Block_copy(aBlock);
      objc_msgSend(CFSTR("backward"), "stringByAppendingString:", CFSTR(".seek.end"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v43;
      v57[1] = 3221225472;
      v57[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_29;
      v57[3] = &unk_1E5819160;
      v58 = v41;
      v59 = v44;
      v60 = v46;
      v47 = v46;
      v32 = _Block_copy(v57);

    }
    v26 = CFSTR("backward");
    v37 = v52;
    v36 = v8;
  }
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_31;
  v53[3] = &unk_1E5819160;
  v33 = v36;
  v54 = v33;
  v55 = v37;
  v26 = v26;
  v56 = v26;
  v8 = _Block_copy(v53);

  v34 = v31;
  v35 = v32;
LABEL_10:
  v48 = -[MRUTransportControlItem initWithIdentifier:asset:mainAction:holdBeganAction:holdEndAction:]([MRUTransportControlItem alloc], "initWithIdentifier:asset:mainAction:holdBeganAction:holdEndAction:", v26, v17, v8, v34, v35);

  return v48;
}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D4B358];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_2;
  v4[3] = &unk_1E5819A50;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  objc_msgSend(v2, "performRequest:completion:", v3, v4);

}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_29(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D4B358];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_2_30;
  v4[3] = &unk_1E5819A50;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  objc_msgSend(v2, "performRequest:completion:", v3, v4);

}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_2_30(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_31(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D4B358];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_2_32;
  v4[3] = &unk_1E5819A50;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  objc_msgSend(v2, "performRequest:options:completion:", v3, 0x10000, v4);

}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_2_32(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

- (id)centerItemFromResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MRUTransportControlItem *v20;
  _QWORD aBlock[4];
  id v23;
  id v24;
  __CFString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v3 = a3;
  objc_msgSend(v3, "tracklist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "play");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUAssetsProvider playSymbol](MRUAssetsProvider, "playSymbol");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v5)
    {
      objc_msgSend(v5, "duration");
      if ((_BYTE)v29)
      {
        +[MRUAssetsProvider stopSymbol](MRUAssetsProvider, "stopSymbol");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("stop");
        v14 = v8;
LABEL_8:

        v15 = v14;
        v11 = (void *)v12;
        v6 = v15;
        goto LABEL_10;
      }
    }
    else
    {
      v29 = 0;
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
    }
  }
  if (v7)
  {
    +[MRUAssetsProvider pauseSymbol](MRUAssetsProvider, "pauseSymbol");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("pause");
    v14 = v7;
    goto LABEL_8;
  }
  v13 = CFSTR("play");
LABEL_10:
  +[MRUAssetsProvider playPauseStopPackageName](MRUAssetsProvider, "playPauseStopPackageName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUCAPackageAsset packageNamed:glyphState:](MRUCAPackageAsset, "packageNamed:glyphState:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRUAsset packageAsset:symbolName:image:](MRUAsset, "packageAsset:symbolName:image:", v17, v11, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", v13);
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__MRUTransportControls_centerItemFromResponse___block_invoke;
    aBlock[3] = &unk_1E5819160;
    v23 = v6;
    v24 = v10;
    v25 = (__CFString *)v13;
    v19 = _Block_copy(aBlock);

  }
  else
  {
    v19 = 0;
  }
  v20 = -[MRUTransportControlItem initWithIdentifier:asset:mainAction:]([MRUTransportControlItem alloc], "initWithIdentifier:asset:mainAction:", v13, v18, v19);

  return v20;
}

void __47__MRUTransportControls_centerItemFromResponse___block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D4B358];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__MRUTransportControls_centerItemFromResponse___block_invoke_2;
  v4[3] = &unk_1E5819A50;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  objc_msgSend(v2, "performRequest:options:completion:", v3, 0x10000, v4);

}

void __47__MRUTransportControls_centerItemFromResponse___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

- (id)rightItemFromResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  MRUTransportControlItem *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  __CFString *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD aBlock[4];
  id v58;
  id v59;
  id v60;

  objc_msgSend(a3, "tracklist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeItemCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUAssetsProvider forwardBackwardPackageName](MRUAssetsProvider, "forwardBackwardPackageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUCAPackageAsset packageNamed:glyphState:](MRUCAPackageAsset, "packageNamed:glyphState:", v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();

  +[MRUAssetsProvider forwardSymbol](MRUAssetsProvider, "forwardSymbol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUAsset packageAsset:symbolName:image:](MRUAsset, "packageAsset:symbolName:image:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("forward"));
  objc_msgSend(v4, "seekCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredForwardJumpIntervals");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v46 = v4;
  v47 = v3;
  v45 = (void *)v9;
  if (v14)
  {
    objc_msgSend(v4, "seekCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredForwardJumpIntervals");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    objc_msgSend(CFSTR("forward"), "stringByAppendingFormat:", CFSTR(".jump: %f"), *(_QWORD *)&v19);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seekCommand");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "jumpByInterval:", v19);
    v22 = objc_claimAutoreleasedReturnValue();

    +[MRUAssetsProvider goForwardSymbolForTimeInterval:](MRUAssetsProvider, "goForwardSymbolForTimeInterval:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUAsset symbolNamed:](MRUAsset, "symbolNamed:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v26 = 0;
    v6 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = (void *)v22;
    v11 = (void *)v24;
    v31 = v48;
    if (!v22)
      goto LABEL_10;
  }
  else
  {
    if (!v6)
    {
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v20 = CFSTR("forward");
      v31 = v48;
      goto LABEL_10;
    }
    v32 = v6;
    objc_msgSend(v4, "seekCommand");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "beginSeekWithDirection:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "seekCommand");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "endSeek");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
    v25 = 0;
    if (v34 && v36)
    {
      objc_msgSend(CFSTR("forward"), "stringByAppendingString:", CFSTR(".seek.began"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke;
      aBlock[3] = &unk_1E5819160;
      v58 = v34;
      v39 = v48;
      v59 = v39;
      v60 = v37;
      v40 = v37;
      v25 = _Block_copy(aBlock);
      objc_msgSend(CFSTR("forward"), "stringByAppendingString:", CFSTR(".seek.end"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v38;
      v53[1] = 3221225472;
      v53[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_41;
      v53[3] = &unk_1E5819160;
      v54 = v36;
      v55 = v39;
      v56 = v41;
      v42 = v41;
      v26 = _Block_copy(v53);

    }
    v20 = CFSTR("forward");
    v31 = v48;
    v30 = v32;
  }
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_43;
  v49[3] = &unk_1E5819160;
  v6 = v30;
  v50 = v6;
  v51 = v31;
  v20 = v20;
  v52 = v20;
  v29 = _Block_copy(v49);

  v27 = v25;
  v28 = v26;
LABEL_10:
  v43 = -[MRUTransportControlItem initWithIdentifier:asset:mainAction:holdBeganAction:holdEndAction:]([MRUTransportControlItem alloc], "initWithIdentifier:asset:mainAction:holdBeganAction:holdEndAction:", v20, v11, v29, v27, v28);

  return v43;
}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D4B358];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_2;
  v4[3] = &unk_1E5819A50;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  objc_msgSend(v2, "performRequest:completion:", v3, v4);

}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_41(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D4B358];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_2_42;
  v4[3] = &unk_1E5819A50;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  objc_msgSend(v2, "performRequest:completion:", v3, v4);

}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_2_42(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_43(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D4B358];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_2_44;
  v4[3] = &unk_1E5819A50;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[4];
  objc_msgSend(v2, "performRequest:options:completion:", v3, 0x10000, v4);

}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_2_44(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }

}

- (MRUTransportControlItem)leadingItem
{
  return self->_leadingItem;
}

- (MRUTransportControlItem)leftItem
{
  return self->_leftItem;
}

- (MRUTransportControlItem)centerItem
{
  return self->_centerItem;
}

- (MRUTransportControlItem)rightItem
{
  return self->_rightItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightItem, 0);
  objc_storeStrong((id *)&self->_centerItem, 0);
  objc_storeStrong((id *)&self->_leftItem, 0);
  objc_storeStrong((id *)&self->_leadingItem, 0);
}

@end
