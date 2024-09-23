@implementation HUCameraEventRecordingCell

- (HUCameraEventRecordingCell)initWithFrame:(CGRect)a3
{
  HUCameraEventRecordingCell *v3;
  HUCameraEventRecordingCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUCameraEventRecordingCell;
  v3 = -[HUCameraEventRecordingCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUCameraEventRecordingCell posterFramesContainerView](v3, "posterFramesContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventRecordingCell addSubview:](v4, "addSubview:", v5);

    -[HUCameraEventRecordingCell dayBoundaryView](v4, "dayBoundaryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventRecordingCell addSubview:](v4, "addSubview:", v6);

    -[HUCameraEventRecordingCell layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 8.0);

    -[HUCameraEventRecordingCell setOpaque:](v4, "setOpaque:", 0);
    -[HUCameraEventRecordingCell familiarFacesView](v4, "familiarFacesView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventRecordingCell addSubview:](v4, "addSubview:", v8);

    if (objc_msgSend(MEMORY[0x1E0D31288], "markCachedVideoAsGreenInTimeline"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_videoCacheDidAddVideo_, *MEMORY[0x1E0D30508], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", v4, sel_videoCacheDidRemoveVideo_, *MEMORY[0x1E0D30510], 0);

    }
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (objc_msgSend(MEMORY[0x1E0D31288], "markCachedVideoAsGreenInTimeline"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)HUCameraEventRecordingCell;
  -[HUCameraEventRecordingCell dealloc](&v4, sel_dealloc);
}

- (void)videoCacheDidAddVideo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HUCameraEventRecordingCell_videoCacheDidAddVideo___block_invoke;
    block[3] = &unk_1E6F4D988;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __52__HUCameraEventRecordingCell_videoCacheDidAddVideo___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "debugMarkerLayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 0);

}

- (void)videoCacheDidRemoveVideo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HUCameraEventRecordingCell_videoCacheDidRemoveVideo___block_invoke;
    block[3] = &unk_1E6F4D988;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __55__HUCameraEventRecordingCell_videoCacheDidRemoveVideo___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "debugMarkerLayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (HURecordingEventCellFamiliarFacesView)familiarFacesView
{
  HURecordingEventCellFamiliarFacesView *familiarFacesView;
  HURecordingEventCellFamiliarFacesView *v4;
  HURecordingEventCellFamiliarFacesView *v5;
  void *v6;
  double v7;

  familiarFacesView = self->_familiarFacesView;
  if (!familiarFacesView)
  {
    v4 = -[HURecordingEventCellFamiliarFacesView initWithFrame:]([HURecordingEventCellFamiliarFacesView alloc], "initWithFrame:", -38.0, -40.0, 118.0, 40.0);
    v5 = self->_familiarFacesView;
    self->_familiarFacesView = v4;

    -[HURecordingEventCellFamiliarFacesView layer](self->_familiarFacesView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 0;
    objc_msgSend(v6, "setOpacity:", v7);

    familiarFacesView = self->_familiarFacesView;
  }
  return familiarFacesView;
}

- (void)updateBadgeLayerWithEvents:(id)a3 inRect:(CGRect)a4
{
  double height;
  CGFloat width;
  CGFloat y;
  double x;
  id v9;
  void *v10;
  double v11;
  long double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  CGFloat *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, __n128);
  void *v37;
  id v38;
  id v39;
  HUCameraEventRecordingCell *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  long double v46;
  BOOL v47;
  uint64_t v48;
  CGFloat *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  double v53;
  long double v54;
  uint64_t v55;
  _QWORD v56[3];
  char v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[3];
  int v61;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[HUCameraEventRecordingCell timeController](self, "timeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterFrameWidth");
  v12 = v11;

  -[HUCameraEventRecordingCell timeController](self, "timeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeScale");
  v15 = v14;

  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  if (fmod(width, v12) < 18.0)
    v16 = (int)(width / v12);
  else
    v16 = (int)(width / v12) + 1;
  v61 = v16;
  v17 = v16 == 1;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__10;
  v58[4] = __Block_byref_object_dispose__10;
  -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dateOfOccurrence");
  v59 = (id)objc_claimAutoreleasedReturnValue();

  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v57 = 1;
  v48 = 0;
  v49 = (CGFloat *)&v48;
  v50 = 0x4010000000;
  v51 = &unk_1B94F0049;
  v52 = 0;
  v53 = height * 0.5 + -9.0;
  v54 = v12;
  v55 = 0x4040800000000000;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", width, height);
  v34 = MEMORY[0x1E0C809B0];
  v35 = 3221225472;
  v36 = __64__HUCameraEventRecordingCell_updateBadgeLayerWithEvents_inRect___block_invoke;
  v37 = &unk_1E6F52BA0;
  v41 = v60;
  v21 = v9;
  v47 = v17;
  v38 = v21;
  v42 = v58;
  v45 = v15;
  v22 = v19;
  v39 = v22;
  v40 = self;
  v43 = v56;
  v44 = &v48;
  v46 = v12;
  objc_msgSend(v20, "imageWithActions:", &v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v49;
  v49[6] = width;
  v24[7] = height;
  v24[4] = x + -9.0;
  v24[5] = y;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", v34, v35, v36, v37);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  v25 = v49[4];
  v26 = v49[5];
  v27 = v49[6];
  v28 = v49[7];
  -[HUCameraEventRecordingCell badgeLayer](self, "badgeLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v25, v26, v27, v28);

  v30 = objc_retainAutorelease(v23);
  v31 = objc_msgSend(v30, "CGImage");
  -[HUCameraEventRecordingCell badgeLayer](self, "badgeLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setContents:", v31);

  -[HUCameraEventRecordingCell badgeLayer](self, "badgeLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHidden:", 0);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(v60, 8);
}

void __64__HUCameraEventRecordingCell_updateBadgeLayerWithEvents_inRect___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __n128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= 1)
  {
    v3 = MEMORY[0x1E0C809B0];
    a2.n128_u64[0] = 138412802;
    v19 = a2;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set", *(_OWORD *)&v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 32);
      v20[0] = v3;
      v20[1] = 3221225472;
      v20[2] = __64__HUCameraEventRecordingCell_updateBadgeLayerWithEvents_inRect___block_invoke_2;
      v20[3] = &unk_1E6F52B78;
      v25 = *(_BYTE *)(a1 + 104);
      v6 = v4;
      v7 = *(_QWORD *)(a1 + 64);
      v21 = v6;
      v23 = v7;
      v24 = *(_QWORD *)(a1 + 88);
      v22 = *(id *)(a1 + 40);
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v20);
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        objc_msgSend(*(id *)(a1 + 48), "recordingEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v19.n128_u32[0];
        v27 = v6;
        v28 = 1024;
        v29 = v9;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Rendering image for reasons:%@ badge count %d for clip:%@", buf, 0x1Cu);

      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) || objc_msgSend(v6, "count"))
      {
        objc_msgSend(*(id *)(a1 + 48), "_badgeImageForSignificantEventReasons:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "size");
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        *(_QWORD *)(v13 + 48) = v14;
        *(_QWORD *)(v13 + 56) = v15;
        objc_msgSend(v12, "drawInRect:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 56));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;

      }
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = *(double *)(a1 + 96)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                              + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "dateByAddingTimeInterval:", *(double *)(a1 + 88));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    while (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 0);
  }
}

void __64__HUCameraEventRecordingCell_updateBadgeLayerWithEvents_inRect___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a2;
  v17 = v6;
  if (*(_BYTE *)(a1 + 64))
  {
    if (objc_msgSend(v6, "confidenceLevel") != 100)
      goto LABEL_12;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "reason"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(v6, "dateOfOccurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v12 = v11;

  if (v12 >= 0.0 && v12 <= *(double *)(a1 + 56) && objc_msgSend(v17, "confidenceLevel") == 100)
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v17, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v13, "containsObject:", v14);

    if ((v13 & 1) == 0)
    {
      v15 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "reason"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      v7 = *(void **)(a1 + 40);
      objc_msgSend(v17, "uniqueIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v9 = (void *)v8;
      objc_msgSend(v7, "addObject:", v8);

    }
  }
  else if (v12 > *(double *)(a1 + 56))
  {
    *a4 = 1;
  }
LABEL_12:
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 4)
    *a4 = 1;

}

- (void)_updateBadgeLayerWithImage:(id)a3 inRect:(CGRect)a4
{
  double height;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  height = a4.size.height;
  x = a4.origin.x;
  v7 = a3;
  objc_msgSend(v7, "size");
  v9 = v8;
  objc_msgSend(v7, "size");
  v11 = v10;
  -[HUCameraEventRecordingCell badgeLayer](self, "badgeLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", x + -9.0, height * 0.5 + -9.0, v9, v11);

  v13 = objc_retainAutorelease(v7);
  v14 = objc_msgSend(v13, "CGImage");

  -[HUCameraEventRecordingCell badgeLayer](self, "badgeLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContents:", v14);

  -[HUCameraEventRecordingCell badgeLayer](self, "badgeLayer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 0);

}

- (id)_badgeImageForSignificantEventReasons:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(CFSTR("CameraEventMarker"), "mutableCopy");
  if ((objc_msgSend(v3, "containsObject:", &unk_1E7040BD0) & 1) != 0)
  {
    v5 = CFSTR("_InsufficientAnalysis");
LABEL_11:
    objc_msgSend(v4, "appendString:", v5);
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "containsObject:", &unk_1E7040BE8))
    objc_msgSend(v4, "appendString:", CFSTR("_Person"));
  if (objc_msgSend(v3, "containsObject:", &unk_1E7040C00))
    objc_msgSend(v4, "appendString:", CFSTR("_Animal"));
  if (objc_msgSend(v3, "containsObject:", &unk_1E7040C18))
    objc_msgSend(v4, "appendString:", CFSTR("_Vehicle"));
  if (objc_msgSend(v3, "containsObject:", &unk_1E7040C30))
  {
    v5 = CFSTR("_Package");
    goto LABEL_11;
  }
LABEL_12:
  HUImageNamed(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.22);
}

- (void)updateWithCameraClipEvent:(id)a3 mode:(unint64_t)a4 portraitMode:(BOOL)a5 timeController:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[HUCameraEventRecordingCell setDisplayMode:](self, "setDisplayMode:", a4);
  -[HUCameraEventRecordingCell setRecordingEvent:](self, "setRecordingEvent:", v11);

  -[HUCameraEventRecordingCell setPortraitMode:](self, "setPortraitMode:", v6);
  -[HUCameraEventRecordingCell setTimeController:](self, "setTimeController:", v10);

  -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hf_isPlayable"))
    objc_msgSend((id)objc_opt_class(), "backgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraEventRecordingCell posterFramesContainerView](self, "posterFramesContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  -[HUCameraEventRecordingCell addPosterFrameViews](self, "addPosterFrameViews");
  -[HUCameraEventRecordingCell addDayBoundaryIfNeeded](self, "addDayBoundaryIfNeeded");
  -[HUCameraEventRecordingCell drawEventMarkers](self, "drawEventMarkers");
  -[HUCameraEventRecordingCell updateFamiliarFaces](self, "updateFamiliarFaces");
  -[HUCameraEventRecordingCell addDebugMarker](self, "addDebugMarker");
}

- (unint64_t)numberOfFramesNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[HUCameraEventRecordingCell timeController](self, "timeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterFrameWidth");
  v5 = v4;

  -[HUCameraEventRecordingCell frame](self, "frame");
  return (int)vcvtpd_s64_f64(v6 / v5);
}

- (void)addPosterFrameViews
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  -[HUCameraEventRecordingCell timeController](self, "timeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterFrameWidth");
  v5 = v4;

  v6 = -[HUCameraEventRecordingCell numberOfFramesNeeded](self, "numberOfFramesNeeded");
  if (v6)
  {
    v7 = v6;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      +[HUPosterFrameViewCache dequeuePosterFrameViewForWidth:](HUPosterFrameViewCache, "dequeuePosterFrameViewForWidth:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFrame:", v9, 0.0, v5, 33.0);
      -[HUCameraEventRecordingCell posterFramesContainerView](self, "posterFramesContainerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v10);

      -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayImageForClip:atTimeOffset:", v12, v8);

      objc_msgSend(v10, "setShouldShowLineSeparator:", --v7 != 0);
      v9 = v5 + v9;
      -[HUCameraEventRecordingCell timeController](self, "timeController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeScale");
      v8 = v8 + v14;

    }
    while (v7);
  }
}

- (void)addDayBoundaryIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = (void *)MEMORY[0x1E0D31288];
  -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "percentageOfDurationUntilNextDayForEvent:", v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18
    || (-[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "dateOfOccurrence"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hf_isMidnight"),
        v6,
        v5,
        v7))
  {
    -[HUCameraEventRecordingCell bounds](self, "bounds");
    v9 = v8;
    objc_msgSend(v18, "floatValue");
    v11 = v9 * v10;
    -[HUCameraEventRecordingCell bounds](self, "bounds");
    v13 = v12 + -14.0;
    -[HUCameraEventRecordingCell dayBoundaryView](self, "dayBoundaryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v11, 7.0, 1.0, v13);

    -[HUCameraEventRecordingCell dayBoundaryView](self, "dayBoundaryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 0;
  }
  else
  {
    -[HUCameraEventRecordingCell dayBoundaryView](self, "dayBoundaryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1;
  }
  objc_msgSend(v15, "setHidden:", v17);

}

- (void)displayReachabilityErrorUI
{
  id v3;

  HUImageNamed(CFSTR("CameraEventMarkerCameraOffline"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCameraEventRecordingCell bounds](self, "bounds");
  -[HUCameraEventRecordingCell _updateBadgeLayerWithImage:inRect:](self, "_updateBadgeLayerWithImage:inRect:", v3);

}

- (void)drawEventMarkers
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_sortedSignificantEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventRecordingCell bounds](self, "bounds");
    -[HUCameraEventRecordingCell updateBadgeLayerWithEvents:inRect:](self, "updateBadgeLayerWithEvents:inRect:", v4);

  }
  else
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Attempting to display a cell without a recording event.", buf, 2u);
    }

    -[HUCameraEventRecordingCell displayReachabilityErrorUI](self, "displayReachabilityErrorUI");
  }
}

- (void)addDebugMarker
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CALayer *v8;
  CALayer *debugMarkerLayer;
  id v10;
  void *v11;
  id v12;

  if (objc_msgSend(MEMORY[0x1E0D31288], "markCachedVideoAsGreenInTimeline"))
  {
    -[HUCameraEventRecordingCell posterFramesContainerView](self, "posterFramesContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    debugMarkerLayer = self->_debugMarkerLayer;
    self->_debugMarkerLayer = v8;

    -[CALayer setFrame:](self->_debugMarkerLayer, "setFrame:", v5, 0.0, v7, 4.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_debugMarkerLayer, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

    -[CALayer setHidden:](self->_debugMarkerLayer, "setHidden:", 1);
    -[HUCameraEventRecordingCell posterFramesContainerView](self, "posterFramesContainerView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", self->_debugMarkerLayer);

  }
}

- (void)updateFamiliarFaces
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allEventsContainingPeopleInClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_sortedSignificantEvents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v4;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, "PersonEvents:%@ for clip:%@, with events:%@", (uint8_t *)&v12, 0x20u);

  }
  v6 = objc_msgSend(v4, "count");
  if (v6)
  {
    -[HUCameraEventRecordingCell familiarFacesView](self, "familiarFacesView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateWithPersonEvents:forCameraClip:", v4, v8);

  }
  -[HUCameraEventRecordingCell setHasFamiliarFaces:](self, "setHasFamiliarFaces:", v6 != 0);

}

- (void)showFamiliarFacesWithMaxWidth:(double)a3
{
  _BOOL4 v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v5 = -[HUCameraEventRecordingCell hasFamiliarFaces](self, "hasFamiliarFaces");
  -[HUCameraEventRecordingCell familiarFacesView](self, "familiarFacesView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v5)
  {
    LODWORD(v7) = 1.0;
    objc_msgSend(v6, "setOpacity:", v7);

    -[HUCameraEventRecordingCell familiarFacesView](self, "familiarFacesView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resizeWithMaxWidth:", a3);
  }
  else
  {
    LODWORD(v7) = 0;
    objc_msgSend(v6, "setOpacity:", v7);

  }
}

- (void)hideFamiliarFaces
{
  void *v2;
  double v3;
  id v4;

  -[HUCameraEventRecordingCell familiarFacesView](self, "familiarFacesView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setOpacity:", v3);

}

- (void)preparePosterFrameViewsForReuse
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUCameraEventRecordingCell posterFramesContainerView](self, "posterFramesContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_83);

  -[HUCameraEventRecordingCell posterFramesContainerView](self, "posterFramesContainerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperview);

}

uint64_t __61__HUCameraEventRecordingCell_preparePosterFrameViewsForReuse__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HUPosterFrameViewCache enqueuePosterFrameView:](HUPosterFrameViewCache, "enqueuePosterFrameView:", a2);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCameraEventRecordingCell;
  -[HUCameraEventRecordingCell prepareForReuse](&v7, sel_prepareForReuse);
  -[HUCameraEventRecordingCell preparePosterFrameViewsForReuse](self, "preparePosterFrameViewsForReuse");
  -[HUCameraEventRecordingCell familiarFacesView](self, "familiarFacesView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setOpacity:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[HUCameraEventRecordingCell badgeLayer](self, "badgeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContents:", 0);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)updateVideoCacheMarker
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (objc_msgSend(MEMORY[0x1E0D31288], "markCachedVideoAsGreenInTimeline"))
  {
    v3 = (void *)MEMORY[0x1E0D31288];
    -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoDestinationURLForCameraClip:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0) ^ 1;
    -[HUCameraEventRecordingCell debugMarkerLayer](self, "debugMarkerLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

  }
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateOfOccurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Recording Event UUID:%@ Date:%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUCameraEventRecordingCell recordingEvent](self, "recordingEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hu_accessibilityStringForSignificantEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (CALayer)badgeLayer
{
  CALayer *badgeLayer;
  CALayer *v4;
  id v5;
  void *v6;
  CALayer *v7;

  badgeLayer = self->_badgeLayer;
  if (!badgeLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

    -[CALayer setCornerRadius:](v4, "setCornerRadius:", 9.0);
    -[CALayer setOpaque:](v4, "setOpaque:", 0);
    -[HUCameraEventRecordingCell layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v4);

    v7 = self->_badgeLayer;
    self->_badgeLayer = v4;

    badgeLayer = self->_badgeLayer;
  }
  return badgeLayer;
}

- (UIView)posterFramesContainerView
{
  UIView *posterFramesContainerView;
  double v4;
  double v5;
  UIView *v6;
  void *v7;
  void *v8;
  UIView *v9;

  posterFramesContainerView = self->_posterFramesContainerView;
  if (!posterFramesContainerView)
  {
    -[HUCameraEventRecordingCell bounds](self, "bounds");
    v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, 7.0, v5, 33.0);
    -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    objc_msgSend((id)objc_opt_class(), "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIView setClipsToBounds:](v6, "setClipsToBounds:", 1);
    -[UIView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 8.0);

    v9 = self->_posterFramesContainerView;
    self->_posterFramesContainerView = v6;

    posterFramesContainerView = self->_posterFramesContainerView;
  }
  return posterFramesContainerView;
}

- (UIView)dayBoundaryView
{
  UIView *dayBoundaryView;
  id v4;
  UIView *v5;
  void *v6;
  void *v7;
  UIView *v8;

  dayBoundaryView = self->_dayBoundaryView;
  if (!dayBoundaryView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HUCameraEventRecordingCell bounds](self, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 2.0);

    v8 = self->_dayBoundaryView;
    self->_dayBoundaryView = v5;

    dayBoundaryView = self->_dayBoundaryView;
  }
  return dayBoundaryView;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (HMCameraClip)recordingEvent
{
  return (HMCameraClip *)objc_loadWeakRetained((id *)&self->_recordingEvent);
}

- (void)setRecordingEvent:(id)a3
{
  objc_storeWeak((id *)&self->_recordingEvent, a3);
}

- (void)setBadgeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_badgeLayer, a3);
}

- (void)setPosterFramesContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_posterFramesContainerView, a3);
}

- (void)setDayBoundaryView:(id)a3
{
  objc_storeStrong((id *)&self->_dayBoundaryView, a3);
}

- (BOOL)portraitMode
{
  return self->_portraitMode;
}

- (void)setPortraitMode:(BOOL)a3
{
  self->_portraitMode = a3;
}

- (HUClipScrubberTimeController)timeController
{
  return (HUClipScrubberTimeController *)objc_loadWeakRetained((id *)&self->_timeController);
}

- (void)setTimeController:(id)a3
{
  objc_storeWeak((id *)&self->_timeController, a3);
}

- (void)setFamiliarFacesView:(id)a3
{
  objc_storeStrong((id *)&self->_familiarFacesView, a3);
}

- (BOOL)hasFamiliarFaces
{
  return self->_hasFamiliarFaces;
}

- (void)setHasFamiliarFaces:(BOOL)a3
{
  self->_hasFamiliarFaces = a3;
}

- (CALayer)debugMarkerLayer
{
  return self->_debugMarkerLayer;
}

- (void)setDebugMarkerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_debugMarkerLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugMarkerLayer, 0);
  objc_storeStrong((id *)&self->_familiarFacesView, 0);
  objc_destroyWeak((id *)&self->_timeController);
  objc_storeStrong((id *)&self->_dayBoundaryView, 0);
  objc_storeStrong((id *)&self->_posterFramesContainerView, 0);
  objc_storeStrong((id *)&self->_badgeLayer, 0);
  objc_destroyWeak((id *)&self->_recordingEvent);
}

@end
