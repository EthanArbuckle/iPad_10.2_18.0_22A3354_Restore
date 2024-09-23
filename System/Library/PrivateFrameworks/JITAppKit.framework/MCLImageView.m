@implementation MCLImageView

- (void)didMoveToWindow
{
  id v2;
  BOOL v3;
  objc_super v4;
  SEL v5;
  MCLImageView *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)MCLImageView;
  -[MCLImageView didMoveToWindow](&v4, sel_didMoveToWindow);
  v2 = (id)-[MCLImageView window](v6, "window");
  v3 = 0;
  if (v2)
    v3 = v6->_image != 0;

  if (v3)
    -[MCLImageView setImageDelayed:](v6, "setImageDelayed:", v6->_image);
}

- (void)setImageDelayed:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id location[2];
  MCLImageView *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v10, v12);
  queue = dispatch_get_global_queue(-2, 0);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __32__MCLImageView_setImageDelayed___block_invoke;
  v8 = &unk_24E099C50;
  objc_copyWeak(&v9, &v10);
  dispatch_async(queue, &v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v10);
  objc_storeStrong(location, 0);
}

void __32__MCLImageView_setImageDelayed___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundDecompressImage");

}

- (void)backgroundDecompressImage
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  MCLImageView *v9;
  CGSize v10;
  int v11;
  id v12[2];
  MCLImageView *v13;
  CGSize v14;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = self->_image;
  if (v12[0])
  {
    CGSizeMake();
    v10 = v14;
    UIGraphicsBeginImageContext(v14);
    objc_msgSend(v12[0], "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    UIGraphicsEndImageContext();
    queue = MEMORY[0x24BDAC9B8];
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __41__MCLImageView_backgroundDecompressImage__block_invoke;
    v7 = &unk_24E099990;
    v8 = v12[0];
    v9 = v13;
    dispatch_async(queue, &v3);

    objc_storeStrong((id *)&v9, 0);
    objc_storeStrong(&v8, 0);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  objc_storeStrong(v12, 0);
}

uint64_t __41__MCLImageView_backgroundDecompressImage__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v3;
  uint64_t v4;
  uint64_t v5;

  v2 = result;
  v5 = result;
  v4 = result;
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 512))
  {
    objc_storeStrong((id *)(*(_QWORD *)(result + 40) + 512), 0);
    objc_msgSend(*(id *)(v2 + 40), "willChangeValueForKey:");
    v1 = *(_QWORD *)(v2 + 32);
    v3.receiver = *(id *)(v2 + 40);
    v3.super_class = (Class)MCLImageView;
    objc_msgSendSuper2(&v3, sel_setImage_, v1);
    objc_msgSend(*(id *)(v2 + 40), "didChangeValueForKey:", CFSTR("image"));
    return objc_msgSend(*(id *)(v2 + 40), "setNeedsLayout");
  }
  return result;
}

- (void)setImage:(id)a3
{
  id v3;
  BOOL v4;
  objc_super v5;
  id location[2];
  MCLImageView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_image, location[0]);
  if (location[0])
  {
    v3 = (id)-[MCLImageView window](v7, "window");
    v4 = v3 == 0;

    if (!v4)
      -[MCLImageView setImageDelayed:](v7, "setImageDelayed:", location[0]);
  }
  else
  {
    v5.receiver = v7;
    v5.super_class = (Class)MCLImageView;
    -[MCLImageView setImage:](&v5, sel_setImage_, 0);
  }
  objc_storeStrong(location, 0);
}

+ (id)bitmapImage:(id)a3
{
  int v3;
  id v5;
  BOOL v6;
  id v7;
  CGImageRef image;
  CGRect rect;
  CGContextRef v10;
  uint64_t v11;
  size_t Height;
  size_t Width;
  BOOL v14;
  CGBitmapInfo v15;
  CGImageRef v16;
  id location[3];
  id v18;
  dispatch_once_t *v19;
  CGRect v20;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = (dispatch_once_t *)&bitmapImage__onceToken;
  v18 = 0;
  objc_storeStrong(&v18, &__block_literal_global_4);
  if (*v19 != -1)
    dispatch_once(v19, v18);
  objc_storeStrong(&v18, 0);
  v16 = (CGImageRef)objc_msgSend(objc_retainAutorelease(location[0]), "CGImage");
  v15 = CGImageGetBitmapInfo(v16) & 0x1F;
  v14 = 0;
  v6 = 1;
  if (v15 != 4)
  {
    v6 = 1;
    if (v15 != 3)
    {
      v6 = 1;
      if (v15 != 2)
        v6 = v15 == 1;
    }
  }
  v14 = v6;
  Width = CGImageGetWidth(v16);
  Height = CGImageGetHeight(v16);
  v11 = 8;
  v10 = 0;
  if (v6)
    v3 = 2;
  else
    v3 = 6;
  v10 = CGBitmapContextCreate(0, Width, Height, 8uLL, 0, (CGColorSpaceRef)bitmapImage__rgbColorSpaceRef, v3 | 0x2000u);
  CGRectMake();
  rect = v20;
  CGContextDrawImage(v10, v20, v16);
  image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCGImage:", image);
  CGImageRelease(image);
  v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

CGColorSpaceRef __28__MCLImageView_bitmapImage___block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  bitmapImage__rgbColorSpaceRef = (uint64_t)result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
