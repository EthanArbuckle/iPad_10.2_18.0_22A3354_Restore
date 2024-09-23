@implementation _UIDocumentPickerContainerMetadataItem

- (_UIDocumentPickerContainerMetadataItem)initWithMetadataItem:(id)a3
{
  id v4;
  _UIDocumentPickerContainerMetadataItem *v5;
  _UIDocumentPickerContainerMetadataItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentPickerContainerMetadataItem;
  v5 = -[_UIDocumentPickerContainerItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIDocumentPickerContainerMetadataItem cacheValues:](v5, "cacheValues:", v4);
    v6->_cachedIndentation = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)_removeCachedValues
{
  NSString *cachedSubtitle;
  NSString *cachedSubtitle2;
  NSString *cachedTitle;
  NSArray *cachedTags;
  NSURL *cachedURL;
  NSString *cachedSortPath;
  NSDate *cachedContentModifiedDate;
  NSURL *cachedURLInLocalContainer;

  cachedSubtitle = self->_cachedSubtitle;
  self->_cachedSubtitle = 0;

  cachedSubtitle2 = self->_cachedSubtitle2;
  self->_cachedSubtitle2 = 0;

  cachedTitle = self->_cachedTitle;
  self->_cachedTitle = 0;

  cachedTags = self->_cachedTags;
  self->_cachedTags = 0;

  cachedURL = self->_cachedURL;
  self->_cachedURL = 0;

  cachedSortPath = self->_cachedSortPath;
  self->_cachedSortPath = 0;

  cachedContentModifiedDate = self->_cachedContentModifiedDate;
  self->_cachedContentModifiedDate = 0;

  cachedURLInLocalContainer = self->_cachedURLInLocalContainer;
  self->_cachedURLInLocalContainer = 0;

  self->_cachedIndentation = 0x7FFFFFFFFFFFFFFFLL;
  self->_cachedRenameable = 0;
}

- (unint64_t)hash
{
  return -[NSNumber hash](self->_cachedFileObjectID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4[22], "isEqual:", self->_cachedFileObjectID);
  else
    v5 = 0;

  return v5;
}

- (void)cacheValues:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *cachedTitle;
  void *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  NSURL *v11;
  NSURL *cachedURL;
  void *v13;
  NSString *v14;
  NSString *cachedContentType;
  void *v16;
  NSURL *v17;
  NSURL *cachedURLInLocalContainer;
  NSNumber *v19;
  NSNumber *cachedFileObjectID;
  NSURL *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSURL *v28;
  const __CFString *v29;
  NSString *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSString *v37;
  NSString *cachedSubtitle;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSString *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSString *v50;
  NSString *v51;
  BOOL v52;
  NSString *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSString *v59;
  NSString *v60;
  void *v61;
  NSDate *v62;
  NSDate *cachedContentModifiedDate;
  void *v64;
  void *v65;
  uint64_t v66;
  NSString **p_cachedSubtitle;
  NSString *v68;
  NSDate *v69;
  NSString *v70;
  NSString *cachedSubtitle2;
  void *v72;
  NSArray *v73;
  NSArray *cachedTags;
  id v75;

  v75 = a3;
  -[_UIDocumentPickerContainerMetadataItem _removeCachedValues](self, "_removeCachedValues");
  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD1048]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  cachedTitle = self->_cachedTitle;
  self->_cachedTitle = v5;

  if (!self->_cachedTitle)
  {
    objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD1058]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    v9 = self->_cachedTitle;
    self->_cachedTitle = v8;

  }
  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD1068]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSURL *)objc_msgSend(v10, "copy");
  cachedURL = self->_cachedURL;
  self->_cachedURL = v11;

  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD1040]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSString *)objc_msgSend(v13, "copy");
  cachedContentType = self->_cachedContentType;
  self->_cachedContentType = v14;

  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD10A8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSURL *)objc_msgSend(v16, "copy");
  cachedURLInLocalContainer = self->_cachedURLInLocalContainer;
  self->_cachedURLInLocalContainer = v17;

  objc_msgSend(v75, "valueForAttribute:", CFSTR("BRMetadataItemFileObjectIdentifierKey"));
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cachedFileObjectID = self->_cachedFileObjectID;
  self->_cachedFileObjectID = v19;

  v21 = self->_cachedURL;
  -[NSURL br_containerID](v21, "br_containerID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BE17550]);

  if (!v23)
  {
LABEL_11:

    goto LABEL_12;
  }
  -[NSURL br_pathRelativeToMobileDocuments](v21, "br_pathRelativeToMobileDocuments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "rangeOfString:", CFSTR("/"));
  -[NSURL lastPathComponent](v21, "lastPathComponent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v24, "rangeOfString:options:", v26, 4);

  if (v25 && v25 + 1 == v27)
  {
    if (-[NSString isEqualToString:](self->_cachedTitle, "isEqualToString:", *MEMORY[0x24BE17568]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v21 = v28;
      v29 = CFSTR("Desktop");
    }
    else
    {
      if (!-[NSString isEqualToString:](self->_cachedTitle, "isEqualToString:", *MEMORY[0x24BE17578]))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v21 = v28;
      v29 = CFSTR("Documents");
    }
    -[NSURL localizedStringForKey:value:table:](v28, "localizedStringForKey:value:table:", v29, v29, CFSTR("Localizable"));
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    v31 = self->_cachedTitle;
    self->_cachedTitle = v30;

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD10A0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD1098]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "BOOLValue"))
  {
    objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD10B8]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "isEqualToString:", *MEMORY[0x24BDD10D0]))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Shared by Me"), CFSTR("Shared by Me"), CFSTR("Localizable"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (NSString *)objc_msgSend(v36, "copy");
      cachedSubtitle = self->_cachedSubtitle;
      self->_cachedSubtitle = v37;

      self->_cachedRenameable = 1;
    }
    else
    {
      objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD10C8]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v46 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Shared by SomeoneElseThanMe"), CFSTR("Shared by %@"), CFSTR("Localizable"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringWithFormat:", v48, v45);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (NSString *)objc_msgSend(v49, "copy");
        v51 = self->_cachedSubtitle;
        self->_cachedSubtitle = v50;

        v52 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Shared by unknown user"), CFSTR("Shared by unknown user"), CFSTR("Localizable"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (NSString *)objc_msgSend(v48, "copy");
        v49 = self->_cachedSubtitle;
        self->_cachedSubtitle = v53;
        v52 = 1;
      }

      self->_cachedRenameable = v52;
    }
  }
  else
  {
    if (!objc_msgSend(v33, "BOOLValue"))
    {
      self->_cachedRenameable = 1;
      goto LABEL_23;
    }
    objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD1090]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("in ContainerDisplayName"), CFSTR("in %@"), CFSTR("Localizable"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringWithFormat:", v41, v34);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (NSString *)objc_msgSend(v42, "copy");
    v44 = self->_cachedSubtitle;
    self->_cachedSubtitle = v43;

    self->_cachedRenameable = 0;
  }

LABEL_23:
  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD10B0]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (!v54)
    goto LABEL_29;
  objc_msgSend(v54, "domain");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v56, "isEqualToString:", *MEMORY[0x24BDD0B88]))
  {

    goto LABEL_28;
  }
  v57 = objc_msgSend(v55, "code");

  if (v57 != 4355)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("Error"), CFSTR("Error"), CFSTR("Localizable"));
    v59 = (NSString *)objc_claimAutoreleasedReturnValue();
    v60 = self->_cachedSubtitle;
    self->_cachedSubtitle = v59;

  }
LABEL_29:
  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD1050]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (NSDate *)objc_msgSend(v61, "copy");
  cachedContentModifiedDate = self->_cachedContentModifiedDate;
  self->_cachedContentModifiedDate = v62;

  self->_cachedType = UTTypeConformsTo((CFStringRef)self->_cachedContentType, (CFStringRef)*MEMORY[0x24BDC1770]) != 0;
  objc_msgSend(v75, "valueForAttribute:", *MEMORY[0x24BDD1060]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64)
  {
    objc_msgSend(v64, "longLongValue");
    NSLocalizedFileSizeDescription();
    v66 = objc_claimAutoreleasedReturnValue();
    p_cachedSubtitle = &self->_cachedSubtitle;
    if (self->_cachedSubtitle)
      p_cachedSubtitle = &self->_cachedSubtitle2;
    v68 = *p_cachedSubtitle;
    *p_cachedSubtitle = (NSString *)v66;

  }
  v69 = self->_cachedContentModifiedDate;
  if (v69 && self->_cachedType != 1 && !self->_cachedSubtitle2)
  {
    BRFormatModifiedAgoWithDate(v69);
    v70 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedSubtitle2 = self->_cachedSubtitle2;
    self->_cachedSubtitle2 = v70;

  }
  objc_msgSend(v75, "valueForKey:", *MEMORY[0x24BE174F8]);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (NSArray *)objc_msgSend(v72, "copy");
  cachedTags = self->_cachedTags;
  self->_cachedTags = v73;

}

- (int64_t)type
{
  return self->_cachedType;
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
  return self->_cachedURL;
}

- (id)contentType
{
  return self->_cachedContentType;
}

- (id)urlInLocalContainer
{
  NSURL *cachedURLInLocalContainer;

  cachedURLInLocalContainer = self->_cachedURLInLocalContainer;
  if (!cachedURLInLocalContainer)
    cachedURLInLocalContainer = self->_cachedURL;
  return cachedURLInLocalContainer;
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
    -[_UIDocumentPickerContainerMetadataItem sortPathComponents](self, "sortPathComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerContainerMetadataItem _cacheIndentationLevelWithSortPathComponents:](self, "_cacheIndentationLevelWithSortPathComponents:", v4);

    return self->_cachedIndentation;
  }
  return result;
}

- (id)sortPathComponents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[_UIDocumentPickerContainerMetadataItem url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE17610], "mobileDocumentsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_pathRelativeToPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!objc_msgSend(v8, "count"))
  {
    v17 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_15;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17558]);
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v10 & 1) == 0)
    {
      v18 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE17538]);

      if (v18)
        objc_msgSend(v8, "removeObjectAtIndex:", 1);
      goto LABEL_12;
    }
    v13 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE17578]);

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("Documents");
LABEL_11:
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, v16, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v21, 1);

      goto LABEL_12;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BE17568]);

    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("Desktop");
      goto LABEL_11;
    }
  }
LABEL_12:
  objc_msgSend(v2, "br_cloudDocsContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "localizedName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:atIndexedSubscript:", v24, 0);

  }
  v17 = v8;

LABEL_15:
  return v17;
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
    -[_UIDocumentPickerContainerMetadataItem sortPathComponents](self, "sortPathComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("/"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedSortPath;
    self->_cachedSortPath = v6;

    if (self->_cachedIndentation == 0x7FFFFFFFFFFFFFFFLL)
      -[_UIDocumentPickerContainerMetadataItem _cacheIndentationLevelWithSortPathComponents:](self, "_cacheIndentationLevelWithSortPathComponents:", v5);

    cachedSortPath = self->_cachedSortPath;
  }
  v8 = cachedSortPath;
  objc_autoreleasePoolPop(v3);
  return v8;
}

- (BOOL)renameable
{
  return self->_cachedRenameable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFileObjectID, 0);
  objc_storeStrong((id *)&self->_cachedContentModifiedDate, 0);
  objc_storeStrong((id *)&self->_cachedContentType, 0);
  objc_storeStrong((id *)&self->_cachedSortPath, 0);
  objc_storeStrong((id *)&self->_cachedURLInLocalContainer, 0);
  objc_storeStrong((id *)&self->_cachedURL, 0);
  objc_storeStrong((id *)&self->_cachedTags, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle2, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle, 0);
  objc_storeStrong((id *)&self->_cachedTitle, 0);
}

@end
