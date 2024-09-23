@implementation TDSimpleArtworkRenditionSpec

+ (void)initialize
{
  getenv("DISTILL_LOGGING");
}

- (void)dealloc
{
  objc_super v3;

  -[TDSimpleArtworkRenditionSpec setHistogram:](self, "setHistogram:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDSimpleArtworkRenditionSpec;
  -[TDSimpleArtworkRenditionSpec dealloc](&v3, sel_dealloc);
}

- (void)setPrimitiveAlignmentRect:(CGRect)a3
{
  self->_alignmentRect = a3;
}

- (CGRect)primitiveAlignmentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_alignmentRect.origin.x;
  y = self->_alignmentRect.origin.y;
  width = self->_alignmentRect.size.width;
  height = self->_alignmentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAlignmentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TDSimpleArtworkRenditionSpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("alignmentRect"));
  self->_alignmentRect.origin.x = x;
  self->_alignmentRect.origin.y = y;
  self->_alignmentRect.size.width = width;
  self->_alignmentRect.size.height = height;
  -[TDSimpleArtworkRenditionSpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("alignmentRect"));
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  -[TDSimpleArtworkRenditionSpec setAlignmentRectString:](self, "setAlignmentRectString:", NSStringFromRect(v8));
}

- (CGRect)alignmentRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[TDSimpleArtworkRenditionSpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("alignmentRect"));
  -[TDSimpleArtworkRenditionSpec primitiveAlignmentRect](self, "primitiveAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TDSimpleArtworkRenditionSpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("alignmentRect"));
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setPhysicalSizeInMeters:(CGSize)a3
{
  -[TDSimpleArtworkRenditionSpec setPhysicalSizeInMetersString:](self, "setPhysicalSizeInMetersString:", NSStringFromSize(a3));
}

- (CGSize)physicalSizeInMeters
{
  double width;
  double height;
  NSSize v4;
  CGSize result;

  v4 = NSSizeFromString((NSString *)-[TDSimpleArtworkRenditionSpec physicalSizeInMetersString](self, "physicalSizeInMetersString"));
  height = v4.height;
  width = v4.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)awakeFromFetch
{
  objc_super v3;
  NSRect v4;

  v3.receiver = self;
  v3.super_class = (Class)TDSimpleArtworkRenditionSpec;
  -[TDSimpleArtworkRenditionSpec awakeFromFetch](&v3, sel_awakeFromFetch);
  v4 = NSRectFromString((NSString *)-[TDSimpleArtworkRenditionSpec alignmentRectString](self, "alignmentRectString"));
  -[TDSimpleArtworkRenditionSpec setPrimitiveAlignmentRect:](self, "setPrimitiveAlignmentRect:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

- (void)copyAttributesInto:(id)a3
{
  -[TDSimpleArtworkRenditionSpec alignmentRect](self, "alignmentRect");
  objc_msgSend(a3, "setAlignmentRect:");
  objc_msgSend(a3, "setNonAlphaImageAreaString:", -[TDSimpleArtworkRenditionSpec nonAlphaImageAreaString](self, "nonAlphaImageAreaString"));
  objc_msgSend(a3, "setAlphaCrop:", -[TDSimpleArtworkRenditionSpec alphaCrop](self, "alphaCrop"));
  objc_msgSend(a3, "setHeight:", -[TDSimpleArtworkRenditionSpec height](self, "height"));
  objc_msgSend(a3, "setWidth:", -[TDSimpleArtworkRenditionSpec width](self, "width"));
  objc_msgSend(a3, "setMonochrome:", -[TDSimpleArtworkRenditionSpec monochrome](self, "monochrome"));
  objc_msgSend(a3, "setOpaque:", -[TDSimpleArtworkRenditionSpec opaque](self, "opaque"));
  objc_msgSend(a3, "setCompressionType:", -[TDSimpleArtworkRenditionSpec compressionType](self, "compressionType"));
  objc_msgSend(a3, "setRenditionType:", -[TDRenditionSpec renditionType](self, "renditionType"));
  -[TDSimpleArtworkRenditionSpec postScaleFactor](self, "postScaleFactor");
  objc_msgSend(a3, "setPostScaleFactor:");
  objc_msgSend(a3, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
  objc_msgSend(a3, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
  objc_msgSend(a3, "setAllowsDeepmapCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
  objc_msgSend(a3, "setAllowsDeepmap2Compression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
  objc_msgSend(a3, "setPhysicalSizeInMetersString:", -[TDSimpleArtworkRenditionSpec physicalSizeInMetersString](self, "physicalSizeInMetersString"));
  objc_msgSend(a3, "setPreserveForArchiveOnly:", -[TDSimpleArtworkRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  id result;
  int v8;

  v3 = objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a3), "path");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);
  if (v5)
    v6 = (void *)objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
  else
    v6 = 0;
  result = (id)objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0C98]);
  if (result)
    v8 = 0;
  else
    v8 = v5;
  if (v8 == 1)
  {
    NSLog(CFSTR("-[TDSimpleArtworkRenditionSpec associatedFileModificationDateWithDocument:] WARNING: %@ exists but has no modification date. Returning +[NSDate distantFuture]"), v3);
    return (id)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  }
  return result;
}

- (void)_logError:(id)a3
{
  NSLog(CFSTR("%@"), a2, a3);
}

- (void)_logWarning:(id)a3
{
  NSLog(CFSTR("%@"), a2, a3);
}

- (id)_sliceRectanglesForRenditionSize:(id)a3 unadjustedSliceRectangles:(id *)a4 imageSlicesNeedAdjustment:(BOOL *)a5 newRenditionSize:(id *)a6
{
  void *v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
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
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
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
  uint64_t v73;
  int v74;
  double var1;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v156;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD v162[9];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = -[TDSimpleArtworkRenditionSpec _slicesToUseForCSI](self, "_slicesToUseForCSI");
  v11 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier");
  if (objc_msgSend(v10, "count"))
  {
    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v158, v163, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v159;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v159 != v14)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v158 + 1) + 8 * i), "sliceRect");
          objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:"));
        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v158, v163, 16);
      }
      while (v13);
    }
  }
  if (!objc_msgSend(v9, "count"))
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", 0.0, 0.0, (double)a3.var0, (double)a3.var1));
  if (v11 - 1 > 1)
  {
    if (v11 == 3 && objc_msgSend(v9, "count") == 9)
    {
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "rectValue");
      v49 = v48;
      v51 = v50;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 2), "rectValue");
      v53 = v52 - (v49 + v51);
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 3), "rectValue");
      v55 = v54;
      v57 = v56;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 6), "rectValue");
      v59 = v58 - (v55 + v57);
      if (v53 > 0.0 || v59 > 0.0)
      {
        v74 = (int)((double)a6->var0 - v53);
        var1 = (double)a6->var1;
        *a5 = 1;
        a6->var0 = v74;
        a6->var1 = (int)(var1 - v59);
        goto LABEL_40;
      }
    }
  }
  else if (objc_msgSend(v9, "count") == 4)
  {
    *(&a6->var0 + (v11 != 1)) = 0;
    v16 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    if (objc_msgSend(v9, "count"))
    {
      v17 = 0;
      do
      {
        if (v17 != 2)
        {
          v18 = (void *)objc_msgSend(v9, "objectAtIndex:", v17);
          objc_msgSend(v16, "addObject:", v18);
          objc_msgSend(v18, "rectValue");
          if (v11 == 1)
            v21 = v19;
          else
            v21 = v20;
          *(&a6->var0 + (v11 != 1)) = (int)(v21 + (double)*(&a6->var0 + (v11 != 1)));
        }
        ++v17;
      }
      while (v17 < objc_msgSend(v9, "count"));
    }
    *a5 = 1;
    if (v11 == 2)
    {
      if (objc_msgSend(v16, "count") == 3)
      {
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 2), "rectValue");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 1), "rectValue");
        v31 = v30;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v38 = v25 - (v32 + v36);
        if (v38 < 0.0)
          v38 = 0.0;
        v39 = v25 - v38;
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 0), "rectValue");
        v40 = (void *)MEMORY[0x24BDBCE30];
        v41 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:");
        v42 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v31, v33, v35, v37);
        v43 = (void *)MEMORY[0x24BDD1968];
        v44 = v23;
        v45 = v39;
        v46 = v27;
        v47 = v29;
LABEL_36:
        v73 = objc_msgSend(v40, "arrayWithObjects:", v41, v42, objc_msgSend(v43, "valueWithRect:", v44, v45, v46, v47), 0);
LABEL_42:
        v9 = (void *)v73;
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    if (v11 == 1)
    {
      if (objc_msgSend(v16, "count") == 3)
      {
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 1), "rectValue");
        v61 = v60;
        v63 = v62;
        objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 2), "rectValue");
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v71 = v64 - (v61 + v63);
        if (v71 < 0.0)
          v71 = 0.0;
        v72 = v64 - v71;
        v40 = (void *)MEMORY[0x24BDBCE30];
        v41 = objc_msgSend(v16, "objectAtIndex:", 0);
        v42 = objc_msgSend(v16, "objectAtIndex:", 1);
        v43 = (void *)MEMORY[0x24BDD1968];
        v44 = v72;
        v45 = v66;
        v46 = v68;
        v47 = v70;
        goto LABEL_36;
      }
LABEL_44:
      v9 = 0;
      goto LABEL_45;
    }
    if (v11 != 3)
      goto LABEL_44;
    v9 = v16;
LABEL_40:
    if (objc_msgSend(v9, "count") == 9)
    {
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rectValue");
      v154 = v77;
      v156 = v76;
      v152 = v79;
      v153 = v78;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "rectValue");
      v81 = v80;
      v150 = v83;
      v151 = v82;
      v85 = v84;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 2), "rectValue");
      v87 = v86;
      v148 = v89;
      v149 = v88;
      v147 = v90;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 3), "rectValue");
      v145 = v92;
      v146 = v91;
      v94 = v93;
      v127 = v95;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 4), "rectValue");
      v143 = v97;
      v144 = v96;
      v141 = v99;
      v142 = v98;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 5), "rectValue");
      v101 = v100;
      v139 = v103;
      v140 = v102;
      v138 = v104;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 6), "rectValue");
      v136 = v106;
      v137 = v105;
      v108 = v107;
      v135 = v109;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 7), "rectValue");
      v133 = v111;
      v134 = v110;
      v113 = v112;
      v132 = v114;
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 8), "rectValue");
      v130 = v116;
      v131 = v115;
      v117 = fmax(v87 - (v81 + v85), 0.0);
      v118 = v87 - v117;
      v119 = v101 - v117;
      v121 = v120 - v117;
      v122 = fmax(v108 - (v94 + v127), 0.0);
      v123 = v108 - v122;
      v124 = v113 - v122;
      v128 = v125 - v122;
      v129 = v121;
      v162[0] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v156, v154, v153, v152);
      v162[1] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v81, v151, v85, v150);
      v162[2] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v118, v149, v148, v147);
      v162[3] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v146, v94, v145, v127);
      v162[4] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v144, v143, v142, v141);
      v162[5] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v119, v140, v139, v138);
      v162[6] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v137, v123, v136, v135);
      v162[7] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v134, v124, v133, v132);
      v162[8] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v129, v128, v131, v130);
      v73 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v162, 9);
      v16 = v9;
      goto LABEL_42;
    }
    v16 = v9;
    goto LABEL_44;
  }
  v16 = v9;
LABEL_45:
  *a4 = v16;
  return v9;
}

- ($56AE26BFB60993BDE24C7578AE3A2D7B)_edgeMetricsForAlignmentRect:(SEL)a3 originalRenditionSize:(CGRect)a4 newRenditionSize:(id)a5
{
  CGFloat v6;
  CGFloat v7;

  v6 = a4.size.width - (double)(a5.var0 - a6.var0);
  v7 = a4.size.height - (double)(a5.var1 - a6.var1);
  retstr->var0.width = a4.origin.x;
  retstr->var0.height = a4.origin.y;
  retstr->var1.width = (double)a6.var0 - (a4.origin.x + v6);
  retstr->var1.height = (double)a6.var1 - (a4.origin.y + v7);
  retstr->var2.width = v6;
  retstr->var2.height = v7;
  return self;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TDSimpleArtworkRenditionSpec;
  v4 = -[TDRenditionSpec canBePackedWithDocument:](&v10, sel_canBePackedWithDocument_, a3);
  if (v4)
  {
    v5 = (void *)-[TDSimpleArtworkRenditionSpec asset](self, "asset");
    v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "name"), "pathExtension");
    if (objc_msgSend(v6, "length"))
    {
      if (objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("PDF"))
        && objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("SVG")))
      {
        if ((!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("JPEG"))
           || !objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("JPG"))
           || !objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("HEIF"))
           || !objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("HEIC")))
          && (-[TDSimpleArtworkRenditionSpec alphaCrop](self, "alphaCrop") & 1) == 0)
        {
          -[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters");
          if (v7 <= 0.0)
          {
            -[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters");
            if (v8 <= 0.0)
            {
              LOBYTE(v4) = 0;
              return v4;
            }
          }
        }
      }
      else
      {
        v4 = objc_msgSend(v5, "scaleFactor");
        if (!v4)
          return v4;
      }
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (int)_rawPixelFormatOfCGImage:(CGImage *)a3
{
  int v5;
  int v6;
  signed int v7;
  int v8;
  int v9;

  v5 = 1095911234;
  if (-[TDSimpleArtworkRenditionSpec allowsMultiPassEncoding](self, "allowsMultiPassEncoding"))
  {
    v6 = -[TDSimpleArtworkRenditionSpec monochrome](self, "monochrome");
    v7 = CGImageGetBitsPerComponent(a3) << 16;
    if (v7 <= 983040)
      v8 = 1095911234;
    else
      v8 = 1380401751;
    if (v7 <= 983040)
      v9 = 1195456544;
    else
      v9 = 1195454774;
    if (v6)
      return v9;
    else
      return v8;
  }
  return v5;
}

- (CGImage)_createImageRefWithURL:(id)a3 andDocument:(id)a4 format:(unsigned int *)a5 vectorBased:(BOOL *)a6
{
  void *v12;
  void *v13;
  CGImageRef Image;
  unsigned int v15;
  int v16;
  int v17;
  CGPDFDocumentRef v18;
  CGPDFDocument *v19;
  unsigned int v20;
  double v21;
  CGPDFPage *Page;
  double x;
  double y;
  double width;
  double height;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  char v33;
  uint64_t v34;
  CFStringRef *v35;
  size_t v36;
  unint64_t i;
  double v38;
  double v39;
  unsigned int v40;
  void *v41;
  uint64_t v42;
  TDVectorGlyphReader *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  uint64_t v49;
  unsigned int v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  size_t v57;
  double v58;
  uint32_t v59;
  CFStringRef *v60;
  CGColorSpace *v61;
  CGContext *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  uint64_t v67;
  void *v68;
  double v69;
  double v70;
  CGColorSpace *v71;
  CGContext *v72;
  double v73;
  double v74;
  size_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v81;
  double v82;
  CGColorSpace *v83;
  uint64_t v84;
  vImage_Error v85;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  const char *v93;
  BOOL *v94;
  BOOL *v95;
  vImage_Buffer dest;
  vImage_Buffer src;
  vImage_CGImageFormat format;
  CGRect BoxRect;

  v12 = (void *)-[TDSimpleArtworkRenditionSpec asset](self, "asset");
  if (!objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "caseInsensitiveCompare:", CFSTR("PDF")))
  {
    v16 = objc_msgSend(v12, "scaleFactor");
    if (a5 && !v16)
    {
      Image = 0;
      v15 = 1346651680;
      goto LABEL_17;
    }
    v18 = CGPDFDocumentCreateWithURL((CFURLRef)a3);
    if (v18)
    {
      v19 = v18;
      v93 = a2;
      v94 = a6;
      v20 = objc_msgSend(v12, "scaleFactor");
      v21 = (double)v20;
      Page = CGPDFDocumentGetPage(v19, 1uLL);
      BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
      x = BoxRect.origin.x;
      y = BoxRect.origin.y;
      width = BoxRect.size.width;
      height = BoxRect.size.height;
      v27 = objc_msgSend(v12, "fileScaleFactor");
      if (!(_DWORD)v27)
        v27 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", objc_msgSend(a3, "path"));
      if (!v20)
        v21 = 1.0;
      -[TDSimpleArtworkRenditionSpec postScaleFactor](self, "postScaleFactor");
      v29 = v21 * v28;
      v92 = v27;
      v30 = (double)v27;
      v31 = round(width / (double)v27 * v29);
      v32 = round(height / (double)v27 * v29);
      if ((CGPDFPageContainsWideGamutContent() & 1) == 0)
        goto LABEL_82;
      v33 = 1;
      v34 = 4097;
      v35 = (CFStringRef *)MEMORY[0x24BDBF228];
      v36 = 16;
      for (i = 8; ; i = 4)
      {
        v71 = CGColorSpaceCreateWithName(*v35);
        v72 = CGBitmapContextCreate(0, (unint64_t)v31, (unint64_t)v32, v36, (unint64_t)(v31 * (double)i), v71, v34);
        if (!v72)
        {
          v91 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v90 = objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "name"), "name");
          -[TDSimpleArtworkRenditionSpec postScaleFactor](self, "postScaleFactor");
          objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", v93, self, CFSTR("TDSimpleArtworkRenditionSpec.m"), 477, CFSTR("CoreThemeDefinition: '%@' Unable to create bitmap context for %s (%fx%f) colorSpace:'%@' [pdfsize:%fx%f fileScale:%d postScaleFactor:%f scale:%f bpc:%d bpp:%d bitmapInfo:%d]"), v90, "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", *(_QWORD *)&v31, *(_QWORD *)&v32, v71, *(_QWORD *)&width, *(_QWORD *)&height, v92, v87, *(_QWORD *)&v29, v36, i,
            v34);
        }
        CGColorSpaceRelease(v71);
        CGContextScaleCTM(v72, v29 / v30, v29 / v30);
        CGContextTranslateCTM(v72, -x, -y);
        CGContextDrawPDFPage(v72, Page);
        Image = CGBitmapContextCreateImage(v72);
        if ((v33 & 1) == 0 || (CUIImageIsWideGamut() & 1) != 0)
          break;
        CFRelease(Image);
        CFRelease(v72);
LABEL_82:
        v33 = 0;
        v34 = 8193;
        v35 = (CFStringRef *)MEMORY[0x24BDBF318];
        v36 = 8;
      }
      CFRelease(v72);
      CGPDFDocumentRelease(v19);
      a2 = v93;
      if (v94)
        *v94 = 1;
      if (a5)
        *a5 = -[TDSimpleArtworkRenditionSpec _rawPixelFormatOfCGImage:](self, "_rawPixelFormatOfCGImage:", Image);
      goto LABEL_92;
    }
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "caseInsensitiveCompare:", CFSTR("SVG")))
  {
    v17 = objc_msgSend(v12, "scaleFactor");
    if (a5 && !v17)
    {
      Image = 0;
      v15 = 1398163232;
      goto LABEL_17;
    }
    if (objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier")|| objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"))
    {
      v43 = +[TDVectorGlyphReader vectorGlyphReaderWithURL:error:](TDVectorGlyphReader, "vectorGlyphReaderWithURL:error:", a3, 0);
      -[TDVectorGlyphReader canvasSizeForWeight:size:](v43, "canvasSizeForWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
      v45 = v44;
      v47 = v46;
      -[TDVectorGlyphReader templateVersion](v43, "templateVersion");
      v48 = -[TDVectorGlyphReader containsWideGamutContent](v43, "containsWideGamutContent");
      v49 = 0;
    }
    else
    {
      v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", a3, 8, 0);
      v49 = CGSVGDocumentCreateFromData();
      CGSVGDocumentGetCanvasSize();
      v45 = v69;
      v47 = v70;
      v48 = CGSVGDocumentContainsWideGamutContent();

      v43 = 0;
    }
    if (v45 != 0.0 && v47 != 0.0)
    {
      v95 = a6;
      v50 = objc_msgSend(v12, "scaleFactor");
      v51 = (double)v50;
      objc_msgSend(v12, "fileScaleFactor");
      if (!v50)
        v51 = 1.0;
      -[TDSimpleArtworkRenditionSpec postScaleFactor](self, "postScaleFactor");
      v53 = v51 * v52;
      v54 = v45 * v53;
      v55 = ceil(v54);
      v56 = v47 * v53;
      if (v48)
        v57 = 16;
      else
        v57 = 8;
      if (v48)
        v58 = 8.0;
      else
        v58 = 4.0;
      if (v48)
        v59 = 4097;
      else
        v59 = 8193;
      v60 = (CFStringRef *)MEMORY[0x24BDBF228];
      if (!v48)
        v60 = (CFStringRef *)MEMORY[0x24BDBF318];
      v61 = CGColorSpaceCreateWithName(*v60);
      v62 = CGBitmapContextCreate(0, vcvtpd_u64_f64(v54), vcvtpd_u64_f64(v56), v57, (unint64_t)(v55 * v58), v61, v59);
      if (!v62)
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDSimpleArtworkRenditionSpec.m"), 596, CFSTR("CoreThemeDefinition: Unable to create bitmap context for %@"), a3);
      CGColorSpaceRelease(v61);
      if (v43)
      {
        -[TDSimpleArtworkRenditionSpec postScaleFactor](self, "postScaleFactor");
        v64 = v63;
        -[TDVectorGlyphReader defaultPointSize](v43, "defaultPointSize");
        -[TDVectorGlyphReader drawInContext:atPointSize:scaleFactor:weight:size:](v43, "drawInContext:atPointSize:scaleFactor:weight:size:", v62, objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"), v64 * v65, (double)objc_msgSend(v12, "scaleFactor"));
      }
      else
      {
        CGContextScaleCTM(v62, v53, v53);
        CGContextDrawSVGDocument();
      }
      Image = CGBitmapContextCreateImage(v62);
      CFRelease(v62);
      CGSVGDocumentRelease();
      if (v95)
        *v95 = 1;
      if (a5)
        *a5 = -[TDSimpleArtworkRenditionSpec _rawPixelFormatOfCGImage:](self, "_rawPixelFormatOfCGImage:", Image);
      if (v43)

      goto LABEL_92;
    }
    if (objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier")|| objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"))
    {
      NSLog(CFSTR("%s Got zero width/height canvas size for %@ weight:%d size:%d"), "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", a3, objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
      if (v45 == 0.0 && v47 == 0.0)
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDSimpleArtworkRenditionSpec.m"), 552, CFSTR("%s ot zero width/height canvas size for %@"), "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", a3, v88, v89);
    }
    else
    {
      NSLog(CFSTR("%s Got zero width/height canvas size for %@"), "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", a3);
      if (v45 == 0.0 && v47 == 0.0)
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDSimpleArtworkRenditionSpec.m"), 556, CFSTR("%s ot zero width/height canvas size for %@ weight:%d size:%d"), "-[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:]", a3, objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
    }
    if (v49)
      CGSVGDocumentRelease();
    return 0;
  }
  v13 = (void *)objc_msgSend(a3, "pathExtension");
  if (objc_msgSend(v13, "length"))
  {
    if (objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("JPEG"))
      && objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("JPG")))
    {
      if (objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("HEIF"))
        && objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("HEIC")))
      {
        if (objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("PNG")))
          goto LABEL_9;
LABEL_32:
        v41 = (void *)objc_msgSend(v12, "sourceImageWithDocument:", a4);
        v42 = objc_msgSend(v41, "image");
        if (v41)
        {
          Image = (CGImageRef)v42;
          if (a5)
            *a5 = -[TDSimpleArtworkRenditionSpec _rawPixelFormatOfCGImage:](self, "_rawPixelFormatOfCGImage:", v42);
          goto LABEL_68;
        }
        return 0;
      }
      if (a5)
        *a5 = 1212500294;
    }
    else if (a5)
    {
      if ((-[TDSimpleArtworkRenditionSpec alphaCrop](self, "alphaCrop") & 1) != 0
        || (-[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters"), v38 > 0.0)
        || (-[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters"), v39 > 0.0))
      {
        v40 = -[TDSimpleArtworkRenditionSpec _rawPixelFormatOfCGImage:](self, "_rawPixelFormatOfCGImage:", 0);
      }
      else
      {
        v40 = 1246774599;
      }
      *a5 = v40;
    }
    v66 = (void *)objc_msgSend(v12, "sourceImageWithDocument:", a4);
    v67 = objc_msgSend(v66, "image");
    if (v66)
    {
      Image = (CGImageRef)v67;
LABEL_68:
      CGImageRetain(Image);
      goto LABEL_92;
    }
    return 0;
  }
  if (!objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", 0))
    goto LABEL_32;
LABEL_9:
  Image = 0;
  if (a5)
  {
    v15 = 1145132097;
LABEL_17:
    *a5 = v15;
  }
LABEL_92:
  -[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters");
  if (v73 > 0.0 || (-[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters"), v74 > 0.0))
  {
    v75 = CGImageGetWidth(Image);
    v76 = (double)v75;
    v77 = (double)CGImageGetHeight(Image);
    if (v75 <= 0x63)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDSimpleArtworkRenditionSpec.m"), 771, CFSTR("CoreThemeDefintiion: '%@' should have a width >= 100 pixels"), objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "name"), "name"));
    -[TDSimpleArtworkRenditionSpec _scaleRecognitionImageFromSize:](self, "_scaleRecognitionImageFromSize:", v76, v77);
    if (v78 != v76 || v79 != v77)
    {
      v81 = v78;
      v82 = v79;
      memset(&dest, 0, sizeof(dest));
      v83 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
      *(_QWORD *)&format.bitsPerComponent = 0x2000000008;
      format.colorSpace = v83;
      format.bitmapInfo = 12289;
      memset(&format.version, 0, 20);
      src.height = (unint64_t)v77;
      src.width = (unint64_t)v76;
      src.data = 0;
      src.rowBytes = CGBitmapGetAlignedBytesPerRow();
      CGImageGetColorSpace(Image);
      v84 = CUIConvertCGImageFormat();
      CGColorSpaceRelease(v83);
      if (!v84)
      {
        dest.height = (unint64_t)v82;
        dest.width = (unint64_t)v81;
        dest.rowBytes = 32 * (unint64_t)v81;
        dest.data = malloc_type_calloc(dest.rowBytes * (unint64_t)v82, 1uLL, 0x100004077774924uLL);
        v85 = vImageScale_ARGB8888(&src, &dest, 0, 0x20u);
        CGBitmapFreeData();
        if (!v85)
        {
          CGImageRelease(Image);
          return vImageCreateCGImageFromBuffer(&dest, &format, 0, 0, 0x200u, 0);
        }
      }
    }
  }
  return Image;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  __int16 v6;
  uint64_t v7;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  double Width;
  double v17;
  void *v18;
  CGImage *v19;
  CGImage *v20;
  CGPDFDocumentRef v21;
  CGPDFDocument *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGPDFDictionary *Info;
  CGPDFDictionary *v29;
  CFStringRef v30;
  CFStringRef v31;
  CFDateRef v32;
  CFDateRef v33;
  CGPDFArray *ID;
  size_t Count;
  size_t v36;
  id v37;
  size_t v38;
  const __CFAllocator *v39;
  const unsigned __int8 *BytePtr;
  size_t Length;
  CFDataRef v42;
  CGPDFPage *Page;
  __CFData *v44;
  CGDataConsumer *v45;
  CGContext *v46;
  size_t Height;
  id v48;
  __int16 v49;
  const __CFData *v50;
  const __CFData *v51;
  CGImageSource *v52;
  CGImageSource *v53;
  CGImageMetadataRef v54;
  id v55;
  __CFData *v56;
  const __CFString *Type;
  CGImageDestinationRef v58;
  CGImageDestination *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL4 v63;
  __CFData *v64;
  __CFData *v65;
  double x;
  double y;
  double v68;
  double v69;
  NSSize v70;
  double v71;
  double v72;
  double v73;
  double v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  CGFloat v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  size_t BitsPerComponent;
  int v88;
  int v89;
  __int16 v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  uint64_t AlphaInfo;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t i;
  id v107;
  CGContext *v108;
  CGImage *v109;
  CGColorSpaceRef v110;
  uint64_t v111;
  CGImage *v112;
  unint64_t v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  CGImage *v130;
  BOOL v131;
  uint64_t v132;
  CGImageMetadataRef cf;
  unsigned int v134;
  __CFData *v135;
  unsigned int v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  CGSize v141;
  __int16 v142;
  __int128 v143;
  int v144;
  uint64_t v145;
  CGImageRef image;
  CGImage *imagea;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  CGPDFStringRef value[2];
  CGSize v153;
  __int128 v154;
  CGRect mediaBox;
  __int128 v156;
  CGRect v157;
  id v158;
  char v159;
  unsigned int v160;
  unsigned __int8 v161;
  uint64_t v162;
  _BYTE v163[128];
  uint64_t v164;
  NSRect v165;
  CGRect v166;
  CGRect v167;
  NSRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;

  v6 = a4;
  v7 = a3;
  v164 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)-[TDSimpleArtworkRenditionSpec production](self, "production");
  v10 = (void *)-[TDSimpleArtworkRenditionSpec asset](self, "asset");
  v162 = 0;
  v161 = 0;
  v160 = 1246774599;
  v11 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier");
  if (v11 == 1006)
  {
    v12 = objc_alloc(MEMORY[0x24BE28C20]);
    v13 = (void *)objc_msgSend(v12, "initWithCanvasSize:sliceCount:layout:", 0, 1006, *MEMORY[0x24BDD1410], *(double *)(MEMORY[0x24BDD1410] + 8));
    objc_msgSend(v13, "setScaleFactor:", objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
    objc_msgSend(v13, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
    v14 = (void *)objc_msgSend(v13, "CSIRepresentationWithCompression:", v7);

    return v14;
  }
  v15 = v11;
  Width = *MEMORY[0x24BDBF148];
  v17 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v18 = (void *)objc_msgSend(v10, "fileURLWithDocument:", a5);
  if (objc_msgSend(v10, "rawData"))
  {
    v142 = v6;
    v19 = 0;
    v160 = 1145132097;
LABEL_5:
    v144 = 1;
    goto LABEL_39;
  }
  v20 = -[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:](self, "_createImageRefWithURL:andDocument:format:vectorBased:", v18, a5, &v160, &v161);
  v19 = v20;
  if (v20)
  {
LABEL_7:
    if (v160 == 1145132097)
    {
      v142 = v6;
      goto LABEL_5;
    }
    if (v160 == 1246774599 || v160 == 1212500294)
    {
      if (v20)
      {
        v142 = v6;
        if (v160 == 1212500294 && -[TDSimpleArtworkRenditionSpec isBackstop](self, "isBackstop"))
        {
          v144 = 0;
          v160 = 1095911234;
        }
        else
        {
          v144 = 1;
        }
        Width = (double)CGImageGetWidth(v19);
        Height = CGImageGetHeight(v19);
        goto LABEL_38;
      }
    }
    else if (v20)
    {
      v142 = v6;
      Width = (double)CGImageGetWidth(v20);
      Height = CGImageGetHeight(v19);
      v144 = 0;
LABEL_38:
      v17 = (double)Height;
LABEL_39:
      v137 = (int)v17;
      v138 = (int)Width;
      LODWORD(v162) = (int)Width;
      HIDWORD(v162) = (int)v17;
      v159 = 0;
      v158 = 0;
      v48 = -[TDSimpleArtworkRenditionSpec _sliceRectanglesForRenditionSize:unadjustedSliceRectangles:imageSlicesNeedAdjustment:newRenditionSize:](self, "_sliceRectanglesForRenditionSize:unadjustedSliceRectangles:imageSlicesNeedAdjustment:newRenditionSize:", v162, &v158, &v159, &v162);
      v136 = v15;
      if (objc_msgSend(v9, "renditionSubtype"))
        v49 = objc_msgSend((id)objc_msgSend(v9, "renditionSubtype"), "identifier");
      else
        v49 = v15;
      imagea = v19;
      if (!v144)
      {
        if (-[TDSimpleArtworkRenditionSpec parentRendition](self, "parentRendition"))
        {
          v165 = NSRectFromString((NSString *)-[TDSimpleArtworkRenditionSpec nonAlphaImageAreaString](self, "nonAlphaImageAreaString"));
          x = v165.origin.x;
          y = v165.origin.y;
          v68 = v165.size.width;
          v69 = v165.size.height;
          v70 = NSSizeFromString((NSString *)-[TDSimpleArtworkRenditionSpec originalImageSizeString](self, "originalImageSizeString"));
          -[TDRenditionSpec packedPoint](self, "packedPoint");
          v72 = v71;
          v74 = v73;
          v166.origin.x = x;
          v166.origin.y = y;
          v166.size.width = v68;
          v166.size.height = v69;
          if (!CGRectIsEmpty(v166))
          {
            LODWORD(v162) = (int)v68;
            HIDWORD(v162) = (int)v69;
          }
          v75 = objc_alloc(MEMORY[0x24BE28C20]);
          v76 = (void *)objc_msgSend(v75, "initWithInternalReferenceRect:layout:", v49, v72, v74, (double)(int)v162, (double)SHIDWORD(v162));
          v167.origin.x = x;
          v167.origin.y = y;
          v167.size.width = v68;
          v167.size.height = v69;
          if (!CGRectIsEmpty(v167))
          {
            objc_msgSend(v76, "setAlphaCroppedFrame:", x, y, v68, v69);
            objc_msgSend(v76, "setOriginalUncroppedSize:", v70.width, v70.height);
          }
          v77 = objc_alloc_init(MEMORY[0x24BE28C70]);
          v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec parentRendition](self, "parentRendition"), "keySpec"), "key"));
          objc_msgSend(v77, "setReferenceKey:", v78);
          objc_msgSend(v76, "addLayerReference:", v77);

          v19 = imagea;
        }
        else
        {
          v79 = objc_alloc(MEMORY[0x24BE28C20]);
          v76 = (void *)objc_msgSend(v79, "initWithCanvasSize:sliceCount:layout:", objc_msgSend(v48, "count"), v49, (double)(int)v162, (double)SHIDWORD(v162));
        }
        objc_msgSend(v76, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
        objc_msgSend(v76, "setPixelFormat:", v160);
        objc_msgSend(v76, "setName:", objc_msgSend(v10, "name"));
        if (!v19)
          goto LABEL_84;
LABEL_76:
        if (v160 != 1246774599 && v160 != 1212500294)
        {
          v140 = v9;
          v85 = v10;
          v86 = v7;
          BitsPerComponent = CGImageGetBitsPerComponent(v19);
          v88 = -[TDSimpleArtworkRenditionSpec monochrome](self, "monochrome");
          v89 = objc_msgSend(a5, "allowsExtendedRangePixelFormats");
          if (objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier") == 1)
          {
            if (CUIImageIsWideGamut())
            {
              if (v89)
                v90 = 4;
              else
                v90 = 3;
              objc_msgSend(v76, "setPixelFormat:", 1380401751);
            }
            else
            {
              if (BitsPerComponent > 8)
                v92 = v88;
              else
                v92 = 0;
              if (v92 != 1)
              {
                v131 = BitsPerComponent >= 9;
                v19 = imagea;
                v7 = v86;
                v10 = v85;
                v9 = v140;
                v90 = v142;
                if (v131)
                {
                  if (v88)
                    v90 = 2;
                  else
                    v90 = 1;
                  if (v88)
                    v132 = 1195456544;
                  else
                    v132 = 1095911234;
                  objc_msgSend(v76, "setPixelFormat:", v132);
                }
                goto LABEL_101;
              }
              if (v89)
                v90 = 6;
              else
                v90 = 2;
            }
            v19 = imagea;
          }
          else
          {
            if (v88)
              v90 = 2;
            else
              v90 = 1;
            if (v88)
              v91 = 1195456544;
            else
              v91 = 1095911234;
            objc_msgSend(v76, "setPixelFormat:", v91);
          }
          v7 = v86;
          v10 = v85;
          v9 = v140;
LABEL_101:
          objc_msgSend(v76, "setAllowsMultiPassEncoding:", -[TDSimpleArtworkRenditionSpec allowsMultiPassEncoding](self, "allowsMultiPassEncoding"));
          objc_msgSend(v76, "setAllowsOptimalRowbytesPacking:", -[TDSimpleArtworkRenditionSpec allowsOptimalRowbytesPacking](self, "allowsOptimalRowbytesPacking"));
          objc_msgSend(v76, "setColorSpaceID:", v90);
          objc_msgSend(v76, "setIsVectorBased:", v161);
          objc_msgSend(v76, "setExifOrientation:", objc_msgSend(v10, "exifOrientation"));
          objc_msgSend(v76, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
          objc_msgSend(v76, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
          objc_msgSend(v76, "setAllowsDeepmapImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
          objc_msgSend(v76, "setAllowsDeepmap2ImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
          if (objc_msgSend((id)-[TDSimpleArtworkRenditionSpec compressionType](self, "compressionType"), "identifier"))objc_msgSend(v76, "setCompressionType:", objc_msgSend((id)-[TDSimpleArtworkRenditionSpec compressionType](self, "compressionType"), "identifier"));
          objc_msgSend(v76, "setScaleFactor:", objc_msgSend(v10, "scaleFactor"));
          v93 = MEMORY[0x24BE28A68];
          v141 = *(CGSize *)(MEMORY[0x24BE28A68] + 16);
          v143 = *MEMORY[0x24BE28A68];
          v157.origin = (CGPoint)*MEMORY[0x24BE28A68];
          v157.size = v141;
          v95 = *(double *)(MEMORY[0x24BE28A68] + 32);
          v94 = *(double *)(MEMORY[0x24BE28A68] + 40);
          -[TDSimpleArtworkRenditionSpec alignmentRect](self, "alignmentRect");
          v96 = v168.origin.x;
          v97 = v168.origin.y;
          v98 = v168.size.width;
          v99 = v168.size.height;
          if (!NSEqualRects(v168, *MEMORY[0x24BDD1408])
            && (v96 >= 0.0 || v97 >= 0.0 || v96 + v98 <= (double)(int)v138 || v97 + v99 <= (double)(int)v137))
          {
            if (self)
            {
              -[TDSimpleArtworkRenditionSpec _edgeMetricsForAlignmentRect:originalRenditionSize:newRenditionSize:](self, "_edgeMetricsForAlignmentRect:originalRenditionSize:newRenditionSize:", v138 | (v137 << 32), v162, v96, v97, v98, v99);
              v94 = *((double *)&v156 + 1);
              v95 = *(double *)&v156;
            }
            else
            {
              v156 = 0u;
              memset(&mediaBox, 0, sizeof(mediaBox));
              v94 = 0.0;
              v95 = 0.0;
            }
            v157 = mediaBox;
          }
          mediaBox = v157;
          *(double *)&v156 = v95;
          *((double *)&v156 + 1) = v94;
          *(_OWORD *)value = v143;
          v153 = v141;
          v154 = *(_OWORD *)(v93 + 32);
          if (CSIEqualMetrics())
          {
            memset(&v157, 0, sizeof(v157));
            v95 = (double)(int)v162;
            v94 = (double)SHIDWORD(v162);
          }
          objc_msgSend(v76, "setClampMetrics:", objc_msgSend(a5, "_clampMetrics"));
          mediaBox = v157;
          *(double *)&v156 = v95;
          *((double *)&v156 + 1) = v94;
          objc_msgSend(v76, "addMetrics:", &mediaBox);
          objc_msgSend(v76, "setBlendMode:", 0);
          objc_msgSend(v76, "setOpacity:", 1.0);
          if (-[TDSimpleArtworkRenditionSpec parentRendition](self, "parentRendition")
            || ((objc_msgSend(v9, "makeOpaqueIfPossible") & 1) == 0 && v160 != 1195456544 && v160 != 1195454774
              ? (AlphaInfo = CGImageGetBitmapInfo(v19) & 0x1F)
              : (AlphaInfo = CUICGImageGetAlphaInfo()),
                (v144 & 1) != 0))
          {
            v101 = 0;
          }
          else
          {
            v107 = objc_alloc(MEMORY[0x24BE28C18]);
            v101 = (void *)objc_msgSend(v107, "initWithPixelWidth:pixelHeight:", v162, HIDWORD(v162));
            objc_msgSend(v101, "setAllowsMultiPassEncoding:", -[TDSimpleArtworkRenditionSpec allowsMultiPassEncoding](self, "allowsMultiPassEncoding"));
            objc_msgSend(v101, "setAllowsOptimalRowbytesPacking:", -[TDSimpleArtworkRenditionSpec allowsOptimalRowbytesPacking](self, "allowsOptimalRowbytesPacking"));
            objc_msgSend(v101, "setAllowsCompactCompression:", -[TDSimpleArtworkRenditionSpec allowsCompactCompression](self, "allowsCompactCompression"));
            objc_msgSend(v101, "setPixelFormat:", objc_msgSend(v76, "pixelFormat"));
            objc_msgSend(v101, "setColorSpaceID:", (int)objc_msgSend(v76, "colorSpaceID"));
            objc_msgSend(v101, "setSourceAlphaInfo:", AlphaInfo);
            objc_msgSend(v101, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
            objc_msgSend(v76, "addBitmap:", v101);
            v108 = (CGContext *)objc_msgSend(v101, "bitmapContext");
            if (CGImageGetBitsPerComponent(v19) >= 9 && CGBitmapContextGetBitsPerComponent(v108) == 8)
            {
              v109 = v19;
              v110 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
              v111 = CUIConvertDeepImageTo8();
              if (v111)
              {
                v112 = (CGImage *)v111;
                CFRelease(v109);
                imagea = v112;
              }
              CFRelease(v110);
              v19 = imagea;
            }
            imagea = v19;
            if (v159)
            {
              if (v108 && objc_msgSend(v48, "count"))
              {
                CGContextSaveGState(v108);
                CGContextSetBlendMode(v108, kCGBlendModeCopy);
                if (objc_msgSend(v48, "count"))
                {
                  v113 = 0;
                  do
                  {
                    objc_msgSend((id)objc_msgSend(v158, "objectAtIndex:", v113), "rectValue");
                    v115 = v114;
                    v117 = v116;
                    v119 = v118;
                    v121 = v120;
                    objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", v113), "rectValue");
                    if (v119 > 0.0 && v121 > 0.0)
                    {
                      v126 = v122;
                      v127 = v124;
                      v128 = v125;
                      if ((v136 & 0xFFFFFFFE) == 2)
                        v129 = (double)SHIDWORD(v162) - (v123 + v125);
                      else
                        v129 = v123;
                      v169.origin.x = v115;
                      v169.origin.y = v117;
                      v169.size.width = v119;
                      v169.size.height = v121;
                      v130 = CGImageCreateWithImageInRect(imagea, v169);
                      v170.origin.x = v126;
                      v170.origin.y = v129;
                      v170.size.width = v127;
                      v170.size.height = v128;
                      CGContextDrawImage(v108, v170, v130);
                      CGImageRelease(v130);
                    }
                    ++v113;
                  }
                  while (v113 < objc_msgSend(v48, "count"));
                }
                CGContextRestoreGState(v108);
              }
            }
            else if (v108)
            {
              v171.origin.x = 0.0;
              v171.origin.y = 0.0;
              v171.size.width = Width;
              v171.size.height = v17;
              CGContextDrawImage(v108, v171, v19);
            }
          }
          v150 = 0u;
          v151 = 0u;
          v148 = 0u;
          v149 = 0u;
          v102 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v148, v163, 16);
          if (v102)
          {
            v103 = v102;
            v104 = *(_QWORD *)v149;
            do
            {
              for (i = 0; i != v103; ++i)
              {
                if (*(_QWORD *)v149 != v104)
                  objc_enumerationMutation(v48);
                objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * i), "rectValue");
                objc_msgSend(v76, "addSliceRect:");
              }
              v103 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v148, v163, 16);
            }
            while (v103);
          }
          -[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters");
          objc_msgSend(v76, "setPhysicalSizeInMeters:");
          objc_msgSend(v76, "setTemplateRenderingMode:", objc_msgSend((id)objc_msgSend(v9, "templateRenderingMode"), "identifier"));
          objc_msgSend(v76, "setOptOutOfThinning:", objc_msgSend(v9, "optOutOfThinning"));
          objc_msgSend(v76, "setPreserveForArchiveOnly:", -[TDSimpleArtworkRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
          objc_msgSend(v76, "setPreservedVectorRepresentation:", objc_msgSend(v9, "preservesVectorRepresentation"));
          objc_msgSend(v76, "setIsFlippable:", objc_msgSend(v9, "isFlippable"));
          objc_msgSend(v76, "setExcludedFromContrastFilter:", objc_msgSend((id)objc_msgSend(v9, "isExcludedFromFilter"), "BOOLValue"));
          objc_msgSend(v76, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
          v14 = (void *)objc_msgSend(v76, "CSIRepresentationWithCompression:", v7);

          CGImageRelease(imagea);
          return v14;
        }
LABEL_84:
        v90 = v142;
        goto LABEL_101;
      }
      mediaBox.origin.x = 0.0;
      v50 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v18, 2, 0);
      v51 = v50;
      if (v160 == 1246774599 || v160 == 1212500294)
      {
        v52 = CGImageSourceCreateWithData(v50, 0);
        if (v52)
        {
          v53 = v52;
          v135 = v51;
          v139 = v9;
          v134 = v7;
          v54 = CGImageSourceCopyMetadataAtIndex(v52, 0, 0);
          v55 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          cf = v54;
          objc_msgSend(v55, "setObject:forKey:", v54, *MEMORY[0x24BDD9230]);
          v56 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
          Type = CGImageSourceGetType(v53);
          v58 = CGImageDestinationCreateWithData(v56, Type, 1uLL, 0);
          if (v58)
          {
            v59 = v58;
            value[0] = 0;
            v60 = a5;
            v61 = *MEMORY[0x24BDBD270];
            objc_msgSend(v55, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDD9258]);
            v62 = v61;
            a5 = v60;
            v19 = imagea;
            objc_msgSend(v55, "setObject:forKey:", v62, *MEMORY[0x24BDD9250]);
            v63 = CGImageDestinationCopyImageSource(v59, v53, (CFDictionaryRef)v55, value);
            v64 = v135;
            if (v63)
              v65 = v135;
            else
              v65 = v56;
            if (v63)
              v64 = v56;
            v135 = v64;

            CFRelease(v59);
          }
          else
          {

          }
          CFRelease(cf);
          CFRelease(v53);
          v7 = v134;
          v9 = v139;
          v51 = v135;
        }
        v84 = objc_alloc(MEMORY[0x24BE28C20]);
        v76 = (void *)objc_msgSend(v84, "initWithRawData:pixelFormat:layout:", v51, v160, v49);
        objc_msgSend(v76, "setName:", objc_msgSend(v10, "name"));
        objc_msgSend(v76, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
        objc_msgSend(v76, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
        objc_msgSend(v76, "setAllowsDeepmapImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
        objc_msgSend(v76, "setAllowsDeepmap2ImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
        objc_msgSend(v76, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
LABEL_75:

        if (!v19)
          goto LABEL_84;
        goto LABEL_76;
      }
      v80 = objc_alloc(MEMORY[0x24BE28C20]);
      v76 = (void *)objc_msgSend(v80, "initWithRawData:pixelFormat:layout:", v51, v160, 1000);
      objc_msgSend(v76, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
      objc_msgSend(v76, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
      objc_msgSend(v76, "setAllowsDeepmapImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
      objc_msgSend(v76, "setAllowsDeepmap2ImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
      objc_msgSend(v76, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
      if (objc_msgSend((id)objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "universalTypeIdentifier"), "length"))
      {
        v81 = COERCE_DOUBLE(objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "universalTypeIdentifier"));
      }
      else
      {
        if (!objc_msgSend(v18, "getResourceValue:forKey:error:", &mediaBox, *MEMORY[0x24BDBCCF0], 0))
        {
          objc_msgSend(v76, "setName:", objc_msgSend(v10, "name"));
          goto LABEL_74;
        }
        v81 = mediaBox.origin.x;
      }
      objc_msgSend(v76, "setUtiType:", *(_QWORD *)&v81);
LABEL_74:
      v142 = 0;
      goto LABEL_75;
    }
    return 0;
  }
  if (v160 == 1398163232)
    goto LABEL_64;
  if (v160 != 1346651680)
    goto LABEL_7;
  v21 = CGPDFDocumentCreateWithURL((CFURLRef)v18);
  if (!v21)
  {
LABEL_64:
    v44 = (__CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v18, 2, 0);
  }
  else
  {
    v22 = v21;
    image = (CGImageRef)a5;
    v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v24 = *MEMORY[0x24BDBD430];
    v25 = *MEMORY[0x24BDBF488];
    objc_msgSend(v23, "setObject:forKeyedSubscript:", *MEMORY[0x24BDBD430], *MEMORY[0x24BDBF488]);
    v26 = *MEMORY[0x24BDBF408];
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BDBF408]);
    v27 = *MEMORY[0x24BDBF400];
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BDBF400]);
    Info = CGPDFDocumentGetInfo(v22);
    if (Info)
    {
      v29 = Info;
      value[0] = 0;
      if (CGPDFDictionaryGetString(Info, "Producer", value))
      {
        v30 = CGPDFStringCopyTextString(value[0]);
        if (v30)
        {
          v31 = v30;
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, v25);
          CFRelease(v31);
        }
      }
      if (CGPDFDictionaryGetString(v29, "CreationDate", value))
      {
        v32 = CGPDFStringCopyDate(value[0]);
        if (v32)
        {
          v33 = v32;
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, v27);
          CFRelease(v33);
        }
      }
      ID = CGPDFDocumentGetID(v22);
      Count = CGPDFArrayGetCount(ID);
      if (Count)
      {
        v36 = Count;
        v145 = v26;
        v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v38 = 0;
        v39 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        do
        {
          if (CGPDFArrayGetString(ID, v38, value))
          {
            BytePtr = CGPDFStringGetBytePtr(value[0]);
            Length = CGPDFStringGetLength(value[0]);
            if (Length)
            {
              v42 = CFDataCreate(v39, BytePtr, Length);
              objc_msgSend(v37, "addObject:", v42);
              CFRelease(v42);
            }
          }
          ++v38;
        }
        while (v36 != v38);
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v37, v145);

      }
    }
    CGPDFDocumentEnableTaggedStructureSerialization();
    Page = CGPDFDocumentGetPage(v22, 1uLL);
    mediaBox = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    v44 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v45 = CGDataConsumerCreateWithCFData(v44);
    v46 = CGPDFContextCreate(v45, &mediaBox, (CFDictionaryRef)v23);
    CGDataConsumerRelease(v45);
    CGPDFContextBeginPage(v46, 0);
    CGContextDrawPDFPage(v46, Page);
    CGPDFContextEndPage(v46);
    CGPDFContextClose(v46);
    CGContextRelease(v46);
    CGPDFDocumentRelease(v22);

    a5 = image;
  }
  v82 = objc_alloc(MEMORY[0x24BE28C20]);
  v83 = (void *)objc_msgSend(v82, "initWithRawData:pixelFormat:layout:", v44, v160, 9);
  objc_msgSend(v83, "setIsVectorBased:", 1);
  objc_msgSend(v83, "setName:", objc_msgSend(v10, "name"));
  objc_msgSend(v83, "setColorSpaceID:", 0);
  objc_msgSend(v83, "setScaleFactor:", 0);
  -[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters");
  objc_msgSend(v83, "setPhysicalSizeInMeters:");
  objc_msgSend(v83, "setAllowsPaletteImageCompression:", -[TDSimpleArtworkRenditionSpec allowsPaletteImageCompression](self, "allowsPaletteImageCompression"));
  objc_msgSend(v83, "setAllowsHevcCompression:", -[TDSimpleArtworkRenditionSpec allowsHevcCompression](self, "allowsHevcCompression"));
  objc_msgSend(v83, "setAllowsDeepmapImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmapCompression](self, "allowsDeepmapCompression"));
  objc_msgSend(v83, "setAllowsDeepmap2ImageCompression:", -[TDSimpleArtworkRenditionSpec allowsDeepmap2Compression](self, "allowsDeepmap2Compression"));
  objc_msgSend(v83, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  if (v160 == 1398163232)
    objc_msgSend(v83, "setCompressionType:", 2);
  v14 = (void *)objc_msgSend(v83, "CSIRepresentationWithCompression:", 0);

  return v14;
}

- (CGSize)_scaleRecognitionImageFromSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters");
  if (v6 > 0.0 || (-[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters"), v7 > 0.0))
  {
    if (width <= height)
    {
      if (height > 640.0)
      {
        width = round(width * (640.0 / height));
        height = 640.0;
      }
    }
    else if (width > 640.0)
    {
      height = round(height * (640.0 / width));
      width = 640.0;
    }
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  int v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  char v19;
  NSObject *global_queue;
  NSObject *v21;
  uint64_t v22;
  int v23;
  CGPDFDocument *v24;
  CGPDFDocument *v25;
  CGPDFPage *Page;
  double width;
  double height;
  double v29;
  double v30;
  double v31;
  unsigned int v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  CGImage *v36;
  uint64_t IsMonochrome;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  CGImage *v43;
  CGImage *v44;
  _QWORD v46[7];
  _QWORD block[11];
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  NSSize *v70;
  uint64_t v71;
  const char *v72;
  __int128 v73;
  uint64_t v74;
  NSRect *v75;
  uint64_t v76;
  const char *v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  objc_super v83;
  CGRect BoxRect;

  v5 = (void *)-[TDSimpleArtworkRenditionSpec asset](self, "asset");
  v83.receiver = self;
  v83.super_class = (Class)TDSimpleArtworkRenditionSpec;
  -[TDRenditionSpec updatePackingPropertiesWithDocument:](&v83, sel_updatePackingPropertiesWithDocument_, a3);
  v6 = (void *)objc_msgSend(v5, "fileURLWithDocument:", a3);
  v7 = (void *)objc_msgSend(v6, "pathExtension");
  v8 = objc_msgSend(v7, "length");
  if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("PDF")))
  {
    if (!objc_msgSend(v5, "scaleFactor"))
      return 1;
    v24 = CGPDFDocumentCreateWithURL((CFURLRef)v6);
    if (!v24)
      return 1;
    v25 = v24;
    Page = CGPDFDocumentGetPage(v24, 1uLL);
    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    v29 = (double)objc_msgSend(v5, "scaleFactor", BoxRect.origin.x, BoxRect.origin.y);
    -[TDSimpleArtworkRenditionSpec postScaleFactor](self, "postScaleFactor");
    v31 = v30 * v29;
    v32 = objc_msgSend(v5, "fileScaleFactor");
    if (!v32)
      v32 = +[TDAsset scaleFactorFromImageFilename:](TDAsset, "scaleFactorFromImageFilename:", objc_msgSend(v6, "path"));
    v34 = (double)v32;
    LODWORD(v33) = llround(v31 * (width / (double)v32));
    -[TDSimpleArtworkRenditionSpec setWidth:](self, "setWidth:", v33);
    LODWORD(v35) = llround(v31 * (height / v34));
    -[TDSimpleArtworkRenditionSpec setHeight:](self, "setHeight:", v35);
    if (objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "recognitionImage"))
    {
      -[TDSimpleArtworkRenditionSpec setMonochrome:](self, "setMonochrome:", 1);
    }
    else
    {
      LODWORD(v74) = 0;
      LOBYTE(v69) = 0;
      v43 = -[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:](self, "_createImageRefWithURL:andDocument:format:vectorBased:", v6, a3, &v74, &v69);
      -[TDSimpleArtworkRenditionSpec setMonochrome:](self, "setMonochrome:", CUIImageIsMonochrome());
      CFRelease(v43);
    }
    v44 = v25;
LABEL_34:
    CFRelease(v44);
    return 1;
  }
  if (!objc_msgSend((id)objc_msgSend(v6, "pathExtension"), "caseInsensitiveCompare:", CFSTR("SVG")))
  {
    if (!objc_msgSend(v5, "scaleFactor") || (objc_msgSend(v5, "rawData") & 1) != 0)
      return 1;
    LODWORD(v74) = 0;
    LOBYTE(v69) = 0;
    v36 = -[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:](self, "_createImageRefWithURL:andDocument:format:vectorBased:", v6, a3, &v74, &v69);
    -[TDSimpleArtworkRenditionSpec setWidth:](self, "setWidth:", CGImageGetWidth(v36));
    -[TDSimpleArtworkRenditionSpec setHeight:](self, "setHeight:", CGImageGetHeight(v36));
    if ((objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "recognitionImage") & 1) != 0)
      IsMonochrome = 1;
    else
      IsMonochrome = CUIImageIsMonochrome();
    -[TDSimpleArtworkRenditionSpec setMonochrome:](self, "setMonochrome:", IsMonochrome);
    v44 = v36;
    goto LABEL_34;
  }
  if (v8)
  {
    if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("JPEG"))
      && objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("JPG")))
    {
      if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("PNG")))
      {
        v9 = objc_msgSend(v5, "sourceImageWithDocument:", a3);
        if (v9)
        {
          v10 = (void *)v9;
          v82 = 0;
          v81 = 0;
          v80 = 0;
          v74 = 0;
          v75 = (NSRect *)&v74;
          v76 = 0x4010000000;
          v77 = "";
          v11 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
          v78 = *MEMORY[0x24BDBF090];
          v79 = v11;
          v69 = 0;
          v70 = (NSSize *)&v69;
          v72 = "";
          v71 = 0x3010000000;
          v73 = *MEMORY[0x24BDBF148];
          v65 = 0;
          v66 = &v65;
          v67 = 0x2020000000;
          v68 = 0;
          v61 = 0;
          v62 = &v61;
          v63 = 0x2020000000;
          v64 = 0;
          v57 = 0;
          v58 = &v57;
          v59 = 0x2020000000;
          v60 = 0;
          v53 = 0;
          v54 = &v53;
          v55 = 0x2020000000;
          v56 = 0;
          v49 = 0;
          v50 = &v49;
          v51 = 0x2020000000;
          v52 = 0;
          v12 = -[TDSimpleArtworkRenditionSpec alphaCrop](self, "alphaCrop");
          v13 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier");
          v50[3] = v13;
          objc_msgSend(v10, "size");
          -[TDSimpleArtworkRenditionSpec _scaleRecognitionImageFromSize:](self, "_scaleRecognitionImageFromSize:");
          v15 = v14;
          v17 = v16;
          v18 = objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "makeOpaqueIfPossible");
          *((_BYTE *)v62 + 24) = v18;
          v19 = objc_msgSend((id)-[TDSimpleArtworkRenditionSpec production](self, "production"), "recognitionImage");
          *((_BYTE *)v58 + 24) = v19;
          global_queue = dispatch_get_global_queue(0, 0);
          v21 = dispatch_group_create();
          LODWORD(v82) = (int)v15;
          HIDWORD(v82) = (int)v17;
          -[TDSimpleArtworkRenditionSpec _sliceRectanglesForRenditionSize:unadjustedSliceRectangles:imageSlicesNeedAdjustment:newRenditionSize:](self, "_sliceRectanglesForRenditionSize:unadjustedSliceRectangles:imageSlicesNeedAdjustment:newRenditionSize:", v82, &v80, &v81, &v82);
          -[TDSimpleArtworkRenditionSpec setWidth:](self, "setWidth:", v82);
          -[TDSimpleArtworkRenditionSpec setHeight:](self, "setHeight:", HIDWORD(v82));
          v22 = MEMORY[0x24BDAC760];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __68__TDSimpleArtworkRenditionSpec_updatePackingPropertiesWithDocument___block_invoke;
          block[3] = &unk_24EF2C740;
          block[4] = v10;
          block[5] = &v49;
          v48 = v12;
          block[6] = &v69;
          block[7] = &v74;
          block[8] = &v61;
          block[9] = &v65;
          block[10] = v82;
          dispatch_group_async(v21, global_queue, block);
          v46[0] = v22;
          v46[1] = 3221225472;
          v46[2] = __68__TDSimpleArtworkRenditionSpec_updatePackingPropertiesWithDocument___block_invoke_2;
          v46[3] = &unk_24EF2C768;
          v46[5] = &v57;
          v46[6] = &v53;
          v46[4] = v10;
          dispatch_group_async(v21, global_queue, v46);
          dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_release(v21);
          if (v50[3])
            v23 = 0;
          else
            v23 = v12;
          if (v23 == 1)
          {
            if (!CGRectIsEmpty(v75[1]))
            {
              -[TDSimpleArtworkRenditionSpec setWidth:](self, "setWidth:", (int)v75[1].size.width);
              -[TDSimpleArtworkRenditionSpec setHeight:](self, "setHeight:", (int)v75[1].size.height);
            }
            -[TDSimpleArtworkRenditionSpec setOriginalImageSizeString:](self, "setOriginalImageSizeString:", NSStringFromSize(v70[2]));
            -[TDSimpleArtworkRenditionSpec setNonAlphaImageAreaString:](self, "setNonAlphaImageAreaString:", NSStringFromRect(v75[1]));
          }
          else
          {
            -[TDSimpleArtworkRenditionSpec setOpaque:](self, "setOpaque:", *((unsigned __int8 *)v66 + 24));
          }
          -[TDSimpleArtworkRenditionSpec setMonochrome:](self, "setMonochrome:", *((unsigned __int8 *)v54 + 24));
          _Block_object_dispose(&v49, 8);
          _Block_object_dispose(&v53, 8);
          _Block_object_dispose(&v57, 8);
          _Block_object_dispose(&v61, 8);
          _Block_object_dispose(&v65, 8);
          _Block_object_dispose(&v69, 8);
          _Block_object_dispose(&v74, 8);
        }
      }
    }
    else if ((-[TDSimpleArtworkRenditionSpec alphaCrop](self, "alphaCrop") & 1) != 0
           || (-[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters"), v38 > 0.0)
           || (-[TDSimpleArtworkRenditionSpec physicalSizeInMeters](self, "physicalSizeInMeters"), v39 > 0.0))
    {
      v40 = (void *)objc_msgSend(v5, "sourceImageWithDocument:", a3);
      if (v40)
      {
        LOBYTE(v65) = 0;
        v69 = 0;
        objc_msgSend(v40, "size");
        -[TDSimpleArtworkRenditionSpec _scaleRecognitionImageFromSize:](self, "_scaleRecognitionImageFromSize:");
        LODWORD(v74) = (int)v41;
        HIDWORD(v74) = (int)v42;
        -[TDSimpleArtworkRenditionSpec _sliceRectanglesForRenditionSize:unadjustedSliceRectangles:imageSlicesNeedAdjustment:newRenditionSize:](self, "_sliceRectanglesForRenditionSize:unadjustedSliceRectangles:imageSlicesNeedAdjustment:newRenditionSize:", v74, &v69, &v65, &v74);
        -[TDSimpleArtworkRenditionSpec setWidth:](self, "setWidth:", v74);
        -[TDSimpleArtworkRenditionSpec setHeight:](self, "setHeight:", HIDWORD(v74));
        -[TDSimpleArtworkRenditionSpec setOpaque:](self, "setOpaque:", 1);
      }
    }
  }
  return 1;
}

__n128 __68__TDSimpleArtworkRenditionSpec_updatePackingPropertiesWithDocument___block_invoke(uint64_t a1)
{
  __n128 result;
  int v3;
  CGImage *v4;
  int AlphaInfo;
  uint64_t v6;
  int64x2_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 IsEmpty;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  if (objc_msgSend(*(id *)(a1 + 32), "image"))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) || !*(_BYTE *)(a1 + 88))
    {
      v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v4 = (CGImage *)objc_msgSend(*(id *)(a1 + 32), "image");
      if (v3)
        AlphaInfo = CUICGImageGetAlphaInfo();
      else
        AlphaInfo = CGImageGetAlphaInfo(v4);
      if (AlphaInfo == 5 || AlphaInfo == 0)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 80);
      v7.i64[0] = (int)v6;
      v7.i64[1] = SHIDWORD(v6);
      *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = vcvtq_f64_s64(v7);
      objc_msgSend(*(id *)(a1 + 32), "image");
      CUICalcNonAlphaAreaOfImage();
      v8 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
      v8[4] = v9;
      v8[5] = v10;
      v8[6] = v11;
      v8[7] = v12;
      IsEmpty = CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
      v14 = *(_QWORD *)(a1 + 48);
      if (IsEmpty)
      {
        v15 = *(_QWORD *)(v14 + 8);
LABEL_17:
        *(_OWORD *)(v15 + 32) = *MEMORY[0x24BDBF148];
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        result = *(__n128 *)(MEMORY[0x24BDBF090] + 16);
        *(_OWORD *)(v18 + 32) = *MEMORY[0x24BDBF090];
        *(__n128 *)(v18 + 48) = result;
        return result;
      }
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      result.n128_u64[0] = *(_QWORD *)(v17 + 56);
      v15 = *(_QWORD *)(v14 + 8);
      if (result.n128_f64[0] == *(double *)(v15 + 40))
      {
        result.n128_u64[0] = *(_QWORD *)(v17 + 48);
        if (result.n128_f64[0] == *(double *)(v15 + 32))
          goto LABEL_17;
      }
    }
  }
  return result;
}

uint64_t __68__TDSimpleArtworkRenditionSpec_updatePackingPropertiesWithDocument___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24)
    || (objc_msgSend(*(id *)(result + 32), "image"), result = CUIImageIsMonochrome(), (_DWORD)result))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)drawPackableRenditionInContext:(CGContext *)a3 withDocument:(id)a4
{
  double v7;
  double v8;
  unsigned int v9;
  CGImage *v10;
  CGColorSpaceRef v11;
  uint64_t v12;
  CGImage *v13;
  size_t Width;
  size_t Height;
  unint64_t v16;
  id v17;
  void *v18;
  CGFloat x;
  unint64_t v20;
  unsigned int v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGImage *v38;
  CGFloat v39;
  CGImage *Image;
  CGImage *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGImage *v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double y;
  unint64_t v53;
  id v54;
  char v55;
  int v56;
  char v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  NSRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v57 = 0;
  v56 = 1246774599;
  v55 = 0;
  v53 = 0;
  v54 = 0;
  -[TDRenditionSpec packedPoint](self, "packedPoint");
  v47 = v7;
  v48 = v8;
  v9 = -[TDThemeConstant identifier](-[TDRenditionSpec renditionType](self, "renditionType"), "identifier");
  v10 = -[TDSimpleArtworkRenditionSpec _createImageRefWithURL:andDocument:format:vectorBased:](self, "_createImageRefWithURL:andDocument:format:vectorBased:", objc_msgSend((id)-[TDSimpleArtworkRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a4), a4, &v56, &v57);
  if (CGImageGetBitsPerComponent(v10) >= 9 && CGBitmapContextGetBitsPerComponent(a3) == 8)
  {
    v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
    v12 = CUIConvertDeepImageTo8();
    if (v12)
    {
      v13 = (CGImage *)v12;
      CFRelease(v10);
      v10 = v13;
    }
    CFRelease(v11);
  }
  Width = CGImageGetWidth(v10);
  Height = CGImageGetHeight(v10);
  v16 = Height;
  v53 = __PAIR64__(Height, Width);
  v17 = -[TDSimpleArtworkRenditionSpec _sliceRectanglesForRenditionSize:unadjustedSliceRectangles:imageSlicesNeedAdjustment:newRenditionSize:](self, "_sliceRectanglesForRenditionSize:unadjustedSliceRectangles:imageSlicesNeedAdjustment:newRenditionSize:", __PAIR64__(Height, Width), &v54, &v55, &v53);
  if (v55)
  {
    if (a3)
    {
      v18 = v17;
      if (objc_msgSend(v54, "count"))
      {
        CGContextSaveGState(a3);
        x = *MEMORY[0x24BDBF070];
        v51 = *(double *)(MEMORY[0x24BDBF070] + 16);
        y = *(double *)(MEMORY[0x24BDBF070] + 8);
        v50 = *(double *)(MEMORY[0x24BDBF070] + 24);
        CGContextSetBlendMode(a3, kCGBlendModeCopy);
        if (objc_msgSend(v18, "count"))
        {
          v20 = 0;
          v21 = v9 & 0xFFFFFFFE;
          do
          {
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndex:", v20), "rectValue");
            v23 = v22;
            v25 = v24;
            v27 = v26;
            v29 = v28;
            objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", v20), "rectValue");
            if (v27 > 0.0 && v29 > 0.0)
            {
              v34 = v30;
              v35 = v32;
              v36 = v33;
              v49 = x;
              if (v21 == 2)
                v37 = (double)SHIDWORD(v53) - (v31 + v33);
              else
                v37 = v31;
              v58.origin.x = v23;
              v58.origin.y = v25;
              v58.size.width = v27;
              v58.size.height = v29;
              v38 = CGImageCreateWithImageInRect(v10, v58);
              v59.origin.x = v47 + v34;
              v59.origin.y = v48 + v37;
              v59.size.width = v35;
              v59.size.height = v36;
              CGContextDrawImage(a3, v59, v38);
              CGImageRelease(v38);
              v60.origin.x = v49;
              v60.size.height = v50;
              v60.size.width = v51;
              v60.origin.y = y;
              v67.origin.x = v47 + v34;
              v67.origin.y = v48 + v37;
              v67.size.width = v35;
              v67.size.height = v36;
              v61 = CGRectUnion(v60, v67);
              x = v61.origin.x;
              v51 = v61.size.width;
              y = v61.origin.y;
              v50 = v61.size.height;
            }
            ++v20;
          }
          while (v20 < objc_msgSend(v18, "count"));
        }
        v39 = (double)CGBitmapContextGetHeight(a3) - (v50 + y);
        Image = CGBitmapContextCreateImage(a3);
        v62.origin.x = x;
        v62.origin.y = v39;
        v62.size.width = v51;
        v62.size.height = v50;
        v41 = CGImageCreateWithImageInRect(Image, v62);
        CUICalculateExtrusionMaskOfImage();
        CUIDrawExtrudedImageInContext();
        CGImageRelease(Image);
        CGImageRelease(v41);
        CGContextRestoreGState(a3);
      }
    }
  }
  else if (a3)
  {
    v63 = NSRectFromString((NSString *)-[TDSimpleArtworkRenditionSpec nonAlphaImageAreaString](self, "nonAlphaImageAreaString"));
    v42 = v63.origin.x;
    v43 = v63.origin.y;
    v44 = v63.size.width;
    v45 = v63.size.height;
    if (CGRectIsEmpty(v63))
    {
      CUICalculateExtrusionMaskOfImage();
      v64.origin.x = v47 + 0.0;
      v64.origin.y = v48 + 0.0;
      v64.size.width = (double)Width;
      v64.size.height = (double)v16;
      CGContextDrawImage(a3, v64, v10);
      CUIDrawExtrudedImageInContext();
    }
    else
    {
      v65.origin.x = v42;
      v65.origin.y = v43;
      v65.size.width = v44;
      v65.size.height = v45;
      v46 = CGImageCreateWithImageInRect(v10, v65);
      CUICalculateExtrusionMaskOfImage();
      v66.origin.x = v47 + 0.0;
      v66.origin.y = v48 + 0.0;
      v66.size.width = v44;
      v66.size.height = v45;
      CGContextDrawImage(a3, v66, v46);
      CUIDrawExtrudedImageInContext();
      CGImageRelease(v46);
    }
  }
  CGImageRelease(v10);
}

- (TDImageColorHistogram)histogram
{
  return self->_histogram;
}

- (void)setHistogram:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (BOOL)isBackstop
{
  return self->_isBackstop;
}

- (void)setIsBackstop:(BOOL)a3
{
  self->_isBackstop = a3;
}

@end
