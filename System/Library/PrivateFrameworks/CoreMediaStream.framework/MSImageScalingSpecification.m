@implementation MSImageScalingSpecification

- (double)scaleFactorForInputSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double result;

  if (a3.width >= a3.height)
    height = a3.height;
  else
    height = a3.width;
  if (a3.width >= a3.height)
    width = a3.width;
  else
    width = a3.height;
  -[MSImageScalingSpecification nominalShortSideLength](self, "nominalShortSideLength");
  v7 = v6 / height;
  v8 = floor(width * v7);
  -[MSImageScalingSpecification minimumLongSideLength](self, "minimumLongSideLength");
  if (v8 >= v9)
  {
    -[MSImageScalingSpecification maximumLongSideLength](self, "maximumLongSideLength");
    if (v8 <= v11)
      goto LABEL_12;
    -[MSImageScalingSpecification maximumLongSideLength](self, "maximumLongSideLength");
  }
  else
  {
    -[MSImageScalingSpecification minimumLongSideLength](self, "minimumLongSideLength");
  }
  v7 = v10 / width;
LABEL_12:
  result = 1.0;
  if (v7 <= 1.0)
    return v7;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)MSImageScalingSpecification;
  -[MSImageScalingSpecification description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSImageScalingSpecification nominalShortSideLength](self, "nominalShortSideLength");
  v6 = v5;
  -[MSImageScalingSpecification minimumLongSideLength](self, "minimumLongSideLength");
  v8 = v7;
  -[MSImageScalingSpecification maximumLongSideLength](self, "maximumLongSideLength");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Short side: %0.0f min long side: %0.0f max long side: %0.0f"), v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)nominalShortSideLength
{
  return self->_nominalShortSideLength;
}

- (void)setNominalShortSideLength:(double)a3
{
  self->_nominalShortSideLength = a3;
}

- (double)minimumLongSideLength
{
  return self->_minimumLongSideLength;
}

- (void)setMinimumLongSideLength:(double)a3
{
  self->_minimumLongSideLength = a3;
}

- (double)maximumLongSideLength
{
  return self->_maximumLongSideLength;
}

- (void)setMaximumLongSideLength:(double)a3
{
  self->_maximumLongSideLength = a3;
}

- (int)assetTypeFlags
{
  return self->_assetTypeFlags;
}

- (void)setAssetTypeFlags:(int)a3
{
  self->_assetTypeFlags = a3;
}

+ (MSImageScalingSpecification)specificationWithSharedAlbumSpecificationString:(id)a3
{
  id v3;
  MSImageScalingSpecification *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MSImageScalingSpecification);
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 3)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSImageScalingSpecification setNominalShortSideLength:](v4, "setNominalShortSideLength:", (double)objc_msgSend(v6, "integerValue"));

    objc_msgSend(v5, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSImageScalingSpecification setMinimumLongSideLength:](v4, "setMinimumLongSideLength:", (double)objc_msgSend(v7, "integerValue"));

    objc_msgSend(v5, "objectAtIndex:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSImageScalingSpecification setMaximumLongSideLength:](v4, "setMaximumLongSideLength:", (double)objc_msgSend(v8, "integerValue"));
  }
  else
  {
    v8 = v4;
    v4 = 0;
  }

  return v4;
}

+ (id)assetsToGenerateFromImageWithInputSize:(CGSize)a3 toConformToSpecifications:(id)a4
{
  double height;
  double width;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  double v21;
  float v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  double v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  height = a3.height;
  width = a3.width;
  v49 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "assetTypeFlags") & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "scaleFactorForInputSize:", width, height);
    v13 = v12;
    *(float *)&v12 = v12;
    __96__MSImageScalingSpecification_assetsToGenerateFromImageWithInputSize_toConformToSpecifications___block_invoke(CFSTR("thumbnail"), 1, *(float *)&v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = v6;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v20 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * j);
          if (v20 != v7)
          {
            objc_msgSend(v20, "scaleFactorForInputSize:", width, height);
            if (v21 <= v13)
            {
              objc_msgSend(v14, "objectForKey:", CFSTR("MSAssetMetadataAssetTypeFlags"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "intValue");

              objc_msgSend(v14, "setObject:forKey:", CFSTR("derivative"), CFSTR("MSAssetMetadataAssetType"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25 | 2u);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setObject:forKey:", v23, CFSTR("MSAssetMetadataAssetTypeFlags"));
            }
            else
            {
              v22 = v21;
              __96__MSImageScalingSpecification_assetsToGenerateFromImageWithInputSize_toConformToSpecifications___block_invoke(CFSTR("derivative"), 2, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v23);
            }

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v17);
    }

    v6 = v33;
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v14 = v6;
    v26 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "scaleFactorForInputSize:", width, height);
          *(float *)&v30 = v30;
          __96__MSImageScalingSpecification_assetsToGenerateFromImageWithInputSize_toConformToSpecifications___block_invoke(CFSTR("derivative"), 2, *(float *)&v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v31);

        }
        v27 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v27);
    }
  }

  return v11;
}

id __96__MSImageScalingSpecification_assetsToGenerateFromImageWithInputSize_toConformToSpecifications___block_invoke(void *a1, uint64_t a2, float a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a1;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("scaleFactor"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("MSAssetMetadataAssetType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("MSAssetMetadataAssetTypeFlags"));

  return v7;
}

@end
