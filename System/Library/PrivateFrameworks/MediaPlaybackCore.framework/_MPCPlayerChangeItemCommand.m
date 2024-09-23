@implementation _MPCPlayerChangeItemCommand

- (id)previousItem
{
  MPCPlayerCommandRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MPCPlayerCommandRequest *v8;
  void *v9;
  void *v10;
  void *v11;

  if ((self->_changeItemSupport & 2) != 0)
  {
    -[_MPCPlayerCommand response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tracklist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE65928]);
    v8 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v8, "initWithMediaRemoteCommand:options:controller:label:", 5, v4, v9, v11);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)nextItem
{
  MPCPlayerCommandRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MPCPlayerCommandRequest *v8;
  void *v9;
  void *v10;
  void *v11;

  if ((self->_changeItemSupport & 0x10) != 0)
  {
    -[_MPCPlayerCommand response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tracklist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE65928]);
    v8 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v8, "initWithMediaRemoteCommand:options:controller:label:", 4, v4, v9, v11);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_MPCPlayerChangeItemCommand)initWithResponse:(id)a3 changeItemSupport:(unint64_t)a4
{
  _MPCPlayerChangeItemCommand *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MPCPlayerChangeItemCommand;
  result = -[_MPCPlayerCommand initWithResponse:](&v6, sel_initWithResponse_, a3);
  if (result)
    result->_changeItemSupport = a4;
  return result;
}

- (id)previousSection
{
  MPCPlayerCommandRequest *v2;
  void *v3;
  MPCPlayerCommandRequest *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((self->_changeItemSupport & 4) != 0)
  {
    -[_MPCPlayerCommand response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v4, "initWithMediaRemoteCommand:options:controller:label:", 110, 0, v5, v7);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)previousChapter
{
  MPCPlayerCommandRequest *v2;
  void *v3;
  MPCPlayerCommandRequest *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((self->_changeItemSupport & 8) != 0)
  {
    -[_MPCPlayerCommand response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v4, "initWithMediaRemoteCommand:options:controller:label:", 101, 0, v5, v7);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)nextSection
{
  MPCPlayerCommandRequest *v2;
  void *v3;
  MPCPlayerCommandRequest *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((self->_changeItemSupport & 0x20) != 0)
  {
    -[_MPCPlayerCommand response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v4, "initWithMediaRemoteCommand:options:controller:label:", 109, 0, v5, v7);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)nextChapter
{
  MPCPlayerCommandRequest *v2;
  void *v3;
  MPCPlayerCommandRequest *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((self->_changeItemSupport & 0x40) != 0)
  {
    -[_MPCPlayerCommand response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v4, "initWithMediaRemoteCommand:options:controller:label:", 100, 0, v5, v7);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)previousItemDeferringToPlaybackQueuePosition
{
  void *v4;
  void *v5;
  MPCPlayerCommandRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  MPCPlayerCommandRequest *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if ((self->_changeItemSupport & 2) == 0)
    return 0;
  v11 = *MEMORY[0x24BE659A0];
  v12[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerCommand response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v5, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v6, "initWithMediaRemoteCommand:options:controller:label:", 5, v4, v7, v9);

  return v10;
}

- (id)changeToSection:(id)a3
{
  return 0;
}

- (id)changeToItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MPCPlayerCommandRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MPCPlayerCommandRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((self->_changeItemSupport & 0x80) == 0)
    goto LABEL_3;
  -[_MPCPlayerCommand response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 == v6;

  -[_MPCPlayerCommand response](self, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "builder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerCommand response](self, "response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "playerItemShouldDisableJumpToItem:atIndexPath:boundsCheck:chain:", 0, v10, v7, v12);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "metadataObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentItemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
    {
      v24 = *MEMORY[0x24BE658D0];
      v25[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCPlayerCommand response](self, "response");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = [MPCPlayerCommandRequest alloc];
      objc_msgSend(v18, "controller");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "request");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v19, "initWithMediaRemoteCommand:options:controller:label:", 131, v17, v20, v22);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
LABEL_3:
    v13 = 0;
  }

  return v13;
}

- (unint64_t)changeItemSupport
{
  return self->_changeItemSupport;
}

@end
