@implementation CNImageCropUtilities

+ (CGRect)centeredSquareCropRectInRect:(CGRect)a3
{
  double height;
  BOOL v4;
  double v5;
  double v6;
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _Unwind_Exception *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  CGRect result;

  if (a3.size.width >= a3.size.height)
    height = a3.size.height;
  else
    height = a3.size.width;
  v4 = height == a3.size.width;
  v5 = a3.origin.x + (a3.size.width - height) * 0.5;
  v6 = a3.origin.y + (a3.size.height - height) * 0.5;
  if (v4)
    y = v6;
  else
    y = a3.origin.y;
  if (v4)
    x = a3.origin.x;
  else
    x = v5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v9 = getCGRectIntegralSymbolLoc_ptr;
  v20 = getCGRectIntegralSymbolLoc_ptr;
  if (!getCGRectIntegralSymbolLoc_ptr)
  {
    v10 = (void *)CoreGraphicsLibrary();
    v9 = dlsym(v10, "CGRectIntegral");
    v18[3] = (uint64_t)v9;
    getCGRectIntegralSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v17, 8);
  if (!v9)
  {
    v16 = (_Unwind_Exception *)+[CNPostalAddressStringTokenizer countryCodeFromCurrentNetwork].cold.1();
    _Block_object_dispose(&v17, 8);
    _Unwind_Resume(v16);
  }
  ((void (*)(double, double, double, double))v9)(x, y, height, height);
  if (v13 >= v14)
    v13 = v14;
  v15 = v13;
  result.size.height = v15;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

+ (CGRect)squareCropRect:(CGRect)a3 toFitSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  _Unwind_Exception *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v6 = a3.size.height;
  v7 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = 0.0;
  if (a4.width == 0.0 && a4.height == 0.0 || a4.width == 0.0)
  {
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    goto LABEL_16;
  }
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  if (a4.height != 0.0)
  {
    objc_msgSend((id)objc_opt_class(), "intersectingSquareCropRect:forRect:", x, y, v7, v6, 0.0, 0.0, a4.width, a4.height);
    v15 = v14;
    v25 = v16;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v17 = getCGRectGetMidXSymbolLoc_ptr;
    v29 = getCGRectGetMidXSymbolLoc_ptr;
    if (!getCGRectGetMidXSymbolLoc_ptr)
    {
      v18 = (void *)CoreGraphicsLibrary();
      v17 = dlsym(v18, "CGRectGetMidX");
      v27[3] = (uint64_t)v17;
      getCGRectGetMidXSymbolLoc_ptr = v17;
    }
    _Block_object_dispose(&v26, 8);
    if (v17)
    {
      v24 = v15;
      v19 = ((double (*)(double, double, double, double))v17)(x, y, v7, v6);
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v20 = getCGRectGetMidYSymbolLoc_ptr;
      v29 = getCGRectGetMidYSymbolLoc_ptr;
      if (!getCGRectGetMidYSymbolLoc_ptr)
      {
        v21 = (void *)CoreGraphicsLibrary();
        v20 = dlsym(v21, "CGRectGetMidY");
        v27[3] = (uint64_t)v20;
        getCGRectGetMidYSymbolLoc_ptr = v20;
      }
      _Block_object_dispose(&v26, 8);
      if (v20)
      {
        v22 = ((double (*)(double, double, double, double))v20)(x, y, v7, v6);
        objc_msgSend((id)objc_opt_class(), "intersectingSquareCropRect:forRect:", v19 - v24 * 0.5, v22 - v25 * 0.5, v24, v25, 0.0, 0.0, width, height);
        goto LABEL_16;
      }
    }
    else
    {
      +[CNPostalAddressStringTokenizer countryCodeFromCurrentNetwork].cold.1();
    }
    v23 = (_Unwind_Exception *)+[CNPostalAddressStringTokenizer countryCodeFromCurrentNetwork].cold.1();
    _Block_object_dispose(&v26, 8);
    _Unwind_Resume(v23);
  }
LABEL_16:
  result.size.height = v10;
  result.size.width = v11;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

+ (CGRect)scaledCropRect:(CGRect)a3 fromSize:(CGSize)a4 toSize:(CGSize)a5
{
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  x = a3.origin.x;
  v6 = 0.0;
  if (a4.width == 0.0 && a4.height == 0.0)
  {
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  else if (a5.width != 0.0 || (v7 = 0.0, v8 = 0.0, v9 = 0.0, a5.height != 0.0))
  {
    v10 = a5.width / a4.width;
    v11 = a5.height / a4.height;
    v6 = x * v10;
    v7 = a3.origin.y * v11;
    v8 = rint(a3.size.width * v10);
    v9 = rint(a3.size.height * v11);
  }
  v12 = v7;
  v13 = v8;
  v14 = v9;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v6;
  return result;
}

+ (CGRect)intersectingSquareCropRect:(CGRect)a3 forRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _Unwind_Exception *v27;
  double v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v28 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v11 = getCGRectIntersectionSymbolLoc_ptr;
  v32 = getCGRectIntersectionSymbolLoc_ptr;
  if (!getCGRectIntersectionSymbolLoc_ptr)
  {
    v12 = (void *)CoreGraphicsLibrary();
    v11 = dlsym(v12, "CGRectIntersection");
    v30[3] = (uint64_t)v11;
    getCGRectIntersectionSymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v29, 8);
  if (!v11)
  {
    +[CNPostalAddressStringTokenizer countryCodeFromCurrentNetwork].cold.1();
    goto LABEL_18;
  }
  v13 = ((double (*)(double, double, double, double, double, double, double, double))v11)(v10, v9, v8, v28, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v20 = getCGRectEqualToRectSymbolLoc_ptr;
  v32 = getCGRectEqualToRectSymbolLoc_ptr;
  if (!getCGRectEqualToRectSymbolLoc_ptr)
  {
    v21 = (void *)CoreGraphicsLibrary();
    v20 = dlsym(v21, "CGRectEqualToRect");
    v30[3] = (uint64_t)v20;
    getCGRectEqualToRectSymbolLoc_ptr = v20;
  }
  _Block_object_dispose(&v29, 8);
  if (!v20)
  {
LABEL_18:
    v27 = (_Unwind_Exception *)+[CNPostalAddressStringTokenizer countryCodeFromCurrentNetwork].cold.1();
    _Block_object_dispose(&v29, 8);
    _Unwind_Resume(v27);
  }
  v22 = ((uint64_t (*)(double, double, double, double, double, double, double, double))v20)(v13, v15, v17, v19, v10, v9, v8, v28);
  if (v17 >= v19)
    v23 = v19;
  else
    v23 = v17;
  if (v22)
    v24 = v9;
  else
    v24 = v15;
  if (v22)
    v25 = v10;
  else
    v25 = v13;
  v26 = v23;
  result.size.height = v26;
  result.size.width = v23;
  result.origin.y = v24;
  result.origin.x = v25;
  return result;
}

+ (BOOL)cropRect:(CGRect)a3 fitsWithinSize:(CGSize)a4
{
  return a3.origin.y + a3.size.height <= a4.height && a3.origin.x + a3.size.width <= a4.width;
}

@end
