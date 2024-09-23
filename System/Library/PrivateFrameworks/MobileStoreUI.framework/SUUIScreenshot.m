@implementation SUUIScreenshot

- (id)_initSUUIScreenshot
{
  id result;
  unint64_t v3;
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIScreenshot;
  result = -[SUUIScreenshot init](&v5, sel_init);
  if (result)
  {
    do
    {
      v3 = __ldxr(&_initSUUIScreenshot_sUniqueID);
      v4 = v3 + 1;
    }
    while (__stxr(v4, &_initSUUIScreenshot_sUniqueID));
    *((_QWORD *)result + 2) = v4;
  }
  return result;
}

- (SUUIScreenshot)initWithScreenshotDictionary:(id)a3
{
  id v4;
  SUUIScreenshot *v5;
  void *v6;
  uint64_t v7;
  NSString *orientation;
  NSMutableDictionary *v9;
  NSMutableDictionary *urls;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *sizes;
  void *v20;
  void *v21;
  double v22;
  int v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  int v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SUUIScreenshot _initSUUIScreenshot](self, "_initSUUIScreenshot");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("orientation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      orientation = v5->_orientation;
      v5->_orientation = (NSString *)v7;

    }
    v35 = v6;
    v38[0] = CFSTR("low-dpi");
    v38[1] = CFSTR("high-dpi");
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    urls = v5->_urls;
    v5->_urls = v9;

    v11 = 0;
    v12 = 1;
    do
    {
      v13 = v12;
      v14 = v38[v11];
      objc_msgSend(v4, "objectForKey:", v14, v35);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("url"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v16);
          if (v17)
            -[NSMutableDictionary setObject:forKey:](v5->_urls, "setObject:forKey:", v17, v14);

        }
      }

      v12 = 0;
      v11 = 1;
    }
    while ((v13 & 1) != 0);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sizes = v5->_sizes;
    v5->_sizes = v18;

    objc_msgSend(v4, "objectForKey:", CFSTR("width"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("height"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = (double)(int)objc_msgSend(v20, "intValue");
        v23 = objc_msgSend(v21, "intValue");
        v24 = v5->_sizes;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v22, (double)v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v25, CFSTR("low-dpi"));

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("width2x"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("height2x"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = (double)(int)objc_msgSend(v26, "intValue");
        v29 = objc_msgSend(v27, "intValue");
        v30 = v5->_sizes;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v28, (double)v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v31, CFSTR("high-dpi"));

      }
    }
    v36[0] = CFSTR("url");
    v36[1] = CFSTR("url2x");
    v37[0] = CFSTR("low-dpi");
    v37[1] = CFSTR("high-dpi");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIScreenshot _addURLsFromDictionary:withRemoteLocalKeysMap:](v5, "_addURLsFromDictionary:withRemoteLocalKeysMap:", v4, v32);

    for (i = 1; i != -1; --i)
  }

  return v5;
}

- (int64_t)numberOfVariants
{
  return -[NSMutableDictionary count](self->_urls, "count");
}

- (void)setArtwork:(id)a3 forVariant:(id)a4
{
  id v6;
  double v7;
  double v8;
  __CFString *v9;
  NSString *orientation;
  NSMutableDictionary *sizes;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *urls;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (double)objc_msgSend(v19, "width");
  v8 = (double)objc_msgSend(v19, "height");
  if (!-[SUUIScreenshot numberOfVariants](self, "numberOfVariants"))
  {
    v9 = CFSTR("portrait");
    orientation = self->_orientation;
    if (v7 > v8)
      v9 = CFSTR("landscape");
    self->_orientation = &v9->isa;

  }
  sizes = self->_sizes;
  if (!sizes)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v13 = self->_sizes;
    self->_sizes = v12;

    sizes = self->_sizes;
  }
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sizes, "setObject:forKey:", v14, v6);

  urls = self->_urls;
  if (!urls)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v17 = self->_urls;
    self->_urls = v16;

    urls = self->_urls;
  }
  objc_msgSend(v19, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](urls, "setObject:forKey:", v18, v6);

}

- (CGSize)sizeForVariant:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableDictionary *sizes;
  void *v10;
  double v11;
  double v12;
  CGSize result;

  -[NSMutableDictionary objectForKey:](self->_sizes, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || -[NSMutableDictionary count](self->_sizes, "count")
    && (sizes = self->_sizes,
        -[SUUIScreenshot _firstVariant](self, "_firstVariant"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](sizes, "objectForKey:", v10),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v4))
  {
    objc_msgSend(v4, "CGSizeValue");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)URLForVariant:(id)a3
{
  void *v4;
  NSMutableDictionary *urls;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->_urls, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (-[NSMutableDictionary count](self->_urls, "count"))
    {
      urls = self->_urls;
      -[SUUIScreenshot _firstVariant](self, "_firstVariant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](urls, "objectForKey:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_orientation, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSMutableDictionary mutableCopyWithZone:](self->_sizes, "mutableCopyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSMutableDictionary mutableCopyWithZone:](self->_urls, "mutableCopyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (SUUIScreenshot)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUIScreenshot *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *urls;
  _QWORD v10[4];
  SUUIScreenshot *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v5 = -[SUUIScreenshot _initSUUIScreenshot](self, "_initSUUIScreenshot");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("orient"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_orientation, v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("urls"));
    self = (SUUIScreenshot *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      urls = v5->_urls;
      v5->_urls = v7;

      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __46__SUUIScreenshot_initWithCacheRepresentation___block_invoke;
      v10[3] = &unk_2511FB6B0;
      v5 = v5;
      v11 = v5;
      -[SUUIScreenshot enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v10);

    }
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

void __46__SUUIScreenshot_initWithCacheRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
      if (v6)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v6, v7);

    }
  }

}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  void *v4;
  NSString *orientation;
  id v6;
  NSMutableDictionary *urls;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  orientation = self->_orientation;
  if (orientation)
    objc_msgSend(v3, "setObject:forKey:", orientation, CFSTR("orient"));
  if (self->_urls)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    urls = self->_urls;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __37__SUUIScreenshot_cacheRepresentation__block_invoke;
    v10[3] = &unk_2511FE380;
    v11 = v6;
    v8 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](urls, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("urls"));

  }
  return (NSMutableDictionary *)v4;
}

void __37__SUUIScreenshot_cacheRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (void)_addURLsFromDictionary:(id)a3 withRemoteLocalKeysMap:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIScreenshot *v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__SUUIScreenshot__addURLsFromDictionary_withRemoteLocalKeysMap___block_invoke;
  v8[3] = &unk_2511FE3A8;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __64__SUUIScreenshot__addURLsFromDictionary_withRemoteLocalKeysMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
    if (v6)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", v6, v7);

  }
}

- (id)_firstVariant
{
  void *v2;
  void *v3;

  -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_urls, "keysSortedByValueUsingComparator:", &__block_literal_global_69);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __31__SUUIScreenshot__firstVariant__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSString)orientationString
{
  return self->_orientation;
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTemplate, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_orientation, 0);
}

@end
