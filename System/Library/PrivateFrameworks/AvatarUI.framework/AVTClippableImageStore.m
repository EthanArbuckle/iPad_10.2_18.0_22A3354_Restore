@implementation AVTClippableImageStore

- (BOOL)saveImage:(id)a3 forItem:(id)a4 scope:(id)a5 clippingRect:(CGRect)a6 error:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  objc_super v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[AVTImageStore imageEncoder](self, "imageEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "conformsToProtocol:", &unk_1F03DE080);

  -[AVTImageStore imageEncoder](self, "imageEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
    objc_msgSend(v20, "dataFromImage:clippingRect:", v17, x, y, width, height);
  else
    objc_msgSend(v20, "dataFromImage:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v25.receiver = self;
  v25.super_class = (Class)AVTClippableImageStore;
  v23 = -[AVTImageStore saveImage:withImageData:forItem:scope:error:](&v25, sel_saveImage_withImageData_forItem_scope_error_, v17, v22, v16, v15, a7);

  return v23;
}

- (CGRect)resourceClippingRectForItem:(id)a3 scope:(id)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const __CFURL *v8;
  CGImageSource *v9;
  CFDictionaryRef v10;
  uint64_t v11;
  const __CFDictionary *v12;
  void *v13;
  NSString *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[AVTImageStore resourceURLForItem:scope:](self, "resourceURLForItem:scope:", a3, a4);
  v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v9 = CGImageSourceCreateWithURL(v8, 0);
  v10 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
  CFRelease(v9);
  if (v10)
  {
    v11 = *MEMORY[0x1E0CBCB50];
    v12 = v10;
    -[__CFDictionary objectForKey:](v12, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v12);

    if (v13)
    {
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CBCCB0]);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = CGRectFromString(v14);
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;

    }
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

@end
