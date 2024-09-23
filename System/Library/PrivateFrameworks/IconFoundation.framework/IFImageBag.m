@implementation IFImageBag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesByScale, 0);
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  NSObject *v30;

  height = a3.height;
  width = a3.width;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IFImageBag imagesForScale:](self, "imagesForScale:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __33__IFImageBag_imageForSize_scale___block_invoke(width, height, (uint64_t)v9, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (width <= height)
    v12 = height;
  else
    v12 = width;
  v13 = v12 * a4;
  objc_msgSend(v10, "dimension");
  v15 = v14;
  objc_msgSend(v11, "scale");
  if (v15 * v16 < v13)
  {
    v17 = 2;
    v18 = 1.0;
    do
    {
      if (v18 != a4)
      {
        -[IFImageBag imagesForScale:](self, "imagesForScale:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        __33__IFImageBag_imageForSize_scale___block_invoke(width, height, v20, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dimension");
        v23 = v22;
        objc_msgSend(v21, "scale");
        v25 = v23 * v24;
        objc_msgSend(v11, "dimension");
        v27 = v26;
        objc_msgSend(v11, "scale");
        if (v25 >= v27 * v28)
        {
          v29 = v21;

          v11 = v29;
        }

        v9 = v19;
      }
      v18 = v18 + 1.0;
      --v17;
    }
    while (v17);
    IFDefaultLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[IFImageBag imageForSize:scale:].cold.1((uint64_t)v11, v30);

  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

id __33__IFImageBag_imageForSize_scale___block_invoke(double a1, double a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  BOOL v17;
  id v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "size", (_QWORD)v21);
        v14 = v13;
        objc_msgSend(v12, "size");
        if (v15 == a2)
        {
          v19 = v12;

          v6 = v19;
          goto LABEL_22;
        }
        if (v14 < v15 && v15 < a2)
          goto LABEL_17;
        v17 = v14 >= a2;
        if (v14 >= v15)
          v17 = 1;
        if (v15 < v14)
          v17 = 0;
        if (v15 >= a2 && !v17)
        {
LABEL_17:
          v18 = v12;

          v6 = v18;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_22:

  return v6;
}

- (id)imagesForScale:(double)a3
{
  NSMutableDictionary *imagesByScale;
  void *v6;
  void *v7;
  double v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v12;
  void *v13;

  imagesByScale = self->_imagesByScale;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](imagesByScale, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = 3.0;
    do
    {
      v9 = self->_imagesByScale;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v8 + -1.0;
    }
    while (v8 >= 1.0 && v7 == 0);
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      v12 = self->_imagesByScale;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v7, v13);

    }
  }
  return v7;
}

- (IFImageBag)init
{
  IFImageBag *v2;
  IFImageBag *v3;
  uint64_t v4;
  NSMutableDictionary *imagesByScale;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IFImageBag;
  v2 = -[IFImageBag init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    imagesByScale = v3->_imagesByScale;
    v3->_imagesByScale = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)insertImage:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *imagesByScale;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  imagesByScale = self->_imagesByScale;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v27, "scale");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](imagesByScale, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    v9 = self->_imagesByScale;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v27, "scale");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v11);

  }
  objc_msgSend(v27, "size");
  v13 = v12;
  objc_msgSend(v27, "size");
  v15 = v14;
  objc_msgSend(v27, "size");
  if (v13 <= v15)
    v18 = v17;
  else
    v18 = v16;
  if (objc_msgSend(v8, "count"))
  {
    v19 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "size");
      v22 = v21;
      objc_msgSend(v20, "size");
      v24 = v23;
      objc_msgSend(v20, "size");
      if (v22 <= v24)
        v25 = v26;
      if (v18 < v25)
      {
        objc_msgSend(v8, "insertObject:atIndex:", v27, v19);
        goto LABEL_16;
      }
      if (v18 == v25)
        break;

      if (objc_msgSend(v8, "count") <= (unint64_t)++v19)
        goto LABEL_13;
    }
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v19, v27);
LABEL_16:

  }
  else
  {
LABEL_13:
    objc_msgSend(v8, "addObject:", v27);
  }
  os_unfair_lock_unlock(p_lock);

}

- (IFImageBag)initWithImages:(id)a3
{
  id v4;
  IFImageBag *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IFImageBag init](self, "init");
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[IFImageBag insertImage:](v5, "insertImage:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (NSArray)images
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_imagesByScale, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v10;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v20.receiver = self;
  v20.super_class = (Class)IFImageBag;
  -[IFImageBag debugDescription](&v20, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_imagesByScale, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_imagesByScale, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "debugDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("Scale: %@ -> %@"), v11, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (NSMutableDictionary)imagesByScale
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImagesByScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

+ (id)imageBagWithResourcesNames:(id)a3 fromBundle:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __CFString *v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  IFImage *v34;
  IFImageBag *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v40 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  v37 = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "pathExtension");
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString length](v12, "length"))
          {
            objc_msgSend(v11, "stringByDeletingPathExtension");
            v13 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {

            v13 = v11;
            v12 = CFSTR("png");
          }
          if (v12)
            v14 = v13 == 0;
          else
            v14 = 1;
          if (!v14)
          {
            objc_msgSend(v13, "stringByAppendingPathExtension:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v38, "addObject:", v15);
            if ((objc_msgSend(v13, "hasSuffix:", CFSTR("2x"), v37) & 1) == 0
              && (objc_msgSend(v13, "hasSuffix:", CFSTR("3x")) & 1) == 0)
            {
              objc_msgSend(v13, "stringByAppendingString:", CFSTR("@2x"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringByAppendingPathExtension:", v12);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
                objc_msgSend(v38, "addObject:", v17);
              objc_msgSend(v13, "stringByAppendingString:", CFSTR("@3x"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringByAppendingPathExtension:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
                objc_msgSend(v38, "addObject:", v19);

              v6 = v37;
            }

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v8);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v20 = v38;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v25, "stringByDeletingPathExtension", v37);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pathExtension");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "URLForResource:withExtension:", v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          +[IFResourceMetadata metadataWithFileName:](IFResourceMetadata, "metadataWithFileName:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "scale");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v29, "scale");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "doubleValue");
            v33 = v32;

          }
          else
          {
            v33 = 1.0;
          }

          v34 = -[IFImage initWithContentsOfURL:scale:]([IFImage alloc], "initWithContentsOfURL:scale:", v28, v33);
          if (v34)
            objc_msgSend(v39, "addObject:", v34);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v39, "count"))
    v35 = -[IFImageBag initWithImages:]([IFImageBag alloc], "initWithImages:", v39);
  else
    v35 = 0;

  return v35;
}

+ (id)imageBagWithResourcesNamed:(id)a3 fromBundle:(id)a4
{
  return +[IFImageBag imageBagWithResourcesNamed:fromBundle:subdirectory:](IFImageBag, "imageBagWithResourcesNamed:fromBundle:subdirectory:", a3, a4, 0);
}

+ (id)imageBagWithResourcesNamed:(id)a3 fromBundle:(id)a4 subdirectory:(id)a5
{
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  IFImage *v23;
  IFImageBag *v24;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = v7;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v8;
  objc_msgSend(v7, "URLsForResourcesWithExtension:subdirectory:", CFSTR("png"), v8);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByDeletingPathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        +[IFResourceMetadata metadataWithFileName:](IFResourceMetadata, "metadataWithFileName:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "scale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "dimension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");
        objc_msgSend(v13, "dimension");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%dx%d"), v14, v18, objc_msgSend(v19, "intValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v14, "isEqualToString:", v32) & 1) != 0
          || objc_msgSend(v20, "isEqualToString:", v32))
        {
          if (v15)
          {
            objc_msgSend(v15, "doubleValue");
            v22 = v21;
          }
          else
          {
            v22 = 1.0;
          }
          v23 = -[IFImage initWithContentsOfURL:scale:]([IFImage alloc], "initWithContentsOfURL:scale:", v10, v22);
          if (v23)
            objc_msgSend(v28, "addObject:", v23);

        }
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v31);
  }
  if (objc_msgSend(v28, "count"))
    v24 = -[IFImageBag initWithImages:]([IFImageBag alloc], "initWithImages:", v28);
  else
    v24 = 0;

  return v24;
}

+ (id)imageBagWithResourcesNamed:(id)a3 directory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  IFImage *v22;
  IFImageBag *v23;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, MEMORY[0x1E0C9AA60], 7, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    v12 = *MEMORY[0x1E0CA5B90];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v14, "_IF_conformsToUTI:", v12))
        {
          objc_msgSend(v14, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByDeletingPathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          +[IFResourceMetadata metadataWithFileName:](IFResourceMetadata, "metadataWithFileName:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "scale");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isEqualToString:", v27))
          {
            if (v19)
            {
              objc_msgSend(v19, "doubleValue");
              v21 = v20;
            }
            else
            {
              v21 = 1.0;
            }
            v22 = -[IFImage initWithContentsOfURL:scale:]([IFImage alloc], "initWithContentsOfURL:scale:", v14, v21);
            objc_msgSend(v26, "addObject:", v22);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v26, "count"))
    v23 = -[IFImageBag initWithImages:]([IFImageBag alloc], "initWithImages:", v26);
  else
    v23 = 0;

  return v23;
}

- (void)imageForSize:(uint64_t)a1 scale:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D4106000, a2, OS_LOG_TYPE_DEBUG, "IFImageBag picked an image out of the requested scale to avoid upsampling the source image %@", (uint8_t *)&v2, 0xCu);
}

@end
