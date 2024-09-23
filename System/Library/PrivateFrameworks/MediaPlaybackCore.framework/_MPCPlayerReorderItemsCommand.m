@implementation _MPCPlayerReorderItemsCommand

- (BOOL)canMoveItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[_MPCPlayerCommand response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "builder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "chain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "playerItemEditingStyleFlags:atIndexPath:chain:", 0, v7, v8);

  return v9 & 1;
}

- (id)limitedIndexPathForMovingIndexPath:(id)a3 toProprosedIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    v8 = v6;
  }
  else
  {
    -[_MPCPlayerCommand response](self, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tracklist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayIndexPathForStructuredIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "tracklist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayIndexPathForStructuredIndexPath:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MPCPlayerReorderItemsCommand limitedDisplayIndexPathForMovingIndexPath:toProprosedIndexPath:](self, "limitedDisplayIndexPathForMovingIndexPath:toProprosedIndexPath:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tracklist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "structuredIndexPathForDisplayIndexPath:", v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)limitedDisplayIndexPathForMovingIndexPath:(id)a3 toProprosedIndexPath:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v35;
  SEL v36;
  _MPCPlayerReorderItemsCommand *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isEqual:", v8))
  {
    v9 = v7;
  }
  else
  {
    v36 = a2;
    v37 = self;
    -[_MPCPlayerCommand response](self, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tracklist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "globalIndexForIndexPath:", v7);

    objc_msgSend(v10, "tracklist");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v8;
    v16 = objc_msgSend(v15, "globalIndexForIndexPath:", v8);

    v39 = v7;
    v41 = objc_msgSend(v7, "section");
    if (v16 > v13)
      v17 = 1;
    else
      v17 = -1;
    v18 = -1;
    if (v16 <= v13)
      v18 = 1;
    v38 = v18;
    if (v16 <= v13 || v13 <= v16)
    {
      v20 = v13;
      while (1)
      {
        objc_msgSend(v10, "tracklist");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "items");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "indexPathForGlobalIndex:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "builder");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "chain");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "playerItemEditingStyleFlags:atIndexPath:chain:", 0, v23, v25);

        objc_msgSend(v10, "tracklist");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "displayItems");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "indexPathForGlobalIndex:", v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_msgSend(v29, "section");
        if ((v26 & 1) == 0 || v41 != v30)
          break;

        v20 += v17;
        if (v16 <= v13)
          v31 = v20 >= v16;
        else
          v31 = v20 <= v16;
        if (!v31)
          goto LABEL_19;
      }
      objc_msgSend(v10, "tracklist");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "displayItems");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "indexPathForGlobalIndex:", v20 + v38);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v36, v37, CFSTR("MPCPlayerResponseTracklist.m"), 1052, CFSTR("Invalid section collection (2)."));

      }
      v8 = v40;
    }
    else
    {
LABEL_19:
      v8 = v40;
      v9 = v40;
    }

    v7 = v39;
  }

  return v9;
}

- (id)moveItem:(id)a3 afterItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  MPCPlayerCommandRequest *v26;
  void *v28;
  MPCPlayerCommandRequest *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlayerCommand response](self, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tracklist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayIndexPathForStructuredIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tracklist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayIndexPathForStructuredIndexPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  -[_MPCPlayerReorderItemsCommand limitedDisplayIndexPathForMovingIndexPath:toProprosedIndexPath:](self, "limitedDisplayIndexPathForMovingIndexPath:toProprosedIndexPath:", v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqual:", v15))
  {
    objc_msgSend(v6, "metadataObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentItemID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "metadataObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentItemID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "length") && objc_msgSend(v22, "length"))
    {
      v23 = *MEMORY[0x24BE65908];
      v32[0] = *MEMORY[0x24BE658D0];
      v32[1] = v23;
      v33[0] = v19;
      v33[1] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = [MPCPlayerCommandRequest alloc];
      objc_msgSend(v8, "controller");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "request");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "label");
      v30 = v19;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v29, "initWithMediaRemoteCommand:options:controller:label:", 130, v31, v28, v25);

      v19 = v30;
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)moveItem:(id)a3 beforeItem:(id)a4
{
  id v6;
  id v7;
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  MPCPlayerCommandRequest *v38;
  void *v39;
  void *v40;
  void *v41;
  MPCPlayerCommandRequest *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_MPCPlayerCommand response](self, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerReorderItemsCommand limitedIndexPathForMovingIndexPath:toProprosedIndexPath:](self, "limitedIndexPathForMovingIndexPath:toProprosedIndexPath:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "indexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "isEqual:", v12);

  if ((_DWORD)v10)
  {
    objc_msgSend(v6, "metadataObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentItemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "metadataObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentItemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length") && objc_msgSend(v18, "length"))
    {
      v19 = (void *)MEMORY[0x24BDBCED8];
      v20 = *MEMORY[0x24BE65910];
      v48[0] = *MEMORY[0x24BE658D0];
      v48[1] = v20;
      v45 = v18;
      v46 = v15;
      v49[0] = v15;
      v49[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dictionaryWithDictionary:", v21);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "tracklist");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "items");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tracklist");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "items");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "totalItemCount") - 1;

      objc_msgSend(v8, "tracklist");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "items");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "indexPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "globalIndexForIndexPath:", v28) - 1;

      if (v25 >= v29)
        v30 = v29;
      else
        v30 = v25;
      objc_msgSend(v22, "indexPathForGlobalIndex:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v8, "tracklist");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "items");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "itemAtIndexPath:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "metadataObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "identifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "contentItemID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v37, "length"))
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BE65908]);

      }
      v38 = [MPCPlayerCommandRequest alloc];
      objc_msgSend(v8, "controller");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "request");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "label");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v38, "initWithMediaRemoteCommand:options:controller:label:", 130, v47, v39, v41);

      v18 = v45;
      v15 = v46;
    }
    else
    {
      v42 = 0;
    }

  }
  else
  {
    v42 = 0;
  }

  return v42;
}

@end
