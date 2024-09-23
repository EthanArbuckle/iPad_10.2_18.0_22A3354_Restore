@implementation SGURLPlugin

- (SGURLPlugin)init
{
  return -[SGURLPlugin initWithEntityStoreGetter:](self, "initWithEntityStoreGetter:", &__block_literal_global_2174);
}

- (SGURLPlugin)initWithEntityStore:(id)a3
{
  id v4;
  id v5;
  SGURLPlugin *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__SGURLPlugin_initWithEntityStore___block_invoke;
  v8[3] = &unk_1E7DA8530;
  v9 = v4;
  v5 = v4;
  v6 = -[SGURLPlugin initWithEntityStoreGetter:](self, "initWithEntityStoreGetter:", v8);

  return v6;
}

- (SGURLPlugin)initWithEntityStoreGetter:(id)a3
{
  id v4;
  SGURLPlugin *v5;
  void *v6;
  uint64_t v7;
  SGURLDissector *urlDissector;
  uint64_t v9;
  id entityStoreGetter;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGURLPlugin;
  v5 = -[SGURLPlugin init](&v12, sel_init);
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0D80F70], "defaultCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "registerRemindersConsumer:levelOfService:", v5, 3);

    }
    v7 = objc_opt_new();
    urlDissector = v5->_urlDissector;
    v5->_urlDissector = (SGURLDissector *)v7;

    v9 = objc_msgSend(v4, "copy");
    entityStoreGetter = v5->_entityStoreGetter;
    v5->_entityStoreGetter = (id)v9;

  }
  return v5;
}

- (id)setup
{
  return +[FIAPResult success](FIAPResult, "success");
}

- (id)consumeRemindersContentWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_entityStoreGetter + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D81000];
  objc_msgSend(v5, "uniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteURLsFromBundleIdentifier:documentIdentifiers:", v7, v9);

  objc_msgSend(v5, "completionDateTimestamp");
  if (v10 <= 0.0)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v5, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      objc_msgSend(v5, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v15);

    }
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "notes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v28 = objc_msgSend(v17, "length");
      _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "SGURLPlugin: consumeRemindersContentWithContext: notes.length = %tu", buf, 0xCu);

    }
    objc_msgSend(v5, "notes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      objc_msgSend(v5, "notes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v20);

    }
    v21 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "dueDateTimestamp");
    v22 = (void *)objc_msgSend(v21, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(v5, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGURLPlugin _consumeContentParts:title:fromHandle:documentDate:isOutgoingDocument:uniqueIdentifier:domainIdentifier:bundleIdentifier:context:](self, "_consumeContentParts:title:fromHandle:documentDate:isOutgoingDocument:uniqueIdentifier:domainIdentifier:bundleIdentifier:context:", v12, v23, 0, v22, 0, v24, v25, v7, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_consumeContentParts:(id)a3 title:(id)a4 fromHandle:(id)a5 documentDate:(id)a6 isOutgoingDocument:(BOOL)a7 uniqueIdentifier:(id)a8 domainIdentifier:(id)a9 bundleIdentifier:(id)a10 context:(id)a11
{
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;

  v12 = a7;
  v32 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  objc_msgSend(a3, "_pas_proxyComponentsJoinedByString:", CFSTR("\n\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "shouldContinue");

  if ((v24 & 1) != 0)
  {
    objc_msgSend(v17, "handle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGURLPlugin _urlContainerFromText:documentDate:documentTitle:handle:isOutgoingDocument:uniqueIdentifier:domainIdentifier:bundleIdentifier:](self, "_urlContainerFromText:documentDate:documentTitle:handle:isOutgoingDocument:uniqueIdentifier:domainIdentifier:bundleIdentifier:", v23, v18, v32, v25, v12, v19, v20, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))self->_entityStoreGetter + 2))();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "writeWithEntityStore:", v27);

    v28 = (void *)MEMORY[0x1E0D80F78];
    objc_msgSend(v26, "numberOfExtractions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "successWithNumberOfExtractions:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80F78], "interrupted");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.suggestions.plugin.SGURLPlugin");
}

- (id)processSearchableItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
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
  uint8_t v29[16];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SGURLPlugin _shouldProcessSearchableItem:](self, "_shouldProcessSearchableItem:", v4))
    goto LABEL_9;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGURLPlugin ignoring item with nil unique identifier", v29, 2u);
    }
    goto LABEL_8;
  }
  v6 = (void *)*MEMORY[0x1E0D19A58];
  objc_msgSend(v4, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {
    objc_msgSend(v4, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completionDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      (*((void (**)(void))self->_entityStoreGetter + 2))();
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attributeSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject deleteURLsFromBundleIdentifier:documentIdentifiers:](v10, "deleteURLsFromBundleIdentifier:documentIdentifiers:", v11, v14);

LABEL_8:
LABEL_9:
      +[FIAPResult success](FIAPResult, "success");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "attributeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "authorAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v4, "attributeSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "authorAddresses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (!v20)
    {
      v17 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v4, "attributeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "authorAddresses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:
  objc_msgSend(v4, "attributeSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "absoluteString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (v25)
    -[SGURLPlugin extractURLsFromAttributesOfItem:handle:](self, "extractURLsFromAttributesOfItem:handle:", v4, v17);
  else
    -[SGURLPlugin extractURLsFromTextPropertiesOfItem:handle:](self, "extractURLsFromTextPropertiesOfItem:handle:", v4, v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_entityStoreGetter + 2))();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "writeWithEntityStore:", v27);

  +[FIAPResult success](FIAPResult, "success");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v15;
}

- (id)extractURLsFromAttributesOfItem:(id)a3 handle:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  SGURLDissector *urlDissector;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "SGURLPlugin: extracting URLs from attributes of %@", buf, 0xCu);

  }
  urlDissector = self->_urlDissector;
  objc_msgSend(v6, "attributeSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domainIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentCreationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  LOBYTE(v18) = objc_msgSend(MEMORY[0x1E0D80FB0], "searchableItemIsOutgoing:", v6);
  -[SGURLDissector urlsFromAttributes:handle:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:](urlDissector, "urlsFromAttributes:handle:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:", v20, v22, v10, v11, v21, v13, 0.0, v15, v16, v18);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)extractURLsFromTextPropertiesOfItem:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;
  id v38;
  SGURLPlugin *v39;
  void *v40;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80FB0], "textContentNoCopyRetainingBackingBuffer:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
    objc_msgSend(v8, "addObject:", v10);
  objc_msgSend(v6, "attributeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(v6, "attributeSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v15);

  }
  objc_msgSend(v6, "attributeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "comment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    objc_msgSend(v6, "attributeSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "comment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v20);

  }
  if (objc_msgSend(v8, "count"))
  {
    v39 = self;
    v21 = (void *)*MEMORY[0x1E0D81000];
    objc_msgSend(v6, "bundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = objc_msgSend(v21, "isEqualToString:", v22);

    objc_msgSend(v6, "attributeSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v40 = v10;
    v38 = v7;
    if ((_DWORD)v21)
      objc_msgSend(v23, "dueDate");
    else
      objc_msgSend(v23, "contentCreationDate");
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_pas_proxyComponentsJoinedByString:", CFSTR(" "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(MEMORY[0x1E0D80FB0], "searchableItemIsOutgoing:", v6);
    objc_msgSend(v6, "uniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domainIdentifier");
    v31 = v8;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v26;
    v35 = v26;
    v7 = v38;
    -[SGURLPlugin _urlContainerFromText:documentDate:documentTitle:handle:isOutgoingDocument:uniqueIdentifier:domainIdentifier:bundleIdentifier:](v39, "_urlContainerFromText:documentDate:documentTitle:handle:isOutgoingDocument:uniqueIdentifier:domainIdentifier:bundleIdentifier:", v27, v35, v28, v38, v29, v30, v32, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v31;
    v10 = v40;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_urlContainerFromText:(id)a3 documentDate:(id)a4 documentTitle:(id)a5 handle:(id)a6 isOutgoingDocument:(BOOL)a7 uniqueIdentifier:(id)a8 domainIdentifier:(id)a9 bundleIdentifier:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  SGURLDissector *urlDissector;
  void *v25;
  void *v26;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  HIDWORD(v28) = a7;
  v33 = *MEMORY[0x1E0C80C00];
  v15 = a8;
  v16 = a10;
  v17 = a9;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  +[SGDataDetectorMatch detectionsInPlainText:baseDate:](SGDataDetectorMatch, "detectionsInPlainText:baseDate:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v30 = objc_msgSend(v22, "count");
    v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "SGURLPlugin: %tu detections on %@", buf, 0x16u);
  }

  urlDissector = self->_urlDissector;
  v25 = (void *)objc_opt_new();
  LOBYTE(v28) = BYTE4(v28);
  -[SGURLDissector urlsFromText:handle:dataDetectorMatches:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:](urlDissector, "urlsFromText:handle:dataDetectorMatches:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:", v21, v18, v22, v16, v17, v15, 0.0, v19, v20, v25, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)_shouldProcessSearchableItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D81000];
    v10[0] = *MEMORY[0x1E0D80FE0];
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D19A08]))
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGURLPlugin: deleting URLs from bundleId %@", (uint8_t *)&v9, 0xCu);
    }

    (*((void (**)(void))self->_entityStoreGetter + 2))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deleteURLsFromBundleIdentifier:", v4);

    if ((v7 & 1) == 0)
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGURLPlugin failed to delete URLs from bundleId %@", (uint8_t *)&v9, 0xCu);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlDissector, 0);
  objc_storeStrong(&self->_entityStoreGetter, 0);
}

id __35__SGURLPlugin_initWithEntityStore___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __19__SGURLPlugin_init__block_invoke()
{
  return +[SGSqlEntityStore defaultHarvestStore](SGSqlEntityStore, "defaultHarvestStore");
}

@end
