@implementation HSArtworkRequest

- (HSArtworkRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 size:(CGSize)a5
{
  double height;
  double width;
  void *v8;
  HSArtworkRequest *v9;
  void *v10;
  void *v11;

  height = a5.height;
  width = a5.width;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("databases/%u/items/%llu/extra_data/artwork"), *(_QWORD *)&a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HSRequest initWithAction:](self, "initWithAction:", v8);

  if (v9 && (width != 0.0 || height != 0.0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), width);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v9, "setValue:forArgument:", v10, CFSTR("mw"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v9, "setValue:forArgument:", v11, CFSTR("mh"));

  }
  return v9;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)acceptsGzipEncoding
{
  return 0;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 size:(CGSize)a5
{
  return -[HSArtworkRequest initWithDatabaseID:itemID:size:]([HSArtworkRequest alloc], "initWithDatabaseID:itemID:size:", *(_QWORD *)&a3, a4, a5.width, a5.height);
}

@end
