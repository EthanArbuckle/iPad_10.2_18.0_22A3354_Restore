@implementation AutoCropper

- (AutoCropper)init
{
  AutoCropper *v2;
  AutoCropper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AutoCropper;
  v2 = -[AutoCropper init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AutoCropper setShouldFavorTop:](v2, "setShouldFavorTop:", 0);
    -[AutoCropper setShouldFavorBottom:](v3, "setShouldFavorBottom:", 0);
    v3->originalImageSize.width = 0.0;
    v3->originalImageSize.height = 0.0;
  }
  return v3;
}

- (CGRect)scaleRect:(CGRect)a3 byScale:(double)a4
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = a3.origin.x + a3.size.width * 0.5;
  v5 = a3.origin.y + a3.size.height * 0.5;
  v6 = a3.size.height * a4;
  v7 = a3.size.width * a4;
  v8 = v4 - v7 * 0.5;
  v9 = v5 - v6 * 0.5;
  result.size.height = v6;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)expandRect:(CGRect)result toContainRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a4.origin.y + a4.size.height;
  v5 = a4.origin.x + a4.size.width;
  if (result.origin.y + result.size.height < v4)
    result.size.height = v4 - result.origin.y;
  if (result.origin.x + result.size.width < v5)
    result.size.width = v5 - result.origin.x;
  v6 = result.origin.y - a4.origin.y;
  if (result.origin.y <= a4.origin.y)
    v6 = -0.0;
  v7 = v6 + result.size.height;
  if (result.origin.y > a4.origin.y)
    result.origin.y = a4.origin.y;
  v8 = result.origin.x - a4.origin.x;
  if (result.origin.x <= a4.origin.x)
    v8 = -0.0;
  v9 = v8 + result.size.width;
  if (result.origin.x > a4.origin.x)
    result.origin.x = a4.origin.x;
  result.size.height = v7;
  result.size.width = v9;
  return result;
}

- (CGRect)computeClippingWithinSize:(CGSize)a3 andImportantRect:(CGRect)a4
{
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 shouldFavorTop;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a3.height;
  v5 = a4.origin.x + a4.size.width * 0.5;
  v6 = a4.origin.y + a4.size.height * 0.5;
  if (v6 >= height * 0.5)
  {
    if (v6 > (height + height) / 3.0)
    {
      if (!self->shouldFavorBottom)
      {
        v11 = (height - v6) * 3.0;
        v10 = height - v11;
        height = v11;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    shouldFavorTop = self->shouldFavorTop;
    v7 = 1.5;
LABEL_11:
    v13 = v6 * v7;
    if (!shouldFavorTop)
      height = v13;
LABEL_13:
    v10 = 0.0;
    goto LABEL_14;
  }
  v7 = 3.0;
  if (v6 <= height / 3.0)
  {
    shouldFavorTop = self->shouldFavorTop;
    goto LABEL_11;
  }
  v8 = (height - v6) * 1.5;
  v9 = height - v8;
  if (self->shouldFavorBottom)
  {
    v10 = 0.0;
  }
  else
  {
    height = v8;
    v10 = v9;
  }
LABEL_14:
  if (v5 >= a3.width * 0.5)
  {
    v15 = 3.0;
    if (v5 > (a3.width + a3.width) / 3.0)
    {
      v14 = a3.width - v5;
      goto LABEL_19;
    }
    v16 = v5 * 1.5;
LABEL_22:
    v17 = 0.0;
    goto LABEL_23;
  }
  if (v5 <= a3.width / 3.0)
  {
    v16 = v5 * 3.0;
    goto LABEL_22;
  }
  v14 = a3.width - v5;
  v15 = 1.5;
LABEL_19:
  v16 = v14 * v15;
  v17 = a3.width - v16;
LABEL_23:
  v18 = height;
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v10;
  result.origin.x = v17;
  return result;
}

- (int)getRatioOfSize:(CGSize)a3
{
  double v4;

  if (a3.height * 4.0 == a3.width * 3.0)
    return 1;
  if (a3.height * 3.0 == a3.width + a3.width)
    return 2;
  if (a3.height * 16.0 == a3.width * 9.0)
    return 3;
  if (a3.height == a3.width)
    return 4;
  v4 = a3.height * 5.0;
  if (v4 == a3.width * 3.0)
    return 5;
  if (v4 == a3.width * 4.0)
    return 6;
  return 7;
}

- (CGRect)scaleRect:(CGRect)a3 toFitSize:(CGSize)a4 withAnchorPoint:(CGPoint)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double y;
  double x;
  double height;
  double width;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  char v39;
  CGRect result;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  v15 = a3.size.height;
  v16 = a3.size.width;
  v17 = a3.origin.y;
  v18 = a3.origin.x;
  acLog("scaleRect:inner=(%.3f,%.3f,%.3f,%.3f), size=(%.3f,%.3f), anchor=(%.3f,%.3f)\n", (uint64_t)a2, v5, v6, v7, v8, v9, v10, SLOBYTE(a3.origin.x));
  if (v18 + v16 >= x && v17 + v16 >= y && v17 <= y && v18 <= x)
  {
    v29 = v15 - (y - v17);
    v30 = x - v18;
    v31 = v16 - (x - v18);
    v32 = y / (y - v17);
    if ((height - y) / v29 < v32)
      v32 = (height - y) / v29;
    if (x / v30 < v32)
      v32 = x / v30;
    if ((width - x) / v31 < v32)
      v32 = (width - x) / v31;
    v33 = (y - v17) * v32;
    v34 = v30 * v32;
    v18 = x - v34;
    v17 = y - v33;
    v16 = v34 + v31 * v32;
    v15 = v33 + v29 * v32;
  }
  else
  {
    acLog("ERROR <AutoCropper>: Point should be within rect", v19, v20, v21, v22, v23, v24, v25, v39);
  }
  v35 = v18;
  v36 = v17;
  v37 = v16;
  v38 = v15;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGRect)rectWithSize:(CGSize)a3 andPoint:(CGPoint)a4 inPosition:(int)a5 fromOriginalSize:(CGSize)a6
{
  double x;
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double y;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGRect result;

  x = a4.x;
  height = a3.height;
  width = a3.width;
  v9 = 0.0;
  if (a5 > 0xD)
  {
    v10 = 0.0;
    goto LABEL_15;
  }
  if (((1 << a5) & 0x854) != 0)
  {
    v12 = (a3.width - x) * 0.5;
    if (x < v12)
      v12 = x;
    v10 = x - v12;
    goto LABEL_14;
  }
  if (((1 << a5) & 0x10A8) != 0)
  {
    v12 = a3.width - x;
    if (a3.width - x >= x * 0.5)
      v12 = x * 0.5;
    v10 = x + v12 * -2.0;
LABEL_14:
    width = v12 * 3.0;
    goto LABEL_15;
  }
  v10 = 0.0;
  if (((1 << a5) & 0x2700) != 0)
  {
    v11 = a3.width - x;
    if (x < a3.width - x)
      v11 = x;
    v10 = x - v11;
    width = v11 + v11;
  }
LABEL_15:
  if (a5 > 0xE)
  {
    v13 = height;
    goto LABEL_31;
  }
  if (((1 << a5) & 0x231) != 0)
  {
    if (a4.y >= (height - a4.y) * 0.5)
      y = (height - a4.y) * 0.5;
    else
      y = a4.y;
    v9 = a4.y - y;
LABEL_30:
    v13 = y * 3.0;
    goto LABEL_31;
  }
  if (((1 << a5) & 0x4C2) != 0)
  {
    y = a4.y * 0.5;
    if (height - a4.y < a4.y * 0.5)
      y = height - a4.y;
    v9 = a4.y + y * -2.0;
    goto LABEL_30;
  }
  v13 = height;
  if (((1 << a5) & 0x5900) != 0)
  {
    if (a4.y >= height - a4.y)
      v14 = height - a4.y;
    else
      v14 = a4.y;
    v9 = a4.y - v14;
    v13 = v14 + v14;
  }
LABEL_31:
  v16 = height / a3.width;
  if (v13 / width >= v16)
  {
    if (v13 / width > v16)
    {
      v18 = -(a4.y - v9) / v13;
      v13 = v16 * width;
      v9 = a4.y + v18 * (v16 * width);
    }
  }
  else
  {
    v17 = v13 / v16;
    v10 = x + -(x - v10) / width * v17;
    width = v17;
  }
  v19 = v10;
  v20 = v13;
  result.size.height = v20;
  result.size.width = width;
  result.origin.y = v9;
  result.origin.x = v19;
  return result;
}

- (CGRect)rectContainingRect:(CGRect)result andOtherRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = result.origin.x + result.size.width;
  v5 = a4.origin.x + a4.size.width;
  if (v4 <= v5)
    v4 = v5;
  v6 = result.origin.y + result.size.height;
  if (v6 <= a4.origin.y + a4.size.height)
    v6 = a4.origin.y + a4.size.height;
  if (result.origin.x >= a4.origin.x)
    result.origin.x = a4.origin.x;
  v7 = v4 - result.origin.x;
  if (result.origin.y >= a4.origin.y)
    result.origin.y = a4.origin.y;
  v8 = v6 - result.origin.y;
  result.size.height = v8;
  result.size.width = v7;
  return result;
}

- (id)clusterRects:(id)a3
{
  id i;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGRect v18;
  CGRect v19;
  __int128 v20;
  __int128 v21;

  i = a3;
  if (objc_msgSend(a3, "count") != 1)
  {
    for (i = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", i);
          objc_msgSend(i, "count") != 1;
          objc_msgSend(i, "removeObjectAtIndex:", v13))
    {
      v6 = objc_msgSend(i, "count");
      v20 = 0u;
      v21 = 0u;
      if (v6 < 2)
        break;
      v7 = 0;
      v8 = (v6 - 1);
      v9 = v6;
      v10 = v6;
      for (j = 1; ; ++j)
      {
        memset(&v19, 0, sizeof(v19));
        objc_msgSend((id)objc_msgSend(i, "objectAtIndex:", v7), "getValue:", &v19);
        v12 = v7 + 1;
        if (v7 + 1 < v9)
          break;
LABEL_10:
        ++v7;
        if (v12 == v8)
          return i;
      }
      v13 = j;
      while (1)
      {
        objc_msgSend((id)objc_msgSend(i, "objectAtIndex:", v13, 0, 0, 0, 0), "getValue:", &v18);
        if (CGRectIntersectsRect(v19, v18))
          break;
        if (v10 == ++v13)
          goto LABEL_10;
      }
      -[AutoCropper rectContainingRect:andOtherRect:](self, "rectContainingRect:andOtherRect:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size, *(_OWORD *)&v19.origin, *(_OWORD *)&v19.size);
      *(_QWORD *)&v20 = v14;
      *((_QWORD *)&v20 + 1) = v15;
      *(_QWORD *)&v21 = v16;
      *((_QWORD *)&v21 + 1) = v17;
      objc_msgSend(i, "replaceObjectAtIndex:withObject:", v7, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v20, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
    }
  }
  return i;
}

- (CGRect)computeClippingWithinSize:(CGSize)a3 andImportantRects:(id)a4
{
  double height;
  double width;
  void *v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  const char *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  char v58;
  float v59;
  double v60;
  float v61;
  double v62;
  double v63;
  double v64;
  float v65;
  double v66;
  double v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v75 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  objc_msgSend((id)objc_msgSend(v8, "valueForKey:", CFSTR("AspectRatioCutoff")), "floatValue");
  v61 = v9;
  objc_msgSend((id)objc_msgSend(v8, "valueForKey:", CFSTR("MinimumCroppedArea")), "floatValue");
  v59 = v10;
  objc_msgSend((id)objc_msgSend(v8, "valueForKey:", CFSTR("ProximityToCenter")), "floatValue");
  v65 = v11;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v12)
  {
    v20 = v12;
    v21 = *(_QWORD *)v71;
    v22 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    v25 = 0.0;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v71 != v21)
          objc_enumerationMutation(a4);
        v27 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v68 = 0u;
        v69 = 0u;
        objc_msgSend(v27, "getValue:", &v68);
        if (*((double *)&v69 + 1) * *(double *)&v69 > v22 * v23)
        {
          v24 = *((double *)&v68 + 1);
          v25 = *(double *)&v68;
          v22 = *((double *)&v69 + 1);
          v23 = *(double *)&v69;
        }
      }
      v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v70, v74, 16, *((double *)&v69 + 1), *(double *)&v69, *((double *)&v69 + 1) * *(double *)&v69);
    }
    while (v20);
  }
  else
  {
    v22 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    v25 = 0.0;
  }
  v28 = v23 * 0.5 + v25;
  v29 = v22 * 0.5 + v24;
  v30 = v22 * v23;
  acLog("Face area is %f, Total is %f\n", v13, v14, v15, v16, v17, v18, v19, SLOBYTE(v30));
  v67 = width * height;
  if (v30 * 1.1 < width * height / 9.0
    || (acLog("Large Face!\n", v31, v32, v33, v34, v35, v36, v37, v58),
        v38 = 0.0,
        (height * height + width * width) * v65 <= (v29 - height * 0.5) * (v29 - height * 0.5)
                                                 + (v28 - width * 0.5) * (v28 - width * 0.5)))
  {
    v40 = 0;
    v62 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v63 = *MEMORY[0x1E0C9D648];
    v64 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v66 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v60 = v59;
    v41 = 7;
    v42 = width * height;
    do
    {
      v43 = width;
      v44 = height;
      switch(v40)
      {
        case 0:
          break;
        case 1:
          v44 = 9.0;
          v43 = 12.0;
          break;
        case 2:
          v44 = 6.0;
          v43 = 9.0;
          break;
        case 3:
          v44 = 27.0;
          v43 = 48.0;
          break;
        case 4:
          v43 = 20.0;
          v44 = 20.0;
          break;
        case 5:
          v44 = 9.0;
          goto LABEL_24;
        case 6:
          v44 = 12.0;
LABEL_24:
          v43 = 15.0;
          break;
        default:
          acLog("ERROR <AutoCropper>: unrecognized aspect ratio\n", v31, v32, v33, v34, v35, v36, v37, v58);
          v43 = 0.0;
          v44 = 0.0;
          break;
      }
      v45 = 4;
      do
      {
        -[AutoCropper rectWithSize:andPoint:inPosition:fromOriginalSize:](self, "rectWithSize:andPoint:inPosition:fromOriginalSize:", v45, v43, v44, v28, v29, width, height);
        -[AutoCropper scaleRect:toFitSize:withAnchorPoint:](self, "scaleRect:toFitSize:withAnchorPoint:");
        if ((v67 - v48 * v49) * (float)(v61 + 1.0) < v42 || v41 == 7)
        {
          v62 = v47;
          v63 = v46;
          v64 = v49;
          v66 = v48;
          v42 = v67 - v48 * v49;
          v41 = v40;
        }
        v45 = (v45 + 1);
      }
      while ((_DWORD)v45 != 8);
      ++v40;
    }
    while (v40 != 7);
    v51 = v66;
    v52 = v64;
    if (v66 * v64 >= v67 * v60)
    {
      v53 = "Clipping to original aspect ratio\n";
      v39 = v62;
      v38 = v63;
      switch(v41)
      {
        case 0:
          break;
        case 1:
          v53 = "Clipping to aspect ratio 4:3\n";
          break;
        case 2:
          v53 = "Clipping to aspect ratio 3:2\n";
          break;
        case 3:
          v53 = "Clipping to aspect ratio 16:9\n";
          break;
        case 4:
          v53 = "Clipping to square\n";
          break;
        case 5:
          v53 = "Clipping to aspect ratio 5:3\n";
          break;
        case 6:
          v53 = "Clipping to aspect ratio 5:4\n";
          break;
        default:
          v53 = "ERROR <AutoCropper>: unrecognized aspect ratio\n";
          v39 = v62;
          v38 = v63;
          break;
      }
    }
    else
    {
      v38 = 0.0;
      v53 = "No Crop. Reduces area too much\n";
      v39 = 0.0;
      v51 = width;
      v52 = height;
    }
    acLog(v53, v31, v32, v33, v34, v35, v36, v37, v58);
    width = v51;
    height = v52;
  }
  else
  {
    v39 = 0.0;
  }
  v54 = v38;
  v55 = v39;
  v56 = width;
  v57 = height;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (int)determineBestPositionWithinSize:(CGSize)a3 forImportantRect:(CGRect)a4 restrictRect:(CGRect)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  int v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78[4];
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;

  height = a3.height;
  width = a3.width;
  v88 = *MEMORY[0x1E0C80C00];
  v8 = a4.origin.x + a4.size.width * 0.5;
  v9 = a4.origin.y + a4.size.height * 0.5;
  v10 = (float)((float)(int)getCFPreferenceNumber(CFSTR("MinCropPercentage"), CFSTR("com.apple.mobileslideshow"), 75)
              / 100.0);
  acLog("determineBestPositionWithinSize:size=%.3f,%.3f, center=%.3f,%.3f, minPercentage=%.3f, restrict=%.3f,%.3f,%.3f,%.3f\n", v11, v12, v13, v14, v15, v16, v17, SLOBYTE(width));
  if (self->originalImageSize.height * self->originalImageSize.width == 0.0)
    v25 = height * width;
  else
    v25 = self->originalImageSize.height * self->originalImageSize.width;
  acLog("originalArea = %.2f\n", v18, v19, v20, v21, v22, v23, v24, SLOBYTE(v25));
  v26 = 0;
  v27 = 0.0;
  v28 = 15;
  do
  {
    -[AutoCropper rectWithSize:andPoint:inPosition:fromOriginalSize:](self, "rectWithSize:andPoint:inPosition:fromOriginalSize:", v26, width, height, v8, v9, width, height);
    v31 = v30 * v29;
    acLog("pos = %d, rect=(%.2f,%.2f,%.2f,%.2f), area=%.2f\n", v32, v33, v34, v35, v36, v37, v38, v26);
    v78[v26] = v31;
    if (v31 > v27)
    {
      v27 = v31;
      v28 = v26;
    }
    ++v26;
  }
  while (v26 != 15);
  if (v27 / v25 < v10)
    return 15;
  v47 = v25 * v10;
  switch(v28)
  {
    case 0:
      v48 = v79;
      v49 = v80;
      v50 = v84;
      if (v79 <= v80)
      {
        if (v80 > v84)
          goto LABEL_45;
      }
      else if (v79 > v84)
      {
        v63 = v79 / v25;
        acLog("    topleft=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v63));
        if (v48 > v47)
          return 4;
        return v28;
      }
      v68 = v84 / v25;
      acLog("    topcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v68));
      if (v50 > v47)
        return 9;
      return v28;
    case 1:
      v51 = v81;
      v52 = v82;
      v53 = v85;
      if (v81 <= v82)
      {
        if (v82 > v85)
        {
          v69 = v82 / v25;
          acLog("    bottomright=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v69));
          if (v52 > v47)
            return 7;
          return v28;
        }
      }
      else if (v81 > v85)
      {
        goto LABEL_21;
      }
      v75 = v85 / v25;
      acLog("    bottomcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v75));
      if (v53 > v47)
        return 10;
      return v28;
    case 2:
      v51 = v81;
      v54 = v79;
      v55 = v86;
      if (v81 <= v79)
      {
        if (v79 > v86)
        {
          v70 = v79 / v25;
          acLog("    topleft=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v70));
          if (v54 > v47)
            return 4;
          return v28;
        }
      }
      else if (v81 > v86)
      {
LABEL_21:
        v64 = v51 / v25;
        acLog("    bottomleft=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v64));
        if (v51 > v47)
          return 6;
        return v28;
      }
      v76 = v86 / v25;
      acLog("    leftcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v76));
      if (v55 > v47)
        return 11;
      return v28;
    case 3:
      v56 = v82;
      v49 = v80;
      v57 = v87;
      if (v82 <= v80)
      {
        if (v80 > v87)
        {
LABEL_45:
          v71 = v49 / v25;
          acLog("    topright=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v71));
          if (v49 > v47)
            return 5;
          return v28;
        }
      }
      else if (v82 > v87)
      {
        v65 = v82 / v25;
        acLog("    bottomright=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v65));
        if (v56 > v47)
          return 7;
        return v28;
      }
      v77 = v87 / v25;
      acLog("    rightcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v77));
      if (v57 > v47)
        return 12;
      return v28;
    case 13:
      v59 = v84;
      v58 = v85;
      v60 = v83;
      if (v85 <= v84)
      {
        if (v84 <= v83)
          goto LABEL_53;
        v72 = v84 / v25;
        acLog("    topcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v72));
        if (v59 > v47)
          return 9;
      }
      else
      {
        if (v85 <= v83)
          goto LABEL_53;
        v66 = v85 / v25;
        acLog("    bottomcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v66));
        if (v58 > v47)
          return 10;
      }
      return v28;
    case 14:
      v62 = v86;
      v61 = v87;
      v60 = v83;
      if (v86 > v87)
      {
        if (v86 > v83)
        {
          v67 = v86 / v25;
          acLog("    leftcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v67));
          if (v62 > v47)
            return 11;
          return v28;
        }
LABEL_53:
        v74 = v60 / v25;
        acLog("    center=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v74));
        if (v60 > v47)
          return 8;
        return v28;
      }
      if (v87 <= v83)
        goto LABEL_53;
      v73 = v87 / v25;
      acLog("    rightcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v73));
      if (v61 > v47)
        return 12;
      return v28;
    default:
      return v28;
  }
}

- (CGRect)computeClippingWithinSize:(CGSize)a3 forImportantRect:(CGRect)a4 andType:(int)a5 restrictRect:(CGRect)a6
{
  double height;
  double width;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v9 = a4.origin.x + a4.size.width * 0.5;
  v10 = a4.origin.y + a4.size.height * 0.5;
  v11 = -[AutoCropper determineBestPositionWithinSize:forImportantRect:restrictRect:](self, "determineBestPositionWithinSize:forImportantRect:restrictRect:", *(_QWORD *)&a5, a3.width, a3.height, *(_QWORD *)&a6.origin.x, *(_QWORD *)&a6.origin.y, *(_QWORD *)&a6.size.width, *(_QWORD *)&a6.size.height);
  acLog("Best is %d\n", v12, v13, v14, v15, v16, v17, v18, v11);
  -[AutoCropper rectWithSize:andPoint:inPosition:fromOriginalSize:](self, "rectWithSize:andPoint:inPosition:fromOriginalSize:", v11, width, height, v9, v10, width, height);
  -[AutoCropper scaleRect:toFitSize:withAnchorPoint:](self, "scaleRect:toFitSize:withAnchorPoint:");
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)computeClippingWithinSize:(CGSize)a3 forMultipleRects:(id)a4
{
  double height;
  double width;
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  uint64_t i;
  void *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  double v28;
  float v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v44 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v7 = a3.height;
  v41 = 0u;
  v42 = 0u;
  v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v8)
  {
    v16 = v8;
    v17 = *(_QWORD *)v40;
    v18 = 0.0;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(a4);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v20, "getValue:", &v37);
        if (*((double *)&v37 + 1) < v7)
          v7 = *((double *)&v37 + 1);
        if (*((double *)&v37 + 1) + *((double *)&v38 + 1) > v18)
          v18 = *((double *)&v37 + 1) + *((double *)&v38 + 1);
      }
      v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v16);
  }
  else
  {
    v18 = 0.0;
  }
  if (v18 <= v7)
  {
    v28 = 0.0;
    goto LABEL_24;
  }
  v21 = height / 3.0;
  v22 = height * 0.5;
  v24 = (float)(v7 + v18) * 0.5;
  v25 = vabds_f32(v21, v24);
  v26 = vabds_f32(v22, v24);
  v27 = vabds_f32(v21 + v21, v24);
  v28 = 0.0;
  if (v25 >= v26)
  {
    if (v26 < v27)
    {
LABEL_22:
      v32 = 0.0;
      v33 = width;
      v31 = height;
      goto LABEL_23;
    }
LABEL_21:
    acLog("Want bottom\n", v9, v10, v11, v12, v13, v14, v15, v37);
    v28 = 0.0;
    goto LABEL_22;
  }
  if (v25 >= v27)
    goto LABEL_21;
  v29 = width / height;
  if (v24 <= v21)
  {
    v36 = v24 * 3.0;
    v33 = (float)((float)(v24 * 3.0) * v29);
    v31 = v36;
    v28 = 0.0;
    v32 = 0.0;
  }
  else
  {
    v30 = (height - v24) * 3.0 * 0.5;
    v31 = v30;
    v32 = height - v30;
    v33 = (float)(v29 * v30);
    v28 = 0.0;
  }
LABEL_23:
  v23 = width * height;
  if (v33 * v31 / v23 >= 0.8)
  {
    height = v31;
    width = v33;
    goto LABEL_26;
  }
LABEL_24:
  v32 = 0.0;
LABEL_26:
  v34 = width;
  v35 = height;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v32;
  result.origin.x = v28;
  return result;
}

- (BOOL)shouldFavorTop
{
  return self->shouldFavorTop;
}

- (void)setShouldFavorTop:(BOOL)a3
{
  self->shouldFavorTop = a3;
}

- (BOOL)shouldFavorBottom
{
  return self->shouldFavorBottom;
}

- (void)setShouldFavorBottom:(BOOL)a3
{
  self->shouldFavorBottom = a3;
}

- (CGSize)originalImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->originalImageSize.width;
  height = self->originalImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOriginalImageSize:(CGSize)a3
{
  self->originalImageSize = a3;
}

@end
