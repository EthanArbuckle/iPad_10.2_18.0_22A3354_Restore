@implementation ENNote

- (ENNote)init
{
  ENNote *v2;
  NSMutableArray *v3;
  NSMutableArray *resources;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENNote;
  v2 = -[ENNote init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    resources = v2->_resources;
    v2->_resources = v3;

  }
  return v2;
}

- (ENNote)initWithServiceNote:(id)a3
{
  id v4;
  ENNote *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  uint64_t v9;
  ENNoteContent *content;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *sourceUrl;
  uint64_t v16;
  NSArray *tagNames;
  NSMutableArray *v18;
  NSMutableArray *resources;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ENNote;
  v5 = -[ENNote init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENNoteContent noteContentWithENML:](ENNoteContent, "noteContentWithENML:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (ENNoteContent *)v9;

    objc_msgSend(v4, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reminderOrder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isReminder = v12 != 0;

    objc_msgSend(v4, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sourceURL");
    v14 = objc_claimAutoreleasedReturnValue();
    sourceUrl = v5->_sourceUrl;
    v5->_sourceUrl = (NSString *)v14;

    objc_msgSend(v4, "tagNames");
    v16 = objc_claimAutoreleasedReturnValue();
    tagNames = v5->_tagNames;
    v5->_tagNames = (NSArray *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    resources = v5->_resources;
    v5->_resources = v18;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "resources", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          +[ENResource resourceWithServiceResource:](ENResource, "resourceWithServiceResource:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v24));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            -[NSMutableArray addObject:](v5->_resources, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v22);
    }

    v26 = (void *)objc_msgSend(v4, "copy");
    -[ENNote setServiceNote:](v5, "setServiceNote:", v26);

    -[ENNote serviceNote](v5, "serviceNote");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContent:", 0);

    -[ENNote serviceNote](v5, "serviceNote");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setResources:", 0);

  }
  return v5;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  id v7;

  v4 = a3;
  +[EDAMLimitsConstants EDAM_NOTE_TITLE_REGEX](EDAMLimitsConstants, "EDAM_NOTE_TITLE_REGEX");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "en_scrubUsingRegex:withMinLength:maxLength:", v7, (unsigned __int16)+[EDAMLimitsConstants EDAM_NOTE_TITLE_LEN_MIN](EDAMLimitsConstants, "EDAM_NOTE_TITLE_LEN_MIN"), (unsigned __int16)+[EDAMLimitsConstants EDAM_NOTE_TITLE_LEN_MAX](EDAMLimitsConstants, "EDAM_NOTE_TITLE_LEN_MAX"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  title = self->_title;
  self->_title = v5;

}

- (void)setContent:(id)a3
{
  ENNoteContent *v4;
  ENNoteContent *content;

  v4 = (ENNoteContent *)a3;
  -[ENNote invalidateCachedENML](self, "invalidateCachedENML");
  content = self->_content;
  self->_content = v4;

}

- (void)setTagNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        +[EDAMLimitsConstants EDAM_TAG_NAME_REGEX](EDAMLimitsConstants, "EDAM_TAG_NAME_REGEX", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "en_scrubUsingRegex:withMinLength:maxLength:", v12, (unsigned __int16)+[EDAMLimitsConstants EDAM_TAG_NAME_LEN_MIN](EDAMLimitsConstants, "EDAM_TAG_NAME_LEN_MIN"), (unsigned __int16)+[EDAMLimitsConstants EDAM_TAG_NAME_LEN_MAX](EDAMLimitsConstants, "EDAM_TAG_NAME_LEN_MAX"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v14 = v5;
  else
    v14 = 0;
  objc_storeStrong((id *)&self->_tagNames, v14);

}

- (NSDate)modificationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE60];
  -[ENNote serviceNote](self, "serviceNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithEDAMTimestamp:", objc_msgSend(v4, "longValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCE60];
  -[ENNote serviceNote](self, "serviceNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "created");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithEDAMTimestamp:", objc_msgSend(v4, "longValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (NSArray)resources
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_resources, "copy");
}

- (void)addResource:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSMutableArray count](self->_resources, "count");
    if (v5 >= +[EDAMLimitsConstants EDAM_NOTE_RESOURCES_MAX](EDAMLimitsConstants, "EDAM_NOTE_RESOURCES_MAX"))
    {
      +[ENSession sharedSession](ENSession, "sharedSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Too many resources already on note. Ignoring %@. Note %@."), v9, self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "evernoteLogInfoString:", v8);

    }
    else
    {
      -[ENNote invalidateCachedENML](self, "invalidateCachedENML");
      -[NSMutableArray addObject:](self->_resources, "addObject:", v9);
    }
    v4 = v9;
  }

}

- (void)removeAllResources
{
  -[NSMutableArray removeAllObjects](self->_resources, "removeAllObjects");
  -[ENNote invalidateCachedENML](self, "invalidateCachedENML");
}

- (void)generateWebArchiveData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ENMLUtility *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  ENNote *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v38 = v4;
    -[ENNote enmlContent](self, "enmlContent");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[ENNoteContent noteContentWithString:](ENNoteContent, "noteContentWithString:", &stru_24F8BBA48);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enmlWithNote:", self);
      v6 = objc_claimAutoreleasedReturnValue();

    }
    v37 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDBCEB8];
    -[ENNote resources](self, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v36 = self;
    -[ENNote resources](self, "resources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v44 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v16, "EDAMResource");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "attributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "sourceURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            objc_msgSend(v16, "dataHash");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "enlowercaseHexDigits");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "mimeType");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[ENMIMEUtils fileExtensionForMIMEType:](ENMIMEUtils, "fileExtensionForMIMEType:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://example.com/%@.%@"), v21, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "attributes");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setSourceURL:", v24);

          }
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v13);
    }

    v26 = objc_alloc_init(ENMLUtility);
    -[ENNote sourceUrl](v36, "sourceUrl");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)MEMORY[0x24BDBCF48];
      -[ENNote sourceUrl](v36, "sourceUrl");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URLWithString:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = 0;
    }

    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __33__ENNote_generateWebArchiveData___block_invoke;
    v39[3] = &unk_24F8B6190;
    v5 = v38;
    v41 = v10;
    v42 = v38;
    v40 = v30;
    v34 = v10;
    v35 = v30;
    -[ENMLUtility generateHTMLFromENML:referencedResources:completion:](v26, "generateHTMLFromENML:referencedResources:completion:", v37, v34, v39);

  }
  else
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logger");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-generateWebArchiveData: requires a completion handler!"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "evernoteLogErrorString:", v33);

  }
}

- (void)generateHTMLData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ENMLUtility *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v31 = v4;
    -[ENNote enmlContent](self, "enmlContent");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[ENNoteContent noteContentWithString:](ENNoteContent, "noteContentWithString:", &stru_24F8BBA48);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enmlWithNote:", self);
      v6 = objc_claimAutoreleasedReturnValue();

    }
    v30 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDBCEB8];
    -[ENNote resources](self, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[ENNote resources](self, "resources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v16, "EDAMResource");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "attributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "sourceURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            objc_msgSend(v16, "dataHash");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "enlowercaseHexDigits");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "mimeType");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[ENMIMEUtils fileExtensionForMIMEType:](ENMIMEUtils, "fileExtensionForMIMEType:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://example.com/%@.%@"), v21, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "attributes");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setSourceURL:", v24);

          }
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v13);
    }

    v26 = objc_alloc_init(ENMLUtility);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __27__ENNote_generateHTMLData___block_invoke;
    v32[3] = &unk_24F8B72E0;
    v5 = v31;
    v33 = v31;
    -[ENMLUtility generateHTMLFromENML:referencedResources:completion:](v26, "generateHTMLFromENML:referencedResources:completion:", v30, v10, v32);

  }
  else
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-generateHTMLData: requires a completion handler!"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "evernoteLogErrorString:", v29);

  }
}

- (void)invalidateCachedENML
{
  -[ENNote setCachedENMLContent:](self, "setCachedENMLContent:", 0);
}

- (id)enmlContent
{
  void *v3;
  void *v4;
  void *v5;

  -[ENNote cachedENMLContent](self, "cachedENMLContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[ENNote content](self, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enmlWithNote:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENNote setCachedENMLContent:](self, "setCachedENMLContent:", v5);

  }
  return -[ENNote cachedENMLContent](self, "cachedENMLContent");
}

- (void)setResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *resources;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a3);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  resources = self->_resources;
  self->_resources = v4;

}

- (id)EDAMNote
{
  return -[ENNote EDAMNoteToReplaceServiceNoteGUID:](self, "EDAMNoteToReplaceServiceNoteGUID:", 0);
}

- (id)EDAMNoteToReplaceServiceNoteGUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  EDAMNote *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EDAMNoteAttributes *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  -[ENNote serviceNote](self, "serviceNote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  -[ENNote serviceNote](self, "serviceNote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v51);

  if (v7)
  {
    -[ENNote serviceNote](self, "serviceNote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (EDAMNote *)objc_msgSend(v8, "copy");

    -[EDAMNote setGuid:](v9, "setGuid:", 0);
    -[EDAMNote setNotebookGuid:](v9, "setNotebookGuid:", 0);
    -[EDAMNote setUpdateSequenceNum:](v9, "setUpdateSequenceNum:", 0);
  }
  else
  {
LABEL_4:
    v9 = objc_alloc_init(EDAMNote);
  }
  -[ENNote enmlContent](self, "enmlContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDAMNote setContent:](v9, "setContent:", v10);

  -[EDAMNote content](v9, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[ENNoteContent noteContentWithString:](ENNoteContent, "noteContentWithString:", &stru_24F8BBA48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enmlWithNote:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMNote setContent:](v9, "setContent:", v13);

  }
  -[EDAMNote setContentHash:](v9, "setContentHash:", 0);
  -[EDAMNote setContentLength:](v9, "setContentLength:", 0);
  -[ENNote title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDAMNote setTitle:](v9, "setTitle:", v14);

  -[EDAMNote title](v9, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[EDAMNote setTitle:](v9, "setTitle:", CFSTR("Untitled Note"));
  -[EDAMNote attributes](v9, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_alloc_init(EDAMNoteAttributes);
    -[EDAMNote setAttributes:](v9, "setAttributes:", v17);

  }
  +[ENSession sharedSession](ENSession, "sharedSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sourceApplication");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDAMNote attributes](v9, "attributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSourceApplication:", v52);

  -[EDAMNote attributes](v9, "attributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSource:", CFSTR("mobile.ios"));

  v21 = -[ENNote isReminder](self, "isReminder");
  -[EDAMNote attributes](v9, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
  {
    objc_msgSend(v22, "reminderOrder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      goto LABEL_16;
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSince1970");
    objc_msgSend(v25, "numberWithDouble:", v26 * 1000.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMNote attributes](v9, "attributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setReminderOrder:", v27);

  }
  else
  {
    objc_msgSend(v22, "setReminderOrder:", 0);
  }

LABEL_16:
  -[ENNote sourceUrl](self, "sourceUrl");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[ENNote sourceUrl](self, "sourceUrl");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMNote attributes](v9, "attributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setSourceURL:", v30);

  }
  -[ENNote tagNames](self, "tagNames");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[ENNote tagNames](self, "tagNames");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "mutableCopy");
    -[EDAMNote setTagNames:](v9, "setTagNames:", v34);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[ENNote resources](self, "resources");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v58;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v58 != v38)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v39), "EDAMResource");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          objc_msgSend(v35, "addObject:", v40);

        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v37);
  }

  -[EDAMNote setResources:](v9, "setResources:", v35);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[ENNote edamAttributes](self, "edamAttributes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "allKeys");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v54;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v54 != v44)
          objc_enumerationMutation(v42);
        v46 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v45);
        -[ENNote edamAttributes](self, "edamAttributes");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "valueForKey:", v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        -[EDAMNote attributes](v9, "attributes");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setValue:forKey:", v48, v46);

        ++v45;
      }
      while (v43 != v45);
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v43);
  }

  return v9;
}

- (BOOL)validateForLimits
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[ENNote enmlContent](self, "enmlContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (v4 < +[EDAMLimitsConstants EDAM_NOTE_CONTENT_LEN_MIN](EDAMLimitsConstants, "EDAM_NOTE_CONTENT_LEN_MIN"))
  {

LABEL_4:
    +[ENSession sharedSession](ENSession, "sharedSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Note fails validation for content length: %@"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "evernoteLogInfoString:", v10);

    return 0;
  }
  -[ENNote enmlContent](self, "enmlContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = +[EDAMLimitsConstants EDAM_NOTE_CONTENT_LEN_MAX](EDAMLimitsConstants, "EDAM_NOTE_CONTENT_LEN_MAX");

  if (v6 > v7)
    goto LABEL_4;
  v12 = +[EDAMLimitsConstants EDAM_RESOURCE_SIZE_MAX_FREE](EDAMLimitsConstants, "EDAM_RESOURCE_SIZE_MAX_FREE");
  +[ENSession sharedSession](ENSession, "sharedSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isPremiumUser");

  if (v14)
    v12 = +[EDAMLimitsConstants EDAM_RESOURCE_SIZE_MAX_PREMIUM](EDAMLimitsConstants, "EDAM_RESOURCE_SIZE_MAX_PREMIUM");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ENNote resources](self, "resources");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = v12;
    v19 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "data");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        if (v22 > v18)
        {
          +[ENSession sharedSession](ENSession, "sharedSession");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "logger");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Note fails validation for resource length: %@"), self);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "evernoteLogInfoString:", v25);

          v11 = 0;
          goto LABEL_17;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v17)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_17:

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (ENNoteContent)content
{
  return self->_content;
}

- (NSArray)tagNames
{
  return self->_tagNames;
}

- (BOOL)isReminder
{
  return self->_isReminder;
}

- (void)setIsReminder:(BOOL)a3
{
  self->_isReminder = a3;
}

- (NSString)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setSourceUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)cachedENMLContent
{
  return self->_cachedENMLContent;
}

- (void)setCachedENMLContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (EDAMNote)serviceNote
{
  return self->_serviceNote;
}

- (void)setServiceNote:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNote, a3);
}

- (NSDictionary)edamAttributes
{
  return self->_edamAttributes;
}

- (void)setEdamAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_edamAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edamAttributes, 0);
  objc_storeStrong((id *)&self->_serviceNote, 0);
  objc_storeStrong((id *)&self->_cachedENMLContent, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_tagNames, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_resources, 0);
}

void __27__ENNote_generateHTMLData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (a2)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+webArchiveData failed to convert ENML to HTML: %@"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "evernoteLogInfoString:", v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __33__ENNote_generateWebArchiveData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  ENWebResource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ENWebResource *v20;
  ENWebArchive *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ENWebResource *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v30 = v5;
    objc_msgSend(a2, "dataUsingEncoding:", 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[ENWebResource initWithData:URL:MIMEType:textEncodingName:frameName:]([ENWebResource alloc], "initWithData:URL:MIMEType:textEncodingName:frameName:", v28, *(_QWORD *)(a1 + 32), CFSTR("text/html"), CFSTR("UTF-8"), 0);
    v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = a1;
    obj = *(id *)(a1 + 40);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
          v12 = [ENWebResource alloc];
          objc_msgSend(v11, "data");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "body");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(v11, "attributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sourceURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "URLWithString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mime");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[ENWebResource initWithData:URL:MIMEType:textEncodingName:frameName:](v12, "initWithData:URL:MIMEType:textEncodingName:frameName:", v14, v18, v19, 0, 0);

          objc_msgSend(v32, "addObject:", v20);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v8);
    }

    v21 = -[ENWebArchive initWithMainResource:subresources:subframeArchives:]([ENWebArchive alloc], "initWithMainResource:subresources:subframeArchives:", v27, v32, 0);
    v22 = *(_QWORD *)(v29 + 48);
    -[ENWebArchive data](v21, "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

    v6 = v30;
  }
  else
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+webArchiveData failed to convert ENML to HTML: %@"), v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "evernoteLogInfoString:", v26);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

@end
