@implementation CPZoneMaker

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPZoneMaker;
  -[CPZoneMaker dealloc](&v3, sel_dealloc);
}

- (BOOL)overlap:(id)a3 with:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a3, "top");
  v7 = v6;
  objc_msgSend(a3, "bottom");
  v9 = v8;
  objc_msgSend(a4, "top");
  v11 = v10;
  objc_msgSend(a4, "bottom");
  return v11 >= v9 && v7 >= v12;
}

- (void)makeZonesIn:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CPCharSequence *v9;
  float v10;
  float v11;
  double v12;
  void *v13;
  CPCompoundGraphic *v14;
  CPCompoundGraphic *v15;
  CPZone *v16;
  CPZone *v17;
  CPBody *v18;

  v5 = objc_msgSend(a3, "PDFContext");
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)(v5 + 2064);
    if (v7)
    {
      v8 = -1431655765 * ((unint64_t)(*(_QWORD *)(v5 + 2072) - v7) >> 6);

      v9 = -[CPCharSequence initWithSizeFor:]([CPCharSequence alloc], "initWithSizeFor:", v8);
      self->charactersOnPage = v9;
      -[CPCharSequence addChars:length:](v9, "addChars:length:", *(_QWORD *)(v6 + 2064), v8);
      +[CPObjectUtility complexityOfPage:](CPObjectUtility, "complexityOfPage:", a3);
      v11 = v10;
      objc_msgSend(a3, "setComplexity:");
      v12 = v11;
      if (v11 <= 0.8)
      {
        if (-[CPZoneMaker categorizeGraphicsIn:](self, "categorizeGraphicsIn:", a3, v12) > 0x7D0)
        {
          v17 = objc_alloc_init(CPZone);
          -[CPObject setPage:](v17, "setPage:", a3);
          -[CPChunk setShrinksWithChildren:](v17, "setShrinksWithChildren:", 0);
          -[CPZone setIsStraddleZone:](v17, "setIsStraddleZone:", 1);
          -[CPChunk addChildrenOf:](v17, "addChildrenOf:", a3);
          -[CPZone setCharactersInZone:](v17, "setCharactersInZone:", self->charactersOnPage);
          objc_msgSend(a3, "add:", v17);

        }
        else
        {
          -[CPZoneMaker mergeQualifyingRectanglesIn:](self, "mergeQualifyingRectanglesIn:", a3);
          -[CPZoneMaker makeZonesWithBoundaryIn:](self, "makeZonesWithBoundaryIn:", a3);
        }
        +[CPCompoundGraphicMaker makeCompoundGraphicsInZonesOf:](CPCompoundGraphicMaker, "makeCompoundGraphicsInZonesOf:", a3);
      }
      else
      {
        v13 = (void *)objc_msgSend(a3, "newTakeChildren", v12);
        v14 = [CPCompoundGraphic alloc];
        objc_msgSend(a3, "pageCropBox");
        v15 = -[CPCompoundGraphic initWithGraphicObjects:withRenderedBounds:](v14, "initWithGraphicObjects:withRenderedBounds:", v13);

        objc_msgSend(a3, "pageCropBox");
        -[CPChunk setBounds:](v15, "setBounds:");
        v16 = objc_alloc_init(CPZone);
        -[CPObject setPage:](v16, "setPage:", a3);
        -[CPChunk setShrinksWithChildren:](v16, "setShrinksWithChildren:", 0);
        -[CPZone setIsStraddleZone:](v16, "setIsStraddleZone:", 1);
        -[CPChunk add:](v16, "add:", v15);

        -[CPZone setCharactersInZone:](v16, "setCharactersInZone:", self->charactersOnPage);
        objc_msgSend(a3, "add:", v16);

      }
      self->charactersOnPage = 0;
      v18 = objc_alloc_init(CPBody);
      -[CPChunk setShrinksWithChildren:](v18, "setShrinksWithChildren:", 0);
      -[CPChunk addChildrenOf:](v18, "addChildrenOf:", a3);
      objc_msgSend(a3, "add:", v18);
      objc_msgSend(a3, "setHasZones:", 1);
      objc_msgSend(a3, "pageCropBox");
      -[CPChunk setBounds:](v18, "setBounds:");

    }
  }
}

- (unsigned)categorizeGraphicsIn:(id)a3
{
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  const CGPath *v9;
  const CGPath *v10;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v4 = objc_msgSend(a3, "count");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = (void *)objc_msgSend(a3, "childAtIndex:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v8, "isNarrow") && objc_msgSend(v8, "isVisible"))
      {
        objc_msgSend(v8, "setZoneGraphicType:", 1);
        ++v7;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v8, "canBeContainer")
          && objc_msgSend(v8, "isVisible"))
        {
          if (objc_msgSend(v8, "isUprightRectangle"))
          {
            objc_msgSend(v8, "setZoneGraphicType:", 2);
            v7 += 4;
          }
          else
          {
            v9 = (const CGPath *)objc_msgSend(v8, "path");
            if (v9)
            {
              v10 = v9;
              if (!CGPathIsEmpty(v9))
              {
                v15 = 256;
                v12 = 0x3FF0000000000000;
                v13 = 0u;
                v14 = 0u;
                CGPathApply(v10, &v12, (CGPathApplierFunction)checkRectilinear);
                if (BYTE1(v15))
                {
                  if ((_BYTE)v15)
                  {
                    objc_msgSend(v8, "setZoneGraphicType:", 3);
                    LODWORD(v12) = 0;
                    CGPathApply(v10, &v12, (CGPathApplierFunction)countElements);
                    v7 += v12;
                  }
                }
              }
            }
          }
        }
      }
    }
    v6 = (v6 + 1);
  }
  while (v5 != (_DWORD)v6);
  return v7;
}

- (void)mergeQualifyingRectanglesIn:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CGColor *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGColor *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  BOOL v28;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  BOOL v34;
  BOOL v35;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double v54;
  double v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v4 = objc_msgSend(a3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      v7 = (void *)objc_msgSend(a3, "childAtIndex:", v6);
      if (canBeMerged(v7))
      {
        v8 = objc_msgSend(v7, "fillColor");
        if (v8)
        {
          v9 = (CGColor *)v8;
          objc_msgSend(v7, "bounds");
          v14 = (v6 + 1);
          if (v14 < v5)
          {
            v15 = v10;
            v16 = v11;
            v17 = fmax(v12, v13);
            v18 = v17 * 0.00000011920929 + 1.17549435e-38 + v17 * 0.00000011920929 + 1.17549435e-38;
            v55 = v11 + v13 + v18;
            v56 = v13;
            v57 = v12;
            v54 = v15 + v12 + v18;
            while (1)
            {
              v19 = (void *)objc_msgSend(a3, "childAtIndex:", v14, *(_QWORD *)&v54);
              if (canBeMerged(v19))
              {
                v20 = (CGColor *)objc_msgSend(v19, "fillColor");
                if (v20)
                {
                  if (CGColorEqualToColor(v9, v20))
                  {
                    objc_msgSend(v19, "bounds");
                    v25 = v24;
                    v27 = vabdd_f64(v15, v24) < v18;
                    v26 = vabdd_f64(v57, v22);
                    v27 = v27 && v26 < v18;
                    v28 = !v27 || v16 > v18 + v21 + v23;
                    if (!v28 && v21 <= v55)
                      break;
                    v30 = v21;
                    v31 = v22;
                    v32 = v23;
                    v33 = vabdd_f64(v56, v23);
                    v34 = vabdd_f64(v16, v21) < v18 && v33 < v18;
                    v35 = !v34 || v15 > v18 + v25 + v22;
                    if (!v35 && v25 <= v54)
                      break;
                    v58.origin.x = v15;
                    v58.origin.y = v16;
                    v58.size.height = v56;
                    v58.size.width = v57;
                    v59 = CGRectInset(v58, -v18, -v18);
                    v65.origin.x = v25;
                    v65.origin.y = v30;
                    v65.size.width = v31;
                    v65.size.height = v32;
                    if (CGRectContainsRect(v59, v65))
                      break;
                    v60.origin.x = v25;
                    v60.origin.y = v30;
                    v60.size.width = v31;
                    v60.size.height = v32;
                    v61 = CGRectInset(v60, -v18, -v18);
                    v66.origin.x = v15;
                    v66.origin.y = v16;
                    v66.size.height = v56;
                    v66.size.width = v57;
                    if (CGRectContainsRect(v61, v66))
                      break;
                  }
                }
              }
              v14 = (v14 + 1);
              if (v5 == (_DWORD)v14)
                goto LABEL_39;
            }
            objc_msgSend(v7, "bounds");
            v38 = v37;
            v40 = v39;
            v42 = v41;
            v44 = v43;
            objc_msgSend(v19, "bounds");
            v67.origin.x = v45;
            v67.origin.y = v46;
            v67.size.width = v47;
            v67.size.height = v48;
            v62.origin.x = v38;
            v62.origin.y = v40;
            v62.size.width = v42;
            v62.size.height = v44;
            v63 = CGRectUnion(v62, v67);
            x = v63.origin.x;
            y = v63.origin.y;
            width = v63.size.width;
            height = v63.size.height;
            Mutable = CGPathCreateMutable();
            v64.origin.x = x;
            v64.origin.y = y;
            v64.size.width = width;
            v64.size.height = height;
            CGPathAddRect(Mutable, 0, v64);
            objc_msgSend(v7, "setPath:", Mutable);
            if (Mutable)
              CFRelease(Mutable);
            objc_msgSend(v19, "remove");
            --v5;
            LODWORD(v6) = v6 - 1;
          }
        }
      }
LABEL_39:
      v6 = (v6 + 1);
    }
    while (v6 < v5);
  }
}

- (void)addZonesWithBoundaryIn:(id)a3 withBorder:(id)a4
{
  void *v6;
  CPCompoundGraphic *v7;
  CPCompoundGraphic *v8;

  v6 = (void *)objc_msgSend(a3, "newTakeChildrenAmong:", objc_msgSend(a4, "graphicObjects"));
  v7 = [CPCompoundGraphic alloc];
  objc_msgSend(a4, "bounds");
  v8 = -[CPCompoundGraphic initWithGraphicObjects:withRenderedBounds:](v7, "initWithGraphicObjects:withRenderedBounds:", v6);

  -[CPObject recomputeZOrder](v8, "recomputeZOrder");
  objc_msgSend(a3, "add:", v8);

  objc_msgSend(a4, "removeFromArray");
}

- (void)makeZonesWithBoundaryIn:(id)a3
{
  id v3;
  unsigned int v4;
  void *v5;
  void *v6;
  CPZoneBorder *v7;
  CPZoneBorder *v8;
  CPZoneBorder *v9;
  CPZoneBorder *v10;
  uint64_t v11;
  void *v12;
  int v13;
  CPZoneBorder *v14;
  CPZoneBorder *v15;
  void *v16;
  const CGPath *v17;
  const CGPath *v18;
  uint64_t v19;
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
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double *v39;
  uint64_t v40;
  double v41;
  double v42;
  double *v43;
  double v44;
  double v45;
  void *v46;
  CPZoneBorder *v47;
  CPZoneBorderNeighbor *v48;
  void *v49;
  int v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  void *v65;
  int i;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  void *v71;
  int j;
  uint64_t v73;
  uint64_t v74;
  int v75;
  void *v76;
  double v77;
  uint64_t v78;
  int v79;
  void *v80;
  double v81;
  unint64_t v82;
  void *v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  void *v88;
  uint64_t v89;
  int v90;
  void *v91;
  unint64_t v92;
  void *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  __objc2_class **v101;
  id v102;
  unsigned int v103;
  unint64_t v104;
  void *v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  unsigned int v111;
  unsigned int v112;
  uint64_t v113;
  CPZone *v114;
  CPPDFChar *v115;
  id v116;
  _BOOL4 v117;
  BOOL v118;
  void *v119;
  void *v120;
  id v121;
  int v122;
  uint64_t v123;
  void *v124;
  unint64_t v125;
  void *v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  double v131;
  CGFloat v132;
  double v133;
  CGFloat v134;
  double v135;
  uint64_t v136;
  uint64_t v137;
  double v138;
  double v139;
  double v140;
  uint64_t v141;
  uint64_t v142;
  void *v144;
  uint64_t k;
  void *v146;
  CPZone *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t m;
  unsigned int v152;
  void *v153;
  double v154;
  unsigned int v155;
  double v156;
  unsigned int v157;
  double v158;
  CPZone *v159;
  CPZone *v160;
  double v161;
  void *v163;
  void *v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  void *info;
  uint64_t v170;
  id v171;
  _BYTE v172[128];
  _BYTE v173[56];
  __int128 v174;
  __int128 v175;
  uint64_t v176;
  CGRect v177;

  v3 = a3;
  v176 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "count");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  v7 = objc_alloc_init(CPZoneBorder);
  -[CPZoneBorder setSide:ofPage:](v7, "setSide:ofPage:", 1, v3);
  -[CPZoneBorder addToArray:](v7, "addToArray:", v5);

  v8 = objc_alloc_init(CPZoneBorder);
  -[CPZoneBorder setSide:ofPage:](v8, "setSide:ofPage:", 2, v3);
  -[CPZoneBorder addToArray:](v8, "addToArray:", v6);

  v9 = objc_alloc_init(CPZoneBorder);
  -[CPZoneBorder setSide:ofPage:](v9, "setSide:ofPage:", 3, v3);
  -[CPZoneBorder addToArray:](v9, "addToArray:", v5);

  v10 = objc_alloc_init(CPZoneBorder);
  -[CPZoneBorder setSide:ofPage:](v10, "setSide:ofPage:", 4, v3);
  -[CPZoneBorder addToArray:](v10, "addToArray:", v6);

  v163 = v5;
  v153 = v3;
  if (v4)
  {
    v11 = 0;
    v152 = v4;
    do
    {
      v12 = (void *)objc_msgSend(v3, "childAtIndex:", v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "zoneGraphicType");
        switch(v13)
        {
          case 3:
            v17 = (const CGPath *)objc_msgSend(v12, "path");
            v18 = v17;
            v174 = 0u;
            v175 = 0u;
            memset(&v173[8], 0, 48);
            *(_QWORD *)v173 = v12;
            if (v17)
            {
              LODWORD(info) = 0;
              CGPathApply(v17, &info, (CGPathApplierFunction)countElements);
              v19 = info;
            }
            else
            {
              v19 = 0;
            }
            *(_DWORD *)&v173[12] = v19;
            memset(&v173[16], 0, 32);
            *(_QWORD *)&v173[48] = malloc_type_malloc(16 * v19, 0x1000040451B5BE8uLL);
            LODWORD(v174) = 0;
            *((_QWORD *)&v174 + 1) = v5;
            *(_QWORD *)&v175 = v6;
            DWORD2(v175) = objc_msgSend(v5, "count");
            HIDWORD(v175) = objc_msgSend(v6, "count");
            CGPathApply(v18, v173, (CGPathApplierFunction)findLineSegments);
            free(*(void **)&v173[48]);
            objc_msgSend(v164, "addObject:", v12);
            break;
          case 2:
            objc_msgSend(v12, "bounds");
            v21 = v20;
            v23 = v22;
            v158 = v25;
            v161 = v24;
            objc_msgSend(v12, "renderedBounds");
            v27 = v26;
            v29 = v28;
            v31 = v30;
            v33 = v32;
            objc_msgSend(v12, "lineWidth");
            v34 = 0;
            v35 = 0;
            *(double *)v173 = v27;
            *(double *)&v173[8] = v29;
            *(double *)&v173[16] = v27;
            *(double *)&v174 = v29;
            *(double *)&v173[24] = v33 + v29;
            *(double *)&v173[40] = v33 + v29;
            *(double *)&v173[32] = v31 + v27;
            *(double *)&v173[48] = v31 + v27;
            v37 = v36 * 0.5;
            v154 = v21 + v36 * 0.5;
            v156 = v23 + v36 * 0.5;
            v38 = 0.0;
            v39 = (double *)&v173[8];
            do
            {
              v40 = v34 + 1;
              v41 = *(v39 - 1);
              v42 = *v39;
              v43 = (double *)&v173[16 * ((v34 + 1) & 3)];
              v45 = *v43;
              v44 = v43[1];
              switch((int)v34)
              {
                case 0:
                  v38 = fmax(v154 - v41, 0.0);
                  v41 = v41 + v38 * 0.5;
                  v35 = 2;
                  goto LABEL_19;
                case 1:
                  v38 = fmax(v37 + v42 - v23 - v158, 0.0);
                  v42 = v42 + v38 * -0.5;
                  v35 = 3;
                  goto LABEL_21;
                case 2:
                  v38 = fmax(v37 + v41 - v21 - v161, 0.0);
                  v41 = v41 + v38 * -0.5;
                  v35 = 4;
LABEL_19:
                  v45 = v41;
                  break;
                case 3:
                  v38 = fmax(v156 - v42, 0.0);
                  v42 = v42 + v38 * 0.5;
                  v35 = 1;
LABEL_21:
                  v44 = v42;
                  break;
                default:
                  break;
              }
              v46 = (void *)objc_msgSend(v12, "copy");
              objc_msgSend(v46, "makeLineFromVertex:toVertex:", v41, v42, v45, v44);
              objc_msgSend(v46, "setLineWidth:", v38);
              v47 = -[CPZoneBorder initWithGraphicObject:]([CPZoneBorder alloc], "initWithGraphicObject:", v46);

              if (!v47)
                break;
              v48 = objc_alloc_init(CPZoneBorderNeighbor);
              -[CPZoneBorderNeighbor setNeighborShape:](v48, "setNeighborShape:", v12);
              -[CPZoneBorderNeighbor setShapeSide:](v48, "setShapeSide:", v35);
              -[CPZoneBorder addNeighbor:](v47, "addNeighbor:", v48);

              v49 = -[CPZoneBorder isHorizontal](v47, "isHorizontal") ? v163 : v6;
              -[CPZoneBorder addToArray:](v47, "addToArray:", v49);

              v39 += 2;
              v34 = v40;
            }
            while (v40 != 4);
            objc_msgSend(v164, "addObject:", v12);
            v5 = v163;
            v3 = v153;
            v4 = v152;
            break;
          case 1:
            v14 = -[CPZoneBorder initWithGraphicObject:]([CPZoneBorder alloc], "initWithGraphicObject:", v12);
            if (!v14)
              goto LABEL_31;
            v15 = v14;
            if (-[CPZoneBorder isHorizontal](v14, "isHorizontal"))
              v16 = v5;
            else
              v16 = v6;
            -[CPZoneBorder addToArray:](v15, "addToArray:", v16);

            break;
        }
      }
      v11 = (v11 + 1);
    }
    while ((_DWORD)v11 != v4);
  }
LABEL_31:
  objc_msgSend(v5, "sortUsingSelector:", sel_compareYBounds_);
  objc_msgSend(v6, "sortUsingSelector:", sel_compareXBounds_);
  objc_msgSend(v164, "sortUsingSelector:", sel_compareZ_);
  v50 = objc_msgSend(v164, "count");
  if (v50 >= 1)
  {
    v51 = v50 + 1;
    do
    {
      v52 = (void *)objc_msgSend(v164, "objectAtIndex:", (v51 - 2));
      if (objc_msgSend(v52, "isUprightRectangle"))
      {
        v53 = objc_msgSend(v52, "fillColor");
        if (v53)
        {
          v61 = v53 < 0
              ? CGTaggedColorGetAlpha(v53, v54, v55, v56, v57, v58, v59, v60)
              : *(double *)(v53 + 8 * *(_QWORD *)(v53 + 56) + 56);
          if (v61 >= 1.0)
          {
            -[CPZoneMaker cutHorizontalBorders:whereObscuredByShape:](self, "cutHorizontalBorders:whereObscuredByShape:", v5, v52);
            -[CPZoneMaker cutVerticalBorders:whereObscuredByShape:](self, "cutVerticalBorders:whereObscuredByShape:", v6, v52);
          }
        }
      }
      --v51;
    }
    while (v51 > 1);
  }
  -[CPCharSequence map:passing:](self->charactersOnPage, "map:passing:", cutBordersCrossingText, v5);
  -[CPCharSequence map:passing:](self->charactersOnPage, "map:passing:", cutBordersCrossingText, v6);
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v62 = 1;
    v63 = 1;
    do
    {
      v64 = objc_msgSend(v5, "objectAtIndex:", v62);
      if (v63 >= 1)
      {
        v65 = (void *)v64;
        for (i = 0; i < v63; ++i)
        {
          v67 = objc_msgSend(v5, "objectAtIndex:", i);
          if (objc_msgSend(v65, "continues:", v67))
          {
            objc_msgSend(v65, "combine:", v67);
            --i;
            --v63;
          }
        }
      }
      v62 = ++v63;
    }
    while (objc_msgSend(v5, "count") > (unint64_t)v63);
  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v68 = 1;
    v69 = 1;
    do
    {
      v70 = objc_msgSend(v6, "objectAtIndex:", v68);
      if (v69 >= 1)
      {
        v71 = (void *)v70;
        for (j = 0; j < v69; ++j)
        {
          v73 = objc_msgSend(v6, "objectAtIndex:", j);
          if (objc_msgSend(v71, "continues:", v73))
          {
            objc_msgSend(v71, "combine:", v73);
            --j;
            --v69;
          }
        }
      }
      v68 = ++v69;
    }
    while (objc_msgSend(v6, "count") > (unint64_t)v69);
  }
  if (objc_msgSend(v5, "count"))
  {
    v74 = 0;
    v75 = 0;
    do
    {
      v76 = (void *)objc_msgSend(v5, "objectAtIndex:", v74);
      if (objc_msgSend(v76, "graphicObjectCount") > 0x32 || (objc_msgSend(v76, "bounds"), v77 > 25.0))
      {
        -[CPZoneMaker addZonesWithBoundaryIn:withBorder:](self, "addZonesWithBoundaryIn:withBorder:", v153, v76);
        --v75;
      }
      v74 = ++v75;
    }
    while (objc_msgSend(v5, "count") > (unint64_t)v75);
  }
  if (objc_msgSend(v6, "count"))
  {
    v78 = 0;
    v79 = 0;
    do
    {
      v80 = (void *)objc_msgSend(v6, "objectAtIndex:", v78);
      if (objc_msgSend(v80, "graphicObjectCount") > 0x32 || (objc_msgSend(v80, "bounds"), v81 > 25.0))
      {
        -[CPZoneMaker addZonesWithBoundaryIn:withBorder:](self, "addZonesWithBoundaryIn:withBorder:", v153, v80);
        --v79;
      }
      v78 = ++v79;
    }
    while (objc_msgSend(v6, "count") > (unint64_t)v79);
  }
  memset(v173, 0, 32);
  if (objc_msgSend(v5, "count"))
  {
    v82 = 0;
    do
    {
      v83 = (void *)objc_msgSend(v5, "objectAtIndex:", v82);
      if (objc_msgSend(v6, "count"))
      {
        v84 = 0;
        do
        {
          v85 = objc_msgSend(v6, "objectAtIndex:", v84);
          if (objc_msgSend(v83, "intersectsWith:atRect:", v85, v173))
            +[CPZoneBorder addIntersectionBetweenBorder:andBorder:atRect:](CPZoneBorder, "addIntersectionBetweenBorder:andBorder:atRect:", v83, v85, *(_OWORD *)v173, *(double *)&v173[16], *(double *)&v173[24]);
          ++v84;
        }
        while (objc_msgSend(v6, "count") > v84);
      }
      ++v82;
    }
    while (objc_msgSend(v5, "count") > v82);
  }
  if (objc_msgSend(v5, "count"))
  {
    v86 = 0;
    v87 = 0;
    do
    {
      v88 = (void *)objc_msgSend(v5, "objectAtIndex:", v86);
      if (objc_msgSend(v88, "intersectionCount") <= 1)
      {
        if (objc_msgSend(v88, "intersectionCount") == 1)
        {
          objc_msgSend(v88, "removeLooseThreadsStartingFrom:", 0);
          v87 = objc_msgSend(v5, "indexOfObject:", v88);
        }
        objc_msgSend(v88, "removeFromArray");
        --v87;
      }
      v86 = ++v87;
    }
    while (objc_msgSend(v5, "count") > (unint64_t)v87);
  }
  if (objc_msgSend(v6, "count"))
  {
    v89 = 0;
    v90 = 0;
    do
    {
      v91 = (void *)objc_msgSend(v6, "objectAtIndex:", v89);
      if (objc_msgSend(v91, "intersectionCount") <= 1)
      {
        if (objc_msgSend(v91, "intersectionCount") == 1)
        {
          objc_msgSend(v91, "removeLooseThreadsStartingFrom:", 0);
          v90 = objc_msgSend(v6, "indexOfObject:", v91);
        }
        objc_msgSend(v91, "removeFromArray");
        --v90;
      }
      v89 = ++v90;
    }
    while (objc_msgSend(v6, "count") > (unint64_t)v90);
  }
  if (objc_msgSend(v5, "count"))
  {
    v92 = 0;
    do
    {
      v93 = (void *)objc_msgSend(v5, "objectAtIndex:", v92);
      objc_msgSend(v93, "trimToLastIntersections");
      objc_msgSend(v93, "instantiateVectors");
      ++v92;
    }
    while (objc_msgSend(v5, "count") > v92);
  }
  if (objc_msgSend(v6, "count"))
  {
    v94 = 0;
    do
    {
      v95 = (void *)objc_msgSend(v6, "objectAtIndex:", v94);
      objc_msgSend(v95, "trimToLastIntersections");
      objc_msgSend(v95, "instantiateVectors");
      ++v94;
    }
    while (objc_msgSend(v6, "count") > v94);
  }
  v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  while (objc_msgSend(v6, "count"))
  {
    LODWORD(info) = 0;
    v97 = objc_msgSend(v6, "count");
    if (!v97)
      break;
    v98 = 0;
    while (1)
    {
      v99 = (void *)objc_msgSend(v6, "objectAtIndex:", v98);
      if (objc_msgSend(v99, "hasVectorGoingForward:startingAtIndex:", 1, &info))
        break;
      if (v97 == ++v98)
        goto LABEL_109;
    }
    v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    if (objc_msgSend(v99, "extractCycleTo:goingForward:startingAtIndex:", v100, 1, info))
    {
      if (+[CPZoneBorder clockwiseWindingNumberOfShapeWithBorders:](CPZoneBorder, "clockwiseWindingNumberOfShapeWithBorders:", v100) <= 0)v101 = &off_1E1620728;
      else
        v101 = off_1E1620720;
      v102 = objc_alloc_init(*v101);
      objc_msgSend(v102, "setPage:", v153);
      objc_msgSend(v102, "setShrinksWithChildren:", 0);
      objc_msgSend(v102, "setZoneBorders:", v100);
      objc_msgSend(v96, "addObject:", v102);

    }
  }
LABEL_109:
  objc_msgSend(v96, "sortUsingSelector:", sel_compareArea_);
  v103 = objc_msgSend(v96, "count");
  v104 = v103;
  v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v103);
  if (v103)
  {
    v106 = 0;
    v107 = 1;
    do
    {
      v108 = objc_msgSend(v96, "objectAtIndex:", v106++);
      v109 = v107;
      if (v106 >= v104)
      {
LABEL_114:
        objc_msgSend(v105, "addObject:", v108);
      }
      else
      {
        while (1)
        {
          v110 = (void *)objc_msgSend(v96, "objectAtIndex:", v109);
          if (objc_msgSend(v110, "contains:", v108))
            break;
          if (v103 == (_DWORD)++v109)
            goto LABEL_114;
        }
        objc_msgSend(v110, "add:", v108);
      }
      ++v107;
      v104 = v103;
    }
    while (v106 != v103);
  }
  v171 = 0;
  v111 = -[CPCharSequence length](self->charactersOnPage, "length");
  if (v111)
  {
    v112 = v111;
    v113 = 0;
    v114 = 0;
    v155 = v111;
    do
    {
      while (1)
      {
        v115 = -[CPCharSequence charAtIndex:](self->charactersOnPage, "charAtIndex:", v113);
        findZone(&v115->var0.var0.origin.x, v105, &v171);
        v116 = v171;
        if (v171)
          break;
LABEL_122:
        v171 = 0;
        if (!v114)
        {
          v114 = objc_alloc_init(CPZone);
          -[CPObject setPage:](v114, "setPage:", v153);
          -[CPZone setIsStraddleZone:](v114, "setIsStraddleZone:", 1);
          -[CPChunk setShrinksWithChildren:](v114, "setShrinksWithChildren:", 0);
        }
        -[CPZone addPDFChar:](v114, "addPDFChar:", v115);
        v113 = (v113 + 1);
        if (v113 >= v112)
          goto LABEL_135;
      }
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v116 = (id)objc_msgSend(v116, "parent");
        if (!v116)
          goto LABEL_122;
      }
      v159 = v114;
      info = v116;
      v170 = v113;
      LODWORD(v114) = v112 - v113;
      v117 = -[CPCharSequence mapWithIndex:from:length:passing:](self->charactersOnPage, "mapWithIndex:from:length:passing:", continueZone, (v113 + 1), v112 - v113 - 1, &info);
      v118 = v117;
      if (v117)
        v114 = (CPZone *)v114;
      else
        v114 = (CPZone *)(v170 - v113);
      v119 = (void *)objc_msgSend(v116, "charactersInZone");
      if (v119)
      {
        v120 = v119;
        v157 = objc_msgSend(v119, "length");
        -[CPCharSequence copyToSubsequence:from:length:](self->charactersOnPage, "copyToSubsequence:from:length:", v120, v113, v114);
        objc_msgSend(v116, "updatedCharSequenceFrom:length:", v157, v114);
      }
      else
      {
        v121 = -[CPCharSequence newSubsequenceFrom:length:](self->charactersOnPage, "newSubsequenceFrom:length:", v113, v114);
        objc_msgSend(v116, "setCharactersInZone:", v121);

      }
      v171 = info;
      v113 = v170;
      v114 = v159;
      v112 = v155;
    }
    while (!v118);
  }
  else
  {
    v114 = 0;
  }
LABEL_135:
  v160 = v114;
  v122 = objc_msgSend(v164, "count");
  if (v122 >= 1)
  {
    v123 = v122;
    do
    {
      v124 = (void *)objc_msgSend(v164, "objectAtIndex:", (v123 - 1));
      if (objc_msgSend(v96, "count"))
      {
        v125 = 0;
        do
        {
          v126 = (void *)objc_msgSend(v96, "objectAtIndex:", v125);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (objc_msgSend(v126, "hasNeighborShape:", v124))
            {
              objc_msgSend(v126, "swollenZoneBounds");
              v128 = v127;
              v130 = v129;
              v132 = v131;
              v134 = v133;
              objc_msgSend(v124, "bounds");
              v139 = v138;
              if (v138 != INFINITY)
              {
                v140 = v135;
                if (v135 != INFINITY)
                {
                  v141 = v136;
                  v142 = v137;
                  v177.origin.x = v128;
                  v177.origin.y = v130;
                  v177.size.width = v132;
                  v177.size.height = v134;
                  if (CGRectContainsRect(v177, *(CGRect *)&v139))
                    objc_msgSend(v126, "add:", v124);
                }
              }
            }
          }
          ++v125;
        }
        while (objc_msgSend(v96, "count") > v125);
      }
    }
    while (v123-- >= 2);
  }
  v144 = (void *)objc_msgSend(v153, "newTakeChildren");
  if (v103)
  {
    for (k = 0; k != v103; ++k)
    {
      v146 = (void *)objc_msgSend(v96, "objectAtIndex:", k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v146, "addContentFrom:", v144);
    }
  }
  v147 = v160;
  if (v160)
  {
    -[CPZoneMaker addObjectsToStraddler:from:](self, "addObjectsToStraddler:from:", v160, v144);
  }
  else
  {
    v147 = -[CPZoneMaker newZoneForStraddlersFrom:](self, "newZoneForStraddlersFrom:", v144);
    if (!v147)
      goto LABEL_157;
  }
  objc_msgSend(v105, "addObject:", v147);

LABEL_157:
  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v148 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v165, v172, 16);
  if (v148)
  {
    v149 = v148;
    v150 = *(_QWORD *)v166;
    do
    {
      for (m = 0; m != v149; ++m)
      {
        if (*(_QWORD *)v166 != v150)
          objc_enumerationMutation(v105);
        -[CPZoneMaker splitByRotatation:inPage:](self, "splitByRotatation:inPage:", *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * m), v153);
      }
      v149 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v165, v172, 16);
    }
    while (v149);
  }
  objc_msgSend(v153, "addChildren:", v144);
  objc_msgSend(v153, "addChildren:", v105);

}

- (void)splitByRotatation:(id)a3 inPage:(id)a4
{
  int v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  CPZone *v16;
  double v17;
  double v18;
  __double2 v19;
  int v20;
  int v21;
  uint64_t v22;
  double v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __double2 v31;
  int v32;
  int v33;
  uint64_t v34;
  double v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  double v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "count");
  v7 = (void *)objc_msgSend(a3, "charactersInZone");
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend(v7, "length"))
    {
      v43 = v6;
      objc_msgSend(v8, "sortBy:", compareByRotation);
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = *(double *)(objc_msgSend(v8, "charAtIndex:", 0) + 168);
      if (v10 > 350.0)
        v10 = v10 + -360.0;
      v49 = v10;
      objc_msgSend(v8, "splitToSubsequences:whereTrue:passing:", v9, splitRotationZonesCondition, &v49);
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
      {
        objc_msgSend(v8, "averageRotation");
        v30 = v29;
        objc_msgSend(a3, "setRotationAngle:");
        v31 = __sincos_stret(v30);
        v32 = objc_msgSend(v8, "length");
        if (v32 >= 1)
        {
          v33 = v32;
          v34 = 0;
          v35 = -v31.__sinval;
          do
          {
            v36 = (double *)objc_msgSend(v8, "charAtIndex:", v34);
            v37 = v36[12];
            v38 = v36[13];
            v36[12] = v38 * v31.__sinval + v31.__cosval * v37 + 0.0;
            v36[13] = v38 * v31.__cosval + v35 * v37 + 0.0;
            v39 = v36[14];
            v40 = v36[15];
            v36[14] = v31.__sinval * v40 + v31.__cosval * v39 + 0.0;
            v36[15] = v31.__cosval * v40 + v35 * v39 + 0.0;
            v34 = (v34 + 1);
          }
          while (v33 != (_DWORD)v34);
        }
      }
      else
      {
        objc_msgSend(a3, "setCharactersInZone:", 0);
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v46 != v13)
                objc_enumerationMutation(v9);
              v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              v16 = objc_alloc_init(CPZone);
              -[CPObject setPage:](v16, "setPage:", a4);
              -[CPChunk setShrinksWithChildren:](v16, "setShrinksWithChildren:", 0);
              -[CPZone setCharactersInZone:](v16, "setCharactersInZone:", v15);
              objc_msgSend(v15, "averageRotation");
              v18 = v17;
              -[CPZone setRotationAngle:](v16, "setRotationAngle:");
              v19 = __sincos_stret(v18);
              v20 = objc_msgSend(v15, "length");
              if (v20 >= 1)
              {
                v21 = v20;
                v22 = 0;
                v23 = -v19.__sinval;
                do
                {
                  v24 = (double *)objc_msgSend(v15, "charAtIndex:", v22);
                  v25 = v24[12];
                  v26 = v24[13];
                  v24[12] = v26 * v19.__sinval + v19.__cosval * v25 + 0.0;
                  v24[13] = v26 * v19.__cosval + v23 * v25 + 0.0;
                  v27 = v24[14];
                  v28 = v24[15];
                  v24[14] = v19.__sinval * v28 + v19.__cosval * v27 + 0.0;
                  v24[15] = v19.__cosval * v28 + v23 * v27 + 0.0;
                  v22 = (v22 + 1);
                }
                while (v21 != (_DWORD)v22);
              }
              objc_msgSend(a3, "add:", v16);

            }
            v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v12);
        }
      }

      v6 = v43;
    }
  }
  if (v6 >= 1)
  {
    v41 = 0;
    do
    {
      v42 = objc_msgSend(a3, "childAtIndex:", v41);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[CPZoneMaker splitByRotatation:inPage:](self, "splitByRotatation:inPage:", v42, a4);
      v41 = (v41 + 1);
    }
    while (v6 != (_DWORD)v41);
  }
}

- (void)cutHorizontalBorders:(id)a3 whereObscuredByShape:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  _BOOL4 v14;
  void *v15;
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
  _BOOL4 v27;
  double y;
  double height;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  objc_msgSend(a4, "renderedBounds");
  v41 = v7;
  v42 = v6;
  v43 = v9;
  v44 = v8;
  v10 = objc_msgSend(a4, "zOrder");
  if (objc_msgSend(a3, "count"))
  {
    v11 = 0;
    v12 = 0;
    v13 = v43;
    v14 = v43 < 0.0 || v41 < 0.0;
    do
    {
      v15 = (void *)objc_msgSend(a3, "objectAtIndex:", v11, v13);
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v43;
      v24 = v44;
      if (v14)
      {
        v45.size.width = v41;
        v45.origin.x = v42;
        v45.size.height = v43;
        v45.origin.y = v44;
        *(CGRect *)(&v24 - 1) = CGRectStandardize(v45);
      }
      v26 = v24 + v25;
      v27 = v23 < 0.0 || v21 < 0.0;
      if (v27)
      {
        v46.origin.x = v17;
        v46.origin.y = v19;
        v46.size.width = v21;
        v46.size.height = v23;
        v47 = CGRectStandardize(v46);
        if (v47.origin.y >= v26)
          return;
        v48.origin.x = v17;
        v48.origin.y = v19;
        v48.size.width = v21;
        v48.size.height = v23;
        v49 = CGRectStandardize(v48);
        y = v49.origin.y;
        height = v49.size.height;
      }
      else
      {
        y = v19;
        height = v23;
        if (v19 >= v26)
          return;
      }
      v30 = v44;
      if (v14)
      {
        v50.size.width = v41;
        v50.origin.x = v42;
        v50.size.height = v43;
        v50.origin.y = v44;
        v51 = CGRectStandardize(v50);
        v30 = v51.origin.y;
      }
      v31 = v19;
      if (v27)
      {
        v52.origin.x = v17;
        v52.origin.y = v19;
        v52.size.width = v21;
        v52.size.height = v23;
        *(CGRect *)(&v31 - 1) = CGRectStandardize(v52);
      }
      if (v30 >= v31 || v26 <= y + height || v10 <= objc_msgSend(v15, "zOrder"))
        goto LABEL_38;
      v33 = v41;
      v32 = v42;
      if (v14)
      {
        v53.size.width = v41;
        v53.origin.x = v42;
        v53.size.height = v43;
        v53.origin.y = v44;
        *(CGRect *)&v32 = CGRectStandardize(v53);
      }
      v34 = v32 + v33;
      if (v27)
      {
        v54.origin.x = v17;
        v54.origin.y = v19;
        v54.size.width = v21;
        v54.size.height = v23;
        v55 = CGRectStandardize(v54);
        v35 = v55.origin.x + v55.size.width;
        v55.origin.x = v17;
        v55.origin.y = v19;
        v55.size.width = v21;
        v55.size.height = v23;
        if (v42 > COERCE_DOUBLE(CGRectStandardize(v55)))
          goto LABEL_27;
        v56.origin.x = v17;
        v56.origin.y = v19;
        v56.size.width = v21;
        v56.size.height = v23;
        *(_QWORD *)&v17 = (unint64_t)CGRectStandardize(v56);
      }
      else
      {
        v35 = v17 + v21;
        if (v42 > v17)
        {
LABEL_27:
          v36 = v42;
          if (v14)
          {
            v57.size.width = v41;
            v57.origin.x = v42;
            v57.size.height = v43;
            v57.origin.y = v44;
            *(_QWORD *)&v36 = (unint64_t)CGRectStandardize(v57);
          }
          if (v36 >= v35)
            goto LABEL_38;
          if (v34 < v35)
          {
            v37 = (void *)objc_msgSend(v15, "copy");
            objc_msgSend(v37, "setBounds:", v34, v19, v35 - v34, v23);
            v12 = (v12 + 1);
            objc_msgSend(v37, "addToArray:atIndex:", a3, v12);

          }
          v38 = v42 - v17;
          v39 = v15;
          v40 = v17;
LABEL_36:
          objc_msgSend(v39, "setBounds:", v40, v19, v38, v23);
          goto LABEL_38;
        }
      }
      if (v34 > v17)
      {
        if (v34 >= v35)
        {
          objc_msgSend(v15, "removeFromArrayAtIndex:", v12);
          LODWORD(v12) = v12 - 1;
          goto LABEL_38;
        }
        v38 = v35 - v34;
        v39 = v15;
        v40 = v34;
        goto LABEL_36;
      }
LABEL_38:
      v12 = (v12 + 1);
      v11 = (int)v12;
    }
    while (objc_msgSend(a3, "count") > (unint64_t)(int)v12);
  }
}

- (void)cutVerticalBorders:(id)a3 whereObscuredByShape:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  _BOOL4 v14;
  void *v15;
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
  _BOOL4 v27;
  double x;
  double width;
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
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  objc_msgSend(a4, "renderedBounds");
  v56 = v7;
  v57 = v6;
  v54 = v9;
  v55 = v8;
  v10 = objc_msgSend(a4, "zOrder");
  if (objc_msgSend(a3, "count"))
  {
    v11 = 0;
    v12 = 0;
    v13 = v54;
    v14 = v54 < 0.0 || v56 < 0.0;
    do
    {
      v15 = (void *)objc_msgSend(a3, "objectAtIndex:", v11, v13);
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v56;
      v24 = v57;
      if (v14)
      {
        v58.size.width = v56;
        v58.origin.x = v57;
        v58.size.height = v54;
        v58.origin.y = v55;
        *(CGRect *)&v24 = CGRectStandardize(v58);
      }
      v26 = v24 + v25;
      v27 = v23 < 0.0 || v21 < 0.0;
      if (v27)
      {
        v59.origin.x = v17;
        v59.origin.y = v19;
        v59.size.width = v21;
        v59.size.height = v23;
        if (COERCE_DOUBLE(CGRectStandardize(v59)) >= v26)
          return;
        v60.origin.x = v17;
        v60.origin.y = v19;
        v60.size.width = v21;
        v60.size.height = v23;
        v61 = CGRectStandardize(v60);
        x = v61.origin.x;
        width = v61.size.width;
      }
      else
      {
        x = v17;
        width = v21;
        if (v17 >= v26)
          return;
      }
      v30 = v57;
      if (v14)
      {
        v62.size.width = v56;
        v62.origin.x = v57;
        v62.size.height = v54;
        v62.origin.y = v55;
        *(_QWORD *)&v30 = (unint64_t)CGRectStandardize(v62);
      }
      v31 = v17;
      if (v27)
      {
        v63.origin.x = v17;
        v63.origin.y = v19;
        v63.size.width = v21;
        v63.size.height = v23;
        *(_QWORD *)&v31 = (unint64_t)CGRectStandardize(v63);
      }
      if (v30 >= v31 || v26 <= x + width || v10 <= objc_msgSend(v15, "zOrder"))
        goto LABEL_42;
      v34 = v54;
      v33 = v55;
      if (v14)
      {
        v64.size.width = v56;
        v64.origin.x = v57;
        v64.size.height = v54;
        v64.origin.y = v55;
        *(CGRect *)&v32 = CGRectStandardize(v64);
        v34 = v35;
      }
      v36 = v19;
      v37 = v23;
      if (v27)
      {
        v65.origin.x = v17;
        v38 = v33;
        v65.origin.y = v19;
        v65.size.width = v21;
        v65.size.height = v23;
        *(CGRect *)&v32 = CGRectStandardize(v65);
        v36 = v39;
        v33 = v38;
        v37 = v40;
      }
      v41 = v55;
      if (v14)
      {
        v66.size.width = v56;
        v66.origin.x = v57;
        v53 = v33;
        v66.size.height = v54;
        v66.origin.y = v55;
        *(CGRect *)&v32 = CGRectStandardize(v66);
        v41 = v42;
        v33 = v53;
      }
      v43 = v33 + v34;
      v44 = v36 + v37;
      if (v27)
      {
        v67.origin.x = v17;
        v67.origin.y = v19;
        v67.size.width = v21;
        v67.size.height = v23;
        *(CGRect *)&v32 = CGRectStandardize(v67);
        if (v41 > v45)
          goto LABEL_31;
        v68.origin.x = v17;
        v68.origin.y = v19;
        v68.size.width = v21;
        v68.size.height = v23;
        *(CGRect *)&v32 = CGRectStandardize(v68);
        v19 = v46;
      }
      else if (v41 > v19)
      {
LABEL_31:
        v47 = v55;
        if (v14)
        {
          v69.size.width = v56;
          v69.origin.x = v57;
          v69.size.height = v54;
          v69.origin.y = v55;
          *(CGRect *)&v32 = CGRectStandardize(v69);
        }
        if (v47 >= v44)
          goto LABEL_42;
        if (v43 < v44)
        {
          v48 = (void *)objc_msgSend(v15, "copy", v32);
          objc_msgSend(v48, "setBounds:", v17, v43, v21, v44 - v43);
          v12 = (v12 + 1);
          objc_msgSend(v48, "addToArray:atIndex:", a3, v12);

        }
        v49 = v55 - v19;
        v50 = v15;
        v51 = v17;
        v52 = v19;
LABEL_40:
        objc_msgSend(v50, "setBounds:", v51, v52, v21, v49);
        goto LABEL_42;
      }
      if (v43 > v19)
      {
        if (v43 >= v44)
        {
          objc_msgSend(v15, "removeFromArrayAtIndex:", v12, v32);
          LODWORD(v12) = v12 - 1;
          goto LABEL_42;
        }
        v49 = v44 - v43;
        v50 = v15;
        v51 = v17;
        v52 = v43;
        goto LABEL_40;
      }
LABEL_42:
      v12 = (v12 + 1);
      v11 = (int)v12;
    }
    while (objc_msgSend(a3, "count") > (unint64_t)(int)v12);
  }
}

- (void)addObjectsToStraddler:(id)a3 from:(id)a4
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend(a4, "count");
  if (v6)
  {
    v7 = v6 - 1;
    do
    {
      v8 = v7;
      v9 = objc_msgSend(a4, "objectAtIndex:", v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(a3, "add:", v9);
          objc_msgSend(a4, "removeObjectAtIndex:", v7);
        }
      }
      --v7;
    }
    while (v8);
  }
}

- (id)newZoneForStraddlersFrom:(id)a3
{
  CPZone *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = 0;
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5 - 1;
    do
    {
      v7 = v6;
      v8 = objc_msgSend(a3, "objectAtIndex:", v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v4)
          {
            v4 = objc_alloc_init(CPZone);
            -[CPChunk setShrinksWithChildren:](v4, "setShrinksWithChildren:", 0);
            -[CPZone setIsStraddleZone:](v4, "setIsStraddleZone:", 1);
          }
          -[CPChunk add:](v4, "add:", v8);
          objc_msgSend(a3, "removeObjectAtIndex:", v6);
        }
      }
      --v6;
    }
    while (v7);
  }
  return v4;
}

@end
