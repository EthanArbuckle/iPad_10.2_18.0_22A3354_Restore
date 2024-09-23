@implementation VCPImagePetsKeypointsAnalyzer

- (VCPImagePetsKeypointsAnalyzer)initWithMaxNumRegions:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  VCPImagePetsKeypointsAnalyzer *v8;
  VCPImagePetsKeypointsAnalyzer *v9;
  int v10;
  uint64_t v11;
  VCPCNNPetsDetectorV2 *petsDetector;
  VCPCNNPetsKeypointsDetector *v13;
  VCPCNNPetsKeypointsDetector *petsKeypointsDetector;
  uint64_t v15;
  NSMutableArray *results;
  void *v17;
  VCPImagePetsKeypointsAnalyzer *v18;
  objc_super v20;

  v5 = a5;
  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VCPImagePetsKeypointsAnalyzer;
  v8 = -[VCPImagePetsKeypointsAnalyzer init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3 >= 6)
      v10 = 6;
    else
      v10 = a3;
    if (v10 <= 1)
      v10 = 1;
    v8->_maxNumRegions = v10;
    +[VCPCNNPetsDetectorV2 detector:forceCPU:sharedModel:revision:](VCPCNNPetsDetectorV2, "detector:forceCPU:sharedModel:revision:", 6, 0, 0, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    petsDetector = v9->_petsDetector;
    v9->_petsDetector = (VCPCNNPetsDetectorV2 *)v11;

    v13 = -[VCPCNNPetsKeypointsDetector initWithForceCPU:sharedModel:]([VCPCNNPetsKeypointsDetector alloc], "initWithForceCPU:sharedModel:", v6, v5);
    petsKeypointsDetector = v9->_petsKeypointsDetector;
    v9->_petsKeypointsDetector = v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    results = v9->_results;
    v9->_results = (NSMutableArray *)v15;

    v9->_inputWidth = 580;
    v9->_inputHeight = 580;
    v17 = v9->_petsDetector;
    if (v17)
    {
      if (v9->_petsKeypointsDetector)
        v17 = v9;
      else
        v17 = 0;
    }
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result;

  result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      result = 0;
      *a3 = self->_inputWidth;
      *a4 = self->_inputHeight;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 petsDetections:(id)a5 results:(id *)a6 cancel:(id)a7
{
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  double x;
  double y;
  double width;
  double v18;
  double height;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  int v33;
  int v34;
  VCPBoundingBox *v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  VCPBoundingBox *v41;
  int v42;
  int v43;
  float v44;
  float v45;
  int v46;
  int v47;
  double v48;
  float v49;
  float v50;
  float v51;
  float v52;
  double v53;
  double v54;
  double v55;
  float v56;
  double v57;
  double v58;
  int v59;
  int v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  uint64_t v69;
  float v70;
  float v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  void *v75;
  float v76;
  float v77;
  void *v78;
  float v79;
  float v80;
  void *v81;
  int v82;
  int v83;
  float v84;
  float v85;
  float v86;
  float v87;
  double v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSMutableArray *results;
  NSMutableArray *v99;
  id *v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  CGFloat v110;
  CGFloat v111;
  void *v113;
  NSString *v115;
  int v116;
  id obj;
  id obja;
  id objb;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  CGAffineTransform v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  const __CFString *v137;
  NSMutableArray *v138;
  const __CFString *v139;
  void *v140;
  _QWORD v141[3];
  _BYTE v142[128];
  _BYTE v143[128];
  _QWORD v144[2];
  _QWORD v145[2];
  _BYTE v146[128];
  uint64_t v147;
  NSRect v148;
  CGRect v149;
  NSRect v150;
  NSRect v151;
  NSRect v152;

  v101 = a6;
  v147 = *MEMORY[0x1E0C80C00];
  v104 = a5;
  v102 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
  if (objc_msgSend(v104, "count"))
  {
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    obj = v104;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
    if (v8)
    {
      v121 = *(_QWORD *)v134;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v134 != v121)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"), v101);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("petsBounds"));
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("petsConfidence"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v148 = NSRectFromString(v12);
          v132.a = 1.0;
          v132.b = 0.0;
          v132.c = 0.0;
          *(_OWORD *)&v132.d = xmmword_1B6FBCA30;
          v132.ty = 1.0;
          v149 = CGRectApplyAffineTransform(v148, &v132);
          v144[0] = CFSTR("petsBounds");
          if (v149.origin.x < 1.0)
            x = v149.origin.x;
          else
            x = 1.0;
          if (v149.origin.x <= 0.0)
            x = 0.0;
          if (v149.origin.y < 1.0)
            y = v149.origin.y;
          else
            y = 1.0;
          if (v149.origin.y <= 0.0)
            y = 0.0;
          width = 1.0 - v149.origin.x;
          if (v149.size.width < width)
            width = v149.size.width;
          if (v149.size.width <= 0.0)
            v18 = 0.0;
          else
            v18 = width;
          height = 1.0 - v149.origin.y;
          if (v149.size.height < 1.0 - v149.origin.y)
            height = v149.size.height;
          if (v149.size.height <= 0.0)
            v20 = 0.0;
          else
            v20 = height;
          v21 = x;
          v22 = y;
          NSStringFromRect(*(NSRect *)(&v18 - 2));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v144[1] = CFSTR("petsConfidence");
          v145[0] = v23;
          v145[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "addObject:", v24);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
      }
      while (v8);
    }

  }
  else
  {
    v116 = -[VCPCNNPetsDetectorV2 petsDetection:petsRegions:petsFaceRegions:cancel:](self->_petsDetector, "petsDetection:petsRegions:petsFaceRegions:cancel:", a3, v123, v103, v102);
    if (v116)
      goto LABEL_77;
  }
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v105 = v123;
  v25 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v128, v143, 16);
  if (v25)
  {
    v116 = 0;
    v107 = *(_QWORD *)v129;
    while (2)
    {
      v26 = 0;
      v106 = v25;
      do
      {
        if (*(_QWORD *)v129 != v107)
          objc_enumerationMutation(v105);
        v27 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v26);
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("petsBounds"), v101);
        v115 = (NSString *)objc_claimAutoreleasedReturnValue();
        v150 = NSRectFromString(v115);
        v110 = v150.size.width;
        v111 = v150.origin.x;
        v108 = v150.origin.y;
        v109 = v150.size.height;
        v151 = NSRectFromString(v115);
        v28 = v151.origin.x;
        v29 = v151.origin.y;
        v30 = v151.size.width;
        v31 = v151.size.height;
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("petsConfidence"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "floatValue");
        v34 = v33;

        v35 = [VCPBoundingBox alloc];
        *(float *)&v36 = v28;
        *(float *)&v37 = v29;
        v38 = v30 * 1.10000002;
        *(float *)&v38 = v30 * 1.10000002;
        v39 = v31 * 1.10000002;
        *(float *)&v39 = v31 * 1.10000002;
        LODWORD(v40) = v34;
        v41 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v35, "initWithXYAndSize:y:width:height:confidence:", v36, v37, v38, v39, v40);
        -[VCPBoundingBox maxX](v41, "maxX");
        LODWORD(v31) = v42;
        -[VCPBoundingBox minX](v41, "minX");
        LODWORD(v28) = v43;
        -[VCPBoundingBox maxY](v41, "maxY");
        v45 = v44;
        -[VCPBoundingBox minY](v41, "minY");
        LODWORD(v29) = v46;
        -[VCPBoundingBox minX](v41, "minX");
        LODWORD(v30) = v47;
        -[VCPBoundingBox minY](v41, "minY");
        v49 = (float)(*(float *)&v31 - *(float *)&v28) * 0.5;
        v50 = (float)(v45 - *(float *)&v29) * 0.5;
        v51 = v49 + *(float *)&v30;
        v52 = v50 + *(float *)&v48;
        if (v49 <= v50)
        {
          *(float *)&v48 = v51 - v50;
          if ((float)(v51 - v50) < 0.0)
            *(float *)&v48 = 0.0;
          -[VCPBoundingBox setMinX:](v41, "setMinX:", v48);
          *(float *)&v57 = v50 + v51;
          if ((float)(v50 + v51) > 1.0)
            *(float *)&v57 = 1.0;
          -[VCPBoundingBox setMaxX:](v41, "setMaxX:", v57);
          *(float *)&v58 = v52 - v50;
          if ((float)(v52 - v50) < 0.0)
            *(float *)&v58 = 0.0;
          -[VCPBoundingBox setMinY:](v41, "setMinY:", v58);
          *(float *)&v55 = v50 + v52;
          v56 = 1.0;
          if ((float)(v50 + v52) > 1.0)
            *(float *)&v55 = 1.0;
        }
        else
        {
          *(float *)&v48 = v51 - v49;
          if ((float)(v51 - v49) < 0.0)
            *(float *)&v48 = 0.0;
          -[VCPBoundingBox setMinX:](v41, "setMinX:", v48);
          *(float *)&v53 = v49 + v51;
          if ((float)(v49 + v51) > 1.0)
            *(float *)&v53 = 1.0;
          -[VCPBoundingBox setMaxX:](v41, "setMaxX:", v53);
          *(float *)&v54 = v52 - v49;
          if ((float)(v52 - v49) < 0.0)
            *(float *)&v54 = 0.0;
          -[VCPBoundingBox setMinY:](v41, "setMinY:", v54);
          *(float *)&v55 = v49 + v52;
          v56 = 1.0;
          if ((float)(v49 + v52) > 1.0)
            *(float *)&v55 = 1.0;
        }
        -[VCPBoundingBox setMaxY:](v41, "setMaxY:", v55);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = -[VCPCNNPetsKeypointsDetector analyzeFrame:withBox:keypoints:](self->_petsKeypointsDetector, "analyzeFrame:withBox:keypoints:", a3, v41);
        if (v59)
        {
          v60 = 1;
          v116 = v59;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPBoundingBox maxX](v41, "maxX");
          v62 = v61;
          -[VCPBoundingBox minX](v41, "minX");
          v64 = v63;
          -[VCPBoundingBox maxY](v41, "maxY");
          v66 = v65;
          -[VCPBoundingBox minY](v41, "minY");
          v68 = v67;
          if (objc_msgSend(v120, "count") == 25)
          {
            v126 = 0u;
            v127 = 0u;
            v124 = 0u;
            v125 = 0u;
            obja = v120;
            v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v124, v142, 16);
            if (v69)
            {
              v70 = v62 - v64;
              v71 = v66 - v68;
              v72 = *(_QWORD *)v125;
              while (2)
              {
                for (j = 0; j != v69; ++j)
                {
                  if (*(_QWORD *)v125 != v72)
                    objc_enumerationMutation(obja);
                  v74 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
                  if (objc_msgSend(v74, "count") != 3)
                  {
                    v116 = -18;
                    v60 = 1;

                    goto LABEL_67;
                  }
                  objc_msgSend(v74, "objectAtIndexedSubscript:", 0);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "floatValue");
                  v77 = v76;

                  objc_msgSend(v74, "objectAtIndexedSubscript:", 1);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "floatValue");
                  v80 = v79;

                  objc_msgSend(v74, "objectAtIndexedSubscript:", 2);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "floatValue");
                  v83 = v82;

                  -[VCPBoundingBox minX](v41, "minX");
                  v85 = v84;
                  -[VCPBoundingBox minY](v41, "minY");
                  v87 = v86;
                  *(float *)&v88 = v85 + (float)((float)(v77 / 288.0) * v70);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v88);
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  *(float *)&v90 = v56 - (float)(v87 + (float)((float)(v80 / 288.0) * v71));
                  v141[0] = v89;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v90);
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  v141[1] = v91;
                  LODWORD(v92) = v83;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v92);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  v141[2] = v93;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 3);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v122, "addObject:", v94);

                }
                v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v124, v142, 16);
                if (v69)
                  continue;
                break;
              }
            }

            objc_msgSend(v113, "setObject:forKeyedSubscript:", v122, CFSTR("petsKeypoints"));
            v152.size.height = v109;
            v152.origin.y = 1.0 - v108 - v109;
            v152.size.width = v110;
            v152.origin.x = v111;
            NSStringFromRect(v152);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "setObject:forKeyedSubscript:", v95, CFSTR("petsBounds"));

            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("petsConfidence"));
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "setObject:forKeyedSubscript:", v96, CFSTR("petsConfidence"));

            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("petsType"));
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "setObject:forKeyedSubscript:", v97, CFSTR("petsType"));

            results = self->_results;
            v139 = CFSTR("attributes");
            v140 = v113;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
            objb = (id)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](results, "addObject:");
            v60 = 0;

          }
          else
          {
            v116 = -18;
            v60 = 1;
          }
LABEL_67:

        }
        if (v60)
        {

          goto LABEL_77;
        }
        ++v26;
      }
      while (v26 != v106);
      v25 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v128, v143, 16);
      if (v25)
        continue;
      break;
    }
  }

  v99 = self->_results;
  if (v99)
  {
    v137 = CFSTR("PetsKeypointsResults");
    v138 = v99;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
    v116 = 0;
    *v101 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v116 = 0;
  }
LABEL_77:

  return v116;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  return -[VCPImagePetsKeypointsAnalyzer analyzePixelBuffer:flags:petsDetections:results:cancel:](self, "analyzePixelBuffer:flags:petsDetections:results:cancel:", a3, a4, 0, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_petsKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_petsDetector, 0);
}

@end
