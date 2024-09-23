@implementation BLItemImageCollection

- (BLItemImageCollection)initWithImageCollection:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BLItemImageCollection *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v3);
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v5;
    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = -[BLItemImageCollection _newImagesForDictionary:](self, "_newImagesForDictionary:", v11);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v22;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v22 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17++));
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v15);
          }

        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v18 = -[BLItemImageCollection initWithItemImages:](self, "initWithItemImages:", v4);
  return v18;
}

- (BLItemImageCollection)initWithItemImages:(id)a3
{
  id v4;
  BLItemImageCollection *v5;
  uint64_t v6;
  NSArray *itemImages;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLItemImageCollection;
  v5 = -[BLItemImageCollection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemImages = v5->_itemImages;
    v5->_itemImages = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSArray copyWithZone:](self->_itemImages, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (id)bestImageForSize:(CGSize)a3
{
  void *v3;
  void *v4;

  -[BLItemImageCollection imagesForSize:](self, "imagesForSize:", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)imagesForSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  GSMainScreenScaleFactor();
  -[BLItemImageCollection _imagesForSize:scale:](self, "_imagesForSize:scale:", width, height, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  if (!objc_msgSend(v6, "count"))
  {
    -[BLItemImageCollection _imagesForSize:scale:](self, "_imagesForSize:scale:", width, height, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v9);

  }
  objc_msgSend(v6, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingFunction:context:", sub_212CA71A0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)imagesForKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GSMainScreenScaleFactor();
  v8 = v7;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = self->_itemImages;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = v8;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "imageKind", (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v4);

        if (v17)
        {
          objc_msgSend(v15, "imageScale");
          if (v18 == v12)
            objc_msgSend(v6, "addObject:", v15);
          objc_msgSend(v5, "addObject:", v15);
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v6, "count"))
    v19 = v6;
  else
    v19 = v5;
  objc_msgSend(v19, "sortedArrayUsingFunction:context:", sub_212CA71A0, 0, (_QWORD)v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_imagesForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  double v25;
  double v26;
  double v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t k;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSArray *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  height = a3.height;
  width = a3.width;
  v58 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v9 = self->_itemImages;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v14, "imageSize");
        if (width == v16 && height == v15)
        {
          if (a4 < 0.00000011920929 || (objc_msgSend(v14, "imageScale"), v18 == a4))
            objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v8, "count"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = self->_itemImages;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v48 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(v24, "imageSize");
          if (BLItemImageSizeEqualToSize(width, height, v25, v26))
          {
            if (a4 < 0.00000011920929 || (objc_msgSend(v24, "imageScale"), v27 == a4))
              objc_msgSend(v8, "addObject:", v24);
          }
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v21);
    }

  }
  if (!objc_msgSend(v8, "count"))
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v28 = self->_itemImages;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (!v29)
    {
      v31 = v28;
      goto LABEL_44;
    }
    v30 = v29;
    v31 = 0;
    v32 = *(_QWORD *)v44;
    v33 = 1.79769313e308;
    v34 = width / height;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(v28);
        v36 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
        if (a4 >= 0.00000011920929)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "imageScale", (_QWORD)v43);
          if (v37 != a4)
            continue;
        }
        objc_msgSend(v36, "imageSize", (_QWORD)v43);
        v40 = vabdd_f64(v34, v38 / v39);
        if (v40 < v33)
        {
          v41 = v36;

          v33 = v40;
          v31 = v41;
        }
      }
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v30);

    if (v31)
    {
      objc_msgSend(v8, "addObject:", v31);
LABEL_44:

    }
  }
  return v8;
}

- (id)_newImagesForDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  BLItemArtworkImage *v12;
  void *v13;
  BLItemArtworkImage *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "objectForKey:", CFSTR("image-type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = -[BLItemArtworkImage initWithArtworkDictionary:]([BLItemArtworkImage alloc], "initWithArtworkDictionary:", v11);
            -[BLItemArtworkImage URLString](v12, "URLString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              -[BLItemArtworkImage setImageKindWithTypeName:variantName:](v12, "setImageKindWithTypeName:variantName:", v4, v10);
              objc_msgSend(v17, "addObject:", v12);
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

  }
  else
  {
    v14 = -[BLItemArtworkImage initWithArtworkDictionary:]([BLItemArtworkImage alloc], "initWithArtworkDictionary:", v3);
    -[BLItemArtworkImage URLString](v14, "URLString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v17, "addObject:", v14);

  }
  return v17;
}

- (NSArray)itemImages
{
  return self->_itemImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemImages, 0);
}

@end
