@implementation GKImageEffects

+ (id)imageByApplyingLightEffectToImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "colorWithWhite:alpha:", 1.0, 0.3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageByApplyingBlurToImage:withRadius:tintColor:saturationDeltaFactor:maskImage:", v5, v6, 0, 60.0, 1.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)imageByApplyingExtraLightEffectToImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "colorWithWhite:alpha:", 0.97, 0.82);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageByApplyingBlurToImage:withRadius:tintColor:saturationDeltaFactor:maskImage:", v5, v6, 0, 40.0, 1.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)imageByApplyingDarkEffectToImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "colorWithWhite:alpha:", 0.11, 0.73);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageByApplyingBlurToImage:withRadius:tintColor:saturationDeltaFactor:maskImage:", v5, v6, 0, 40.0, 1.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)imageByApplyingTintEffectWithColor:(id)a3 toImage:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v13;
  double v14;
  double v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  if (CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v8, "CGColor")) == 2)
  {
    v15 = 0.0;
    v9 = v8;
    if (objc_msgSend(v8, "getWhite:alpha:", &v15, 0))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v15, 0.6);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = (void *)v10;

    }
  }
  else
  {
    v14 = 0.0;
    v15 = 0.0;
    v13 = 0.0;
    v9 = v8;
    if (objc_msgSend(v8, "getRed:green:blue:alpha:", &v15, &v14, &v13, 0))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v15, v14, v13, 0.6);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  objc_msgSend(a1, "imageByApplyingBlurToImage:withRadius:tintColor:saturationDeltaFactor:maskImage:", v7, v9, 0, 20.0, -1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)imageByApplyingBlurToImage:(id)a3 withRadius:(double)a4 tintColor:(id)a5 saturationDeltaFactor:(double)a6 maskImage:(id)a7
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  id v21;
  double v22;
  id v23;
  CGImage *v24;
  double v25;
  CGFloat v26;
  char BitmapInfo;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  BOOL v34;
  CGContext *CurrentContext;
  id v36;
  vImage_Error v37;
  vImage_Buffer *p_dest;
  double v39;
  uint32_t v40;
  vImage_Buffer *p_buf;
  vImage_Error v42;
  void *v43;
  float64x2_t v44;
  uint64_t v45;
  double *v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  const vImage_Buffer *v50;
  CGImage *v51;
  CGImage *v52;
  uint64_t v53;
  double v54[3];
  vImage_CGImageFormat format;
  vImage_Buffer dest;
  vImage_Buffer buf;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  float64x2_t v62;
  float64_t v63;
  uint64_t v64;
  float64_t v65;
  float64x2_t v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  *(_OWORD *)v54 = *(_OWORD *)&a6;
  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a7;
  objc_msgSend(v10, "size");
  if (v13 >= 1.0)
  {
    objc_msgSend(v10, "size");
    if (v14 >= 1.0)
    {
      v20 = objc_retainAutorelease(v10);
      if (!objc_msgSend(v20, "CGImage"))
      {
        NSLog(CFSTR("*** error: inputImage must be backed by a CGImage: %@"), v20);
        goto LABEL_4;
      }
      if (v12)
      {
        v21 = objc_retainAutorelease(v12);
        if (!objc_msgSend(v21, "CGImage"))
        {
          NSLog(CFSTR("*** error: effectMaskImage must be backed by a CGImage: %@"), v21);
          goto LABEL_4;
        }
      }
      v22 = fabs(v54[0] + -1.0);
      v23 = objc_retainAutorelease(v20);
      v24 = (CGImage *)objc_msgSend(v23, "CGImage");
      objc_msgSend(v23, "scale");
      v26 = v25;
      BitmapInfo = CGImageGetBitmapInfo(v24);
      objc_msgSend(v23, "size");
      v30 = v28;
      v31 = v29;
      v32 = *MEMORY[0x1E0C9D538];
      v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v34 = (BitmapInfo & 0x1Fu) - 5 < 2 || (BitmapInfo & 0x1F) == 0;
      UIGraphicsBeginImageContextWithOptions(*(CGSize *)&v28, v34, v26);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      CGContextTranslateCTM(CurrentContext, 0.0, -v31);
      if (a4 > 0.00000011920929 || v22 > 0.00000011920929)
      {
        memset(&buf, 0, sizeof(buf));
        memset(&dest, 0, sizeof(dest));
        memset(&format.colorSpace, 0, 32);
        *(_QWORD *)&format.bitsPerComponent = 0x2000000008;
        format.bitmapInfo = 8194;
        v36 = objc_retainAutorelease(v23);
        v37 = vImageBuffer_InitWithCGImage(&buf, &format, 0, (CGImageRef)objc_msgSend(v36, "CGImage"), 0x100u);
        if (v37)
        {
          NSLog(CFSTR("*** error: vImageBuffer_InitWithCGImage returned error code %zi for inputImage: %@"), v37, v36);
          UIGraphicsEndImageContext();
          goto LABEL_4;
        }
        p_dest = &dest;
        vImageBuffer_Init(&dest, buf.height, buf.width, format.bitsPerPixel, 0);
        if (a4 <= 0.00000011920929)
        {
          p_buf = &buf;
        }
        else
        {
          v39 = (v26 * a4 * 3.0 * 2.50662827 * 0.25 + 0.5) * 0.5;
          if (v26 * a4 + -2.0 < 0.00000011920929)
            v39 = 2.12997121;
          v40 = vcvtmd_u64_f64(v39) | 1;
          p_dest = &buf;
          p_buf = &dest;
          v42 = vImageBoxConvolve_ARGB8888(&buf, &dest, 0, 0, 0, v40, v40, 0, 0x88u);
          v43 = malloc_type_malloc(v42, 0x842216BEuLL);
          vImageBoxConvolve_ARGB8888(&buf, &dest, v43, 0, 0, v40, v40, 0, 8u);
          vImageBoxConvolve_ARGB8888(&dest, &buf, v43, 0, 0, v40, v40, 0, 8u);
          vImageBoxConvolve_ARGB8888(&buf, &dest, v43, 0, 0, v40, v40, 0, 8u);
          free(v43);
        }
        if (v22 <= 0.00000011920929)
        {
          v50 = p_buf;
          p_buf = p_dest;
        }
        else
        {
          v58 = v54[0] * 0.9278 + 0.0722;
          v59 = v54[0] * -0.0722 + 0.0722;
          v60 = v59;
          v62 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FE6E2EB1C432CA5uLL), (float64x2_t)xmmword_1AB7F8370, v54[0]);
          v63 = v62.f64[0];
          v61 = 0;
          v64 = 0;
          v44 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FCB367A0F9096BCuLL), (float64x2_t)xmmword_1AB7F8380, v54[0]);
          v65 = v44.f64[0];
          v66 = v44;
          v67 = 0u;
          v68 = 0u;
          v69 = 0x3FF0000000000000;
          v45 = 0;
          v46 = &v58;
          v47 = (float64x2_t)vdupq_n_s64(0x4070000000000000uLL);
          do
          {
            v48 = *(float64x2_t *)v46;
            v49 = *(float64x2_t *)(v46 + 2);
            v46 += 4;
            *(uint64_t *)((char *)v54 + v45 + 16) = (uint64_t)vmovn_s32(vcvtq_s32_f32(vrndaq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(v48, v47)), vmulq_f64(v49, v47)))));
            v45 += 8;
          }
          while (v45 != 32);
          vImageMatrixMultiply_ARGB8888(p_buf, p_dest, (const int16_t *)&v53, 256, 0, 0, 0);
          v50 = p_dest;
        }
        v51 = vImageCreateCGImageFromBuffer(v50, &format, (void (__cdecl *)(void *, void *))cleanupBuffer, 0, 0x200u, 0);
        if (!v51)
        {
          v51 = vImageCreateCGImageFromBuffer(v50, &format, 0, 0, 0, 0);
          free(v50->data);
        }
        if (v12)
        {
          v73.origin.x = v32;
          v73.origin.y = v33;
          v73.size.width = v30;
          v73.size.height = v31;
          CGContextDrawImage(CurrentContext, v73, v24);
          CGContextSaveGState(CurrentContext);
          v52 = (CGImage *)objc_msgSend(objc_retainAutorelease(v12), "CGImage");
          v74.origin.x = v32;
          v74.origin.y = v33;
          v74.size.width = v30;
          v74.size.height = v31;
          CGContextClipToMask(CurrentContext, v74, v52);
        }
        else
        {
          CGContextSaveGState(CurrentContext);
        }
        v75.origin.x = v32;
        v75.origin.y = v33;
        v75.size.width = v30;
        v75.size.height = v31;
        CGContextDrawImage(CurrentContext, v75, v51);
        CGContextRestoreGState(CurrentContext);
        CGImageRelease(v51);
        free(p_buf->data);
        if (v11)
          goto LABEL_15;
      }
      else
      {
        v71.origin.x = v32;
        v71.origin.y = v33;
        v71.size.width = v30;
        v71.size.height = v31;
        CGContextDrawImage(CurrentContext, v71, v24);
        if (v11)
        {
LABEL_15:
          CGContextSaveGState(CurrentContext);
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v11), "CGColor"));
          v72.origin.x = v32;
          v72.origin.y = v33;
          v72.size.width = v30;
          v72.size.height = v31;
          CGContextFillRect(CurrentContext, v72);
          CGContextRestoreGState(CurrentContext);
        }
      }
      UIGraphicsGetImageFromCurrentImageContext();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      goto LABEL_5;
    }
  }
  objc_msgSend(v10, "size", *(_OWORD *)v54);
  v16 = v15;
  objc_msgSend(v10, "size");
  NSLog(CFSTR("*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@"), v16, v17, v10);
LABEL_4:
  v18 = 0;
LABEL_5:

  return v18;
}

@end
