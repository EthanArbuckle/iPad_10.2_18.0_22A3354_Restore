@implementation NTKRoundedCornerMaskView

- (NTKRoundedCornerMaskView)initWithDevice:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NTKRoundedCornerMaskView *v14;

  v4 = a3;
  +[NTKRoundedCornerMaskView _maskForDevice:](NTKRoundedCornerMaskView, "_maskForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = -[NTKRoundedCornerMaskView _initWithFrame:mask:](self, "_initWithFrame:mask:", v5, v7, v9, v11, v13);
  return v14;
}

- (NTKRoundedCornerMaskView)initWithFrame:(CGRect)a3 screenScale:(double)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  NTKRoundedCornerMaskView *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[NTKRoundedCornerMaskView _maskWithSize:screenScale:cornerRadius:](NTKRoundedCornerMaskView, "_maskWithSize:screenScale:cornerRadius:", a3.size.width, a3.size.height, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NTKRoundedCornerMaskView _initWithFrame:mask:](self, "_initWithFrame:mask:", v10, x, y, width, height);

  return v11;
}

- (id)_initWithFrame:(CGRect)a3 mask:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  NTKRoundedCornerMaskView *v10;
  uint64_t v11;
  CALayer *maskLayer;
  CALayer *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKRoundedCornerMaskView;
  v10 = -[NTKRoundedCornerMaskView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    maskLayer = v10->_maskLayer;
    v10->_maskLayer = (CALayer *)v11;

    -[NTKRoundedCornerMaskView bounds](v10, "bounds");
    -[CALayer setFrame:](v10->_maskLayer, "setFrame:");
    -[CALayer setContents:](v10->_maskLayer, "setContents:", objc_msgSend(objc_retainAutorelease(v9), "CGImage"));
    v13 = v10->_maskLayer;
    -[NTKRoundedCornerMaskView layer](v10, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMask:", v13);

  }
  return v10;
}

+ (id)_maskForDevice:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[5];

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_maskForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&_maskForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_maskForDevice____cachedDevice);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_maskForDevice____cachedDevice, v4);
    _maskForDevice____previousCLKDeviceVersion = objc_msgSend(v4, "version");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__NTKRoundedCornerMaskView__maskForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __43__NTKRoundedCornerMaskView__maskForDevice___block_invoke((uint64_t)v13, v4);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _maskForDevice____previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_maskForDevice____lock);
  v11 = (id)_maskForDevice__mask;

  return v11;
}

void __43__NTKRoundedCornerMaskView__maskForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "screenBounds");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "screenScale");
  v9 = v8;
  objc_msgSend(v3, "screenCornerRadius");
  v11 = v10;

  objc_msgSend(v2, "_maskWithSize:screenScale:cornerRadius:", v5, v7, v9, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_maskForDevice__mask;
  _maskForDevice__mask = v12;

}

+ (id)_maskWithSize:(CGSize)a3 screenScale:(double)a4 cornerRadius:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  double v9;
  NTKRoundedCornerOverlayView *v10;
  CGContext *CurrentContext;
  id v12;
  void *v13;
  void *v14;
  CGSize v16;
  CGRect v17;

  height = a3.height;
  width = a3.width;
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v10 = -[NTKRoundedCornerOverlayView initWithFrame:screenScale:cornerRadius:]([NTKRoundedCornerOverlayView alloc], "initWithFrame:screenScale:cornerRadius:", *MEMORY[0x1E0C9D538], v9, a3.width, a3.height, a4, a5);
  v16.width = width;
  v16.height = height;
  UIGraphicsBeginImageContextWithOptions(v16, 0, a4);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v12, "CGColor"));

  v17.origin.x = v8;
  v17.origin.y = v9;
  v17.size.width = width;
  v17.size.height = height;
  CGContextFillRect(CurrentContext, v17);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
  -[NTKRoundedCornerOverlayView layer](v10, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderInContext:", CurrentContext);

  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
}

@end
