@implementation CFXEffectMessagesStickerUtilities

+ (void)cacheAnimatedStickerPreviewsForOverlayTypeId:(id)a3 atStickerSize:(int64_t)a4 previewDuration:(double)a5 previewFrameRate:(unint64_t)a6 previewCompletedBlock:(id)a7
{
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  NSObject *v37;
  int64_t v38;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[5];
  _QWORD block[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  double v56;
  unint64_t v57;
  id v58;
  int64_t v59;
  uint64_t v60;
  _QWORD v61[4];
  _QWORD v62[3];
  _QWORD v63[5];

  v38 = a4;
  v63[3] = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v42 = a7;
  v46 = a1;
  objc_msgSend(a1, "animatedPreviewsDirectory");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__onceToken != -1)
    dispatch_once(&cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__onceToken, &__block_literal_global_37);
  v10 = objc_alloc(MEMORY[0x24BDBCF20]);
  v11 = *MEMORY[0x24BE79410];
  v63[0] = *MEMORY[0x24BE79408];
  v63[1] = v11;
  v63[2] = *MEMORY[0x24BE79418];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v10, "initWithArray:", v12);

  v13 = objc_alloc(MEMORY[0x24BDBCF20]);
  v14 = *MEMORY[0x24BE79330];
  v62[0] = *MEMORY[0x24BE79328];
  v62[1] = v14;
  v62[2] = *MEMORY[0x24BE79338];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v13, "initWithArray:", v15);

  JFXLog_pickerUI();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[CFXEffectMessagesStickerUtilities cacheAnimatedStickerPreviewsForOverlayTypeId:atStickerSize:previewDuration:previewFrameRate:previewCompletedBlock:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v61[3] = 0;
  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[CFXEffect effectIdentifiersForEffectType:](CFXEffect, "effectIdentifiersForEffectType:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");
  if (v25)
  {
    for (i = 0; i != v25; ++i)
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", i, v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[CFXEffect effectWithIdentifier:forEffectType:](CFXEffect, "effectWithIdentifier:forEffectType:", v27, v45);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "jtEffect");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0
        || (objc_msgSend(v28, "jtEffect"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = objc_msgSend(v31, "isEmoji"),
            v31,
            (v32 & 1) == 0))
      {
        objc_msgSend(v46, "animatedPreviewFileNameForOverlayID:", v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringByAppendingPathComponent:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "fileExistsAtPath:", v34);

        if ((v36 & 1) == 0)
        {
          dispatch_group_enter((dispatch_group_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup);
          v37 = cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_14;
          block[3] = &unk_24EE59F20;
          v56 = a5;
          v57 = a6;
          v49 = v43;
          v50 = v41;
          v51 = v27;
          v52 = v40;
          v58 = v46;
          v59 = v38;
          v53 = v34;
          v55 = v61;
          v54 = v42;
          v60 = i;
          dispatch_async(v37, block);

        }
      }

    }
  }
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_17;
  v47[3] = &unk_24EE59750;
  v47[4] = v61;
  dispatch_group_notify((dispatch_group_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup, MEMORY[0x24BDAC9B8], v47);

  _Block_object_dispose(v61, 8);
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  dispatch_group_t v4;
  void *v5;

  v0 = dispatch_semaphore_create(2);
  v1 = (void *)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore;
  cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore = (uint64_t)v0;

  v2 = dispatch_queue_create("EffectBrowser.animatedPreviewWritingQ", 0);
  v3 = (void *)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingQueue;
  cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingQueue = (uint64_t)v2;

  v4 = dispatch_group_create();
  v5 = (void *)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup;
  cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup = (uint64_t)v4;

}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CFXOverlayPickerAnimatedPreviewWriter *v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  uint64_t v19;
  double v20;
  double v21;

  v2 = cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore;
  v3 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v3);
  v4 = *(double *)(a1 + 88);
  v5 = (double)*(unint64_t *)(a1 + 96);
  if (*(__CFString **)(a1 + 32) == CFSTR("Shapes"))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      v4 = 0.8;
    }
    else if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79420]) & 1) != 0)
    {
      v5 = 22.0;
    }
    else if ((objc_msgSend(*(id *)(a1 + 56), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      v5 = 10.0;
    }
    else if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79348]) & 1) != 0)
    {
      v5 = 6.0;
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79318]))
    {
      v5 = 8.0;
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79330]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79320]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79338]) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79340]))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79358]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793A0]) & 1) != 0
    || (v7 = *MEMORY[0x24BE79368], (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79368]) & 1) != 0)
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793E0]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793A8]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79360]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79380]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793C8]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793C0]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793B8]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79378]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79398]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793D0]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79370]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79388]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793D8]) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793E8]) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", v7))
  {
    v5 = 8.0;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE793B0]) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *MEMORY[0x24BE79390]))
  {
    v5 = 6.0;
  }
  objc_msgSend((id)objc_opt_class(), "JFX_recommendedStickerPreviewSizeInPixelsForStickerSize:", *(_QWORD *)(a1 + 112));
  v9 = v8;
  v11 = v10;
  v12 = -[CFXOverlayPickerAnimatedPreviewWriter initWithOverlayEffectId:previewSizeInPixels:previewDuration:previewFrameRate:previewStartFrameIndex:]([CFXOverlayPickerAnimatedPreviewWriter alloc], "initWithOverlayEffectId:previewSizeInPixels:previewDuration:previewFrameRate:previewStartFrameIndex:", *(_QWORD *)(a1 + 48), (unint64_t)v5, v6, v8, v10, v4);
  if (v12)
  {
    v13 = *(_QWORD *)(a1 + 64);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2;
    v16[3] = &unk_24EE59EF8;
    v15 = *(_OWORD *)(a1 + 72);
    v14 = (id)v15;
    v18 = v15;
    v19 = *(_QWORD *)(a1 + 120);
    v17 = *(id *)(a1 + 64);
    v20 = v9;
    v21 = v11;
    -[CFXOverlayPickerAnimatedPreviewWriter writeAnimatedPreviewToPath:completion:](v12, "writeAnimatedPreviewToPath:completion:", v13, v16);

  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore);
    dispatch_group_leave((dispatch_group_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup);
  }

}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2(uint64_t a1, int a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  if (a2)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (*(_QWORD *)(a1 + 40))
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_3;
      v12[3] = &unk_24EE59ED0;
      v3 = *(id *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 56);
      v13 = v3;
      v14 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v12);

    }
    JFXLog_pickerUI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2_cold_1(a1, v5);
  }
  else
  {
    JFXLog_pickerUI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2_cold_2(a1, v5, v6, v7, v8, v9, v10, v11);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore);
  dispatch_group_leave((dispatch_group_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup);
}

uint64_t __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  JFXLog_pickerUI();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_17_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    objc_msgSend(MEMORY[0x24BE79010], "noteApplicationDidReceiveMemoryWarning");
}

+ (CGSize)JFX_recommendedStickerPreviewSizeInPixelsForStickerSize:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = dbl_226AB74E0[a3 == 1];
  if (a3 == 2)
    v3 = 618.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)animatedPreviewsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("animatedPreviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  }
  return v4;
}

+ (id)animatedPreviewFileNameForOverlayID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a3;
  objc_msgSend(v3, "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("CFXAnimatedPreviewV10"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("png"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)overlayIDFromAnimatedPreviewFileName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("EmojiCustomAnimatedPreview.png")))
  {
    v4 = (id)*MEMORY[0x24BE79350];
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "hasPrefix:", CFSTR("CFXAnimatedPreviewV10")))
    {
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("_"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count") == 3)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (int64_t)numberOfStickersForEffectTypeId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;

  v3 = a3;
  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CFXEffect effectIdentifiersForEffectType:](CFXEffect, "effectIdentifiersForEffectType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  JFXLog_pickerUI();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[CFXEffectMessagesStickerUtilities numberOfStickersForEffectTypeId:].cold.1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  v13 = objc_msgSend(v5, "count");
  return v13;
}

+ (id)stickerPropertiesForIndex:(int64_t)a3 forEffectTypeId:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CFXEffectMessagesStickerProperties *v19;
  void *v20;
  void *v21;
  void *v22;
  CFXEffectMessagesStickerProperties *v23;
  void *v25;

  v5 = a4;
  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  JFXLog_pickerUI();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[CFXEffectMessagesStickerUtilities stickerPropertiesForIndex:forEffectTypeId:].cold.1((uint64_t)v5, a3, v8);
  v25 = v5;

  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jtEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && (objc_msgSend(v9, "jtEffect"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEmoji"),
        v13,
        v14))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathForResource:ofType:", CFSTR("EmojiCustomAnimatedPreview.png"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CFXEffectMessagesStickerUtilities animatedPreviewsDirectory](CFXEffectMessagesStickerUtilities, "animatedPreviewsDirectory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXEffectMessagesStickerUtilities animatedPreviewFileNameForOverlayID:](CFXEffectMessagesStickerUtilities, "animatedPreviewFileNameForOverlayID:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [CFXEffectMessagesStickerProperties alloc];
  objc_msgSend(v9, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jtEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accessibilityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CFXEffectMessagesStickerProperties initWithEffectID:previewUrl:localizedDescription:](v19, "initWithEffectID:previewUrl:localizedDescription:", v20, v18, v22);

  return v23;
}

+ (void)cacheAnimatedStickerPreviewsForOverlayTypeId:(uint64_t)a3 atStickerSize:(uint64_t)a4 previewDuration:(uint64_t)a5 previewFrameRate:(uint64_t)a6 previewCompletedBlock:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "began writing animated previews for overlays", a5, a6, a7, a8, 0);
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  NSStringFromCGSize(*(CGSize *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_3_1(&dword_2269A9000, a2, v5, "wrote animated preview to %@ at size %@", (uint8_t *)&v6);

}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a2, a3, "failed to write animated preview to %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_17_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, a1, a3, "finished writing animated previews for overlays", a5, a6, a7, a8, 0);
}

+ (void)numberOfStickersForEffectTypeId:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a2, a3, "funcamStickerBrowser requested sticker count for effect type %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)stickerPropertiesForIndex:(NSObject *)a3 forEffectTypeId:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_3_1(&dword_2269A9000, a3, (uint64_t)a3, "funcamStickerBrowser requested sticker at %ld for effect type %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

@end
