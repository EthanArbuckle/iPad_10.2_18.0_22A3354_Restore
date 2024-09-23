@implementation CNAssetInfo

+ (void)checkIfCinematic:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = completionHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__CNAssetInfo_checkIfCinematic_completionHandler___block_invoke;
  v7[3] = &unk_25044F620;
  v8 = v5;
  v6 = v5;
  +[CNAssetInfo loadFromAsset:completionHandler:](CNAssetInfo, "loadFromAsset:completionHandler:", asset, v7);

}

uint64_t __50__CNAssetInfo_checkIfCinematic_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    v4 = a3 == 0;
  else
    v4 = 0;
  v5 = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v5);
}

+ (void)loadFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  AVAsset *v6;
  id v7;
  uint64_t v8;
  id v9;
  AVAsset *v10;
  _QWORD v11[4];
  AVAsset *v12;
  id v13;
  id v14;

  v6 = asset;
  v7 = completionHandler;
  v8 = *MEMORY[0x24BDB1D50];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke;
  v11[3] = &unk_25044F670;
  v12 = v6;
  v13 = v7;
  v14 = a1;
  v9 = v7;
  v10 = v6;
  -[AVAsset loadTracksWithMediaType:completionHandler:](v10, "loadTracksWithMediaType:completionHandler:", v8, v11);

}

void __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v16 = v4;
  v17 = a3;
  if (v17)
  {
    _CNLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_cold_2();

    _CNCinematicError(3, v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

  }
  else
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy_;
    v31[4] = __Block_byref_object_dispose_;
    v32 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v7 = dispatch_group_create();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16, v4);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v12, "isEnabled"))
          {
            dispatch_group_enter(v7);
            v13 = *(void **)(a1 + 48);
            v19[0] = MEMORY[0x24BDAC760];
            v19[1] = 3221225472;
            v19[2] = __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_2;
            v19[3] = &unk_25044F648;
            v21 = v31;
            v22 = &v27;
            v20 = v7;
            objc_msgSend(v13, "loadFromCinematicVideoTrack:completionHandler:", v12, v19);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v9);
    }

    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v28 + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      _CNLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_cold_1(v14);

      _CNCinematicError(3, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v31, 8);

  }
}

void __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  if (!a3)
  {
    objc_msgSend(v9, "cinematicDisparityTrack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEnabled") & 1) != 0)
    {
      objc_msgSend(v9, "cinematicMetadataTrack");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEnabled");

      if (v8)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    else
    {

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (void)loadFromCinematicVideoTrack:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke;
  v11[3] = &unk_25044F6C0;
  v12 = v6;
  v13 = v7;
  v14 = a1;
  v8 = (void *)*MEMORY[0x24BDB20F8];
  v9 = v7;
  v10 = v6;
  _CNLoadFirstAssociatedTrack(v10, v8, v11);

}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CNLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = MEMORY[0x24BDAC760];
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4;
    v20 = &unk_25044F698;
    v21 = v8;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v23 = v10;
    v24 = v11;
    v22 = v5;
    v12 = v21;
    v13 = &v17;
    objc_msgSend(v12, "asset", v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDB1D10];
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = ___CNLoadMetadataTrackForVideoTrack_block_invoke;
    v25[3] = &unk_25044F5F0;
    v26 = v12;
    v27 = v13;
    v16 = v12;
    objc_msgSend(v14, "loadTracksWithMediaType:completionHandler:", v15, v25);

  }
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void (*v14)(void);
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _CNLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4_cold_1();

    v16 = 3;
    v17 = v7;
    goto LABEL_12;
  }
  objc_msgSend(v5, "formatDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(CFSTR("mdta/"), "stringByAppendingString:", 0x2504502C8),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "containsObject:", v11),
        v11,
        v10,
        (v12 & 1) == 0))
  {
    _CNLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4_cold_2();

    v16 = 4;
    v17 = 0;
LABEL_12:
    _CNCinematicError(v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_13;
  }
  v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "_initWithVideoTrack:disparityTrack:metadataTrack:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
  v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_13:
  v14();

}

- (AVAsset)asset
{
  void *v2;
  void *v3;

  -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVAsset *)v3;
}

- (CMTimeRange)timeRange
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  CMTimeRange *result;
  CMTimeRange v16;
  CMTimeRange range;
  CMTimeRange otherRange;
  CMTimeRange v19;

  *(_OWORD *)&retstr->start.epoch = 0u;
  *(_OWORD *)&retstr->duration.timescale = 0u;
  *(_OWORD *)&retstr->start.value = 0u;
  -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "timeRange");
  }
  else
  {
    *(_OWORD *)&retstr->start.epoch = 0u;
    *(_OWORD *)&retstr->duration.timescale = 0u;
    *(_OWORD *)&retstr->start.value = 0u;
  }

  -[CNAssetInfo cinematicDisparityTrack](self, "cinematicDisparityTrack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "timeRange");
  else
    memset(&otherRange, 0, sizeof(otherRange));
  v9 = *(_OWORD *)&retstr->start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&retstr->start.value;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&retstr->duration.timescale;
  CMTimeRangeGetIntersection(&v19, &range, &otherRange);
  v10 = *(_OWORD *)&v19.start.epoch;
  *(_OWORD *)&retstr->start.value = *(_OWORD *)&v19.start.value;
  *(_OWORD *)&retstr->start.epoch = v10;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)&v19.duration.timescale;

  -[CNAssetInfo cinematicMetadataTrack](self, "cinematicMetadataTrack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "timeRange");
  else
    memset(&v16, 0, sizeof(v16));
  v13 = *(_OWORD *)&retstr->start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&retstr->start.value;
  *(_OWORD *)&range.start.epoch = v13;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&retstr->duration.timescale;
  CMTimeRangeGetIntersection(&v19, &range, &v16);
  v14 = *(_OWORD *)&v19.start.epoch;
  *(_OWORD *)&retstr->start.value = *(_OWORD *)&v19.start.value;
  *(_OWORD *)&retstr->start.epoch = v14;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)&v19.duration.timescale;

  return result;
}

- (CGSize)naturalSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "naturalSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)preferredSize
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double width;
  double height;
  CGAffineTransform v11;
  CGSize result;
  CGRect v13;
  CGRect v14;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[CNAssetInfo naturalSize](self, "naturalSize");
  v6 = v5;
  v8 = v7;
  -[CNAssetInfo preferredTransform](self, "preferredTransform");
  v13.origin.x = v3;
  v13.origin.y = v4;
  v13.size.width = v6;
  v13.size.height = v8;
  v14 = CGRectApplyAffineTransform(v13, &v11);
  width = v14.size.width;
  height = v14.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "preferredTransform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (NSArray)allCinematicTracks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAssetInfo cinematicDisparityTrack](self, "cinematicDisparityTrack", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  -[CNAssetInfo cinematicMetadataTrack](self, "cinematicMetadataTrack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)videoCompositionTracks
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[CNAssetInfo cinematicDisparityTrack](self, "cinematicDisparityTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)videoCompositionTrackIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[CNAssetInfo cinematicVideoTrack](self, "cinematicVideoTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "trackID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[CNAssetInfo cinematicDisparityTrack](self, "cinematicDisparityTrack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "trackID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSArray)sampleDataTrackIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD16E0];
  -[CNAssetInfo cinematicMetadataTrack](self, "cinematicMetadataTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "trackID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)_initWithVideoTrack:(id)a3 disparityTrack:(id)a4 metadataTrack:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAssetInfo *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNAssetInfo;
  v12 = -[CNAssetInfo init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cinematicVideoTrack, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (AVAssetTrack)cinematicVideoTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCinematicVideoTrack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (AVAssetTrack)cinematicDisparityTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCinematicDisparityTrack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AVAssetTrack)cinematicMetadataTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCinematicMetadataTrack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cinematicMetadataTrack, 0);
  objc_storeStrong((id *)&self->_cinematicDisparityTrack, 0);
  objc_storeStrong((id *)&self->_cinematicVideoTrack, 0);
}

void __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23307F000, log, OS_LOG_TYPE_ERROR, "Error: unable to find video track with associated cinematic tracks", v1, 2u);
}

void __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23307F000, v0, v1, "Error: (%@) loading video tracks in asset %@");
  OUTLINED_FUNCTION_2();
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23307F000, v0, v1, "Error: (%@) unable to locate disparity track for video track %@");
  OUTLINED_FUNCTION_2();
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23307F000, v0, v1, "Error: (%@) unable to locate metadata track for video track %@");
  OUTLINED_FUNCTION_2();
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23307F000, v0, v1, "Error: located metadata track %@ for video track %@ does not have expected format");
  OUTLINED_FUNCTION_2();
}

@end
