CGImageRef LICreateIconFromCachedBitmap(const __CFData *a1)
{
  CGImageRef result;

  result = (CGImageRef)objc_msgSend(MEMORY[0x24BE51A60], "createCGImageWithBitmapData:", a1);
  if (!result)
    return LICreateImageFromUncompressedBitmapData(a1);
  return result;
}

void sub_2067A2C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double LIIconOutputSizeForVariant(int a1)
{
  double v1;
  double v2;

  v1 = outputSizeForVariant(a1);
  scaleForVariant();
  return v1 / v2;
}

void ___createApplicationIconFromImage_block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  const __CFString *v16;
  CGImage *CGImageFromFrameworkBundleResourceNamed;
  CGImage *v18;
  CGFloat Width;
  int v20;
  int v21;
  const __CFString *v22;
  CGImage *v23;
  CGImage *v24;
  CGFloat v25;
  const CGPath *ContinuousRoundedRect;
  const CGPath *v27;
  CGImage *v28;
  int v29;
  double v30;
  double Height;
  double v32;
  double v33;
  double v34;
  double v35;
  CGImage *v37;
  double *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGImage *v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  uint64_t Scaled;
  CGImage *v55;
  const __CFString *v56;
  CGImage *v57;
  CGImage *v58;
  CGFloat v59;
  const __CFString *v60;
  CGImage *v61;
  CGImage *v62;
  CGFloat v63;
  CGFloat components[2];
  __int128 v65;
  uint64_t v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v66 = *MEMORY[0x24BDAC8D0];
  scaleForVariant();
  v13 = v12;
  v14 = *MEMORY[0x24BDBF148];
  v15 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v16 = *(const __CFString **)(a1 + 32);
  if (v16)
  {
    CGImageFromFrameworkBundleResourceNamed = createCGImageFromFrameworkBundleResourceNamed(v16, v12);
    if (CGImageFromFrameworkBundleResourceNamed)
    {
      v18 = CGImageFromFrameworkBundleResourceNamed;
      Width = (double)CGImageGetWidth(CGImageFromFrameworkBundleResourceNamed);
      v67.size.height = (double)CGImageGetHeight(v18);
      v67.origin.x = v14;
      v67.origin.y = v15;
      v67.size.width = Width;
      CGContextDrawImage(a2, v67, v18);
      CGImageRelease(v18);
    }
  }
  v20 = *(_DWORD *)(a1 + 108);
  v21 = v20;
  if ((v20 & 0x20) == 0)
  {
    CGContextSaveGState(a2);
    v22 = *(const __CFString **)(a1 + 40);
    if (v22)
    {
      v23 = createCGImageFromFrameworkBundleResourceNamed(v22, v13);
      if (v23)
      {
        v24 = v23;
        v25 = (double)CGImageGetWidth(v23);
        v68.size.height = (double)CGImageGetHeight(v24);
        v68.origin.x = v14;
        v68.origin.y = v15;
        v68.size.width = v25;
        CGContextClipToMask(a2, v68, v24);
        CFRelease(v24);
      }
      else
      {
        NSLog(CFSTR("%s: Error: unable to create icon mask image from image named \"%@\" at scale %.1f"), "_createApplicationIconFromImage_block_invoke", *(_QWORD *)(a1 + 40), *(_QWORD *)&v13);
      }
    }
    else
    {
      ContinuousRoundedRect = (const CGPath *)_LICGPathCreateContinuousRoundedRect(a3, a4, a5, a6);
      if (ContinuousRoundedRect)
      {
        v27 = ContinuousRoundedRect;
        CGContextAddPath(a2, ContinuousRoundedRect);
        CFRelease(v27);
        CGContextClip(a2);
      }
    }
    CGContextBeginTransparencyLayer(a2, 0);
    v21 = *(_DWORD *)(a1 + 108);
  }
  if ((v21 & 0x20008) != 0)
  {
    if ((v21 & 0x40000) != 0 && (CGImageHasAlpha() & 1) == 0)
    {
      v69.origin.x = a3;
      v69.origin.y = a4;
      v69.size.width = a5;
      v69.size.height = a6;
      CGContextClipToMask(a2, v69, *(CGImageRef *)(a1 + 48));
    }
  }
  else
  {
    *(_OWORD *)components = xmmword_2067ADDB0;
    v65 = unk_2067ADDC0;
    CGContextSetFillColor(a2, components);
    v70.origin.x = a3;
    v70.origin.y = a4;
    v70.size.width = a5;
    v70.size.height = a6;
    CGContextFillRect(a2, v70);
  }
  v28 = *(CGImage **)(a1 + 48);
  if (v28)
  {
    if ((*(_DWORD *)(a1 + 108) & 0x14) != 4)
    {
LABEL_30:
      v37 = CGImageRetain(v28);
      goto LABEL_50;
    }
    v29 = *(_DWORD *)(a1 + 104);
    v30 = (double)CGImageGetWidth(*(CGImageRef *)(a1 + 48));
    Height = (double)CGImageGetHeight(v28);
    v32 = v15;
    v33 = v14;
    if (v29 <= 0x3F)
    {
      if (((1 << v29) & 0x100008001) != 0)
      {
        scaleForVariant();
        v33 = v34 * 59.0;
        v35 = 60.0;
      }
      else
      {
        v32 = v15;
        v33 = v14;
        if (((1 << v29) & 0x8000000001000002) == 0)
          goto LABEL_25;
        scaleForVariant();
        v33 = v34 * 74.0;
        v35 = 76.0;
      }
      v32 = v34 * v35;
    }
LABEL_25:
    if (v33 != v30 || v32 != Height)
    {
      v28 = *(CGImage **)(a1 + 48);
      goto LABEL_30;
    }
    v38 = (double *)MEMORY[0x24BDBF090];
    v39 = 0.0;
    if (v29 > 23)
    {
      if (v29 != 63 && v29 != 24)
      {
LABEL_38:
        v41 = 0.0;
        if (v29 > 0x3F || (v40 = v39, ((1 << v29) & 0x8000000001008003) == 0))
        {
LABEL_41:
          if (v29 > 23)
          {
            if (v29 == 24 || v29 == 63)
            {
              v43 = 6.0;
              goto LABEL_49;
            }
          }
          else
          {
            v43 = 3.0;
            if (v29 < 2)
            {
LABEL_49:
              v44 = *v38 + v41;
              v71.size.width = v33 + v41 * -2.0;
              v71.origin.y = v38[1] + v39;
              v71.size.height = v32 - (v39 + v43);
              v71.origin.x = v44;
              v37 = CGImageCreateWithImageInRect(*(CGImageRef *)(a1 + 48), v71);
LABEL_50:
              v45 = v37;
              v46 = unskewedCompositingFrameForDestinationFrame(v37, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
              v48 = v47;
              v50 = v49;
              v52 = v51;
              v53 = v49 / (double)CGImageGetWidth(v45);
              if (v53 != 1.0)
              {
                Scaled = _LICGImageCreateScaled(v45, 1, v53);
                if (Scaled)
                {
                  v55 = (CGImage *)Scaled;
                  CFAutorelease(v45);
                  v45 = v55;
                }
              }
              v72.origin.x = v46;
              v72.origin.y = v48;
              v72.size.width = v50;
              v72.size.height = v52;
              CGContextDrawImage(a2, v72, v45);
              CGImageRelease(v45);
              goto LABEL_54;
            }
            if (v29 == 15)
            {
              v43 = 5.0;
              goto LABEL_49;
            }
          }
          v43 = 0.0;
          goto LABEL_49;
        }
LABEL_40:
        scaleForVariant();
        v41 = v42;
        v39 = v40;
        goto LABEL_41;
      }
    }
    else if (v29 != 1)
    {
      v40 = 1.0;
      if (v29 == 15)
        goto LABEL_40;
      goto LABEL_38;
    }
    scaleForVariant();
    goto LABEL_38;
  }
LABEL_54:
  v56 = *(const __CFString **)(a1 + 88);
  if (v56)
  {
    v57 = createCGImageFromFrameworkBundleResourceNamed(v56, v13);
    if (v57)
    {
      v58 = v57;
      v59 = (double)CGImageGetWidth(v57);
      v73.size.height = (double)CGImageGetHeight(v58);
      v73.origin.x = v14;
      v73.origin.y = v15;
      v73.size.width = v59;
      CGContextDrawImage(a2, v73, v58);
      CGImageRelease(v58);
    }
    else
    {
      NSLog(CFSTR("%s: Error: unable to create icon overlay image from image named \"%@\" at scale %.1f"), "_createApplicationIconFromImage_block_invoke", *(_QWORD *)(a1 + 88), *(_QWORD *)&v13);
    }
  }
  v60 = *(const __CFString **)(a1 + 96);
  if (!v60 || (*(_BYTE *)(a1 + 110) & 1) != 0)
  {
LABEL_62:
    if ((v20 & 0x20) != 0)
      return;
    goto LABEL_63;
  }
  v61 = createCGImageFromFrameworkBundleResourceNamed(v60, v13);
  if (v61)
  {
    v62 = v61;
    v63 = (double)CGImageGetWidth(v61);
    v74.size.height = (double)CGImageGetHeight(v62);
    v74.origin.x = v14;
    v74.origin.y = v15;
    v74.size.width = v63;
    CGContextDrawImage(a2, v74, v62);
    CGImageRelease(v62);
    goto LABEL_62;
  }
  NSLog(CFSTR("%s: Error: unable to create icon outline image from image named \"%@\" at scale %.1f"), "_createApplicationIconFromImage_block_invoke", *(_QWORD *)(a1 + 96), *(_QWORD *)&v13);
  if ((v20 & 0x20) != 0)
    return;
LABEL_63:
  CGContextEndTransparencyLayer(a2);
  CGContextRestoreGState(a2);
}

CGImageRef createCGImageFromFrameworkBundleResourceNamed(const __CFString *a1, double a2)
{
  uint64_t v4;
  void *v5;
  CGImageRef CGImageForURL;
  CFRange v7;
  const __CFAllocator *v8;
  const void *v9;
  const void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFURL *v13;
  uint64_t v14;
  CFRange v16;
  CFRange v17;

  _frameworkBundle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  CGImageForURL = 0;
  if (!a1 || !v4)
    goto LABEL_20;
  v7 = CFStringFind(a1, CFSTR("."), 4uLL);
  if (v7.location != -1)
  {
    v16.length = CFStringGetLength(a1) - (v7.location + v7.length);
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v16.location = v7.location + v7.length;
    v9 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, v16);
    v17.location = 0;
    v17.length = v7.location;
    v10 = CFStringCreateWithSubstring(v8, a1, v17);
    if (v10)
      goto LABEL_5;
LABEL_8:
    v12 = 0;
    goto LABEL_11;
  }
  v10 = CFRetain(a1);
  v9 = CFRetain(&stru_24BFDAC58);
  if (!v10)
    goto LABEL_8;
LABEL_5:
  if (a2 <= 1.0)
    v11 = (const __CFString *)CFRetain(v10);
  else
    v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@@%ux"), v10, a2);
  v12 = v11;
  objc_msgSend(v5, "URLForResource:withExtension:", v11, v9);
  v13 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_14;
LABEL_11:
  if (v12 == a1)
  {
    CGImageForURL = 0;
    goto LABEL_22;
  }
  objc_msgSend(v5, "URLForResource:withExtension:", a1, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v13 = (const __CFURL *)v14;
LABEL_14:
    CGImageForURL = createCGImageForURL(v13, 1);
    CFRelease(v13);
    goto LABEL_15;
  }
  CGImageForURL = 0;
LABEL_15:
  a1 = v12;
  if (!v12)
  {
    if (!v10)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_22:
  CFRelease(a1);
  if (v10)
LABEL_17:
    CFRelease(v10);
LABEL_18:
  if (v9)
    CFRelease(v9);
LABEL_20:

  return CGImageForURL;
}

void ___createCircleIconFromImage_block_invoke(uint64_t a1, CGContextRef c)
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v12;

  if (*(_QWORD *)(a1 + 32))
  {
    CGContextSaveGState(c);
    v4 = unskewedCompositingFrameForDestinationFrame(*(CGImage **)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      CGContextAddEllipseInRect(c, *(CGRect *)&v4);
      CGContextClip(c);
    }
    v12.origin.x = v8;
    v12.origin.y = v9;
    v12.size.width = v10;
    v12.size.height = v11;
    CGContextDrawImage(c, v12, *(CGImageRef *)(a1 + 32));
    CGContextRestoreGState(c);
  }
}

double unskewedCompositingFrameForDestinationFrame(CGImage *a1, double a2, double a3, double a4, double a5)
{
  double v8;
  double Width;
  double v10;

  v8 = a4 / a5;
  Width = (double)CGImageGetWidth(a1);
  v10 = Width / (double)CGImageGetHeight(a1);
  if (v10 > v8)
    return round(a2 + a4 * (v10 / v8 + -1.0) * -0.5);
  return a2;
}

CGImage *LICreateIconForImage(void *a1, unsigned int a2, unsigned int a3)
{
  const __CFArray *v5;
  const __CFArray *v6;
  CGImage *v7;
  void *values;

  values = a1;
  if (!a1)
  {
    syslog(4, "LICreateIconForImage passed NULL CGImageRef image");
    return 0;
  }
  v5 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = LICreateIconForImages(v5, a2, a3);
  CFRelease(v6);
  return v7;
}

CGImage *LICreateIconForImages(const __CFArray *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  CGImage *v5;
  CGImage *v6;
  unsigned int v7;
  double Width;
  double Height;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  CGImage *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGImageRef v24;
  CGImage *v25;
  char *v26;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  __int128 v32;
  __int128 v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  const __CFString *v45;
  unsigned int v46;
  unsigned int v47;

  v3 = a3;
  v5 = LICopyBestImageForVariantFromImages(a1, a2, a3);
  v6 = v5;
  v7 = v3 & 0xFFFFFFEF;
  if ((v3 & 4) != 0)
    v3 &= ~0x10u;
  if ((v3 & 0x10) != 0 && v5)
  {
    Width = (double)CGImageGetWidth(v5);
    Height = (double)CGImageGetHeight(v6);
    composedImageBoundsForVariant(a2);
    if (v11 != Height || v10 != Width)
      v3 = v7;
  }
  switch(a2)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x28u:
    case 0x29u:
    case 0x2Du:
    case 0x2Eu:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x4Fu:
    case 0x50u:
      goto LABEL_11;
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x24u:
    case 0x25u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
      v18 = outputSizeForVariant(a2);
      v36 = MEMORY[0x24BDAC760];
      v37 = 3221225472;
      v38 = __createDocumentIconFromImage_block_invoke;
      v39 = &__block_descriptor_48_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
      *(_QWORD *)&v41 = __PAIR64__(v3, a2);
      v40 = (const __CFString *)v6;
      goto LABEL_32;
    case 0x26u:
    case 0x27u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
      goto LABEL_24;
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
    case 0x4Cu:
    case 0x4Du:
    case 0x4Eu:
      v34 = 0.0;
      v35 = 0.0;
      v32 = 0u;
      v33 = 0u;
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v29 = 0;
      if (!frameAndImageNamesForVariant(a2, v3, (uint64_t)&v32, (uint64_t)&v34, &v31, &v30, &v29, &v28))
        goto LABEL_34;
      v37 = 3221225472;
      v42 = v32;
      v18 = v34;
      v19 = v35;
      v36 = MEMORY[0x24BDAC760];
      v38 = ___createApplicationIconFromImage_block_invoke;
      v39 = &__block_descriptor_112_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
      v46 = a2;
      v47 = v3;
      v40 = v31;
      *(_QWORD *)&v41 = v29;
      v43 = v33;
      *((_QWORD *)&v41 + 1) = v6;
      v44 = v30;
      v45 = v28;
      goto LABEL_32;
    default:
      if (a2 - 0x8000 > 8)
        goto LABEL_34;
      if (((1 << a2) & 0x1D5) == 0)
      {
LABEL_24:
        if (v6)
        {
          if ((v3 & 0x10) != 0)
          {
            v20 = (double)CGImageGetWidth(v6);
            v21 = (double)CGImageGetHeight(v6);
            if (outputSizeForVariant(a2) == v20 && v22 == v21)
            {
              v24 = CGImageRetain(v6);
LABEL_33:
              v25 = v24;
              goto LABEL_40;
            }
          }
          v34 = 0.0;
          v35 = 0.0;
          v32 = 0u;
          v33 = 0u;
          v30 = 0;
          v31 = 0;
          v28 = 0;
          v29 = 0;
          if (frameAndImageNamesForVariant(a2, v3, (uint64_t)&v32, (uint64_t)&v34, &v31, &v30, &v29, &v28))
          {
            v36 = MEMORY[0x24BDAC760];
            v37 = 3221225472;
            v41 = v32;
            v18 = v34;
            v19 = v35;
            v38 = ___createCircleIconFromImage_block_invoke;
            v39 = &__block_descriptor_76_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
            v40 = (const __CFString *)v6;
            v42 = v33;
            LODWORD(v43) = v3;
LABEL_32:
            v24 = _createIcon(v6, &v36, v18, v19);
            goto LABEL_33;
          }
        }
        goto LABEL_34;
      }
LABEL_11:
      if (!v6)
      {
LABEL_34:
        v25 = 0;
        goto LABEL_40;
      }
      if ((v3 & 0x10) != 0
        && ((v13 = (double)CGImageGetWidth(v6), v14 = (double)CGImageGetHeight(v6), outputSizeForVariant(a2) == v13)
          ? (v16 = v15 == v14)
          : (v16 = 0),
            v16))
      {
        v17 = CGImageRetain(v6);
      }
      else
      {
        v34 = 0.0;
        v35 = 0.0;
        v32 = 0u;
        v33 = 0u;
        v30 = 0;
        v31 = 0;
        v28 = 0;
        v29 = 0;
        if (!frameAndImageNamesForVariant(a2, v3, (uint64_t)&v32, (uint64_t)&v34, &v31, &v30, &v29, &v28))
        {
          v25 = 0;
          goto LABEL_40;
        }
        v37 = 3221225472;
        v42 = v32;
        v36 = MEMORY[0x24BDAC760];
        v38 = ___createApplicationIconFromImage_block_invoke;
        v39 = &__block_descriptor_112_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
        v46 = a2;
        v47 = v3;
        v40 = v31;
        *(_QWORD *)&v41 = v29;
        v43 = v33;
        *((_QWORD *)&v41 + 1) = v6;
        v44 = v30;
        v45 = v28;
        v17 = _createIcon(v6, &v36, v34, v35);
      }
      v25 = v17;
      if (v17 && (v3 & 1) != 0)
      {
        v26 = LICreateGhostlyVersion(v17);
        CGImageRelease(v25);
        v25 = (CGImage *)v26;
      }
LABEL_40:
      CGImageRelease(v6);
      return v25;
  }
}

uint64_t frameAndImageNamesForVariant(int a1, char a2, uint64_t a3, uint64_t a4, const __CFString **a5, const __CFString **a6, const __CFString **a7, const __CFString **a8)
{
  double v16;
  double v17;
  double v18;
  __int128 v19;
  const __CFString *v20;
  uint64_t result;
  double v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;

  v16 = outputSizeForVariant(a1);
  v18 = v17;
  if (a3)
  {
    v19 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)a3 = *MEMORY[0x24BDBF090];
    *(_OWORD *)(a3 + 16) = v19;
  }
  if (a4)
    *(_OWORD *)a4 = *MEMORY[0x24BDBF148];
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a8)
    *a8 = 0;
  if ((a2 & 0x10) == 0)
  {
    v20 = 0;
    result = 0;
    v22 = 0.0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = v18;
    v27 = v16;
    v28 = 0.0;
    switch(a1)
    {
      case 0:
      case 1:
      case 15:
      case 24:
      case 32:
        v29 = (v16 - expectedInputSizeForVariant(a1, 0)) * 0.5;
        v28 = floorf(v29);
        v22 = *(double *)(MEMORY[0x24BDBF148] + 8) + 0.0;
        v27 = expectedInputSizeForVariant(a1, a2);
        v26 = v30;
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v31 = (a2 & 0x20) == 0;
        v23 = CFSTR("AppIconMask.png");
        goto LABEL_16;
      case 2:
      case 3:
      case 16:
      case 25:
      case 33:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("SpotlightAppIconMask.png");
        goto LABEL_101;
      case 4:
      case 17:
      case 34:
        v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0)
          v23 = 0;
        else
          v23 = CFSTR("TableIconMask.png");
        v20 = CFSTR("TableIconOutline.png");
        goto LABEL_103;
      case 5:
      case 6:
      case 7:
      case 8:
      case 11:
      case 18:
      case 19:
      case 20:
      case 21:
      case 26:
      case 27:
      case 28:
      case 29:
      case 36:
      case 37:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 67:
        return result;
      case 9:
        v20 = 0;
        v25 = CFSTR("AppFolderBadgeIconShadow-16_1only_.png");
        if ((a2 & 8) != 0)
          v25 = 0;
        v24 = CFSTR("AppFolderBadgeIconOverlay-16_1only_.png");
        if ((a2 & 2) != 0)
          v24 = 0;
        v23 = CFSTR("AppFolderBadgeIconMask-16_1only_.png");
        if ((a2 & 0x20) != 0)
          v23 = 0;
        v22 = 1.0;
        v26 = 14.0;
        v27 = 14.0;
        v28 = 1.0;
        goto LABEL_104;
      case 10:
        v20 = 0;
        v25 = CFSTR("AppFolderBadgeIconShadow-32_1only_.png");
        if ((a2 & 8) != 0)
          v25 = 0;
        v24 = CFSTR("AppFolderBadgeIconOverlay-32_1only_.png");
        if ((a2 & 2) != 0)
          v24 = 0;
        v23 = CFSTR("AppFolderBadgeIconMask-32_1only_.png");
        if ((a2 & 0x20) != 0)
          v23 = 0;
        v22 = 2.0;
        v26 = 15.0;
        v27 = 15.0;
        v28 = 15.0;
        goto LABEL_104;
      case 12:
        v20 = 0;
        v25 = CFSTR("AppFolderBadgeIconShadow-128_1only_.png");
        if ((a2 & 8) != 0)
          v25 = 0;
        v24 = CFSTR("AppFolderBadgeIconOverlay-128_1only_.png");
        if ((a2 & 2) != 0)
          v24 = 0;
        v28 = 59.0;
        v26 = 61.0;
        v23 = CFSTR("AppFolderBadgeIconMask-128_1only_.png");
        if ((a2 & 0x20) != 0)
          v23 = 0;
        v22 = 7.0;
        goto LABEL_80;
      case 13:
        v20 = 0;
        v25 = CFSTR("AppFolderBadgeIconShadow-256_1only_.png");
        if ((a2 & 8) != 0)
          v25 = 0;
        v24 = CFSTR("AppFolderBadgeIconOverlay-256_1only_.png");
        if ((a2 & 2) != 0)
          v24 = 0;
        v28 = 118.0;
        v26 = 122.0;
        v23 = CFSTR("AppFolderBadgeIconMask-256_1only_.png");
        if ((a2 & 0x20) != 0)
          v23 = 0;
        v22 = 13.0;
        goto LABEL_80;
      case 14:
        v20 = 0;
        v25 = CFSTR("AppFolderBadgeIconShadow-512_1only_.png");
        if ((a2 & 8) != 0)
          v25 = 0;
        v24 = CFSTR("AppFolderBadgeIconOverlay-512_1only_.png");
        if ((a2 & 2) != 0)
          v24 = 0;
        v28 = 237.0;
        v26 = 243.0;
        v23 = CFSTR("AppFolderBadgeIconMask-512_1only_.png");
        if ((a2 & 0x20) != 0)
          v23 = 0;
        v22 = 27.0;
LABEL_80:
        v27 = v26;
        goto LABEL_104;
      case 22:
      case 23:
      case 35:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("NotificationAppIconMask.png");
        goto LABEL_101;
      case 30:
        v28 = sideInsetForVariant(30);
        v22 = *(double *)(MEMORY[0x24BDBF148] + 8) + 0.0;
        v27 = expectedInputSizeForVariant(30, a2);
        v26 = v33;
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v31 = (a2 & 0x20) == 0;
        v23 = CFSTR("CarAppIconMask-120_1only_.png");
        goto LABEL_16;
      case 31:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("CarNotificationAppIconMask-58_1only_.png");
        goto LABEL_101;
      case 38:
      case 39:
      case 42:
      case 43:
      case 44:
      case 47:
      case 48:
      case 49:
      case 50:
        goto LABEL_104;
      case 40:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("NanoIconMaskChiclet-24.0.png");
        goto LABEL_101;
      case 41:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("NanoIconMaskChiclet-27.5.png");
        goto LABEL_101;
      case 45:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("NanoIconMaskChiclet-86.0.png");
        goto LABEL_101;
      case 46:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("NanoIconMaskChiclet-98.0.png");
        goto LABEL_101;
      case 51:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("NanoIconMaskChiclet-40.0.png");
        goto LABEL_101;
      case 52:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("NanoIconMaskChiclet-44.0.png");
        goto LABEL_101;
      case 53:
        v28 = sideInsetForVariant(53);
        v22 = *(double *)(MEMORY[0x24BDBF148] + 8) + 0.0;
        v27 = expectedInputSizeForVariant(53, a2);
        v26 = v34;
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v31 = (a2 & 0x20) == 0;
        v23 = CFSTR("CarAppIconMask-180_1only_.png");
        goto LABEL_16;
      case 54:
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v23 = CFSTR("CarNotificationAppIconMask-87_1only_.png");
LABEL_101:
        if ((a2 & 0x20) != 0)
          v23 = 0;
        goto LABEL_103;
      case 63:
        v28 = sideInsetForVariant(63);
        v22 = *(double *)(MEMORY[0x24BDBF148] + 8) + 0.0;
        v27 = expectedInputSizeForVariant(63, a2);
        v26 = v35;
        v20 = 0;
        v24 = 0;
        v25 = 0;
        v31 = (a2 & 0x20) == 0;
        v23 = CFSTR("AppIconMask-RFB.png");
LABEL_16:
        if (!v31)
          v23 = 0;
        goto LABEL_104;
      case 64:
      case 65:
      case 66:
        v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0)
          v23 = 0;
        else
          v23 = CFSTR("NotificationAppIconMask.png");
        v20 = CFSTR("NotificationIconOutline.png");
        goto LABEL_103;
      case 68:
      case 69:
      case 70:
        v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0)
          v23 = 0;
        else
          v23 = CFSTR("MessagesLauncherIconMask-60.0.png");
        v20 = CFSTR("MessagesLauncherIconOutline-60.0.png");
        goto LABEL_103;
      case 71:
        v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0)
          v23 = 0;
        else
          v23 = CFSTR("MessagesLauncherIconMask-67.0.png");
        v20 = CFSTR("MessagesLauncherIconOutline-67.0.png");
        goto LABEL_103;
      case 72:
        v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0)
          v23 = 0;
        else
          v23 = CFSTR("MessagesLauncherIconMask-74.0.png");
        v20 = CFSTR("MessagesLauncherIconOutline-74.0.png");
        goto LABEL_103;
      case 73:
      case 74:
      case 75:
        v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0)
          v23 = 0;
        else
          v23 = CFSTR("MessagesBadgeIconMask-32.0.png");
        v20 = CFSTR("MessagesBadgeIconOutline-32.0.png");
        goto LABEL_103;
      case 76:
      case 77:
      case 78:
        v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0)
          v23 = 0;
        else
          v23 = CFSTR("MessagesStatusIconMask-27.0.png");
        v20 = CFSTR("MessagesStatusIconOutline-27.0.png");
        goto LABEL_103;
      case 79:
      case 80:
        v20 = 0;
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v28 = *MEMORY[0x24BDBEFB0];
        v22 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
LABEL_103:
        v26 = v18;
        v27 = v16;
        goto LABEL_104;
      default:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = v18;
        v27 = v16;
        v28 = 0.0;
        switch(a1)
        {
          case 32768:
            v20 = 0;
            v24 = 0;
            v25 = 0;
            v23 = CFSTR("NanoIconMaskChiclet-50.0.png");
            goto LABEL_101;
          case 32769:
          case 32771:
          case 32772:
          case 32773:
          case 32774:
          case 32775:
          case 32776:
            goto LABEL_104;
          case 32770:
            v20 = 0;
            v24 = 0;
            v25 = 0;
            v23 = CFSTR("NanoIconMaskChiclet-108.0.png");
            goto LABEL_101;
          default:
            return result;
        }
        return result;
    }
  }
  v28 = composedImageBoundsForVariant(a1);
  v22 = v32;
  v20 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
LABEL_104:
  if (a3)
  {
    *(double *)a3 = v28;
    *(double *)(a3 + 8) = v22;
    *(double *)(a3 + 16) = v27;
    *(double *)(a3 + 24) = v26;
  }
  if (a4)
  {
    *(double *)a4 = v16;
    *(double *)(a4 + 8) = v18;
  }
  if (a5)
    *a5 = v25;
  if (a6)
    *a6 = v24;
  if (a7)
    *a7 = v23;
  if (a8)
    *a8 = v20;
  return 1;
}

double outputSizeForVariant(int a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;

  switch(a1)
  {
    case 0:
    case 35:
    case 66:
LABEL_9:
      v1 = 0x404E000000000000;
      goto LABEL_55;
    case 1:
      v1 = 0x4053000000000000;
      goto LABEL_55;
    case 2:
    case 3:
    case 23:
    case 65:
      v1 = 0x4044000000000000;
      goto LABEL_55;
    case 4:
      v2 = 29.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 5:
    case 7:
    case 18:
    case 20:
      v2 = 37.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 6:
    case 8:
      v2 = 247.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 9:
      v2 = 16.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 10:
      v1 = 0x4040000000000000;
      goto LABEL_55;
    case 11:
    case 38:
    case 40:
      v1 = 0x4048000000000000;
      goto LABEL_55;
    case 12:
    case 79:
      v1 = 0x4060000000000000;
      goto LABEL_55;
    case 13:
      v1 = 0x4070000000000000;
      goto LABEL_55;
    case 14:
      v1 = 0x4080000000000000;
      goto LABEL_55;
    case 15:
    case 30:
    case 33:
LABEL_10:
      v1 = 0x405E000000000000;
      goto LABEL_55;
    case 16:
    case 25:
    case 42:
    case 49:
    case 51:
      v1 = 0x4054000000000000;
      goto LABEL_55;
    case 17:
    case 31:
    case 47:
LABEL_5:
      v1 = 0x404D000000000000;
      goto LABEL_55;
    case 19:
    case 21:
    case 26:
    case 28:
      v2 = 74.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 22:
    case 64:
      v2 = 20.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 24:
      v1 = 0x4063000000000000;
      goto LABEL_55;
    case 27:
    case 29:
      v2 = 493.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 32:
    case 53:
      v3 = 0x4066800000000000;
      goto LABEL_56;
    case 34:
    case 48:
    case 54:
      v3 = 0x4055C00000000000;
      goto LABEL_56;
    case 36:
    case 37:
      v2 = 111.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 39:
    case 41:
      v3 = 0x404B800000000000;
      goto LABEL_56;
    case 43:
    case 45:
      v3 = 0x4065800000000000;
      goto LABEL_56;
    case 44:
    case 46:
      v3 = 0x4068800000000000;
      goto LABEL_56;
    case 50:
    case 52:
      v1 = 0x4056000000000000;
      goto LABEL_55;
    case 55:
      v2 = 64.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 56:
      v2 = 128.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 57:
      v2 = 192.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 58:
      v2 = 96.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 59:
      v2 = 192.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 60:
      v2 = 34.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 61:
      v2 = 68.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 62:
      v2 = 102.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 63:
      v3 = 0x4064E00000000000;
      goto LABEL_56;
    case 67:
      v2 = 18.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 68:
      v2 = 60.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 69:
      v2 = 120.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 70:
      v2 = 180.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 71:
      v2 = 134.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 72:
      v2 = 148.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 73:
      v2 = 32.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 74:
      v2 = 64.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 75:
      v2 = 96.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 76:
      v2 = 27.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 77:
      v2 = 54.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 78:
      v2 = 81.0;
      return v2 + *MEMORY[0x24BDBF148] * 2.0;
    case 80:
      v1 = 0x4068000000000000;
LABEL_55:
      v3 = v1;
LABEL_56:
      v2 = *(double *)&v3;
      break;
    default:
      v2 = *MEMORY[0x24BDBF148];
      switch(a1)
      {
        case 32768:
        case 32769:
          v1 = 0x4059000000000000;
          goto LABEL_55;
        case 32770:
        case 32771:
          v1 = 0x406B000000000000;
          goto LABEL_55;
        case 32772:
        case 32773:
          goto LABEL_5;
        case 32774:
          goto LABEL_9;
        case 32775:
          goto LABEL_10;
        case 32776:
          v1 = 0x4061000000000000;
          goto LABEL_55;
        default:
          return v2 + *MEMORY[0x24BDBF148] * 2.0;
      }
  }
  return v2 + *MEMORY[0x24BDBF148] * 2.0;
}

CGImage *LICopyBestImageForVariantFromImages(const __CFArray *a1, unsigned int a2, char a3)
{
  CFIndex Count;
  CFIndex v7;
  double v8;
  double v9;
  double v10;
  CGImage *v11;
  CFIndex v12;
  char v13;
  double v14;
  double v15;
  CGImage *ValueAtIndex;
  double Width;
  double Height;
  _BOOL4 v19;
  _BOOL4 v20;
  double v21;
  double v22;
  int v23;

  if (a1)
  {
    Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = expectedInputSizeForVariant(a2, a3);
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = (a2 < 0x3F) & (0x100C0C0060uLL >> a2);
      v15 = *MEMORY[0x24BDBF148];
      v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
      while (1)
      {
        ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(a1, v12);
        Width = (double)CGImageGetWidth(ValueAtIndex);
        Height = (double)CGImageGetHeight(ValueAtIndex);
        CFRetain(ValueAtIndex);
        v19 = v15 >= v8;
        if (v14 < v10)
          v19 = 0;
        v20 = v8 <= Width;
        if (v10 > Height)
          v20 = 0;
        v21 = vabdd_f64(Width, v8) + vabdd_f64(Height, v10);
        v22 = vabdd_f64(v15, v8) + vabdd_f64(v14, v10);
        v23 = v21 < v22;
        if ((v13 & 1) == 0)
        {
          if ((v19 ^ v20) != 1 && v21 < v22)
          {
LABEL_17:
            if (v11)
              CFRelease(v11);
            goto LABEL_19;
          }
          v23 = v20 && !v19;
        }
        if (!v11 || v23)
          goto LABEL_17;
        CFRelease(ValueAtIndex);
        Width = v15;
        Height = v14;
        ValueAtIndex = v11;
LABEL_19:
        ++v12;
        v11 = ValueAtIndex;
        v14 = Height;
        v15 = Width;
        if (v7 == v12)
          return ValueAtIndex;
      }
    }
  }
  return 0;
}

double expectedInputSizeForVariant(int a1, char a2)
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  uint64_t v8;

  if ((a2 & 0x10) != 0)
  {
    composedImageBoundsForVariant(a1);
    return v7;
  }
  else
  {
    scaleForVariant();
    v4 = v3;
    result = 14.0;
    switch(a1)
    {
      case 0:
      case 15:
      case 30:
      case 32:
      case 53:
        *(double *)&v8 = 60.0;
        goto LABEL_21;
      case 1:
      case 24:
LABEL_10:
        *(double *)&v8 = 76.0;
        goto LABEL_21;
      case 2:
      case 3:
      case 4:
      case 16:
      case 17:
      case 22:
      case 23:
      case 25:
      case 31:
      case 33:
      case 34:
      case 35:
      case 54:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
        return outputSizeForVariant(a1);
      case 5:
      case 7:
      case 18:
      case 19:
      case 20:
      case 21:
      case 26:
      case 28:
      case 36:
      case 37:
      case 60:
      case 61:
      case 62:
        v6 = 20.0;
        goto LABEL_22;
      case 6:
      case 8:
      case 27:
      case 29:
        v6 = 145.0;
        goto LABEL_22;
      case 9:
        return result;
      case 10:
        return 15.0;
      case 11:
        return 30.0;
      case 12:
        return 61.0;
      case 13:
        return 122.0;
      case 14:
        return 243.0;
      case 38:
      case 40:
        v6 = 24.0;
        goto LABEL_22;
      case 39:
      case 41:
        v6 = 27.5;
        goto LABEL_22;
      case 42:
      case 49:
      case 51:
        *(double *)&v8 = 40.0;
        goto LABEL_21;
      case 43:
      case 45:
        v6 = 86.0;
        goto LABEL_22;
      case 44:
      case 46:
        v6 = 98.0;
        goto LABEL_22;
      case 47:
      case 48:
LABEL_9:
        v6 = 29.0;
        goto LABEL_22;
      case 50:
      case 52:
        *(double *)&v8 = 44.0;
        goto LABEL_21;
      case 55:
      case 56:
      case 57:
        *(double *)&v8 = 38.0;
        goto LABEL_21;
      case 58:
      case 59:
        *(double *)&v8 = 58.0;
        goto LABEL_21;
      case 63:
LABEL_24:
        v6 = 83.5;
        goto LABEL_22;
      case 79:
      case 80:
        *(double *)&v8 = 64.0;
LABEL_21:
        v6 = *(double *)&v8;
LABEL_22:
        result = v4 * v6;
        break;
      default:
        switch(a1)
        {
          case 32768:
          case 32769:
            *(double *)&v8 = 50.0;
            goto LABEL_21;
          case 32770:
          case 32771:
            *(double *)&v8 = 108.0;
            goto LABEL_21;
          case 32772:
          case 32773:
            goto LABEL_9;
          case 32774:
          case 32775:
            goto LABEL_10;
          case 32776:
            goto LABEL_24;
          default:
            return outputSizeForVariant(a1);
        }
    }
  }
  return result;
}

CGImageRef _createIcon(CGImage *a1, void *a2, double a3, double a4)
{
  void (**v7)(id, CGContext *, double, double, double, double);
  CGColorSpace *ColorSpace;
  CGColorSpace *DeviceRGB;
  uint32_t v10;
  size_t v11;
  CGContext *v12;
  CGContext *v13;
  CGImageRef Image;

  v7 = a2;
  ColorSpace = CGImageGetColorSpace(a1);
  if (ColorSpace && CGColorSpaceIsWideGamutRGB(ColorSpace))
  {
    DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
    v10 = 4353;
    v11 = 16;
  }
  else
  {
    v10 = 8194;
    v11 = 8;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  v12 = CGBitmapContextCreate(0, (unint64_t)a3, (unint64_t)a4, v11, 0, DeviceRGB, v10);
  if (v12)
  {
    v13 = v12;
    CGContextSetInterpolationQuality(v12, kCGInterpolationHigh);
    CGContextSetFillColorSpace(v13, DeviceRGB);
    CGColorSpaceRelease(DeviceRGB);
    v7[2](v7, v13, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), a3, a4);
    Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
  }
  else
  {
    CGColorSpaceRelease(DeviceRGB);
    Image = 0;
  }

  return Image;
}

CGImageRef createCGImageForURL(const __CFURL *a1, int a2)
{
  CGImageRef ImageAtIndex;
  CFErrorRef v5;
  void *v6;
  void *v7;
  const __CFDictionary *v8;
  CGImageSource *v9;
  CGImageSource *v10;
  CFErrorRef error;
  CFNumberRef propertyValueTypeRefPtr;
  void *values[3];
  const void *valuePtr[4];

  valuePtr[3] = *(const void **)MEMORY[0x24BDAC8D0];
  error = 0;
  propertyValueTypeRefPtr = 0;
  if (!CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x24BDBD6C0], &propertyValueTypeRefPtr, &error))
  {
    NSLog(CFSTR("Error getting file size for image at URL '%@': %@"), a1, error);
    v5 = error;
    if (!error)
      goto LABEL_7;
LABEL_6:
    CFRelease(v5);
    goto LABEL_7;
  }
  valuePtr[0] = 0;
  if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberLongLongType, valuePtr)
    && valuePtr[0] > (const void *)0xA00000)
  {
    return 0;
  }
  v5 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr)
    goto LABEL_6;
LABEL_7:
  v6 = (void *)*MEMORY[0x24BDBD270];
  v7 = (void *)*MEMORY[0x24BDBD268];
  valuePtr[0] = *(const void **)MEMORY[0x24BDD97D0];
  valuePtr[1] = CFSTR("kCGImageSourceSkipCRC");
  if (a2)
    v7 = v6;
  valuePtr[2] = *(const void **)MEMORY[0x24BDD97F0];
  values[0] = v7;
  values[1] = v7;
  values[2] = v6;
  v8 = CFDictionaryCreate(0, valuePtr, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v9 = CGImageSourceCreateWithURL(a1, v8);
  if (v9)
  {
    v10 = v9;
    if (CGImageSourceGetCount(v9))
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, v8);
    else
      ImageAtIndex = 0;
    CFRelease(v10);
  }
  else
  {
    ImageAtIndex = 0;
  }
  CFRelease(v8);
  return ImageAtIndex;
}

id _frameworkBundle()
{
  if (_frameworkBundle_onceToken != -1)
    dispatch_once(&_frameworkBundle_onceToken, &__block_literal_global_139);
  return (id)_frameworkBundle_frameworkBundle;
}

uint64_t _LICGImageCreateScaled(CGImage *a1, uint64_t a2, double a3)
{
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t CoreImageLanczosScaled;
  NSObject *v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (_LIDefaultLog_onceToken_0 != -1)
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
  v6 = os_signpost_id_generate((os_log_t)_LIDefaultLog_log_0);
  if (_LIDefaultLog_onceToken_0 != -1)
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
  v7 = (id)_LIDefaultLog_log_0;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v13 = 134217984;
    v14 = a2;
    _os_signpost_emit_with_name_impl(&dword_2067A1000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "_LICGImageCreateScaled", "method %lu", (uint8_t *)&v13, 0xCu);
  }

  if (!a2)
    _LICGImageCreateCoreImageLanczosScaled(a1, a3);
  CoreImageLanczosScaled = _LICGImageCreateCoreImageLanczosScaled(a1, a3);
  if (_LIDefaultLog_onceToken_0 != -1)
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
  v10 = (id)_LIDefaultLog_log_0;
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_2067A1000, v11, OS_SIGNPOST_INTERVAL_END, v6, "_LICGImageCreateScaled", (const char *)&unk_2067AEF9A, (uint8_t *)&v13, 2u);
  }

  return CoreImageLanczosScaled;
}

uint64_t _LICGImageCreateCoreImageLanczosScaled(CGImage *a1, double a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGColorSpace *ColorSpace;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 IsWideGamutRGB;
  CFStringRef *v23;
  CGColorSpaceRef v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int *v29;
  _BOOL4 v30;
  unsigned int *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x20BCFCCB0]();
  if (_LIDefaultLog_onceToken_0 != -1)
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
  v5 = _LIDefaultLog_log_0;
  if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG))
    _LICGImageCreateCoreImageLanczosScaled_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
  ColorSpace = CGImageGetColorSpace(a1);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB && CGColorSpaceGetModel(ColorSpace))
  {
    if (_LIDefaultLog_onceToken_0 != -1)
      dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
    v14 = _LIDefaultLog_log_0;
    if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG))
      _LICGImageCreateCoreImageLanczosScaled_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    IsWideGamutRGB = CGColorSpaceIsWideGamutRGB(ColorSpace);
    v23 = (CFStringRef *)MEMORY[0x24BDBF278];
    if (!IsWideGamutRGB)
      v23 = (CFStringRef *)MEMORY[0x24BDBF318];
    v24 = CGColorSpaceCreateWithName(*v23);
    ColorSpace = (CGColorSpace *)CFAutorelease(v24);
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCGImage:", a1);
  v38[0] = *MEMORY[0x24BDBF960];
  v38[1] = CFSTR("inputScale");
  v39[0] = v25;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:withInputParameters:", CFSTR("CILanczosScaleTransform"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (unsigned int *)MEMORY[0x24BDBF8B0];
  v30 = CGColorSpaceIsWideGamutRGB(ColorSpace);
  v31 = (unsigned int *)MEMORY[0x24BDBF8C0];
  if (!v30)
    v31 = v29;
  v32 = *v31;
  objc_msgSend(MEMORY[0x24BDBF648], "_MI_sharedIconCompositorContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "outputImage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "outputImage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "extent");
  v36 = objc_msgSend(v33, "createCGImage:fromRect:format:colorSpace:", v34, v32, ColorSpace);

  objc_autoreleasePoolPop(v4);
  return v36;
}

void ___frameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.mobileicons.framework"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_frameworkBundle_frameworkBundle;
  _frameworkBundle_frameworkBundle = v0;

}

uint64_t _LICGPathCreateContinuousRoundedRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8;
  double v9;
  CGPath *Mutable;
  double v11;
  double v12;
  int v13;
  int v14;
  double v15;
  int v16;
  int v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  int v23;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL4 v32;
  uint64_t v33;
  double v35;
  double x;
  double MinX;
  double v38;
  double MaxY;
  double v40;
  double MinY;
  double MaxX;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  if (a3 >= a4)
    v8 = a4;
  else
    v8 = a3;
  v9 = v8 * 0.225;
  Mutable = CGPathCreateMutable();
  v11 = v9 * 1.528665;
  v12 = v11 + v11;
  if (v11 + v11 >= a3)
    v13 = 1;
  else
    v13 = 3;
  if (v11 + v11 < a3)
    v14 = 3;
  else
    v14 = 2;
  v15 = a4 * 0.5;
  if (v12 < a4)
    v15 = v9 * 1.528665;
  v40 = v15;
  if (v12 < a4)
    v16 = v13;
  else
    v16 = v13 & 2;
  if (v12 < a4)
    v17 = v14;
  else
    v17 = v14 & 1;
  v43.origin.x = a1;
  v43.origin.y = a2;
  v43.size.width = a3;
  v43.size.height = a4;
  MinX = CGRectGetMinX(v43);
  v44.origin.x = a1;
  v44.origin.y = a2;
  v44.size.width = a3;
  v44.size.height = a4;
  MinY = CGRectGetMinY(v44);
  v45.origin.x = a1;
  v45.origin.y = a2;
  v45.size.width = a3;
  v45.size.height = a4;
  MaxX = CGRectGetMaxX(v45);
  v46.origin.x = a1;
  v46.origin.y = a2;
  v46.size.width = a3;
  v46.size.height = a4;
  v38 = CGRectGetMinY(v46);
  v47.origin.x = a1;
  v47.origin.y = a2;
  v47.size.width = a3;
  v47.size.height = a4;
  v18 = CGRectGetMinX(v47);
  v48.origin.x = a1;
  v48.origin.y = a2;
  v48.size.width = a3;
  v48.size.height = a4;
  MaxY = CGRectGetMaxY(v48);
  v49.origin.x = a1;
  v49.origin.y = a2;
  v49.size.width = a3;
  v49.size.height = a4;
  v19 = CGRectGetMaxX(v49);
  v50.origin.x = a1;
  v50.origin.y = a2;
  v50.size.width = a3;
  v50.size.height = a4;
  v20 = CGRectGetMaxY(v50);
  v21 = v12 < a3;
  if (v12 < a3)
    v22 = v11;
  else
    v22 = a3 * 0.5;
  v23 = v17 | v16;
  if (v21 || v23 == 0)
  {
    v35 = v18;
    x = v19;
    v25 = v12 < a4 || v23 == 0;
    v28 = v40;
    v27 = MinY;
    v26 = MinX;
    v30 = v38;
    v29 = MaxY;
    if (!v25)
    {
      v27 = MinY + v40 * 0.05;
      v30 = v38 + v40 * 0.05;
      v29 = MaxY - v40 * 0.05;
      v20 = v20 - v40 * 0.05;
    }
  }
  else
  {
    v26 = MinX + v22 * 0.05;
    v27 = MinY;
    MaxX = MaxX - v22 * 0.05;
    v35 = v18 + v22 * 0.05;
    x = v19 - v22 * 0.05;
    v29 = MaxY;
    v28 = v40;
    v30 = v38;
  }
  CGPathMoveToPoint(Mutable, 0, v22 + v26, v27);
  CGPathAddLineToPoint(Mutable, 0, MaxX - v22, v30);
  if (v22 == *MEMORY[0x24BDBF148] && v28 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    CGPathAddLineToPoint(Mutable, 0, x, v20 - v28);
    CGPathAddLineToPoint(Mutable, 0, v22 + v35, v29);
    CGPathAddLineToPoint(Mutable, 0, v26, v28 + v27);
  }
  else
  {
    v32 = v23 == 0;
    _addContinuousCornerToPath(Mutable, 2, v17, v32, MaxX, v30, v22, v28);
    CGPathAddLineToPoint(Mutable, 0, x, v20 - v28);
    _addContinuousCornerToPath(Mutable, 8, v16, v32, x, v20, v22, v28);
    CGPathAddLineToPoint(Mutable, 0, v22 + v35, v29);
    _addContinuousCornerToPath(Mutable, 4, v17, v32, v35, v29, v22, v28);
    CGPathAddLineToPoint(Mutable, 0, v26, v28 + v27);
    _addContinuousCornerToPath(Mutable, 1, v16, v32, v26, v27, v22, v28);
  }
  CGPathAddLineToPoint(Mutable, 0, v22 + v26, v27);
  v33 = MEMORY[0x20BCFCA4C](Mutable);
  CFRelease(Mutable);
  return v33;
}

double composedImageBoundsForVariant(int a1)
{
  CGFloat v1;
  double result;
  CGRect v3;

  v3.size.width = outputSizeForVariant(a1);
  v3.size.height = v1;
  v3.origin.x = 0.0;
  v3.origin.y = 0.0;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v3, *MEMORY[0x24BDBF148], *(CGFloat *)(MEMORY[0x24BDBF148] + 8));
  return result;
}

CGImage *LICopyBestImageForVariantFromBundle(__CFBundle *a1, unsigned int a2)
{
  __CFDictionary *v4;
  __CFDictionary *v5;
  const void *Value;
  const void *v7;
  const __CFArray *Mutable;
  CGImage *v9;
  __CFArray *v10;
  __CFArray *v11;
  const __CFArray *v12;
  const __CFDictionary *InfoDictionary;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  CFTypeID v17;
  char v18;

  if (!a1)
    return 0;
  v4 = copyIconsDictionaryForBundle(a1);
  if (v4)
  {
    v5 = v4;
    Value = CFDictionaryGetValue(v4, CFSTR("CFBundlePrimaryIcon"));
    if (Value)
    {
      v7 = Value;
      CFRetain(Value);
      Mutable = copyIconFilesForStyleDictionary(v7, 0);
      CFRelease(v7);
      CFRelease(v5);
      if (Mutable)
        goto LABEL_9;
    }
    else
    {
      CFRelease(v5);
    }
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
LABEL_9:
  v10 = _LICopyIconURLsForBundleWithFiles(a1, Mutable, a2, 1);
  v11 = copyImagesForIconURLsFilteringForVariant(v10, 1, a2);
  if (v11)
  {
    v12 = v11;
    InfoDictionary = CFBundleGetInfoDictionary(a1);
    v14 = InfoDictionary;
    if (InfoDictionary)
    {
      v15 = (const __CFDictionary *)CFDictionaryGetValue(InfoDictionary, CFSTR("CFBundleIcons"));
      if (v15)
      {
        v16 = v15;
        v17 = CFGetTypeID(v15);
        if (v17 == CFDictionaryGetTypeID())
        {
          if (CFDictionaryContainsKey(v16, CFSTR("CFBundlePrimaryIcon")))
            v14 = (const __CFDictionary *)CFDictionaryGetValue(v16, CFSTR("CFBundlePrimaryIcon"));
          else
            v14 = v16;
        }
      }
    }
    v18 = iconOptionsForBundleWithStyleDictionary(a1, v14);
    if (_bundleIsAppleInternal(a1))
      _bundleIsRightToLeft(a1);
    v9 = LICopyBestImageForVariantFromImages(v12, a2, v18);
    CFRelease(v12);
    if (!v10)
      goto LABEL_22;
    goto LABEL_21;
  }
  v9 = 0;
  if (v10)
LABEL_21:
    CFRelease(v10);
LABEL_22:
  if (Mutable)
    CFRelease(Mutable);
  return v9;
}

__CFArray *_LICopyIconURLsForBundleWithFiles(__CFBundle *a1, const __CFArray *a2, unsigned int a3, int a4)
{
  __CFArray *Mutable;
  CFStringRef Identifier;
  const __CFLocale *v10;
  const __CFLocale *v11;
  const __CFBoolean *Value;
  const __CFString *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const __CFURL *URLForPrefixes;
  const __CFURL *v18;
  const __CFURL *v20;
  const __CFURL *v21;
  CFURLRef v22;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (a1
    && (Identifier = CFBundleGetIdentifier(a1)) != 0
    && CFEqual(Identifier, CFSTR("com.apple.weather"))
    && (v10 = CFLocaleCopyCurrent()) != 0)
  {
    v11 = v10;
    Value = (const __CFBoolean *)CFLocaleGetValue(v10, (CFLocaleKey)*MEMORY[0x24BDBD428]);
    if (Value)
    {
      if (CFBooleanGetValue(Value))
        v13 = CFSTR("Celsius");
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    v13 = 0;
  }
  v14 = 57;
  switch(a3)
  {
    case 0u:
    case 0xFu:
    case 0x20u:
      goto LABEL_25;
    case 1u:
    case 7u:
    case 8u:
    case 0x18u:
    case 0x1Cu:
    case 0x1Du:
    case 0x3Fu:
      goto LABEL_11;
    case 2u:
    case 4u:
    case 0x10u:
    case 0x11u:
    case 0x21u:
    case 0x22u:
      v14 = 29;
      goto LABEL_25;
    case 3u:
    case 0x19u:
      v14 = 50;
      goto LABEL_25;
    case 5u:
    case 6u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Eu:
    case 0x1Fu:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
      goto LABEL_22;
    case 0x16u:
    case 0x17u:
    case 0x23u:
      v14 = 20;
      goto LABEL_25;
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x4Fu:
    case 0x50u:
      goto LABEL_14;
    case 0x47u:
      v14 = 67;
      goto LABEL_25;
    case 0x48u:
      v14 = 74;
      goto LABEL_25;
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
      v14 = 32;
      goto LABEL_25;
    case 0x4Cu:
    case 0x4Du:
    case 0x4Eu:
      v14 = 27;
      goto LABEL_25;
    default:
      if (a3 - 32774 >= 2)
      {
        if (a3 == 32776)
LABEL_11:
          v14 = 72;
        else
LABEL_22:
          v14 = 0;
      }
      else
      {
LABEL_14:
        v14 = 60;
      }
LABEL_25:
      scaleForVariant();
      v16 = v15;
      if (a2)
      {
        if (CFArrayGetCount(a2) >= 1)
        {
          gatherURLsForBundleWithFiles(a1, a2, v14, v16, Mutable);
          if (!CFArrayGetCount(Mutable) && (_DWORD)v16 == 3)
            gatherURLsForBundleWithFiles(a1, a2, v14, 2, Mutable);
        }
      }
      if (a4)
      {
        if (a3 <= 0x23 && ((1 << a3) & 0xE02C3001CLL) != 0)
        {
          URLForPrefixes = createURLForPrefixes((uint64_t *)off_24BFDA450, a1, (uint64_t)v13, v14, v16);
          if (URLForPrefixes)
          {
            v18 = URLForPrefixes;
            CFArrayAppendValue(Mutable, URLForPrefixes);
            CFRelease(v18);
          }
        }
        if (!CFArrayGetCount(Mutable))
        {
          v20 = createURLForPrefixes((uint64_t *)off_24BFDA468, a1, (uint64_t)v13, v14, v16);
          if (v20)
          {
            v21 = v20;
            v22 = CFBundleCopyBundleURL(a1);
            if (_LIIsURLContainedInDirectory((uint64_t)v21, (uint64_t)v22))
              CFArrayAppendValue(Mutable, v21);
            CFRelease(v21);
            if (v22)
              CFRelease(v22);
          }
        }
      }
      return Mutable;
  }
}

__CFArray *_LICopyImagesForIconURLsFilteringForVariant(void *a1, int a2)
{
  return copyImagesForIconURLsFilteringForVariant(a1, 1, a2);
}

CGImage *LICreateDeviceAppropriateHomeScreenIconImageFromBundle(__CFBundle *a1)
{
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  unsigned int v10;
  float v11;
  __CFDictionary *v12;
  CFTypeRef v13;
  CGImage *v14;
  CGImage *v15;

  v2 = MGGetBoolAnswer();
  v3 = MGGetBoolAnswer();
  v4 = MGGetBoolAnswer();
  v5 = MGGetSInt32Answer();
  v6 = v5;
  if (v3)
  {
    if (v2)
      v7 = 24;
    else
      v7 = 1;
    if (v5 == 14 || v5 == 11 || v5 == 20)
      v10 = 63;
    else
      v10 = v7;
  }
  else
  {
    MGGetFloat32Answer();
    if (v11 == 3.0)
    {
      v10 = 32;
    }
    else if (v6 == 18)
    {
      v10 = 80;
    }
    else if (v6 == 19)
    {
      v10 = 79;
    }
    else if (v2)
    {
      v10 = 15;
    }
    else
    {
      v10 = 0;
    }
  }
  v12 = copyIconsDictionaryForBundle(a1);
  v13 = copyPrimaryIconName((uint64_t)a1, v12);
  if (v13)
    v14 = LICreateIconForBundleAndDisplayGamut(a1, v10, v4);
  else
    v14 = LICopyBestImageForVariantFromBundle(a1, v10);
  v15 = v14;
  if (v12)
    CFRelease(v12);
  if (v13)
    CFRelease(v13);
  return v15;
}

__CFDictionary *copyIconsDictionaryForBundle(__CFBundle *a1)
{
  const __CFDictionary *InfoDictionary;
  const __CFDictionary *v2;
  const void *Value;
  const void *v4;
  CFTypeID v5;
  const void *v7;
  const void *v8;
  CFTypeID v9;
  CFArrayRef v10;
  CFArrayRef v11;
  const CFDictionaryKeyCallBacks *v12;
  const CFDictionaryValueCallBacks *v13;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v15;
  __CFDictionary *v16;
  const __CFString *v17;
  void *values;

  if (!a1)
    return 0;
  InfoDictionary = CFBundleGetInfoDictionary(a1);
  if (!InfoDictionary)
    return 0;
  v2 = InfoDictionary;
  Value = CFDictionaryGetValue(InfoDictionary, CFSTR("CFBundleIcons"));
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFDictionaryGetTypeID())
      return (__CFDictionary *)CFRetain(v4);
  }
  v7 = CFDictionaryGetValue(v2, CFSTR("CFBundleIconFiles"));
  if (v7 && (v8 = v7, v9 = CFGetTypeID(v7), v9 == CFArrayGetTypeID()))
  {
    v10 = (CFArrayRef)CFRetain(v8);
  }
  else
  {
    values = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x24BDBD1D8]);
    v10 = values
        ? CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690])
        : CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  }
  v11 = v10;
  if (!v10)
    return 0;
  v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v15 = CFDictionaryCreateMutable(0, 0, v12, v13);
  if (v15)
  {
    v16 = v15;
    CFDictionarySetValue(Mutable, CFSTR("CFBundlePrimaryIcon"), v15);
    CFDictionarySetValue(v16, CFSTR("CFBundleIconFiles"), v11);
    v17 = (const __CFString *)CFDictionaryGetValue(v2, CFSTR("UIPrerenderedIcon"));
    if (isPropertyListBooleanTrue(v17))
      CFDictionarySetValue(v16, CFSTR("UIPrerenderedIcon"), (const void *)*MEMORY[0x24BDBD270]);
    CFRelease(v16);
  }
  CFRelease(v11);
  return Mutable;
}

CFTypeRef copyPrimaryIconName(uint64_t a1, CFDictionaryRef theDict)
{
  CFTypeRef v2;
  const void *Value;
  const void *v4;
  CFTypeID v5;
  const void *v6;

  v2 = 0;
  if (a1 && theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("CFBundlePrimaryIcon"));
    if (Value)
    {
      v4 = Value;
      CFRetain(Value);
      v5 = CFGetTypeID(v4);
      if (v5 == CFStringGetTypeID())
      {
        v6 = v4;
      }
      else
      {
        if (!CFDictionaryContainsKey((CFDictionaryRef)v4, CFSTR("CFBundleIconName")))
        {
          v2 = 0;
          goto LABEL_10;
        }
        v6 = CFDictionaryGetValue((CFDictionaryRef)v4, CFSTR("CFBundleIconName"));
      }
      v2 = CFRetain(v6);
LABEL_10:
      CFRelease(v4);
      return v2;
    }
    return 0;
  }
  return v2;
}

CGImage *LICreateIconForBundleAndDisplayGamut(__CFBundle *a1, unsigned int a2, uint64_t a3)
{
  __CFDictionary *v6;
  __CFDictionary *v7;
  CFTypeRef v8;
  uint64_t v9;
  uint64_t v10;
  CGImage *v11;
  _BOOL4 v13;

  v6 = copyIconsDictionaryForBundle(a1);
  if (v6)
  {
    v7 = v6;
    v8 = copyPrimaryIconName((uint64_t)a1, v6);
    v10 = _bundleIsAppleInternal(a1) ? _bundleIsRightToLeft(a1) << 19 : 0;
    if (v8)
    {
      v11 = _LICreateIconForBundleWithIconNameAndDisplayGamut(a1, (uint64_t)v8, a2, a3, v10);
      CFRelease(v8);
    }
    else
    {
      v11 = _LICreateIconForBundleWithIconsDictionaryAndContainers(a1, v7, 0, v9, v10, a2, v10);
    }
    CFRelease(v7);
    if (v11)
      return v11;
  }
  v13 = isAppClipBundle(a1);
  return createDefaultIconWithOptions(a2, 0, v13);
}

CGImage *LICreateIconForBundle(__CFBundle *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;

  if (_bundleIsAppleInternal(a1))
    v7 = _bundleIsRightToLeft(a1) << 19;
  else
    v7 = 0;
  return _LICreateIconForBundleWithIconsDictionaryAndContainers(a1, 0, 0, v5, v6, a3, v7);
}

uint64_t _bundleIsAppleInternal(__CFBundle *a1)
{
  const __CFString *Identifier;

  if (a1 && (Identifier = CFBundleGetIdentifier(a1)) != 0)
    return CFStringHasPrefix(Identifier, CFSTR("com.apple."));
  else
    return 0;
}

BOOL _bundleIsRightToLeft(__CFBundle *a1)
{
  const __CFArray *v1;
  const __CFArray *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  const __CFString *ValueAtIndex;
  _BOOL8 v7;
  _BOOL8 v8;

  v1 = CFBundleCopyBundleLocalizations(a1);
  v2 = CFLocaleCopyPreferredLanguages();
  v3 = v2;
  if (v1 && v2)
  {
    v4 = CFBundleCopyLocalizationsForPreferences(v1, v2);
    if (v4)
    {
      v5 = v4;
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, 0);
      if (ValueAtIndex)
        v7 = CFLocaleGetLanguageCharacterDirection(ValueAtIndex) == kCFLocaleLanguageDirectionRightToLeft;
      else
        v7 = 0;
      CFRelease(v5);
    }
    else
    {
      v7 = 0;
    }
LABEL_13:
    CFRelease(v1);
    v8 = v7;
    if (!v3)
      return v8;
    goto LABEL_8;
  }
  v7 = 0;
  v8 = 0;
  if (v1)
    goto LABEL_13;
  if (v2)
LABEL_8:
    CFRelease(v3);
  return v8;
}

CGImage *_LICreateIconForBundleWithIconsDictionaryAndContainers(__CFBundle *a1, __CFDictionary *cf, const __CFString *a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  __CFDictionary *v11;
  _BOOL4 v12;
  const __CFDictionary *Value;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFString *v16;
  CGImage *v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  const __CFArray *v20;
  __CFArray *v21;
  __CFArray *v22;
  __CFArray *v23;
  char v24;
  _BOOL4 v25;

  if (cf)
  {
    v11 = cf;
    CFRetain(cf);
    if (a3)
      goto LABEL_3;
LABEL_11:
    v12 = 1;
    if (v11)
      goto LABEL_4;
LABEL_12:
    v17 = 0;
    goto LABEL_28;
  }
  v11 = copyIconsDictionaryForBundle(a1);
  if (!a3)
    goto LABEL_11;
LABEL_3:
  v12 = CFStringCompare(CFSTR("CFBundlePrimaryIcon"), a3, 0) == kCFCompareEqualTo;
  if (!v11)
    goto LABEL_12;
LABEL_4:
  if (!a3 || v12)
  {
    v16 = CFSTR("CFBundlePrimaryIcon");
    v15 = v11;
  }
  else
  {
    if (!CFDictionaryContainsKey(v11, CFSTR("CFBundleAlternateIcons")))
      goto LABEL_18;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v11, CFSTR("CFBundleAlternateIcons"));
    if (!Value)
      goto LABEL_18;
    v14 = Value;
    if (!CFDictionaryContainsKey(Value, a3))
      goto LABEL_18;
    v15 = v14;
    v16 = a3;
  }
  v18 = (const __CFDictionary *)CFDictionaryGetValue(v15, v16);
  v19 = v18;
  if (v18)
  {
    CFRetain(v18);
    a7 |= iconOptionsForBundleWithStyleDictionary(a1, v19);
    if (a1)
    {
      v20 = copyIconFilesForStyleDictionary(v19, a7);
      v21 = _LICopyIconURLsForBundleWithFiles(a1, v20, a6, v12);
      if (v20)
        CFRelease(v20);
    }
    else
    {
      v21 = 0;
    }
    CFRelease(v19);
    if (!v21)
      goto LABEL_26;
LABEL_20:
    v22 = copyImagesForIconURLsFilteringForVariant(v21, 1, a6);
    if (v22)
    {
      v23 = v22;
      v17 = LICreateIconForImages(v22, a6, a7);
      CFRelease(v23);
    }
    else
    {
      v17 = 0;
    }
    CFRelease(v21);
    goto LABEL_27;
  }
LABEL_18:
  if (a1)
  {
    v21 = _LICopyIconURLsForBundleWithFiles(a1, 0, a6, 1);
    if (v21)
      goto LABEL_20;
  }
LABEL_26:
  v17 = 0;
LABEL_27:
  CFRelease(v11);
LABEL_28:
  v24 = !v12;
  if (v17)
    v24 = 1;
  if ((v24 & 1) != 0)
    return v17;
  v25 = isAppClipBundle(a1);
  return createDefaultIconWithOptions(a6, a7, v25);
}

unint64_t iconOptionsForBundleWithStyleDictionary(CFBundleRef bundle, const __CFDictionary *cf)
{
  unint64_t v2;
  CFTypeID v4;
  const __CFString *Value;
  _BOOL4 v6;
  const __CFString *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  const __CFURL *v10;
  CFStringRef v11;
  CFStringRef v12;
  const __CFString *v13;
  int v14;
  stat v16;
  char v17[1026];
  char buffer[1026];
  uint64_t v19;

  v2 = (unint64_t)cf;
  v19 = *MEMORY[0x24BDAC8D0];
  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 != CFDictionaryGetTypeID())
    {
      v2 = 0;
      if (!bundle)
        return v2;
      goto LABEL_9;
    }
    Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("UIPrerenderedIcon"));
    v6 = isPropertyListBooleanTrue(Value) != 0;
    v7 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("UIPrecomposedIcon"));
    if (isPropertyListBooleanTrue(v7))
      v2 = (2 * v6) | 0x10u;
    else
      v2 = (2 * v6);
  }
  if (!bundle)
    return v2;
LABEL_9:
  v8 = CFBundleCopyBundleURL(bundle);
  if (v8)
  {
    v9 = v8;
    v10 = CFURLCopyAbsoluteURL(v8);
    v11 = CFURLCopyFileSystemPath(v10, kCFURLPOSIXPathStyle);
    CFRelease(v10);
    if (v11)
    {
      if (CFStringGetCString(v11, buffer, 1026, 0x8000100u))
      {
        memset(&v16, 0, sizeof(v16));
        if (!lstat(buffer, &v16) && (v16.st_mode & 0xF000) == 0xA000)
        {
          bzero(v17, 0x402uLL);
          if (readlink(buffer, v17, 0x402uLL) >= 1)
          {
            v12 = CFStringCreateWithFileSystemRepresentation(0, v17);
            if (v12)
            {
              v13 = v12;
              CFRelease(v11);
              v11 = v13;
            }
          }
        }
      }
      if (isFilePathContainedInPath(v11, CFSTR("Applications")))
      {
        CFRelease(v11);
LABEL_20:
        v2 = v2 | 4;
LABEL_22:
        CFRelease(v9);
        return v2;
      }
      v14 = isFilePathContainedInPath(v11, CFSTR("System"));
      CFRelease(v11);
      if (v14)
        goto LABEL_20;
    }
    v2 &= 0xBu;
    goto LABEL_22;
  }
  return v2;
}

CFMutableArrayRef copyIconFilesForStyleDictionary(const void *a1, int a2)
{
  CFTypeID v4;
  const void *Value;
  CFTypeID v6;
  CFMutableArrayRef result;

  v4 = CFGetTypeID(a1);
  if (v4 != CFDictionaryGetTypeID())
    return CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if ((a2 & 0x80000) == 0
    || (Value = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("CFBundleIconFilesRightToLeft"))) == 0)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("CFBundleIconFiles"));
    if (!Value)
      return CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  }
  v6 = CFGetTypeID(Value);
  if (v6 != CFArrayGetTypeID())
    return CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  result = (CFMutableArrayRef)CFRetain(Value);
  if (!result)
    return CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  return result;
}

CGImage *createDefaultIconWithOptions(unsigned int a1, unsigned int a2, int a3)
{
  __CFArray *v5;
  CGImage *v6;
  __CFArray *v7;
  unsigned int v8;
  unsigned int v9;

  if (a3)
  {
    v5 = _copyAppClipDefaultIconImages();
    if (!v5)
    {
LABEL_17:
      v6 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    switch(a1)
    {
      case 0u:
      case 1u:
      case 2u:
      case 3u:
      case 4u:
      case 0xFu:
      case 0x10u:
      case 0x11u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x28u:
      case 0x29u:
      case 0x2Du:
      case 0x2Eu:
      case 0x33u:
      case 0x34u:
      case 0x35u:
      case 0x36u:
      case 0x3Fu:
      case 0x40u:
      case 0x41u:
      case 0x42u:
      case 0x43u:
      case 0x4Fu:
      case 0x50u:
        goto LABEL_5;
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x24u:
      case 0x25u:
      case 0x37u:
      case 0x38u:
      case 0x39u:
      case 0x3Au:
      case 0x3Bu:
      case 0x3Cu:
      case 0x3Du:
      case 0x3Eu:
        v6 = LICreateIconForImages(0, a1, a2);
        goto LABEL_18;
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
        v5 = _copyDefaultIconImages();
        if (!v5)
          goto LABEL_17;
        goto LABEL_16;
      case 0x26u:
      case 0x27u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x32u:
        goto LABEL_12;
      case 0x44u:
      case 0x45u:
      case 0x46u:
      case 0x47u:
      case 0x48u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
      case 0x4Cu:
      case 0x4Du:
      case 0x4Eu:
        v5 = _copyMessagesDefaultIconImages();
        if (!v5)
          goto LABEL_17;
LABEL_16:
        v7 = v5;
        v9 = a2 | 2;
        v8 = a1;
        goto LABEL_14;
      default:
        if (a1 - 0x8000 > 8)
          goto LABEL_17;
        if (((1 << a1) & 0x1D5) != 0)
        {
LABEL_5:
          v5 = _copyDefaultIconImages();
          if (v5)
            break;
          goto LABEL_17;
        }
LABEL_12:
        v5 = _copyNanoDefaultIconImages();
        if (!v5)
          goto LABEL_17;
        break;
    }
  }
  v7 = v5;
  v8 = a1;
  v9 = a2;
LABEL_14:
  v6 = LICreateIconForImages(v5, v8, v9);
  CFRelease(v7);
LABEL_18:
  CGImageSetProperty();
  return v6;
}

BOOL isAppClipBundle(__CFBundle *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (!a1)
    return 0;
  CFBundleGetIdentifier(a1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (!v1)
    return 0;
  v2 = (void *)v1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v1, 1, 0);
  objc_msgSend(v3, "appClipMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

CGImage *_LICreateIconForBundleWithIconNameAndDisplayGamut(CFBundleRef bundle, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  CFURLRef v10;
  CFURLRef v11;
  void *v12;
  CGImage *v13;
  BOOL v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  const __CFArray *v25;
  _BOOL4 v26;
  uint64_t v28;
  CGAffineTransform v29;
  uint64_t v30;

  if (!bundle)
    goto LABEL_28;
  v10 = CFBundleCopyResourceURL(bundle, CFSTR("Assets"), CFSTR("car"), 0);
  if (!v10)
    goto LABEL_28;
  v11 = v10;
  v30 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C28]), "initWithURL:error:", v10, &v30);
  v13 = 0;
  if (v12)
    v14 = v30 == 0;
  else
    v14 = 0;
  if (v14)
  {
    if ((a5 & 0x80000) != 0)
      v15 = 4;
    else
      v15 = 5;
    scaleForVariant();
    v17 = v16;
    v18 = 1;
    switch(a3)
    {
      case 0x11u:
      case 0x17u:
      case 0x38u:
      case 0x3Bu:
      case 0x3Du:
      case 0x41u:
      case 0x4Fu:
        if (MGGetBoolAnswer())
          v18 = 2;
        else
          v18 = 1;
        goto LABEL_20;
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x16u:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
      case 0x37u:
      case 0x39u:
      case 0x3Au:
      case 0x3Cu:
      case 0x3Eu:
      case 0x40u:
      case 0x42u:
      case 0x43u:
      case 0x44u:
      case 0x45u:
      case 0x46u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
      case 0x4Cu:
      case 0x4Du:
      case 0x4Eu:
        goto LABEL_20;
      case 0x18u:
      case 0x19u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x3Fu:
      case 0x47u:
      case 0x48u:
        goto LABEL_19;
      case 0x1Eu:
      case 0x1Fu:
      case 0x35u:
      case 0x36u:
        v18 = 4;
        goto LABEL_20;
      case 0x26u:
      case 0x27u:
      case 0x28u:
      case 0x29u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Du:
      case 0x2Eu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x32u:
      case 0x33u:
      case 0x34u:
        goto LABEL_16;
      default:
        if (a3 - 0x8000 >= 6)
        {
          if (a3 - 32774 < 3)
LABEL_19:
            v18 = 2;
        }
        else
        {
LABEL_16:
          v18 = 5;
        }
LABEL_20:
        if (cuiDeviceSubtypeForVariant_onceToken != -1)
          dispatch_once(&cuiDeviceSubtypeForVariant_onceToken, &__block_literal_global_154);
        v19 = cuiDeviceSubtypeForVariant_subtype;
        v20 = expectedInputSizeForVariant(a3, a5);
        v22 = v21;
        CGAffineTransformMakeScale(&v29, 1.0 / v17, 1.0 / v17);
        objc_msgSend(v12, "_LI_iconImageWithName:size:scale:idiom:subtype:gamut:layoutDirection:", a2, v18, v19, a4, v15, v22 * v29.c + v29.a * v20, v22 * v29.d + v29.b * v20, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23 && (v28 = objc_msgSend(v23, "image")) != 0)
        {
          v25 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&v28, 1, MEMORY[0x24BDBD690]);
          v13 = LICreateIconForImages(v25, a3, a5);
          CFRelease(v25);
        }
        else
        {
          v13 = 0;
        }

        break;
    }
  }

  CFRelease(v11);
  if (!v13)
  {
LABEL_28:
    v26 = isAppClipBundle(bundle);
    return createDefaultIconWithOptions(a3, a5, v26);
  }
  return v13;
}

__CFArray *copyImagesForIconURLsFilteringForVariant(void *a1, uint64_t a2, int a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __CFArray *Mutable;
  uint64_t v13;
  uint64_t v14;
  const __CFURL *v15;
  CGImage *CGImageForURL;
  CGImage *v17;
  double Width;
  double Height;
  uint64_t v21;
  __CFArray *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _OWORD v41[7];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = expectedInputSizeForVariant(a3, 0);
  if (!a1)
    return 0;
  v7 = v5;
  v8 = v6;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = a1;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v11 = v10;
    Mutable = 0;
    v13 = *(_QWORD *)v37;
    do
    {
      v14 = 0;
      v35 = v11;
      do
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v9);
        v15 = *(const __CFURL **)(*((_QWORD *)&v36 + 1) + 8 * v14);
        CGImageForURL = createCGImageForURL(v15, 0);
        if (CGImageForURL)
        {
          v17 = CGImageForURL;
          if ((_DWORD)a2)
          {
            Width = (double)CGImageGetWidth(CGImageForURL);
            Height = (double)CGImageGetHeight(v17);
            if (v7 >= Width || v8 >= Height)
              goto LABEL_15;
            v21 = v13;
            v22 = Mutable;
            v23 = a2;
            v24 = v9;
            v25 = MEMORY[0x20BCFCCB0]();
            -[__CFURL absoluteString](v15, "absoluteString");
            v26 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v26, "lastPathComponent");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            LOBYTE(v26) = objc_msgSend(v27, "hasPrefix:", CFSTR("Default"));
            v28 = (void *)v25;
            v9 = v24;
            a2 = v23;
            Mutable = v22;
            v13 = v21;
            v11 = v35;
            objc_autoreleasePoolPop(v28);
            if ((v26 & 1) == 0)
            {
LABEL_15:
              v29 = 0;
              v41[0] = xmmword_2067ADDD0;
              v41[1] = xmmword_2067ADDE0;
              v41[2] = xmmword_2067ADDF0;
              v41[3] = xmmword_2067ADE00;
              v41[4] = xmmword_2067ADE10;
              v41[5] = xmmword_2067ADE20;
              v41[6] = xmmword_2067ADE30;
              while (1)
              {
                v30 = *(double *)&v41[v29];
                v31 = *((double *)&v41[v29] + 1);
                if (v30 == Width && v31 == Height)
                  break;
                if (v31 == Width && v30 == Height)
                  break;
                if (++v29 == 7)
                  goto LABEL_25;
              }
            }
          }
          else
          {
LABEL_25:
            if (!Mutable)
              Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
            CFArrayAppendValue(Mutable, v17);
          }
          CGImageRelease(v17);
        }
        ++v14;
      }
      while (v14 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v11);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

__CFArray *_LICopyImagesForIconURLs(void *a1)
{
  return copyImagesForIconURLsFilteringForVariant(a1, 0, -1);
}

void gatherURLsForBundleWithFiles(__CFBundle *a1, const __CFArray *a2, uint64_t a3, uint64_t a4, __CFArray *a5)
{
  CFURLRef v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFString *v15;
  CFTypeID v16;
  int v17;
  BOOL v18;
  const __CFURL *URLForFormatInBundle;

  if (a5)
  {
    v10 = CFBundleCopyBundleURL(a1);
    Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      v12 = Count;
      for (i = 0; i != v12; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, i);
        if (ValueAtIndex)
        {
          v15 = ValueAtIndex;
          v16 = CFGetTypeID(ValueAtIndex);
          if (v16 == CFStringGetTypeID() && CFStringGetLength(v15) >= 1)
          {
            v17 = a4;
            do
            {
              v18 = v17 == 3;
              v17 = 2;
            }
            while (v18);
            URLForFormatInBundle = createURLForFormatInBundle(a1, CFSTR("%@"), v15, 0);
            if (URLForFormatInBundle
              || (URLForFormatInBundle = createURLForImageInBundleWithSizeIfExists(a1, (uint64_t)v15, (uint64_t)CFSTR("png"), a3, a4)) != 0)
            {
              if (_LIIsURLContainedInDirectory((uint64_t)URLForFormatInBundle, (uint64_t)v10))
                CFArrayAppendValue(a5, URLForFormatInBundle);
              CFRelease(URLForFormatInBundle);
            }
          }
        }
      }
    }
    if (v10)
      CFRelease(v10);
  }
}

const __CFURL *createURLForPrefixes(uint64_t *a1, __CFBundle *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t *v10;
  CFStringRef v11;
  const __CFURL *URLForImageInBundleWithSizeIfExists;
  const __CFURL *v13;
  uint64_t v14;
  BOOL v15;

  v6 = *a1;
  if (!*a1)
    return 0;
  v10 = a1 + 1;
  do
  {
    if (a3)
    {
      v11 = CFStringCreateWithFormat(0, 0, CFSTR("%@-%@"), v6, a3);
      URLForImageInBundleWithSizeIfExists = createURLForImageInBundleWithSizeIfExists(a2, (uint64_t)v11, (uint64_t)CFSTR("png"), a4, a5);
      CFRelease(v11);
      if (URLForImageInBundleWithSizeIfExists)
        return URLForImageInBundleWithSizeIfExists;
      v6 = *(v10 - 1);
    }
    v13 = createURLForImageInBundleWithSizeIfExists(a2, v6, (uint64_t)CFSTR("png"), a4, a5);
    v14 = *v10++;
    v6 = v14;
    if (v14)
      v15 = v13 == 0;
    else
      v15 = 0;
  }
  while (v15);
  return v13;
}

uint64_t _LIIsURLContainedInDirectory(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v8;

  v8 = 0;
  if (!a2)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v8, a2, a1, 0);
  if (v8)
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

uint64_t _copyDefaultIconURLs(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _frameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLsForResourcesWithExtension:subdirectory:", CFSTR("png"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "absoluteString", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "hasPrefix:", v1))
          objc_msgSend(v2, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v2, "copy");
  return v13;
}

__CFArray *_copyDefaultIconImages()
{
  if (_copyDefaultIconImages_onceToken != -1)
    dispatch_once(&_copyDefaultIconImages_onceToken, &__block_literal_global);
  return copyImagesForIconURLsFilteringForVariant((void *)_copyDefaultIconImages___DefaultImageURLs, 0, -1);
}

uint64_t ___copyDefaultIconImages_block_invoke()
{
  uint64_t result;

  result = _copyDefaultIconURLs(CFSTR("DefaultIcon"));
  _copyDefaultIconImages___DefaultImageURLs = result;
  return result;
}

__CFArray *_copyNanoDefaultIconImages()
{
  if (_copyNanoDefaultIconImages_onceToken != -1)
    dispatch_once(&_copyNanoDefaultIconImages_onceToken, &__block_literal_global_35);
  return copyImagesForIconURLsFilteringForVariant((void *)_copyNanoDefaultIconImages___DefaultImageURLs, 0, -1);
}

uint64_t ___copyNanoDefaultIconImages_block_invoke()
{
  uint64_t result;

  result = _copyDefaultIconURLs(CFSTR("NanoDefaultIcon"));
  _copyNanoDefaultIconImages___DefaultImageURLs = result;
  return result;
}

__CFArray *_copyMessagesDefaultIconImages()
{
  if (_copyMessagesDefaultIconImages_onceToken != -1)
    dispatch_once(&_copyMessagesDefaultIconImages_onceToken, &__block_literal_global_38);
  return copyImagesForIconURLsFilteringForVariant((void *)_copyMessagesDefaultIconImages___DefaultImageURLs, 0, -1);
}

uint64_t ___copyMessagesDefaultIconImages_block_invoke()
{
  uint64_t result;

  result = _copyDefaultIconURLs(CFSTR("MessagesDefaultIcon"));
  _copyMessagesDefaultIconImages___DefaultImageURLs = result;
  return result;
}

__CFArray *_copyAppClipDefaultIconImages()
{
  if (_copyAppClipDefaultIconImages_onceToken != -1)
    dispatch_once(&_copyAppClipDefaultIconImages_onceToken, &__block_literal_global_41);
  return copyImagesForIconURLsFilteringForVariant((void *)_copyAppClipDefaultIconImages___DefaultImageURLs, 0, -1);
}

uint64_t ___copyAppClipDefaultIconImages_block_invoke()
{
  uint64_t result;

  result = _copyDefaultIconURLs(CFSTR("AppClipDefaultIcon"));
  _copyAppClipDefaultIconImages___DefaultImageURLs = result;
  return result;
}

CGImage *LICreateDefaultIcon(unsigned int a1)
{
  return createDefaultIconWithOptions(a1, 0, 0);
}

CGImage *LICreateDefaultAppClipIcon(unsigned int a1)
{
  return createDefaultIconWithOptions(a1, 0, 1);
}

CGImageRef LICreateIconOverlay(int a1)
{
  __int128 v2;
  __int128 v4;
  __int128 v5;
  const __CFString *v6;
  double v7;
  double v8;
  _QWORD v9[7];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;

  v7 = 0.0;
  v8 = 0.0;
  v6 = 0;
  v2 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v4 = *MEMORY[0x24BDBF090];
  v5 = v2;
  frameAndImageNamesForVariant(a1, 0, (uint64_t)&v4, (uint64_t)&v7, 0, 0, &v6, 0);
  v9[1] = 3221225472;
  v10 = v4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = ___createApplicationIconFromImage_block_invoke;
  v9[3] = &__block_descriptor_112_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
  v14 = a1;
  v15 = 0;
  v9[4] = 0;
  v9[5] = v6;
  v9[6] = 0;
  v11 = v5;
  v12 = 0;
  v13 = 0;
  return _createIcon(0, v9, v7, v8);
}

double LIExpectedImageInputSizeForVariant(int a1)
{
  return expectedInputSizeForVariant(a1, 0);
}

float LITopInsetForHomeScreenVariant(int a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = *(double *)(MEMORY[0x24BDBF148] + 8) + 0.0;
  outputSizeForVariant(a1);
  v4 = v3;
  expectedInputSizeForVariant(a1, 0);
  v6 = v4 - (v2 + v5);
  scaleForVariant();
  return v6 / v7;
}

float LISideInsetForHomeScreenVariant(int a1)
{
  double v2;
  float v3;
  double v4;
  double v5;

  v2 = outputSizeForVariant(a1);
  v3 = (v2 - expectedInputSizeForVariant(a1, 0)) * 0.5;
  v4 = floorf(v3);
  scaleForVariant();
  return v4 / v5;
}

double sideInsetForVariant(int a1)
{
  double v2;
  float v3;

  v2 = outputSizeForVariant(a1);
  v3 = (v2 - expectedInputSizeForVariant(a1, 0)) * 0.5;
  return floorf(v3);
}

double outputVisibleImageBoundsForVariant(int a1)
{
  double v2;
  double v3;
  float v4;

  v2 = *MEMORY[0x24BDBF090];
  v3 = outputSizeForVariant(a1);
  expectedInputSizeForVariant(a1, 0);
  v4 = (v3 - expectedInputSizeForVariant(a1, 0)) * 0.5;
  return v2 + floorf(v4);
}

double LIIconOutputVisibleImageBoundsForVariant(int a1)
{
  double v1;
  double v2;

  v1 = outputVisibleImageBoundsForVariant(a1);
  scaleForVariant();
  return v1 / v2;
}

double LIIconContinuousCornerRadiusForVariant(int a1)
{
  double v2;
  NSObject *v3;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = 13.5;
  switch(a1)
  {
    case 0:
    case 15:
    case 30:
    case 32:
    case 53:
      return v2;
    case 1:
      return 17.0;
    case 2:
    case 3:
    case 16:
    case 25:
    case 33:
      return 9.0;
    case 4:
    case 17:
    case 31:
    case 34:
    case 54:
      return 6.5;
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 14:
    case 18:
    case 19:
    case 20:
    case 21:
    case 26:
    case 27:
    case 28:
    case 29:
    case 36:
    case 37:
    case 38:
    case 39:
    case 42:
    case 43:
    case 44:
    case 47:
    case 48:
    case 49:
    case 50:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
      goto LABEL_2;
    case 11:
    case 40:
    case 41:
    case 45:
    case 46:
    case 51:
    case 52:
      goto LABEL_12;
    case 22:
    case 23:
    case 35:
    case 64:
    case 65:
    case 66:
      return 4.5;
    case 24:
      return 17.125;
    case 63:
      return 18.75;
    default:
      if ((a1 - 32769) <= 4 && ((1 << (a1 - 1)) & 0x15) != 0)
      {
LABEL_2:
        if (_LIDefaultLog_onceToken != -1)
          dispatch_once(&_LIDefaultLog_onceToken, &__block_literal_global_160);
        v3 = _LIDefaultLog_log;
        v2 = 0.0;
        if (os_log_type_enabled((os_log_t)_LIDefaultLog_log, OS_LOG_TYPE_FAULT))
          LIIconContinuousCornerRadiusForVariant_cold_1(a1, v3);
        return v2;
      }
      else
      {
LABEL_12:
        v5 = outputSizeForVariant(a1);
        v7 = v6;
        scaleForVariant();
        return _LICGPathCornerRadiusForSize(v5 / v8, v7 / v8);
      }
  }
}

void *LIGetIconVariantDimensionsForStyle(const __CFString *a1, const __CFString *a2)
{
  CFComparisonResult v4;
  void *result;
  void *v6;
  const __CFString *v7;

  if (CFStringCompare(a1, CFSTR("LSApplicationStyleDomain"), 0))
  {
    v4 = CFStringCompare(a1, CFSTR("LSDocumentStyleDomain"), 0);
    result = 0;
    if (v4)
      return result;
    if (CFStringCompare(a2, CFSTR("IPad"), 0) == kCFCompareEqualTo)
      return &LIGetIconVariantDimensionsForStyle_sDocumentIconVariants_iPad;
    if (CFStringCompare(a2, CFSTR("IPadBadged"), 0) == kCFCompareEqualTo)
      return &LIGetIconVariantDimensionsForStyle_sDocumentIconVariants_iPadBadged;
    if (CFStringCompare(a2, CFSTR("IPhone"), 0) == kCFCompareEqualTo)
      return &LIGetIconVariantDimensionsForStyle_sDocumentIconVariants_iPhone;
    v6 = &LIGetIconVariantDimensionsForStyle_sDocumentIconVariants_iPhoneBadged;
    v7 = CFSTR("IPhoneBadged");
  }
  else
  {
    if (CFStringCompare(a2, CFSTR("UIHomeScreenIcon"), 0) == kCFCompareEqualTo)
      return &LIGetIconVariantDimensionsForStyle_sApplicationIconVariants;
    v6 = &LIGetIconVariantDimensionsForStyle_sApplicationIconVariantsSpotlight;
    v7 = CFSTR("UISpotLightIcon");
  }
  if (CFStringCompare(a2, v7, 0))
    return 0;
  else
    return v6;
}

const __CFURL *LICopyIconPathsFromBundle(__CFBundle *a1)
{
  return LICopyIconPathsFromBundleForStyles(a1, 0);
}

const __CFURL *LICopyIconPathsFromBundleForStyles(CFBundleRef bundle, const void *a2)
{
  CFTypeID TypeID;
  const __CFURL *v5;
  const __CFURL *v6;
  const __CFURL *v7;
  __CFReadStream *v8;
  __CFReadStream *v9;
  CFPropertyListRef v10;
  CFTypeID v11;
  CFMutableSetRef Mutable;
  const __CFArray *v13;
  const __CFArray *v14;
  const __CFString *v15;
  __CFString **v16;
  CFStringRef v17;
  CFStringRef v18;
  const __CFString *Value;
  CFTypeID v20;
  CFStringRef v21;
  CFStringRef v22;
  const __CFArray *v23;
  CFTypeID v24;
  CFStringRef v25;
  CFStringRef v26;
  const __CFDictionary *v27;
  CFTypeID v28;
  const __CFString *v29;
  __int128 v31;
  const void *v32;
  __int128 context;
  const void *v34;
  void *values[2];
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!bundle)
    return 0;
  if (a2)
  {
    TypeID = CFSetGetTypeID();
    if (CFGetTypeID(a2) != TypeID)
      return 0;
  }
  v5 = CFBundleCopyBundleURL(bundle);
  if (!v5)
    return v5;
  v6 = CFURLCreateCopyAppendingPathComponent(0, v5, CFSTR("Info.plist"), 0);
  if (!v6)
  {
    CFRelease(v5);
    return 0;
  }
  v7 = v6;
  v8 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x24BDBD240], v6);
  if (v8)
  {
    v9 = v8;
    if (CFReadStreamOpen(v8))
    {
      v10 = CFPropertyListCreateWithStream(0, v9, 0, 0, 0, 0);
      if (v10)
      {
        v11 = CFDictionaryGetTypeID();
        if (CFGetTypeID(v10) != v11)
        {
          CFRelease(v10);
          v10 = 0;
        }
      }
      CFReadStreamClose(v9);
    }
    else
    {
      v10 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  CFRelease(v7);
  CFRelease(v5);
  if (!v10)
    return 0;
  Mutable = CFSetCreateMutable(0, 0, MEMORY[0x24BDBD6B8]);
  v5 = Mutable;
  if (Mutable)
  {
    *(_QWORD *)&context = bundle;
    *((_QWORD *)&context + 1) = Mutable;
    v34 = a2;
    if (!a2 || CFSetContainsValue((CFSetRef)a2, CFSTR("CFBundlePrimaryIcon")))
    {
      *(_OWORD *)values = xmmword_24BFDA500;
      v36 = *(_OWORD *)off_24BFDA510;
      v13 = CFArrayCreate(0, (const void **)values, 4, MEMORY[0x24BDBD690]);
      if (v13)
      {
        v14 = v13;
        v31 = context;
        v32 = v34;
        addURLsForIconSpecifiers(&v31, v13);
        CFRelease(v14);
      }
    }
    v15 = CFSTR("%@");
    v16 = off_24BFDA528;
    do
    {
      if (!a2 || CFSetContainsValue((CFSetRef)a2, CFSTR("CFBundlePrimaryIcon")))
      {
        v17 = CFStringCreateWithFormat(0, 0, v15, CFSTR("CFBundleIconFile"));
        if (v17)
        {
          v18 = v17;
          Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v10, v17);
          v20 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == v20)
          {
            *(_OWORD *)values = context;
            *(_QWORD *)&v36 = v34;
            addURLsForIconSpecifier((CFMutableSetRef *)values, Value, 1);
          }
          CFRelease(v18);
        }
        v21 = CFStringCreateWithFormat(0, 0, v15, CFSTR("CFBundleIconFiles"));
        if (v21)
        {
          v22 = v21;
          v23 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v10, v21);
          v24 = CFArrayGetTypeID();
          if (v23 && CFGetTypeID(v23) == v24)
          {
            *(_OWORD *)values = context;
            *(_QWORD *)&v36 = v34;
            addURLsForIconSpecifiers((__int128 *)values, v23);
          }
          CFRelease(v22);
        }
      }
      v25 = CFStringCreateWithFormat(0, 0, v15, CFSTR("CFBundleIcons"));
      if (v25)
      {
        v26 = v25;
        v27 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v10, v25);
        v28 = CFDictionaryGetTypeID();
        if (v27 && CFGetTypeID(v27) == v28)
          CFDictionaryApplyFunction(v27, (CFDictionaryApplierFunction)addURLsForCFBundleIconsEntry, &context);
        CFRelease(v26);
      }
      v29 = *v16++;
      v15 = v29;
    }
    while (v29);
  }
  CFRelease(v10);
  return v5;
}

void addURLsForIconSpecifiers(__int128 *a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFTypeID TypeID;
  __int128 v9;
  uint64_t v10;

  Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    v5 = Count;
    for (i = 0; i != v5; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
      TypeID = CFStringGetTypeID();
      if (ValueAtIndex)
      {
        if (CFGetTypeID(ValueAtIndex) == TypeID)
        {
          v9 = *a1;
          v10 = *((_QWORD *)a1 + 2);
          addURLsForIconSpecifier((CFMutableSetRef *)&v9, ValueAtIndex, 1);
        }
      }
    }
  }
}

void addURLsForIconSpecifier(CFMutableSetRef *a1, const __CFString *a2, int a3)
{
  const __CFURL *v6;
  const __CFURL *v7;
  const __CFString *v8;
  __CFString **v9;
  CFStringRef v10;
  CFStringRef v11;
  const __CFString *v12;
  __int128 v13;
  CFMutableSetRef v14;

  if (!CFSetContainsValue(a1[1], a2))
  {
    v6 = CFBundleCopyResourceURL(*a1, a2, 0, 0);
    if (v6)
    {
      v7 = v6;
      if (isRegularFileAtURL(v6))
        CFSetAddValue(a1[1], v7);
      CFRelease(v7);
    }
    else if (a3)
    {
      v8 = CFSTR("%@.%@");
      v9 = off_24BFDA610;
      do
      {
        v10 = CFStringCreateWithFormat(0, 0, v8, a2, CFSTR("png"));
        if (v10)
        {
          v11 = v10;
          v13 = *(_OWORD *)a1;
          v14 = a1[2];
          addURLsForIconSpecifier(&v13, v10, 0);
          CFRelease(v11);
        }
        v12 = *v9++;
        v8 = v12;
      }
      while (v12);
    }
  }
}

void addURLsForCFBundleIconsEntry(const void *a1, const __CFDictionary *a2, uint64_t a3)
{
  CFTypeID TypeID;
  CFTypeID v7;
  CFTypeID v8;
  const __CFArray *Value;
  CFTypeID v10;
  __int128 v11;
  uint64_t v12;

  if (a3)
  {
    TypeID = CFStringGetTypeID();
    if (a1)
    {
      if (CFGetTypeID(a1) == TypeID)
      {
        v7 = CFDictionaryGetTypeID();
        if (a2)
        {
          if (CFGetTypeID(a2) == v7)
          {
            if (!*(_QWORD *)(a3 + 16)
              || (v8 = CFStringGetTypeID(), CFGetTypeID(a1) == v8) && CFSetContainsValue(*(CFSetRef *)(a3 + 16), a1))
            {
              Value = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("CFBundleIconFiles"));
              v10 = CFArrayGetTypeID();
              if (Value)
              {
                if (CFGetTypeID(Value) == v10)
                {
                  v11 = *(_OWORD *)a3;
                  v12 = *(_QWORD *)(a3 + 16);
                  addURLsForIconSpecifiers(&v11, Value);
                }
              }
            }
          }
        }
      }
    }
  }
}

void __createDocumentIconFromImage_block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  unsigned int v11;
  double v12;
  double v13;
  CGFloat y;
  CGFloat x;
  double width;
  double v17;
  CGFloat height;
  CGFloat v19;
  CGFloat v20;
  const __CFString *v21;
  CGImage *CGImageFromFrameworkBundleResourceNamed;
  CGImage *v23;
  const __CFString *v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat recta;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v11 = *(_DWORD *)(a1 + 40);
  scaleForVariant();
  v13 = v12;
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = outputSizeForVariant(v11);
  height = v17;
  if (v11 > 0x25)
    goto LABEL_5;
  if (((1 << v11) & 0x30143C00A0) != 0)
  {
    v19 = 1.0;
    v20 = 1.0;
LABEL_4:
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v42 = CGRectInset(v41, v19, v20);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    goto LABEL_5;
  }
  if (((1 << v11) & 0x140) != 0)
  {
    v19 = 4.0;
    v20 = 4.0;
    goto LABEL_4;
  }
  if (((1 << v11) & 0x28000000) != 0)
  {
    v19 = 7.0;
    v20 = 7.0;
    goto LABEL_4;
  }
LABEL_5:
  v21 = documentBaseNameForVariant(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
  CGImageFromFrameworkBundleResourceNamed = createCGImageFromFrameworkBundleResourceNamed(v21, v13);
  if (CGImageFromFrameworkBundleResourceNamed)
  {
    v23 = CGImageFromFrameworkBundleResourceNamed;
    v43.origin.x = a3;
    v43.origin.y = a4;
    v43.size.width = a5;
    v43.size.height = a6;
    CGContextDrawImage(a2, v43, CGImageFromFrameworkBundleResourceNamed);
    CGImageRelease(v23);
  }
  else
  {
    v24 = documentBaseNameForVariant(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
    NSLog(CFSTR("%s: Error: unable to create document base image from image named \"%@\" at scale %.1f"), "createDocumentIconFromImage_block_invoke", v24, *(_QWORD *)&v13);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v25 = y;
    v26 = *MEMORY[0x24BDBEFB0];
    v27 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v28 = *(_DWORD *)(a1 + 40);
    v30 = *MEMORY[0x24BDBF148];
    v29 = *(double *)(MEMORY[0x24BDBF148] + 8);
    scaleForVariant();
    recta = v26;
    switch(v28)
    {
      case 18:
      case 19:
      case 20:
      case 21:
      case 26:
      case 28:
      case 36:
      case 37:
      case 60:
      case 61:
      case 62:
LABEL_10:
        v32 = 20.0;
        goto LABEL_21;
      case 22:
      case 23:
      case 24:
      case 25:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
        break;
      case 27:
      case 29:
LABEL_17:
        v32 = 145.0;
        goto LABEL_21;
      case 55:
      case 56:
      case 57:
        *(double *)&v33 = 38.0;
        goto LABEL_20;
      case 58:
      case 59:
        *(double *)&v33 = 58.0;
LABEL_20:
        v32 = *(double *)&v33;
LABEL_21:
        v29 = v31 * v32;
        v30 = v31 * v32;
        break;
      default:
        switch(v28)
        {
          case 5:
          case 7:
            goto LABEL_10;
          case 6:
          case 8:
            goto LABEL_17;
          default:
            goto LABEL_22;
        }
    }
LABEL_22:
    v44.origin.x = x;
    v34 = v25;
    v44.origin.y = v25;
    v44.size.width = width;
    v44.size.height = height;
    v35 = CGRectGetWidth(v44);
    v45.origin.x = recta;
    v45.origin.y = v27;
    v45.size.width = v30;
    v45.size.height = v29;
    v36 = v35 - CGRectGetWidth(v45);
    v46.origin.x = x;
    v37 = round(v36 * 0.5);
    v46.origin.y = v34;
    v46.size.width = width;
    v46.size.height = height;
    v38 = CGRectGetHeight(v46);
    v47.origin.x = v37;
    v47.origin.y = v27;
    v47.size.width = v30;
    v47.size.height = v29;
    v48.origin.y = round((v38 - CGRectGetHeight(v47)) * 0.5);
    v48.origin.x = v37;
    v48.size.width = v30;
    v48.size.height = v29;
    CGContextDrawImage(a2, v48, *(CGImageRef *)(a1 + 32));
  }
}

const __CFString *documentBaseNameForVariant(int a1, char a2)
{
  const __CFString *result;
  const __CFString *v4;
  const __CFString *v5;

  result = 0;
  switch(a1)
  {
    case 18:
    case 19:
    case 20:
    case 21:
    case 26:
    case 28:
    case 36:
    case 37:
LABEL_2:
      v4 = CFSTR("DocumentBaseNoPageCurl-48.png");
      v5 = CFSTR("DocumentBase-48.png");
      goto LABEL_8;
    case 22:
    case 23:
    case 24:
    case 25:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
      return result;
    case 27:
    case 29:
LABEL_4:
      v4 = CFSTR("DocumentBaseNoPageCurl-320.png");
      v5 = CFSTR("DocumentBase-320.png");
      goto LABEL_8;
    case 55:
    case 56:
    case 57:
      v4 = CFSTR("DocumentBaseNoPageCurl-84.png");
      v5 = CFSTR("DocumentBase-84.png");
      goto LABEL_8;
    case 58:
    case 59:
      v4 = CFSTR("DocumentBaseNoPageCurl-128.png");
      v5 = CFSTR("DocumentBase-128.png");
      goto LABEL_8;
    case 60:
    case 61:
    case 62:
      v4 = CFSTR("DocumentBaseNoPageCurl-44.png");
      v5 = CFSTR("DocumentBase-44.png");
LABEL_8:
      if ((a2 & 0x40) != 0)
        result = v4;
      else
        result = v5;
      break;
    default:
      switch(a1)
      {
        case 5:
        case 7:
          goto LABEL_2;
        case 6:
        case 8:
          goto LABEL_4;
        default:
          return result;
      }
  }
  return result;
}

uint64_t isPropertyListBooleanTrue(const __CFString *a1)
{
  CFTypeID v2;
  CFIndex Length;
  CFIndex v5;
  CFIndex v6;
  unsigned __int8 v7;
  unsigned int CharacterAtIndex;
  char v9;

  if (a1)
  {
    v2 = CFGetTypeID(a1);
    if (v2 == CFBooleanGetTypeID())
      return CFBooleanGetValue((CFBooleanRef)a1);
    if (v2 == CFStringGetTypeID())
    {
      Length = CFStringGetLength(a1);
      if (Length >= 1)
      {
        v5 = Length;
        v6 = 0;
        v7 = 0;
        while (1)
        {
          CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
          v9 = 1;
          if (CharacterAtIndex > 0x31)
            goto LABEL_11;
          if (((1 << CharacterAtIndex) & 0x100002600) != 0)
            goto LABEL_13;
          if (CharacterAtIndex != 49)
          {
LABEL_11:
            if (CharacterAtIndex - 84 > 0x25
              || ((1 << (CharacterAtIndex - 84)) & 0x2100000021) == 0)
            {
              v9 = 0;
            }
          }
          v7 = v9;
LABEL_13:
          if (CharacterAtIndex <= 0x20 && ((1 << CharacterAtIndex) & 0x100002600) != 0 && v5 != ++v6)
            continue;
          return v7;
        }
      }
    }
  }
  return 0;
}

uint64_t isFilePathContainedInPath(CFStringRef theString, const __CFString *a2)
{
  CFMutableStringRef MutableCopy;
  CFMutableStringRef Mutable;
  uint64_t HasPrefix;

  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  canonicalizePath(MutableCopy);
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("/"));
  CFStringAppend(Mutable, a2);
  CFStringAppend(Mutable, CFSTR("/"));
  canonicalizePath(Mutable);
  HasPrefix = CFStringHasPrefix(MutableCopy, Mutable);
  CFRelease(MutableCopy);
  CFRelease(Mutable);
  return HasPrefix;
}

CFIndex canonicalizePath(__CFString *theString)
{
  CFIndex result;
  CFRange v3;

  do
  {
    v3.length = CFStringGetLength(theString);
    v3.location = 0;
    result = CFStringFindAndReplace(theString, CFSTR("//"), CFSTR("/"), v3, 0);
  }
  while (result > 0);
  return result;
}

const __CFURL *createURLForImageInBundleWithSizeIfExists(__CFBundle *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const __CFURL *result;
  BOOL v12;

  while (1)
  {
    if (a3)
    {
      result = 0;
      if ((_DWORD)a4 && (_DWORD)a5)
        result = createURLForFormatInBundle(a1, CFSTR("%@-%u@%ux.%@"), a2, a4, a5, a3);
      if ((_DWORD)a5 && !result)
        result = createURLForFormatInBundle(a1, CFSTR("%@@%ux.%@"), a2, a5, a3);
      if ((_DWORD)a4 && !result)
        result = createURLForFormatInBundle(a1, CFSTR("%@-%u.%@"), a2, a4, a3);
      if (result)
        break;
    }
    v12 = (_DWORD)a5 == 3;
    a5 = 2;
    if (!v12)
    {
      if (a3)
        return createURLForFormatInBundle(a1, CFSTR("%@.%@"), a2, a3);
      else
        return createURLForFormatInBundle(a1, CFSTR("%@"), a2, 0);
    }
  }
  return result;
}

const __CFURL *createURLForFormatInBundle(__CFBundle *a1, CFStringRef format, ...)
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFURL *v5;
  const __CFURL *v6;
  va_list va;

  va_start(va, format);
  v3 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFBundleCopyResourceURLForLocalization(a1, v3, 0, 0, 0);
  v6 = v5;
  if (v5 && !isRegularFileAtURL(v5))
  {
    CFRelease(v6);
    v6 = 0;
  }
  CFRelease(v4);
  return v6;
}

uint64_t isRegularFileAtURL(const __CFURL *a1)
{
  uint64_t result;
  stat v2;
  UInt8 buffer[1026];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  result = CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1026);
  if ((_DWORD)result)
  {
    memset(&v2, 0, sizeof(v2));
    return !lstat((const char *)buffer, &v2) && (v2.st_mode & 0xF000) == 0x8000;
  }
  return result;
}

void __cuiDeviceSubtypeForVariant_block_invoke()
{
  void *v0;
  id v1;

  MGCopyAnswer();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("ArtworkDeviceSubType"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    cuiDeviceSubtypeForVariant_subtype = objc_msgSend(v0, "integerValue");

  }
}

CFDataRef _LICreateIconDataForContainersWithIconsDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __CFDictionary *a5, unsigned int a6)
{
  return _LICreateIconDataForContainersWithIconsDictionaryAndPreferredIconNameWithOptions(a1, a2, a3, a4, a5, 0, a6, 0);
}

CFDataRef _LICreateIconDataForContainersWithIconsDictionaryAndPreferredIconNameWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __CFDictionary *a5, const __CFString *a6, unsigned int a7, unsigned int a8)
{
  __CFBundle *Unique;
  CGImage *v17;
  CGImage *v18;
  CFDataRef v19;

  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (!Unique)
    NSLog(CFSTR("%s ERROR: unable to create bundle for \"%@\" from URL: %@"), "_LICreateIconDataForContainersWithIconsDictionaryAndPreferredIconNameWithOptions", a4, a1);
  v17 = _LICreateIconForBundleWithIconsDictionaryAndContainers(Unique, a5, a6, a2, a3, a7, a8);
  if (!v17)
  {
    v19 = 0;
    if (!Unique)
      return v19;
    goto LABEL_5;
  }
  v18 = v17;
  v19 = LICreateUncompressedBitmapDataFromImage(v17);
  CFRelease(v18);
  if (Unique)
LABEL_5:
    CFRelease(Unique);
  return v19;
}

CFDataRef _LICreateIconDataForBundleURLWithIconName(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  return _LICreateIconDataForBundleURLWithIconNameWithOptions(a1, a2, a3, a4, 0, a5);
}

CFDataRef _LICreateIconDataForBundleURLWithIconNameWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  __CFBundle *Unique;
  CGImage *v13;
  CGImage *v14;
  CFDataRef v15;

  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (!Unique)
    NSLog(CFSTR("%s ERROR: unable to create bundle for \"%@\" from URL: %@"), "_LICreateIconDataForBundleURLWithIconNameWithOptions", a2, a1);
  v13 = _LICreateIconForBundleWithIconNameAndDisplayGamut(Unique, a3, a4, a6, a5);
  if (!v13)
  {
    v15 = 0;
    if (!Unique)
      return v15;
    goto LABEL_5;
  }
  v14 = v13;
  v15 = LICreateUncompressedBitmapDataFromImage(v13);
  CFRelease(v14);
  if (Unique)
LABEL_5:
    CFRelease(Unique);
  return v15;
}

double _LICGPathCornerRadiusForSize(double a1, double a2)
{
  if (a1 >= a2)
    a1 = a2;
  return a1 * 0.225;
}

void _addContinuousCornerToPath(CGPath *a1, int a2, int a3, int a4, double a5, double a6, double a7, double a8)
{
  char v8;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  __double2 v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGPath *v43;
  CGAffineTransform *p_m;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double y;
  double endAngle;
  CGAffineTransform m;

  v8 = a3;
  if (a7 >= a8)
    v12 = a8;
  else
    v12 = a7;
  v13 = 0.980263;
  if (a4)
  {
    v13 = 1.0;
    v14 = v12;
  }
  else
  {
    v14 = v12 * 0.95;
  }
  endAngle = v13;
  v15 = 0.0;
  if ((a2 - 1) <= 3)
    v15 = dbl_2067ADEA0[a2 - 1];
  v16 = v14 * (1.0 - v13);
  switch(a3)
  {
    case 2:
      v17 = -v16;
      y = 70.0;
      v18 = *MEMORY[0x24BDBEFB0];
      goto LABEL_14;
    case 1:
      v62 = v15 + 20.0;
      v18 = -v16;
      y = 70.0;
      v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      break;
    case 0:
      v17 = -v16;
      y = 90.0;
      v18 = -v16;
LABEL_14:
      v62 = v15;
      break;
    default:
      v62 = v15 + 20.0;
      y = 50.0;
      v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v18 = *MEMORY[0x24BDBEFB0];
      v14 = v14 / 1.528665;
      break;
  }
  v19 = _interiorPointForCorner(a2, v18, v17, *MEMORY[0x24BDBEFB0]);
  v59 = v20;
  v60 = v19;
  v21 = v14 * 0.33 * 0.666666667;
  v22 = v21 * 1.05304313 + (v14 / 1.05304313 + v21 * 0.33 / 1.05304313) * 0.67;
  v23 = v21 * 1.05304313 + v22;
  v24 = v21 * 1.05304313 + v21 * 1.05304313 + v23;
  v25 = _interiorPointForCorner(a2, 0.0, v22, a5);
  v57 = v26;
  v58 = v25;
  v27 = _interiorPointForCorner(a2, 0.0, v23, a5);
  v55 = v28;
  v56 = v27;
  v29 = _interiorPointForCorner(a2, 0.0, v24, a5);
  v53 = v30;
  v54 = v29;
  v63 = _interiorPointForCorner(a2, v14, v14, a5);
  v32 = v31;
  v33 = _interiorPointForCorner(a2, 0.0, v12, a5);
  v51 = v34;
  v52 = v33;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v60, v59);
  v35 = endAngle * v14;
  if ((v8 & 1) != 0)
  {
    v38 = __sincos_stret((v62 + 0.0) * 0.0174532925);
    v39 = _interiorPointForCorner(a2, v22, 0.0, a5);
    v61 = v40;
    v41 = _interiorPointForCorner(a2, v23, 0.0, a5);
    CGPathAddCurveToPoint(a1, &m, v41, v42, v39, v61, v63 + v35 * v38.__cosval, v32 + v35 * v38.__sinval);
  }
  else
  {
    v36 = _interiorPointForCorner(a2, v12, 0.0, a5);
    CGPathAddCurveToPoint(a1, 0, v36, v37, v36, v37, v36, v37);
  }
  CGPathAddArc(a1, &m, v63, v32, v35, (v62 + 0.0) * 0.0174532925, (y + v62) * 0.0174532925, 0);
  if ((v8 & 2) != 0)
  {
    p_m = &m;
    v43 = a1;
    v46 = v57;
    v45 = v58;
    v48 = v55;
    v47 = v56;
    v50 = v53;
    v49 = v54;
  }
  else
  {
    v43 = a1;
    p_m = 0;
    v46 = v51;
    v45 = v52;
    v47 = v52;
    v48 = v51;
    v49 = v52;
    v50 = v51;
  }
  CGPathAddCurveToPoint(v43, p_m, v45, v46, v47, v48, v49, v50);
}

double _interiorPointForCorner(int a1, double result, double a3, double a4)
{
  double v4;

  switch(a1)
  {
    case 1:
      v4 = a3 + a4;
      goto LABEL_6;
    case 2:
      result = a4 - result;
      break;
    case 4:
      result = result + a4;
      break;
    case 8:
      v4 = a4 - a3;
LABEL_6:
      result = v4;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

BOOL _LICGImageWriteAsPNGToFilePath(CGImage *a1, uint64_t a2)
{
  const __CFURL *v3;
  CGImageDestination *v4;
  CGImageDestination *v5;
  _BOOL8 v6;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a2);
  v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v4 = CGImageDestinationCreateWithURL(v3, (CFStringRef)*MEMORY[0x24BDC1820], 1uLL, 0);
  if (v4)
  {
    v5 = v4;
    CGImageDestinationAddImage(v4, a1, 0);
    v6 = CGImageDestinationFinalize(v5);
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL use_scaler_for_statistics()
{
  if (use_scaler_for_statistics_initialized != -1)
    dispatch_once(&use_scaler_for_statistics_initialized, &__block_literal_global_88);
  return luma_accelerator != 0;
}

uint64_t __use_scaler_for_statistics_block_invoke()
{
  uint64_t result;

  IOSurfaceAcceleratorCreate();
  result = luma_accelerator;
  if (luma_accelerator)
    return IOSurfaceAcceleratorGetServiceObject();
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_4(uint64_t a1, void *a2)
{
  return a2;
}

CFDataRef LICreateUncompressedBitmapDataFromImage(CGImage *a1)
{
  return LICreateUncompressedBitmapDataFromImageWithOptions(a1, 0);
}

CFDataRef LICreateUncompressedBitmapDataFromImageWithOptions(CGImage *a1, char a2)
{
  CGColorSpace *ColorSpace;
  BOOL v5;
  unsigned int Width;
  unsigned int Height;
  CGColorSpace *DeviceRGB;
  uint32_t v9;
  size_t v10;
  unsigned int AlignedBytesPerRow;
  int FastestAlignment;
  unsigned int i;
  UInt8 *v14;
  CGContext *v15;
  CGRect v17;

  ColorSpace = CGImageGetColorSpace(a1);
  if (ColorSpace)
    v5 = !CGColorSpaceIsWideGamutRGB(ColorSpace);
  else
    v5 = 1;
  Width = CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  if (v5)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if ((a2 & 1) != 0)
      v9 = 8198;
    else
      v9 = 8194;
    v10 = 8;
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
    if ((a2 & 1) != 0)
      v9 = 4357;
    else
      v9 = 4353;
    v10 = 16;
  }
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  FastestAlignment = CGBitmapGetFastestAlignment();
  for (i = 0; i < 0x20; i += FastestAlignment)
    ;
  v14 = (UInt8 *)malloc_type_calloc(i + AlignedBytesPerRow * Height, 1uLL, 0xCEB15D28uLL);
  *(_DWORD *)v14 = -1481703392;
  *((_DWORD *)v14 + 1) = i;
  *((_DWORD *)v14 + 2) = Width;
  *((_DWORD *)v14 + 3) = Height;
  *((_DWORD *)v14 + 4) = AlignedBytesPerRow;
  *((_DWORD *)v14 + 5) = v10;
  *((_DWORD *)v14 + 6) = 4 * v10;
  *((_DWORD *)v14 + 7) = v9;
  v15 = CGBitmapContextCreate(&v14[i], Width, Height, v10, AlignedBytesPerRow, DeviceRGB, v9);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetCompositeOperation();
  v17.size.width = (double)Width;
  v17.size.height = (double)Height;
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  CGContextDrawImage(v15, v17, a1);
  CGContextRelease(v15);
  return CFDataCreateWithBytesNoCopy(0, v14, i + AlignedBytesPerRow * Height, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
}

BOOL LIGetHeaderForUncompressedBitmapData(const __CFData *a1, _OWORD *a2)
{
  unint64_t Length;
  int64_t v5;
  const UInt8 *BytePtr;
  int64_t v7;
  _BOOL8 v9;
  const UInt8 *v10;
  __int128 v11;

  Length = CFDataGetLength(a1);
  if (Length < 0x20 || (v5 = Length, BytePtr = CFDataGetBytePtr(a1), (unsigned __int16)*(_DWORD *)BytePtr != 32))
  {
    v9 = 0;
    if (!a2)
      return v9;
    goto LABEL_12;
  }
  v7 = *((unsigned int *)BytePtr + 1);
  v9 = v7 >= 0x20 && v5 >= v7 && (~*(_DWORD *)BytePtr & 0xA7AF0000) == 0;
  if (a2)
  {
LABEL_12:
    if (v9)
    {
      v10 = CFDataGetBytePtr(a1);
      v11 = *((_OWORD *)v10 + 1);
      *a2 = *(_OWORD *)v10;
      a2[1] = v11;
    }
    else
    {
      *a2 = 0u;
      a2[1] = 0u;
    }
  }
  return v9;
}

CGImageRef LICreateImageFromUncompressedBitmapData(const __CFData *a1)
{
  size_t Length;
  UInt8 *BytePtr;
  CGColorSpaceRef DeviceRGB;
  CGImageRef v5;
  CGColorSpace *v6;
  void *v7;
  CGDataProvider *v8;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  if (LIGetHeaderForUncompressedBitmapData(a1, &v10))
  {
    Length = CFDataGetLength(a1);
    BytePtr = (UInt8 *)CFDataGetBytePtr(a1);
    madvise(BytePtr, Length, 3);
    if (DWORD1(v11) < 9)
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
    else
      DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
    v6 = DeviceRGB;
    v7 = (void *)CFRetain(a1);
    v8 = CGDataProviderCreateWithData(v7, &BytePtr[DWORD1(v10)], Length - DWORD1(v10), (CGDataProviderReleaseDataCallback)MEMORY[0x24BDBC298]);
    v5 = CGImageCreate(DWORD2(v10), HIDWORD(v10), DWORD1(v11), DWORD2(v11), v11, v6, HIDWORD(v11), v8, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v8);
    CGColorSpaceRelease(v6);
  }
  else
  {
    NSLog(CFSTR("%s ERROR: Bitmap data is of an invalid format. Ignoring."), "LICreateImageFromUncompressedBitmapData");
    return 0;
  }
  return v5;
}

CFDataRef LICreateCachedUncompressedDataFromImage(CGImage *a1)
{
  return LICreateUncompressedBitmapDataFromImageWithOptions(a1, 0);
}

unsigned int *LIGetImageInfoFromCachedUncompressedData(unsigned int *result, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8)
{
  if (a2)
    *a2 = result[1];
  if (a3)
    *a3 = result[2];
  if (a4)
    *a4 = result[3];
  if (a5)
    *a5 = result[4];
  if (a6)
    *a6 = result[5];
  if (a7)
    *a7 = result[6];
  if (a8)
    *a8 = result[7];
  return result;
}

void CA_CFDictionarySetInt(__CFDictionary *a1, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void CA_CFDictionarySetBool(__CFDictionary *a1, const __CFString *a2, int a3)
{
  const void **v3;

  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(a1, a2, *v3);
}

CFMutableDictionaryRef CA_CFDictionaryCreate(void)
{
  return CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
}

BOOL x_power_of_two(uint64_t a1)
{
  return (a1 & (a1 - 1)) == 0;
}

unint64_t x_align_to(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = a2 - 1 + a1;
  if ((a2 & (a2 - 1)) != 0)
    return v2 / a2 * a2;
  else
    return v2 & -(uint64_t)a2;
}

IOSurfaceRef CAIOSurfaceCreate(unsigned int a1, int a2, int a3, int a4, unsigned __int8 a5, int a6, _QWORD *a7)
{
  unint64_t v12;
  unsigned int v14;
  __CFDictionary *Mutable;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFArrayRef v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unsigned __int16 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int8x8_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8x8_t v54;
  unint64_t v55;
  unint64_t v56;
  int8x8_t v57;
  uint8x8_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  int8x8_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint8x8_t v85;
  unint64_t v86;
  unint64_t v87;
  int8x8_t v88;
  uint8x8_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unsigned __int16 v99;
  int v100;
  unsigned __int16 v101;
  int v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  CFArrayRef v108;
  int v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  int8x8_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint8x8_t v124;
  unint64_t v125;
  unint64_t v126;
  int8x8_t v127;
  uint8x8_t v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int8x8_t v141;
  unint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint8x8_t v151;
  unint64_t v152;
  unint64_t v153;
  int8x8_t v154;
  uint8x8_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  int8x8_t v169;
  unint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  uint64_t v179;
  uint8x8_t v180;
  unint64_t v181;
  unint64_t v182;
  int8x8_t v183;
  uint8x8_t v184;
  unint64_t v185;
  unint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  unint64_t v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  int v198;
  uint64_t v199;
  uint64_t v200;
  int8x8_t v201;
  unint64_t v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  unint64_t v206;
  unint64_t v207;
  uint64_t v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t v211;
  uint8x8_t v212;
  unint64_t v213;
  unint64_t v214;
  int8x8_t v215;
  uint8x8_t v216;
  unint64_t v217;
  unint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t v222;
  unint64_t v223;
  uint64_t v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  const __CFString *v234;
  __CFDictionary *v235;
  int v236;
  uint64_t v237;
  unint64_t v238;
  unint64_t v239;
  unint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  int8x8_t v245;
  unint64_t v246;
  uint64_t v247;
  unint64_t v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  unint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint8x8_t v255;
  unint64_t v256;
  unint64_t v257;
  int8x8_t v258;
  uint8x8_t v259;
  unint64_t v260;
  uint64_t v261;
  unint64_t v262;
  uint64_t v263;
  unint64_t v264;
  unint64_t v265;
  uint64_t v266;
  unint64_t v267;
  uint64_t v268;
  uint64_t v269;
  unint64_t v270;
  unint64_t v271;
  unint64_t v272;
  uint64_t v273;
  uint64_t v274;
  unint64_t v275;
  unint64_t v276;
  unint64_t v277;
  unint64_t v278;
  unint64_t v279;
  unint64_t v280;
  unint64_t v281;
  unint64_t v282;
  uint64_t v283;
  int8x8_t v284;
  unint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  unint64_t v290;
  unint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint8x8_t v294;
  unint64_t v295;
  unint64_t v296;
  int8x8_t v297;
  uint8x8_t v298;
  unint64_t v299;
  uint64_t v300;
  unint64_t v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t v304;
  unint64_t v305;
  uint64_t v306;
  unint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  unint64_t v311;
  unint64_t v312;
  unint64_t v313;
  unint64_t v314;
  unint64_t v315;
  unint64_t v316;
  uint64_t v317;
  uint64_t v318;
  unint64_t v319;
  uint64_t v320;
  unint64_t v321;
  unint64_t v322;
  unint64_t v323;
  uint64_t v324;
  unint64_t v325;
  uint64_t v326;
  int8x8_t v327;
  unint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  unint64_t v332;
  unint64_t v333;
  uint64_t v334;
  unint64_t v335;
  unint64_t v336;
  uint64_t v337;
  uint8x8_t v338;
  unint64_t v339;
  unint64_t v340;
  int8x8_t v341;
  uint8x8_t v342;
  unint64_t v343;
  unint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  unint64_t v348;
  unint64_t v349;
  uint64_t v350;
  unint64_t v351;
  uint64_t v352;
  unint64_t v353;
  uint64_t v354;
  int8x8_t v355;
  unint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  unint64_t v361;
  unint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint8x8_t v365;
  unint64_t v366;
  unint64_t v367;
  int8x8_t v368;
  uint8x8_t v369;
  unint64_t v370;
  uint64_t v371;
  unint64_t v372;
  uint64_t v373;
  uint64_t v374;
  unint64_t v375;
  unint64_t v376;
  uint64_t v377;
  unint64_t v378;
  uint64_t v379;
  uint64_t v380;
  unint64_t v381;
  unint64_t v382;
  unint64_t v383;
  unint64_t v384;
  uint64_t v385;
  int8x8_t v386;
  unint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  unint64_t v392;
  unint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint8x8_t v396;
  unint64_t v397;
  unint64_t v398;
  int8x8_t v399;
  uint8x8_t v400;
  unint64_t v401;
  uint64_t v402;
  unint64_t v403;
  uint64_t v404;
  unint64_t v405;
  unint64_t v406;
  uint64_t v407;
  unint64_t v408;
  uint64_t v409;
  int8x8_t v410;
  uint8x8_t v411;
  unint64_t v412;
  unint64_t v413;
  unint64_t v414;
  unint64_t v415;
  int8x8_t v416;
  uint8x8_t v417;
  unint64_t v418;
  uint64_t v419;
  unint64_t v420;
  unint64_t v421;
  uint64_t v422;
  const void *v423;
  const void *v424;
  IOSurfaceRef v425;
  uint64_t v427;
  uint64_t v428;
  unint64_t v429;
  uint64_t v430;
  unint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  unint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  unint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  unint64_t v443;
  unint64_t v444;
  unint64_t v445;
  uint64_t v446;
  unint64_t v447;
  uint64_t v448;
  unint64_t v449;
  uint64_t v450;
  uint64_t v451;
  CFArrayRef v452;
  uint64_t v453;
  unint64_t v454;
  uint64_t v455;
  int8x8_t v456;
  uint8x8_t v457;
  unint64_t v458;
  unint64_t v459;
  unint64_t v460;
  int8x8_t v461;
  uint8x8_t v462;
  unint64_t v463;
  uint64_t v464;
  uint64_t v465;
  unint64_t v466;
  unint64_t v467;
  unint64_t v468;
  uint64_t v469;
  uint64_t v470;
  unint64_t v471;
  uint64_t v472;
  unint64_t v473;
  uint64_t v474;
  uint64_t v475;
  unint64_t v476;
  uint64_t v477;
  unint64_t v478;
  unint64_t v479;
  unint64_t v480;
  uint64_t v481;
  uint64_t v482;
  unint64_t v483;
  CFArrayRef v484;
  uint64_t v485;
  uint64_t v486;
  unint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  void *values;
  CFDictionaryRef plane_dict;
  CFDictionaryRef v493;
  uint64_t v494;

  LODWORD(v12) = a2;
  v494 = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8FD0], a1);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8EB0], v12);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8EF8], a3);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8E40], a4);
  if (a3 > 1534621231)
  {
    if (a3 <= 1919365991)
    {
      if (a3 <= 1882469427)
      {
        if (a3 <= 1647534391)
        {
          if (a3 <= 1534621235)
          {
            if (a3 != 1534621232)
            {
              if (a3 != 1534621234)
                goto LABEL_396;
              goto LABEL_267;
            }
            goto LABEL_182;
          }
          if (a3 == 1534621236)
          {
LABEL_266:
            v489 = 0;
            v490 = 0;
            v12 = v12;
            values = create_htpc_plane_dict(a1, v12, 2, 0, (unint64_t *)&v490);
            v197 = v490;
            v195 = a1;
LABEL_268:
            v196 = v12;
            goto LABEL_269;
          }
          if (a3 != 1599554369)
          {
            if (a3 != 1599554371)
              goto LABEL_396;
            v27 = a1;
            v28 = a7[1];
            v29 = v28 - 1 + 4 * a1;
            v30 = v29 / v28 * v28;
            v31 = v29 & -v28;
            if ((v28 & (v28 - 1)) != 0)
              v32 = v30;
            else
              v32 = v31;
            v33 = v12;
            v12 = (v32 * v12 + 4095) & 0xFFFFFFFFFFFFF000;
            values = create_plane_dict(v27, v33, v32, 0, v12, 1, 4);
            plane_dict = create_plane_dict(v27, v33, v32, v12, v12, 1, 4);
            v34 = CFArrayCreate(0, (const void **)&values, 2, MEMORY[0x24BDBD690]);
            CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8F88], v34);
            CFRelease(v34);
            CFRelease(plane_dict);
            CFRelease(values);
            LODWORD(v12) = 2 * v12;
LABEL_350:
            v109 = (v14 >> 1) & 1;
            goto LABEL_351;
          }
          v427 = a1;
          v428 = a7[1];
          v429 = v428 - 1 + 4 * a1;
          v430 = v429 / v428 * v428;
          v431 = v429 & -v428;
          if ((v428 & (v428 - 1)) != 0)
            v432 = v430;
          else
            v432 = v431;
          v433 = v12;
          v12 = (v432 * v12 + 4095) & 0xFFFFFFFFFFFFF000;
          values = create_plane_dict(v427, v433, v432, 0, v12, 1, 4);
          v434 = a7[1];
          v435 = v434 - 1 + v427;
          v436 = v435 / v434 * v434;
          v437 = v435 & -v434;
          if ((v434 & (v434 - 1)) != 0)
            v438 = v436;
          else
            v438 = v437;
          v439 = (v438 * v433 + 4095) & 0xFFFFFFFFFFFFF000;
          v440 = v427;
          v441 = v433;
LABEL_414:
          plane_dict = create_plane_dict(v440, v441, v438, v12, v439, 1, 1);
          v484 = CFArrayCreate(0, (const void **)&values, 2, MEMORY[0x24BDBD690]);
          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8F88], v484);
          CFRelease(v484);
          CFRelease(plane_dict);
          CFRelease(values);
          LODWORD(v12) = v439 + v12;
          goto LABEL_350;
        }
        if (a3 > 1815162993)
        {
          if (a3 == 1815162994)
            goto LABEL_235;
          if (a3 != 1882468912)
          {
            if (a3 != 1882468914)
              goto LABEL_396;
            goto LABEL_81;
          }
LABEL_165:
          v166 = (v12 + 1) >> 1;
          v167 = rowbytes_for_packed_format(a1, a3);
          v168 = a7[1];
          v169 = (int8x8_t)a7[2];
          v170 = v168 - 1 + v167;
          v171 = v170 / v168 * v168;
          v172 = v170 & -v168;
          if ((v168 & (v168 - 1)) != 0)
            v173 = v171;
          else
            v173 = v172;
          v174 = *(_QWORD *)&v169 + v12 - 1;
          v175 = v174 / *(_QWORD *)&v169 * *(_QWORD *)&v169;
          v176 = -*(_QWORD *)&v169;
          v177 = v166 + *(_QWORD *)&v169 - 1;
          v178 = v177 / *(_QWORD *)&v169 * *(_QWORD *)&v169;
          v179 = -*(_QWORD *)&v169;
          v180 = (uint8x8_t)vcnt_s8(v169);
          v180.i16[0] = vaddlv_u8(v180);
          v181 = v180.u32[0];
          v182 = v174 & v176;
          if (v180.u32[0] > 1uLL)
            v182 = v175;
          v183 = (int8x8_t)a7[3];
          v184 = (uint8x8_t)vcnt_s8(v183);
          v184.i16[0] = vaddlv_u8(v184);
          v185 = *(_QWORD *)&v183 - 1 + v182 * v173;
          v186 = v185 & -*(_QWORD *)&v183;
          v187 = v185 / *(_QWORD *)&v183 * *(_QWORD *)&v183;
          if (v184.u32[0] <= 1uLL)
            v188 = v186;
          else
            v188 = v187;
          v189 = v12;
          v190 = v177 & v179;
          if (v181 > 1)
            v190 = v178;
          v191 = *(_QWORD *)&v183 - 1 + v190 * v173;
          v192 = v191 / *(_QWORD *)&v183 * *(_QWORD *)&v183;
          v193 = v191 & -*(_QWORD *)&v183;
          if (v184.u32[0] <= 1uLL)
            v194 = v193;
          else
            v194 = v192;
          v489 = v194;
          v490 = v188;
          values = create_plane_dict(a1, v189, v173, 0, v188, 3, 4);
          v68 = (a1 + 1) >> 1;
          v69 = v166;
          v70 = v173;
          v71 = v188;
          v72 = v194;
          goto LABEL_309;
        }
        if (a3 == 1647534392)
        {
          v453 = a7[1];
          v454 = v453 - 1 + 4 * a1;
          if ((v453 & (v453 - 1)) != 0)
            v455 = v454 / v453 * v453;
          else
            v455 = v454 & -v453;
          v470 = v12;
          v471 = a7[2];
          v472 = v12 - 1;
          v473 = v471 + v472;
          if ((v471 & (v471 - 1)) != 0)
            v474 = v473 / v471 * v471;
          else
            v474 = v473 & -(uint64_t)v471;
          v475 = a7[3];
          v476 = v475 - 1 + v474 * v455;
          if ((v475 & (v475 - 1)) != 0)
            v12 = v476 / v475 * v475;
          else
            v12 = v476 & -v475;
          values = create_plane_dict(a1, v470, v455, 0, v12, 1, 4);
          v477 = a7[1];
          v478 = v477 - 1 + a1;
          if ((v477 & (v477 - 1)) != 0)
            v438 = v478 / v477 * v477;
          else
            v438 = v478 & -v477;
          v479 = a7[2];
          v480 = v479 + v472;
          if ((v479 & (v479 - 1)) != 0)
            v481 = v480 / v479 * v479;
          else
            v481 = v480 & -(uint64_t)v479;
          v482 = a7[3];
          v483 = v482 - 1 + v481 * v438;
          if ((v482 & (v482 - 1)) != 0)
            v439 = v483 / v482 * v482;
          else
            v439 = v483 & -v482;
          v440 = a1;
          v441 = v470;
          goto LABEL_414;
        }
        if (a3 != 1714696752)
          goto LABEL_396;
LABEL_208:
        v237 = (v12 + 1) >> 1;
        v238 = a7[1];
        v239 = v238 - 1 + a1;
        v240 = v238 - 1 + ((a1 + 1) >> 1);
        if ((v238 & (v238 - 1)) != 0)
        {
          v242 = v239 / v238 * v238;
          v243 = v240 / v238 * v238;
        }
        else
        {
          v241 = -(uint64_t)v238;
          v242 = v239 & v241;
          v243 = v240 & v241;
        }
        v456 = (int8x8_t)a7[2];
        v457 = (uint8x8_t)vcnt_s8(v456);
        v457.i16[0] = vaddlv_u8(v457);
        v458 = v457.u32[0];
        v459 = *(_QWORD *)&v456 + v12 - 1;
        if (v457.u32[0] > 1uLL)
          v460 = v459 / *(_QWORD *)&v456 * *(_QWORD *)&v456;
        else
          v460 = v459 & -*(_QWORD *)&v456;
        v461 = (int8x8_t)a7[3];
        v462 = (uint8x8_t)vcnt_s8(v461);
        v462.i16[0] = vaddlv_u8(v462);
        v463 = *(_QWORD *)&v461 - 1 + v460 * v242;
        if (v462.u32[0] > 1uLL)
          v464 = v463 / *(_QWORD *)&v461 * *(_QWORD *)&v461;
        else
          v464 = v463 & -*(_QWORD *)&v461;
        v465 = v12;
        v490 = v464;
        v466 = v237 + *(_QWORD *)&v456 - 1;
        if (v458 > 1)
          v467 = v466 / *(_QWORD *)&v456 * *(_QWORD *)&v456;
        else
          v467 = v466 & -*(_QWORD *)&v456;
        v468 = *(_QWORD *)&v461 - 1 + v467 * v243;
        if (v462.u32[0] > 1uLL)
          v469 = v468 / *(_QWORD *)&v461 * *(_QWORD *)&v461;
        else
          v469 = v468 & -*(_QWORD *)&v461;
        v489 = v469;
        values = create_plane_dict(a1, v465, v242, 0, v464, 1, 1);
        plane_dict = create_plane_dict((a1 + 1) >> 1, v237, v243, v464, v469, 1, 1);
        v493 = create_plane_dict((a1 + 1) >> 1, v237, v243, v469 + v464, v469, 1, 1);
        v12 = (unint64_t)CFArrayCreate(0, (const void **)&values, 3, MEMORY[0x24BDBD690]);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8F88], (const void *)v12);
        CFRelease((CFTypeRef)v12);
        CFRelease(v493);
        CFRelease(plane_dict);
        CFRelease(values);
        LODWORD(v12) = v490 + 2 * v489;
        goto LABEL_350;
      }
      if (a3 <= 1886676529)
      {
        if (a3 <= 1885745713)
        {
          if (a3 != 1882469428)
          {
            if (a3 != 1885745712)
              goto LABEL_396;
            goto LABEL_165;
          }
        }
        else
        {
          if (a3 == 1885745714)
          {
LABEL_81:
            v73 = rowbytes_for_packed_format(a1, a3);
            v74 = a7[1];
            v75 = (int8x8_t)a7[2];
            v76 = v74 - 1 + v73;
            v77 = v76 / v74 * v74;
            v78 = v76 & -v74;
            if ((v74 & (v74 - 1)) != 0)
              v79 = v77;
            else
              v79 = v78;
            v80 = v12;
            v81 = *(_QWORD *)&v75 + v12 - 1;
            v82 = v81 / *(_QWORD *)&v75 * *(_QWORD *)&v75;
            v83 = -*(_QWORD *)&v75;
            v84 = -*(_QWORD *)&v75;
            v85 = (uint8x8_t)vcnt_s8(v75);
            v85.i16[0] = vaddlv_u8(v85);
            v86 = v85.u32[0];
            v87 = v81 & v83;
            if (v85.u32[0] > 1uLL)
              v87 = v82;
            v88 = (int8x8_t)a7[3];
            v89 = (uint8x8_t)vcnt_s8(v88);
            v89.i16[0] = vaddlv_u8(v89);
            v90 = *(_QWORD *)&v88 - 1 + v87 * v79;
            v91 = v90 / *(_QWORD *)&v88 * *(_QWORD *)&v88;
            v92 = v90 & -*(_QWORD *)&v88;
            if (v89.u32[0] <= 1uLL)
              v93 = v92;
            else
              v93 = v91;
            v94 = v81 & v84;
            if (v86 > 1)
              v94 = v82;
            v95 = *(_QWORD *)&v88 - 1 + v94 * v79;
            v96 = v95 / *(_QWORD *)&v88 * *(_QWORD *)&v88;
            v97 = v95 & -*(_QWORD *)&v88;
            if (v89.u32[0] <= 1uLL)
              v98 = v97;
            else
              v98 = v96;
            v489 = v98;
            v490 = v93;
            values = create_plane_dict(a1, v80, v79, 0, v93, 3, 4);
            v68 = (a1 + 1) >> 1;
            v69 = v80;
            v70 = v79;
            v71 = v93;
            v72 = v98;
LABEL_309:
            v227 = 3;
            v228 = 8;
            goto LABEL_349;
          }
          if (a3 != 1885746228)
          {
            if (a3 != 1886676528)
              goto LABEL_396;
            goto LABEL_281;
          }
        }
        v353 = rowbytes_for_packed_format(a1, a3);
        v354 = a7[1];
        v355 = (int8x8_t)a7[2];
        v356 = v354 - 1 + v353;
        v357 = v356 / v354 * v354;
        v358 = v356 & -v354;
        if ((v354 & (v354 - 1)) != 0)
          v359 = v357;
        else
          v359 = v358;
        v360 = v12;
        v361 = *(_QWORD *)&v355 + v12 - 1;
        v362 = v361 / *(_QWORD *)&v355 * *(_QWORD *)&v355;
        v363 = -*(_QWORD *)&v355;
        v364 = -*(_QWORD *)&v355;
        v365 = (uint8x8_t)vcnt_s8(v355);
        v365.i16[0] = vaddlv_u8(v365);
        v366 = v365.u32[0];
        v367 = v361 & v363;
        if (v365.u32[0] > 1uLL)
          v367 = v362;
        v368 = (int8x8_t)a7[3];
        v369 = (uint8x8_t)vcnt_s8(v368);
        v369.i16[0] = vaddlv_u8(v369);
        v370 = *(_QWORD *)&v368 - 1 + v367 * v359;
        v371 = v370 / *(_QWORD *)&v368 * *(_QWORD *)&v368;
        v372 = v370 & -*(_QWORD *)&v368;
        if (v369.u32[0] <= 1uLL)
          v373 = v372;
        else
          v373 = v371;
        v374 = 2 * v359;
        v375 = v361 & v364;
        if (v366 > 1)
          v375 = v362;
        v376 = *(_QWORD *)&v368 - 1 + v375 * v374;
        v377 = v376 / *(_QWORD *)&v368 * *(_QWORD *)&v368;
        v378 = v376 & -*(_QWORD *)&v368;
        if (v369.u32[0] <= 1uLL)
          v379 = v378;
        else
          v379 = v377;
        v489 = v379;
        v490 = v373;
        values = create_plane_dict(a1, v360, v359, 0, v373, 3, 4);
        v68 = a1;
        v69 = v360;
        v70 = v374;
        v71 = v373;
        v72 = v379;
        goto LABEL_309;
      }
      if (a3 <= 1886680623)
      {
        if (a3 != 1886676530)
        {
          v101 = 26164;
          goto LABEL_248;
        }
      }
      else
      {
        if (a3 == 1886680624)
        {
LABEL_281:
          v324 = (v12 + 1) >> 1;
          v325 = rowbytes_for_packed_format(a1, a3);
          v326 = a7[1];
          v327 = (int8x8_t)a7[2];
          v328 = v326 - 1 + v325;
          v329 = v328 / v326 * v326;
          v330 = v328 & -v326;
          if ((v326 & (v326 - 1)) != 0)
            v331 = v329;
          else
            v331 = v330;
          v332 = *(_QWORD *)&v327 + v12 - 1;
          v333 = v332 / *(_QWORD *)&v327 * *(_QWORD *)&v327;
          v334 = -*(_QWORD *)&v327;
          v335 = v324 + *(_QWORD *)&v327 - 1;
          v336 = v335 / *(_QWORD *)&v327 * *(_QWORD *)&v327;
          v337 = -*(_QWORD *)&v327;
          v338 = (uint8x8_t)vcnt_s8(v327);
          v338.i16[0] = vaddlv_u8(v338);
          v339 = v338.u32[0];
          v340 = v332 & v334;
          if (v338.u32[0] > 1uLL)
            v340 = v333;
          v341 = (int8x8_t)a7[3];
          v342 = (uint8x8_t)vcnt_s8(v341);
          v342.i16[0] = vaddlv_u8(v342);
          v343 = *(_QWORD *)&v341 - 1 + v340 * v331;
          v344 = v343 & -*(_QWORD *)&v341;
          v345 = v343 / *(_QWORD *)&v341 * *(_QWORD *)&v341;
          if (v342.u32[0] <= 1uLL)
            v346 = v344;
          else
            v346 = v345;
          v347 = v12;
          v348 = v335 & v337;
          if (v339 > 1)
            v348 = v336;
          v349 = *(_QWORD *)&v341 - 1 + v348 * v331;
          v350 = v349 / *(_QWORD *)&v341 * *(_QWORD *)&v341;
          v351 = v349 & -*(_QWORD *)&v341;
          if (v342.u32[0] <= 1uLL)
            v352 = v351;
          else
            v352 = v350;
          v489 = v352;
          v490 = v346;
          values = create_plane_dict(a1, v347, v331, 0, v346, 5, 8);
          v68 = (a1 + 1) >> 1;
          v69 = v324;
          v70 = v331;
          v71 = v346;
          v72 = v352;
LABEL_333:
          v227 = 5;
          v228 = 16;
          goto LABEL_349;
        }
        if (a3 != 1886680626)
        {
          v101 = 30260;
LABEL_248:
          if (a3 != (v101 | 0x70740000))
            goto LABEL_396;
          v282 = rowbytes_for_packed_format(a1, a3);
          v283 = a7[1];
          v284 = (int8x8_t)a7[2];
          v285 = v283 - 1 + v282;
          v286 = v285 / v283 * v283;
          v287 = v285 & -v283;
          if ((v283 & (v283 - 1)) != 0)
            v288 = v286;
          else
            v288 = v287;
          v289 = v12;
          v290 = *(_QWORD *)&v284 + v12 - 1;
          v291 = v290 / *(_QWORD *)&v284 * *(_QWORD *)&v284;
          v292 = -*(_QWORD *)&v284;
          v293 = -*(_QWORD *)&v284;
          v294 = (uint8x8_t)vcnt_s8(v284);
          v294.i16[0] = vaddlv_u8(v294);
          v295 = v294.u32[0];
          v296 = v290 & v292;
          if (v294.u32[0] > 1uLL)
            v296 = v291;
          v297 = (int8x8_t)a7[3];
          v298 = (uint8x8_t)vcnt_s8(v297);
          v298.i16[0] = vaddlv_u8(v298);
          v299 = *(_QWORD *)&v297 - 1 + v296 * v288;
          v300 = v299 / *(_QWORD *)&v297 * *(_QWORD *)&v297;
          v301 = v299 & -*(_QWORD *)&v297;
          if (v298.u32[0] <= 1uLL)
            v302 = v301;
          else
            v302 = v300;
          v303 = 2 * v288;
          v304 = v290 & v293;
          if (v295 > 1)
            v304 = v291;
          v305 = *(_QWORD *)&v297 - 1 + v304 * v303;
          v306 = v305 / *(_QWORD *)&v297 * *(_QWORD *)&v297;
          v307 = v305 & -*(_QWORD *)&v297;
          if (v298.u32[0] <= 1uLL)
            v308 = v307;
          else
            v308 = v306;
          v489 = v308;
          v490 = v302;
          values = create_plane_dict(a1, v289, v288, 0, v302, 5, 8);
          v68 = a1;
          v69 = v289;
          v70 = v303;
          v71 = v302;
          v72 = v308;
          goto LABEL_333;
        }
      }
      v384 = rowbytes_for_packed_format(a1, a3);
      v385 = a7[1];
      v386 = (int8x8_t)a7[2];
      v387 = v385 - 1 + v384;
      v388 = v387 / v385 * v385;
      v389 = v387 & -v385;
      if ((v385 & (v385 - 1)) != 0)
        v390 = v388;
      else
        v390 = v389;
      v391 = v12;
      v392 = *(_QWORD *)&v386 + v12 - 1;
      v393 = v392 / *(_QWORD *)&v386 * *(_QWORD *)&v386;
      v394 = -*(_QWORD *)&v386;
      v395 = -*(_QWORD *)&v386;
      v396 = (uint8x8_t)vcnt_s8(v386);
      v396.i16[0] = vaddlv_u8(v396);
      v397 = v396.u32[0];
      v398 = v392 & v394;
      if (v396.u32[0] > 1uLL)
        v398 = v393;
      v399 = (int8x8_t)a7[3];
      v400 = (uint8x8_t)vcnt_s8(v399);
      v400.i16[0] = vaddlv_u8(v400);
      v401 = *(_QWORD *)&v399 - 1 + v398 * v390;
      v402 = v401 / *(_QWORD *)&v399 * *(_QWORD *)&v399;
      v403 = v401 & -*(_QWORD *)&v399;
      if (v400.u32[0] <= 1uLL)
        v404 = v403;
      else
        v404 = v402;
      v405 = v392 & v395;
      if (v397 > 1)
        v405 = v393;
      v406 = *(_QWORD *)&v399 - 1 + v405 * v390;
      v407 = v406 / *(_QWORD *)&v399 * *(_QWORD *)&v399;
      v408 = v406 & -*(_QWORD *)&v399;
      if (v400.u32[0] <= 1uLL)
        v409 = v408;
      else
        v409 = v407;
      v489 = v409;
      v490 = v404;
      values = create_plane_dict(a1, v391, v390, 0, v404, 5, 8);
      v68 = (a1 + 1) >> 1;
      v69 = v391;
      v70 = v390;
      v71 = v404;
      v72 = v409;
      goto LABEL_333;
    }
    if (a3 <= 2016686641)
    {
      if (a3 <= 1953903153)
      {
        if (a3 <= 1952854577)
        {
          if (a3 == 1919365992)
          {
            v446 = a7[1];
            v447 = v446 - 1 + 2 * a1;
            v448 = v447 / v446 * v446;
            v449 = v447 & -v446;
            if ((v446 & (v446 - 1)) != 0)
              v450 = v448;
            else
              v450 = v449;
            v451 = v12;
            v12 = v450 * v12;
            values = create_plane_dict(a1, v451, v450, 0, v12, 1, 2);
            plane_dict = create_plane_dict(a1, v451, v450, v12, v12, 1, 2);
            v493 = create_plane_dict(a1, v451, v450, 2 * v12, v12, 1, 2);
            v452 = CFArrayCreate(0, (const void **)&values, 3, MEMORY[0x24BDBD690]);
            CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8F88], v452);
            CFRelease(v452);
            CFRelease(values);
            CFRelease(plane_dict);
            CFRelease(v493);
            v109 = (v14 >> 1) & 1;
            LODWORD(v12) = 3 * v12;
            goto LABEL_351;
          }
          v35 = 1952854576;
LABEL_132:
          if (a3 != v35)
            goto LABEL_396;
          goto LABEL_133;
        }
        if (a3 != 1952854578)
        {
          if (a3 != 1952855092)
          {
            v35 = 1953903152;
            goto LABEL_132;
          }
LABEL_275:
          v314 = a7[1];
          v315 = v314 - 1 + 2 * a1;
          v316 = v314 - 1 + 4 * a1;
          if ((v314 & (v314 - 1)) != 0)
          {
            v318 = v315 / v314 * v314;
            v319 = v316 / v314 * v314;
          }
          else
          {
            v317 = -(uint64_t)v314;
            v318 = v315 & v317;
            v319 = v316 & v317;
          }
          v410 = (int8x8_t)a7[2];
          v411 = (uint8x8_t)vcnt_s8(v410);
          v411.i16[0] = vaddlv_u8(v411);
          v412 = v411.u32[0];
          v413 = *(_QWORD *)&v410 + v12 - 1;
          v414 = v413 / *(_QWORD *)&v410;
          if (v411.u32[0] > 1uLL)
            v415 = v414 * *(_QWORD *)&v410;
          else
            v415 = v413 & -*(_QWORD *)&v410;
          v416 = (int8x8_t)a7[3];
          v417 = (uint8x8_t)vcnt_s8(v416);
          v417.i16[0] = vaddlv_u8(v417);
          v418 = *(_QWORD *)&v416 - 1 + v415 * v318;
          if (v417.u32[0] > 1uLL)
            v419 = v418 / *(_QWORD *)&v416 * *(_QWORD *)&v416;
          else
            v419 = v418 & -*(_QWORD *)&v416;
          v490 = v419;
          if (v412 > 1)
            v420 = v414 * *(_QWORD *)&v410;
          else
            v420 = v413 & -*(_QWORD *)&v410;
          v421 = *(_QWORD *)&v416 - 1 + v420 * v319;
          if (v417.u32[0] > 1uLL)
            v422 = v421 / *(_QWORD *)&v416 * *(_QWORD *)&v416;
          else
            v422 = v421 & -*(_QWORD *)&v416;
          v489 = v422;
          values = create_plane_dict(a1, v12, v318, 0, v419, 1, 2);
          v68 = a1;
          v69 = v12;
          v70 = v319;
          v71 = v419;
          v72 = v422;
LABEL_348:
          v227 = 1;
          v228 = 4;
          goto LABEL_349;
        }
LABEL_218:
        v244 = a7[1];
        v245 = (int8x8_t)a7[2];
        v246 = v244 - 1 + 2 * a1;
        v247 = v246 / v244 * v244;
        v248 = v246 & -v244;
        if ((v244 & (v244 - 1)) != 0)
          v249 = v247;
        else
          v249 = v248;
        v250 = v12;
        v251 = *(_QWORD *)&v245 + v12 - 1;
        v252 = v251 / *(_QWORD *)&v245 * *(_QWORD *)&v245;
        v253 = -*(_QWORD *)&v245;
        v254 = -*(_QWORD *)&v245;
        v255 = (uint8x8_t)vcnt_s8(v245);
        v255.i16[0] = vaddlv_u8(v255);
        v256 = v255.u32[0];
        v257 = v251 & v253;
        if (v255.u32[0] > 1uLL)
          v257 = v252;
        v258 = (int8x8_t)a7[3];
        v259 = (uint8x8_t)vcnt_s8(v258);
        v259.i16[0] = vaddlv_u8(v259);
        v260 = *(_QWORD *)&v258 - 1 + v257 * v249;
        v261 = v260 / *(_QWORD *)&v258 * *(_QWORD *)&v258;
        v262 = v260 & -*(_QWORD *)&v258;
        if (v259.u32[0] <= 1uLL)
          v263 = v262;
        else
          v263 = v261;
        v264 = v251 & v254;
        if (v256 > 1)
          v264 = v252;
        v265 = *(_QWORD *)&v258 - 1 + v264 * v249;
        v266 = v265 / *(_QWORD *)&v258 * *(_QWORD *)&v258;
        v267 = v265 & -*(_QWORD *)&v258;
        if (v259.u32[0] <= 1uLL)
          v268 = v267;
        else
          v268 = v266;
        v489 = v268;
        v490 = v263;
        values = create_plane_dict(a1, v250, v249, 0, v263, 1, 2);
        v68 = (a1 + 1) >> 1;
        v69 = v250;
        v70 = v249;
        v71 = v263;
        v72 = v268;
        goto LABEL_348;
      }
      if (a3 > 1999843441)
      {
        if (a3 == 1999843442)
          goto LABEL_235;
        if (a3 == 1999908961)
        {
LABEL_277:
          v320 = a7[1];
          v321 = v320 - 1 + 8 * a1;
          v322 = v321 / v320 * v320;
          v323 = v321 & -v320;
          if ((v320 & (v320 - 1)) != 0)
            v233 = v322;
          else
            v233 = v323;
          v234 = (const __CFString *)*MEMORY[0x24BDD8E30];
          v235 = Mutable;
          v236 = 8;
          goto LABEL_240;
        }
        v35 = 2016686640;
        goto LABEL_132;
      }
      if (a3 == 1953903154)
        goto LABEL_218;
      v198 = 1953903668;
LABEL_216:
      if (a3 != v198)
        goto LABEL_396;
      goto LABEL_275;
    }
    if (a3 > 2019963955)
    {
      if (a3 > 2033463855)
      {
        if (a3 != 2033463856)
        {
          if (a3 == 2037741158)
            goto LABEL_202;
          v100 = 2037741171;
          goto LABEL_119;
        }
        goto LABEL_208;
      }
      if (a3 == 2019963956)
        goto LABEL_275;
      if (a3 != 2019964016)
        goto LABEL_396;
    }
    else
    {
      if (a3 <= 2016687215)
      {
        if (a3 == 2016686642)
          goto LABEL_218;
        v198 = 2016687156;
        goto LABEL_216;
      }
      if (a3 != 2016687216)
      {
        if (a3 == 2019963440)
        {
LABEL_133:
          v111 = (v12 + 1) >> 1;
          v112 = a7[1];
          v113 = (int8x8_t)a7[2];
          v114 = v112 - 1 + 2 * a1;
          v115 = v114 / v112 * v112;
          v116 = v114 & -v112;
          if ((v112 & (v112 - 1)) != 0)
            v117 = v115;
          else
            v117 = v116;
          v118 = *(_QWORD *)&v113 + v12 - 1;
          v119 = v118 / *(_QWORD *)&v113 * *(_QWORD *)&v113;
          v120 = -*(_QWORD *)&v113;
          v121 = v111 + *(_QWORD *)&v113 - 1;
          v122 = v121 / *(_QWORD *)&v113 * *(_QWORD *)&v113;
          v123 = -*(_QWORD *)&v113;
          v124 = (uint8x8_t)vcnt_s8(v113);
          v124.i16[0] = vaddlv_u8(v124);
          v125 = v124.u32[0];
          v126 = v118 & v120;
          if (v124.u32[0] > 1uLL)
            v126 = v119;
          v127 = (int8x8_t)a7[3];
          v128 = (uint8x8_t)vcnt_s8(v127);
          v128.i16[0] = vaddlv_u8(v128);
          v129 = *(_QWORD *)&v127 - 1 + v126 * v117;
          v130 = v129 & -*(_QWORD *)&v127;
          v131 = v129 / *(_QWORD *)&v127 * *(_QWORD *)&v127;
          if (v128.u32[0] <= 1uLL)
            v132 = v130;
          else
            v132 = v131;
          v133 = v12;
          v134 = v121 & v123;
          if (v125 > 1)
            v134 = v122;
          v135 = *(_QWORD *)&v127 - 1 + v134 * v117;
          v136 = v135 / *(_QWORD *)&v127 * *(_QWORD *)&v127;
          v137 = v135 & -*(_QWORD *)&v127;
          if (v128.u32[0] <= 1uLL)
            v138 = v137;
          else
            v138 = v136;
          v489 = v138;
          v490 = v132;
          values = create_plane_dict(a1, v133, v117, 0, v132, 1, 2);
          v68 = (a1 + 1) >> 1;
          v69 = v111;
          v70 = v117;
          v71 = v132;
          v72 = v138;
          goto LABEL_348;
        }
        if (a3 != 2019963442)
          goto LABEL_396;
        goto LABEL_218;
      }
    }
    v310 = a7[1];
    v311 = v310 - 1 + 4 * a1;
    v312 = v311 / v310 * v310;
    v313 = v311 & -v310;
    if ((v310 & (v310 - 1)) != 0)
      v233 = v312;
    else
      v233 = v313;
    goto LABEL_239;
  }
  if (a3 > 1279340599)
  {
    if (a3 <= 1530426931)
    {
      if (a3 <= 1530422831)
      {
        if (a3 <= 1380401728)
        {
          if (a3 == 1279340600)
            goto LABEL_202;
          v110 = 1378955371;
LABEL_234:
          if (a3 != v110)
            goto LABEL_396;
          goto LABEL_235;
        }
        if (a3 != 1380401729)
        {
          if (a3 == 1380410945)
          {
            v442 = a7[1];
            v443 = v442 - 1 + 16 * a1;
            v444 = v443 / v442 * v442;
            v445 = v443 & -v442;
            if ((v442 & (v442 - 1)) != 0)
              v233 = v444;
            else
              v233 = v445;
            v234 = (const __CFString *)*MEMORY[0x24BDD8E30];
            v235 = Mutable;
            v236 = 16;
            goto LABEL_240;
          }
          if (a3 != 1380411457)
            goto LABEL_396;
          goto LABEL_277;
        }
LABEL_235:
        v269 = a7[1];
        v270 = v269 - 1 + 4 * a1;
        v271 = v270 / v269 * v269;
        v272 = v270 & -v269;
        if ((v269 & (v269 - 1)) != 0)
          v39 = v271;
        else
          v39 = v272;
LABEL_238:
        v233 = (v39 + 255) & 0xFFFFFFFFFFFFFF00;
LABEL_239:
        v234 = (const __CFString *)*MEMORY[0x24BDD8E30];
        v235 = Mutable;
        v236 = 4;
LABEL_240:
        CA_CFDictionarySetInt(v235, v234, v236);
        CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8E38], v233);
        v273 = a7[2];
        v274 = a7[3];
        v275 = v273 - 1 + v12;
        v276 = v275 / v273 * v273;
        v277 = v275 & -v273;
        if ((v273 & (v273 - 1)) != 0)
          v278 = v276;
        else
          v278 = v277;
        v279 = v274 - 1 + v278 * v233;
        v280 = v279 / v274 * v274;
        v281 = v279 & -v274;
        if ((v274 & (v274 - 1)) != 0)
          LODWORD(v12) = v280;
        else
          LODWORD(v12) = v281;
        goto LABEL_350;
      }
      if (a3 <= 1530422835)
      {
        if (a3 != 1530422832)
        {
          v99 = 26162;
          goto LABEL_212;
        }
LABEL_312:
        v489 = 0;
        v490 = 0;
        values = create_htpc_plane_dict(a1, v12, 1, 0, (unint64_t *)&v490);
        v195 = (a1 + 1) >> 1;
        v196 = (v12 + 1) >> 1;
        v197 = v490;
        goto LABEL_313;
      }
      if (a3 != 1530422836)
      {
        if (a3 != 1530426928)
        {
          v99 = 30258;
LABEL_212:
          if (a3 != (v99 | 0x5B380000))
            goto LABEL_396;
          v489 = 0;
          v490 = 0;
          v12 = v12;
          values = create_htpc_plane_dict(a1, v12, 1, 0, (unint64_t *)&v490);
          v195 = (a1 + 1) >> 1;
          v197 = v490;
          goto LABEL_311;
        }
        goto LABEL_312;
      }
LABEL_310:
      v489 = 0;
      v490 = 0;
      v12 = v12;
      values = create_htpc_plane_dict(a1, v12, 1, 0, (unint64_t *)&v490);
      v197 = v490;
      v195 = a1;
LABEL_311:
      v196 = v12;
LABEL_313:
      v309 = 2;
      goto LABEL_314;
    }
    if (a3 <= 1534359089)
    {
      if (a3 <= 1534354993)
      {
        if (a3 == 1530426932)
          goto LABEL_310;
        v40 = 26160;
        goto LABEL_181;
      }
      if (a3 != 1534354994)
      {
        if (a3 != 1534354996)
        {
          v40 = 30256;
LABEL_181:
          if (a3 != (v40 | 0x5B740000))
            goto LABEL_396;
          goto LABEL_182;
        }
        goto LABEL_266;
      }
LABEL_267:
      v489 = 0;
      v490 = 0;
      v12 = v12;
      values = create_htpc_plane_dict(a1, v12, 2, 0, (unint64_t *)&v490);
      v195 = (a1 + 1) >> 1;
      v197 = v490;
      goto LABEL_268;
    }
    if (a3 <= 1534617135)
    {
      if (a3 == 1534359090)
        goto LABEL_267;
      v102 = 1534359092;
LABEL_265:
      if (a3 != v102)
        goto LABEL_396;
      goto LABEL_266;
    }
    if (a3 != 1534617136)
    {
      if (a3 == 1534617138)
        goto LABEL_267;
      v102 = 1534617140;
      goto LABEL_265;
    }
LABEL_182:
    v489 = 0;
    v490 = 0;
    values = create_htpc_plane_dict(a1, v12, 2, 0, (unint64_t *)&v490);
    v195 = (a1 + 1) >> 1;
    v196 = (v12 + 1) >> 1;
    v197 = v490;
LABEL_269:
    v309 = 4;
LABEL_314:
    plane_dict = create_htpc_plane_dict(v195, v196, v309, v197, (unint64_t *)&v489);
    v12 = (unint64_t)CFArrayCreate(0, (const void **)&values, 2, MEMORY[0x24BDBD690]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8F88], (const void *)v12);
    CFRelease((CFTypeRef)v12);
    CFRelease(plane_dict);
    CFRelease(values);
    v109 = 0;
    LODWORD(v12) = v489 + v490;
    goto LABEL_351;
  }
  if (a3 > 875836467)
  {
    if (a3 <= 1093677111)
    {
      if (a3 <= 875836533)
      {
        if (a3 == 875836468)
          goto LABEL_202;
        if (a3 != 875836518)
          goto LABEL_396;
      }
      else if (a3 != 875836534)
      {
        if (a3 != 1027423537 && a3 != 1027423539)
          goto LABEL_396;
        v36 = a7[1];
        v37 = v36 - 1 + 4 * a1;
        v38 = v37 / v36 * v36;
        v39 = v37 & -v36;
        if ((v36 & (v36 - 1)) != 0)
          v39 = v38;
        goto LABEL_238;
      }
      v139 = a1;
      v140 = a7[1];
      v141 = (int8x8_t)a7[2];
      v142 = v140 - 1 + a1;
      v143 = v142 / v140 * v140;
      v144 = v142 & -v140;
      if ((v140 & (v140 - 1)) != 0)
        v145 = v143;
      else
        v145 = v144;
      v146 = v12;
      v147 = *(_QWORD *)&v141 + v12 - 1;
      v148 = v147 / *(_QWORD *)&v141 * *(_QWORD *)&v141;
      v149 = -*(_QWORD *)&v141;
      v150 = -*(_QWORD *)&v141;
      v151 = (uint8x8_t)vcnt_s8(v141);
      v151.i16[0] = vaddlv_u8(v151);
      v152 = v151.u32[0];
      v153 = v147 & v149;
      if (v151.u32[0] > 1uLL)
        v153 = v148;
      v154 = (int8x8_t)a7[3];
      v155 = (uint8x8_t)vcnt_s8(v154);
      v155.i16[0] = vaddlv_u8(v155);
      v156 = *(_QWORD *)&v154 - 1 + v153 * v145;
      v157 = v156 / *(_QWORD *)&v154 * *(_QWORD *)&v154;
      v158 = v156 & -*(_QWORD *)&v154;
      if (v155.u32[0] <= 1uLL)
        v159 = v158;
      else
        v159 = v157;
      v160 = 2 * v145;
      v161 = v147 & v150;
      if (v152 > 1)
        v161 = v148;
      v162 = *(_QWORD *)&v154 - 1 + v161 * v160;
      v163 = v162 / *(_QWORD *)&v154 * *(_QWORD *)&v154;
      v164 = v162 & -*(_QWORD *)&v154;
      if (v155.u32[0] <= 1uLL)
        v165 = v164;
      else
        v165 = v163;
      v489 = v165;
      v490 = v159;
      values = create_plane_dict(v139, v146, v145, 0, v159, 1, 1);
      v68 = v139;
      v69 = v146;
      v70 = v160;
      v71 = v159;
      v72 = v165;
      goto LABEL_201;
    }
    if (a3 > 1278226487)
    {
      if (a3 != 1278226488)
      {
        if (a3 == 1278555445)
          goto LABEL_202;
        v100 = 1278555701;
LABEL_119:
        if (a3 != v100)
          goto LABEL_396;
        goto LABEL_202;
      }
LABEL_315:
      v380 = a7[1];
      v381 = v380 - 1 + a1;
      v382 = v381 / v380 * v380;
      v383 = v381 & -v380;
      if ((v380 & (v380 - 1)) != 0)
        v233 = v382;
      else
        v233 = v383;
      v234 = (const __CFString *)*MEMORY[0x24BDD8E30];
      v235 = Mutable;
      v236 = 1;
      goto LABEL_240;
    }
    if (a3 == 1093677112)
      goto LABEL_315;
    v110 = 1111970369;
    goto LABEL_234;
  }
  if (a3 > 846624120)
  {
    if (a3 > 875704437)
    {
      if (a3 != 875704438)
      {
        if (a3 != 875704934 && a3 != 875704950)
          goto LABEL_396;
        v41 = (a1 + 1) >> 1;
        v42 = a1;
        v43 = a7[1];
        v44 = (int8x8_t)a7[2];
        v45 = v43 - 1 + a1;
        v46 = v45 / v43 * v43;
        v47 = v45 & -v43;
        if ((v43 & (v43 - 1)) != 0)
          v48 = v46;
        else
          v48 = v47;
        v49 = v12;
        v50 = *(_QWORD *)&v44 + v12 - 1;
        v51 = v50 / *(_QWORD *)&v44 * *(_QWORD *)&v44;
        v52 = -*(_QWORD *)&v44;
        v53 = -*(_QWORD *)&v44;
        v54 = (uint8x8_t)vcnt_s8(v44);
        v54.i16[0] = vaddlv_u8(v54);
        v55 = v54.u32[0];
        v56 = v50 & v52;
        if (v54.u32[0] > 1uLL)
          v56 = v51;
        v57 = (int8x8_t)a7[3];
        v58 = (uint8x8_t)vcnt_s8(v57);
        v58.i16[0] = vaddlv_u8(v58);
        v59 = *(_QWORD *)&v57 - 1 + v56 * v48;
        v60 = v59 / *(_QWORD *)&v57 * *(_QWORD *)&v57;
        v61 = v59 & -*(_QWORD *)&v57;
        if (v58.u32[0] <= 1uLL)
          v62 = v61;
        else
          v62 = v60;
        v63 = v50 & v53;
        if (v55 > 1)
          v63 = v51;
        v64 = *(_QWORD *)&v57 - 1 + v63 * v48;
        v65 = v64 / *(_QWORD *)&v57 * *(_QWORD *)&v57;
        v66 = v64 & -*(_QWORD *)&v57;
        if (v58.u32[0] <= 1uLL)
          v67 = v66;
        else
          v67 = v65;
        v489 = v67;
        v490 = v62;
        values = create_plane_dict(v42, v49, v48, 0, v62, 1, 1);
        v68 = v41;
        v69 = v49;
        v70 = v48;
        v71 = v62;
        v72 = v67;
        goto LABEL_201;
      }
      goto LABEL_187;
    }
    if (a3 != 846624121)
    {
      if (a3 != 875704422)
        goto LABEL_396;
LABEL_187:
      v199 = (v12 + 1) >> 1;
      v200 = a7[1];
      v201 = (int8x8_t)a7[2];
      v202 = v200 - 1 + a1;
      v203 = v202 / v200 * v200;
      v204 = v202 & -v200;
      if ((v200 & (v200 - 1)) != 0)
        v205 = v203;
      else
        v205 = v204;
      v206 = *(_QWORD *)&v201 + v12 - 1;
      v207 = v206 / *(_QWORD *)&v201 * *(_QWORD *)&v201;
      v208 = -*(_QWORD *)&v201;
      v209 = v199 + *(_QWORD *)&v201 - 1;
      v210 = v209 / *(_QWORD *)&v201 * *(_QWORD *)&v201;
      v211 = -*(_QWORD *)&v201;
      v212 = (uint8x8_t)vcnt_s8(v201);
      v212.i16[0] = vaddlv_u8(v212);
      v213 = v212.u32[0];
      v214 = v206 & v208;
      if (v212.u32[0] > 1uLL)
        v214 = v207;
      v215 = (int8x8_t)a7[3];
      v216 = (uint8x8_t)vcnt_s8(v215);
      v216.i16[0] = vaddlv_u8(v216);
      v217 = *(_QWORD *)&v215 - 1 + v214 * v205;
      v218 = v217 & -*(_QWORD *)&v215;
      v219 = v217 / *(_QWORD *)&v215 * *(_QWORD *)&v215;
      if (v216.u32[0] <= 1uLL)
        v220 = v218;
      else
        v220 = v219;
      v221 = v12;
      v222 = v209 & v211;
      if (v213 > 1)
        v222 = v210;
      v223 = *(_QWORD *)&v215 - 1 + v222 * v205;
      v224 = v223 / *(_QWORD *)&v215 * *(_QWORD *)&v215;
      v225 = v223 & -*(_QWORD *)&v215;
      if (v216.u32[0] <= 1uLL)
        v226 = v225;
      else
        v226 = v224;
      v489 = v226;
      v490 = v220;
      values = create_plane_dict(a1, v221, v205, 0, v220, 1, 1);
      v68 = (a1 + 1) >> 1;
      v69 = v199;
      v70 = v205;
      v71 = v220;
      v72 = v226;
LABEL_201:
      v227 = 1;
      v228 = 2;
LABEL_349:
      plane_dict = create_plane_dict(v68, v69, v70, v71, v72, v227, v228);
      v12 = (unint64_t)CFArrayCreate(0, (const void **)&values, 2, MEMORY[0x24BDBD690]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8F88], (const void *)v12);
      CFRelease((CFTypeRef)v12);
      CFRelease(plane_dict);
      CFRelease(values);
      LODWORD(v12) = v489 + v490;
      goto LABEL_350;
    }
LABEL_202:
    v229 = a7[1];
    v230 = v229 - 1 + 2 * a1;
    v231 = v230 / v229 * v229;
    v232 = v230 & -v229;
    if ((v229 & (v229 - 1)) != 0)
      v233 = v231;
    else
      v233 = v232;
    v234 = (const __CFString *)*MEMORY[0x24BDD8E30];
    v235 = Mutable;
    v236 = 2;
    goto LABEL_240;
  }
  if (a3 <= 642934848)
  {
    if (a3 != 32)
    {
      if (a3 != 641877825)
        goto LABEL_396;
      goto LABEL_123;
    }
    goto LABEL_235;
  }
  if (a3 != 642934849)
  {
    if (a3 != 645346162)
    {
      if (a3 == 645346401)
        goto LABEL_9;
LABEL_396:
      CFRelease(Mutable);
      return 0;
    }
LABEL_123:
    v103 = a1;
    v104 = (4 * a1 + 255) & 0x7FFFFFF00;
    v105 = v12;
    CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8E30], 4);
    CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8E38], (4 * a1 + 255) & 0xFFFFFF00);
    v106 = ((v12 + 63) & 0x1FFFFFFC0) * v104;
    v107 = vcvtps_u32_f32(log2f(ceilf((float)a1 * 0.0625)));
    v12 = (v104
         + v106
         + (((2 << v107 << vcvtps_u32_f32(log2f(ceilf((float)v12 * 0.0625)))) + 127) & 0xFFFFFF80)
         - 1)
        / v104
        * v104;
    v21 = v103;
    v22 = v105;
    v23 = v104;
    v24 = v12;
    v25 = 4;
    v20 = v106;
    v26 = 16;
    goto LABEL_124;
  }
LABEL_9:
  v16 = a1;
  v17 = (8 * a1 + 255) & 0xFFFFFFF00;
  v18 = v12;
  v488 = (v12 + 63) & 0x1FFFFFFC0;
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8E30], 8);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8E38], v17);
  agx_add_metadata_padding(v17, v16, v12, 8uLL, 0x10uLL, (unint64_t *)&v488, &v487, v19);
  v20 = v487;
  LODWORD(v12) = v488 * v17;
  v21 = v16;
  v22 = v18;
  v23 = v17;
  v24 = v488 * v17;
  v25 = 8;
  v26 = 8;
LABEL_124:
  values = create_agx_plane_dict(v21, v22, v23, v24, v25, v20, v26, 16, v485, v486);
  v108 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8F88], v108);
  CFRelease(v108);
  CFRelease(values);
  v109 = 0;
LABEL_351:
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8E18], v12);
  if (a6)
    CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x24BDD8FC0], a6);
  v423 = (const void *)*MEMORY[0x24BDBD270];
  if ((a5 & 0x10) != 0)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8EC0], (const void *)*MEMORY[0x24BDBD270]);
  if ((a5 & 8) != 0)
    v424 = v423;
  else
    v424 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8EF0], v424);
  if (v109)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8E28], v423);
  if ((a5 & 4) != 0)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8ED8], CFSTR("PurpleGfxMem"));
  v425 = IOSurfaceCreate(Mutable);
  CFRelease(Mutable);
  if (v425)
    IOSurfaceSetBulkAttachments2();
  return v425;
}

void agx_add_metadata_padding(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t *a6, unint64_t *a7, unint64_t *a8)
{
  unint64_t v12;
  char v13;

  v12 = (*a6 * a1 + 127) & 0xFFFFFFFFFFFFFF80;
  *a7 = v12;
  v13 = vcvtps_u32_f32(log2f(ceilf((float)a2 / (float)a4)));
  *a6 = (a1 + v12 + (((2 << v13 << vcvtps_u32_f32(log2f(ceilf((float)a3 / (float)a5)))) + 127) & 0xFFFFFF80) - 1) / a1;
}

CFDictionaryRef create_agx_plane_dict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  CFDictionaryRef v21;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t valuePtr;
  void *values[12];
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  void *keys[16];

  keys[15] = *(void **)MEMORY[0x24BDAC8D0];
  v37 = a2;
  valuePtr = a1;
  v35 = 0;
  v36 = a3;
  v33 = a5;
  v34 = a4;
  v31 = a6;
  v32 = 0;
  v29 = a8;
  v30 = a7;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v28 = 3;
  v27 = 2;
  v10 = (void *)*MEMORY[0x24BDD8F70];
  keys[0] = *(void **)MEMORY[0x24BDD8FA8];
  keys[1] = v10;
  v11 = (void *)*MEMORY[0x24BDD8F18];
  keys[2] = *(void **)MEMORY[0x24BDD8F90];
  keys[3] = v11;
  v12 = (void *)*MEMORY[0x24BDD8F10];
  keys[4] = *(void **)MEMORY[0x24BDD8F98];
  keys[5] = v12;
  v13 = (void *)*MEMORY[0x24BDD8F30];
  keys[6] = *(void **)MEMORY[0x24BDD8F28];
  keys[7] = v13;
  v14 = (void *)*MEMORY[0x24BDD8F48];
  keys[8] = *(void **)MEMORY[0x24BDD8E10];
  keys[9] = v14;
  v15 = (void *)*MEMORY[0x24BDD8F38];
  keys[10] = *(void **)MEMORY[0x24BDD8F40];
  keys[11] = v15;
  v16 = (void *)*MEMORY[0x24BDD8F78];
  keys[12] = *(void **)MEMORY[0x24BDD8FB0];
  keys[13] = v16;
  keys[14] = *(void **)MEMORY[0x24BDD8F08];
  values[0] = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberCFIndexType, &v37);
  values[2] = CFNumberCreate(0, kCFNumberCFIndexType, &v35);
  values[3] = CFNumberCreate(0, kCFNumberCFIndexType, &v36);
  values[4] = CFNumberCreate(0, kCFNumberCFIndexType, &v34);
  values[5] = CFNumberCreate(0, kCFNumberCFIndexType, &v33);
  values[6] = CFNumberCreate(0, kCFNumberCFIndexType, &v32);
  values[7] = CFNumberCreate(0, kCFNumberCFIndexType, &v31);
  values[8] = CFNumberCreate(0, kCFNumberCFIndexType, &v28);
  values[9] = CFNumberCreate(0, kCFNumberCFIndexType, &v27);
  values[10] = CFNumberCreate(0, kCFNumberCFIndexType, &v30);
  values[11] = CFNumberCreate(0, kCFNumberCFIndexType, &v29);
  v17 = v30 - 1 + valuePtr;
  if ((v30 & (v30 - 1)) != 0)
    v18 = v17 / v30 * v30;
  else
    v18 = v17 & -v30;
  v19 = v29 - 1 + v37;
  if ((v29 & (v29 - 1)) != 0)
    v20 = v19 / v29 * v29;
  else
    v20 = v19 & -v29;
  v26 = v18 / v30;
  v24 = 2;
  v25 = v20 / v29;
  v40 = CFNumberCreate(0, kCFNumberCFIndexType, &v26);
  v41 = CFNumberCreate(0, kCFNumberCFIndexType, &v25);
  v42 = CFNumberCreate(0, kCFNumberCFIndexType, &v24);
  v21 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 15, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  for (i = 0; i != 15; ++i)
    CFRelease(values[i]);
  return v21;
}

CFDictionaryRef create_plane_dict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v7;
  void *v8;
  void *v9;
  CFDictionaryRef v10;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t valuePtr;
  void *values[7];
  void *keys[8];

  keys[7] = *(void **)MEMORY[0x24BDAC8D0];
  v18 = a2;
  valuePtr = a1;
  v16 = a4;
  v17 = a3;
  v14 = a6;
  v15 = a5;
  v13 = a7;
  v7 = (void *)*MEMORY[0x24BDD8F70];
  keys[0] = *(void **)MEMORY[0x24BDD8FA8];
  keys[1] = v7;
  v8 = (void *)*MEMORY[0x24BDD8F90];
  keys[2] = *(void **)MEMORY[0x24BDD8F18];
  keys[3] = v8;
  v9 = (void *)*MEMORY[0x24BDD8F58];
  keys[4] = *(void **)MEMORY[0x24BDD8F98];
  keys[5] = v9;
  keys[6] = *(void **)MEMORY[0x24BDD8F10];
  values[0] = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberCFIndexType, &v18);
  values[2] = CFNumberCreate(0, kCFNumberCFIndexType, &v17);
  values[3] = CFNumberCreate(0, kCFNumberCFIndexType, &v16);
  values[4] = CFNumberCreate(0, kCFNumberCFIndexType, &v15);
  values[5] = CFNumberCreate(0, kCFNumberCFIndexType, &v14);
  values[6] = CFNumberCreate(0, kCFNumberCFIndexType, &v13);
  v10 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 7, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  for (i = 0; i != 7; ++i)
    CFRelease(values[i]);
  return v10;
}

CFDictionaryRef create_htpc_plane_dict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CFDictionaryRef v22;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t valuePtr;
  void *values[18];
  void *keys[19];

  keys[18] = *(void **)MEMORY[0x24BDAC8D0];
  v40 = a2;
  valuePtr = a1;
  v38 = a4;
  v39 = a3;
  v36 = 1;
  v37 = 1;
  v34 = 0;
  v35 = 1;
  if (a4)
    v6 = 8;
  else
    v6 = 16;
  v32 = 8;
  v33 = v6;
  v7 = 3;
  if (!a4)
    v7 = 4;
  v8 = 6;
  if (!a4)
    v8 = 7;
  v9 = v6 - 1;
  v10 = v6 - 1 + a3 * a1;
  v11 = -v6;
  v30 = ((v9 + a1) & (unint64_t)v11) >> v7;
  v31 = v10 & v11;
  v28 = 4;
  v29 = (unint64_t)(a2 + 7) >> 3;
  v26 = a4;
  v27 = 4 * v30;
  v12 = (4 * v30 * v29 + 127) & 0xFFFFFFFFFFFFFF80;
  v25 = v12 + a4;
  *a5 = (v12 + (a3 << v8) * v29 * v30 + 127) & 0xFFFFFFFFFFFFFF80;
  v13 = (void *)*MEMORY[0x24BDD8F70];
  keys[0] = *(void **)MEMORY[0x24BDD8FA8];
  keys[1] = v13;
  v14 = (void *)*MEMORY[0x24BDD8F18];
  keys[2] = *(void **)MEMORY[0x24BDD8F90];
  keys[3] = v14;
  v15 = (void *)*MEMORY[0x24BDD8F10];
  keys[4] = *(void **)MEMORY[0x24BDD8F98];
  keys[5] = v15;
  v16 = (void *)*MEMORY[0x24BDD8F48];
  keys[6] = *(void **)MEMORY[0x24BDD8E10];
  keys[7] = v16;
  v17 = (void *)*MEMORY[0x24BDD8F38];
  keys[8] = *(void **)MEMORY[0x24BDD8F40];
  keys[9] = v17;
  v18 = (void *)*MEMORY[0x24BDD8F78];
  keys[10] = *(void **)MEMORY[0x24BDD8FB0];
  keys[11] = v18;
  v19 = (void *)*MEMORY[0x24BDD8F20];
  keys[12] = *(void **)MEMORY[0x24BDD8F08];
  keys[13] = v19;
  v20 = (void *)*MEMORY[0x24BDD8F68];
  keys[14] = *(void **)MEMORY[0x24BDD8F60];
  keys[15] = v20;
  v21 = (void *)*MEMORY[0x24BDD8F28];
  keys[16] = *(void **)MEMORY[0x24BDD8F30];
  keys[17] = v21;
  values[0] = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberCFIndexType, &v40);
  values[2] = CFNumberCreate(0, kCFNumberCFIndexType, &v38);
  values[3] = CFNumberCreate(0, kCFNumberCFIndexType, &v31);
  values[4] = CFNumberCreate(0, kCFNumberCFIndexType, a5);
  values[5] = CFNumberCreate(0, kCFNumberCFIndexType, &v39);
  values[6] = CFNumberCreate(0, kCFNumberCFIndexType, &v37);
  values[7] = CFNumberCreate(0, kCFNumberCFIndexType, &v36);
  values[8] = CFNumberCreate(0, kCFNumberSInt32Type, &v33);
  values[9] = CFNumberCreate(0, kCFNumberSInt32Type, &v32);
  values[10] = CFNumberCreate(0, kCFNumberCFIndexType, &v30);
  values[11] = CFNumberCreate(0, kCFNumberCFIndexType, &v29);
  values[12] = CFNumberCreate(0, kCFNumberCFIndexType, &v28);
  values[13] = CFNumberCreate(0, kCFNumberCFIndexType, &v27);
  values[14] = CFNumberCreate(0, kCFNumberCFIndexType, &v35);
  values[15] = CFNumberCreate(0, kCFNumberCFIndexType, &v34);
  values[16] = CFNumberCreate(0, kCFNumberCFIndexType, &v26);
  values[17] = CFNumberCreate(0, kCFNumberCFIndexType, &v25);
  v22 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 18, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  for (i = 0; i != 18; ++i)
    CFRelease(values[i]);
  return v22;
}

unint64_t rowbytes_for_packed_format(uint64_t a1, int a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned __int16 v4;
  int v5;
  char v6;

  v2 = 3;
  v3 = 2;
  if (a2 > 1885746227)
  {
    if ((a2 - 1886676528) <= 4 && ((1 << (a2 - 48)) & 0x15) != 0
      || (a2 - 1886680624) <= 4 && ((1 << (a2 - 48)) & 0x15) != 0)
    {
      v6 = 3;
      v2 = 5;
      v3 = 4;
      return ((v3 + a1) / v2) << v6;
    }
    v4 = 13364;
    goto LABEL_10;
  }
  if (a2 > 1882469427)
  {
    if (a2 != 1882469428 && a2 != 1885745712)
    {
      v4 = 12850;
LABEL_10:
      v5 = v4 | 0x70660000;
      goto LABEL_15;
    }
LABEL_17:
    v6 = 2;
    return ((v3 + a1) / v2) << v6;
  }
  if (a2 == 1882468912)
    goto LABEL_17;
  v5 = 1882468914;
LABEL_15:
  v6 = 2;
  if (a2 != v5)
    rowbytes_for_packed_format();
  return ((v3 + a1) / v2) << v6;
}

char *LICreateGhostlyVersionWithDataWrapper(CGImage *a1, uint64_t a2)
{
  unint64_t Width;
  unint64_t v5;
  uint64_t ImageProvider;
  CGDataProviderRef DataProvider;
  uint64_t v8;
  uint64_t v9;
  const char *Data;
  unint64_t BytesPerRow;
  void *v12;
  uint64_t (*v13)();
  uint64_t *p_aBlock;
  uint64_t BytePtr;
  void (**v16)(_QWORD);
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v19;
  CGContext *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  const __CFData *v30;
  CGDataProvider *v31;
  CGColorSpace *v32;
  uint64_t v34;
  size_t height;
  _QWORD v36[5];
  uint64_t aBlock;
  uint64_t v38;
  CGRect v39;

  if (!a1)
    return 0;
  Width = CGImageGetWidth(a1);
  v5 = CGImageGetHeight(a1);
  ImageProvider = CGImageGetImageProvider();
  DataProvider = CGImageGetDataProvider(a1);
  if (ImageProvider)
  {
    if (LIGetBGRA8888DataForImage___once != -1)
      dispatch_once(&LIGetBGRA8888DataForImage___once, &__block_literal_global_1);
    v8 = CGImageProviderCopyImageBlockSetWithOptions();
    if (v8)
    {
      v9 = v8;
      if (CGImageBlockSetGetImageBlock())
      {
        Data = (const char *)CGImageBlockGetData();
        BytesPerRow = CGImageBlockGetBytesPerRow();
        v38 = MEMORY[0x24BDAC760];
        v12 = &__block_descriptor_tmp_1;
        v13 = __LIGetBGRA8888DataForImage_block_invoke_2;
        p_aBlock = &v38;
LABEL_12:
        p_aBlock[1] = 0x40000000;
        p_aBlock[2] = (uint64_t)v13;
        p_aBlock[3] = (uint64_t)v12;
        p_aBlock[4] = v9;
        v16 = (void (**)(_QWORD))_Block_copy(p_aBlock);
        goto LABEL_17;
      }
      CGImageBlockSetRelease();
    }
  }
  else
  {
    v9 = (uint64_t)DataProvider;
    if (DataProvider)
    {
      if (CGImageGetBitmapInfo(a1) == 8194)
      {
        BytePtr = CGDataProviderGetBytePtr();
        if (BytePtr)
        {
          Data = (const char *)BytePtr;
          BytesPerRow = CGImageGetBytesPerRow(a1);
          aBlock = MEMORY[0x24BDAC760];
          v12 = &__block_descriptor_tmp_2;
          v13 = __LIGetBGRA8888DataForImage_block_invoke_3;
          p_aBlock = &aBlock;
          goto LABEL_12;
        }
      }
      else
      {
        syslog(4, "%s: bitmap data for CGImage %p [%zux%zd] not in BGRA8888 format\n", "LIGetBGRA8888DataForImage", a1, Width, v5);
      }
    }
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v19 = CGBitmapContextCreate(0, Width, v5, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  if (!v19)
  {
    CGColorSpaceRelease(DeviceRGB);
    return 0;
  }
  v20 = v19;
  v39.size.width = (double)Width;
  v39.size.height = (double)v5;
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  CGContextDrawImage(v19, v39, a1);
  Data = (const char *)CGBitmapContextGetData(v20);
  Width = CGBitmapContextGetWidth(v20);
  v5 = CGBitmapContextGetHeight(v20);
  BytesPerRow = CGBitmapContextGetBytesPerRow(v20);
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 0x40000000;
  v36[2] = __LIGetBGRA8888DataForImage_block_invoke_4;
  v36[3] = &__block_descriptor_tmp_4;
  v36[4] = v20;
  v16 = (void (**)(_QWORD))_Block_copy(v36);
  CGColorSpaceRelease(DeviceRGB);
LABEL_17:
  v21 = 4 * Width;
  v22 = CGBitmapGetAlignedBytesPerRow() * v5;
  v23 = (char *)CGBitmapAllocateData();
  if (v23)
  {
    height = v5;
    if ((BytesPerRow & 3) != 0 || BytesPerRow > CGBitmapGetAlignedBytesPerRow())
    {
      v34 = a2;
      v24 = CGBitmapGetAlignedBytesPerRow();
      v25 = v24;
      if (v5)
      {
        v26 = v5;
        v27 = Width;
        v28 = v26;
        v29 = v23;
        do
        {
          LIConvertBGRA8888ToBGRA8888Grayscale(Data, v29, v21);
          Data += BytesPerRow;
          v29 += v25;
          --v28;
        }
        while (v28);
        BytesPerRow = v25;
        Width = v27;
      }
      else
      {
        BytesPerRow = v24;
      }
      a2 = v34;
      if (v34)
        goto LABEL_28;
    }
    else
    {
      LIConvertBGRA8888ToBGRA8888Grayscale(Data, v23, v5 * BytesPerRow);
      if (a2)
      {
LABEL_28:
        v30 = (const __CFData *)(*(uint64_t (**)(uint64_t, char *, uint64_t))(a2 + 16))(a2, v23, v22);
        v31 = CGDataProviderCreateWithCFData(v30);
        CFRelease(v30);
LABEL_31:
        CGBitmapFreeData();
        if (!v31)
        {
          v23 = 0;
          if (!v16)
            return v23;
          goto LABEL_34;
        }
        v32 = CGColorSpaceCreateDeviceRGB();
        v23 = (char *)CGImageCreate(Width, height, 8uLL, 0x20uLL, BytesPerRow, v32, 0x2002u, v31, 0, 0, kCGRenderingIntentDefault);
        CGColorSpaceRelease(v32);
        CGDataProviderRelease(v31);
        goto LABEL_33;
      }
    }
    v31 = (CGDataProvider *)CGDataProviderCreateWithCopyOfData();
    goto LABEL_31;
  }
LABEL_33:
  if (v16)
  {
LABEL_34:
    v16[2](v16);
    _Block_release(v16);
  }
  return v23;
}

uint64_t LIBytesNeededForGhostlyImageOfSize(uint64_t a1, uint64_t a2)
{
  return CGBitmapGetAlignedBytesPerRow() * a2;
}

const char *LIConvertBGRA8888ToBGRA8888Grayscale(const char *result, char *a2, uint64_t a3)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  int v6;
  unsigned __int8 v7;
  unsigned int v8;
  int8x8x4_t v9;

  if (a3 >= 1)
  {
    v3 = (unsigned __int8 *)&result[a3];
    do
    {
      v9 = vld4_s8(result);
      result += 32;
      v9.val[0] = vaddhn_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)0x9797979797979797, (uint8x8_t)v9.val[1]), (uint8x8_t)0x1C1C1C1C1C1C1C1CLL, (uint8x8_t)v9.val[0]), (int16x8_t)vmull_u8((uint8x8_t)0x4D4D4D4D4D4D4D4DLL, (uint8x8_t)v9.val[2]));
      v9.val[1] = v9.val[0];
      v9.val[2] = v9.val[0];
      vst4_s8(a2, v9);
      a2 += 32;
    }
    while (result < (const char *)v3);
  }
  if ((a3 & 0x1F) != 0)
  {
    v4 = (unsigned __int8 *)&result[a3 & 0x1F];
    do
    {
      v5 = *((unsigned __int8 *)result + 1);
      v6 = *((unsigned __int8 *)result + 2);
      v7 = result[3];
      v8 = (28 * *(unsigned __int8 *)result + 151 * v5 + 77 * v6) >> 8;
      *a2 = (unsigned __int16)(28 * *(unsigned __int8 *)result + 151 * v5 + 77 * v6) >> 8;
      a2[1] = v8;
      a2[2] = v8;
      a2[3] = v7;
      a2 += 4;
      result += 4;
    }
    while (result < (const char *)v4);
  }
  return result;
}

uint64_t LIBytesPerRowForGhostlyImageOfWidth()
{
  return CGBitmapGetAlignedBytesPerRow();
}

char *LICreateGhostlyVersion(CGImage *a1)
{
  return LICreateGhostlyVersionWithDataWrapper(a1, 0);
}

void LIIconContinuousCornerRadiusForVariant_cold_1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "CGFloat LIIconContinuousCornerRadiusForVariant(LIIconVariant)";
  v4 = 1024;
  v5 = a1;
  _os_log_fault_impl(&dword_2067A1000, a2, OS_LOG_TYPE_FAULT, "%s called with unsupported icon variant %d.", (uint8_t *)&v2, 0x12u);
}

void _LICGImageCreateCoreImageLanczosScaled_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2067A1000, a1, a3, "Source has color space that is not supported as an output for CIContext. Picking a compatable one.", a5, a6, a7, a8, 0);
}

void _LICGImageCreateCoreImageLanczosScaled_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2067A1000, a1, a3, "Creating scaled icon with CI CILanczosScaleTransform filter.", a5, a6, a7, a8, 0);
}

void rowbytes_for_packed_format()
{
  __assert_rtn("rowbytes_for_packed_format", "CASurfaceUtil.cpp", 324, "0");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x24BDBBA30](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x24BDBBA38](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x24BDBBA60](locArray, prefArray);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x24BDBBA88](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBAC8](bundle);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x24BDBBF40]();
}

CFLocaleLanguageDirection CFLocaleGetLanguageCharacterDirection(CFStringRef isoLangCode)
{
  return MEMORY[0x24BDBBF80](isoLangCode);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x24BDBC400]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x24BDBC590](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC5D8](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x24BDBC790](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x24BDBC7D0](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x24BDBD910]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x24BDBD958](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x24BDBD970](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x24BDBD978](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x24BDBD980]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

uint64_t CGBitmapGetFastestAlignment()
{
  return MEMORY[0x24BDBD990]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x24BDBDD08](c, auxiliaryInfo);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x24BDBDE58](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x24BDBDFC0]();
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x24BDBDFC8](c, components);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x24BDBDFD0](c, space);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

uint64_t CGDataProviderCreateWithCopyOfData()
{
  return MEMORY[0x24BDBE188]();
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

uint64_t CGDataProviderGetBytePtr()
{
  return MEMORY[0x24BDBE1A8]();
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

uint64_t CGDataProviderUngetBytePtr()
{
  return MEMORY[0x24BDBE1E8]();
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x24BDBE578]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x24BDBE580]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x24BDBE5C0]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x24BDBE5D8]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x24BDBE690]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x24BDBE6E8]();
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x24BDBE710]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x24BDBE780]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEE30](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x24BE51728]();
}

uint64_t IOSurfaceAcceleratorGetServiceObject()
{
  return MEMORY[0x24BE51740]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x24BDD8D98]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x24BED8480]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x24BDBCF80]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_mask(dispatch_source_t source)
{
  return MEMORY[0x24BDADF90](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAED00](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x24BDAF430]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t os_transaction_needs_more_time()
{
  return MEMORY[0x24BDAF448]();
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDAFA98](a1, a2, a3);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

