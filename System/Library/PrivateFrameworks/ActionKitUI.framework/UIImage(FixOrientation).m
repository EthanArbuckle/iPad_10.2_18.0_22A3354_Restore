@implementation UIImage(FixOrientation)

- (id)wf_imageInIntrinsicOrientation
{
  __int128 v2;
  double v3;
  size_t v4;
  double v5;
  size_t v6;
  id v7;
  size_t BitsPerComponent;
  id v9;
  CGColorSpace *ColorSpace;
  id v11;
  uint32_t BitmapInfo;
  CGContext *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGImage *v18;
  CGImage *Image;
  id v20;
  CGAffineTransform v22;
  CGAffineTransform transform;
  CGAffineTransform v24;
  CGRect v25;

  if (objc_msgSend(a1, "imageOrientation"))
  {
    v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v24.c = v2;
    *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&transform.a = *(_OWORD *)&v24.a;
    *(_OWORD *)&transform.c = v2;
    *(_OWORD *)&transform.tx = *(_OWORD *)&v24.tx;
    objc_msgSend(a1, "wf_affineTransformForImageOrientation:", &transform);
    v22 = v24;
    objc_msgSend(a1, "wf_affineTransformForImageMirroringOrientation:", &v22);
    v24 = transform;
    objc_msgSend(a1, "size");
    v4 = (unint64_t)v3;
    objc_msgSend(a1, "size");
    v6 = (unint64_t)v5;
    v7 = objc_retainAutorelease(a1);
    BitsPerComponent = CGImageGetBitsPerComponent((CGImageRef)objc_msgSend(v7, "CGImage"));
    v9 = objc_retainAutorelease(v7);
    ColorSpace = CGImageGetColorSpace((CGImageRef)objc_msgSend(v9, "CGImage"));
    v11 = objc_retainAutorelease(v9);
    BitmapInfo = CGImageGetBitmapInfo((CGImageRef)objc_msgSend(v11, "CGImage"));
    v13 = CGBitmapContextCreate(0, v4, v6, BitsPerComponent, 0, ColorSpace, BitmapInfo);
    transform = v24;
    CGContextConcatCTM(v13, &transform);
    objc_msgSend(v11, "wf_majorAxisOrientedSize");
    v15 = v14;
    v17 = v16;
    v18 = (CGImage *)objc_msgSend(objc_retainAutorelease(v11), "CGImage");
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = v15;
    v25.size.height = v17;
    CGContextDrawImage(v13, v25, v18);
    Image = CGBitmapContextCreateImage(v13);
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", Image);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    CGContextRelease(v13);
    CGImageRelease(Image);
  }
  else
  {
    v20 = a1;
  }
  return v20;
}

- (uint64_t)wf_majorAxisOrientedSize
{
  unint64_t v2;

  v2 = objc_msgSend(a1, "imageOrientation");
  if (v2 > 7 || ((1 << v2) & 0xCC) == 0)
    return objc_msgSend(a1, "size");
  objc_msgSend(a1, "size");
  return objc_msgSend(a1, "size");
}

- (__n128)wf_affineTransformForImageOrientation:()FixOrientation
{
  unint64_t v6;
  __n128 v7;
  CGFloat v8;
  __n128 v9;
  __n128 v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  __n128 v14;
  CGFloat v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  CGFloat v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  __n128 result;
  CGAffineTransform v25;
  CGAffineTransform v26;

  v6 = objc_msgSend(a1, "imageOrientation");
  if (v6 <= 7)
  {
    if (((1 << v6) & 0x22) != 0)
    {
      objc_msgSend(a1, "size");
      v13 = v12;
      objc_msgSend(a1, "size");
      v14 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v14;
      *(__n128 *)&v25.tx = a2[2];
      CGAffineTransformTranslate(&v26, &v25, v13, v15);
      v16 = *(__n128 *)&v26.c;
      *a2 = *(__n128 *)&v26.a;
      a2[1] = v16;
      a2[2] = *(__n128 *)&v26.tx;
      v17 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v17;
      *(__n128 *)&v25.tx = a2[2];
      v11 = 3.14159265;
      goto LABEL_8;
    }
    if (((1 << v6) & 0x44) != 0)
    {
      objc_msgSend(a1, "size");
      v18 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v18;
      *(__n128 *)&v25.tx = a2[2];
      CGAffineTransformTranslate(&v26, &v25, v19, 0.0);
      v20 = *(__n128 *)&v26.c;
      *a2 = *(__n128 *)&v26.a;
      a2[1] = v20;
      a2[2] = *(__n128 *)&v26.tx;
      v21 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v21;
      *(__n128 *)&v25.tx = a2[2];
      v11 = 1.57079633;
      goto LABEL_8;
    }
    if (((1 << v6) & 0x88) != 0)
    {
      objc_msgSend(a1, "size");
      v7 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v7;
      *(__n128 *)&v25.tx = a2[2];
      CGAffineTransformTranslate(&v26, &v25, 0.0, v8);
      v9 = *(__n128 *)&v26.c;
      *a2 = *(__n128 *)&v26.a;
      a2[1] = v9;
      a2[2] = *(__n128 *)&v26.tx;
      v10 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v10;
      *(__n128 *)&v25.tx = a2[2];
      v11 = -1.57079633;
LABEL_8:
      CGAffineTransformRotate(&v26, &v25, v11);
      v22 = *(__n128 *)&v26.c;
      *a2 = *(__n128 *)&v26.a;
      a2[1] = v22;
      a2[2] = *(__n128 *)&v26.tx;
    }
  }
  v23 = a2[1];
  *a3 = *a2;
  a3[1] = v23;
  result = a2[2];
  a3[2] = result;
  return result;
}

- (__n128)wf_affineTransformForImageMirroringOrientation:()FixOrientation
{
  __n128 v6;
  CGFloat v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  __n128 result;
  CGAffineTransform v13;
  CGAffineTransform v14;

  if ((objc_msgSend(a1, "imageOrientation") & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    objc_msgSend(a1, "wf_majorAxisOrientedSize");
    v6 = a2[1];
    *(__n128 *)&v13.a = *a2;
    *(__n128 *)&v13.c = v6;
    *(__n128 *)&v13.tx = a2[2];
    CGAffineTransformTranslate(&v14, &v13, v7, 0.0);
    v8 = *(__n128 *)&v14.c;
    *a2 = *(__n128 *)&v14.a;
    a2[1] = v8;
    a2[2] = *(__n128 *)&v14.tx;
    v9 = a2[1];
    *(__n128 *)&v13.a = *a2;
    *(__n128 *)&v13.c = v9;
    *(__n128 *)&v13.tx = a2[2];
    CGAffineTransformScale(&v14, &v13, -1.0, 1.0);
    v10 = *(__n128 *)&v14.c;
    *a2 = *(__n128 *)&v14.a;
    a2[1] = v10;
    a2[2] = *(__n128 *)&v14.tx;
  }
  v11 = a2[1];
  *a3 = *a2;
  a3[1] = v11;
  result = a2[2];
  a3[2] = result;
  return result;
}

@end
