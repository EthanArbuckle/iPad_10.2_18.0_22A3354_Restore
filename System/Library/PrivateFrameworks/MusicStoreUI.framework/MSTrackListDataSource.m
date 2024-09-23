@implementation MSTrackListDataSource

- (BOOL)canDoubleTapIndexPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E28]), "itemList"), "itemAtIndexPath:", a3);
  v4 = (void *)objc_msgSend(v3, "defaultStoreOffer");
  if (objc_msgSend(v3, "itemType") == 1007)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = objc_msgSend((id)objc_msgSend(v4, "offerMedia"), "URL");
    if (v5)
    {
      v6 = (void *)objc_msgSend(v3, "firstItemLinkForType:", 0);
      v7 = (void *)objc_msgSend(v3, "itemMediaKind");
      LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB2728]);
      if ((_DWORD)v5)
        LOBYTE(v5) = objc_msgSend(v6, "URL") != 0;
    }
  }
  return v5;
}

- (BOOL)canShowPreviewForItem:(id)a3
{
  void *v4;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "itemMediaKind");
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB2710]) & 1) != 0)
    return 0;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "defaultStoreOffer"), "actionType");
  return objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEB2738]) ^ 1;
}

- (BOOL)canShowItemOfferButtonForItem:(id)a3
{
  return 1;
}

- (Class)cellConfigurationClassForItem:(id)a3
{
  objc_msgSend(a3, "itemType");
  return (Class)objc_opt_class();
}

- (id)cellConfigurationForIndex:(int64_t)a3 item:(id)a4
{
  id v5;
  _QWORD v7[4];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSTrackListDataSource;
  v5 = -[SUStructuredPageTableDataSource cellConfigurationForIndex:item:](&v8, sel_cellConfigurationForIndex_item_, a3, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7[0] = a3;
    v7[1] = 0x7FFFFFFFFFFFFFFFLL;
    v7[2] = a3;
    v7[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v5, "setPosition:", v7);
  }
  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  id result;
  objc_super v6;

  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E28]), "itemList"), "itemAtIndexPath:", a3), "itemType") == 2)
  {
    result = (id)objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource"), "dequeueReusableCellWithIdentifier:", CFSTR("ms0"));
    if (!result)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8D30]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ms0"));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MSTrackListDataSource;
    return -[SUStructuredPageTableDataSource cellForIndexPath:](&v6, sel_cellForIndexPath_, a3);
  }
  return result;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSTrackListDataSource;
  -[MSStructuredPageTableDataSource configureCell:forIndexPath:](&v7, sel_configureCell_forIndexPath_);
  if ((objc_msgSend(a4, "row") & 1) != 0)
    v6 = MSGetTrackListOddRowColor();
  else
    v6 = MSGetTrackListEvenRowColor();
  objc_msgSend(a3, "setBackgroundColor:", v6);
}

- (void)configurePlaceholderCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v6;

  objc_msgSend(a3, "setConfiguration:", 0);
  if ((objc_msgSend(a4, "row") & 1) != 0)
    v6 = MSGetTrackListOddRowColor();
  else
    v6 = MSGetTrackListEvenRowColor();
  objc_msgSend(a3, "setBackgroundColor:", v6);
}

- (id)headerViewForSection:(int64_t)a3
{
  return 0;
}

- (double)heightForPlaceholderCells
{
  double result;

  +[MSTrackListCellConfiguration rowHeightForContext:representedObject:](MSTrackListCellConfiguration, "rowHeightForContext:representedObject:", 0, 0);
  return result;
}

- (void)reloadCellContexts
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)MSTrackListDataSource;
  -[SUStructuredPageGroupedTableDataSource reloadCellContexts](&v28, sel_reloadCellContexts);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEC8E28]), "itemList"), "copyItems");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v25;
    v10 = 1;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "itemType");
        switch(v13)
        {
          case 11:
            goto LABEL_12;
          case 1007:
            v10 = 0;
LABEL_12:
            v8 = 1;
            goto LABEL_13;
          case 1009:
            v14 = objc_msgSend((id)objc_msgSend(v12, "contentRating"), "ratingLabel");
            if (v14)
              objc_msgSend(v3, "addObject:", v14);
            goto LABEL_12;
        }
        if (SUItemTypeIsMediaType())
        {
          v15 = objc_msgSend(v12, "artistName");
          v10 = 0;
          if (v7)
            v8 |= objc_msgSend(v7, "isEqualToString:", v15) ^ 1;
          else
            v7 = (void *)v15;
        }
LABEL_13:
        ++v11;
      }
      while (v6 != v11);
      v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v6 = v16;
      if (!v16)
        goto LABEL_22;
    }
  }
  LOBYTE(v8) = 0;
  v10 = 1;
LABEL_22:

  v17 = (int)*MEMORY[0x24BEC8E30];
  v18 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v17), "cacheForClass:", objc_opt_class()), "cellContext");
  v19 = v18;
  if ((v10 & 1) != 0)
    v20 = 2;
  else
    v20 = 0;
  objc_msgSend(v18, "setHiddenMediaIconTypes:", v20);
  objc_msgSend(v19, "setShouldHideContentRating:", objc_msgSend(v3, "count") == 1);
  objc_msgSend(v19, "setShowSubtitle:", v8 & 1);
  v21 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v17), "cacheForClass:", objc_opt_class());
  objc_msgSend((id)objc_msgSend(v21, "cellContext"), "setStylesheet:", -[MSTrackListDataSource _stylesheetString](self, "_stylesheetString"));
  v22 = (void *)objc_msgSend(v21, "cellContext");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "applicationFrame");
  objc_msgSend(v22, "setWebViewWidth:", v23);

}

- (id)placeholderCellForIndexPath:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource", a3), "dequeueReusableCellWithIdentifier:", CFSTR("ms1"));
  if (!v3)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8DD0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ms1"));
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (int64_t)tableViewStyle
{
  return 0;
}

- (id)_stylesheetString
{
  id result;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  result = (id)_stylesheetString_sStylesheet;
  if (!_stylesheetString_sStylesheet)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_msgSend(v3, "newDataURLForResource:ofType:withMIMEType:", CFSTR("Booklet"), CFSTR("png"), CFSTR("image/png"));
    v5 = (void *)objc_msgSend(v3, "newDataURLForResource:ofType:withMIMEType:", CFSTR("Video"), CFSTR("png"), CFSTR("image/png"));
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    _stylesheetString_sStylesheet = objc_msgSend(v6, "initWithFormat:", CFSTR("body { margin: 0; padding: 11px 16px; font-family: '%@'; font-size: 12px; color: #333; line-height: 15px; }body > strong { display: block; margin-bottom: -14px; }ul { line-height: 16px; margin: 6px 0 -5px; padding: 0; list-style: none; }li { margin-bottom: 5px; padding-left: 24px; }li.booklet { background: url(\"%@\") 1px 50%% no-repeat; }li.video { background: url(\"%@\") 1px 50%% no-repeat; }"),
                                      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 0.0), "familyName"), objc_msgSend(v4, "absoluteString"), objc_msgSend(v5, "absoluteString"));

    return (id)_stylesheetString_sStylesheet;
  }
  return result;
}

@end
