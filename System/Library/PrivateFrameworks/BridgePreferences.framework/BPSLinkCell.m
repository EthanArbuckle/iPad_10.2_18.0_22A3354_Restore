@implementation BPSLinkCell

void __26__BPSLinkCell_getLazyIcon__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = WeakRetained;
  if (v2)
  {
    objc_msgSend(WeakRetained, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("squareIconName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "getLazyIconID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
      v8 = v5;
    else
      v8 = (void *)v6;
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v8))
      objc_msgSend(WeakRetained, "setIcon:", *(_QWORD *)(a1 + 40));

    v3 = WeakRetained;
  }

}

- (id)getLazyIcon
{
  os_unfair_lock_s *p_lazyIconPropertiesLock;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  double v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  dispatch_semaphore_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t *v57;
  id v58;
  NSObject *v59;
  uint64_t *v60;
  id v61;
  id v63;
  void *v64;
  _QWORD v65[4];
  NSObject *v66;
  uint64_t *v67;
  _QWORD block[4];
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 location;
  void *v83;
  void *v84;
  uint64_t *v85;
  id v86;
  uint64_t v87;
  CGSize v88;
  CGRect v89;

  v87 = *MEMORY[0x24BDAC8D0];
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__0;
  v76 = __Block_byref_object_dispose__0;
  v77 = 0;
  p_lazyIconPropertiesLock = &self->_lazyIconPropertiesLock;
  os_unfair_lock_lock(&self->_lazyIconPropertiesLock);
  -[BPSLazyLoadingIconProperties squareIconName](self->_lazyIconLoadingProperties, "squareIconName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSLazyLoadingIconProperties lazyIconID](self->_lazyIconLoadingProperties, "lazyIconID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BPSLazyLoadingIconProperties flipsForRTL](self->_lazyIconLoadingProperties, "flipsForRTL");
  -[BPSLazyLoadingIconProperties identifier](self->_lazyIconLoadingProperties, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSLazyLoadingIconProperties bundlePath](self->_lazyIconLoadingProperties, "bundlePath");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lazyIconPropertiesLock);
  if (v4)
    v8 = v4;
  else
    v8 = v5;
  v9 = v8;
  +[BPSLinkCell scale](BPSLinkCell, "scale");
  v10 = CFSTR("@2x");
  if (v11 > 2.0)
    v10 = CFSTR("@3x");
  v12 = v10;
  if (v9)
  {
    +[BPSLinkCell _iconCache](BPSLinkCell, "_iconCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v73[5];
    v73[5] = v14;

    v16 = (void *)v73[5];
    if (v16)
    {
LABEL_49:
      v27 = v16;
      goto LABEL_50;
    }
    v17 = (void *)MEMORY[0x24BDF6AC8];
    _CachePathForIcon(v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithContentsOfCPBitmapFile:flags:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (v6)
      {
        objc_msgSend(v19, "imageFlippedForRightToLeftLayoutDirection");
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v20;
      }
      objc_initWeak((id *)&location, self);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __26__BPSLinkCell_getLazyIcon__block_invoke;
      block[3] = &unk_24CBE5028;
      objc_copyWeak(&v71, (id *)&location);
      v69 = v9;
      v63 = v19;
      v70 = v63;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v71);
      objc_destroyWeak((id *)&location);
      if (v4)
      {
LABEL_12:
        v21 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringByAppendingString:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pathForResource:ofType:", v23, CFSTR(".png"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "imageWithContentsOfFile:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          if (!v6)
            goto LABEL_23;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", v4);
          v25 = objc_claimAutoreleasedReturnValue();
          if (!v6)
          {
LABEL_23:
            BPSCreateRoundedGizmoAppIconForSquareImage(v25);
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = v73[5];
            v73[5] = v36;
            goto LABEL_30;
          }
        }
        -[NSObject imageFlippedForRightToLeftLayoutDirection](v25, "imageFlippedForRightToLeftLayoutDirection");
        v35 = objc_claimAutoreleasedReturnValue();

        v25 = v35;
        goto LABEL_23;
      }
    }
    else
    {
      v63 = 0;
      if (v4)
        goto LABEL_12;
    }
    if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "launchedToTest"))
    {
      v88.width = 29.0;
      v88.height = 29.0;
      UIGraphicsBeginImageContextWithOptions(v88, 0, 0.0);
      v28 = (void *)MEMORY[0x24BDF6950];
      v29 = rand();
      v30 = rand();
      objc_msgSend(v28, "colorWithRed:green:blue:alpha:", (double)(v29 % 255) / 255.0, (double)(v30 % 255) / 255.0, (double)(rand() % 255) / 255.0, 1.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFill");

      v89.origin.x = 0.0;
      v89.origin.y = 0.0;
      v89.size.width = 29.0;
      v89.size.height = 29.0;
      UIRectFill(v89);
      UIGraphicsGetImageFromCurrentImageContext();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      BPSCreateRoundedGizmoAppIconForSquareImage(v32);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v73[5];
      v73[5] = v33;

      UIGraphicsEndImageContext();
      goto LABEL_31;
    }
    v38 = dispatch_semaphore_create(0);
    v78 = 0;
    v79 = &v78;
    v80 = 0x2050000000;
    v39 = (void *)getNanoResourceGrabberClass_softClass;
    v81 = getNanoResourceGrabberClass_softClass;
    if (!getNanoResourceGrabberClass_softClass)
    {
      *(_QWORD *)&location = MEMORY[0x24BDAC760];
      *((_QWORD *)&location + 1) = 3221225472;
      v83 = __getNanoResourceGrabberClass_block_invoke;
      v84 = &unk_24CBE4A00;
      v85 = &v78;
      __getNanoResourceGrabberClass_block_invoke((uint64_t)&location);
      v39 = (void *)v79[3];
    }
    v40 = objc_retainAutorelease(v39);
    _Block_object_dispose(&v78, 8);
    objc_msgSend(v40, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "traitCollection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "displayScale");
    if (v44 <= 2.0)
      v45 = 47;
    else
      v45 = 48;
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __26__BPSLinkCell_getLazyIcon__block_invoke_2;
    v65[3] = &unk_24CBE5050;
    v67 = &v72;
    v25 = v38;
    v66 = v25;
    objc_msgSend(v41, "getIconForBundleID:iconVariant:block:timeout:", v5, v45, v65, 60.0);

    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    v37 = v66;
LABEL_30:

LABEL_31:
    if (v73[5])
      goto LABEL_37;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("VICTORY_ROW_ID")))
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("VictoryIcon"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      BPSCreateRoundedGizmoAppIconForSquareImage(v46);
      v47 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("VICTORY_TRAINING_CLUB_ROW_ID")))
        goto LABEL_37;
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("NTCIcon"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      BPSCreateRoundedGizmoAppIconForSquareImage(v46);
      v47 = objc_claimAutoreleasedReturnValue();
    }
    v48 = (void *)v73[5];
    v73[5] = v47;

LABEL_37:
    if (v73[5])
      goto LABEL_45;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v64);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(CFSTR("BridgeSettingsIcon"), "stringByAppendingString:", v12);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "pathForResource:ofType:", v50, CFSTR(".png"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithContentsOfFile:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v52;
        if (v52)
        {
          BPSCreateRoundedGizmoAppIconForSquareImage(v52);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = (void *)v73[5];
          v73[5] = v54;

        }
      }

    }
    if (v73[5])
    {
LABEL_45:
      +[BPSLinkCell _iconCache](BPSLinkCell, "_iconCache");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setObject:forKey:", v73[5], v9);

      v57 = (uint64_t *)(id)v73[5];
      v58 = v9;
      if (_WriteMMappedImage_onceToken != -1)
        dispatch_once(&_WriteMMappedImage_onceToken, &__block_literal_global_106);
      dispatch_get_global_queue(-2, 0);
      v59 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&location = MEMORY[0x24BDAC760];
      *((_QWORD *)&location + 1) = 3221225472;
      v83 = ___WriteMMappedImage_block_invoke_108;
      v84 = &unk_24CBE4DA0;
      v85 = v57;
      v86 = v58;
      v60 = v57;
      v61 = v58;
      dispatch_async(v59, &location);

    }
    v16 = (void *)v73[5];
    goto LABEL_49;
  }
  bps_utility_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location) = 138412290;
    *(_QWORD *)((char *)&location + 4) = 0;
    _os_log_impl(&dword_21147E000, v26, OS_LOG_TYPE_DEFAULT, "missing icon identifier. Skipping : %@", (uint8_t *)&location, 0xCu);
  }

  v27 = 0;
LABEL_50:

  _Block_object_dispose(&v72, 8);
  return v27;
}

+ (id)_iconCache
{
  if (_iconCache_onceToken != -1)
    dispatch_once(&_iconCache_onceToken, &__block_literal_global_3);
  return (id)_iconCache___iconCache;
}

- (id)blankIcon
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  objc_super v16;

  v3 = (id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75780]);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "propertyForKey:", CFSTR("squareIconName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[BPSLinkCell getLazyIconID](self, "getLazyIconID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  +[BPSLinkCell _iconCache](BPSLinkCell, "_iconCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)BPSLinkCell;
    -[PSTableCell blankIcon](&v16, sel_blankIcon);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_loadWeakRetained(v3);
  objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BE75AD0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    objc_msgSend(v10, "imageFlippedForRightToLeftLayoutDirection");
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }

  return v10;
}

+ (double)scale
{
  if (scale_onceToken != -1)
    dispatch_once(&scale_onceToken, &__block_literal_global_66);
  return *(double *)&scale_scale;
}

uint64_t __25__BPSLinkCell__iconCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_iconCache___iconCache;
  _iconCache___iconCache = (uint64_t)v0;

  objc_msgSend((id)_iconCache___iconCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
  return objc_msgSend((id)_iconCache___iconCache, "setCountLimit:", 50);
}

void __20__BPSLinkCell_scale__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  scale_scale = v0;

}

- (BPSLinkCell)init
{
  BPSLinkCell *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BPSLinkCell;
  result = -[BPSLinkCell init](&v3, sel_init);
  if (result)
    result->_lazyIconPropertiesLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)setSpecifier:(id)a3
{
  id v4;
  BPSLazyLoadingIconProperties *v5;
  BPSLazyLoadingIconProperties *lazyIconLoadingProperties;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BPSLinkCell;
  -[PSTableCell setSpecifier:](&v12, sel_setSpecifier_, v4);
  os_unfair_lock_lock(&self->_lazyIconPropertiesLock);
  if (v4)
  {
    v5 = objc_alloc_init(BPSLazyLoadingIconProperties);
    lazyIconLoadingProperties = self->_lazyIconLoadingProperties;
    self->_lazyIconLoadingProperties = v5;

    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSLazyLoadingIconProperties setIdentifier:](self->_lazyIconLoadingProperties, "setIdentifier:", v7);

    objc_msgSend(v4, "propertyForKey:", CFSTR("squareIconName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSLazyLoadingIconProperties setSquareIconName:](self->_lazyIconLoadingProperties, "setSquareIconName:", v8);

    -[BPSLinkCell getLazyIconID](self, "getLazyIconID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSLazyLoadingIconProperties setLazyIconID:](self->_lazyIconLoadingProperties, "setLazyIconID:", v9);

    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AD0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSLazyLoadingIconProperties setFlipsForRTL:](self->_lazyIconLoadingProperties, "setFlipsForRTL:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75B68]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSLazyLoadingIconProperties setBundlePath:](self->_lazyIconLoadingProperties, "setBundlePath:", v11);
  }
  else
  {
    v11 = self->_lazyIconLoadingProperties;
    self->_lazyIconLoadingProperties = 0;
  }

  os_unfair_lock_unlock(&self->_lazyIconPropertiesLock);
}

- (id)getLazyIconID
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", *MEMORY[0x24BE75B70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __26__BPSLinkCell_getLazyIcon__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyIconLoadingProperties, 0);
}

@end
