@implementation ETDataSourceFromFolderData

- (ETDataSourceFromFolderData)initWithFolder:(id)a3 balanceClassesForTraining:(BOOL)a4
{
  _BOOL8 v4;
  ETDataSourceFromFolderData *v7;
  void *v8;
  NSString *imagesDir;
  id v10;
  uint64_t v11;
  NSMutableDictionary *folderToImages;
  uint64_t v13;
  NSMutableDictionary *pathToClassIndex;
  uint64_t v15;
  NSMutableArray *classNames;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *imageFileNames;
  void *v41;
  id v42;
  id obj;
  uint64_t v44;
  id *p_imagesDir;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  ETDataSourceFromFolderData *v52;
  unsigned int v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  char v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  objc_super v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v4 = a4;
  v69 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v66.receiver = self;
  v66.super_class = (Class)ETDataSourceFromFolderData;
  v7 = -[ETDataSourceFromFolderData init](&v66, sel_init);
  v52 = v7;
  if (v7)
  {
    srand(0x7Bu);
    p_imagesDir = (id *)&v7->_imagesDir;
    objc_storeStrong((id *)&v7->_imagesDir, a3);
    -[ETDataSourceFromFolderData setBalanceClassesForTraining:](v7, "setBalanceClassesForTraining:", v4);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    imagesDir = v7->_imagesDir;
    v65 = 0;
    objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", imagesDir, &v65);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v65;

    v11 = objc_opt_new();
    folderToImages = v7->_folderToImages;
    v7->_folderToImages = (NSMutableDictionary *)v11;

    v51 = (void *)objc_opt_new();
    v13 = objc_opt_new();
    pathToClassIndex = v7->_pathToClassIndex;
    v7->_pathToClassIndex = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    classNames = v7->_classNames;
    v7->_classNames = (NSMutableArray *)v15;

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v41;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v17)
    {
      v53 = 0;
      v44 = *(_QWORD *)v62;
      do
      {
        v50 = 0;
        v46 = v17;
        do
        {
          if (*(_QWORD *)v62 != v44)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v50);
          -[NSMutableArray addObject:](v52->_classNames, "addObject:", v18);
          objc_msgSend(*p_imagesDir, "stringByAppendingPathComponent:", v18);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v18;
          v60 = 0;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v54, &v60);

          if (v60)
            v21 = v20;
          else
            v21 = 0;
          if (v21 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v10;
            objc_msgSend(v22, "contentsOfDirectoryAtPath:error:", v54, &v59);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v59;

            if (v49)
            {
              NSLog(CFSTR("Error with image folder %@"), v49);
            }
            else
            {
              v23 = (void *)objc_opt_new();
              v57 = 0u;
              v58 = 0u;
              v55 = 0u;
              v56 = 0u;
              v24 = v47;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
              if (v25)
              {
                v26 = *(_QWORD *)v56;
                do
                {
                  for (i = 0; i != v25; ++i)
                  {
                    if (*(_QWORD *)v56 != v26)
                      objc_enumerationMutation(v24);
                    v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
                    objc_msgSend(v28, "pathExtension");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "lowercaseString");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("jpeg"));

                    objc_msgSend(v28, "pathExtension");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "lowercaseString");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("jpg"));

                    if (v31 | v34)
                    {
                      objc_msgSend(v54, "stringByAppendingPathComponent:", v28);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "addObject:", v35);
                      objc_msgSend(v23, "addObject:", v35);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v53);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v52->_pathToClassIndex, "setObject:forKeyedSubscript:", v36, v35);

                    }
                  }
                  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
                }
                while (v25);
              }

              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v23);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v52->_folderToImages, "setObject:forKeyedSubscript:", v37, v48);

            }
            v10 = v49;
          }

          ++v53;
          ++v50;
        }
        while (v50 != v46);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v17);
    }

    v52->_numberOfClasses = -[NSMutableArray count](v52->_classNames, "count");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v51);
    v38 = objc_claimAutoreleasedReturnValue();
    imageFileNames = v52->_imageFileNames;
    v52->_imageFileNames = (NSArray *)v38;

  }
  return v52;
}

- (vImage_Buffer)bufferWithPath:(SEL)a3
{
  id v5;
  CGDataProvider *v6;
  CGImage *v7;
  vImage_Buffer *result;
  vImage_CGImageFormat format;

  v5 = objc_retainAutorelease(a4);
  v6 = CGDataProviderCreateWithFilename((const char *)objc_msgSend(v5, "UTF8String"));
  v7 = CGImageCreateWithJPEGDataProvider(v6, 0, 0, kCGRenderingIntentDefault);
  format.bitsPerComponent = CGImageGetBitsPerComponent(v7);
  format.bitsPerPixel = CGImageGetBitsPerPixel(v7);
  format.colorSpace = 0;
  format.bitmapInfo = CGImageGetBitmapInfo(v7);
  memset(&format.version, 0, 20);
  vImageBuffer_InitWithCGImage(retstr, &format, 0, v7, 0);
  CFRelease(v7);
  CFRelease(v6);

  return result;
}

- (id)dataPointAtIndex:(int)a3
{
  int v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float *v13;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  if (-[ETDataSourceFromFolderData balanceClassesForTraining](self, "balanceClassesForTraining", *(_QWORD *)&a3))
  {
    v4 = rand();
    -[ETDataSourceFromFolderData classNames](self, "classNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 % (unint64_t)objc_msgSend(v5, "count");

    -[ETDataSourceFromFolderData classNames](self, "classNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ETDataSourceFromFolderData folderToImages](self, "folderToImages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectAtIndexedSubscript:", rand() % (unint64_t)objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_imageFileNames, "objectAtIndexedSubscript:", rand() % -[NSArray count](self->_imageFileNames, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pathToClassIndex, "objectForKeyedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "intValue");
  }

  v16 = 0u;
  v17 = 0u;
  -[ETDataSourceFromFolderData bufferWithPath:](self, "bufferWithPath:", v11);
  v12 = (void *)objc_opt_new();
  v15[0] = v16;
  v15[1] = v17;
  objc_msgSend(v12, "setImage:forKey:", v15, CFSTR("data"));
  v13 = (float *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
  *v13 = (float)(int)v6;
  objc_msgSend(v12, "setData:size:forKey:freeWhenDone:", v13, 4, CFSTR("label"), 1);

  return v12;
}

- (int)numberOfDataPoints
{
  void *v2;
  int v3;

  -[ETDataSourceFromFolderData imageFileNames](self, "imageFileNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int)numberOfClasses
{
  return self->_numberOfClasses;
}

- (void)setNumberOfClasses:(int)a3
{
  self->_numberOfClasses = a3;
}

- (BOOL)balanceClassesForTraining
{
  return self->_balanceClassesForTraining;
}

- (void)setBalanceClassesForTraining:(BOOL)a3
{
  self->_balanceClassesForTraining = a3;
}

- (NSString)imagesDir
{
  return self->_imagesDir;
}

- (void)setImagesDir:(id)a3
{
  objc_storeStrong((id *)&self->_imagesDir, a3);
}

- (NSMutableDictionary)folderToImages
{
  return self->_folderToImages;
}

- (void)setFolderToImages:(id)a3
{
  objc_storeStrong((id *)&self->_folderToImages, a3);
}

- (NSArray)imageFileNames
{
  return self->_imageFileNames;
}

- (void)setImageFileNames:(id)a3
{
  objc_storeStrong((id *)&self->_imageFileNames, a3);
}

- (NSMutableArray)classNames
{
  return self->_classNames;
}

- (void)setClassNames:(id)a3
{
  objc_storeStrong((id *)&self->_classNames, a3);
}

- (NSMutableDictionary)pathToClassIndex
{
  return self->_pathToClassIndex;
}

- (void)setPathToClassIndex:(id)a3
{
  objc_storeStrong((id *)&self->_pathToClassIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathToClassIndex, 0);
  objc_storeStrong((id *)&self->_classNames, 0);
  objc_storeStrong((id *)&self->_imageFileNames, 0);
  objc_storeStrong((id *)&self->_folderToImages, 0);
  objc_storeStrong((id *)&self->_imagesDir, 0);
}

@end
