@implementation WFPasteboardItem

- (WFPasteboardItem)initWithItemsByType:(id)a3 fileURLs:(id)a4
{
  id v8;
  id v9;
  WFPasteboardItem *v10;
  WFPasteboardItem *v11;
  WFPasteboardItem *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentCollection+WFPasteboard.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemsByType"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFPasteboardItem;
  v10 = -[WFPasteboardItem init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_itemsByType, a3);
    objc_storeStrong((id *)&v11->_fileURLs, a4);
    v12 = v11;
  }

  return v11;
}

- (NSArray)fileURLItems
{
  void *v2;
  void *v3;

  -[WFPasteboardItem fileURLs](self, "fileURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_7369);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)itemsByType
{
  return self->_itemsByType;
}

- (NSArray)fileURLs
{
  return self->_fileURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_itemsByType, 0);
}

id __32__WFPasteboardItem_fileURLItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "wfFileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", v2, 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "fileURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "wf_fileIsReadable"),
        v5,
        (v6 & 1) != 0))
  {
    +[WFContentLocation contentLocationForFile:](WFContentLocation, "contentLocationForFile:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentItem itemWithFile:origin:disclosureLevel:](WFContentItem, "itemWithFile:origin:disclosureLevel:", v4, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFContentGraphLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[WFPasteboardItem fileURLItems]_block_invoke";
      v13 = 2112;
      v14 = v2;
      _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_ERROR, "%s Couldn't read file URL %@ during a pasteboard read", (uint8_t *)&v11, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

@end
