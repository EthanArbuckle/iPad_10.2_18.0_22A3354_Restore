@implementation _MPCPlayerResponseTracklistDataSource

- (_MPCPlayerResponseTracklistDataSource)initWithResponse:(id)a3 playingItemIndexPath:(id)a4
{
  id v6;
  id v7;
  _MPCPlayerResponseTracklistDataSource *v8;
  _MPCPlayerResponseTracklistDataSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MPCPlayerResponseTracklistDataSource;
  v8 = -[_MPCPlayerResponseTracklistDataSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_response, v6);
    objc_storeStrong((id *)&v9->_playingItemIndexPath, a4);
  }

  return v9;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MPCPlayerResponseItem *v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queueItemProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlayerResponseTracklistDataSource playingItemIndexPath](self, "playingItemIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(WeakRetained, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playingItemProperties");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  objc_msgSend(WeakRetained, "builder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerModelObject:propertySet:atIndexPath:chain:", 0, v7, v4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "builder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "participant:atIndexPath:chain:", 0, v4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlayerResponseTracklistDataSource _responseParticipantForParticipantItem:](self, "_responseParticipantForParticipantItem:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MPCPlayerResponseItem initWithModelGenericObject:indexPath:enqueueingParticipant:response:]([MPCPlayerResponseItem alloc], "initWithModelGenericObject:indexPath:enqueueingParticipant:response:", v14, v4, v18, WeakRetained);

  return v19;
}

- (NSIndexPath)playingItemIndexPath
{
  return self->_playingItemIndexPath;
}

- (id)_responseParticipantForParticipantItem:(id)a3
{
  id v4;
  MPCPlayerResponseParticipant *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;
  MPCPlayerResponseParticipant *v11;

  if (a3)
  {
    v4 = a3;
    v5 = [MPCPlayerResponseParticipant alloc];
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "participantIdentifierType");
    objc_msgSend(v4, "participantIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_response);
    v11 = -[MPCPlayerResponseParticipant initWithIdentifier:identifierType:participantIdentifier:displayName:response:](v5, "initWithIdentifier:identifierType:participantIdentifier:displayName:response:", v6, v7, v8, v9, WeakRetained);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingItemIndexPath, 0);
  objc_destroyWeak((id *)&self->_response);
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "playerNumberOfItems:inSection:chain:", 0, a3, v6);

  return v7;
}

- (unint64_t)numberOfSections
{
  id WeakRetained;
  void *v3;
  void *v4;
  unint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "chain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "playerNumberOfSections:chain:", 0, v4);

  return v5;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MPCPlayerResponseSection *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_response);
  objc_msgSend(WeakRetained, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueSectionProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "builder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "chain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerModelObject:propertySet:atIndexPath:chain:", 0, v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[MPCPlayerResponseSection initWithModelGenericObject:sectionIndex:response:]([MPCPlayerResponseSection alloc], "initWithModelGenericObject:sectionIndex:response:", v10, a3, WeakRetained);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (MPCPlayerResponse)response
{
  return (MPCPlayerResponse *)objc_loadWeakRetained((id *)&self->_response);
}

- (void)setPlayingItemIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_playingItemIndexPath, a3);
}

@end
