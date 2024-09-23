@implementation CAFMediaItemImages

+ (CAFMediaItemImages)mediaItemImagesWithArray:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArray:", v4);

  return (CAFMediaItemImages *)v5;
}

+ (CAFMediaItemImages)mediaItemImagesWithMediaItemImages:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaItemImages:", v4);

  return (CAFMediaItemImages *)v5;
}

- (CAFMediaItemImages)initWithMediaItemImages:(id)a3
{
  id v5;
  CAFMediaItemImages *v6;
  CAFMediaItemImages *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAFMediaItemImages;
  v6 = -[CAFMediaItemImages init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaItemImages, a3);

  return v7;
}

- (CAFMediaItemImages)initWithArray:(id)a3
{
  id v4;
  CAFMediaItemImages *v5;
  void *v6;
  CAFMediaItemImages *v7;
  id v8;
  uint64_t v9;
  NSArray *mediaItemImages;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  CAFMediaItemImages *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAFMediaItemImages;
  v5 = -[CAFMediaItemImages init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __36__CAFMediaItemImages_initWithArray___block_invoke;
    v15 = &unk_2508FD2D8;
    v16 = v6;
    v7 = v5;
    v17 = v7;
    v8 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v12);
    v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
    mediaItemImages = v7->_mediaItemImages;
    v7->_mediaItemImages = (NSArray *)v9;

  }
  return v5;
}

void __36__CAFMediaItemImages_initWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CAFMediaItemImage *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[CAFMediaItemImage initWithDictionary:]([CAFMediaItemImage alloc], "initWithDictionary:", v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "CAF_elementParseFailedForDataSupportType:", CFSTR("MediaItemImages"));
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v6 = (uint64_t *)(a1 + 40);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v5;

    CAFGeneralLogging();
    v4 = (CAFMediaItemImage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
      __36__CAFMediaItemImages_initWithArray___block_invoke_cold_1(v6, (uint64_t)v3, &v4->super);
  }

}

- (NSString)formattedValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[CAFMediaItemImages mediaItemImages](self, "mediaItemImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[CAFMediaItemImages mediaItemImages](self, "mediaItemImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[ %@ ]"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(null)");
  }

  return (NSString *)v7;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CAFMediaItemImages mediaItemImages](self, "mediaItemImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[CAFMediaItemImages mediaItemImages](self, "mediaItemImages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (NSArray)mediaItemImages
{
  return self->_mediaItemImages;
}

- (NSError)parseError
{
  return self->_parseError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseError, 0);
  objc_storeStrong((id *)&self->_mediaItemImages, 0);
}

void __36__CAFMediaItemImages_initWithArray___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_237717000, log, OS_LOG_TYPE_ERROR, "%{public}@: Error parsing dictionary from MediaItemImages array - %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
