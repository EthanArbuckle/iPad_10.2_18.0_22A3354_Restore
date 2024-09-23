@implementation PHAssetResourceQualityClass

- (BOOL)isCroppedToSquare
{
  return self->_croppedToSquare;
}

- (unint64_t)metalPixelFormat
{
  return self->_metalPixelFormat;
}

- (__CFString)colorSpaceName
{
  return self->_colorSpaceName;
}

- (BOOL)isTable
{
  return self->_table;
}

- (int64_t)_compare:(id)a3
{
  id v4;
  unint64_t maxSideLengthIfSquare;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  maxSideLengthIfSquare = self->_maxSideLengthIfSquare;
  if (maxSideLengthIfSquare <= objc_msgSend(v4, "maxSideLengthIfSquare"))
  {
    v7 = self->_maxSideLengthIfSquare;
    if (v7 >= objc_msgSend(v4, "maxSideLengthIfSquare"))
      v6 = 0;
    else
      v6 = -1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (unint64_t)maxSideLengthIfSquare
{
  return self->_maxSideLengthIfSquare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingImageFormat, 0);
}

uint64_t __76__PHAssetResourceQualityClass_allQualityClassesMatchingPredicate_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_compare:");
}

+ (id)allQualityClassesMatchingPredicate:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "assetResourceQualityClassesInLibrary:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "filteredArrayUsingPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_35911);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)assetResourceQualityClassesInLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_thumbnailAssetResourceQualityClassesForCurrentDeviceInLibrary:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v7);
  objc_msgSend(a1, "_cplDerivativeAssetResourceQualityClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  return v6;
}

+ (id)_thumbnailAssetResourceQualityClassesForCurrentDeviceInLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PHAssetResourceQualityClass *v12;
  PHAssetResourceQualityClass *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71B80], "thumbnailFormatsForConfigPhase:withPathManager:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
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
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [PHAssetResourceQualityClass alloc];
        v13 = -[PHAssetResourceQualityClass initWithThumbnailFormat:](v12, "initWithThumbnailFormat:", v11, (_QWORD)v15);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (PHAssetResourceQualityClass)initWithThumbnailFormat:(id)a3
{
  id v5;
  PHAssetResourceQualityClass *v6;
  double v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAssetResourceQualityClass;
  v6 = -[PHAssetResourceQualityClass init](&v9, sel_init);
  if (v6)
  {
    v6->_croppedToSquare = objc_msgSend(v5, "isCropped");
    v6->_table = objc_msgSend(v5, "isTable");
    objc_storeStrong((id *)&v6->_backingImageFormat, a3);
    v6->_video = 0;
    v6->_thumbnailKind = objc_msgSend(v5, "thumbnailKind");
    v6->_metalPixelFormat = objc_msgSend(v5, "metalPixelFormat");
    v6->_colorSpaceName = (__CFString *)objc_msgSend(v5, "colorSpaceName");
    objc_msgSend(v5, "dimension");
    v6->_maxSideLengthIfSquare = (unint64_t)v7;
    v6->_maxNumberOfPixelsIfSquare = (unint64_t)v7 * (unint64_t)v7;
  }

  return v6;
}

- (BOOL)isThumbnail
{
  return -[PHAssetResourceQualityClass thumbnailKind](self, "thumbnailKind") != 0;
}

- (int64_t)thumbnailKind
{
  return self->_thumbnailKind;
}

- (id)tableThumbnailDataForAsset:(id)a3 dataSpecification:(PHAssetResourceTableDataSpecification *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  int64_t v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceQualityClass.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailAsset"));

  }
  if (-[PHAssetResourceQualityClass isThumbnail](self, "isThumbnail")
    && objc_msgSend(v7, "thumbnailIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thumbnailManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    v25 = 0;
    v23 = 0;
    -[PHAssetResourceQualityClass backingImageFormat](self, "backingImageFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataForPhoto:format:allowPlaceholder:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v7, objc_msgSend(v12, "formatID"), 0, (char *)&v25 + 4, &v25, (char *)&v24 + 4, &v24, (char *)&v23 + 4, &v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v8, "length");
    if (a4 && v13)
    {
      v15 = v25;
      v14 = HIDWORD(v25);
      v17 = v24;
      v16 = HIDWORD(v24);
      v22 = v23;
      -[PHAssetResourceQualityClass backingImageFormat](self, "backingImageFormat");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "thumbnailKind");

      a4->var0 = v14;
      a4->var1 = v15;
      a4->var2 = v16;
      a4->var3 = v17;
      a4->var4 = HIDWORD(v22);
      a4->var5 = v22;
      a4->var6 = v19;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PLImageFormat)backingImageFormat
{
  return self->_backingImageFormat;
}

+ (id)_cplDerivativeAssetResourceQualityClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PHAssetResourceQualityClass *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(&unk_1E36575E8, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(&unk_1E36575E8);
        v7 = -[PHAssetResourceQualityClass initWithCPLResourceType:]([PHAssetResourceQualityClass alloc], "initWithCPLResourceType:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "integerValue"));
        objc_msgSend(v2, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E36575E8, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  return v2;
}

- (PHAssetResourceQualityClass)initWithCPLResourceType:(unint64_t)a3
{
  char *v4;
  PHAssetResourceQualityClass *v5;
  BOOL v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHAssetResourceQualityClass;
  v4 = -[PHAssetResourceQualityClass init](&v9, sel_init);
  v5 = (PHAssetResourceQualityClass *)v4;
  if (v4)
  {
    *(_WORD *)(v4 + 9) = 0;
    v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 6 || a3 == 28;
    *((_QWORD *)v4 + 3) = a3;
    *((_QWORD *)v4 + 4) = 0;
    v4[8] = v6;
    if (a3 > 0x1C || ((1 << a3) & 0x100000C0) == 0)
    {
      v7 = objc_msgSend(MEMORY[0x1E0D11440], "maxPixelSizeForResourceType:", a3);
      v5->_maxSideLengthIfSquare = (unint64_t)sqrt((double)v7);
      v5->_maxNumberOfPixelsIfSquare = v7;
    }
  }
  return v5;
}

- (id)tableThumbnailEntriesAtIndexes:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[PHAssetResourceQualityClass backingImageFormat](self, "backingImageFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTable");

  if (v9)
  {
    objc_msgSend(v7, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thumbnailManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAssetResourceQualityClass backingImageFormat](self, "backingImageFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "thumbManagerForFormatID:", objc_msgSend(v12, "formatID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "readImageEntriesAtIndexes:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)preheatDataForThumbnailIndexes:(id)a3 inLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(a4, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PHAssetResourceQualityClass backingImageFormat](self, "backingImageFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preheatThumbnailDataWithFormat:thumbnailIndexes:", objc_msgSend(v8, "formatID"), v6);

}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[PHAssetResourceQualityClass isTable](self, "isTable"))
  {
    v3 = CFSTR("table");
  }
  else if (-[PHAssetResourceQualityClass isThumbnail](self, "isThumbnail"))
  {
    v3 = CFSTR("master_thumb");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", self->_backingCPLResourceType);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7.receiver = self;
  v7.super_class = (Class)PHAssetResourceQualityClass;
  -[PHAssetResourceQualityClass description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" - %@, kind: %lu, side length: %lu"), v3, -[PHAssetResourceQualityClass thumbnailKind](self, "thumbnailKind"), self->_maxSideLengthIfSquare);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setBackingImageFormat:(id)a3
{
  objc_storeStrong((id *)&self->_backingImageFormat, a3);
}

- (unint64_t)backingCPLResourceType
{
  return self->_backingCPLResourceType;
}

- (void)setBackingCPLResourceType:(unint64_t)a3
{
  self->_backingCPLResourceType = a3;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (unint64_t)maxNumberOfPixelsIfSquare
{
  return self->_maxNumberOfPixelsIfSquare;
}

+ (id)anyQualityClassMatchingPredicate:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "assetResourceQualityClassesInLibrary:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "filteredArrayUsingPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
