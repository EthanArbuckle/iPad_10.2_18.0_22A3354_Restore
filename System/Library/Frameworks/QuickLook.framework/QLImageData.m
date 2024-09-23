@implementation QLImageData

- (void)dealloc
{
  CGImageSource *imageSource;
  objc_super v4;

  imageSource = self->_imageSource;
  if (imageSource)
    CFRelease(imageSource);
  v4.receiver = self;
  v4.super_class = (Class)QLImageData;
  -[QLImageData dealloc](&v4, sel_dealloc);
}

- (QLImageData)initWithImageSource:(CGImageSource *)a3
{
  QLImageData *v4;
  QLImageData *v5;
  QLImageData *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLImageData;
  v4 = -[QLImageData init](&v8, sel_init);
  v5 = v4;
  v6 = 0;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_imageSource = a3;
    v6 = v5;
  }

  return v6;
}

- (id)imageAtIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGImageRef ImageAtIndex;
  CGImageRef v13;
  void *v14;

  v5 = -[QLImageData count](self, "count");
  if (v5 <= a3)
    goto LABEL_6;
  v6 = v5;
  v7 = -[QLImageData orientation](self, "orientation");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  if (v6 >= 2)
  {
    -[QLImageData size](self, "size");
    QLGetScaleForAnimatedImageWithSize();
    v10 = v11;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_imageSource, a3, 0);
  if (ImageAtIndex)
  {
    v13 = ImageAtIndex;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCGImage:scale:orientation:", ImageAtIndex, v7, v10);
    CFRelease(v13);
  }
  else
  {
LABEL_6:
    v14 = 0;
  }
  return v14;
}

- (id)durations
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  CFDictionaryRef v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = -[QLImageData count](self, "count");
  if (!v3)
  {
    v4 = 0;
    return v4;
  }
  if (v3 == 1)
  {
    v4 = &unk_24C749660;
    return v4;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v3);
  v6 = (void *)MEMORY[0x24BDF8238];
  -[QLImageData type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typeWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF83D8]))
  {
    v9 = (id *)MEMORY[0x24BDD9598];
  }
  else if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF84F8]))
  {
    v9 = (id *)MEMORY[0x24BDD96B0];
  }
  else if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF83E8]))
  {
    v9 = (id *)MEMORY[0x24BDD9628];
  }
  else
  {
    if (!objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF8660]))
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("public.heics"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 && objc_msgSend(v8, "conformsToType:", v25))
        v10 = (id)*MEMORY[0x24BDD9608];
      else
        v10 = 0;

      goto LABEL_14;
    }
    v9 = (id *)MEMORY[0x24BDD9740];
  }
  v10 = *v9;
LABEL_14:
  v11 = CGImageSourceCopyProperties(self->_imageSource, 0);
  -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FrameInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v26 = v10;
    v27 = v8;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("DelayTime"), v26, v27, (_QWORD)v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v21 = v20;

          if (v21 >= 0.0109999999)
            v22 = v21;
          else
            v22 = 0.100000001;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v23);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    v4 = v5;
    v10 = v26;
    v8 = v27;
  }
  else
  {
    v4 = &unk_24C749678;
  }

  return v4;
}

- (int64_t)orientation
{
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  const __CFDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;

  if (self->_imageSource && -[QLImageData count](self, "count"))
  {
    v3 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, 0, 0);
    v4 = v3;
    if (!v3)
    {
      v10 = 0;
LABEL_16:

      return v10;
    }
    v5 = v3;
    v6 = *MEMORY[0x24BDD9698];
    -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x24BDD9698]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x24BDD96E8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_12;
    }
    v9 = objc_msgSend(v7, "integerValue");
    switch(v9)
    {
      case 3:
        v10 = 1;
        break;
      case 8:
        v10 = 2;
        break;
      case 6:
        v10 = 3;
        break;
      default:
LABEL_12:
        v10 = 0;
        break;
    }

    goto LABEL_16;
  }
  return 0;
}

- (CGSize)size
{
  double v2;
  double v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  double v11;
  double v12;
  CGSize result;

  v2 = 0.0;
  if (self->_imageSource)
  {
    v4 = 0.0;
    if (-[QLImageData count](self, "count"))
    {
      v5 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, 0, 0);
      v6 = v5;
      if (v5)
      {
        -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x24BDD96C8]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "floatValue");
        v4 = v8;
        -[__CFDictionary objectForKey:](v6, "objectForKey:", *MEMORY[0x24BDD96C0]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "floatValue");
        v2 = v10;

      }
    }
  }
  else
  {
    v4 = 0.0;
  }
  v11 = v4;
  v12 = v2;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unint64_t)count
{
  return CGImageSourceGetCount(self->_imageSource);
}

- (id)type
{
  return (id)CGImageSourceGetType(self->_imageSource);
}

@end
