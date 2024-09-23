@implementation _UIDocumentPickerContainerURLItem

- (_UIDocumentPickerContainerURLItem)initWithURL:(id)a3
{
  id v5;
  _UIDocumentPickerContainerURLItem *v6;
  _UIDocumentPickerContainerURLItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerContainerURLItem;
  v6 = -[_UIDocumentPickerContainerItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_cachedIndentation = 0x7FFFFFFFFFFFFFFFLL;
    -[_UIDocumentPickerContainerURLItem cacheValues](v7, "cacheValues");
  }

  return v7;
}

- (void)_removeCachedValues
{
  NSString *cachedSubtitle;
  NSString *cachedSubtitle2;
  NSString *cachedTitle;
  NSArray *cachedTags;
  NSString *cachedSortPath;
  NSDate *cachedContentModifiedDate;
  NSString *cachedContentType;
  id generationIdentifier;

  cachedSubtitle = self->_cachedSubtitle;
  self->_cachedSubtitle = 0;

  cachedSubtitle2 = self->_cachedSubtitle2;
  self->_cachedSubtitle2 = 0;

  cachedTitle = self->_cachedTitle;
  self->_cachedTitle = 0;

  cachedTags = self->_cachedTags;
  self->_cachedTags = 0;

  cachedSortPath = self->_cachedSortPath;
  self->_cachedSortPath = 0;

  cachedContentModifiedDate = self->_cachedContentModifiedDate;
  self->_cachedContentModifiedDate = 0;

  cachedContentType = self->_cachedContentType;
  self->_cachedContentType = 0;

  generationIdentifier = self->_generationIdentifier;
  self->_generationIdentifier = 0;

  self->_cachedIndentation = 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)attributesModified:(id)a3
{
  id *v4;
  int v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4[22], "isEqual:", self->_generationIdentifier) ^ 1;
  else
    LOBYTE(v5) = 1;

  return v5;
}

+ (id)defaultKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBCCD0];
  v8[0] = *MEMORY[0x24BDBCCC0];
  v8[1] = v2;
  v3 = *MEMORY[0x24BDBCC60];
  v8[2] = *MEMORY[0x24BDBCC48];
  v8[3] = v3;
  v4 = *MEMORY[0x24BDBCC58];
  v8[4] = *MEMORY[0x24BDBCC80];
  v8[5] = v4;
  v5 = *MEMORY[0x24BDBCC50];
  v8[6] = *MEMORY[0x24BDBCBE0];
  v8[7] = v5;
  v6 = *MEMORY[0x24BDBCCF0];
  v8[8] = *MEMORY[0x24BDBCBC8];
  v8[9] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cacheValues
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(void);
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _BOOL8 v44;
  char v45;
  id v46[2];

  -[_UIDocumentPickerContainerURLItem url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultKeys");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promisedItemResourceValuesForKeys:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCCC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCCD0]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v8;

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCCF0]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = 0;
  objc_msgSend(v3, "br_getTagNames:error:", v46, 0);
  v28 = v46[0];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCBC8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDBCC48]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "longLongValue");
    NSLocalizedFileSizeDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDBCBE0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    BRFormatModifiedAgoWithDate(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDBCC60]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDBCC80]);
  v34 = v3;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v11;
  v33 = (void *)v4;
  v17 = v16 && objc_msgSend(v16, "BOOLValue") && v35 && !objc_msgSend(v35, "BOOLValue");
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDBCC58]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDBCC50]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __48___UIDocumentPickerContainerURLItem_cacheValues__block_invoke;
  v36[3] = &unk_24E43B2B8;
  v36[4] = self;
  v37 = v31;
  v38 = v12;
  v39 = v15;
  v43 = v20;
  v44 = v17;
  v40 = v28;
  v41 = v29;
  v42 = v9;
  v45 = v19;
  v21 = v20;
  v22 = v9;
  v30 = v29;
  v23 = v28;
  v24 = v15;
  v25 = v12;
  v26 = v31;
  v27 = (void (**)(void))MEMORY[0x2207C9E60](v36);
  v27[2]();

}

- (int64_t)type
{
  return self->_cachedType;
}

- (id)contentType
{
  return self->_cachedContentType;
}

- (BOOL)isAlias
{
  return self->_cachedIsAlias;
}

- (id)title
{
  return self->_cachedTitle;
}

- (id)subtitle
{
  return self->_cachedSubtitle;
}

- (id)subtitle2
{
  return self->_cachedSubtitle2;
}

- (id)url
{
  return self->_url;
}

- (id)urlInLocalContainer
{
  return self->_url;
}

- (id)tags
{
  return self->_cachedTags;
}

- (id)modificationDate
{
  return self->_cachedContentModifiedDate;
}

- (void)_modelChanged
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *cachedSubtitle;
  id v7;

  -[_UIDocumentPickerContainerItem model](self, "model");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerContainerItem _formattedSubtitleForNumberOfItems:](self, "_formattedSubtitleForNumberOfItems:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  cachedSubtitle = self->_cachedSubtitle;
  self->_cachedSubtitle = v5;

}

- (void)_cacheIndentationLevelWithSortPathComponents:(id)a3
{
  self->_cachedIndentation = objc_msgSend(a3, "count") - 1;
}

- (unint64_t)indentationLevel
{
  unint64_t result;
  void *v4;

  result = self->_cachedIndentation;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_UIDocumentPickerContainerURLItem sortPathComponents](self, "sortPathComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerContainerURLItem _cacheIndentationLevelWithSortPathComponents:](self, "_cacheIndentationLevelWithSortPathComponents:", v4);

    return self->_cachedIndentation;
  }
  return result;
}

- (id)sortPathComponents
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIDocumentPickerContainerURLItem url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE17550]);

  -[_UIDocumentPickerContainerURLItem url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_pathRelativeToMobileDocuments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObjectAtIndex:", v5 ^ 1u);
  return v9;
}

- (id)sortPath
{
  void *v3;
  NSString *cachedSortPath;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  v3 = (void *)MEMORY[0x2207C9CBC](self, a2);
  cachedSortPath = self->_cachedSortPath;
  if (!cachedSortPath)
  {
    -[_UIDocumentPickerContainerURLItem sortPathComponents](self, "sortPathComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("/"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedSortPath;
    self->_cachedSortPath = v6;

    if (self->_cachedIndentation == 0x7FFFFFFFFFFFFFFFLL)
      -[_UIDocumentPickerContainerURLItem _cacheIndentationLevelWithSortPathComponents:](self, "_cacheIndentationLevelWithSortPathComponents:", v5);

    cachedSortPath = self->_cachedSortPath;
  }
  v8 = cachedSortPath;
  objc_autoreleasePoolPop(v3);
  return v8;
}

- (BOOL)renameable
{
  void *v3;
  uint64_t v4;
  char v5;
  id v7;

  -[_UIDocumentPickerContainerURLItem url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_UIDocumentPickerContainerURLItem type](self, "type"))
  {
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v7 = 0;
  if (objc_msgSend(v3, "getResourceValue:forKey:error:", &v7, *MEMORY[0x24BDBCCB8], 0))
    v5 = objc_msgSend(v7, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generationIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedContentModifiedDate, 0);
  objc_storeStrong((id *)&self->_cachedContentType, 0);
  objc_storeStrong((id *)&self->_cachedSortPath, 0);
  objc_storeStrong((id *)&self->_cachedTags, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle2, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle, 0);
  objc_storeStrong((id *)&self->_cachedTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
