@implementation _MPCPlayerResponseTracklistDisplayDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionRanges, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_playingItemIndexPath, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (_MPCPlayerResponseTracklistDisplayDataSource)initWithResponse:(id)a3 tracklistItems:(id)a4 playingItemIndexPath:(id)a5 tailInsertionContentItemID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _MPCPlayerResponseTracklistDisplayDataSource *v15;
  _MPCPlayerResponseTracklistDisplayDataSource *v16;
  uint64_t v17;
  NSIndexPath *playingItemIndexPath;
  void *v19;
  NSDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSArray *sections;
  NSArray *v68;
  NSDictionary *sectionRanges;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  _MPCPlayerResponseTracklistDisplayDataSource *v80;
  id v81;
  void *v82;
  SEL v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  objc_super v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v94.receiver = self;
  v94.super_class = (Class)_MPCPlayerResponseTracklistDisplayDataSource;
  v15 = -[_MPCPlayerResponseTracklistDisplayDataSource init](&v94, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_items, a4);
    v17 = objc_msgSend(v13, "copy");
    playingItemIndexPath = v16->_playingItemIndexPath;
    v16->_playingItemIndexPath = (NSIndexPath *)v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (v83 = a2, v21 = objc_msgSend(v12, "globalIndexForIndexPath:", v13), v21 == 0x7FFFFFFFFFFFFFFFLL))
    {
LABEL_50:

      goto LABEL_51;
    }
    v22 = v21;
    v80 = v16;
    if (v21 >= 1)
    {
      v93[0] = 0;
      v93[1] = v21;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v93, "{_MSVSignedRange=qq}");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v23, CFSTR("MPCPlayerResponseTracklistDisplaySectionPreviousItems"));

      objc_msgSend(v19, "addObject:", CFSTR("MPCPlayerResponseTracklistDisplaySectionPreviousItems"));
    }
    objc_msgSend(v11, "builder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "playerItemContentID:atIndexPath:chain:", 0, v13, v25);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = v22;
    v92[0] = v22;
    v92[1] = 1;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v92, "{_MSVSignedRange=qq}");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v26, CFSTR("MPCPlayerResponseTracklistDisplaySectionPlayingItem"));

    v82 = v19;
    objc_msgSend(v19, "addObject:", CFSTR("MPCPlayerResponseTracklistDisplaySectionPlayingItem"));
    v27 = objc_msgSend(v12, "totalItemCount");
    v81 = v12;
    v84 = v27;
    v75 = v14;
    v76 = v13;
    if (v14)
    {
      v28 = v79;
      if (v28 == v14)
      {

      }
      else
      {
        v29 = v28;
        v30 = objc_msgSend(v28, "isEqual:", v14);

        if ((v30 & 1) == 0)
        {
          v31 = v22 + 1;
          if (v22 + 1 >= v27)
            goto LABEL_54;
          v32 = v22 + 1;
          while (1)
          {
            objc_msgSend(v11, "builder");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "indexPathForGlobalIndex:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "chain");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "playerItemContentID:atIndexPath:chain:", 0, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v37 = v36;
            if (v37 == v14)
              break;
            v38 = v37;
            v39 = objc_msgSend(v14, "isEqual:", v37);

            v27 = v84;
            if ((v39 & 1) != 0)
              goto LABEL_53;
            if (v84 == ++v32)
              goto LABEL_54;
          }

          v27 = v84;
LABEL_53:
          if (v32 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_54:
            v32 = v27 - 1;
          v91[0] = v31;
          v91[1] = v32 - v77;
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v91, "{_MSVSignedRange=qq}");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v71, CFSTR("MPCPlayerResponseTracklistDisplaySectionUpNextItems"));

          objc_msgSend(v82, "addObject:", CFSTR("MPCPlayerResponseTracklistDisplaySectionUpNextItems"));
          v40 = v32;
          goto LABEL_17;
        }
      }
    }
    v32 = 0x7FFFFFFFFFFFFFFFLL;
    v40 = v22;
LABEL_17:
    v41 = 0x7FFFFFFFFFFFFFFFLL;
    v78 = v40 + 1;
    if (v40 + 1 < v27)
    {
      v42 = v40 + 1;
      do
      {
        objc_msgSend(v12, "indexPathForGlobalIndex:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "msv_section");

        objc_msgSend(v11, "builder");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "chain");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = objc_msgSend(v45, "sectionIsAutoPlaySection:atIndex:chain:", 0, v44, v46);

        v27 = v84;
        if ((_DWORD)v44)
          v47 = v42;
        else
          v47 = 0x7FFFFFFFFFFFFFFFLL;
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
          v41 = v47;
        ++v42;
      }
      while (v84 != v42);
    }
    v48 = v27 - 1;
    if (v27 - 1 != v32)
    {
      if (v41 != 0x7FFFFFFFFFFFFFFFLL)
        v48 = v41 - 1;
      v49 = v48 - v78;
      if (v49 >= 0)
      {
        v90[0] = v78;
        v90[1] = v49 + 1;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v90, "{_MSVSignedRange=qq}");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v50, CFSTR("MPCPlayerResponseTracklistDisplaySectionNextItems"));

        objc_msgSend(v82, "addObject:", CFSTR("MPCPlayerResponseTracklistDisplaySectionNextItems"));
      }
    }
    if (v41 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v89[0] = v41;
      v89[1] = v27 - v41;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v89, "{_MSVSignedRange=qq}");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v51, CFSTR("MPCPlayerResponseTracklistDisplaySectionAutoPlayItems"));

      objc_msgSend(v82, "addObject:", CFSTR("MPCPlayerResponseTracklistDisplaySectionAutoPlayItems"));
    }
    v52 = objc_msgSend(v82, "count");
    if (v52 != -[NSDictionary count](v20, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", v83, v80, CFSTR("MPCPlayerResponseTracklist.m"), 639, CFSTR("Count mismatch: sections=%@ sectionRangeMap=%@"), v82, v20);

    }
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v53 = v82;
    v54 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    if (v54)
    {
      v55 = v54;
      v56 = 0;
      v57 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v86 != v57)
            objc_enumerationMutation(v53);
          v59 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v60)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", v83, v80, CFSTR("MPCPlayerResponseTracklist.m"), 643, CFSTR("Missing section range for section: %@"), v59);

          }
          v61 = objc_msgSend(v60, "signedRangeValue");
          v63 = v62;
          if (v61 != v56)
          {
            v65 = v61;
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v74 = v65;
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", v83, v80, CFSTR("MPCPlayerResponseTracklist.m"), 645, CFSTR("Non-contiguous range detected: location=%ld expectedLocation=%ld"), v74, v56);

          }
          v56 += v63;

        }
        v55 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
      }
      while (v55);
    }
    else
    {
      v56 = 0;
    }

    v16 = v80;
    if (v56 != v84)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v83, v80, CFSTR("MPCPlayerResponseTracklist.m"), 648, CFSTR("sectionRangeMap does not include all items: sectionRangesCount=%ld / items.totalItemCount=%ld"), v56, v84);

    }
    sections = v80->_sections;
    v80->_sections = v53;
    v68 = v53;

    sectionRanges = v80->_sectionRanges;
    v80->_sectionRanges = v20;

    v20 = (NSDictionary *)v68;
    v12 = v81;
    v14 = v75;
    v13 = v76;
    v19 = v79;
    goto LABEL_50;
  }
LABEL_51:

  return v16;
}

- (id)structuredIndexPathForDisplayIndexPath:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = objc_msgSend(v5, "section");
  if (v6 >= -[_MPCPlayerResponseTracklistDisplayDataSource numberOfSections](self, "numberOfSections"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_MPCPlayerResponseTracklistDisplayDataSource numberOfSections](self, "numberOfSections"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlayerResponseTracklist.m"), 656, CFSTR("Provided display index path is out of bounds for this collection: %@ (section count %@)"), v5, v18);

  }
  v7 = objc_msgSend(v5, "item");
  if (v7 >= -[_MPCPlayerResponseTracklistDisplayDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v5, "section")))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_MPCPlayerResponseTracklistDisplayDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v5, "section")));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlayerResponseTracklist.m"), 657, CFSTR("Provided display index path is out of bounds for this collection: %@ (item count %@)"), v5, v20);

  }
  -[_MPCPlayerResponseTracklistDisplayDataSource sectionRanges](self, "sectionRanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "signedRangeValue");

  v13 = objc_msgSend(v5, "item") + v12;
  -[_MPCPlayerResponseTracklistDisplayDataSource items](self, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPathForGlobalIndex:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)displayIndexPathForStructuredIndexPath:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v25;
  id v26;
  SEL v27;

  v5 = a3;
  -[_MPCPlayerResponseTracklistDisplayDataSource items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "globalIndexForIndexPath:", v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlayerResponseTracklist.m"), 667, CFSTR("structureIndexPath did not produce a valid global index: %@"), v5);

  }
  v27 = a2;
  -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    goto LABEL_10;
  v26 = v5;
  v10 = 0;
  v11 = 0;
  do
  {
    -[_MPCPlayerResponseTracklistDisplayDataSource sectionRanges](self, "sectionRanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "signedRangeValue");
    v18 = v17;

    v19 = v7 - v16;
    if (v7 >= v16 && v19 < v18)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:");
      v20 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v20;
    }
    ++v10;
    -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

  }
  while (v10 < v22);
  v5 = v26;
  if (!v11)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v27, self, CFSTR("MPCPlayerResponseTracklist.m"), 683, CFSTR("Could not find a displayIndexPath for structuredIndexPath: %@"), v5);

    v11 = 0;
  }

  return v11;
}

- (unint64_t)numberOfSections
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;

  -[_MPCPlayerResponseTracklistDisplayDataSource sectionRanges](self, "sectionRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[_MPCPlayerResponseTracklistDisplayDataSource sectionRanges](self, "sectionRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerResponseTracklistDisplayDataSource sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "signedRangeValue");
  v11 = v10;

  return v11;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_MPCPlayerResponseTracklistDisplayDataSource sectionRanges](self, "sectionRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_MPCPlayerResponseTracklistDisplayDataSource structuredIndexPathForDisplayIndexPath:](self, "structuredIndexPathForDisplayIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlayerResponseTracklistDisplayDataSource items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MPSectionedCollection)items
{
  return self->_items;
}

- (NSIndexPath)playingItemIndexPath
{
  return self->_playingItemIndexPath;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSDictionary)sectionRanges
{
  return self->_sectionRanges;
}

@end
