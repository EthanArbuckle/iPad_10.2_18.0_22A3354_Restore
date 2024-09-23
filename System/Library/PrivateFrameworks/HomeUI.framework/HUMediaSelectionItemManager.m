@implementation HUMediaSelectionItemManager

- (HUMediaSelectionItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_mediaPlaybackActionBuilder_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaSelectionItemManager.m"), 73, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUMediaSelectionItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUMediaSelectionItemManager)initWithDelegate:(id)a3 mediaPlaybackActionBuilder:(id)a4
{
  id v7;
  HUMediaSelectionItemManager *v8;
  SKCloudServiceController *v9;
  SKCloudServiceController *cloudServiceController;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMediaSelectionItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v12, sel_initWithDelegate_sourceItem_, a3, 0);
  if (v8)
  {
    v9 = (SKCloudServiceController *)objc_alloc_init(MEMORY[0x1E0CD8008]);
    cloudServiceController = v8->_cloudServiceController;
    v8->_cloudServiceController = v9;

    objc_storeStrong((id *)&v8->_actionSetBuilder, a4);
  }

  return v8;
}

- (HFMediaPlaybackActionBuilder)actionBuilder
{
  void *v2;
  void *v3;

  -[HUMediaSelectionItemManager actionSetBuilder](self, "actionSetBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFMediaPlaybackActionBuilder *)v3;
}

- (id)selectedPlaybackStateItemBasedOnActionBuilderState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "targetPlayState");

  if (v4 == 1)
  {
    -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackArchive");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[HUMediaSelectionItemManager playbackStatePlayItem](self, "playbackStatePlayItem");
    else
      -[HUMediaSelectionItemManager playbackStateResumeItem](self, "playbackStateResumeItem");
  }
  else if (v4 == 2)
  {
    -[HUMediaSelectionItemManager playbackStatePauseItem](self, "playbackStatePauseItem");
  }
  else
  {
    -[HUMediaSelectionItemManager playbackStateAdjustVolumeOnlyItem](self, "playbackStateAdjustVolumeOnlyItem");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)selectedVolumeItemBasedOnActionBuilderState
{
  void *v3;
  void *v4;

  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetVolume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[HUMediaSelectionItemManager useCustomVolumeItem](self, "useCustomVolumeItem");
  else
    -[HUMediaSelectionItemManager useCurrentVolumeItem](self, "useCurrentVolumeItem");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSelectedPlaybackStateItem:(id)a3
{
  HFStaticItem *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HFStaticItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HFStaticItem *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  HFStaticItem *v24;
  void *v25;
  HFStaticItem *v26;

  v6 = (HFStaticItem *)a3;
  if (self->_selectedPlaybackStateItem != v6)
  {
    v26 = v6;
    objc_storeStrong((id *)&self->_selectedPlaybackStateItem, a3);
    -[HFStaticItem latestResults](v26, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HFStaticItem latestResults](v26, "latestResults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HOMediaSelectionPlayControlResultKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTargetPlayState:", v10);

    }
    -[HUMediaSelectionItemManager playbackStatePlayItem](self, "playbackStatePlayItem");
    v12 = (HFStaticItem *)objc_claimAutoreleasedReturnValue();
    if (v12 == v26)
    {

    }
    else
    {
      -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "playbackArchive");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "playbackArchive");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUMediaSelectionItemManager setLastSelectedArchive:](self, "setLastSelectedArchive:", v16);

        -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
        v17 = (HFStaticItem *)objc_claimAutoreleasedReturnValue();
        -[HFStaticItem setPlaybackArchive:](v17, "setPlaybackArchive:", 0);
        goto LABEL_9;
      }
    }
    -[HUMediaSelectionItemManager playbackStatePlayItem](self, "playbackStatePlayItem");
    v17 = (HFStaticItem *)objc_claimAutoreleasedReturnValue();
    if (v17 == v26)
    {
      -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "playbackArchive");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_10;
      -[HUMediaSelectionItemManager lastSelectedArchive](self, "lastSelectedArchive");
      v17 = (HFStaticItem *)objc_claimAutoreleasedReturnValue();
      v24 = v17;
      if (!v17)
        v24 = (HFStaticItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31660]), "initWithMediaPlayerPlaybackArchive:", 0);
      -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPlaybackArchive:", v24);

      if (!v17)
    }
LABEL_9:

LABEL_10:
    -[HUMediaSelectionItemManager actionSetBuilder](self, "actionSetBuilder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateAction:", v19);

    -[HFItemManager itemProviders](self, "itemProviders");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v20, a2);

    v6 = v26;
  }

}

- (void)setSelectedVolumeItem:(id)a3
{
  HFStaticItem *v6;
  HFStaticItem *v7;
  HFStaticItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  HFStaticItem *v17;

  v6 = (HFStaticItem *)a3;
  if (self->_selectedVolumeItem != v6)
  {
    v17 = v6;
    objc_storeStrong((id *)&self->_selectedVolumeItem, a3);
    -[HUMediaSelectionItemManager useCurrentVolumeItem](self, "useCurrentVolumeItem");
    v7 = (HFStaticItem *)objc_claimAutoreleasedReturnValue();

    if (v7 == v17)
    {
      -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "targetVolume");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMediaSelectionItemManager setLastSelectedVolume:](self, "setLastSelectedVolume:", v12);

      -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTargetVolume:", 0);
    }
    else
    {
      -[HUMediaSelectionItemManager useCustomVolumeItem](self, "useCustomVolumeItem");
      v8 = (HFStaticItem *)objc_claimAutoreleasedReturnValue();

      if (v8 != v17)
      {
LABEL_7:
        -[HUMediaSelectionItemManager actionSetBuilder](self, "actionSetBuilder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateAction:", v14);

        -[HFItemManager itemProviders](self, "itemProviders");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v15, a2);

        v6 = v17;
        goto LABEL_8;
      }
      -[HUMediaSelectionItemManager _volumeForMediaAction](self, "_volumeForMediaAction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTargetVolume:", v9);

    }
    goto LABEL_7;
  }
LABEL_8:

}

- (HFPlaybackArchive)pickedPlaybackArchive
{
  void *v2;
  void *v3;

  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFPlaybackArchive *)v3;
}

- (void)setPickedPlaybackArchive:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a3;
  objc_msgSend(v5, "mediaPlayerPlaybackArchive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager chosenMediaItem](self, "chosenMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaybackArchiveDisplayProperties:", v7);

  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaybackArchive:", v5);

  -[HUMediaSelectionItemManager actionSetBuilder](self, "actionSetBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateAction:", v11);

  -[HFItemManager itemProviders](self, "itemProviders");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v13, a2);

}

- (void)mediaPlaybackOptionsItem:(id)a3 switchedOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[HUMediaSelectionItemManager shuffleItem](self, "shuffleItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v12)
  {
    -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playbackArchive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShuffleEnabled:", v4);
    goto LABEL_5;
  }
  -[HUMediaSelectionItemManager repeatItem](self, "repeatItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v12)
  {
    -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playbackArchive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRepeatEnabled:", v4);
LABEL_5:

  }
  -[HUMediaSelectionItemManager actionSetBuilder](self, "actionSetBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateAction:", v11);

}

- (void)mediaVolumeValueChanged:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetVolume:", v4);

  -[HUMediaSelectionItemManager actionSetBuilder](self, "actionSetBuilder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAction:", v6);

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HUMediaItem *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HUMediaItem *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[5];
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[6];
  id location;
  _QWORD v77[5];
  void *v78;
  void *v79;
  _QWORD v80[2];
  uint64_t v81;
  void *v82;
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[4];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[4];

  v91[2] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D31840]);
  v90[0] = *MEMORY[0x1E0D30D18];
  v6 = v90[0];
  HFLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = CFSTR("HOMediaSelectionPlayControlResultKey");
  v91[0] = v7;
  v91[1] = &unk_1E7041008;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithResults:", v8);
  -[HUMediaSelectionItemManager setPlaybackStateAdjustVolumeOnlyItem:](self, "setPlaybackStateAdjustVolumeOnlyItem:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D31840]);
  v88[0] = v6;
  HFLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = CFSTR("HOMediaSelectionPlayControlResultKey");
  v89[0] = v11;
  v89[1] = &unk_1E7041020;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithResults:", v12);
  -[HUMediaSelectionItemManager setPlaybackStatePauseItem:](self, "setPlaybackStatePauseItem:", v13);

  v14 = objc_alloc(MEMORY[0x1E0D31840]);
  v86[0] = v6;
  HFLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = CFSTR("HOMediaSelectionPlayControlResultKey");
  v87[0] = v15;
  v87[1] = &unk_1E7041038;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithResults:", v16);
  -[HUMediaSelectionItemManager setPlaybackStateResumeItem:](self, "setPlaybackStateResumeItem:", v17);

  v18 = objc_alloc(MEMORY[0x1E0D31840]);
  v19 = MEMORY[0x1E0C809B0];
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke;
  v77[3] = &unk_1E6F4C518;
  v77[4] = self;
  v20 = (void *)objc_msgSend(v18, "initWithResultsBlock:", v77);
  -[HUMediaSelectionItemManager setPlaybackStatePlayItem:](self, "setPlaybackStatePlayItem:", v20);

  -[HUMediaSelectionItemManager playbackStatePlayItem](self, "playbackStatePlayItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v21;
  -[HUMediaSelectionItemManager playbackStatePauseItem](self, "playbackStatePauseItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v22;
  -[HUMediaSelectionItemManager playbackStateResumeItem](self, "playbackStateResumeItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v23;
  -[HUMediaSelectionItemManager playbackStateAdjustVolumeOnlyItem](self, "playbackStateAdjustVolumeOnlyItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager setPlaybackStateItems:](self, "setPlaybackStateItems:", v25);

  -[HUMediaSelectionItemManager selectedPlaybackStateItemBasedOnActionBuilderState](self, "selectedPlaybackStateItemBasedOnActionBuilderState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager setSelectedPlaybackStateItem:](self, "setSelectedPlaybackStateItem:", v26);

  objc_initWeak(&location, self);
  v75[0] = v19;
  v75[1] = 3221225472;
  v75[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2;
  v75[3] = &unk_1E6F556F8;
  v75[4] = self;
  v75[5] = a2;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v75);
  -[HUMediaSelectionItemManager setMediaPickerItem:](self, "setMediaPickerItem:", v27);

  v28 = [HUMediaItem alloc];
  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "playbackArchive");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "mediaPlayerPlaybackArchive");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "displayProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[HUMediaItem initWithPlaybackArchiveDisplayProperties:](v28, "initWithPlaybackArchiveDisplayProperties:", v32);
  -[HUMediaSelectionItemManager setChosenMediaItem:](self, "setChosenMediaItem:", v33);

  -[HUMediaSelectionItemManager chosenMediaItem](self, "chosenMediaItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v34;
  -[HUMediaSelectionItemManager mediaPickerItem](self, "mediaPickerItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager setMediaPickerRowItems:](self, "setMediaPickerRowItems:", v36);

  v37 = objc_alloc(MEMORY[0x1E0D31840]);
  v73[0] = v19;
  v73[1] = 3221225472;
  v73[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_58;
  v73[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v74, &location);
  v38 = (void *)objc_msgSend(v37, "initWithResultsBlock:", v73);
  -[HUMediaSelectionItemManager setRepeatItem:](self, "setRepeatItem:", v38);

  v39 = objc_alloc(MEMORY[0x1E0D31840]);
  v71[0] = v19;
  v71[1] = 3221225472;
  v71[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2_61;
  v71[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v72, &location);
  v40 = (void *)objc_msgSend(v39, "initWithResultsBlock:", v71);
  -[HUMediaSelectionItemManager setShuffleItem:](self, "setShuffleItem:", v40);

  -[HUMediaSelectionItemManager repeatItem](self, "repeatItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v41;
  -[HUMediaSelectionItemManager shuffleItem](self, "shuffleItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager setPlaybackOptionsItems:](self, "setPlaybackOptionsItems:", v43);

  v70[0] = v19;
  v70[1] = 3221225472;
  v70[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_3_64;
  v70[3] = &unk_1E6F4C518;
  v70[4] = self;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v70);
  -[HUMediaSelectionItemManager setUseCurrentVolumeItem:](self, "setUseCurrentVolumeItem:", v44);

  v45 = objc_alloc(MEMORY[0x1E0D31840]);
  v81 = v6;
  HFLocalizedString();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v45, "initWithResults:", v47);
  -[HUMediaSelectionItemManager setUseCustomVolumeItem:](self, "setUseCustomVolumeItem:", v48);

  -[HUMediaSelectionItemManager selectedVolumeItemBasedOnActionBuilderState](self, "selectedVolumeItemBasedOnActionBuilderState");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager setSelectedVolumeItem:](self, "setSelectedVolumeItem:", v49);

  v50 = objc_alloc(MEMORY[0x1E0D31840]);
  v68[0] = v19;
  v68[1] = 3221225472;
  v68[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_4_69;
  v68[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v69, &location);
  v51 = (void *)objc_msgSend(v50, "initWithResultsBlock:", v68);
  -[HUMediaSelectionItemManager setVolumeSliderItem:](self, "setVolumeSliderItem:", v51);

  -[HUMediaSelectionItemManager useCurrentVolumeItem](self, "useCurrentVolumeItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v52;
  -[HUMediaSelectionItemManager useCustomVolumeItem](self, "useCustomVolumeItem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager setCustomVolumeItems:](self, "setCustomVolumeItems:", v54);

  -[HUMediaSelectionItemManager volumeSliderItem](self, "volumeSliderItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager setVolumeSliderItems:](self, "setVolumeSliderItems:", v56);

  v57 = (void *)MEMORY[0x1E0C99E20];
  -[HUMediaSelectionItemManager playbackStateItems](self, "playbackStateItems");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setWithArray:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMediaSelectionItemManager mediaPickerRowItems](self, "mediaPickerRowItems");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObjectsFromArray:", v60);

  -[HUMediaSelectionItemManager customVolumeItems](self, "customVolumeItems");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObjectsFromArray:", v61);

  -[HUMediaSelectionItemManager volumeSliderItems](self, "volumeSliderItems");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObjectsFromArray:", v62);

  -[HUMediaSelectionItemManager playbackOptionsItems](self, "playbackOptionsItems");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObjectsFromArray:", v63);

  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v59);
  v78 = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v69);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);

  return v65;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke(id *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  int v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D519C0];
  v16[0] = *MEMORY[0x1E0D30D18];
  HFLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = &unk_1E7041038;
  v7 = *MEMORY[0x1E0D30C80];
  v16[1] = CFSTR("HOMediaSelectionPlayControlResultKey");
  v16[2] = v7;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(MEMORY[0x1E0D319D0], "supportsMediaPicker");
  if ((v9 & 1) != 0)
  {
    v10 = 0;
    v11 = 0;
  }
  else
  {
    objc_msgSend(a1[4], "lastSelectedArchive");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
    {
      v10 = 0;
      v11 = 0;
    }
    else
    {
      objc_msgSend(a1[4], "actionBuilder");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "playbackArchive");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "mediaPlayerPlaybackArchive");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v3 == 0;
      v10 = 1;
    }
  }
  objc_msgSend(v8, "numberWithInt:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {

  }
  if ((v9 & 1) == 0)

  return v14;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD v52[3];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  const __CFString *v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSelectionPickerButton"), CFSTR("HUMediaSelectionPickerButton"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  if (+[HUMediaAccountUtilities isMusicAppInstalled](HUMediaAccountUtilities, "isMusicAppInstalled"))
  {
    +[HUMediaAccountUtilities isAppleMusicSubscriptionAvailable](HUMediaAccountUtilities, "isAppleMusicSubscriptionAvailable");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "actionSetBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "hf_appleTVMediaProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v6;
    objc_msgSend(v6, "hf_homePodMediaProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D519C0];
    v63 = CFSTR("HOMediaSelectionPickingForExternalPlayerKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithResult:", v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "count"))
    {
      v13 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(*(id *)(a1 + 32), "actionSetBuilder");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hf_primaryResidentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hf_linkedAccessory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mediaProfile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "na_setWithSafeObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "hf_appleTVMediaProfiles");
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "hf_homePodMediaProfiles");
      v20 = objc_claimAutoreleasedReturnValue();

      v9 = v18;
      v8 = (void *)v20;
      v7 = (void *)v19;
    }
    HFLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v54 = v22;
      v55 = 2112;
      v56 = v23;
      v57 = 2112;
      v58 = v9;
      v59 = 2112;
      v60 = v7;
      v61 = 2112;
      v62 = v8;
      _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ appleMediaProfiles [%@] appleTVMediaProfiles [%@] homePodMediaProfiles [%@]", buf, 0x34u);

    }
    v24 = MEMORY[0x1E0C809B0];
    v46[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_44;
    v46[3] = &unk_1E6F556D0;
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 40);
    v47 = v9;
    v48 = v25;
    v27 = (void *)MEMORY[0x1E0D519C0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v50 = v8;
    v51 = v26;
    v49 = v7;
    v39 = v8;
    v28 = v7;
    v29 = v9;
    objc_msgSend(v27, "futureWithBlock:", v46);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0D519C0];
    v52[0] = v42;
    v52[1] = v40;
    v52[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "combineAllFutures:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v24;
    v43[1] = 3221225472;
    v43[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_7;
    v43[3] = &unk_1E6F4CFF0;
    v34 = v2;
    v35 = *(_QWORD *)(a1 + 40);
    v44 = v34;
    v45 = v35;
    objc_msgSend(v33, "flatMap:", v43);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E7041008, CFSTR("HOMediaPickerUnavailableReasonKey"));
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v36;
}

void __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id obja;
  id obj;
  char v47;
  int v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  char v59;
  char v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  int v77;
  const __CFString *v78;
  _QWORD v79[4];

  v79[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_activeiTunesAccount");
  v5 = objc_claimAutoreleasedReturnValue();

  v49 = (void *)v5;
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v44 = v3;
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v67 = v7;
      v68 = 2112;
      v69 = v8;
      v70 = 2112;
      v71 = v49;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ iTunes Account [%@]", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isMultiUserEnabled");

    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v67 = v12;
      v68 = 2112;
      v69 = v13;
      v70 = 1024;
      LODWORD(v71) = v10;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ isMultiUserEnabled [%d]", buf, 0x1Cu);

    }
    v47 = v10;
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentUser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaContentProfileAccessControlForHome:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accessories");
      v18 = objc_claimAutoreleasedReturnValue();

      v19 = objc_alloc(MEMORY[0x1E0D31988]);
      objc_msgSend(*(id *)(a1 + 40), "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentUser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v19, "initWithHome:user:nameStyle:", v20, v22, 0);
      v48 = objc_msgSend(v23, "isIdentifyVoiceEnabled");

    }
    else
    {
      v48 = 0;
      v18 = MEMORY[0x1E0C9AA60];
    }
    HFLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "home");
      obja = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "hf_displayName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "home");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "currentUser");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v67 = v26;
      v68 = 2112;
      v69 = v27;
      v70 = 2112;
      v71 = v28;
      v72 = 2112;
      v73 = v31;
      v74 = 2112;
      v75 = v18;
      v76 = 1024;
      v77 = v48;
      _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@ home [%@] currentUser [%@] appleTVsWithTVProfiles [%@] vrEnabled [%d]", buf, 0x3Au);

    }
    v24 = (void *)v18;

    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = *(id *)(a1 + 32);
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v62 != v35)
            objc_enumerationMutation(obj);
          v37 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          v38 = (void *)MEMORY[0x1E0D519C0];
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_48;
          v52[3] = &unk_1E6F55688;
          v53 = *(id *)(a1 + 48);
          v54 = v37;
          v55 = *(id *)(a1 + 56);
          v59 = v47;
          v39 = v24;
          v60 = v48;
          v40 = *(_QWORD *)(a1 + 40);
          v56 = v39;
          v57 = v40;
          v58 = v49;
          objc_msgSend(v38, "futureWithBlock:", v52);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v41);

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v34);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v32);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_5;
    v50[3] = &unk_1E6F4C708;
    v3 = v44;
    v51 = v44;
    v43 = (id)objc_msgSend(v42, "addCompletionBlock:", v50);

  }
  else
  {
    v78 = CFSTR("HOMediaSelectionShowLibraryContentKey");
    v79[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v24);
  }

}

void __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  v5 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *(_QWORD *)(a1 + 40));
  v6 = v5;
  if ((v4 & 1) == 0 && (v5 & 1) == 0)
    objc_msgSend(v3, "finishWithResult:", MEMORY[0x1E0C9AAA0]);
  if (!*(_BYTE *)(a1 + 80))
    goto LABEL_11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2_49;
    v18[3] = &unk_1E6F4E5D8;
    v19 = *(id *)(a1 + 56);
    v8 = objc_msgSend(v7, "na_any:", v18);

    if ((v8 & 1) == 0)
    {
LABEL_11:
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "hf_appleMusicCurrentLoggedInAccount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "hasSameAppleMusicServiceAltDSID:", v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithResult:", v14);

      goto LABEL_12;
    }
  }
  else if (!v6 || !*(_BYTE *)(a1 + 81))
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_4;
  v15[3] = &unk_1E6F4CF38;
  v16 = v3;
  v17 = *(id *)(a1 + 72);
  objc_msgSend(v9, "getHomeMediaAccountForHome:withCompletion:", v10, v15);

LABEL_12:
}

uint64_t __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_3;
  v8[3] = &unk_1E6F4E5D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "hasSameAppleMusicServiceAltDSID:", a2));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

void __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "na_all:", &__block_literal_global_123);
  v4 = *(void **)(a1 + 32);
  v7 = CFSTR("HOMediaSelectionShowLibraryContentKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v6);

}

uint64_t __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_opt_class();
        v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
          objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@ mediaPicker result [%@]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_58(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isRepeatEnabled");

  v4 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSelectionQueueModifierRepeat"), CFSTR("HUMediaSelectionQueueModifierRepeat"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E0D30E20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_2_61(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isShuffleEnabled");

  v4 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSelectionQueueModifierShuffle"), CFSTR("HUMediaSelectionQueueModifierShuffle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E0D30E20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_3_64(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v11[0] = *MEMORY[0x1E0D30D18];
  HFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = *MEMORY[0x1E0D30C80];
  v12[0] = v3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "selectedPlaybackStateItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playbackStateAdjustVolumeOnlyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", v5 == v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __58__HUMediaSelectionItemManager__buildItemProvidersForHome___block_invoke_4_69(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetVolume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("HOMediaVolumeResultKey"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaSelectionItemManager playbackStateItems](self, "playbackStateItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "intersectsSet:", v8);

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HOMediaSelectionActionSectionIdentifier"));
    -[HUMediaSelectionItemManager playbackStateItems](self, "playbackStateItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setItems:", v11);

    objc_msgSend(v5, "addObject:", v10);
  }
  v12 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaSelectionItemManager mediaPickerRowItems](self, "mediaPickerRowItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "intersectsSet:", v14);

  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HOMediaSelectionPickerSectionIdentifier"));
    -[HUMediaSelectionItemManager mediaPickerRowItems](self, "mediaPickerRowItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v16;
    v46[1] = 3221225472;
    v46[2] = __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v46[3] = &unk_1E6F55720;
    v47 = v4;
    objc_msgSend(v18, "na_filter:", v46);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setItems:", v19);

    objc_msgSend(v5, "addObject:", v17);
  }
  v20 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaSelectionItemManager playbackOptionsItems](self, "playbackOptionsItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v4, "intersectsSet:", v22);

  if (v23)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HOMediaSelectionOptionsSectionIdentifier"));
    -[HUMediaSelectionItemManager playbackOptionsItems](self, "playbackOptionsItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setItems:", v25);

    objc_msgSend(v5, "addObject:", v24);
  }
  v26 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaSelectionItemManager customVolumeItems](self, "customVolumeItems");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v4, "intersectsSet:", v28);

  if (v29)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HOMediaSelectionVolumeSelectionSectionIdentifier"));
    -[HUMediaSelectionItemManager customVolumeItems](self, "customVolumeItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v16;
    v44[1] = 3221225472;
    v44[2] = __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
    v44[3] = &unk_1E6F55720;
    v45 = v4;
    objc_msgSend(v31, "na_filter:", v44);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setItems:", v32);

    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSelectionVolumeSectionTitle"), CFSTR("HUMediaSelectionVolumeSectionTitle"), 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHeaderTitle:", v33);

    objc_msgSend(v5, "addObject:", v30);
  }
  v34 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaSelectionItemManager volumeSliderItems](self, "volumeSliderItems");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v4, "intersectsSet:", v36);

  if (v37)
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HOMediaSelectionVolumeSliderSectionIdentifier"));
    -[HUMediaSelectionItemManager volumeSliderItems](self, "volumeSliderItems");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v16;
    v42[1] = 3221225472;
    v42[2] = __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
    v42[3] = &unk_1E6F55720;
    v43 = v4;
    objc_msgSend(v39, "na_filter:", v42);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setItems:", v40);

    objc_msgSend(v5, "addObject:", v38);
  }

  return v5;
}

uint64_t __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __64__HUMediaSelectionItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)HUMediaSelectionItemManager;
  -[HFItemManager _itemsToHideInSet:](&v27, sel__itemsToHideInSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HUMediaSelectionItemManager selectedPlaybackStateItem](self, "selectedPlaybackStateItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager playbackStatePlayItem](self, "playbackStatePlayItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[HUMediaSelectionItemManager mediaPickerRowItems](self, "mediaPickerRowItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

    -[HUMediaSelectionItemManager playbackOptionsItems](self, "playbackOptionsItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);
LABEL_9:

    goto LABEL_10;
  }
  -[HUMediaSelectionItemManager pickedPlaybackArchive](self, "pickedPlaybackArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaPlayerPlaybackArchive");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[HUMediaSelectionItemManager chosenMediaItem](self, "chosenMediaItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    -[HUMediaSelectionItemManager playbackOptionsItems](self, "playbackOptionsItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
  -[HUMediaSelectionItemManager pickedPlaybackArchive](self, "pickedPlaybackArchive");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isRepeatSupported");

  if ((v15 & 1) == 0)
  {
    -[HUMediaSelectionItemManager repeatItem](self, "repeatItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

  }
  -[HUMediaSelectionItemManager pickedPlaybackArchive](self, "pickedPlaybackArchive");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isShuffleSupported");

  if ((v18 & 1) == 0)
  {
    -[HUMediaSelectionItemManager shuffleItem](self, "shuffleItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);
    goto LABEL_9;
  }
LABEL_10:
  -[HUMediaSelectionItemManager selectedPlaybackStateItem](self, "selectedPlaybackStateItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager playbackStatePauseItem](self, "playbackStatePauseItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 == v20)
  {
    -[HUMediaSelectionItemManager customVolumeItems](self, "customVolumeItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v21);

    -[HUMediaSelectionItemManager volumeSliderItems](self, "volumeSliderItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v22);

  }
  -[HUMediaSelectionItemManager selectedVolumeItem](self, "selectedVolumeItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionItemManager useCurrentVolumeItem](self, "useCurrentVolumeItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 == v24)
  {
    -[HUMediaSelectionItemManager volumeSliderItems](self, "volumeSliderItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v25);

  }
  return v5;
}

- (id)_volumeForMediaAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetVolume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HUMediaSelectionItemManager lastSelectedVolume](self, "lastSelectedVolume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v6 = v7;
    }
    else
    {
      -[HUMediaSelectionItemManager actionBuilder](self, "actionBuilder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mediaProfiles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUMediaAccountUtilities defaultCurrentVolumeForMediaProfiles:](HUMediaAccountUtilities, "defaultCurrentVolumeForMediaProfiles:", v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (HFStaticItem)selectedPlaybackStateItem
{
  return self->_selectedPlaybackStateItem;
}

- (HFActionSetBuilder)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (HFStaticItem)playbackStateAdjustVolumeOnlyItem
{
  return self->_playbackStateAdjustVolumeOnlyItem;
}

- (void)setPlaybackStateAdjustVolumeOnlyItem:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStateAdjustVolumeOnlyItem, a3);
}

- (HFStaticItem)playbackStatePauseItem
{
  return self->_playbackStatePauseItem;
}

- (void)setPlaybackStatePauseItem:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStatePauseItem, a3);
}

- (HFStaticItem)playbackStateResumeItem
{
  return self->_playbackStateResumeItem;
}

- (void)setPlaybackStateResumeItem:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStateResumeItem, a3);
}

- (HFStaticItem)playbackStatePlayItem
{
  return self->_playbackStatePlayItem;
}

- (void)setPlaybackStatePlayItem:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStatePlayItem, a3);
}

- (NSArray)playbackStateItems
{
  return self->_playbackStateItems;
}

- (void)setPlaybackStateItems:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStateItems, a3);
}

- (HFStaticItem)mediaPickerItem
{
  return self->_mediaPickerItem;
}

- (void)setMediaPickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPickerItem, a3);
}

- (HUMediaItem)chosenMediaItem
{
  return self->_chosenMediaItem;
}

- (void)setChosenMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_chosenMediaItem, a3);
}

- (NSArray)playbackOptionsItems
{
  return self->_playbackOptionsItems;
}

- (void)setPlaybackOptionsItems:(id)a3
{
  objc_storeStrong((id *)&self->_playbackOptionsItems, a3);
}

- (HFStaticItem)useCurrentVolumeItem
{
  return self->_useCurrentVolumeItem;
}

- (void)setUseCurrentVolumeItem:(id)a3
{
  objc_storeStrong((id *)&self->_useCurrentVolumeItem, a3);
}

- (HFStaticItem)useCustomVolumeItem
{
  return self->_useCustomVolumeItem;
}

- (void)setUseCustomVolumeItem:(id)a3
{
  objc_storeStrong((id *)&self->_useCustomVolumeItem, a3);
}

- (HFStaticItem)selectedVolumeItem
{
  return self->_selectedVolumeItem;
}

- (HFStaticItem)volumeSliderItem
{
  return self->_volumeSliderItem;
}

- (void)setVolumeSliderItem:(id)a3
{
  objc_storeStrong((id *)&self->_volumeSliderItem, a3);
}

- (void)setActionBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_actionBuilder, a3);
}

- (NSArray)mediaPickerRowItems
{
  return self->_mediaPickerRowItems;
}

- (void)setMediaPickerRowItems:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPickerRowItems, a3);
}

- (HFStaticItem)repeatItem
{
  return self->_repeatItem;
}

- (void)setRepeatItem:(id)a3
{
  objc_storeStrong((id *)&self->_repeatItem, a3);
}

- (HFStaticItem)shuffleItem
{
  return self->_shuffleItem;
}

- (void)setShuffleItem:(id)a3
{
  objc_storeStrong((id *)&self->_shuffleItem, a3);
}

- (NSArray)customVolumeItems
{
  return self->_customVolumeItems;
}

- (void)setCustomVolumeItems:(id)a3
{
  objc_storeStrong((id *)&self->_customVolumeItems, a3);
}

- (NSArray)volumeSliderItems
{
  return self->_volumeSliderItems;
}

- (void)setVolumeSliderItems:(id)a3
{
  objc_storeStrong((id *)&self->_volumeSliderItems, a3);
}

- (SKCloudServiceController)cloudServiceController
{
  return self->_cloudServiceController;
}

- (void)setCloudServiceController:(id)a3
{
  objc_storeStrong((id *)&self->_cloudServiceController, a3);
}

- (HFPlaybackArchive)lastSelectedArchive
{
  return self->_lastSelectedArchive;
}

- (void)setLastSelectedArchive:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedArchive, a3);
}

- (NSNumber)lastSelectedVolume
{
  return self->_lastSelectedVolume;
}

- (void)setLastSelectedVolume:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedVolume, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedVolume, 0);
  objc_storeStrong((id *)&self->_lastSelectedArchive, 0);
  objc_storeStrong((id *)&self->_cloudServiceController, 0);
  objc_storeStrong((id *)&self->_volumeSliderItems, 0);
  objc_storeStrong((id *)&self->_customVolumeItems, 0);
  objc_storeStrong((id *)&self->_shuffleItem, 0);
  objc_storeStrong((id *)&self->_repeatItem, 0);
  objc_storeStrong((id *)&self->_mediaPickerRowItems, 0);
  objc_storeStrong((id *)&self->_actionBuilder, 0);
  objc_storeStrong((id *)&self->_volumeSliderItem, 0);
  objc_storeStrong((id *)&self->_selectedVolumeItem, 0);
  objc_storeStrong((id *)&self->_useCustomVolumeItem, 0);
  objc_storeStrong((id *)&self->_useCurrentVolumeItem, 0);
  objc_storeStrong((id *)&self->_playbackOptionsItems, 0);
  objc_storeStrong((id *)&self->_chosenMediaItem, 0);
  objc_storeStrong((id *)&self->_mediaPickerItem, 0);
  objc_storeStrong((id *)&self->_playbackStateItems, 0);
  objc_storeStrong((id *)&self->_playbackStatePlayItem, 0);
  objc_storeStrong((id *)&self->_playbackStateResumeItem, 0);
  objc_storeStrong((id *)&self->_playbackStatePauseItem, 0);
  objc_storeStrong((id *)&self->_playbackStateAdjustVolumeOnlyItem, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
  objc_storeStrong((id *)&self->_selectedPlaybackStateItem, 0);
}

@end
