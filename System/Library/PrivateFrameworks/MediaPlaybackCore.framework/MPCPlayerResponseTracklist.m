@implementation MPCPlayerResponseTracklist

- (MPSectionedCollection)items
{
  return self->_items;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (MPCPlayerResponseTracklist)initWithResponse:(id)a3
{
  id v4;
  MPCPlayerResponseTracklist *v5;
  MPCPlayerResponseTracklist *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *uniqueIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSIndexPath *playingItemIndexPath;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _MPCPlayerResponseTracklistDataSource *v32;
  uint64_t v33;
  MPSectionedCollection *items;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _MPCPlayerResponseTracklistDisplayDataSource *v40;
  uint64_t v41;
  MPSectionedCollection *displayItems;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)MPCPlayerResponseTracklist;
  v5 = -[MPCPlayerResponseTracklist init](&v44, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_response, v4);
    objc_msgSend(v4, "builder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tracklistUniqueIdentifier:chain:", CFSTR("<missing queue identifier>"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v9;

    objc_msgSend(v4, "builder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_lastChangeDirection = objc_msgSend(v11, "playerLastChangeDirection:chain:", 0, v12);

    objc_msgSend(v4, "builder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playerPlayingItemIndexPath:chain:", 0, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    playingItemIndexPath = v6->_playingItemIndexPath;
    v6->_playingItemIndexPath = (NSIndexPath *)v15;

    objc_msgSend(v4, "builder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_playingItemGlobalIndex = objc_msgSend(v17, "playerPlayingItemGlobalIndex:chain:", 0, v18);

    objc_msgSend(v4, "builder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_globalItemCount = objc_msgSend(v19, "playerGlobalItemCount:chain:", 0, v20);

    objc_msgSend(v4, "builder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_upNextItemCount = objc_msgSend(v21, "playerUpNextItemCount:chain:", 0, v22);

    objc_msgSend(v4, "builder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_explicitContentState = objc_msgSend(v23, "playerExplicitContentState:chain:", 0, v24);

    objc_msgSend(v4, "builder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_repeatType = objc_msgSend(v25, "playerRepeatType:chain:", 0, v26);

    objc_msgSend(v4, "builder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_shuffleType = objc_msgSend(v27, "playerShuffleType:chain:", 0, v28);

    objc_msgSend(v4, "builder");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_actionAtQueueEnd = objc_msgSend(v29, "playerQueueEndAction:chain:", 1, v30);

    v31 = objc_alloc(MEMORY[0x24BDDC768]);
    v32 = -[_MPCPlayerResponseTracklistDataSource initWithResponse:playingItemIndexPath:]([_MPCPlayerResponseTracklistDataSource alloc], "initWithResponse:playingItemIndexPath:", v4, v6->_playingItemIndexPath);
    v33 = objc_msgSend(v31, "initWithDataSource:", v32);
    items = v6->_items;
    v6->_items = (MPSectionedCollection *)v33;

    objc_msgSend(v4, "builder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chain");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "tracklistProperties:chain:", MEMORY[0x24BDBD1B8], v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("tailInsertionContentItemID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc(MEMORY[0x24BDDC768]);
    v40 = -[_MPCPlayerResponseTracklistDisplayDataSource initWithResponse:tracklistItems:playingItemIndexPath:tailInsertionContentItemID:]([_MPCPlayerResponseTracklistDisplayDataSource alloc], "initWithResponse:tracklistItems:playingItemIndexPath:tailInsertionContentItemID:", v4, v6->_items, v6->_playingItemIndexPath, v38);
    v41 = objc_msgSend(v39, "initWithDataSource:", v40);
    displayItems = v6->_displayItems;
    v6->_displayItems = (MPSectionedCollection *)v41;

  }
  return v6;
}

- (unint64_t)_determineChangeItemSupport
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  unint64_t v25;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandEnabled:command:chain:", 0, 5, v4);

  if (v5)
    v6 = 2;
  else
    v6 = 0;
  objc_msgSend(WeakRetained, "builder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "playerCommandEnabled:command:chain:", 0, 110, v8);

  if (v9)
    v6 |= 4uLL;
  objc_msgSend(WeakRetained, "builder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "playerCommandEnabled:command:chain:", 0, 101, v11);

  if (v12)
    v6 |= 8uLL;
  objc_msgSend(WeakRetained, "builder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "playerCommandEnabled:command:chain:", 0, 4, v14);

  if (v15)
    v6 |= 0x10uLL;
  objc_msgSend(WeakRetained, "builder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "playerCommandEnabled:command:chain:", 0, 109, v17);

  if (v18)
    v6 |= 0x20uLL;
  objc_msgSend(WeakRetained, "builder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "playerCommandEnabled:command:chain:", 0, 100, v20);

  if (v21)
    v6 |= 0x40uLL;
  objc_msgSend(WeakRetained, "builder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "playerCommandEnabled:command:chain:", 0, 131, v23);

  if (v24)
    v25 = v6 | 0x80;
  else
    v25 = v6;

  return v25;
}

- (MPCPlayerResponseItem)playingItem
{
  void *v2;

  if (self->_playingItemIndexPath)
  {
    -[MPSectionedCollection itemAtIndexPath:](self->_items, "itemAtIndexPath:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (MPCPlayerResponseItem *)v2;
}

- (NSIndexPath)playingItemIndexPath
{
  return self->_playingItemIndexPath;
}

- (id)changeItemCommand
{
  unint64_t changeItemSupport;
  _MPCPlayerChangeItemCommand *v4;
  _MPCPlayerChangeItemCommand *v5;
  id WeakRetained;

  changeItemSupport = self->_changeItemSupport;
  if ((changeItemSupport & 1) == 0)
  {
    changeItemSupport = -[MPCPlayerResponseTracklist _determineChangeItemSupport](self, "_determineChangeItemSupport");
    self->_changeItemSupport = changeItemSupport;
  }
  if (changeItemSupport == 1)
  {
    v4 = 0;
  }
  else
  {
    v5 = [_MPCPlayerChangeItemCommand alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    v4 = -[_MPCPlayerChangeItemCommand initWithResponse:changeItemSupport:](v5, "initWithResponse:changeItemSupport:", WeakRetained, self->_changeItemSupport);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_playingItemIndexPath, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_response);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (id)resetCommand
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  _MPCPlayerResetTracklistCommand *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandEnabled:command:chain:", 0, 122, v4);

  if (v5)
  {
    v6 = -[_MPCPlayerCommand initWithResponse:]([_MPCPlayerResetTracklistCommand alloc], "initWithResponse:", WeakRetained);
    -[_MPCPlayerResetTracklistCommand setSupportsSetQueueCommand:](v6, "setSupportsSetQueueCommand:", 1);
    objc_msgSend(WeakRetained, "builder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE65698];
    objc_msgSend(WeakRetained, "chain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDBD1B8];
    objc_msgSend(v7, "playerCommandOptionValue:forKey:command:chain:", MEMORY[0x24BDBD1B8], v8, 122, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = v11;
    else
      v13 = v10;
    -[_MPCPlayerResetTracklistCommand setSupportedSpecializedQueues:](v6, "setSupportedSpecializedQueues:", v13);

    objc_msgSend(WeakRetained, "builder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BE656B0];
    objc_msgSend(WeakRetained, "chain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDBD1A8];
    objc_msgSend(v14, "playerCommandOptionValue:forKey:command:chain:", MEMORY[0x24BDBD1A8], v15, 122, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = v17;
    v21 = v20;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlayerResetTracklistCommand setSupportedQueueTypes:](v6, "setSupportedQueueTypes:", v22);

    objc_msgSend(WeakRetained, "builder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x24BE656A0];
    objc_msgSend(WeakRetained, "chain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "playerCommandOptionValue:forKey:command:chain:", v17, v24, 122, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = v17;
    v29 = v28;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MPCPlayerResetTracklistCommand setSupportedCustomDataQueueIdentifiers:](v6, "setSupportedCustomDataQueueIdentifiers:", v30);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)structuredIndexPathForDisplayIndexPath:(id)a3
{
  MPSectionedCollection *displayItems;
  id v4;
  void *v5;
  void *v6;

  displayItems = self->_displayItems;
  v4 = a3;
  -[MPSectionedCollection dataSource](displayItems, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "structuredIndexPathForDisplayIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayIndexPathForStructuredIndexPath:(id)a3
{
  MPSectionedCollection *displayItems;
  id v4;
  void *v5;
  void *v6;

  displayItems = self->_displayItems;
  v4 = a3;
  -[MPSectionedCollection dataSource](displayItems, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIndexPathForStructuredIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)representativeSectionForDisplaySection:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  MPSectionedCollection *displayItems;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("MPCPlayerResponseTracklistDisplaySectionNextItems")
    || (v6 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("MPCPlayerResponseTracklistDisplaySectionNextItems")),
        v5,
        v6))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    displayItems = self->_displayItems;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __69__MPCPlayerResponseTracklist_representativeSectionForDisplaySection___block_invoke;
    v10[3] = &unk_24CAB6508;
    v10[4] = self;
    v10[5] = &v11;
    -[MPSectionedCollection enumerateSectionsUsingBlock:](displayItems, "enumerateSectionsUsingBlock:", v10);
    if (v12[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      -[MPSectionedCollection sectionAtIndex:](self->_items, "sectionAtIndex:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)insertCommand
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  _MPCPlayerInsertItemsCommand *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
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
  MPCPlayerResponseSection *v40;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandEnabled:command:chain:", 0, 125, v4);

  objc_msgSend(WeakRetained, "builder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "playerCommandEnabled:command:chain:", 0, 121, v7);

  if ((v5 & 1) != 0 || v8)
  {
    v9 = -[_MPCPlayerCommand initWithResponse:]([_MPCPlayerInsertItemsCommand alloc], "initWithResponse:", WeakRetained);
    if (!v5)
      goto LABEL_18;
  }
  else
  {
    v9 = 0;
    if (!v5)
      goto LABEL_18;
  }
  objc_msgSend(WeakRetained, "builder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE656A8];
  objc_msgSend(WeakRetained, "chain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDBD1A8];
  objc_msgSend(v10, "playerCommandOptionValue:forKey:command:chain:", MEMORY[0x24BDBD1A8], v11, 125, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v13;
  v17 = v16;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerInsertItemsCommand setSupportedInsertionPositions:](v9, "setSupportedInsertionPositions:", v18);

  objc_msgSend(WeakRetained, "builder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE656B0];
  objc_msgSend(WeakRetained, "chain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "playerCommandOptionValue:forKey:command:chain:", v13, v20, 125, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (void *)v22;
  else
    v24 = v13;
  v25 = v24;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerInsertItemsCommand setSupportedQueueTypes:](v9, "setSupportedQueueTypes:", v26);

  objc_msgSend(WeakRetained, "builder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x24BE656A0];
  objc_msgSend(WeakRetained, "chain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "playerCommandOptionValue:forKey:command:chain:", v13, v28, 125, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
    v32 = (void *)v30;
  else
    v32 = v13;
  v33 = v32;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlayerInsertItemsCommand setSupportedCustomDataQueueIdentifiers:](v9, "setSupportedCustomDataQueueIdentifiers:", v34);
  objc_msgSend(WeakRetained, "builder");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "queueSectionProperties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "lastSectionModelObject:propertySet:chain:", 0, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = -[MPCPlayerResponseSection initWithModelGenericObject:sectionIndex:response:]([MPCPlayerResponseSection alloc], "initWithModelGenericObject:sectionIndex:response:", v39, 0x7FFFFFFFFFFFFFFFLL, WeakRetained);
    -[_MPCPlayerInsertItemsCommand setLastSection:](v9, "setLastSection:", v40);

  }
LABEL_18:
  if (v8)
    -[_MPCPlayerInsertItemsCommand setSupportsCreateStation:](v9, "setSupportsCreateStation:", 1);

  return v9;
}

- (id)reorderCommand
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  _MPCPlayerReorderItemsCommand *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandEnabled:command:chain:", 0, 130, v4);

  if (v5)
    v6 = -[_MPCPlayerCommand initWithResponse:]([_MPCPlayerReorderItemsCommand alloc], "initWithResponse:", WeakRetained);
  else
    v6 = 0;

  return v6;
}

- (id)repeatCommand
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _MPCPlayerRepeatCommand *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "playerCommandEnabled:command:chain:", 0, 25, v5);

  objc_msgSend(WeakRetained, "builder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "playerCommandEnabled:command:chain:", 0, 7, v8);

  if ((v6 & 1) != 0 || (_DWORD)v9)
  {
    v10 = -[_MPCPlayerCommand initWithResponse:]([_MPCPlayerRepeatCommand alloc], "initWithResponse:", WeakRetained);
    -[_MPCPlayerRepeatCommand setCurrentRepeatType:](v10, "setCurrentRepeatType:", -[MPCPlayerResponseTracklist repeatType](self, "repeatType"));
    -[_MPCPlayerRepeatCommand setSupportsChangeRepeat:](v10, "setSupportsChangeRepeat:", v6);
    -[_MPCPlayerRepeatCommand setSupportsAdvanceRepeat:](v10, "setSupportsAdvanceRepeat:", v9);
    objc_msgSend(WeakRetained, "builder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE656D8];
    objc_msgSend(WeakRetained, "chain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB17410, v12, 25, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = &unk_24CB17410;
    -[_MPCPlayerRepeatCommand setSupportedRepeatTypes:](v10, "setSupportedRepeatTypes:", v16);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)shuffleCommand
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _MPCPlayerShuffleCommand *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "playerCommandEnabled:command:chain:", 0, 26, v5);

  objc_msgSend(WeakRetained, "builder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "playerCommandEnabled:command:chain:", 0, 6, v8);

  if ((v6 & 1) != 0 || (_DWORD)v9)
  {
    v10 = -[_MPCPlayerCommand initWithResponse:]([_MPCPlayerShuffleCommand alloc], "initWithResponse:", WeakRetained);
    -[_MPCPlayerShuffleCommand setCurrentShuffleType:](v10, "setCurrentShuffleType:", -[MPCPlayerResponseTracklist shuffleType](self, "shuffleType"));
    -[_MPCPlayerShuffleCommand setSupportsChangeShuffle:](v10, "setSupportsChangeShuffle:", v6);
    -[_MPCPlayerShuffleCommand setSupportsAdvanceShuffle:](v10, "setSupportsAdvanceShuffle:", v9);
    objc_msgSend(WeakRetained, "builder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE656E0];
    objc_msgSend(WeakRetained, "chain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB17428, v12, 26, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = &unk_24CB17428;
    -[_MPCPlayerShuffleCommand setSupportedShuffleTypes:](v10, "setSupportedShuffleTypes:", v16);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionAtQueueEndCommand
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  _MPCPlayerActionAtQueueEndCommand *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "playerCommandEnabled:command:chain:", 0, 135, v5);

  if (v6)
  {
    v7 = -[_MPCPlayerCommand initWithResponse:]([_MPCPlayerActionAtQueueEndCommand alloc], "initWithResponse:", WeakRetained);
    -[_MPCPlayerActionAtQueueEndCommand setActionAtQueueEnd:](v7, "setActionAtQueueEnd:", -[MPCPlayerResponseTracklist actionAtQueueEnd](self, "actionAtQueueEnd"));
    objc_msgSend(WeakRetained, "builder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE656D0];
    objc_msgSend(WeakRetained, "chain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerCommandOptionValue:forKey:command:chain:", &unk_24CB17440, v9, 135, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = &unk_24CB17440;
    -[_MPCPlayerActionAtQueueEndCommand setSupportedActions:](v7, "setSupportedActions:", v13);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)prepareVocalsControlCommand
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  _MPCPrepareVocalsControlCommand *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandEnabled:command:chain:", 0, 143, v4);

  if (v5)
    v6 = -[_MPCPlayerCommand initWithResponse:]([_MPCPrepareVocalsControlCommand alloc], "initWithResponse:", WeakRetained);
  else
    v6 = 0;

  return v6;
}

- (id)vocalsControlCommand
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _MPCVocalsControlCommand *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandSupported:command:chain:", 0, 142, v4);

  if (v5)
  {
    objc_msgSend(WeakRetained, "builder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "chain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "playerCommandEnabled:command:chain:", 0, 142, v7);

    objc_msgSend(WeakRetained, "builder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "chain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "playerCommandDisabledReason:command:chain:", 0, 142, v10);

    if ((v8 & 1) != 0 || (v12 = 0, v11))
    {
      v12 = -[_MPCPlayerCommand initWithResponse:]([_MPCVocalsControlCommand alloc], "initWithResponse:", WeakRetained);
      -[_MPCVocalsControlCommand setDisabled:](v12, "setDisabled:", v8 ^ 1u);
      if (-[_MPCVocalsControlCommand isDisabled](v12, "isDisabled"))
        -[_MPCVocalsControlCommand setDisabledReason:](v12, "setDisabledReason:", v11);
      objc_msgSend(WeakRetained, "builder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "chain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCVocalsControlCommand setActive:](v12, "setActive:", objc_msgSend(v13, "playerVocalsControlActive:chain:", 0, v14));

      objc_msgSend(WeakRetained, "builder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "chain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = 0;
      objc_msgSend(v15, "playerVocalsLevel:chain:", v16, v17);
      -[_MPCVocalsControlCommand setLevel:](v12, "setLevel:");

      objc_msgSend(WeakRetained, "builder");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "chain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 0;
      objc_msgSend(v18, "playerMinVocalsLevel:chain:", v19, v20);
      -[_MPCVocalsControlCommand setMinLevel:](v12, "setMinLevel:");

      objc_msgSend(WeakRetained, "builder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "chain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = 0;
      objc_msgSend(v21, "playerMaxVocalsLevel:chain:", v22, v23);
      -[_MPCVocalsControlCommand setMaxLevel:](v12, "setMaxLevel:");

      objc_msgSend(WeakRetained, "builder");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "chain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCVocalsControlCommand setContinuous:](v12, "setContinuous:", objc_msgSend(v24, "playerVocalsControlContinuous:chain:", 1, v25));

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)sleepTimerCommand
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _MPCSleepTimerCommand *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerCommandSupported:command:chain:", 0, 124, v4);

  if (v5)
  {
    objc_msgSend(WeakRetained, "builder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "chain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "playerCommandEnabled:command:chain:", 0, 124, v7);

    objc_msgSend(WeakRetained, "builder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "chain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "playerCommandDisabledReason:command:chain:", 0, 124, v10);

    if ((v8 & 1) != 0 || (v12 = 0, v11))
    {
      v12 = -[_MPCPlayerCommand initWithResponse:]([_MPCSleepTimerCommand alloc], "initWithResponse:", WeakRetained);
      -[_MPCSleepTimerCommand setDisabled:](v12, "setDisabled:", v8 ^ 1u);
      if (-[_MPCSleepTimerCommand isDisabled](v12, "isDisabled"))
        -[_MPCSleepTimerCommand setDisabledReason:](v12, "setDisabledReason:", v11);
      objc_msgSend(WeakRetained, "builder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "chain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "playerSleepTimerTime:chain:", v14, 0.0);
      -[_MPCSleepTimerCommand setTime:](v12, "setTime:");

      objc_msgSend(WeakRetained, "builder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "chain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "playerSleepTimerFireDate:chain:", v16, 0.0);
      -[_MPCSleepTimerCommand setFireDate:](v12, "setFireDate:");

      objc_msgSend(WeakRetained, "builder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "chain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCSleepTimerCommand setStopMode:](v12, "setStopMode:", objc_msgSend(v17, "playerSleepTimerStopMode:chain:", 0, v18));

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_stateDumpObject
{
  int64_t lastChangeDirection;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  lastChangeDirection = self->_lastChangeDirection;
  v10[0] = self->_uniqueIdentifier;
  v9[0] = CFSTR("uniqueID");
  v9[1] = CFSTR("lastChangeDirection");
  if ((unint64_t)(lastChangeDirection + 1) > 6)
    v3 = CFSTR("MPCPlayerDirectionReverseJump");
  else
    v3 = off_24CAB6528[lastChangeDirection + 1];
  v10[1] = v3;
  v9[2] = CFSTR("playingItem");
  -[MPCPlayerResponseTracklist playingItem](self, "playingItem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("<NONE>");
  if (v4)
    v6 = (const __CFString *)v4;
  v10[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)lastChangeDirection
{
  return self->_lastChangeDirection;
}

- (int64_t)upNextItemCount
{
  return self->_upNextItemCount;
}

- (int64_t)explicitContentState
{
  return self->_explicitContentState;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (int64_t)actionAtQueueEnd
{
  return self->_actionAtQueueEnd;
}

- (MPCPlayerResponse)response
{
  return (MPCPlayerResponse *)objc_loadWeakRetained((id *)&self->_response);
}

- (MPSectionedCollection)displayItems
{
  return self->_displayItems;
}

- (int64_t)playingItemGlobalIndex
{
  return self->_playingItemGlobalIndex;
}

- (int64_t)globalItemCount
{
  return self->_globalItemCount;
}

void __69__MPCPlayerResponseTracklist_representativeSectionForDisplaySection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  __CFString *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;

  v7 = a2;
  v15 = v7;
  if (v7 == CFSTR("MPCPlayerResponseTracklistDisplaySectionNextItems")
    || (v8 = -[__CFString isEqual:](v7, "isEqual:", CFSTR("MPCPlayerResponseTracklistDisplaySectionNextItems")),
        v15,
        v9 = v15,
        v8))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "numberOfItemsInSection:", a3) - 1, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "structuredIndexPathForDisplayIndexPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "structuredIndexPathForDisplayIndexPath:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "section");
    if (v14 == objc_msgSend(v13, "section"))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v12, "section");
      *a4 = 1;
    }

    v9 = v15;
  }

}

+ (id)resetCommandForPlayerPath:(id)a3 devices:(id)a4
{
  id v5;
  id v6;
  _MPCPlayerResetTracklistCommand *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_MPCPlayerCommand initWithPlayerPath:]([_MPCPlayerResetTracklistCommand alloc], "initWithPlayerPath:", v6);

  -[_MPCPlayerResetTracklistCommand setDevices:](v7, "setDevices:", v5);
  return v7;
}

+ (id)insertCommandForPlayerPath:(id)a3 devices:(id)a4
{
  id v5;
  id v6;
  _MPCPlayerInsertItemsCommand *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_MPCPlayerCommand initWithPlayerPath:]([_MPCPlayerInsertItemsCommand alloc], "initWithPlayerPath:", v6);

  -[_MPCPlayerInsertItemsCommand setDevices:](v7, "setDevices:", v5);
  return v7;
}

@end
