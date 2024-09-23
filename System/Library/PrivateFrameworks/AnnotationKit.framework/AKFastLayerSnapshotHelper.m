@implementation AKFastLayerSnapshotHelper

+ (CGImage)newFastSnapshotFromLayer:(id)a3 withSourceRect:(CGRect)a4 acutalSnapshotRect:(CGRect *)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t AlignedBytesPerRow;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const __CFDictionary *v30;
  IOSurfaceRef v31;
  void *v32;
  CFTypeID v33;
  CGImage *v34;
  CGRect *v35;
  void *v36;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t v39;
  size_t v40;
  size_t AllocSize;
  CGDataProvider *v42;
  CFTypeRef v43;
  const void *v44;
  CGColorSpace *DeviceRGB;
  void *v47;
  id v48;
  uint64_t v50;
  void *v51;
  CATransform3D v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v48 = a3;
  objc_msgSend(v48, "context");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "contextId");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nativeScale");
  v11 = v10;

  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeScale(&v54, v11, v11);
  memset(&v53, 0, sizeof(v53));
  *(_OWORD *)&v52.m11 = *(_OWORD *)&v54.a;
  *(_OWORD *)&v52.m13 = *(_OWORD *)&v54.c;
  *(_OWORD *)&v52.m21 = *(_OWORD *)&v54.tx;
  CGAffineTransformInvert(&v53, (CGAffineTransform *)&v52);
  *(_OWORD *)&v52.m11 = *(_OWORD *)&v54.a;
  *(_OWORD *)&v52.m13 = *(_OWORD *)&v54.c;
  *(_OWORD *)&v52.m21 = *(_OWORD *)&v54.tx;
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v56 = CGRectApplyAffineTransform(v55, (CGAffineTransform *)&v52);
  v57 = CGRectIntegral(v56);
  v12 = v57.origin.x;
  v13 = v57.origin.y;
  v14 = v57.size.width;
  if (vabdd_f64(width, height) >= 0.0005)
    v15 = v57.size.height;
  else
    v15 = v57.size.width;
  v16 = vcvtad_u64_f64(v57.size.width);
  v17 = vcvtad_u64_f64(v15);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v51 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = *MEMORY[0x24BDD8FD0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BDD8EB0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", AlignedBytesPerRow);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDD8E38];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", AlignedBytesPerRow * v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BDD8E18];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BDD8E30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1111970369);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v19, v50, v20, v21, v22, v23, v24, v25, v26, v27, v28, *MEMORY[0x24BDD8EF8], 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v29;
  v31 = IOSurfaceCreate(v30);
  if (v30)
    CFRelease(v30);

  if (!v31)
  {
    v34 = 0;
    v32 = v48;
    v35 = a5;
    v36 = v47;
    if (!a5)
      goto LABEL_17;
    goto LABEL_16;
  }
  memset(&v52, 0, sizeof(v52));
  CATransform3DMakeScale(&v52, v11, v11, 1.0);
  v32 = v48;
  CARenderServerRenderLayerWithTransform();
  v33 = CFGetTypeID(v31);
  if (v33 == CGImageGetTypeID())
  {
    CGImageRetain(v31);
    v34 = v31;
  }
  else
  {
    CFRetain(v31);
    IOSurfaceIncrementUseCount(v31);
    BaseAddress = IOSurfaceGetBaseAddress(v31);
    BytesPerRow = IOSurfaceGetBytesPerRow(v31);
    v39 = IOSurfaceGetWidth(v31);
    v40 = IOSurfaceGetHeight(v31);
    AllocSize = IOSurfaceGetAllocSize(v31);
    v42 = CGDataProviderCreateWithData(v31, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_228FDC6B0);
    v43 = IOSurfaceCopyValue(v31, (CFStringRef)*MEMORY[0x24BDD8E88]);
    if (!v43 || (v44 = v43, DeviceRGB = CGColorSpaceCreateWithPropertyList(v43), CFRelease(v44), !DeviceRGB))
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v34 = CGImageCreate(v39, v40, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2002u, v42, 0, 1, kCGRenderingIntentDefault);
    CGImageSetProperty();
    CGDataProviderRelease(v42);
    CGColorSpaceRelease(DeviceRGB);
  }
  v35 = a5;
  v36 = v47;
  CFRelease(v31);
  if (a5)
  {
LABEL_16:
    *(_OWORD *)&v52.m11 = *(_OWORD *)&v53.a;
    *(_OWORD *)&v52.m13 = *(_OWORD *)&v53.c;
    *(_OWORD *)&v52.m21 = *(_OWORD *)&v53.tx;
    v58.origin.x = v12;
    v58.origin.y = v13;
    v58.size.width = v14;
    v58.size.height = v15;
    *v35 = CGRectApplyAffineTransform(v58, (CGAffineTransform *)&v52);
  }
LABEL_17:

  return v34;
}

@end
