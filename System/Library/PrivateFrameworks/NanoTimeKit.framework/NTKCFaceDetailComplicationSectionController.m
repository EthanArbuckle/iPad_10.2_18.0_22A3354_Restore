@implementation NTKCFaceDetailComplicationSectionController

+ (BOOL)hasComplicationsForFace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fixedComplicationSlotsForDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__NTKCFaceDetailComplicationSectionController_hasComplicationsForFace___block_invoke;
  v10[3] = &unk_1E6BD1360;
  v7 = v6;
  v11 = v7;
  v8 = v3;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v8, "enumerateComplicationSlotsWithBlock:", v10);
  LOBYTE(v5) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v5;
}

void __71__NTKCFaceDetailComplicationSectionController_hasComplicationsForFace___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "monogramSlotForDevice:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

- (NTKCFaceDetailComplicationSectionController)initWithTableViewController:(id)a3 face:(id)a4 faceView:(id)a5 inGallery:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  NTKCFaceDetailComplicationSectionController *v12;
  NTKCFaceDetailComplicationSectionController *v13;
  objc_super v15;

  v6 = a6;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NTKCFaceDetailComplicationSectionController;
  v12 = -[NTKCFaceDetailSectionController initWithTableViewController:face:inGallery:](&v15, sel_initWithTableViewController_face_inGallery_, a3, a4, v6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_faceView, a5);

  return v13;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  NTKCFaceDetailComplicationSectionController *v12;

  -[NTKCFaceDetailSectionController face](self, "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  -[NTKCFaceDetailSectionController face](self, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fixedComplicationSlotsForDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKCFaceDetailSectionController face](self, "face");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__NTKCFaceDetailComplicationSectionController__commonInit__block_invoke;
  v10[3] = &unk_1E6BCF4C8;
  v11 = v7;
  v12 = self;
  v9 = v7;
  objc_msgSend(v8, "enumerateComplicationSlotsWithBlock:", v10);

}

void __58__NTKCFaceDetailComplicationSectionController__commonInit__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NTKCFaceDetailComplicationCell *v27;
  void *v28;
  NTKCFaceDetailComplicationCell *v29;
  id v30;

  v30 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "face");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "complicationForSlot:", v30);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "face");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "monogramSlotForDevice:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v30, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v4;
        objc_msgSend(v11, "clientIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.nike.nikeplus-gps.watchkitapp.watchkitextension"));

        v4 = v11;
        if (v13)
        {
          NTKSharedRemoteComplicationProvider();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "clientIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appBundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "vendorExistsWithClientIdentifier:appBundleIdentifier:", v15, v16);

          v4 = v11;
          if ((v17 & 1) == 0)
          {
            +[NTKComplication nullComplication](NTKComplication, "nullComplication");
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 40), "face");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setComplication:forSlot:", v4, v30);

          }
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "face");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "face");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "device");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateSlotForDevice:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v30, "isEqualToString:", v23);

      objc_msgSend(*(id *)(a1 + 40), "richComplicationSlots");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "containsObject:", v30);

      v27 = [NTKCFaceDetailComplicationCell alloc];
      objc_msgSend(*(id *)(a1 + 40), "face");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[NTKCFaceDetailComplicationCell initWithSlot:dateSlot:isRichSlot:inFace:](v27, "initWithSlot:dateSlot:isRichSlot:inFace:", v30, v24, v26, v28);

      -[NTKCFaceDetailComplicationCell setComplication:](v29, "setComplication:", v4);
      objc_msgSend(*(id *)(a1 + 40), "_addComplication:", v29);

    }
  }

}

- (void)_addComplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[NTKCFaceDetailSectionController setRows:](self, "setRows:", v6);

  }
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (id)titleForHeader
{
  return NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_LABEL_COMPLICATIONS_COMPANION"), CFSTR("Complications"));
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  char v10;

  -[NTKCFaceDetailSectionController rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", self->_hiddenCell);

  if (v6 == a3)
    return 0;
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enabled");

  return v10;
}

- (void)didSelectRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[NTKCFaceDetailSectionController rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "slot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "complication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailComplicationSectionController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "complicationSection:wantsToPresentPickerForSlot:selectedComplication:", self, v6, v7);

}

- (void)faceDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NTKCFaceDetailComplicationsHiddenCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NTKCFaceDetailComplicationsHiddenCell *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  NTKCFaceDetailComplicationsHiddenCell *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  _BOOL4 v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v56 != v6)
          objc_enumerationMutation(v3);
        v8 = *(NTKCFaceDetailComplicationsHiddenCell **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (v8 != self->_hiddenCell)
        {
          -[NTKCFaceDetailSectionController face](self, "face");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKCFaceDetailComplicationsHiddenCell slot](v8, "slot");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "complicationForSlot:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKCFaceDetailComplicationsHiddenCell setComplication:](v8, "setComplication:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v5);
  }

  -[NTKCFaceDetailSectionController rows](self, "rows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", self->_hiddenCell);

  -[NTKFaceView allVisibleComplicationsForCurrentConfiguration](self->_faceView, "allVisibleComplicationsForCurrentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15 && !self->_hiddenCell)
  {
    v16 = objc_alloc_init(NTKCFaceDetailComplicationsHiddenCell);
    -[NTKCFaceDetailComplicationSectionController setHiddenCell:](self, "setHiddenCell:", v16);

  }
  -[NTKFaceView _complicationSlotsHiddenByCurrentConfiguration](self->_faceView, "_complicationSlotsHiddenByCurrentConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v53 = 0uLL;
    v54 = 0uLL;
    v51 = 0uLL;
    v52 = 0uLL;
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v19)
    {
      v20 = v19;
      v46 = v13;
      v21 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v52 != v21)
            objc_enumerationMutation(v18);
          v23 = *(NTKCFaceDetailComplicationsHiddenCell **)(*((_QWORD *)&v51 + 1) + 8 * j);
          if (v23 != self->_hiddenCell)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "slot");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKCFaceDetailComplicationsHiddenCell setEnabled:](v23, "setEnabled:", objc_msgSend(v17, "containsObject:", v24) ^ 1);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      }
      while (v20);
      v13 = v46;
    }
  }
  else
  {
    v49 = 0uLL;
    v50 = 0uLL;
    v47 = 0uLL;
    v48 = 0uLL;
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v48 != v27)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "setEnabled:", 1);
        }
        v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      }
      while (v26);
    }
  }
  v29 = v15 == 0;

  -[NTKCFaceDetailSectionController rows](self, "rows");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "indexOfObject:", self->_hiddenCell);

  v32 = v31 == 0x7FFFFFFFFFFFFFFFLL && v29;
  v33 = v13 == 0x7FFFFFFFFFFFFFFFLL || v29;
  if (v31 != v13 || v32 || (v33 & 1) == 0)
  {
    -[NTKCFaceDetailSectionController tableView](self, "tableView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "beginUpdates");

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, -[NTKCFaceDetailSectionController section](self, "section"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailSectionController tableView](self, "tableView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "deleteRowsAtIndexPaths:withRowAnimation:", v37, 100);

      -[NTKCFaceDetailSectionController rows](self, "rows");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeObject:", self->_hiddenCell);

    }
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NTKCFaceDetailSectionController rows](self, "rows");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v40, -[NTKCFaceDetailSectionController section](self, "section"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailSectionController tableView](self, "tableView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "insertRowsAtIndexPaths:withRowAnimation:", v43, 100);

      -[NTKCFaceDetailSectionController rows](self, "rows");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", self->_hiddenCell);

    }
    -[NTKCFaceDetailSectionController tableView](self, "tableView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "endUpdates");

  }
}

- (NSSet)richComplicationSlots
{
  NSSet *richComplicationSlots;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  NSSet *v11;

  richComplicationSlots = self->_richComplicationSlots;
  if (!richComplicationSlots)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[NTKCFaceDetailSectionController face](self, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_class();
    -[NTKCFaceDetailSectionController face](self, "face");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "richComplicationSlotsForDevice:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v9);
    v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v11 = self->_richComplicationSlots;
    self->_richComplicationSlots = v10;

    richComplicationSlots = self->_richComplicationSlots;
  }
  return richComplicationSlots;
}

- (NTKCFaceDetailComplicationSectionDelegate)delegate
{
  return (NTKCFaceDetailComplicationSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NTKFaceView)faceView
{
  return self->_faceView;
}

- (void)setFaceView:(id)a3
{
  objc_storeStrong((id *)&self->_faceView, a3);
}

- (NTKCFaceDetailComplicationsHiddenCell)hiddenCell
{
  return self->_hiddenCell;
}

- (void)setHiddenCell:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenCell, a3);
}

- (void)setRichComplicationSlots:(id)a3
{
  objc_storeStrong((id *)&self->_richComplicationSlots, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richComplicationSlots, 0);
  objc_storeStrong((id *)&self->_hiddenCell, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
