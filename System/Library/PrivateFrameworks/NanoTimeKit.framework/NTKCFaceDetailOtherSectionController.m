@implementation NTKCFaceDetailOtherSectionController

- (void)_commonInit
{
  id v3;

  v3 = (id)objc_opt_new();
  -[NTKCFaceDetailSectionController setRows:](self, "setRows:", v3);

}

- (id)titleForHeader
{
  uint64_t v2;

  return NTKCCustomizationLocalizedString(CFSTR("OTHER_TITLE"), (uint64_t)CFSTR("Other"), v2);
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  void *v5;
  NTKCFaceDetailMonogramEditCell *v6;

  -[NTKCFaceDetailSectionController rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (NTKCFaceDetailMonogramEditCell *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v6 == self->_monogramEditCell;

  return a3;
}

- (void)didSelectRow:(int64_t)a3
{
  id v4;

  -[NTKCFaceDetailOtherSectionController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherSectionDidSelectMonogramEdit:", self);

}

- (void)faceDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NTKCFaceDetailMonogramComplicationCell *monogramCell;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  if (self->_showSecondsCell)
  {
    -[NTKCFaceDetailSectionController face](self, "face");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedOptionsForCustomEditModes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[NTKCFaceDetailShowSecondsCell collection](self->_showSecondsCell, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "mode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NTKCFaceDetailToggleCell setOn:](self->_showSecondsCell, "setOn:", objc_msgSend(v8, "accuracy") == 0);

  }
  monogramCell = self->_monogramCell;
  if (monogramCell)
  {
    v10 = -[NTKCFaceDetailToggleCell on](monogramCell, "on");
    -[NTKCFaceDetailSectionController face](self, "face");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailMonogramComplicationCell slot](self->_monogramCell, "slot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "complicationForSlot:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplication nullComplication](NTKComplication, "nullComplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    -[NTKCFaceDetailToggleCell setOn:](self->_monogramCell, "setOn:", v15 ^ 1u);
    if ((v15 & 1) == 0 && !-[NTKCFaceDetailSectionController inGallery](self, "inGallery"))
      -[NTKCFaceDetailOtherSectionController _addMonogramEditRow](self, "_addMonogramEditRow");
    if (v10 == v15)
      -[NTKCFaceDetailOtherSectionController toggleCell:didToggle:](self, "toggleCell:didToggle:", self->_monogramCell, v15 ^ 1u);
  }
}

- (void)addMonogramRowForSlot:(id)a3
{
  id v4;
  NTKCFaceDetailMonogramComplicationCell *v5;
  void *v6;
  NTKCFaceDetailMonogramComplicationCell *v7;
  id v8;

  v4 = a3;
  -[NTKCFaceDetailOtherSectionController removeMonogramRow](self, "removeMonogramRow");
  v5 = [NTKCFaceDetailMonogramComplicationCell alloc];
  -[NTKCFaceDetailSectionController face](self, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKCFaceDetailMonogramComplicationCell initWithSlot:inFace:](v5, "initWithSlot:inFace:", v4, v6);

  -[NTKCFaceDetailOtherSectionController setMonogramCell:](self, "setMonogramCell:", v7);
  -[NTKCFaceDetailToggleCell setDelegate:](self->_monogramCell, "setDelegate:", self);
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", self->_monogramCell);

}

- (void)removeMonogramRow
{
  void *v3;
  NTKCFaceDetailMonogramComplicationCell *monogramCell;
  void *v5;
  NTKCFaceDetailMonogramEditCell *monogramEditCell;

  if (self->_monogramCell)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", self->_monogramCell);

    -[NTKCFaceDetailToggleCell setDelegate:](self->_monogramCell, "setDelegate:", 0);
    monogramCell = self->_monogramCell;
    self->_monogramCell = 0;

  }
  if (self->_monogramEditCell)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", self->_monogramEditCell);

    monogramEditCell = self->_monogramEditCell;
    self->_monogramEditCell = 0;

  }
}

- (void)_addMonogramEditRow
{
  NTKCFaceDetailMonogramEditCell *v3;
  void *v4;
  char v5;
  id v6;

  if (!self->_monogramEditCell)
  {
    v3 = objc_alloc_init(NTKCFaceDetailMonogramEditCell);
    -[NTKCFaceDetailOtherSectionController setMonogramEditCell:](self, "setMonogramEditCell:", v3);

  }
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", self->_monogramEditCell);

  if ((v5 & 1) == 0)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", self->_monogramEditCell);

  }
}

- (void)_removeMonogramEditRow
{
  id v3;

  -[NTKCFaceDetailSectionController rows](self, "rows");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self->_monogramEditCell);

}

- (void)addShowSecondsRow:(id)a3
{
  id v4;
  NTKCFaceDetailShowSecondsCell *v5;
  id v6;

  v4 = a3;
  -[NTKCFaceDetailOtherSectionController removeShowSecondsRow](self, "removeShowSecondsRow");
  v5 = -[NTKCFaceDetailShowSecondsCell initWithCollection:]([NTKCFaceDetailShowSecondsCell alloc], "initWithCollection:", v4);

  -[NTKCFaceDetailOtherSectionController setShowSecondsCell:](self, "setShowSecondsCell:", v5);
  -[NTKCFaceDetailToggleCell setDelegate:](self->_showSecondsCell, "setDelegate:", self);
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertObject:atIndex:", self->_showSecondsCell, 0);

}

- (void)removeShowSecondsRow
{
  void *v3;
  NTKCFaceDetailShowSecondsCell *showSecondsCell;

  if (self->_showSecondsCell)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", self->_showSecondsCell);

    -[NTKCFaceDetailToggleCell setDelegate:](self->_showSecondsCell, "setDelegate:", 0);
    showSecondsCell = self->_showSecondsCell;
    self->_showSecondsCell = 0;

  }
}

- (void)toggleCell:(id)a3 didToggle:(BOOL)a4
{
  _BOOL4 v4;
  NTKCFaceDetailMonogramComplicationCell *v6;
  NTKCFaceDetailMonogramComplicationCell *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  void *v31;
  _QWORD v32[2];

  v4 = a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = (NTKCFaceDetailMonogramComplicationCell *)a3;
  v7 = v6;
  if (self->_monogramCell == v6)
  {
    if (v4)
    {
      +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", 14);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (-[NTKCFaceDetailSectionController inGallery](self, "inGallery"))
      {
LABEL_22:
        -[NTKCFaceDetailOtherSectionController delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailMonogramComplicationCell slot](self->_monogramCell, "slot");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "otherSection:didToggleMonogram:forSlot:", self, v16, v25);
LABEL_25:

        goto LABEL_26;
      }
      -[NTKCFaceDetailOtherSectionController _addMonogramEditRow](self, "_addMonogramEditRow");
      v17 = (void *)MEMORY[0x1E0CB36B0];
      -[NTKCFaceDetailSectionController rows](self, "rows");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "indexPathForRow:inSection:", objc_msgSend(v18, "indexOfObject:", self->_monogramEditCell), -[NTKCFaceDetailSectionController section](self, "section"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKCFaceDetailSectionController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "insertRowsAtIndexPaths:withRowAnimation:", v21, 100);
    }
    else
    {
      +[NTKComplication nullComplication](NTKComplication, "nullComplication");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (-[NTKCFaceDetailSectionController inGallery](self, "inGallery") || !self->_monogramEditCell)
        goto LABEL_22;
      v22 = (void *)MEMORY[0x1E0CB36B0];
      -[NTKCFaceDetailSectionController rows](self, "rows");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "indexPathForRow:inSection:", objc_msgSend(v23, "indexOfObject:", self->_monogramEditCell), -[NTKCFaceDetailSectionController section](self, "section"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKCFaceDetailOtherSectionController _removeMonogramEditRow](self, "_removeMonogramEditRow");
      -[NTKCFaceDetailSectionController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deleteRowsAtIndexPaths:withRowAnimation:", v21, 100);
    }

    goto LABEL_22;
  }
  if ((NTKCFaceDetailMonogramComplicationCell *)self->_showSecondsCell == v6)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NTKCFaceDetailMonogramComplicationCell collection](v6, "collection", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "accuracy");
          if (v4)
          {
            if (!v15)
              goto LABEL_23;
          }
          else if (v15 == 1)
          {
LABEL_23:
            v16 = v14;
            goto LABEL_24;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_24:

    -[NTKCFaceDetailOtherSectionController delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailShowSecondsCell collection](self->_showSecondsCell, "collection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "otherSection:didChangeShowSeconds:forMode:", self, v16, objc_msgSend(v25, "mode"));
    goto LABEL_25;
  }
LABEL_26:

}

- (NTKCFaceDetailOtherSectionDelegate)delegate
{
  return (NTKCFaceDetailOtherSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NTKCFaceDetailMonogramComplicationCell)monogramCell
{
  return self->_monogramCell;
}

- (void)setMonogramCell:(id)a3
{
  objc_storeStrong((id *)&self->_monogramCell, a3);
}

- (NTKCFaceDetailMonogramEditCell)monogramEditCell
{
  return self->_monogramEditCell;
}

- (void)setMonogramEditCell:(id)a3
{
  objc_storeStrong((id *)&self->_monogramEditCell, a3);
}

- (NTKCFaceDetailShowSecondsCell)showSecondsCell
{
  return self->_showSecondsCell;
}

- (void)setShowSecondsCell:(id)a3
{
  objc_storeStrong((id *)&self->_showSecondsCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showSecondsCell, 0);
  objc_storeStrong((id *)&self->_monogramEditCell, 0);
  objc_storeStrong((id *)&self->_monogramCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
