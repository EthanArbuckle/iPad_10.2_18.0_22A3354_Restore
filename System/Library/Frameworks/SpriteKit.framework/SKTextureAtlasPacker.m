@implementation SKTextureAtlasPacker

- (CGImage)copyRotateCGImage:(CGImage *)a3 direction:(BOOL)a4
{
  _BOOL4 v4;
  double Width;
  double Height;
  void *v8;
  CGColorSpace *DeviceRGB;
  CGContext *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGImage *Image;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  v4 = a4;
  Width = (double)CGImageGetWidth(a3);
  Height = (double)CGImageGetHeight(a3);
  v8 = malloc_type_malloc(vcvtd_n_u64_f64(Width * Height, 2uLL), 0xCD6AE79BuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v10 = CGBitmapContextCreate(v8, (unint64_t)Height, (unint64_t)Width, 8uLL, vcvtd_n_u64_f64(Height, 2uLL), DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = Height;
  v18.size.height = Width;
  CGContextClearRect(v10, v18);
  v11 = 1.0;
  if (v4)
    v12 = -1.0;
  else
    v12 = 1.0;
  if (v4)
  {
    v13 = 0.0;
  }
  else
  {
    v11 = -1.0;
    v13 = Height;
  }
  v17.a = 0.0;
  v17.b = v12;
  v17.c = v11;
  if (v4)
    v14 = Width;
  else
    v14 = 0.0;
  v17.d = 0.0;
  v17.tx = v13;
  v17.ty = v14;
  CGContextConcatCTM(v10, &v17);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = Width;
  v19.size.height = Height;
  CGContextDrawImage(v10, v19, a3);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  free(v8);
  return Image;
}

- (CGRect)calcNonAlphaArea:(CGImage *)a3
{
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  CGFloat v6;
  CGFloat v7;
  size_t Width;
  double v9;
  size_t Height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  size_t v16;
  char *v17;
  unint64_t v18;
  CGContext *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  char *v26;
  int v27;
  char *v28;
  double v29;
  uint64_t v30;
  _BOOL4 v31;
  double v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  char *v38;
  uint64_t v39;
  double v40;
  int v41;
  char *v42;
  double v43;
  CGPoint v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect result;

  ColorSpace = CGImageGetColorSpace(a3);
  Model = CGColorSpaceGetModel(ColorSpace);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  Width = CGImageGetWidth(a3);
  v9 = (double)Width;
  Height = CGImageGetHeight(a3);
  v11 = v6;
  v12 = (double)Height;
  v13 = v7;
  v14 = (double)Width;
  v15 = (double)Height;
  if (Model != kCGColorSpaceModelIndexed)
  {
    v16 = Height;
    v17 = (char *)malloc_type_malloc((unint64_t)(v9 * v12), 0x91E5CE4uLL);
    v18 = (unint64_t)v9;
    v19 = CGBitmapContextCreate(v17, (unint64_t)v9, (unint64_t)v12, 8uLL, (unint64_t)v9, 0, 7u);
    v45.origin.x = 0.0;
    v45.origin.y = 0.0;
    v45.size.width = (double)Width;
    v45.size.height = v12;
    CGContextClearRect(v19, v45);
    v46.origin.x = 0.0;
    v46.origin.y = 0.0;
    v46.size.width = (double)Width;
    v46.size.height = v12;
    CGContextDrawImage(v19, v46, a3);
    v13 = v7;
    v15 = v12;
    if (v16)
    {
      v20 = 0;
      v21 = v17;
      v15 = v12;
      v13 = v7;
      while (!Width)
      {
LABEL_8:
        v13 = v13 + 1.0;
        v15 = v15 + -1.0;
        ++v20;
        v21 += v18;
        if ((double)(int)v20 >= v12)
          goto LABEL_9;
      }
      v22 = 0;
      while (!v21[v22])
      {
        if ((double)(int)++v22 >= v9)
          goto LABEL_8;
      }
    }
LABEL_9:
    LODWORD(v23) = (int)(v13 + v15 + -1.0);
    if (v13 <= (double)(int)v23)
    {
      v23 = (int)v23;
      v38 = &v17[v18 * (int)v23];
      while (!Width)
      {
LABEL_26:
        v15 = v15 + -1.0;
        --v23;
        v38 -= v18;
        if (v13 > (double)(int)v23)
          goto LABEL_10;
      }
      v39 = 0;
      while (!v38[v39])
      {
        if ((double)(int)++v39 >= v9)
          goto LABEL_26;
      }
    }
LABEL_10:
    v11 = v6;
    v14 = (double)Width;
    if (Width)
    {
      v24 = 0;
      v25 = v13 + v15;
      v26 = &v17[v18 * (int)v13];
      v14 = (double)Width;
      v11 = v6;
      while (1)
      {
        v27 = (int)v13 + 1;
        v28 = v26;
        if (v25 > (double)(int)v13)
          break;
LABEL_15:
        v11 = v11 + 1.0;
        v14 = v14 + -1.0;
        ++v24;
        ++v26;
        if ((double)(int)v24 >= v9)
          goto LABEL_16;
      }
      while (!*v28)
      {
        v28 += v18;
        v29 = (double)v27++;
        if (v25 <= v29)
          goto LABEL_15;
      }
    }
LABEL_16:
    LODWORD(v30) = (int)(v11 + v14 + -1.0);
    if (v11 <= (double)(int)v30)
    {
      v40 = v13 + v15;
      v30 = (int)v30;
      while (1)
      {
        v41 = (int)v13 + 1;
        v42 = &v17[v18 * (int)v13];
        if (v40 > (double)(int)v13)
          break;
LABEL_32:
        v14 = v14 + -1.0;
        if (v11 > (double)(int)--v30)
          goto LABEL_17;
      }
      while (!v42[v30])
      {
        v42 += v18;
        v43 = (double)v41++;
        if (v40 <= v43)
          goto LABEL_32;
      }
    }
LABEL_17:
    CGContextRelease(v19);
    free(v17);
  }
  v47.origin.x = v6;
  v47.origin.y = v7;
  v47.size.width = (double)Width;
  v47.size.height = v12;
  v44.x = v11;
  v44.y = v13;
  v31 = CGRectContainsPoint(v47, v44);
  v32 = *MEMORY[0x1E0C9D538];
  v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v31)
  {
    v32 = v11;
    v33 = v13;
  }
  v34 = v15;
  v35 = fmaxf(v34, 1.0);
  v36 = v14;
  v37 = fmaxf(v36, 1.0);
  result.size.height = v35;
  result.size.width = v37;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (BOOL)isFullyOpaque:(CGImage *)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char *v12;
  unint64_t v13;
  CGContext *v14;
  uint64_t v15;
  BOOL v16;
  double v17;
  char *v18;
  int v19;
  char *v20;
  int v21;
  double v22;
  CGRect v24;
  CGRect v25;

  -[SKTextureAtlasPacker calcNonAlphaArea:](self, "calcNonAlphaArea:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (char *)malloc_type_malloc((unint64_t)(v8 * v10), 0xB027D371uLL);
  v13 = (unint64_t)v9;
  v14 = CGBitmapContextCreate(v12, (unint64_t)v9, (unint64_t)v11, 8uLL, (unint64_t)v9, 0, 7u);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v9;
  v24.size.height = v11;
  CGContextClearRect(v14, v24);
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = v9;
  v25.size.height = v11;
  CGContextDrawImage(v14, v25, a3);
  LODWORD(v15) = (int)v7;
  if (v7 + v11 > (double)(int)v7)
  {
    v17 = v5 + v9;
    v15 = (int)v15;
    v18 = &v12[v13 * (int)v15 + (int)v5];
    while (1)
    {
      v19 = (int)v5 + 1;
      v20 = v18;
      if (v17 > (double)(int)v5)
        break;
LABEL_7:
      ++v15;
      v18 += v13;
      if (v7 + v11 <= (double)(int)v15)
        goto LABEL_2;
    }
    while (1)
    {
      v21 = *v20++;
      if (v21 != 255)
        break;
      v22 = (double)v19++;
      if (v17 <= v22)
        goto LABEL_7;
    }
    v16 = 0;
  }
  else
  {
LABEL_2:
    v16 = 1;
  }
  CGContextRelease(v14);
  free(v12);
  return v16;
}

- (id)partitionTextureFilesByResolution:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v19;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v6, "lowercaseString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByDeletingPathExtension");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v9 = objc_msgSend(&unk_1EA51B858, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v3;
          v11 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(&unk_1EA51B858);
              v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              if (objc_msgSend(v8, "hasSuffix:", v13))
              {
                v14 = v13;
                goto LABEL_16;
              }
            }
            v9 = objc_msgSend(&unk_1EA51B858, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v9)
              continue;
            break;
          }
          v14 = CFSTR("KFilenameHasNoMatchingSuffix");
LABEL_16:
          v3 = v10;
        }
        else
        {
          v14 = CFSTR("KFilenameHasNoMatchingSuffix");
        }
        objc_msgSend(v3, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "addObject:", v6);
          v17 = v16;
        }
        else
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v17, "addObject:", v6);
          objc_msgSend(v3, "setObject:forKey:", v17, v14);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v4);
  }

  return v3;
}

- (id)getTextureFileList:(id)a3 modDate:(id *)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  id v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0C998D8];
  v25 = *MEMORY[0x1E0C999D0];
  v4 = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C999D0], *MEMORY[0x1E0C998D8], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v20, v5, 4, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v18;
  v6 = 0;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v28 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v28, v4, 0);
        v11 = v28;
        v27 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v27, v25, 0);
        v12 = v27;
        v26 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v26, v24, 0);
        v13 = v26;
        v14 = v13;
        if (v6)
        {
          if (objc_msgSend(v13, "compare:", v6) == 1)
          {
            v15 = v14;

            v6 = v15;
          }
        }
        else
        {
          v6 = v13;
        }
        if ((objc_msgSend(v12, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v11, "lowercaseString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "hasSuffix:", CFSTR(".jpg")) & 1) != 0
            || objc_msgSend(v16, "hasSuffix:", CFSTR(".png")))
          {
            objc_msgSend(v22, "addObject:", v10);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v22;
}

- (id)generateMetaData
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("APPL"), CFSTR("format"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("version"));

  return v2;
}

- (id)processPackedTextureAtlas:(const void *)a3 suffix:(id)a4 packer:(shared_ptr<MaxRectTexturePacker>)a5 sortedTrimArray:(const void *)a6 sortedTextureArray:(const void *)a7
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  double *v10;
  double v11;
  CGColorSpace *DeviceRGB;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CGSize v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGImage *v25;
  __int128 v26;
  void *v27;
  int v28;
  std::string *v29;
  uint64_t v30;
  std::string *v31;
  void *v32;
  id v33;
  void *v34;
  size_t Width;
  size_t Height;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGImage *v43;
  double v44;
  double v45;
  CGPoint origin;
  CGSize size;
  int v49;
  CGImage *v50;
  CGImage *v51;
  CGImage *v52;
  CGImage *v53;
  CGImage *v54;
  CGImage *v55;
  CGImage *v56;
  CGImage *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  CGImage *Image;
  void *v64;
  _QWORD *v66;
  id v67;
  void *v68;
  void *data;
  id v70;
  double v71;
  double v72;
  __shared_weak_count *var1;
  double v75;
  double v76;
  double v77;
  double v78;
  MaxRectTexturePacker *var0;
  uint64_t v80;
  void *v81;
  double rect;
  CGFloat point;
  CGContext *point_8;
  std::string v86;
  uint64_t v87;
  CGRect v88;
  CGPoint v89;
  CGSize v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  var1 = a5.var1;
  var0 = a5.var0;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4, a4, a5.var0, a5.var1, a6, a7);
  v67 = (id)objc_claimAutoreleasedReturnValue();
  if (v7[1] != *v7)
  {
    v8 = 0;
    v66 = v7;
    while (1)
    {
      v9 = MEMORY[0x1DF0CFADC]();
      v10 = (double *)(*v7 + 16 * v8);
      v11 = *v10;
      rect = v10[1];
      data = malloc_type_malloc(vcvtd_n_u64_f64(*v10 * rect, 2uLL), 0x95C211AAuLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      point_8 = CGBitmapContextCreate(data, (unint64_t)v11, (unint64_t)rect, 8uLL, vcvtd_n_u64_f64(v11, 2uLL), DeviceRGB, 0x4001u);
      CGColorSpaceRelease(DeviceRGB);
      v91.origin.x = 0.0;
      v91.origin.y = 0.0;
      v91.size.width = v11;
      v91.size.height = rect;
      CGContextClearRect(point_8, v91);
      v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      NSStringFromCGSize(*(CGSize *)(*v7 + 16 * v8));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKey:", v13, CFSTR("size"));
      v68 = (void *)v9;

      v14 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)var0 + 40))(*(_QWORD *)var0, v8);
      v80 = v8;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v14);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        break;
LABEL_53:
      objc_msgSend(v70, "setObject:forKey:", v81, CFSTR("subimages"), v66);
      v7 = v66;
      Image = CGBitmapContextCreateImage(point_8);
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", Image);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKey:", v64, CFSTR("path"));
      CGContextRelease(point_8);
      free(data);
      CGImageRelease(Image);
      objc_msgSend(v67, "addObject:", v70);

      objc_autoreleasePoolPop(v68);
      v8 = v80 + 1;
      if (v80 + 1 >= (unint64_t)((uint64_t)(v7[1] - *v7) >> 4))
        return v67;
    }
    v15 = 0;
    while (1)
    {
      v16 = (void *)MEMORY[0x1DF0CFADC]();
      v17 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v88.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      v88.size = v17;
      v87 = 0;
      v18 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, char *, CGRect *, uint64_t *))(**(_QWORD **)var0 + 48))(*(_QWORD *)var0, v80, v15, (char *)&v87 + 4, &v88, &v87);
      v19 = *(_QWORD *)var1 + 32 * HIDWORD(v87);
      v20 = *(double *)v19;
      v21 = *(double *)(v19 + 8);
      v23 = *(double *)(v19 + 16);
      v22 = *(double *)(v19 + 24);
      v24 = *(_QWORD *)a6 + 32 * HIDWORD(v87);
      v25 = *(CGImage **)v24;
      if (*(char *)(v24 + 31) < 0)
      {
        std::string::__init_copy_ctor_external(&v86, *(const std::string::value_type **)(v24 + 8), *(_QWORD *)(v24 + 16));
      }
      else
      {
        v26 = *(_OWORD *)(v24 + 8);
        v86.__r_.__value_.__r.__words[2] = *(_QWORD *)(v24 + 24);
        *(_OWORD *)&v86.__r_.__value_.__l.__data_ = v26;
      }
      v27 = (void *)MEMORY[0x1E0CB3940];
      v28 = SHIBYTE(v86.__r_.__value_.__r.__words[2]);
      v29 = (std::string *)v86.__r_.__value_.__r.__words[0];
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding", v66);
      v31 = v28 >= 0 ? &v86 : v29;
      objc_msgSend(v27, "stringWithCString:encoding:", v31, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v33, "setObject:forKey:", v32, CFSTR("name"));
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v34, CFSTR("aliases"));

      Width = CGImageGetWidth(v25);
      Height = CGImageGetHeight(v25);
      if (!(_DWORD)v18)
        break;
      v25 = -[SKTextureAtlasPacker copyRotateCGImage:direction:](self, "copyRotateCGImage:direction:", v25, 1);
      v37 = (double)CGImageGetWidth(v25) - v21 - v22;
      v38 = v20;
      v39 = v22;
      v40 = v23;
      if (v25)
        goto LABEL_15;
LABEL_16:
      point = v20;
      v44 = (double)Width;
      v45 = (double)Height;
      if (v23 != (double)Width || v22 != v45)
        goto LABEL_48;
      origin = v88.origin;
      size = v88.size;
      v77 = v88.origin.y + -1.0;
      v78 = v88.size.height + -1.0;
      v71 = v88.origin.x + -1.0;
      v72 = v88.origin.y + v88.size.height;
      v75 = v88.origin.x + v88.size.width;
      v76 = v88.size.width + -1.0;
      v49 = v87;
      if ((v87 & 8) != 0)
      {
        if (!v25)
          goto LABEL_48;
        v93.origin.x = 0.0;
        v93.origin.y = 0.0;
        v93.size.height = 1.0;
        v93.size.width = v88.size.width;
        v50 = CGImageCreateWithImageInRect(v25, v93);
        v94.size.height = 1.0;
        v94.origin.x = origin.x;
        v94.origin.y = v72;
        v94.size.width = size.width;
        CGContextDrawImage(point_8, v94, v50);
        CGImageRelease(v50);
        v49 = v87;
        if ((v87 & 4) == 0)
        {
          if ((v87 & 1) != 0)
          {
LABEL_35:
            v99.origin.x = 0.0;
            v99.origin.y = 0.0;
            v99.size.width = 1.0;
            v99.size.height = size.height;
            v53 = CGImageCreateWithImageInRect(v25, v99);
            v100.size.width = 1.0;
            v100.origin.x = v71;
            v100.origin.y = origin.y;
            v100.size.height = size.height;
            CGContextDrawImage(point_8, v100, v53);
            CGImageRelease(v53);
            v49 = v87;
            if ((v87 & 2) == 0)
              goto LABEL_36;
LABEL_33:
            v97.origin.y = 0.0;
            v97.size.width = 1.0;
            v97.origin.x = v76;
            v97.size.height = size.height;
            v52 = CGImageCreateWithImageInRect(v25, v97);
            v98.size.width = 1.0;
            v98.origin.x = v75;
            v98.origin.y = origin.y;
            v98.size.height = size.height;
            CGContextDrawImage(point_8, v98, v52);
            CGImageRelease(v52);
            v49 = v87;
            goto LABEL_37;
          }
LABEL_31:
          if (v25 && (v49 & 2) != 0)
            goto LABEL_33;
LABEL_36:
          if (v25)
          {
LABEL_37:
            if ((v49 & 9) == 9)
            {
              v101.origin.x = 0.0;
              v101.origin.y = 0.0;
              v101.size.width = 1.0;
              v101.size.height = 1.0;
              v54 = CGImageCreateWithImageInRect(v25, v101);
              v102.size.width = 1.0;
              v102.size.height = 1.0;
              v102.origin.x = v71;
              v102.origin.y = v72;
              CGContextDrawImage(point_8, v102, v54);
              CGImageRelease(v54);
              v49 = v87;
            }
          }
          if (v25 && (v49 & 5) == 5)
          {
            v103.origin.x = 0.0;
            v103.size.width = 1.0;
            v103.size.height = 1.0;
            v103.origin.y = v78;
            v55 = CGImageCreateWithImageInRect(v25, v103);
            v104.size.width = 1.0;
            v104.size.height = 1.0;
            v104.origin.x = v71;
            v104.origin.y = v77;
            CGContextDrawImage(point_8, v104, v55);
            CGImageRelease(v55);
            v49 = v87;
          }
          if (v25 && (v49 & 0xA) == 0xA)
          {
            v105.origin.y = 0.0;
            v105.size.width = 1.0;
            v105.size.height = 1.0;
            v105.origin.x = v76;
            v56 = CGImageCreateWithImageInRect(v25, v105);
            v106.size.width = 1.0;
            v106.size.height = 1.0;
            v106.origin.x = v75;
            v106.origin.y = v72;
            CGContextDrawImage(point_8, v106, v56);
            CGImageRelease(v56);
            v49 = v87;
          }
          if ((~v49 & 6) == 0 && v25)
          {
            v107.size.width = 1.0;
            v107.size.height = 1.0;
            v107.origin.x = v76;
            v107.origin.y = v78;
            v57 = CGImageCreateWithImageInRect(v25, v107);
            v108.size.width = 1.0;
            v108.size.height = 1.0;
            v108.origin.x = v75;
            v108.origin.y = v77;
            CGContextDrawImage(point_8, v108, v57);
            CGImageRelease(v57);
          }
          goto LABEL_48;
        }
      }
      else if (!v25 || (v87 & 4) == 0)
      {
        if ((v87 & 1) == 0)
          goto LABEL_31;
        goto LABEL_34;
      }
      v95.origin.x = 0.0;
      v95.size.height = 1.0;
      v95.origin.y = v78;
      v95.size.width = size.width;
      v51 = CGImageCreateWithImageInRect(v25, v95);
      v96.size.height = 1.0;
      v96.origin.x = origin.x;
      v96.origin.y = v77;
      v96.size.width = size.width;
      CGContextDrawImage(point_8, v96, v51);
      CGImageRelease(v51);
      v49 = v87;
      if ((v87 & 1) == 0)
        goto LABEL_31;
LABEL_34:
      if (v25)
        goto LABEL_35;
LABEL_48:
      v89.y = v45 - v21 - v22;
      v88.origin.y = rect - v88.origin.y - v88.size.height;
      v89.x = point;
      NSStringFromCGPoint(v89);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v58, CFSTR("spriteOffset"));

      v90.width = v44;
      v90.height = (double)Height;
      NSStringFromCGSize(v90);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v59, CFSTR("spriteSourceSize"));

      NSStringFromCGRect(v88);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v60, CFSTR("textureRect"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v61, CFSTR("textureRotated"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKTextureAtlasPacker isFullyOpaque:](self, "isFullyOpaque:", v25));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v62, CFSTR("isFullyOpaque"));

      objc_msgSend(v81, "addObject:", v33);
      if ((_DWORD)v18)
        CGImageRelease(v25);

      if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v86.__r_.__value_.__l.__data_);
      objc_autoreleasePoolPop(v16);
      if (v14 == ++v15)
        goto LABEL_53;
    }
    v37 = v20;
    v38 = v21;
    v39 = v23;
    v40 = v22;
    if (!v25)
      goto LABEL_16;
LABEL_15:
    v41 = v39;
    v42 = v40;
    v43 = CGImageCreateWithImageInRect(v25, *(CGRect *)&v37);
    v92.origin = v88.origin;
    v92.size.width = v39;
    v92.size.height = v40;
    CGContextDrawImage(point_8, v92, v43);
    CGImageRelease(v43);
    goto LABEL_16;
  }
  return v67;
}

+ (CGImage)copyProcessedImageSource:(id)a3
{
  const __CFURL *v3;
  CGImage *ImageAtIndex;
  CGImageSource *v5;
  CGImageSource *v6;
  const __CFURL *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (const __CFURL *)a3;
  if (!v3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = CGImageSourceCreateWithURL(v3, 0);
      v6 = v5;
      if (v5)
      {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0);
        CFRelease(v6);
        goto LABEL_10;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v3;
        v8 = (void *)MEMORY[0x1E0CEA638];
        SKGetResourceBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "imageNamed:inBundle:", v7, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_retainAutorelease(v10);
        ImageAtIndex = CGImageRetain((CGImageRef)objc_msgSend(v11, "CGImage"));

        goto LABEL_10;
      }
    }
LABEL_9:
    ImageAtIndex = 0;
    goto LABEL_10;
  }
  ImageAtIndex = CGImageRetain((CGImageRef)-[__CFURL CGImage](objc_retainAutorelease(v3), "CGImage"));
LABEL_10:

  return ImageAtIndex;
}

- (void)generateTextureAtlasImages:(id)a3 outputDictionary:(id *)a4 forcePOT:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  char *v18;
  std::string *v19;
  __int128 v20;
  char *v21;
  __n128 v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int128 v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  __int128 v35;
  char *v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  __int128 v43;
  char *v44;
  char *v45;
  __int128 v46;
  char *v47;
  unint64_t *p_shared_owners;
  unint64_t v49;
  void *v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  char *v54;
  char *v55;
  CGImage *v56;
  char *v57;
  __int128 v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  id v62;
  id *v63;
  void *v64;
  id v65;
  id obj;
  int64x2_t v67;
  _BOOL4 v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  __CFString *v72;
  uint64_t i;
  uint64_t v74;
  std::__shared_weak_count *v75;
  void *v76[2];
  __int128 v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  void *v80;
  char *v81;
  char *v82;
  CGImageRef image;
  std::string __p;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char *v89;
  char *v90;
  unint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v68 = a5;
  v63 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKTextureAtlasPacker partitionTextureFilesByResolution:](self, "partitionTextureFilesByResolution:", v7);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKTextureAtlasPacker generateMetaData](self, "generateMetaData");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend(v70, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
  if (v71)
  {
    v69 = *(_QWORD *)v93;
    v67 = vdupq_n_s64(0x40A0000000000000uLL);
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v93 != v69)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("KFilenameHasNoMatchingSuffix"), v63);
        v10 = &stru_1EA5021F8;
        if ((v9 & 1) == 0)
          v10 = v8;
        v72 = (__CFString *)v10;
        v89 = 0;
        v90 = 0;
        v91 = 0;
        objc_msgSend(v70, "objectForKey:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v86;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v86 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
              memset(&__p, 0, sizeof(__p));
              objc_msgSend(v6, "objectForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              image = +[SKTextureAtlasPacker copyProcessedImageSource:](SKTextureAtlasPacker, "copyProcessedImageSource:", v17);

              std::string::basic_string[abi:ne180100]<0>(v76, (char *)objc_msgSend(objc_retainAutorelease(v16), "cStringUsingEncoding:", 4));
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v76;
              __p.__r_.__value_.__r.__words[2] = v77;
              v18 = v90;
              if ((unint64_t)v90 >= v91)
              {
                v21 = (char *)std::vector<TextureInfo>::__push_back_slow_path<TextureInfo const&>((uint64_t *)&v89, (uint64_t)&image);
              }
              else
              {
                *(_QWORD *)v90 = image;
                v19 = (std::string *)(v18 + 8);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                {
                  std::string::__init_copy_ctor_external(v19, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
                }
                else
                {
                  v20 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
                  *((_QWORD *)v18 + 3) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
                  *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
                }
                v21 = v18 + 32;
              }
              v90 = v21;
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
          }
          while (v13);
        }

        v23 = 126 - 2 * __clz((v90 - v89) >> 5);
        v76[0] = sortTextureFunc;
        if (v90 == v89)
          v24 = 0;
        else
          v24 = v23;
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(TextureInfo const&,TextureInfo const&),TextureInfo*,false>((__int128 *)v89, v90, (uint64_t (**)(__int128 *, __int128 *))v76, v24, 1, v22);
        if (v90 != v89)
        {
          v80 = 0;
          v81 = 0;
          v82 = 0;
          v25 = operator new();
          *(_QWORD *)v25 = &off_1EA5006C8;
          *(_BYTE *)(v25 + 8) = 0;
          *(_DWORD *)(v25 + 12) = 1;
          *(_OWORD *)(v25 + 16) = 0u;
          *(_OWORD *)(v25 + 32) = 0u;
          *(_OWORD *)(v25 + 48) = 0u;
          *(_OWORD *)(v25 + 64) = 0u;
          *(_QWORD *)(v25 + 80) = 0;
          *(_OWORD *)(v25 + 88) = *MEMORY[0x1E0C9D820];
          std::shared_ptr<MaxRectTexturePacker>::shared_ptr[abi:ne180100]<MaxRectTexturePacker,void>(&v78, v25);
          v26 = v78;
          *(int64x2_t *)(v78 + 88) = v67;
          (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v26 + 16))(v26, (unint64_t)(v90 - v89) >> 5);
          v27 = v89;
          v28 = v90;
          while (v27 != v28)
          {
            image = *(CGImageRef *)v27;
            if (v27[31] < 0)
            {
              std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v27 + 1), *((_QWORD *)v27 + 2));
            }
            else
            {
              v29 = *(_OWORD *)(v27 + 8);
              __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v27 + 3);
              *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v29;
            }
            *(_OWORD *)v76 = 0u;
            v77 = 0u;
            -[SKTextureAtlasPacker calcNonAlphaArea:](self, "calcNonAlphaArea:");
            v76[0] = v30;
            v76[1] = v31;
            *(_QWORD *)&v77 = v32;
            *((_QWORD *)&v77 + 1) = v33;
            v34 = v81;
            if (v81 >= v82)
            {
              v37 = (char *)v80;
              v38 = (v81 - (_BYTE *)v80) >> 5;
              v39 = v38 + 1;
              if ((unint64_t)(v38 + 1) >> 59)
                std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
              v40 = v82 - (_BYTE *)v80;
              if ((v82 - (_BYTE *)v80) >> 4 > v39)
                v39 = v40 >> 4;
              if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFE0)
                v41 = 0x7FFFFFFFFFFFFFFLL;
              else
                v41 = v39;
              if (v41)
              {
                v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v82, v41);
                v37 = (char *)v80;
                v34 = v81;
              }
              else
              {
                v42 = 0;
              }
              v43 = v77;
              v44 = &v42[32 * v38];
              *(_OWORD *)v44 = *(_OWORD *)v76;
              *((_OWORD *)v44 + 1) = v43;
              if (v34 == v37)
              {
                v47 = &v42[32 * v38];
              }
              else
              {
                v45 = &v42[32 * v38];
                do
                {
                  v46 = *((_OWORD *)v34 - 1);
                  v47 = v45 - 32;
                  *((_OWORD *)v45 - 2) = *((_OWORD *)v34 - 2);
                  *((_OWORD *)v45 - 1) = v46;
                  v34 -= 32;
                  v45 -= 32;
                }
                while (v34 != v37);
              }
              v36 = v44 + 32;
              v80 = v47;
              v81 = v44 + 32;
              v82 = &v42[32 * v41];
              if (v37)
                operator delete(v37);
            }
            else
            {
              v35 = v77;
              *(_OWORD *)v81 = *(_OWORD *)v76;
              *((_OWORD *)v34 + 1) = v35;
              v36 = v34 + 32;
            }
            v81 = v36;
            (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)v78 + 24))(v78, &v77);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            v27 += 32;
          }
          v76[0] = 0;
          v76[1] = 0;
          *(_QWORD *)&v77 = 0;
          if (((*(uint64_t (**)(uint64_t, void **, _BOOL4, uint64_t))(*(_QWORD *)v78 + 32))(v78, v76, v68, 1) & 0x80000000) == 0)
          {
            v74 = v78;
            v75 = v79;
            if (v79)
            {
              p_shared_owners = (unint64_t *)&v79->__shared_owners_;
              do
                v49 = __ldxr(p_shared_owners);
              while (__stxr(v49 + 1, p_shared_owners));
            }
            -[SKTextureAtlasPacker processPackedTextureAtlas:suffix:packer:sortedTrimArray:sortedTextureArray:](self, "processPackedTextureAtlas:suffix:packer:sortedTrimArray:sortedTextureArray:", v76, v72, &v74, &v80, &v89);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addObjectsFromArray:", v50);

            v51 = v75;
            if (v75)
            {
              v52 = (unint64_t *)&v75->__shared_owners_;
              do
                v53 = __ldaxr(v52);
              while (__stlxr(v53 - 1, v52));
              if (!v53)
              {
                ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
                std::__shared_weak_count::__release_weak(v51);
              }
            }
            v54 = v90;
            if (v89 != v90)
            {
              v55 = v89 + 8;
              do
              {
                v57 = v55 - 8;
                v56 = (CGImage *)*((_QWORD *)v55 - 1);
                image = v56;
                if (v55[23] < 0)
                {
                  std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v55, *((_QWORD *)v55 + 1));
                  v56 = image;
                }
                else
                {
                  v58 = *(_OWORD *)v55;
                  __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v55 + 2);
                  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v58;
                }
                CGImageRelease(v56);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__p.__r_.__value_.__l.__data_);
                v55 += 32;
              }
              while (v57 + 32 != v54);
            }
          }
          if (v76[0])
          {
            v76[1] = v76[0];
            operator delete(v76[0]);
          }
          v59 = v79;
          if (v79)
          {
            v60 = (unint64_t *)&v79->__shared_owners_;
            do
              v61 = __ldaxr(v60);
            while (__stlxr(v61 - 1, v60));
            if (!v61)
            {
              ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
              std::__shared_weak_count::__release_weak(v59);
            }
          }
          if (v80)
          {
            v81 = (char *)v80;
            operator delete(v80);
          }
        }

        image = (CGImageRef)&v89;
        std::vector<TextureInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&image);

      }
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
    }
    while (v71);
  }

  objc_msgSend(v64, "setObject:forKey:", v65, CFSTR("images"));
  v62 = objc_retainAutorelease(v64);
  *v63 = v62;

}

@end
