@implementation TDPhotoshopRenditionSpec

- (void)dealloc
{
  objc_super v3;

  -[TDPhotoshopRenditionSpec setHistogram:](self, "setHistogram:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDPhotoshopRenditionSpec;
  -[TDPhotoshopRenditionSpec dealloc](&v3, sel_dealloc);
}

- (int)psdSliceNumberForRenditionRow:(int)a3 sliceRow:(int)a4 renditionColumn:(int)a5 sliceColumn:(int)a6 rowsPerRendition:(int)a7 columnsPerRendition:(int)a8 renditionColumnCount:(int)a9
{
  return a6 + (a5 + (a4 + a7 * a3) * a9) * a8 + 1;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rendition with asset %@ and key %@"), objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopRenditionSpec production](self, "production"), "asset"), "name"), objc_msgSend((id)-[TDPhotoshopRenditionSpec keySpec](self, "keySpec"), "debugDescription"));
}

- (void)_logError:(id)a3
{
  NSLog(CFSTR("%@"), a2, a3);
}

- (void)_logWarning:(id)a3
{
  NSLog(CFSTR("%@"), a2, a3);
}

- (BOOL)_sliceRectanglesForPSDImage:(id)a3 rowsPerRendition:(int *)a4 columnsPerRendition:(int *)a5 originalColumnWidth:(int *)a6 newColumnWidth:(int *)a7 originalRowHeight:(int *)a8 newRowHeight:(int *)a9 originalColumnX:(int *)a10 originalRowY:(int *)a11 newRenditionSize:(id *)a12 newSliceCount:(int *)a13 renditionRect:(CGRect *)a14 throwawaySliceRect:(CGRect *)a15
{
  TDPhotoshopRenditionSpec *v19;
  void *v20;
  unsigned int v21;
  double v22;
  double v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  int *v35;
  double v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  CGPoint v42;
  CGSize v43;
  int v44;
  uint64_t v45;
  BOOL v46;
  int v47;
  uint64_t v49;
  uint64_t v50;
  _BOOL4 v52;
  int v53;
  uint64_t v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  double v67;
  BOOL v69;
  BOOL v70;
  int v71;
  char v72;
  int v73;
  int v74;
  int v75;
  int v76;
  BOOL result;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  int v85;
  int v86;
  int v87;
  uint64_t v88;
  int *v90;
  int v91;
  _BOOL4 v93;
  TDPhotoshopRenditionSpec *v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  NSRect v99;

  v19 = self;
  v20 = (void *)-[TDPhotoshopRenditionSpec production](self, "production");
  v21 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](v19, "renditionType"), "identifier");
  v88 = -[TDPhotoshopRenditionSpec _layerIndexInPSDImage:](v19, "_layerIndexInPSDImage:", a3);
  v91 = objc_msgSend((id)objc_msgSend(v20, "columnCount"), "intValue");
  v97 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v19, "valueForKey:", CFSTR("row")), "intValue");
  v96 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v19, "valueForKey:", CFSTR("column")), "intValue");
  objc_msgSend(a3, "size");
  v23 = v22;
  v94 = v19;
  v90 = a8;
  v98 = a3;
  v24 = 40;
  v25 = 22;
  switch(v21)
  {
    case 0u:
      if (objc_msgSend(v20, "renditionSubtype"))
        v25 = objc_msgSend((id)objc_msgSend(v20, "renditionSubtype"), "identifier");
      else
        v25 = 10;
      if (objc_msgSend(a3, "numberOfSlices") != 10)
        goto LABEL_31;
      v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("One part rendition is being distilled with artwork that has more than one slice (%d). Either the rendition is cataloged incorrectly, or the artwork has the wrong number of slices %@"), 9, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"), v81, v82, v83);
      goto LABEL_129;
    case 1u:
      goto LABEL_31;
    case 2u:
      v25 = 25;
      goto LABEL_31;
    case 3u:
      if (objc_msgSend(v20, "renditionSubtype"))
        v25 = objc_msgSend((id)objc_msgSend(v20, "renditionSubtype"), "identifier");
      else
        v25 = 31;
      goto LABEL_31;
    case 5u:
      goto LABEL_6;
    case 8u:
      v24 = 50;
LABEL_6:
      v86 = v24;
      v26 = objc_msgSend((id)objc_msgSend(v20, "columnCount"), "intValue");
      v27 = objc_msgSend((id)objc_msgSend(v20, "rowCount"), "intValue");
      v28 = objc_msgSend(a3, "numberOfSlices") - 1;
      v29 = ((int)v28 / ((int)v27 * (int)v26));
      if ((_DWORD)v28 != (_DWORD)v27 * (_DWORD)v26 * (_DWORD)v29)
      {
        -[TDPhotoshopRenditionSpec _logError:](v19, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Number of slices per rendition %f is not a whole number!"), (double)(int)v28 / (double)((int)v27 * (int)v26)));
        v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Slice count %d rendition rows %d rendition columns %d in %@"), v28, v27, v26, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"), v83);
        goto LABEL_129;
      }
      v95 = v21;
      if ((int)v28 < 1)
      {
        v30 = 0;
        v34 = a7;
        v35 = a6;
        goto LABEL_22;
      }
      v30 = 0;
      v31 = 0;
      v32 = (int)v28;
      v33 = (int)v28 - 1;
      v34 = a7;
      v35 = a6;
      break;
    default:
      v25 = -1;
LABEL_31:
      *a5 = +[TDPhotoshopElementProduction sliceColumnsPerRendition:](TDPhotoshopElementProduction, "sliceColumnsPerRendition:", v21);
      v95 = v21;
      *a4 = +[TDPhotoshopElementProduction sliceRowsPerRendition:](TDPhotoshopElementProduction, "sliceRowsPerRendition:", v21);
      LODWORD(v29) = *a5;
      v34 = a7;
      v35 = a6;
      goto LABEL_32;
  }
  while (1)
  {
    objc_msgSend(v98, "boundsForSlice:", (v30 + 1));
    if (v30)
    {
      if (v36 != (double)v31)
        goto LABEL_21;
    }
    else
    {
      v31 = (uint64_t)v36;
    }
    if (v33 == v30)
      break;
    ++v30;
  }
  v30 = v32;
LABEL_21:
  v19 = v94;
  a8 = v90;
LABEL_22:
  if (v30 == (int)v26)
  {
    v38 = v29;
    LODWORD(v29) = 1;
  }
  else
  {
    if (v30 != (_DWORD)v29 * (_DWORD)v26)
    {
      v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Inconsistent many part structure. Found %ld actual slice columns, %d slices per rendition and %d rendition column count in %@"), v30, v29, v26, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"), v83);
      goto LABEL_129;
    }
    v38 = 1;
  }
  *a4 = v38;
  *a5 = v29;
  v25 = v86;
LABEL_32:
  if ((int)v29 >= 1)
  {
    v39 = 0;
    do
    {
      v35[v39] = -1;
      v34[v39++] = -1;
    }
    while (v39 < *a5);
  }
  v40 = v98;
  if (*a4 >= 1)
  {
    v41 = 0;
    do
    {
      a8[v41] = -1;
      a9[v41++] = -1;
    }
    while (v41 < *a4);
  }
  *a13 = 0;
  v42 = (CGPoint)*MEMORY[0x24BDD1408];
  v43 = *(CGSize *)(MEMORY[0x24BDD1408] + 16);
  a14->origin = (CGPoint)*MEMORY[0x24BDD1408];
  a14->size = v43;
  a15->origin = v42;
  a15->size = v43;
  v44 = *a5;
  if (*a5 < 1)
    return 1;
  v45 = 0;
  v46 = v95 == 3 && v25 == 31;
  v47 = v46;
  if (v95 == 1 && v25 == 22)
    v47 = 1;
  v84 = v47;
  LODWORD(v49) = *a4;
  v87 = v25;
  while ((int)v49 < 1)
  {
LABEL_122:
    ++v45;
    result = 1;
    if (v45 >= v44)
      return result;
  }
  v50 = 0;
  v52 = v95 == 1 && v45 == 2;
  v93 = v52;
  v53 = v84;
  if (v45 != 1)
    v53 = 0;
  v85 = v53;
  while (1)
  {
    LODWORD(v80) = v91;
    v54 = -[TDPhotoshopRenditionSpec psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:](v19, "psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:", v97, v50, v96, v45, v80);
    if ((v54 & 0x80000000) != 0 || v54 >= objc_msgSend(v40, "numberOfSlices"))
    {
      v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Rendition slice number %d for row %d column %d is greater than or equal to slice count %d in %@"), v54, v50, v45, objc_msgSend(v40, "numberOfSlices"), -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"));
      goto LABEL_129;
    }
    objc_msgSend(v40, "boundsForSlice:", v54);
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v99.origin.x = v55;
    v99.origin.y = v57;
    v99.size.width = v59;
    v99.size.height = v61;
    *a14 = NSUnionRect(*a14, v99);
    if ((v56 & 0x80000000) != 0 || (v58 & 0x80000000) != 0)
    {
      v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Slice at row %d column %d has negative x origin %f and/or y origin %f in %@"), v50, v45, *(_QWORD *)&v56, *(_QWORD *)&v58, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"));
      goto LABEL_129;
    }
    if (v60 == 0.0 || v62 == 0.0)
      break;
    v63 = rint(v60);
    v64 = (int)v63;
    v65 = rint(v62);
    v66 = (int)v65;
    v67 = (double)(int)v66;
    if (v63 != (double)(int)v64 || v65 != v67)
      -[TDPhotoshopRenditionSpec _logWarning:](v19, "_logWarning:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: Slice image size w:%d h:%d does not match slice bounds w:%f h:%f in %@"), v64, v66, *(_QWORD *)&v60, *(_QWORD *)&v62, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription")));
    if ((_DWORD)v64)
      v69 = (_DWORD)v66 == 0;
    else
      v69 = 1;
    if (v69)
      -[TDPhotoshopRenditionSpec _logWarning:](v19, "_logWarning:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: Zero width or height slice at row %d column %d within rendition row %d column %d in %@"), v50, v45, v97, v96, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription")));
    v70 = v95 == 2 && v50 == 2;
    v71 = v70;
    v72 = v93;
    if (v70)
      v72 = 1;
    if ((v72 & 1) != 0)
    {
      a15->origin.x = v56;
      a15->origin.y = v58;
      a15->size.width = v60;
      a15->size.height = v62;
    }
    else
    {
      ++*a13;
    }
    v73 = a6[v45];
    if (v73 == -1)
    {
      a6[v45] = v64;
      a10[v45] = (int)v56;
      if (v93)
      {
        a7[v45] = 0;
      }
      else
      {
        if ((int)v64 <= 8)
          v74 = 8;
        else
          v74 = v64;
        if (!v85)
          v74 = v64;
        a7[v45] = v74;
        a12->var0 += v74;
      }
    }
    else if (v73 != (_DWORD)v64)
    {
      -[TDPhotoshopRenditionSpec _logWarning:](v94, "_logWarning:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: Slice geometry inconsistency. Column width for slice at row:%d column:%d layer:%d does not match previous slices in column in %@"), v50, v45, v88, -[TDPhotoshopRenditionSpec debugDescription](v94, "debugDescription")));
    }
    v75 = v90[v50];
    if (v75 == -1)
    {
      v90[v50] = v66;
      a11[v50] = (int)(v23 - v58 - v67);
      if (v71)
      {
        a9[2] = 0;
      }
      else
      {
        if ((int)v66 <= 8)
          v76 = 8;
        else
          v76 = v66;
        if (v87 != 25 || v50 != 1 || v95 != 2)
          v76 = v66;
        a12->var1 += v76;
        a9[v50] = v76;
      }
      v19 = v94;
      v40 = v98;
    }
    else
    {
      v46 = v75 == (_DWORD)v66;
      v19 = v94;
      v40 = v98;
      if (!v46)
        -[TDPhotoshopRenditionSpec _logWarning:](v94, "_logWarning:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: Slice geometry inconsistency. Row height for slice at row:%d column:%d layer:%d does not match previous slices in row in %@"), v50, v45, v88, -[TDPhotoshopRenditionSpec debugDescription](v94, "debugDescription")));
    }
    ++v50;
    v49 = *a4;
    if (v50 >= v49)
    {
      v44 = *a5;
      goto LABEL_122;
    }
  }
  v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Slice bounds height %f or width %f is zero in %@"), *(_QWORD *)&v60, *(_QWORD *)&v62, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"), v82, v83);
LABEL_129:
  -[TDPhotoshopRenditionSpec _logError:](v19, "_logError:", v37);
  return 0;
}

- ($56AE26BFB60993BDE24C7578AE3A2D7B)_subtractThrowawaySliceFromMetricsIfNeeded:(SEL)a3 metrics:(CGRect)a4 renditionRect:(id *)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  $56AE26BFB60993BDE24C7578AE3A2D7B *result;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize var1;

  height = a6.size.height;
  width = a6.size.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  result = ($56AE26BFB60993BDE24C7578AE3A2D7B *)NSEqualRects(a4, *MEMORY[0x24BDD1408]);
  if ((result & 1) == 0)
  {
    v15 = a5->var0.width;
    v16 = a5->var0.height;
    v18 = a5->var1.width;
    v17 = a5->var1.height;
    if (v9 == height)
    {
      v19 = 0.0;
      if (v15 >= x + v10)
        v19 = v10;
      v15 = v15 - v19;
      if (width - v18 <= x)
        v18 = v18 - v10;
    }
    else if (v10 == width)
    {
      v20 = 0.0;
      if (v16 >= height - y)
        v20 = v9;
      v16 = v16 - v20;
      if (v17 >= y + v9)
        v17 = v17 - v9;
    }
    a5->var0.width = v15;
    a5->var0.height = v16;
    a5->var1.width = v18;
    a5->var1.height = v17;
  }
  var1 = a5->var1;
  retstr->var0 = a5->var0;
  retstr->var1 = var1;
  retstr->var2 = a5->var2;
  return result;
}

- (id)createCSIRepresentationFromPSDImage:(id)a3 withCompression:(BOOL)a4 edgeMetricsMask:(id)a5 textMetricsMask:(id)a6 baselineMetricsMask:(id)a7 auxiliary1MetricsMask:(id)a8 auxiliary2MetricsMask:(id)a9 colorSpaceID:(unint64_t)a10 allowsPaletteImageCompression:(BOOL)a11 allowsHevcCompression:(BOOL)a12 allowsDeepmapImageCompression:(BOOL)a13 allowsDeepmap2ImageCompression:(BOOL)a14
{
  TDPhotoshopRenditionSpec *v19;
  void *v20;
  __int16 v21;
  unsigned int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  CGContext *v42;
  id v43;
  void *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  double v48;
  int v49;
  uint64_t v50;
  double v51;
  int v52;
  int v53;
  TDPhotoshopRenditionSpec *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  void *v58;
  double v59;
  int v60;
  double v61;
  CGImage *v62;
  uint64_t v65;
  __int128 v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  __int128 v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  int v74;
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE v95[80];
  _BYTE v96[80];
  _DWORD v97[20];
  _BYTE v98[80];
  _DWORD v99[20];
  _DWORD v100[20];
  uint64_t v101;
  CGRect v102;
  CGRect v103;

  v69 = a4;
  v19 = self;
  v101 = *MEMORY[0x24BDAC8D0];
  v93 = 0;
  v94 = 0;
  v92 = 0;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v20 = (void *)-[TDPhotoshopRenditionSpec production](self, "production");
  v21 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](v19, "renditionType"), "identifier");
  v22 = -[TDPhotoshopRenditionSpec _layerIndexInPSDImage:](v19, "_layerIndexInPSDImage:", a3);
  v74 = objc_msgSend((id)objc_msgSend(v20, "columnCount"), "intValue");
  v73 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v19, "valueForKey:", CFSTR("row")), "intValue");
  v72 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v19, "valueForKey:", CFSTR("column")), "intValue");
  objc_msgSend(a3, "size");
  v23 = 0;
  if (!-[TDPhotoshopRenditionSpec _sliceRectanglesForPSDImage:rowsPerRendition:columnsPerRendition:originalColumnWidth:newColumnWidth:originalRowHeight:newRowHeight:originalColumnX:originalRowY:newRenditionSize:newSliceCount:renditionRect:throwawaySliceRect:](v19, "_sliceRectanglesForPSDImage:rowsPerRendition:columnsPerRendition:originalColumnWidth:newColumnWidth:originalRowHeight:newRowHeight:originalColumnX:originalRowY:newRenditionSize:newSliceCount:renditionRect:throwawaySliceRect:", a3, &v93, (char *)&v93 + 4, v100, v99, v98, v97, v96, v95, &v94, &v92, &v90, &v88))return v23;
  v75 = a3;
  v24 = v20;
  if (objc_msgSend(v20, "renditionSubtype"))
    v21 = objc_msgSend((id)objc_msgSend(v20, "renditionSubtype"), "identifier");
  v25 = v21;
  v68 = v20;
  if (-[TDPhotoshopRenditionSpec parentRendition](v19, "parentRendition"))
  {
    -[TDRenditionSpec packedPoint](v19, "packedPoint");
    v27 = v26;
    v29 = v28;
    v30 = objc_alloc(MEMORY[0x24BE28C20]);
    v31 = (void *)objc_msgSend(v30, "initWithInternalReferenceRect:layout:", v25, v27, v29, (double)(int)v94, (double)SHIDWORD(v94));
    v32 = objc_alloc_init(MEMORY[0x24BE28C70]);
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopRenditionSpec parentRendition](v19, "parentRendition"), "keySpec"), "key"));
    objc_msgSend(v32, "setReferenceKey:", v33);
    objc_msgSend(v31, "addLayerReference:", v32);

    v24 = v68;
  }
  else
  {
    v34 = objc_alloc(MEMORY[0x24BE28C20]);
    v31 = (void *)objc_msgSend(v34, "initWithCanvasSize:sliceCount:layout:", v92, v25, (double)(int)v94, (double)SHIDWORD(v94));
  }
  objc_msgSend(v31, "setName:", objc_msgSend((id)objc_msgSend(v24, "asset"), "name"));
  objc_msgSend(v31, "setColorSpaceID:", (__int16)a10);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "asset"), "name"), "containsString:", CFSTR("Mask")))objc_msgSend(v31, "setPixelFormat:", 1195456544);
  objc_msgSend(v31, "setIsTintable:", -[TDPhotoshopRenditionSpec isTintable](v19, "isTintable"));
  objc_msgSend(v31, "setAllowsDeepmapImageCompression:", a13);
  objc_msgSend(v31, "setAllowsDeepmap2ImageCompression:", a14);
  objc_msgSend(v31, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](v19, "propertiesAsDictionary"));
  v76 = v31;
  objc_msgSend(v31, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v24, "asset"), "scaleFactor"));
  v35 = MEMORY[0x24BE28A68];
  v36 = *MEMORY[0x24BE28A68];
  v37 = *(_OWORD *)(MEMORY[0x24BE28A68] + 16);
  v86 = *MEMORY[0x24BE28A68];
  v87 = v37;
  if (a5)
  {
    if (v75)
    {
      v70 = v36;
      v66 = v37;
      objc_msgSend(v75, "metricsInMask:forRect:", a5, v90, v91);
      v37 = v66;
      v36 = v70;
      v38 = *((_QWORD *)&v85 + 1);
      v39 = v85;
    }
    else
    {
      v84 = 0u;
      v85 = 0u;
      v83 = 0u;
      v38 = 0;
      v39 = 0;
    }
    v86 = v83;
    v87 = v84;
  }
  else
  {
    v39 = *(_QWORD *)(MEMORY[0x24BE28A68] + 32);
    v38 = *(_QWORD *)(MEMORY[0x24BE28A68] + 40);
  }
  v83 = v86;
  v84 = v87;
  *(_QWORD *)&v85 = v39;
  *((_QWORD *)&v85 + 1) = v38;
  v80 = v36;
  v81 = v37;
  v82 = *(_OWORD *)(v35 + 32);
  if (CSIEqualMetrics())
  {
    v38 = *((_QWORD *)&v91 + 1);
    v39 = v91;
    v86 = 0u;
    v87 = 0u;
  }
  v83 = v86;
  v84 = v87;
  *(_QWORD *)&v85 = v39;
  *((_QWORD *)&v85 + 1) = v38;
  v40 = v31;
  objc_msgSend(v31, "addMetrics:", &v83);
  if (a6)
  {
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
    if (v75)
      objc_msgSend(v75, "metricsInMask:forRect:", a6, v90, v91);
    v80 = v83;
    v81 = v84;
    v82 = v85;
    objc_msgSend(v31, "addMetrics:", &v80);
  }
  if (a7)
  {
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
    if (v75)
      objc_msgSend(v75, "metricsInMask:forRect:", a7, v90, v91);
    v80 = v83;
    v81 = v84;
    v82 = v85;
    objc_msgSend(v31, "addMetrics:", &v80);
  }
  if (a8)
  {
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
    if (v75)
      objc_msgSend(v75, "metricsInMask:forRect:", a8, v90, v91);
    if (v19)
    {
      v77 = v83;
      v78 = v84;
      v79 = v85;
      -[TDPhotoshopRenditionSpec _subtractThrowawaySliceFromMetricsIfNeeded:metrics:renditionRect:](v19, "_subtractThrowawaySliceFromMetricsIfNeeded:metrics:renditionRect:", &v77, v88, v89, v90, v91);
    }
    else
    {
      v81 = 0u;
      v82 = 0u;
      v80 = 0u;
    }
    v83 = v80;
    v84 = v81;
    v85 = v82;
    objc_msgSend(v31, "addMetrics:", &v80);
  }
  if (a9)
  {
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
    if (v75)
      objc_msgSend(v75, "metricsInMask:forRect:", a9, v90, v91);
    if (v19)
    {
      v77 = v83;
      v78 = v84;
      v79 = v85;
      -[TDPhotoshopRenditionSpec _subtractThrowawaySliceFromMetricsIfNeeded:metrics:renditionRect:](v19, "_subtractThrowawaySliceFromMetricsIfNeeded:metrics:renditionRect:", &v77, v88, v89, v90, v91);
    }
    else
    {
      v81 = 0u;
      v82 = 0u;
      v80 = 0u;
    }
    v83 = v80;
    v84 = v81;
    v85 = v82;
    objc_msgSend(v31, "addMetrics:", &v80);
  }
  v41 = (void *)objc_msgSend(v75, "layerRefAtIndex:", v22);
  objc_msgSend(v31, "setBlendMode:", objc_msgSend(v41, "blendMode"));
  objc_msgSend(v41, "opacity");
  objc_msgSend(v31, "setOpacity:");
  v71 = -[TDPhotoshopRenditionSpec parentRendition](v19, "parentRendition");
  if (v71)
  {
    objc_msgSend(v75, "boundsAtLayer:", v22);
    v42 = 0;
    v67 = 0;
  }
  else
  {
    v43 = objc_alloc(MEMORY[0x24BE28C18]);
    v44 = (void *)objc_msgSend(v43, "initWithPixelWidth:pixelHeight:", v94, HIDWORD(v94));
    objc_msgSend(v31, "addBitmap:", v44);
    objc_msgSend(v44, "setPixelFormat:", objc_msgSend(v31, "pixelFormat"));
    v45 = objc_msgSend(v44, "bitmapContext");
    if (!v45)
    {

      -[TDPhotoshopRenditionSpec _logError:](v19, "_logError:", CFSTR("ERROR: Could not create bitmap context"));
      return 0;
    }
    v42 = (CGContext *)v45;
    v67 = v44;
    objc_msgSend(v75, "boundsAtLayer:", v22);
    CGContextSetCompositeOperation();
    CGContextSetAlpha(v42, 1.0);
  }
  v46 = HIDWORD(v93);
  if (SHIDWORD(v93) >= 1)
  {
    v47 = 0;
    v48 = 0.0;
    do
    {
      v49 = v99[v47];
      if (v49)
      {
        v50 = v93;
        if ((int)v93 >= 1)
        {
          v51 = 0.0;
          while (1)
          {
            v52 = v97[(v50 - 1)];
            if (v52)
            {
              v53 = v99[v47];
              LODWORD(v65) = v74;
              v54 = v19;
              v55 = -[TDPhotoshopRenditionSpec psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:](v19, "psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:", v73, (v50 - 1), v72, v47, v93, HIDWORD(v93), v65);
              LOBYTE(v83) = 0;
              v56 = objc_msgSend(v75, "imageFromSlice:atLayer:isEmptyImage:", v55, v22, &v83);
              if (!v56)
              {
                -[TDPhotoshopRenditionSpec _logError:](v19, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Unable to extract Photoshop image: %@\nThings to check:\n1. Are any Photoshop layers missing when compared to the reference file?\n2. Are any of the layer names not matching the layer names in the reference file (case sensitive)?\n3. Are there the same number of slices as in the reference file?\n"), objc_msgSend((id)objc_msgSend(v68, "asset"), "name")));

                return 0;
              }
              v57 = (double)v52;
              if (!v71)
              {
                v58 = (void *)v56;
                CGContextSaveGState(v42);
                v102.origin.x = v48;
                v102.origin.y = v51;
                v102.size.width = (double)v53;
                v102.size.height = (double)v52;
                CGContextClipToRect(v42, v102);
                v59 = (double)(int)v100[v47];
                v60 = vcvtpd_s64_f64((double)(int)v99[v47] / v59);
                if (v60 >= 1)
                {
                  v61 = v48;
                  do
                  {
                    v62 = (CGImage *)objc_msgSend(v58, "image");
                    v103.origin.x = v61;
                    v103.origin.y = v51;
                    v103.size.width = v59;
                    v103.size.height = v57;
                    CGContextDrawImage(v42, v103, v62);
                    v61 = v61 + v59;
                    --v60;
                  }
                  while (v60);
                }
                CGContextRestoreGState(v42);
              }
              objc_msgSend(v76, "addSliceRect:", v48, v51, (double)v53, v57);
              v51 = v51 + (double)(int)v97[(v50 - 1)];
              v19 = v54;
            }
            if (v50-- <= 1)
            {
              v49 = v99[v47];
              v46 = HIDWORD(v93);
              v40 = v76;
              break;
            }
          }
        }
        v48 = v48 + (double)v49;
      }
      ++v47;
    }
    while (v47 < v46);
  }
  objc_msgSend(v40, "setExcludedFromContrastFilter:", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopRenditionSpec production](v19, "production"), "valueForKey:", CFSTR("isExcludedFromFilter")), "BOOLValue"));
  objc_msgSend(v40, "setAllowsPaletteImageCompression:", a11);
  objc_msgSend(v40, "setAllowsHevcCompression:", a12);
  objc_msgSend(v40, "setAllowsDeepmapImageCompression:", a13);
  objc_msgSend(v40, "setAllowsDeepmap2ImageCompression:", a14);
  v23 = (void *)objc_msgSend(v40, "CSIRepresentationWithCompression:", v69);

  return v23;
}

- (id)createCSIRepresentationFromGradientPSDImage:(id)a3 withCompression:(BOOL)a4 colorSpaceID:(unint64_t)a5
{
  __int16 v5;
  _BOOL8 v6;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a5;
  v6 = a4;
  v9 = (void *)-[TDPhotoshopRenditionSpec production](self, "production");
  v10 = objc_alloc(MEMORY[0x24BE28C20]);
  v11 = (void *)objc_msgSend(v10, "initWithCanvasSize:sliceCount:layout:", 0, 6, *MEMORY[0x24BDD1410], *(double *)(MEMORY[0x24BDD1410] + 8));
  objc_msgSend(v11, "setName:", objc_msgSend((id)objc_msgSend(v9, "asset"), "name"));
  objc_msgSend(v11, "setColorSpaceID:", v5);
  objc_msgSend(v11, "setIsTintable:", -[TDPhotoshopRenditionSpec isTintable](self, "isTintable"));
  objc_msgSend(v11, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v9, "asset"), "scaleFactor"));
  v12 = -[TDPhotoshopRenditionSpec _layerIndexInPSDImage:](self, "_layerIndexInPSDImage:", a3);
  v13 = (void *)objc_msgSend(a3, "layerRefAtIndex:", v12);
  objc_msgSend(v13, "opacity");
  objc_msgSend(v11, "setOpacity:");
  objc_msgSend(v11, "setBlendMode:", objc_msgSend(v13, "blendMode"));
  objc_msgSend(v11, "setGradient:", objc_msgSend(a3, "gradientAtLayer:", v12));
  v14 = (void *)objc_msgSend(v11, "CSIRepresentationWithCompression:", v6);

  return v14;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a3;
  v9 = (void *)-[TDPhotoshopRenditionSpec production](self, "production");
  v10 = objc_msgSend(v9, "psdImageRefWithDocument:", a5);
  if (-[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier") == 6)
    return -[TDPhotoshopRenditionSpec createCSIRepresentationFromGradientPSDImage:withCompression:colorSpaceID:](self, "createCSIRepresentationFromGradientPSDImage:withCompression:colorSpaceID:", v10, v7, a4);
  v20 = objc_msgSend(v9, "edgeMetricsMaskWithDocument:", a5);
  v19 = objc_msgSend(v9, "textMetricsMaskWithDocument:", a5);
  v18 = objc_msgSend(v9, "baselineMetricsMaskWithDocument:", a5);
  v12 = objc_msgSend(v9, "auxiliary1MetricsMaskWithDocument:", a5);
  v13 = objc_msgSend(v9, "auxiliary2MetricsMaskWithDocument:", a5);
  v14 = objc_msgSend(a5, "shouldAllowPaletteImageCompression");
  v15 = objc_msgSend(a5, "shouldAllowHevcCompression");
  v16 = objc_msgSend(a5, "shouldAllowDeepmapCompression");
  BYTE3(v17) = objc_msgSend(a5, "shouldAllowDeepmap2Compression");
  BYTE2(v17) = v16;
  BYTE1(v17) = v15;
  LOBYTE(v17) = v14;
  return -[TDPhotoshopRenditionSpec createCSIRepresentationFromPSDImage:withCompression:edgeMetricsMask:textMetricsMask:baselineMetricsMask:auxiliary1MetricsMask:auxiliary2MetricsMask:colorSpaceID:allowsPaletteImageCompression:allowsHevcCompression:allowsDeepmapImageCompression:allowsDeepmap2ImageCompression:](self, "createCSIRepresentationFromPSDImage:withCompression:edgeMetricsMask:textMetricsMask:baselineMetricsMask:auxiliary1MetricsMask:auxiliary2MetricsMask:colorSpaceID:allowsPaletteImageCompression:allowsHevcCompression:allowsDeepmapImageCompression:allowsDeepmap2ImageCompression:", v10, v7, v20, v19, v18, v12, v13, a4, v17);
}

- (id)createCSIRepresentationFromPSDImage:(id)a3 withCompression:(BOOL)a4 colorSpaceID:(unint64_t)a5
{
  uint64_t v6;

  LODWORD(v6) = 0;
  return -[TDPhotoshopRenditionSpec createCSIRepresentationFromPSDImage:withCompression:edgeMetricsMask:textMetricsMask:baselineMetricsMask:auxiliary1MetricsMask:auxiliary2MetricsMask:colorSpaceID:allowsPaletteImageCompression:allowsHevcCompression:allowsDeepmapImageCompression:allowsDeepmap2ImageCompression:](self, "createCSIRepresentationFromPSDImage:withCompression:edgeMetricsMask:textMetricsMask:baselineMetricsMask:auxiliary1MetricsMask:auxiliary2MetricsMask:colorSpaceID:allowsPaletteImageCompression:allowsHevcCompression:allowsDeepmapImageCompression:allowsDeepmap2ImageCompression:", a3, a4, 0, 0, 0, 0, 0, a5, v6);
}

- (int)_layerIndexInPSDImage:(id)a3
{
  if (_layerIndexInPSDImage__pred != -1)
    dispatch_once(&_layerIndexInPSDImage__pred, &__block_literal_global_2);
  if (!-[TDPhotoshopRenditionSpec photoshopLayer](self, "photoshopLayer")
    || _layerIndexInPSDImage__usingOldStylePSDFiles)
  {
    return objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("layer")), "unsignedIntValue");
  }
  else
  {
    return objc_msgSend(a3, "absoluteLayerIndexFromLayerNames:", objc_msgSend((id)-[TDPhotoshopRenditionSpec photoshopLayer](self, "photoshopLayer"), "hierarchicalLayerNames"));
  }
}

uint64_t __50__TDPhotoshopRenditionSpec__layerIndexInPSDImage___block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TEUseOldStylePSDLayout"));
  _layerIndexInPSDImage__usingOldStylePSDFiles = result;
  return result;
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("row")), CFSTR("row"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("column")), CFSTR("column"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("layer")), CFSTR("layer"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("isTintable")), CFSTR("isTintable"));
  objc_msgSend(a3, "setPreserveForArchiveOnly:", -[TDPhotoshopRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
}

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v4 = -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("row"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("row"));
  v5 = -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("column"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("column"));
  v6 = -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("layer"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("layer"));
  v7 = (void *)-[TDPhotoshopRenditionSpec keySpec](self, "keySpec");
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v7, "copyDataFromAttributes"), CFSTR("keySpec"));
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("row"));
  if (v5)
    -[TDPhotoshopRenditionSpec setValue:forKey:](self, "setValue:forKey:", v5, CFSTR("row"));
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("column"));
  if (v6)
    -[TDPhotoshopRenditionSpec setValue:forKey:](self, "setValue:forKey:", v6, CFSTR("column"));
  v7 = objc_msgSend(v4, "objectForKey:", CFSTR("layer"));
  if (v7)
    -[TDPhotoshopRenditionSpec setValue:forKey:](self, "setValue:forKey:", v7, CFSTR("layer"));
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  TDPhotoshopRenditionSpec *v4;
  void *v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  BOOL result;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CGContext *v23;
  id v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  double v29;
  int v30;
  uint64_t v31;
  double v32;
  int v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  int v44;
  double v45;
  CGImage *v46;
  uint64_t IsMonochrome;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  TDPhotoshopRenditionSpec *v53;
  unsigned int v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  int v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  _OWORD v65[2];
  __int128 v66;
  __int128 v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  objc_super v71;
  _BYTE v72[80];
  _BYTE v73[80];
  _DWORD v74[20];
  _BYTE v75[80];
  _DWORD v76[20];
  _DWORD v77[20];
  uint64_t v78;
  CGRect v79;
  CGRect v80;

  v4 = self;
  v78 = *MEMORY[0x24BDAC8D0];
  v71.receiver = self;
  v71.super_class = (Class)TDPhotoshopRenditionSpec;
  -[TDRenditionSpec updatePackingPropertiesWithDocument:](&v71, sel_updatePackingPropertiesWithDocument_);
  v69 = 0;
  v70 = 0;
  v68 = 0;
  v66 = 0u;
  v67 = 0u;
  memset(v65, 0, sizeof(v65));
  v5 = (void *)-[TDPhotoshopRenditionSpec production](v4, "production");
  v6 = (void *)objc_msgSend(v5, "psdImageRefWithDocument:", a3);
  if (-[TDThemeConstant identifier](-[TDRenditionSpec renditionType](v4, "renditionType"), "identifier") != 6)
  {
    if (!-[TDPhotoshopRenditionSpec _sliceRectanglesForPSDImage:rowsPerRendition:columnsPerRendition:originalColumnWidth:newColumnWidth:originalRowHeight:newRowHeight:originalColumnX:originalRowY:newRenditionSize:newSliceCount:renditionRect:throwawaySliceRect:](v4, "_sliceRectanglesForPSDImage:rowsPerRendition:columnsPerRendition:originalColumnWidth:newColumnWidth:originalRowHeight:newRowHeight:originalColumnX:originalRowY:newRenditionSize:newSliceCount:renditionRect:throwawaySliceRect:", v6, &v69, (char *)&v69 + 4, v77, v76, v75, v74, v73, v72, &v70, &v68, &v66, v65))
    {
      if (!v6)
      {
        NSLog(CFSTR("Couldn't read PSD file at '%@'"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "asset"), "fileURLWithDocument:", a3), "path"));
        return 0;
      }
      return 1;
    }
    -[TDPhotoshopRenditionSpec setWidth:](v4, "setWidth:", v70);
    -[TDPhotoshopRenditionSpec setHeight:](v4, "setHeight:", HIDWORD(v70));
  }
  if (!objc_msgSend(a3, "shouldPerformHistogramBasedPacking"))
    return 1;
  v7 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](v4, "renditionType"), "identifier");
  v8 = -[TDPhotoshopRenditionSpec _layerIndexInPSDImage:](v4, "_layerIndexInPSDImage:", v6);
  v58 = objc_msgSend((id)objc_msgSend(v5, "columnCount"), "intValue");
  v57 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v4, "valueForKey:", CFSTR("row")), "intValue");
  v56 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v4, "valueForKey:", CFSTR("column")), "intValue");
  objc_msgSend(v6, "size");
  if (objc_msgSend(v5, "renditionSubtype"))
    v7 = objc_msgSend((id)objc_msgSend(v5, "renditionSubtype"), "identifier");
  result = 1;
  if ((_DWORD)v70 && HIDWORD(v70))
  {
    if (-[TDPhotoshopRenditionSpec parentRendition](v4, "parentRendition"))
    {
      -[TDRenditionSpec packedPoint](v4, "packedPoint");
      v11 = v10;
      v13 = v12;
      v14 = objc_alloc(MEMORY[0x24BE28C20]);
      v15 = (void *)objc_msgSend(v14, "initWithInternalReferenceRect:layout:", v7, v11, v13, (double)(int)v70, (double)SHIDWORD(v70));
      v16 = objc_alloc_init(MEMORY[0x24BE28C70]);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopRenditionSpec parentRendition](v4, "parentRendition"), "keySpec"), "key"));
      objc_msgSend(v16, "setReferenceKey:", v17);
      objc_msgSend(v15, "addLayerReference:", v16);

    }
    else
    {
      v18 = objc_alloc(MEMORY[0x24BE28C20]);
      v15 = (void *)objc_msgSend(v18, "initWithCanvasSize:sliceCount:layout:", v68, v7, (double)(int)v70, (double)SHIDWORD(v70));
    }
    objc_msgSend(v15, "setName:", objc_msgSend((id)objc_msgSend(v5, "asset"), "name"));
    objc_msgSend(v15, "setIsTintable:", -[TDPhotoshopRenditionSpec isTintable](v4, "isTintable"));
    objc_msgSend(v15, "setAllowsDeepmapImageCompression:", objc_msgSend(a3, "shouldAllowDeepmapCompression"));
    objc_msgSend(v15, "setAllowsDeepmap2ImageCompression:", objc_msgSend(a3, "shouldAllowDeepmap2Compression"));
    objc_msgSend(v15, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](v4, "propertiesAsDictionary"));
    objc_msgSend(v15, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v5, "asset"), "scaleFactor"));
    v19 = *(_OWORD *)(MEMORY[0x24BE28A68] + 16);
    v63 = *MEMORY[0x24BE28A68];
    v64 = v19;
    v20 = *(_QWORD *)(MEMORY[0x24BE28A68] + 32);
    v21 = *(_QWORD *)(MEMORY[0x24BE28A68] + 40);
    v59 = v63;
    v60 = v19;
    v61 = v20;
    v62 = v21;
    if (CSIEqualMetrics())
    {
      v21 = *((_QWORD *)&v67 + 1);
      v20 = v67;
      v63 = 0u;
      v64 = 0u;
    }
    v59 = v63;
    v60 = v64;
    v61 = v20;
    v62 = v21;
    objc_msgSend(v15, "addMetrics:", &v59);
    v22 = (void *)objc_msgSend(v6, "layerRefAtIndex:", v8);
    objc_msgSend(v15, "setBlendMode:", objc_msgSend(v22, "blendMode"));
    objc_msgSend(v22, "opacity");
    objc_msgSend(v15, "setOpacity:");
    v55 = -[TDPhotoshopRenditionSpec parentRendition](v4, "parentRendition");
    if (v55)
    {
      v52 = v5;
      objc_msgSend(v6, "boundsAtLayer:", v8);
      v51 = 0;
      v23 = 0;
      goto LABEL_20;
    }
    v24 = objc_alloc(MEMORY[0x24BE28C18]);
    v25 = (void *)objc_msgSend(v24, "initWithPixelWidth:pixelHeight:", v70, HIDWORD(v70));
    objc_msgSend(v15, "addBitmap:", v25);
    v26 = objc_msgSend(v25, "bitmapContext");
    if (v26)
    {
      v23 = (CGContext *)v26;
      v51 = v25;
      v52 = v5;
      objc_msgSend(v6, "boundsAtLayer:", v8);
      CGContextSetCompositeOperation();
      CGContextSetAlpha(v23, 1.0);
LABEL_20:
      v27 = HIDWORD(v69);
      if (SHIDWORD(v69) >= 1)
      {
        v28 = 0;
        v29 = 0.0;
        v54 = v8;
        v53 = v4;
        do
        {
          v30 = v76[v28];
          if (v30)
          {
            v31 = v69;
            if ((int)v69 >= 1)
            {
              v32 = 0.0;
              while (1)
              {
                v33 = v74[(v31 - 1)];
                if (v33)
                {
                  v34 = v15;
                  v35 = v76[v28];
                  LODWORD(v50) = v58;
                  v36 = v28;
                  v37 = -[TDPhotoshopRenditionSpec psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:](v4, "psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:", v57, (v31 - 1), v56, v50);
                  LOBYTE(v59) = 0;
                  v38 = v6;
                  v39 = objc_msgSend(v6, "imageFromSlice:atLayer:isEmptyImage:", v37, v54, &v59);
                  if (!v39)
                  {
                    -[TDPhotoshopRenditionSpec _logError:](v53, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Unable to extract Photoshop image: %@\nThings to check:\n1. Are any Photoshop layers missing when compared to the reference file?\n2. Are any of the layer names not matching the layer names in the reference file (case sensitive)?\n3. Are there the same number of slices as in the reference file?\n"), objc_msgSend((id)objc_msgSend(v52, "asset"), "name")));

                    return 0;
                  }
                  v40 = (double)v35;
                  v41 = (double)v33;
                  v15 = v34;
                  if (!v55)
                  {
                    v42 = (void *)v39;
                    CGContextSaveGState(v23);
                    v79.origin.x = v29;
                    v79.origin.y = v32;
                    v79.size.width = v40;
                    v79.size.height = (double)v33;
                    CGContextClipToRect(v23, v79);
                    v43 = (double)(int)v77[v36];
                    v44 = vcvtpd_s64_f64((double)(int)v76[v36] / v43);
                    if (v44 >= 1)
                    {
                      v45 = v29;
                      do
                      {
                        v46 = (CGImage *)objc_msgSend(v42, "image");
                        v80.origin.x = v45;
                        v80.origin.y = v32;
                        v80.size.width = v43;
                        v80.size.height = v41;
                        CGContextDrawImage(v23, v80, v46);
                        v45 = v45 + v43;
                        --v44;
                      }
                      while (v44);
                    }
                    CGContextRestoreGState(v23);
                  }
                  objc_msgSend(v34, "addSliceRect:", v29, v32, v40, v41);
                  v32 = v32 + (double)(int)v74[(v31 - 1)];
                  v6 = v38;
                  v4 = v53;
                  v28 = v36;
                }
                if (v31-- <= 1)
                {
                  v30 = v76[v28];
                  v27 = HIDWORD(v69);
                  break;
                }
              }
            }
            v29 = v29 + (double)v30;
          }
          ++v28;
        }
        while (v28 < v27);
      }
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v52, "asset"), "name"), "containsString:", CFSTR("Mask")) & 1) != 0)
      {
        IsMonochrome = 1;
        v49 = v51;
      }
      else
      {
        v49 = v51;
        if (!CGBitmapContextCreateImage(v23))
        {
LABEL_44:

          return 1;
        }
        IsMonochrome = CUIImageIsMonochrome();
      }
      -[TDPhotoshopRenditionSpec setMonochrome:](v4, "setMonochrome:", IsMonochrome);
      goto LABEL_44;
    }

    -[TDPhotoshopRenditionSpec _logError:](v4, "_logError:", CFSTR("ERROR: Could not create bitmap context"));
    return 0;
  }
  return result;
}

- (void)drawPackableRenditionInContext:(CGContext *)a3 withDocument:(id)a4
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  double v15;
  int v16;
  uint64_t v17;
  double v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  int v26;
  double v27;
  CGImage *v28;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  void *v36;
  char v37;
  _OWORD v38[2];
  _OWORD v39[2];
  int v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[80];
  _BYTE v44[80];
  _DWORD v45[20];
  _BYTE v46[80];
  _DWORD v47[20];
  _DWORD v48[20];
  uint64_t v49;
  CGRect v50;
  CGRect v51;

  v49 = *MEMORY[0x24BDAC8D0];
  if (-[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier") != 6)
  {
    v41 = 0;
    v42 = 0;
    v40 = 0;
    memset(v39, 0, sizeof(v39));
    memset(v38, 0, sizeof(v38));
    -[TDRenditionSpec packedPoint](self, "packedPoint");
    v8 = v7;
    v10 = v9;
    v11 = (void *)-[TDPhotoshopRenditionSpec production](self, "production");
    v12 = (void *)objc_msgSend(v11, "psdImageRefWithDocument:", a4);
    v35 = -[TDPhotoshopRenditionSpec _layerIndexInPSDImage:](self, "_layerIndexInPSDImage:", v12);
    v31 = v11;
    v34 = objc_msgSend((id)objc_msgSend(v11, "columnCount"), "intValue");
    v33 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("row")), "intValue");
    v32 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", CFSTR("column")), "intValue");
    objc_msgSend(v12, "size");
    v36 = v12;
    if (-[TDPhotoshopRenditionSpec _sliceRectanglesForPSDImage:rowsPerRendition:columnsPerRendition:originalColumnWidth:newColumnWidth:originalRowHeight:newRowHeight:originalColumnX:originalRowY:newRenditionSize:newSliceCount:renditionRect:throwawaySliceRect:](self, "_sliceRectanglesForPSDImage:rowsPerRendition:columnsPerRendition:originalColumnWidth:newColumnWidth:originalRowHeight:newRowHeight:originalColumnX:originalRowY:newRenditionSize:newSliceCount:renditionRect:throwawaySliceRect:", v12, &v41, (char *)&v41 + 4, v48, v47, v46, v45, v44, v43, &v42, &v40, v39, v38))
    {
      objc_msgSend(v12, "boundsAtLayer:", v35);
      v13 = HIDWORD(v41);
      if (SHIDWORD(v41) >= 1)
      {
        v14 = 0;
        v15 = 0.0;
        do
        {
          v16 = v47[v14];
          if (v16)
          {
            v17 = v41;
            if ((int)v41 >= 1)
            {
              v18 = 0.0;
              while (1)
              {
                v19 = v45[(v17 - 1)];
                if (v19)
                {
                  v20 = v47[v14];
                  LODWORD(v30) = v34;
                  v21 = -[TDPhotoshopRenditionSpec psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:](self, "psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:", v33, (v17 - 1), v32, v14, v41, HIDWORD(v41), v30);
                  v37 = 0;
                  v22 = objc_msgSend(v36, "imageFromSlice:atLayer:isEmptyImage:", v21, v35, &v37);
                  if (!v22)
                  {
                    -[TDPhotoshopRenditionSpec _logError:](self, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Unable to extract Photoshop image: %@\nThings to check:\n1. Are any Photoshop layers missing when compared to the reference file?\n2. Are any of the layer names not matching the layer names in the reference file (case sensitive)?\n3. Are there the same number of slices as in the reference file?\n"), objc_msgSend((id)objc_msgSend(v31, "asset"), "name")));
                    return;
                  }
                  v23 = (void *)v22;
                  v24 = (double)v19;
                  CGContextSaveGState(a3);
                  CGContextTranslateCTM(a3, v8, v10);
                  v50.origin.x = v15;
                  v50.origin.y = v18;
                  v50.size.width = (double)v20;
                  v50.size.height = (double)v19;
                  CGContextClipToRect(a3, v50);
                  v25 = (double)(int)v48[v14];
                  v26 = vcvtpd_s64_f64((double)(int)v47[v14] / v25);
                  if (v26 >= 1)
                  {
                    v27 = v15;
                    do
                    {
                      v28 = (CGImage *)objc_msgSend(v23, "image");
                      v51.origin.x = v27;
                      v51.origin.y = v18;
                      v51.size.width = v25;
                      v51.size.height = v24;
                      CGContextDrawImage(a3, v51, v28);
                      v27 = v27 + v25;
                      --v26;
                    }
                    while (v26);
                  }
                  CGContextRestoreGState(a3);
                  v18 = v18 + (double)(int)v45[(v17 - 1)];
                }
                if (v17-- <= 1)
                {
                  v16 = v47[v14];
                  v13 = HIDWORD(v41);
                  break;
                }
              }
            }
            v15 = v15 + (double)v16;
          }
          ++v14;
        }
        while (v14 < v13);
      }
    }
  }
}

- (TDImageColorHistogram)histogram
{
  return self->_histogram;
}

- (void)setHistogram:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
