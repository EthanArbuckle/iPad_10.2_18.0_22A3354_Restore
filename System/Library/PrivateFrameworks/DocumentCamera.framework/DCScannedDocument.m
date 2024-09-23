@implementation DCScannedDocument

+ (id)scannedDocumentsFolderURL
{
  if (scannedDocumentsFolderURL_onceToken != -1)
    dispatch_once(&scannedDocumentsFolderURL_onceToken, &__block_literal_global_10);
  return (id)scannedDocumentsFolderURL_URL;
}

void __46__DCScannedDocument_scannedDocumentsFolderURL__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[DCCachesDirectory sharedCachesDirectory](DCCachesDirectory, "sharedCachesDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cachesDirectoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("com.apple.ScannedDocuments"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)scannedDocumentsFolderURL_URL;
  scannedDocumentsFolderURL_URL = v1;

}

+ (void)initialize
{
  void *v2;
  void *v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    +[DCScannedDocument scannedDocumentsFolderURL](DCScannedDocument, "scannedDocumentsFolderURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

  }
}

- (DCScannedDocument)initWithDocInfoCollection:(id)a3 imageCache:(id)a4
{
  id v5;
  id v6;
  DCScannedDocument *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSURL *scannedDocumentImageDirectoryURL;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DCScannedDocument;
  v5 = a4;
  v6 = a3;
  v7 = -[DCScannedDocument init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID", v19.receiver, v19.super_class);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[DCScannedDocument scannedDocumentsFolderURL](DCScannedDocument, "scannedDocumentsFolderURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    scannedDocumentImageDirectoryURL = v7->_scannedDocumentImageDirectoryURL;
    v7->_scannedDocumentImageDirectoryURL = (NSURL *)v11;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v19.receiver, v19.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDF75E0];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel_applicationWillTerminate_, v14, v15);

  -[DCScannedDocument copyImagesFromDocInfoCollection:imageCache:](v7, "copyImagesFromDocInfoCollection:imageCache:", v6, v5);
  objc_msgSend(v6, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v16, "copy");
  -[DCScannedDocument setTitle:](v7, "setTitle:", v17);

  return v7;
}

- (DCScannedDocument)initWithURL:(id)a3 error:(id *)a4
{
  DCScannedDocument *v5;
  DCScannedDocument *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSURL *scannedDocumentImageDirectoryURL;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  ICDocCamDocumentInfo *v34;
  ICDocCamImageQuad *v35;
  ICDocCamImageQuad *v36;
  void *v37;
  int v38;
  DCScannedDocument *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  DCScannedDocument *v52;
  void *v53;
  void *v54;
  id v55;
  CGPoint v56;
  CGPoint v57;
  CGPoint v58;
  CGPoint point;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v55 = a3;
  v64.receiver = self;
  v64.super_class = (Class)DCScannedDocument;
  v5 = -[DCScannedDocument init](&v64, sel_init);
  v6 = v5;
  if (!v5)
  {
LABEL_21:
    v39 = v6;
    goto LABEL_26;
  }
  v52 = v5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    -[DCScannedDocument pListURL:](v52, "pListURL:", v55);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "fileExistsAtPath:", v11);

    if ((v12 & 1) == 0)
    {

      v39 = 0;
      v6 = v52;
      goto LABEL_26;
    }
    v46 = v7;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();

    +[DCScannedDocument scannedDocumentsFolderURL](DCScannedDocument, "scannedDocumentsFolderURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)v14;
    objc_msgSend(v15, "URLByAppendingPathComponent:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    scannedDocumentImageDirectoryURL = v52->_scannedDocumentImageDirectoryURL;
    v52->_scannedDocumentImageDirectoryURL = (NSURL *)v16;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BDF75E0];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v52, sel_applicationWillTerminate_, v19, v20);

    v45 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("Version"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("DocumentName"));
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(v55, "lastPathComponent");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v41 = (void *)v22;
    -[DCScannedDocument setTitle:](v52, "setTitle:", v22);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCScannedDocument setDocInfos:](v52, "setDocInfos:", v23);

    v43 = v21;
    objc_msgSend(v21, "objectForKey:", CFSTR("DocumentInfos"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = v52;
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v49)
    {
      v48 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v61 != v48)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v25, "objectForKey:", CFSTR("Metadata"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", CFSTR("ImageQuad"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          point.x = 0.0;
          point.y = 0.0;
          v58.x = 0.0;
          v58.y = 0.0;
          v57.x = 0.0;
          v57.y = 0.0;
          v56.x = 0.0;
          v56.y = 0.0;
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v26, "objectForKey:", CFSTR("ImageQuadTopLeft")), &point);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v26, "objectForKey:", CFSTR("ImageQuadTopRight")), &v58);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v26, "objectForKey:", CFSTR("ImageQuadBottomLeft")), &v57);
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v26, "objectForKey:", CFSTR("ImageQuadBottomRight")), &v56);
          objc_msgSend(v25, "objectForKey:", CFSTR("CroppedAndFilteredImage"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", CFSTR("FullImage"));
          v28 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", CFSTR("FilterType"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", CFSTR("Orientation"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = +[ICDocCamImageFilters imageFilterTypeFromNonLocalizedName:](ICDocCamImageFilters, "imageFilterTypeFromNonLocalizedName:", v29);
          v50 = dc_orientationFromNonLocalizedName(v30);
          objc_msgSend(v25, "objectForKey:", CFSTR("MarkupModelData"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[DCScannedDocument copyImageForLoading:fromFolderURL:](v6, "copyImageForLoading:fromFolderURL:", v27, v55);
          v53 = (void *)v28;
          if (v32)
          {
            v33 = -[DCScannedDocument copyImageForLoading:fromFolderURL:](v6, "copyImageForLoading:fromFolderURL:", v28, v55);
            if (v33)
            {
              v34 = -[ICDocCamDocumentInfo initWithDelegate:]([ICDocCamDocumentInfo alloc], "initWithDelegate:", 0);
              -[ICDocCamDocumentInfo setMetaData:](v34, "setMetaData:", v54);
              v35 = [ICDocCamImageQuad alloc];
              v36 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v35, "initWithBottomLeft:bottomRight:topLeft:topRight:", v57.x, v57.y, v56.x, v56.y, point.x, point.y, v58.x, v58.y);
              -[ICDocCamDocumentInfo setImageQuad:](v34, "setImageQuad:", v36);

              -[ICDocCamDocumentInfo setCroppedAndFilteredImageUUID:](v34, "setCroppedAndFilteredImageUUID:", v32);
              -[ICDocCamDocumentInfo setFullImageUUID:](v34, "setFullImageUUID:", v33);
              -[ICDocCamDocumentInfo setCurrentFilter:](v34, "setCurrentFilter:", v51);
              -[ICDocCamDocumentInfo setCurrentOrientation:](v34, "setCurrentOrientation:", v50);
              -[ICDocCamDocumentInfo setMarkupModelData:](v34, "setMarkupModelData:", v31);
              -[DCScannedDocument docInfos](v52, "docInfos");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v34);

              v38 = 0;
            }
            else
            {
              v38 = 1;
            }

          }
          else
          {
            v38 = 1;
          }

          if (v38)
          {

            goto LABEL_25;
          }
          v6 = v52;
        }
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        if (v49)
          continue;
        break;
      }
    }

    goto LABEL_21;
  }

LABEL_25:
  v39 = 0;
  v6 = v52;
LABEL_26:

  return v39;
}

- (void)dealloc
{
  objc_super v3;

  -[DCScannedDocument deleteAllImages](self, "deleteAllImages");
  v3.receiver = self;
  v3.super_class = (Class)DCScannedDocument;
  -[DCScannedDocument dealloc](&v3, sel_dealloc);
}

- (void)replaceContentsWithDocInfoCollection:(id)a3 imageCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[DCScannedDocument deleteAllImages](self, "deleteAllImages");
  -[DCScannedDocument setTitle:](self, "setTitle:", 0);
  -[DCScannedDocument copyImagesFromDocInfoCollection:imageCache:](self, "copyImagesFromDocInfoCollection:imageCache:", v7, v6);

  objc_msgSend(v7, "title");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v9, "copy");
  -[DCScannedDocument setTitle:](self, "setTitle:", v8);

}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CFDictionaryRef DictionaryRepresentation;
  void *v25;
  CFDictionaryRef v26;
  void *v27;
  CFDictionaryRef v28;
  void *v29;
  CFDictionaryRef v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  DCScannedDocument *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CGPoint v52;
  CGPoint v53;
  CGPoint v54;
  CGPoint v55;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);
  LOBYTE(v8) = 0;
  if (objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 0, 0, a4))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), &unk_24C5D8178, &unk_24C5D8190);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("Version"));

    -[DCScannedDocument title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[DCScannedDocument title](self, "title");
    else
      objc_msgSend(v6, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("DocumentName"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[DCScannedDocument docInfos](self, "docInfos");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v44)
    {
      v42 = v6;
      v43 = *(_QWORD *)v47;
      v38 = v9;
      v39 = v7;
      v41 = self;
      v37 = v12;
      while (2)
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v47 != v43)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v14, "croppedAndFilteredImageUUID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[DCScannedDocument copyImageForSaving:toFolderURL:](self, "copyImageForSaving:toFolderURL:", v8, v6);
          if (!v15)
            goto LABEL_20;
          v16 = v15;
          objc_msgSend(v14, "fullImageUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[DCScannedDocument copyImageForSaving:toFolderURL:](self, "copyImageForSaving:toFolderURL:", v17, v6);
          if (!v18)
          {

LABEL_20:
            LOBYTE(v8) = 0;
            v9 = v38;
            v7 = v39;
            v12 = v37;
            goto LABEL_21;
          }
          v19 = v18;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "metaData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("Metadata"));

          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "imageQuad");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "topLeft");
          DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v52);
          objc_msgSend(v22, "setObject:forKey:", DictionaryRepresentation, CFSTR("ImageQuadTopLeft"));

          objc_msgSend(v14, "imageQuad");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "topRight");
          v26 = CGPointCreateDictionaryRepresentation(v53);
          objc_msgSend(v22, "setObject:forKey:", v26, CFSTR("ImageQuadTopRight"));

          objc_msgSend(v14, "imageQuad");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "bottomLeft");
          v28 = CGPointCreateDictionaryRepresentation(v54);
          objc_msgSend(v22, "setObject:forKey:", v28, CFSTR("ImageQuadBottomLeft"));

          objc_msgSend(v14, "imageQuad");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "bottomRight");
          v30 = CGPointCreateDictionaryRepresentation(v55);
          objc_msgSend(v22, "setObject:forKey:", v30, CFSTR("ImageQuadBottomRight"));

          objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("ImageQuad"));
          objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("FullImage"));
          objc_msgSend(v20, "setObject:forKey:", v16, CFSTR("CroppedAndFilteredImage"));
          +[ICDocCamImageFilters nonLocalizedImageFilterNameForType:](ICDocCamImageFilters, "nonLocalizedImageFilterNameForType:", objc_msgSend(v14, "currentFilter"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v31, CFSTR("FilterType"));

          dc_nonLocalizedOrientationNameForType(objc_msgSend(v14, "currentOrientation"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v32, CFSTR("Orientation"));

          objc_msgSend(v14, "markupModelData");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            objc_msgSend(v14, "markupModelData");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKey:", v34, CFSTR("MarkupModelData"));

          }
          objc_msgSend(v45, "addObject:", v20);

          self = v41;
          v6 = v42;
        }
        v9 = v38;
        v7 = v39;
        v12 = v37;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v44)
          continue;
        break;
      }
    }

    objc_msgSend(v9, "setObject:forKey:", v45, CFSTR("DocumentInfos"));
    -[DCScannedDocument pListURL:](self, "pListURL:", v6);
    obj = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v9, "writeToURL:error:");
    if ((_DWORD)v8)
    {
      -[DCScannedDocument title](self, "title");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        -[DCScannedDocument setTitle:](self, "setTitle:", v12);
    }
LABEL_21:

  }
  return (char)v8;
}

- (id)copyImageForSaving:(id)a3 toFolderURL:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22 = 0;
  v8 = -[DCScannedDocument makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v22);
  v9 = v22;
  v10 = 0;
  if (v8)
  {
    -[DCScannedDocument URLForImageWithUUID:](self, "URLForImageWithUUID:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[DCScannedDocument URLForImageInFolder:withUUID:](self, "URLForImageInFolder:withUUID:", v7, v10);
      v16 = objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v17 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v11, v16, &v21);
      v18 = v21;
      if ((v17 & 1) == 0)
      {
        v19 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v24 = v11;
          v25 = 2112;
          v26 = v16;
          v27 = 2112;
          v28 = v18;
          _os_log_error_impl(&dword_20CE8E000, v19, OS_LOG_TYPE_ERROR, "Can't copy image file %@ to %@ because %@", buf, 0x20u);
        }

        v10 = 0;
      }

    }
    else
    {
      v16 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DCScannedDocument copyImageForSaving:toFolderURL:].cold.1();
      v10 = 0;
    }

  }
  return v10;
}

- (id)copyImageForLoading:(id)a3 fromFolderURL:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22 = 0;
  v8 = -[DCScannedDocument makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v22);
  v9 = v22;
  v10 = 0;
  if (v8)
  {
    -[DCScannedDocument URLForImageInFolder:withUUID:](self, "URLForImageInFolder:withUUID:", v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[DCScannedDocument URLForImageWithUUID:](self, "URLForImageWithUUID:", v10);
      v16 = objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v17 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v11, v16, &v21);
      v18 = v21;
      if ((v17 & 1) == 0)
      {
        v19 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v24 = v11;
          v25 = 2112;
          v26 = v16;
          v27 = 2112;
          v28 = v18;
          _os_log_error_impl(&dword_20CE8E000, v19, OS_LOG_TYPE_ERROR, "Can't copy image file %@ to %@ because %@", buf, 0x20u);
        }

        v10 = 0;
      }

    }
    else
    {
      v16 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DCScannedDocument copyImageForSaving:toFolderURL:].cold.1();
      v10 = 0;
    }

  }
  return v10;
}

- (id)pListURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("DocumentInfo.plist"));
}

- (id)imageForScanAtIndex:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[DCScannedDocument docInfos](self, "docInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    if (a4)
    {
      +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Index out of range."), CFSTR("Index out of range."), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BDD0FC8];
      v14[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), 1, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
  }
  else
  {
    -[DCScannedDocument imageOfPageAtIndex:](self, "imageOfPageAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (unint64_t)pageCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[DCScannedDocument docInfos](self, "docInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[DCScannedDocument docInfos](self, "docInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)imageOfPageAtIndex:(unint64_t)a3
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;

  -[DCScannedDocument docInfos](self, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v10 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DCScannedDocument imageOfPageAtIndex:].cold.1(v10, v14, v15, v16, v17, v18, v19, v20);
    v12 = 0;
    goto LABEL_11;
  }
  -[DCScannedDocument docInfos](self, "docInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a3)
  {
    -[DCScannedDocument docInfos](self, "docInfos");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject croppedAndFilteredImageUUID](v10, "croppedAndFilteredImageUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCScannedDocument getImage:](self, "getImage:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[DCScannedDocument imageOfPageAtIndex:].cold.2((uint64_t)v11, (uint64_t)v10, v13);

    }
LABEL_11:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:
  -[DCScannedDocument docInfos](self, "docInfos");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 <= a3)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("-[%@ %@]: index (%lu) beyond bounds (%lu)."), v28, v29, a3, -[DCScannedDocument pageCount](self, "pageCount"));
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], v30, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  if (v12)
    v23 = v12;
  else
    v23 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
  v24 = v23;

  return v24;
}

- (BOOL)copyImagesFromDocInfoCollection:(id)a3 imageCache:(id)a4
{
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  ICDocCamDocumentInfo *v17;
  void *v18;
  DCScannedDocument *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v48 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCScannedDocument setDocInfos:](self, "setDocInfos:", v7);

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v6, "docInfos");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (!v47)
  {
    v26 = 1;
    goto LABEL_19;
  }
  v46 = *(_QWORD *)v52;
  v44 = v6;
  while (2)
  {
    for (i = 0; i != v47; ++i)
    {
      if (*(_QWORD *)v52 != v46)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      objc_msgSend(v9, "croppedAndFilteredImageUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "getImageURL:async:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[DCScannedDocument copyImageAtURL:](self, "copyImageAtURL:", v11);
      objc_msgSend(v9, "fullImageUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "getImageURL:async:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[DCScannedDocument copyImageAtURL:](self, "copyImageAtURL:", v14);
      v16 = v15;
      if (!v12)
      {
        v27 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[DCScannedDocument copyImagesFromDocInfoCollection:imageCache:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

        -[DCScannedDocument deleteAllImages](self, "deleteAllImages");
        goto LABEL_18;
      }
      if (!v15)
      {
        v35 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[DCScannedDocument copyImagesFromDocInfoCollection:imageCache:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);

        -[DCScannedDocument deleteAllImages](self, "deleteAllImages");
LABEL_18:
        v6 = v44;

        v26 = 0;
        goto LABEL_19;
      }
      v50 = v11;
      v17 = -[ICDocCamDocumentInfo initWithDelegate:]([ICDocCamDocumentInfo alloc], "initWithDelegate:", 0);
      objc_msgSend(v9, "metaData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v10;
      v19 = self;
      v20 = (void *)objc_msgSend(v18, "copy");
      -[ICDocCamDocumentInfo setMetaData:](v17, "setMetaData:", v20);

      objc_msgSend(v9, "imageQuad");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "copy");
      -[ICDocCamDocumentInfo setImageQuad:](v17, "setImageQuad:", v22);

      self = v19;
      -[ICDocCamDocumentInfo setCroppedAndFilteredImageUUID:](v17, "setCroppedAndFilteredImageUUID:", v12);
      -[ICDocCamDocumentInfo setCroppedButNotFilteredImageUUID:](v17, "setCroppedButNotFilteredImageUUID:", 0);
      -[ICDocCamDocumentInfo setFullImageUUID:](v17, "setFullImageUUID:", v16);
      -[ICDocCamDocumentInfo setMeshAnimImageUUID:](v17, "setMeshAnimImageUUID:", 0);
      -[ICDocCamDocumentInfo setCurrentFilter:](v17, "setCurrentFilter:", objc_msgSend(v9, "currentFilter"));
      -[ICDocCamDocumentInfo setCurrentOrientation:](v17, "setCurrentOrientation:", objc_msgSend(v9, "currentOrientation"));
      -[ICDocCamDocumentInfo setScanDataDelegateIdentifier:](v17, "setScanDataDelegateIdentifier:", 0);
      objc_msgSend(v9, "markupModelData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "copy");
      -[ICDocCamDocumentInfo setMarkupModelData:](v17, "setMarkupModelData:", v24);

      -[DCScannedDocument docInfos](v19, "docInfos");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v17);

    }
    v26 = 1;
    v6 = v44;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v47)
      continue;
    break;
  }
LABEL_19:

  return v26;
}

- (BOOL)makeSureScanDirectoryExists:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[DCScannedDocument scannedDocumentImageDirectoryURL](self, "scannedDocumentImageDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, a3);

  if ((v6 & 1) == 0)
  {
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DCScannedDocument makeSureScanDirectoryExists:].cold.1((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);

  }
  return v6;
}

- (id)URLForImageInFolder:(id)a3 withUUID:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "URLByAppendingPathComponent:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("jpg"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)URLForImageWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DCScannedDocument scannedDocumentImageDirectoryURL](self, "scannedDocumentImageDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCScannedDocument URLForImageInFolder:withUUID:](self, "URLForImageInFolder:withUUID:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyImageAtURL:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v5 = -[DCScannedDocument makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v18);
  v6 = v18;
  v7 = 0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[DCScannedDocument URLForImageWithUUID:](self, "URLForImageWithUUID:", v7);
      v12 = objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v13 = objc_msgSend(v8, "copyItemAtURL:toURL:error:", v4, v12, &v17);
      v14 = v17;
      if ((v13 & 1) == 0)
      {
        v15 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v20 = v4;
          v21 = 2112;
          v22 = v12;
          v23 = 2112;
          v24 = v14;
          _os_log_error_impl(&dword_20CE8E000, v15, OS_LOG_TYPE_ERROR, "Can't copy image file %@ to %@ because %@", buf, 0x20u);
        }

        v7 = 0;
      }

    }
    else
    {
      v12 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[DCScannedDocument copyImageForSaving:toFolderURL:].cold.1();
      v7 = 0;
    }

  }
  return v7;
}

- (id)getImage:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;

  v4 = a3;
  if (!v4)
  {
    v6 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DCScannedDocument getImage:].cold.1(v6, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_7;
  }
  v22 = 0;
  v5 = -[DCScannedDocument makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v22);
  v6 = v22;
  if (!v5)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_12;
  }
  -[DCScannedDocument getImageURL:](self, "getImageURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v7, "path");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithContentsOfFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DCScannedDocument getImage:].cold.2();
    v13 = 0;
  }

LABEL_12:
  return v13;
}

- (BOOL)deleteImage:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  id v16;
  id v17;

  v4 = a3;
  v17 = 0;
  v5 = -[DCScannedDocument makeSureScanDirectoryExists:](self, "makeSureScanDirectoryExists:", &v17);
  v6 = v17;
  if (v5)
  {
    -[DCScannedDocument getImageURL:](self, "getImageURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if ((v10 & 1) != 0)
    {
      v16 = 0;
      v11 = objc_msgSend(v8, "removeItemAtURL:error:", v7, &v16);
      v12 = v16;
      if ((v11 & 1) != 0)
      {
        v13 = 1;
LABEL_12:

        goto LABEL_13;
      }
      v14 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DCScannedDocument deleteImage:].cold.1();
    }
    else
    {
      v14 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DCScannedDocument deleteImage:].cold.2();
      v12 = 0;
    }

    v13 = 0;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)deleteAllImages
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "Removal of directory failed with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSMutableArray)docInfos
{
  return self->_docInfos;
}

- (void)setDocInfos:(id)a3
{
  objc_storeStrong((id *)&self->_docInfos, a3);
}

- (NSURL)scannedDocumentImageDirectoryURL
{
  return self->_scannedDocumentImageDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannedDocumentImageDirectoryURL, 0);
  objc_storeStrong((id *)&self->_docInfos, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)copyImageForSaving:toFolderURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "File did not exist at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imageOfPageAtIndex:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "%s: nil docInfos", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)imageOfPageAtIndex:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[DCScannedDocument imageOfPageAtIndex:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "%s: nil image %@ %@", (uint8_t *)&v3, 0x20u);
}

- (void)copyImagesFromDocInfoCollection:(uint64_t)a3 imageCache:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20CE8E000, a1, a3, "File copy failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)makeSureScanDirectoryExists:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a2, a3, "Failed to create directory with error %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getImage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_20CE8E000, a1, a3, "DCScannedDocument getImage() called with nil fileUUID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)getImage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "DCScannedDocument getImage: Unable to find file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deleteImage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "Failed to delete image with error %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deleteImage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_20CE8E000, v0, v1, "DCScannedDocument deleteImage: Unable to find file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
