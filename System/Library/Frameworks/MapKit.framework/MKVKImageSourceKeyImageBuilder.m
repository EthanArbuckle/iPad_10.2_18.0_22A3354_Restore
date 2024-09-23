@implementation MKVKImageSourceKeyImageBuilder

+ (id)calculateImagesForParameters:(id)a3
{
  id v4;
  MKVKImageSourceKeyImageResult *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MKVKImageSourceKeyImageResult initWithParameters:]([MKVKImageSourceKeyImageResult alloc], "initWithParameters:", v4);
  objc_msgSend(v4, "imageSourceKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((containsKey(v8, v14) & 1) == 0)
          objc_msgSend(v8, "addObject:", v14, (_QWORD)v16);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "_recursivelyGetImages:accumulator:", v8, v5);
  return v5;
}

+ (void)_recursivelyGetImages:(id)a3 accumulator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __objc2_class **v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  UIImage *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v37 = a1;
  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v5;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v41)
  {
    v8 = *(_QWORD *)v49;
    v9 = off_1E20D5000;
    v38 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[__objc2_class sharedInstance](v9[30], "sharedInstance", v37);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "parameters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "scale");
        v47 = 0;
        objc_msgSend(v12, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:fullBleedColor:", v11, 8, 2, 0, &v47);
        v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v15 = v47;

        if (!v14)
        {
          -[__objc2_class sharedInstance](v9[30], "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "parameters");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "scale");
          v46 = v15;
          objc_msgSend(v16, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:fullBleedColor:", v11, 7, 2, 0, &v46);
          v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
          v18 = v46;
          v19 = v15;
          v15 = v18;

        }
        objc_msgSend(v6, "triedKeys");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v11);

        if (!v14)
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v11, "fallbackImageKeys");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          if (v28)
          {
            v29 = v28;
            v39 = v15;
            v30 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v43 != v30)
                  objc_enumerationMutation(v21);
                v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                objc_msgSend(v6, "triedKeys");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if ((containsKey(v33, v32) & 1) != 0)
                {

                }
                else
                {
                  v34 = containsKey(v7, v32);

                  if ((v34 & 1) == 0)
                    objc_msgSend(v7, "addObject:", v32);
                }
              }
              v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
            }
            while (v29);
            v8 = v38;
            v15 = v39;
            v9 = off_1E20D5000;
          }
          v14 = 0;
LABEL_28:

          goto LABEL_29;
        }
        UIImagePNGRepresentation(v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_28;
        objc_msgSend(v6, "imageDatas");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsObject:", v21);

        if ((v23 & 1) != 0)
          goto LABEL_28;
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "imageDatas");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v21);

        objc_msgSend(v6, "mutableImages");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v14);

        objc_msgSend(v6, "addFullBleedColor:", v15);
        objc_msgSend(v6, "mutableImages");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (v27 >= 5)
        {

          goto LABEL_31;
        }
LABEL_29:

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v41);
  }
LABEL_31:

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "mutableImages");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36 <= 4)
    {
      objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_97);
      objc_msgSend(v37, "_recursivelyGetImages:accumulator:", v7, v6);
    }
  }

}

uint64_t __68__MKVKImageSourceKeyImageBuilder__recursivelyGetImages_accumulator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "keyType");
  if (v6 < objc_msgSend(v5, "keyType"))
    goto LABEL_2;
  v8 = objc_msgSend(v4, "keyType");
  if (v8 > objc_msgSend(v5, "keyType"))
  {
LABEL_4:
    v7 = 1;
    goto LABEL_16;
  }
  v9 = objc_msgSend(v4, "keyType");
  if ((v9 - 4) < 2)
  {
    objc_msgSend(v4, "imageName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageName");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v9 == 2)
  {
    v15 = objc_msgSend(v4, "iconAttributeKey");
    if (v15 >= objc_msgSend(v5, "iconAttributeKey"))
    {
      v16 = objc_msgSend(v4, "iconAttributeKey");
      v7 = v16 > objc_msgSend(v5, "iconAttributeKey");
      goto LABEL_16;
    }
    goto LABEL_2;
  }
  if (v9 != 1)
  {
    v7 = 0;
    goto LABEL_16;
  }
  v10 = objc_msgSend(v4, "shieldType");
  if (v10 >= objc_msgSend(v5, "shieldType"))
  {
    v11 = objc_msgSend(v4, "shieldType");
    if (v11 > objc_msgSend(v5, "shieldType"))
      goto LABEL_4;
    objc_msgSend(v4, "shieldText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shieldText");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = (void *)v13;
    v7 = objc_msgSend(v12, "compare:", v13);

    goto LABEL_16;
  }
LABEL_2:
  v7 = -1;
LABEL_16:

  return v7;
}

@end
