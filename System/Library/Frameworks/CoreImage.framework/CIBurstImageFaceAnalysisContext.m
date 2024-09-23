@implementation CIBurstImageFaceAnalysisContext

- (CIBurstImageFaceAnalysisContext)initWithVersion:(id)a3
{
  CIBurstImageFaceAnalysisContext *v4;
  NSMutableArray *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CIBurstImageFaceAnalysisContext;
  v4 = -[CIBurstImageFaceAnalysisContext init](&v8, sel_init);
  if (v4)
  {
    v4->curConfig = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v4->faceIdMapping = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v4->renameMapping = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v4->faceIdCounter = 1;
    v4->faceInfoArray = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v4->numFramesNoFaces = 0;
    v4->forceFaceDetectionEnable = 1;
    v4->faceDetector = 0;
    v5 = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v4->latestFaceTimestamp = 0.0;
    v4->faceTimestampArray = v5;
    v4->latestImageTimestamp = 0.0;
    v4->lastFaceIndex = 0;
    if (objc_msgSend(a3, "isEqualToString:", kCIBurstImageSet_VersionString_2[0]))
      v6 = 2;
    else
      v6 = 1;
    -[CIBurstImageFaceAnalysisContext setVersion:](v4, "setVersion:", v6);
  }
  return v4;
}

- (void)dealloc
{
  NSMutableDictionary *curConfig;
  NSMutableDictionary *faceIdMapping;
  NSMutableDictionary *renameMapping;
  NSMutableArray *faceInfoArray;
  FCRFaceDetector *faceDetector;
  NSMutableArray *faceTimestampArray;
  objc_super v9;

  curConfig = self->curConfig;
  if (curConfig)
  {

    self->curConfig = 0;
  }
  faceIdMapping = self->faceIdMapping;
  if (faceIdMapping)
  {

    self->faceIdMapping = 0;
  }
  renameMapping = self->renameMapping;
  if (renameMapping)
  {

    self->renameMapping = 0;
  }
  faceInfoArray = self->faceInfoArray;
  if (faceInfoArray)
  {

    self->faceInfoArray = 0;
  }
  faceDetector = self->faceDetector;
  if (faceDetector)
  {

    self->faceDetector = 0;
  }
  faceTimestampArray = self->faceTimestampArray;
  if (faceTimestampArray)
  {

    self->faceTimestampArray = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CIBurstImageFaceAnalysisContext;
  -[CIBurstImageFaceAnalysisContext dealloc](&v9, sel_dealloc);
}

- (void)setupFaceDetector
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRSetupParamNumberOfAngles(void)"), CFSTR("CIBurstFaceAnalysis.m"), 84, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (CGRect)padRoiRect:(CGRect)a3 paddingX:(float)a4 paddingY:(float)a5
{
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v5 = 100.0 / a3.size.width + -0.5;
  if (v5 > a4)
    a4 = 100.0 / a3.size.width + -0.5;
  v6 = 100.0 / a3.size.height + -0.5;
  if (v6 > a5)
    a5 = 100.0 / a3.size.height + -0.5;
  v7 = a4;
  v8 = a3.origin.x - a3.size.width * v7;
  v9 = a5;
  v10 = a3.origin.y - a3.size.height * v9;
  v11 = a3.size.width + a3.size.width * v7 * 2.0;
  v12 = a3.size.height + a3.size.height * v9 * 2.0;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v8;
  return result;
}

- (CGRect)calculateFaceCoreROI:(id)a3 imageStat:(id)a4 needFaceCore:(BOOL *)a5
{
  id v7;
  int v8;
  int v9;
  double x;
  double v11;
  CGFloat v12;
  double v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  void *v29;
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
  char v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  unint64_t v58;
  CGFloat v59;
  int v60;
  NSMutableArray *faceInfoArray;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  CGFloat v67;
  uint64_t i;
  void *v69;
  _BOOL4 v70;
  _BOOL4 v71;
  double v72;
  double v73;
  double v74;
  double v75;
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
  uint64_t v100;
  float v101;
  float v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  int v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double y;
  double width;
  double height;
  CGFloat v126;
  double v127;
  double v128;
  double v129;
  double v130;
  CGFloat v131;
  unsigned int v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  CGRect v142;
  CGFloat v143;
  CGFloat v144;
  double r2;
  CGFloat r2a;
  CGFloat v147;
  CGFloat v148;
  CGFloat r1;
  CGFloat r1a;
  double r1_8;
  CGFloat r1_8a;
  CGFloat r1_16;
  CGFloat r1_24;
  double v156;
  double v157;
  double v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE v163[128];
  uint64_t v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect result;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;

  v7 = a3;
  v164 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a3, "width");
  v9 = objc_msgSend(v7, "height");
  objc_msgSend(a4, "orientation");
  BurstLoggingMessage("    orientation = %d\n", objc_msgSend(a4, "orientation"));
  if (a5)
    *a5 = 0;
  objc_msgSend(v7, "width");
  objc_msgSend(v7, "height");
  x = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v147 = *MEMORY[0x1E0C9D648];
  v148 = v11;
  r1_24 = v13;
  if (-[CIBurstImageFaceAnalysisContext version](self, "version") <= 1)
  {
    v114 = objc_msgSend(v7, "width");
    v115 = objc_msgSend(v7, "height");
    v116 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count");
    v117 = v116;
    if ((int)v116 < 1)
    {
      v127 = (float)((float)(unint64_t)v8 * 0.2);
      v128 = (float)((float)(unint64_t)v9 * 0.2);
      v129 = (double)(unint64_t)v8 * 0.599999994;
      v130 = (double)(unint64_t)v9 * 0.599999994;
    }
    else
    {
      BurstLoggingMessage("Number of HW faces = %d - calculating rect\n", v116);
      if ((_DWORD)v117)
      {
        v118 = 0;
        do
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v118), "faceRect");
          x = v119 - v120 * 0.25;
          y = v121 - v122 * 0.25;
          width = v120 + v120 * 0.25 * 2.0;
          height = v122 + v122 * 0.25 * 2.0;
          BurstLoggingMessage("   face %d = (%.3f,%.3f,%.3f,%.3f)\n", v118, x, y, width, height);
          if (v118)
          {
            v173.origin.x = v147;
            v173.origin.y = v148;
            v173.size.width = v12;
            v173.size.height = r1_24;
            v184.origin.x = x;
            v184.origin.y = y;
            v184.size.width = width;
            v184.size.height = height;
            v174 = CGRectUnion(v173, v184);
            x = v174.origin.x;
            y = v174.origin.y;
            width = v174.size.width;
            height = v174.size.height;
          }
          ++v118;
          v147 = x;
          v148 = y;
          v12 = width;
          r1_24 = height;
        }
        while (v117 != v118);
      }
      else
      {
        height = v13;
        width = v12;
        y = v11;
      }
      v188.origin.x = 0.0;
      v188.origin.y = 0.0;
      v178.origin.x = x;
      v178.origin.y = y;
      v178.size.width = width;
      v178.size.height = height;
      v188.size.width = (double)v114;
      v188.size.height = (double)v115;
      v179 = CGRectIntersection(v178, v188);
      v127 = v179.origin.x;
      v128 = v179.origin.y;
      v129 = v179.size.width;
      v130 = v179.size.height;
    }
    objc_msgSend(a4, "setFacesRoiRect:", v127, v128, v129, v130);
    objc_msgSend(a4, "setNumHWFaces:", v117);
    if (a5)
      *a5 = 1;
  }
  else
  {
    v138 = v7;
    BurstLoggingMessage("Number of HW faces = %d - calculating rect\n", objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"));
    v14 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count");
    v15 = v13;
    v16 = v12;
    v17 = v11;
    v18 = x;
    v19 = v13;
    r1_16 = v12;
    v20 = v11;
    v21 = x;
    if (v14)
    {
      v22 = 0;
      v23 = v147;
      v24 = v11;
      v25 = v12;
      v26 = r1_24;
      r1 = v147;
      v144 = r1_24;
      r2 = v11;
      v27 = v12;
      do
      {
        v28 = v27;
        v139 = v26;
        v140 = v25;
        v141 = v24;
        v29 = (void *)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v22);
        objc_msgSend(v29, "faceRect");
        v31 = v30;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        objc_msgSend(v29, "setHwFaceId:", objc_msgSend(v29, "faceId"));
        objc_msgSend(v29, "faceRect");
        objc_msgSend(v29, "setHwFaceRect:");
        BurstLoggingMessage("   hwFaceRect: (%.3f,%.3f,%.3f,%.3f), hasLeftEye = %d, hasRightEye = %d\n", v31, v33, v35, v37, objc_msgSend(v29, "hasLeftEye"), objc_msgSend(v29, "hasRightEye"));
        v143 = v23;
        if (objc_msgSend(v29, "hasLeftEye"))
          v40 = objc_msgSend(v29, "hasRightEye");
        else
          v40 = 0;
        LODWORD(v38) = 0.25;
        LODWORD(v39) = 0.25;
        -[CIBurstImageFaceAnalysisContext padRoiRect:paddingX:paddingY:](self, "padRoiRect:paddingX:paddingY:", v31, v33, v35, v37, v38, v39);
        v21 = v41;
        v20 = v42;
        v44 = v43;
        v46 = v45;
        if (objc_msgSend(v29, "isSyncedWithImage") && (v40 & 1) != 0)
        {
          v47 = v46;
          v15 = v144;
          v48 = r2;
          v18 = r1;
          v11 = v148;
        }
        else
        {
          v11 = v148;
          v49 = v28;
          if (a5)
            *a5 = 1;
          v15 = v46;
          v28 = v44;
          v47 = v46;
          v48 = v20;
          v18 = v21;
          if (v49 != 0.0)
          {
            v50 = r1;
            v52 = v144;
            v51 = r2;
            v53 = v21;
            v54 = v20;
            v55 = v44;
            v56 = v47;
            v165 = CGRectUnion(*(CGRect *)(&v49 - 2), *(CGRect *)(&v47 - 3));
            v47 = v56;
            v18 = v165.origin.x;
            v48 = v165.origin.y;
            v28 = v165.size.width;
            v15 = v165.size.height;
          }
        }
        r2a = v47;
        BurstLoggingMessage("   face %d = (%.3f,%.3f,%.3f,%.3f)\n", v22, v21, v20, v44, v47);
        v156 = v28;
        r1_8 = v48;
        BurstLoggingMessage("   fcrect  = (%.3f,%.3f,%.3f,%.3f)\n", v18, v48, v28, v15);
        v12 = v44;
        if (v22)
        {
          v166.origin.y = v141;
          v166.origin.x = v143;
          v166.size.height = v139;
          v166.size.width = v140;
          v181.origin.x = v21;
          v181.origin.y = v20;
          v181.size.width = v44;
          v181.size.height = r2a;
          v167 = CGRectUnion(v166, v181);
          v21 = v167.origin.x;
          v20 = v167.origin.y;
          v12 = v167.size.width;
          v57 = v167.size.height;
        }
        else
        {
          v57 = r2a;
        }
        ++v22;
        v58 = objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count");
        v23 = v21;
        v24 = v20;
        v25 = v12;
        v26 = v57;
        r1 = v18;
        v19 = v57;
        v17 = r1_8;
        v144 = v15;
        r2 = r1_8;
        v16 = v156;
        v27 = v156;
      }
      while (v22 < v58);
    }
    v59 = v19;
    r1a = v18;
    r1_8a = v15;
    v157 = v16;
    v142.origin.x = v21;
    v142.origin.y = v20;
    v142.size.width = v12;
    v60 = objc_msgSend(a4, "temporalOrder");
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    faceInfoArray = self->faceInfoArray;
    v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](faceInfoArray, "countByEnumeratingWithState:objects:count:", &v159, v163, 16);
    v142.size.height = v59;
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v160;
      v65 = r1_24;
      v66 = v157;
      v67 = v147;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v160 != v64)
            objc_enumerationMutation(faceInfoArray);
          v69 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
          v70 = objc_msgSend(v69, "hwFaceId") != -1
             && (int)(v60 - objc_msgSend(v69, "hwLastFrameSeen")) < 4;
          v71 = objc_msgSend(v69, "swFaceId") != -1
             && (int)(v60 - objc_msgSend(v69, "swLastFrameSeen")) < 4;
          if (v70 || v71)
          {
            v72 = r1_16;
            v73 = v11;
            v74 = v67;
            if (v70)
            {
              objc_msgSend(v69, "hwCenter");
              v76 = v75;
              objc_msgSend(v69, "hwSize");
              v74 = v76 - v77 * 0.5;
              objc_msgSend(v69, "hwCenter");
              v79 = v78;
              objc_msgSend(v69, "hwSize");
              v73 = v79 - v80 * 0.5;
              objc_msgSend(v69, "hwSize");
              v72 = v81;
              objc_msgSend(v69, "hwSize");
              v65 = v82;
            }
            v158 = v66;
            if (v71)
            {
              objc_msgSend(v69, "swCenter");
              v84 = v83;
              objc_msgSend(v69, "swSize");
              v86 = v84 - v85 * 0.5;
              objc_msgSend(v69, "swCenter");
              v88 = v87;
              objc_msgSend(v69, "swSize");
              v90 = v88 - v89 * 0.5;
              objc_msgSend(v69, "swSize");
              v92 = v91;
              objc_msgSend(v69, "swSize");
              v94 = v93;
              if (v70)
              {
                v168.origin.x = v74;
                v168.origin.y = v73;
                v168.size.width = v72;
                v168.size.height = v65;
                v95 = v86;
                v96 = v90;
                v97 = v92;
                v169 = CGRectUnion(v168, *(CGRect *)(&v94 - 3));
                v74 = v169.origin.x;
                v73 = v169.origin.y;
                v72 = v169.size.width;
                v65 = v169.size.height;
              }
              else
              {
                v65 = v93;
                v72 = v92;
                v73 = v90;
                v74 = v86;
              }
              v67 = v147;
              v11 = v148;
            }
            if (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
            {
              v100 = 0;
              v101 = v65 * v72;
              v102 = v101 * 0.25;
              while (1)
              {
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v100), "faceRect");
                v182.origin.x = v74;
                v182.origin.y = v73;
                v182.size.width = v72;
                v182.size.height = v65;
                v171 = CGRectIntersection(v170, v182);
                *(float *)&v171.origin.x = v171.size.width * v171.size.height;
                if (v102 <= *(float *)&v171.origin.x)
                  break;
                if (++v100 >= (unint64_t)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
                  goto LABEL_43;
              }
              v65 = r1_24;
              v66 = v158;
            }
            else
            {
LABEL_43:
              LODWORD(v98) = 0.25;
              LODWORD(v99) = 0.25;
              -[CIBurstImageFaceAnalysisContext padRoiRect:paddingX:paddingY:](self, "padRoiRect:paddingX:paddingY:", v74, v73, v72, v65, v98, v99);
              v104 = v103;
              v106 = v105;
              v66 = v107;
              v109 = v108;
              BurstLoggingMessage("   inserting prev face (hw%d,sw=%d) = (%.3f,%.3f,%.3f,%.3f) padding=(%.3f,%.3f)\n", objc_msgSend(v69, "hwFaceId"), objc_msgSend(v69, "swFaceId"), v103, v105, v107, v108, v137, *(double *)&v138);
              if (a5)
                *a5 = 1;
              v110 = v158;
              if (v158 != 0.0)
              {
                v111 = r1a;
                v112 = r1_8a;
                v113 = v17;
                v183.origin.x = v104;
                v183.origin.y = v106;
                v183.size.width = v66;
                v183.size.height = v109;
                v172 = CGRectUnion(*(CGRect *)(&v110 - 2), v183);
                v104 = v172.origin.x;
                v106 = v172.origin.y;
                v66 = v172.size.width;
                v109 = v172.size.height;
              }
              BurstLoggingMessage("   fcrect  = (%.3f,%.3f,%.3f,%.3f)\n", v104, v106, v66, v109);
              r1a = v104;
              r1_8a = v109;
              v17 = v106;
              v65 = r1_24;
            }
          }
        }
        v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](faceInfoArray, "countByEnumeratingWithState:objects:count:", &v159, v163, 16);
      }
      while (v63);
    }
    else
    {
      v66 = v157;
    }
    v7 = v138;
    v126 = (double)(int)objc_msgSend(v138, "width");
    v185.size.height = (double)(int)objc_msgSend(v138, "height");
    v185.origin.x = 0.0;
    v185.origin.y = 0.0;
    v175.origin.x = r1a;
    v175.size.height = r1_8a;
    v175.origin.y = v17;
    v175.size.width = v66;
    v185.size.width = v126;
    v176 = CGRectIntersection(v175, v185);
    v127 = v176.origin.x;
    v128 = v176.origin.y;
    v129 = v176.size.width;
    v130 = v176.size.height;
    v131 = (double)(int)objc_msgSend(v138, "width");
    v186.size.height = (double)(int)objc_msgSend(v138, "height");
    v186.origin.x = 0.0;
    v186.origin.y = 0.0;
    v186.size.width = v131;
    v177 = CGRectIntersection(v142, v186);
    if (v129 > 0.0 && v130 > 0.0)
    {
      v187.origin.x = v127;
      v187.origin.y = v128;
      v187.size.width = v129;
      v187.size.height = v130;
      v177 = CGRectUnion(v177, v187);
    }
    objc_msgSend(a4, "setFacesRoiRect:", v177.origin.x, v177.origin.y, v177.size.width, v177.size.height);
    objc_msgSend(a4, "setNumHWFaces:", objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"));
  }
  v132 = objc_msgSend(a4, "orientation");
  if (v132 > 8)
    goto LABEL_76;
  if (((1 << v132) & 0x18) != 0)
  {
    v127 = (double)(int)objc_msgSend(v7, "width") - v127 - v129;
    v134 = (double)(int)objc_msgSend(v7, "height") - v128 - v130;
    v133 = v130;
LABEL_77:
    v128 = v127;
    goto LABEL_78;
  }
  if (((1 << v132) & 0xC0) != 0)
  {
    v134 = (double)(int)objc_msgSend(v7, "width") - v127 - v129;
    v133 = v129;
    v129 = v130;
    goto LABEL_78;
  }
  if (((1 << v132) & 0x120) == 0)
  {
LABEL_76:
    v133 = v130;
    v134 = v128;
    goto LABEL_77;
  }
  v128 = (double)(int)objc_msgSend(v7, "height") - v128 - v130;
  v133 = v129;
  v129 = v130;
  v134 = v127;
LABEL_78:
  v135 = v128;
  v136 = v129;
  result.size.height = v133;
  result.size.width = v136;
  result.origin.y = v134;
  result.origin.x = v135;
  return result;
}

- (id)findOverlappingFaceStat:(CGRect)a3 imageStat:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = (void *)objc_msgSend(a4, "faceStatArray", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v12 = *(_QWORD *)v24;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v12)
      objc_enumerationMutation(v8);
    v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
    objc_msgSend(v14, "faceRect");
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v30 = CGRectIntersection(v29, v31);
    v15 = v30.size.width * v30.size.height;
    objc_msgSend(v14, "faceRect");
    v17 = v16;
    objc_msgSend(v14, "faceRect");
    *(float *)&v19 = v15 * 4.0;
    v11 = width * height;
    if ((float)(v15 * 4.0) < v11)
    {
      v20 = v17 * v18;
      v21 = *(float *)&v19 < v20;
    }
    else
    {
      v21 = 0;
    }
    if (!v21)
      return v14;
    if (v10 == ++v13)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v19);
      v14 = 0;
      if (v10)
        goto LABEL_3;
      return v14;
    }
  }
}

- (int)findFacesInImage:(id)a3 imageStat:(id)a4
{
  int v7;
  unsigned int v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  __int128 *v18;
  uint64_t i;
  void *v20;
  objc_class *v21;
  id v22;
  float v23;
  uint64_t v24;
  double v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  float v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MidX;
  double MidY;
  double v42;
  double v43;
  float v44;
  double v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  __int128 v50;
  float v51;
  double v52;
  CGFloat v53;
  double v54;
  __int128 v55;
  float v56;
  float v57;
  __double2 v58;
  __int128 v59;
  int v60;
  uint64_t v61;
  _QWORD *v62;
  void *v63;
  uint64_t v64;
  _QWORD *v65;
  void *v66;
  double v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  _QWORD *v73;
  void *v74;
  uint64_t v75;
  _QWORD *v76;
  void *v77;
  uint64_t v78;
  _QWORD *v79;
  void *v80;
  uint64_t v81;
  _QWORD *v82;
  void *v83;
  uint64_t v84;
  _QWORD *v85;
  void *v86;
  uint64_t v87;
  _QWORD *v88;
  void *v89;
  unint64_t j;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  __int128 v101;
  void *v102;
  uint64_t v103;
  double v104;
  double v105;
  float v106;
  uint64_t v107;
  uint64_t k;
  CIBurstFaceStat *v109;
  double width;
  double height;
  double v112;
  double v113;
  double v114;
  float v115;
  float v116;
  float v117;
  BOOL v118;
  _BOOL4 v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double x;
  double y;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  _QWORD *v135;
  void *v136;
  void *v137;
  _QWORD *v138;
  void *v139;
  void *v140;
  _QWORD *v141;
  void *v142;
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
  double v155;
  int v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  uint64_t v164;
  int v165;
  id v167;
  int v168;
  unint64_t v169;
  int v170;
  int v171;
  void *v172;
  unsigned int v173;
  CIBurstImageFaceAnalysisContext *v174;
  double v175;
  void *v176;
  void *v177;
  id v178;
  float v179;
  __int128 v180;
  double v181;
  __int128 v182;
  double v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _QWORD v191[10];
  double v192[2];
  __int128 v193;
  __int128 v194;
  _QWORD v195[2];
  __int128 v196;
  __int128 v197;
  _QWORD v198[2];
  __int128 v199;
  __int128 v200;
  _QWORD v201[6];
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  CGRect rect2;
  unsigned __int8 v207;
  id v208;
  __int128 v209;
  __int128 v210;
  __int128 *v211;
  __int128 v212;
  __int128 v213;
  void (*v214)(uint64_t);
  uint64_t v215;
  _BYTE v216[128];
  _BYTE v217[128];
  uint64_t v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;

  v218 = *MEMORY[0x1E0C80C00];
  v168 = objc_msgSend(a3, "width");
  v7 = objc_msgSend(a3, "height");
  v174 = self;
  -[CIBurstImageFaceAnalysisContext setupFaceDetector](self, "setupFaceDetector");
  v171 = objc_msgSend(a3, "width");
  v170 = objc_msgSend(a3, "height");
  v172 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v208 = 0;
  v178 = a4;
  v8 = objc_msgSend(a4, "orientation") - 3;
  if (v8 > 5)
    v173 = 0;
  else
    v173 = dword_192491724[v8];
  v207 = 0;
  -[CIBurstImageFaceAnalysisContext calculateFaceCoreROI:imageStat:needFaceCore:](self, "calculateFaceCoreROI:imageStat:needFaceCore:", a3, a4, &v207);
  rect2.origin.x = v9;
  rect2.origin.y = v10;
  rect2.size.width = v11;
  rect2.size.height = v12;
  *(_QWORD *)&v212 = 0;
  *((_QWORD *)&v212 + 1) = &v212;
  *(_QWORD *)&v213 = 0x3052000000;
  *((_QWORD *)&v213 + 1) = __Block_byref_object_copy__0;
  v214 = __Block_byref_object_dispose__0;
  v13 = (objc_class *)getFaceCoreImageClass_softClass;
  v215 = getFaceCoreImageClass_softClass;
  if (!getFaceCoreImageClass_softClass)
  {
    *(_QWORD *)&v209 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v209 + 1) = 3221225472;
    *(_QWORD *)&v210 = __getFaceCoreImageClass_block_invoke;
    *((_QWORD *)&v210 + 1) = &unk_1E2EC2EB8;
    v211 = &v212;
    __getFaceCoreImageClass_block_invoke((uint64_t)&v209);
    v13 = *(objc_class **)(*((_QWORD *)&v212 + 1) + 40);
  }
  _Block_object_dispose(&v212, 8);
  v167 = (id)objc_msgSend([v13 alloc], "initWithWidth:height:bytesPerRow:buffer:freeWhenDone:", (int)objc_msgSend(a3, "width"), (int)objc_msgSend(a3, "height"), (int)objc_msgSend(a3, "bytesPerRow"), objc_msgSend(a3, "Ybuffer"), 0);
  BurstLoggingMessage("  needFaceCore = %d\n", v207);
  v176 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v169 = v7;
  if (-[CIBurstImageFaceAnalysisContext version](self, "version") >= 2)
  {
    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v14 = (void *)objc_msgSend(a4, "faceStatArray");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v202, v217, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v203;
      v175 = (double)(unint64_t)v7;
      v17 = 0.5;
      v18 = (__int128 *)MEMORY[0x1E0C9D648];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v203 != v16)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * i);
          if (objc_msgSend(v20, "hasLeftEye") && objc_msgSend(v20, "hasRightEye"))
          {
            *(_QWORD *)&v212 = 0;
            *((_QWORD *)&v212 + 1) = &v212;
            *(_QWORD *)&v213 = 0x3052000000;
            *((_QWORD *)&v213 + 1) = __Block_byref_object_copy__0;
            v214 = __Block_byref_object_dispose__0;
            v21 = (objc_class *)getFaceCoreFaceClass_softClass;
            v215 = getFaceCoreFaceClass_softClass;
            if (!getFaceCoreFaceClass_softClass)
            {
              *(_QWORD *)&v209 = MEMORY[0x1E0C809B0];
              *((_QWORD *)&v209 + 1) = 3221225472;
              *(_QWORD *)&v210 = __getFaceCoreFaceClass_block_invoke;
              *((_QWORD *)&v210 + 1) = &unk_1E2EC2EB8;
              v211 = &v212;
              __getFaceCoreFaceClass_block_invoke((uint64_t)&v209);
              v21 = *(objc_class **)(*((_QWORD *)&v212 + 1) + 40);
            }
            _Block_object_dispose(&v212, 8);
            v22 = objc_alloc_init(v21);
            if (objc_msgSend(v20, "hasRollAngle"))
            {
              objc_msgSend(v20, "rollAngle");
              v24 = (uint64_t)v23;
              if ((uint64_t)v23 > 180)
                v24 = (uint64_t)v23 - 360;
              objc_msgSend(v22, "setFaceAngle:", (float)v24);
              objc_msgSend(v22, "faceAngle");
              v26 = v25 + 90.0;
            }
            else
            {
              objc_msgSend(v22, "setFaceAngle:", 0.0);
              v26 = (float)(int)v173 + 90.0;
            }
            v179 = v26;
            if (objc_msgSend(v20, "hasYawAngle"))
            {
              objc_msgSend(v20, "yawAngle");
              if (v27 >= 30.0)
              {
                objc_msgSend(v20, "yawAngle");
                if (v28 < 180.0)
                {
                  v29 = 1;
LABEL_29:
                  objc_msgSend(v22, "setFaceType:", v29);
                  objc_msgSend(v20, "faceRect");
                  v33 = v32;
                  v35 = v34;
                  v37 = v36;
                  v39 = v38;
                  objc_msgSend(v20, "faceRect");
                  MidX = CGRectGetMidX(v219);
                  objc_msgSend(v20, "faceRect");
                  MidY = CGRectGetMidY(v220);
                  v42 = MidY;
                  if (v37 >= v39)
                    v43 = v39;
                  else
                    v43 = v37;
                  *(double *)v201 = MidX;
                  *(double *)&v201[1] = MidY;
                  v201[2] = v33;
                  v201[3] = v35;
                  *(double *)&v201[4] = v37;
                  *(double *)&v201[5] = v39;
                  objc_msgSend(v22, "setFace:", v201);
                  v44 = v43 * v17;
                  v45 = v44;
                  objc_msgSend(v22, "setFaceSize:", v44);
                  v212 = 0u;
                  v213 = 0u;
                  v209 = 0u;
                  v210 = 0u;
                  v46 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v47 = 0.0;
                  v48 = 0.0;
                  if (objc_msgSend(v20, "hasLeftEye"))
                  {
                    objc_msgSend(v20, "leftEyeRect");
                    v48 = CGRectGetMidX(v221);
                    objc_msgSend(v20, "leftEyeRect");
                    v49 = CGRectGetMidY(v222);
                    v50 = v18[1];
                    v212 = *v18;
                    v213 = v50;
                    objc_msgSend(v20, "leftEyeBlinkScore");
                    v47 = v175 - v49;
                    if (v51 >= 30.0)
                      objc_msgSend(v46, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), getFCRFaceExpressionLeftEyeClosed());
                  }
                  v52 = 0.0;
                  v53 = 0.0;
                  if (objc_msgSend(v20, "hasRightEye"))
                  {
                    objc_msgSend(v20, "rightEyeRect");
                    v53 = CGRectGetMidX(v223);
                    objc_msgSend(v20, "rightEyeRect");
                    v54 = CGRectGetMidY(v224);
                    v55 = v18[1];
                    v209 = *v18;
                    v210 = v55;
                    objc_msgSend(v20, "rightEyeBlinkScore");
                    v52 = v175 - v54;
                    if (v56 >= 30.0)
                      objc_msgSend(v46, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), getFCRFaceExpressionRightEyeClosed());
                  }
                  objc_msgSend(v20, "smileScore");
                  if (v57 > 30.0)
                    objc_msgSend(v46, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), getFCRFaceExpressionSmile());
                  objc_msgSend(v22, "setExpressionFeatures:", v46);
                  v58 = __sincos_stret(v179 / 180.0 * 3.14159265);
                  v199 = v212;
                  v200 = v213;
                  *(CGFloat *)v198 = v48;
                  *(double *)&v198[1] = v47;
                  objc_msgSend(v22, "setLeftEye:", v198);
                  v196 = v209;
                  v197 = v210;
                  *(CGFloat *)v195 = v53;
                  *(double *)&v195[1] = v52;
                  objc_msgSend(v22, "setRightEye:", v195);
                  v17 = 0.5;
                  v192[0] = MidX + v58.__sinval * v45 * 0.5;
                  v192[1] = v42 + v58.__cosval * v45 * 0.5;
                  v59 = v18[1];
                  v193 = *v18;
                  v194 = v59;
                  objc_msgSend(v22, "setMouth:", v192);
                  objc_msgSend(v176, "addObject:", v22);

                  continue;
                }
              }
              objc_msgSend(v20, "yawAngle");
              if (v30 <= 330.0)
              {
                objc_msgSend(v20, "yawAngle");
                if (v31 > 180.0)
                {
                  v29 = 2;
                  goto LABEL_29;
                }
              }
            }
            v29 = 0;
            goto LABEL_29;
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v202, v217, 16);
      }
      while (v15);
    }
  }
  v60 = v207;
  if (v207)
  {
    v225.origin.x = 0.0;
    v225.origin.y = 0.0;
    v225.size.width = (double)v171;
    v225.size.height = (double)v170;
    if (!CGRectEqualToRect(v225, rect2))
    {
      BurstLoggingMessage("setting faces ROI to (%.3f,%.3f,%.3f,%.3f)\n", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
      v61 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &rect2, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      *(_QWORD *)&v212 = 0;
      *((_QWORD *)&v212 + 1) = &v212;
      *(_QWORD *)&v213 = 0x2020000000;
      v62 = (_QWORD *)getFCRDetectionParamDetectionRegionSymbolLoc_ptr;
      *((_QWORD *)&v213 + 1) = getFCRDetectionParamDetectionRegionSymbolLoc_ptr;
      if (!getFCRDetectionParamDetectionRegionSymbolLoc_ptr)
      {
        v63 = (void *)FaceCoreLibrary();
        v62 = dlsym(v63, "FCRDetectionParamDetectionRegion");
        *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v62;
        getFCRDetectionParamDetectionRegionSymbolLoc_ptr = (uint64_t)v62;
      }
      _Block_object_dispose(&v212, 8);
      if (!v62)
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.11();
      objc_msgSend(v172, "setObject:forKey:", v61, *v62);
    }
    v64 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v173);
    *(_QWORD *)&v212 = 0;
    *((_QWORD *)&v212 + 1) = &v212;
    *(_QWORD *)&v213 = 0x2020000000;
    v65 = (_QWORD *)getFCRDetectionParamInitialAngleSymbolLoc_ptr;
    *((_QWORD *)&v213 + 1) = getFCRDetectionParamInitialAngleSymbolLoc_ptr;
    if (!getFCRDetectionParamInitialAngleSymbolLoc_ptr)
    {
      v66 = (void *)FaceCoreLibrary();
      v65 = dlsym(v66, "FCRDetectionParamInitialAngle");
      *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v65;
      getFCRDetectionParamInitialAngleSymbolLoc_ptr = (uint64_t)v65;
    }
    _Block_object_dispose(&v212, 8);
    if (!v65)
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.10();
    objc_msgSend(v172, "setObject:forKey:", v64, *v65);
    v67 = rect2.size.width * rect2.size.height;
    if (rect2.size.width * rect2.size.height <= 0.100000001)
      v68 = objc_msgSend(MEMORY[0x1E0C99D20], "array", v67);
    else
      v68 = -[FCRFaceDetector detectFacesInImage:options:error:](v174->faceDetector, "detectFacesInImage:options:error:", v167, v172, &v208, v67);
    v69 = (void *)v68;
  }
  else
  {
    v69 = 0;
  }
  if (-[CIBurstImageFaceAnalysisContext version](v174, "version") >= 2 && objc_msgSend(v176, "count"))
    v70 = (void *)objc_msgSend(v176, "arrayByAddingObjectsFromArray:", v69);
  else
    v70 = v69;
  v177 = v70;
  if ((unint64_t)objc_msgSend(v70, "count") >= 7)
  {
    v191[0] = MEMORY[0x1E0C809B0];
    v191[1] = 3221225472;
    v191[2] = __62__CIBurstImageFaceAnalysisContext_findFacesInImage_imageStat___block_invoke;
    v191[3] = &unk_1E2EC2E80;
    v191[7] = 0;
    v191[6] = 0;
    *(double *)&v191[8] = (double)v171;
    *(double *)&v191[9] = (double)v170;
    v191[4] = v174;
    v191[5] = v178;
    v177 = (void *)objc_msgSend((id)objc_msgSend(v177, "sortedArrayUsingComparator:", v191), "subarrayWithRange:", 0, 6);
  }
  if (v208)
    BurstLoggingMessage("Face detection error\n");
  v174->timeFaceDetectionDone = timeElapsedSinceInit();
  if (v174->faceDetector && v177 && objc_msgSend(v177, "count"))
  {
    v71 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    *(_QWORD *)&v212 = 0;
    *((_QWORD *)&v212 + 1) = &v212;
    *(_QWORD *)&v213 = 0x2020000000;
    v73 = (_QWORD *)getFCRExtractionParamExtractBlinkSymbolLoc_ptr;
    *((_QWORD *)&v213 + 1) = getFCRExtractionParamExtractBlinkSymbolLoc_ptr;
    if (!getFCRExtractionParamExtractBlinkSymbolLoc_ptr)
    {
      v74 = (void *)FaceCoreLibrary();
      v73 = dlsym(v74, "FCRExtractionParamExtractBlink");
      *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v73;
      getFCRExtractionParamExtractBlinkSymbolLoc_ptr = (uint64_t)v73;
    }
    _Block_object_dispose(&v212, 8);
    if (!v73)
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.4();
    objc_msgSend(v71, "setObject:forKey:", v72, *v73);
    v75 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    *(_QWORD *)&v212 = 0;
    *((_QWORD *)&v212 + 1) = &v212;
    *(_QWORD *)&v213 = 0x2020000000;
    v76 = (_QWORD *)getFCRExtractionParamExtractSmileSymbolLoc_ptr;
    *((_QWORD *)&v213 + 1) = getFCRExtractionParamExtractSmileSymbolLoc_ptr;
    if (!getFCRExtractionParamExtractSmileSymbolLoc_ptr)
    {
      v77 = (void *)FaceCoreLibrary();
      v76 = dlsym(v77, "FCRExtractionParamExtractSmile");
      *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v76;
      getFCRExtractionParamExtractSmileSymbolLoc_ptr = (uint64_t)v76;
    }
    _Block_object_dispose(&v212, 8);
    if (!v76)
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.5();
    objc_msgSend(v71, "setObject:forKey:", v75, *v76);
    v78 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    *(_QWORD *)&v212 = 0;
    *((_QWORD *)&v212 + 1) = &v212;
    *(_QWORD *)&v213 = 0x2020000000;
    v79 = (_QWORD *)getFCRExtractionParamExtractFaceprintSymbolLoc_ptr;
    *((_QWORD *)&v213 + 1) = getFCRExtractionParamExtractFaceprintSymbolLoc_ptr;
    if (!getFCRExtractionParamExtractFaceprintSymbolLoc_ptr)
    {
      v80 = (void *)FaceCoreLibrary();
      v79 = dlsym(v80, "FCRExtractionParamExtractFaceprint");
      *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v79;
      getFCRExtractionParamExtractFaceprintSymbolLoc_ptr = (uint64_t)v79;
    }
    _Block_object_dispose(&v212, 8);
    if (!v79)
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.6();
    objc_msgSend(v71, "setObject:forKey:", v78, *v79);
    v81 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    *(_QWORD *)&v212 = 0;
    *((_QWORD *)&v212 + 1) = &v212;
    *(_QWORD *)&v213 = 0x2020000000;
    v82 = (_QWORD *)getFCRExtractionParamExtractLandmarkPointsSymbolLoc_ptr;
    *((_QWORD *)&v213 + 1) = getFCRExtractionParamExtractLandmarkPointsSymbolLoc_ptr;
    if (!getFCRExtractionParamExtractLandmarkPointsSymbolLoc_ptr)
    {
      v83 = (void *)FaceCoreLibrary();
      v82 = dlsym(v83, "FCRExtractionParamExtractLandmarkPoints");
      *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v82;
      getFCRExtractionParamExtractLandmarkPointsSymbolLoc_ptr = (uint64_t)v82;
    }
    _Block_object_dispose(&v212, 8);
    if (!v82)
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.7();
    objc_msgSend(v71, "setObject:forKey:", v81, *v82);
    v84 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    *(_QWORD *)&v212 = 0;
    *((_QWORD *)&v212 + 1) = &v212;
    *(_QWORD *)&v213 = 0x2020000000;
    v85 = (_QWORD *)getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_ptr;
    *((_QWORD *)&v213 + 1) = getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_ptr;
    if (!getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_ptr)
    {
      v86 = (void *)FaceCoreLibrary();
      v85 = dlsym(v86, "FCRExtractionParamEnhancedEyesAndMouthLocalization");
      *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v85;
      getFCRExtractionParamEnhancedEyesAndMouthLocalizationSymbolLoc_ptr = (uint64_t)v85;
    }
    _Block_object_dispose(&v212, 8);
    if (!v85)
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.8();
    objc_msgSend(v71, "setObject:forKey:", v84, *v85);
    v87 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v173);
    *(_QWORD *)&v212 = 0;
    *((_QWORD *)&v212 + 1) = &v212;
    *(_QWORD *)&v213 = 0x2020000000;
    v88 = (_QWORD *)getFCRExtractionParamInitialAngleSymbolLoc_ptr;
    *((_QWORD *)&v213 + 1) = getFCRExtractionParamInitialAngleSymbolLoc_ptr;
    if (!getFCRExtractionParamInitialAngleSymbolLoc_ptr)
    {
      v89 = (void *)FaceCoreLibrary();
      v88 = dlsym(v89, "FCRExtractionParamInitialAngle");
      *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v88;
      getFCRExtractionParamInitialAngleSymbolLoc_ptr = (uint64_t)v88;
    }
    _Block_object_dispose(&v212, 8);
    if (!v88)
      -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.9();
    objc_msgSend(v71, "setObject:forKey:", v87, *v88);
    if (v60 || -[CIBurstImageFaceAnalysisContext version](v174, "version") <= 1)
      v177 = (void *)-[FCRFaceDetector extractDetailsForFaces:inImage:options:error:](v174->faceDetector, "extractDetailsForFaces:inImage:options:error:", v177, v167, v71, &v208);
    if (v208)
      BurstLoggingMessage("extractDetails error: %s\n", (const char *)objc_msgSend((id)objc_msgSend(v208, "localizedDescription"), "UTF8String"));
  }
  v174->timeBlinkDetectionDone = timeElapsedSinceInit();
  if (-[CIBurstImageFaceAnalysisContext version](v174, "version") >= 2)
  {
    if (objc_msgSend(v177, "count") || objc_msgSend((id)objc_msgSend(v178, "faceStatArray"), "count"))
      v174->numFramesNoFaces = 0;
    else
      ++v174->numFramesNoFaces;
  }
  if (objc_msgSend(v177, "count"))
  {
    for (j = 0; j < objc_msgSend(v177, "count"); ++j)
    {
      v91 = (void *)objc_msgSend(v177, "objectAtIndex:", j);
      v92 = (void *)objc_msgSend((id)objc_msgSend(v91, "expressionFeatures"), "valueForKey:", getFCRFaceExpressionLeftEyeClosed());
      v93 = (void *)objc_msgSend((id)objc_msgSend(v91, "expressionFeatures"), "valueForKey:", getFCRFaceExpressionRightEyeClosed());
      v94 = (void *)objc_msgSend((id)objc_msgSend(v91, "expressionFeatures"), "valueForKey:", getFCRFaceExpressionSmile());
      if (v92)
      {
        v95 = objc_msgSend(v92, "BOOLValue") ^ 1;
        if (v93)
          goto LABEL_99;
      }
      else
      {
        v95 = 1;
        if (v93)
        {
LABEL_99:
          v96 = objc_msgSend(v93, "BOOLValue") ^ 1;
          if (!v94)
            goto LABEL_100;
          goto LABEL_104;
        }
      }
      v96 = 1;
      if (!v94)
      {
LABEL_100:
        if (!v91)
          goto LABEL_105;
        goto LABEL_101;
      }
LABEL_104:
      v94 = (void *)objc_msgSend(v94, "BOOLValue");
      if (!v91)
      {
LABEL_105:
        v101 = 0uLL;
        v189 = 0u;
        v190 = 0u;
        v100 = 0.0;
        v99 = 0.0;
        v98 = 0.0;
        v97 = 0.0;
        v188 = 0u;
        goto LABEL_106;
      }
LABEL_101:
      objc_msgSend(v91, "face");
      v98 = *((double *)&v189 + 1);
      v97 = *(double *)&v189;
      v100 = *((double *)&v190 + 1);
      v99 = *(double *)&v190;
      v101 = 0uLL;
LABEL_106:
      v186 = v101;
      v187 = v101;
      v184 = v101;
      v185 = v101;
      v102 = (void *)objc_msgSend(v178, "faceStatArray");
      v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v184, v216, 16);
      v104 = v97 + 0.0;
      v105 = v98 + 0.0;
      if (v103)
      {
        v107 = *(_QWORD *)v185;
        do
        {
          for (k = 0; k != v103; ++k)
          {
            if (*(_QWORD *)v185 != v107)
              objc_enumerationMutation(v102);
            v109 = *(CIBurstFaceStat **)(*((_QWORD *)&v184 + 1) + 8 * k);
            -[CIBurstFaceStat faceRect](v109, "faceRect");
            v230.origin.x = v104;
            v230.origin.y = v105;
            v230.size.width = v99;
            v230.size.height = v100;
            v227 = CGRectIntersection(v226, v230);
            width = v227.size.width;
            height = v227.size.height;
            -[CIBurstFaceStat faceRect](v109, "faceRect", v227.origin.x, v227.origin.y);
            v113 = v112;
            -[CIBurstFaceStat faceRect](v109, "faceRect");
            v115 = width * height;
            v116 = v115 * 4.0;
            v106 = v99 * v100;
            if (v116 < v106)
            {
              v117 = v113 * v114;
              v118 = v116 < v117;
            }
            else
            {
              v118 = 0;
            }
            if (!v118)
            {
              -[CIBurstFaceStat setHwFaceId:](v109, "setHwFaceId:", -[CIBurstFaceStat faceId](v109, "faceId"));
              goto LABEL_119;
            }
          }
          v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v184, v216, 16);
        }
        while (v103);
      }
      v109 = objc_alloc_init(CIBurstFaceStat);
      objc_msgSend((id)objc_msgSend(v178, "faceStatArray"), "addObject:", v109);

LABEL_119:
      -[CIBurstFaceStat setFaceRect:](v109, "setFaceRect:", v104, v105, v99, v100);
      v119 = -[CIBurstImageFaceAnalysisContext version](v174, "version") > 1;
      -[CIBurstFaceStat faceRect](v109, "faceRect");
      x = v120;
      y = v121;
      v128 = v122;
      v129 = v123;
      if (v119)
      {
        LODWORD(v124) = 0.25;
        LODWORD(v125) = 0.25;
        -[CIBurstImageFaceAnalysisContext padRoiRect:paddingX:paddingY:](v174, "padRoiRect:paddingX:paddingY:", v120, v121, v122, v123, v124, v125);
        x = v130;
        y = v131;
        v128 = v132;
        v129 = v133;
      }
      if (objc_msgSend(v178, "numHWFaces") || j)
      {
        objc_msgSend(v178, "facesRoiRect");
        v231.origin.x = x;
        v231.origin.y = y;
        v231.size.width = v128;
        v231.size.height = v129;
        v229 = CGRectUnion(v228, v231);
        x = v229.origin.x;
        y = v229.origin.y;
        v128 = v229.size.width;
        v129 = v229.size.height;
      }
      objc_msgSend(v178, "setFacesRoiRect:", x, y, v128, v129);
      -[CIBurstFaceStat setNormalizedFaceRect:](v109, "setNormalizedFaceRect:", v104 * (float)(1.0 / (float)(unint64_t)v168), v105 * (float)(1.0 / (float)v169), v99 * (float)(1.0 / (float)(unint64_t)v168), v100 * (float)(1.0 / (float)v169));
      -[CIBurstFaceStat setFoundByFaceCore:](v109, "setFoundByFaceCore:", 1);
      if (-[CIBurstImageFaceAnalysisContext version](v174, "version") <= 1)
      {
        -[CIBurstFaceStat setHasLeftEye:](v109, "setHasLeftEye:", 1);
        -[CIBurstFaceStat setHasRightEye:](v109, "setHasRightEye:", 1);
      }
      -[CIBurstFaceStat setLeftEyeOpen:](v109, "setLeftEyeOpen:", v95);
      -[CIBurstFaceStat setRightEyeOpen:](v109, "setRightEyeOpen:", v96);
      -[CIBurstFaceStat setSmiling:](v109, "setSmiling:", v94);
      v134 = (void *)objc_msgSend(v91, "expressionFeatures");
      *(_QWORD *)&v212 = 0;
      *((_QWORD *)&v212 + 1) = &v212;
      *(_QWORD *)&v213 = 0x2020000000;
      v135 = (_QWORD *)getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_ptr;
      *((_QWORD *)&v213 + 1) = getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_ptr;
      if (!getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_ptr)
      {
        v136 = (void *)FaceCoreLibrary();
        v135 = dlsym(v136, "FCRFaceExpressionLeftEyeClosedScore");
        *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v135;
        getFCRFaceExpressionLeftEyeClosedScoreSymbolLoc_ptr = (uint64_t)v135;
      }
      _Block_object_dispose(&v212, 8);
      if (!v135)
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.1();
      objc_msgSend((id)objc_msgSend(v134, "valueForKey:", *v135), "floatValue");
      -[CIBurstFaceStat setLeftEyeBlinkScore:](v109, "setLeftEyeBlinkScore:");
      v137 = (void *)objc_msgSend(v91, "expressionFeatures");
      *(_QWORD *)&v212 = 0;
      *((_QWORD *)&v212 + 1) = &v212;
      *(_QWORD *)&v213 = 0x2020000000;
      v138 = (_QWORD *)getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_ptr;
      *((_QWORD *)&v213 + 1) = getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_ptr;
      if (!getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_ptr)
      {
        v139 = (void *)FaceCoreLibrary();
        v138 = dlsym(v139, "FCRFaceExpressionRightEyeClosedScore");
        *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v138;
        getFCRFaceExpressionRightEyeClosedScoreSymbolLoc_ptr = (uint64_t)v138;
      }
      _Block_object_dispose(&v212, 8);
      if (!v138)
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.2();
      objc_msgSend((id)objc_msgSend(v137, "valueForKey:", *v138), "floatValue");
      -[CIBurstFaceStat setRightEyeBlinkScore:](v109, "setRightEyeBlinkScore:");
      v140 = (void *)objc_msgSend(v91, "expressionFeatures");
      *(_QWORD *)&v212 = 0;
      *((_QWORD *)&v212 + 1) = &v212;
      *(_QWORD *)&v213 = 0x2020000000;
      v141 = (_QWORD *)getFCRFaceExpressionSmileScoreSymbolLoc_ptr;
      *((_QWORD *)&v213 + 1) = getFCRFaceExpressionSmileScoreSymbolLoc_ptr;
      if (!getFCRFaceExpressionSmileScoreSymbolLoc_ptr)
      {
        v142 = (void *)FaceCoreLibrary();
        v141 = dlsym(v142, "FCRFaceExpressionSmileScore");
        *(_QWORD *)(*((_QWORD *)&v212 + 1) + 24) = v141;
        getFCRFaceExpressionSmileScoreSymbolLoc_ptr = (uint64_t)v141;
      }
      _Block_object_dispose(&v212, 8);
      if (!v141)
        -[CIBurstImageFaceAnalysisContext findFacesInImage:imageStat:].cold.3();
      objc_msgSend((id)objc_msgSend(v140, "valueForKey:", *v141), "floatValue");
      -[CIBurstFaceStat setSmileScore:](v109, "setSmileScore:");
      -[CIBurstImageFaceAnalysisContext version](v174, "version");
      -[CIBurstFaceStat faceRect](v109, "faceRect");
      v144 = v143;
      -[CIBurstFaceStat faceRect](v109, "faceRect");
      v146 = v145;
      v147 = v144 * 0.300000012;
      if (v91)
      {
        objc_msgSend(v91, "leftEye");
        objc_msgSend(v91, "leftEye");
        v148 = -v147;
        v149 = -0.5;
        v150 = v183 + 0.0 + v147 * -0.5;
        v151 = *((double *)&v182 + 1);
      }
      else
      {
        v183 = 0.0;
        v148 = -v147;
        v151 = 0.0;
        v149 = -0.5;
        v150 = v147 * -0.5 + 0.0;
        v182 = 0u;
      }
      v152 = v146 * 0.200000003;
      -[CIBurstFaceStat setLeftEyeRect:](v109, "setLeftEyeRect:", v150, v151 + 0.0 + v152 * v149, v147, v152);
      if (v91)
      {
        objc_msgSend(v91, "rightEye");
        objc_msgSend(v91, "rightEye");
        v153 = v181 + 0.0 + v148 * 0.5;
        v154 = 0.5;
        v155 = *((double *)&v180 + 1);
      }
      else
      {
        v181 = 0.0;
        v155 = 0.0;
        v153 = v148 * 0.5 + 0.0;
        v154 = 0.5;
        v180 = 0u;
      }
      -[CIBurstFaceStat setRightEyeRect:](v109, "setRightEyeRect:", v153, v155 + 0.0 + -v152 * v154, v147, v152);
      v156 = -[CIBurstFaceStat faceId](v109, "faceId");
      -[CIBurstFaceStat faceRect](v109, "faceRect");
      v158 = v157;
      -[CIBurstFaceStat faceRect](v109, "faceRect");
      v160 = v159;
      -[CIBurstFaceStat faceRect](v109, "faceRect");
      v162 = v161;
      -[CIBurstFaceStat faceRect](v109, "faceRect");
      BurstLoggingMessage("face %d: rect = %.3f,%.3f,%.3f,%.3f, leftOpen=%d,rightOpen=%d\n", v156, v158, v160, v162, v163, -[CIBurstFaceStat leftEyeOpen](v109, "leftEyeOpen"), -[CIBurstFaceStat rightEyeOpen](v109, "rightEyeOpen"));
    }
  }
  BurstLoggingMessage("  #faces = %d\n", objc_msgSend(v177, "count"));
  if (-[CIBurstImageFaceAnalysisContext version](v174, "version") <= 1
    && objc_msgSend((id)objc_msgSend(v178, "faceStatArray"), "count"))
  {
    v164 = 0;
    v165 = 0;
    do
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v178, "faceStatArray"), "objectAtIndex:", v164), "foundByFaceCore") & 1) == 0)
      {
        objc_msgSend((id)objc_msgSend(v178, "faceStatArray"), "removeObjectAtIndex:", v164);
        --v165;
      }
      v164 = ++v165;
    }
    while (objc_msgSend((id)objc_msgSend(v178, "faceStatArray"), "count") > (unint64_t)v165);
  }
  return objc_msgSend(v177, "count");
}

uint64_t __62__CIBurstImageFaceAnalysisContext_findFacesInImage_imageStat___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t result;
  int v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  if (a2)
  {
    objc_msgSend(a2, "face");
    objc_msgSend(a2, "face");
    v6 = *(double *)&v39 * *((double *)&v36 + 1);
    if (a3)
      goto LABEL_3;
LABEL_6:
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = 0.0;
    if (a2)
      goto LABEL_4;
    goto LABEL_7;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = 0.0;
  if (!a3)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(a3, "face");
  objc_msgSend(a3, "face");
  v7 = *(double *)&v33 * *((double *)&v30 + 1);
  if (a2)
  {
LABEL_4:
    objc_msgSend(a2, "face");
    v9 = *((double *)&v26 + 1);
    v8 = *(double *)&v26;
    v11 = *((double *)&v27 + 1);
    v10 = *(double *)&v27;
    goto LABEL_8;
  }
LABEL_7:
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v11 = 0.0;
  v10 = 0.0;
  v9 = 0.0;
  v8 = 0.0;
LABEL_8:
  v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "findOverlappingFaceStat:imageStat:", *(_QWORD *)(a1 + 40), v8 + *(double *)(a1 + 48), v9 + *(double *)(a1 + 56), v10, v11);
  if (a3)
  {
    objc_msgSend(a3, "face");
    v14 = *((double *)&v23 + 1);
    v13 = *(double *)&v23;
    v16 = *((double *)&v24 + 1);
    v15 = *(double *)&v24;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    v16 = 0.0;
    v15 = 0.0;
    v14 = 0.0;
    v13 = 0.0;
  }
  v17 = objc_msgSend(*(id *)(a1 + 32), "findOverlappingFaceStat:imageStat:", *(_QWORD *)(a1 + 40), v13 + *(double *)(a1 + 48), v14 + *(double *)(a1 + 56), v15, v16, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33,
          v34,
          v35,
          v36,
          v37,
          v38,
          v39);
  v18 = (void *)v17;
  if (v12 && !v17)
    return -1;
  if (v17 && !v12)
    return 1;
  if (v12 && v17)
  {
    if (objc_msgSend(v12, "hasLeftEye"))
      v20 = objc_msgSend(v12, "hasRightEye");
    else
      v20 = 0;
    if ((objc_msgSend(v18, "hasLeftEye") & 1) != 0)
    {
      v21 = objc_msgSend(v18, "hasRightEye");
      if (v21 | v20 ^ 1)
        result = 1;
      else
        result = -1;
      if (v21)
      {
        if ((v20 & 1) == 0)
          return result;
      }
      else if ((v20 & 1) != 0)
      {
        return result;
      }
    }
    else if ((v20 & 1) != 0)
    {
      return -1;
    }
  }
  if (v6 <= v7)
    return 1;
  else
    return -1;
}

- (void)calculateFaceFocusInImage:(id)a3 imageStat:(id)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  int height;
  int v26;
  uint64_t x;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int width;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  unint64_t v46;
  void *v47;
  void *v48;
  double v49;
  int v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  double v55;
  int v56;
  int v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  if (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
  {
    BurstLoggingMessage("calculateFaceFocus:\n");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"));
    if (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v7);
        memset(&v58, 0, sizeof(v58));
        if (objc_msgSend(v8, "hasLeftEye") && objc_msgSend(v8, "hasRightEye"))
        {
          objc_msgSend(v8, "leftEyeRect");
          v10 = v9;
          v12 = v11;
          v14 = v13;
          v16 = v15;
          objc_msgSend(v8, "rightEyeRect");
          v62.origin.x = v17;
          v62.origin.y = v18;
          v62.size.width = v19;
          v62.size.height = v20;
          v59.origin.x = v10;
          v59.origin.y = v12;
          v59.size.width = v14;
          v59.size.height = v16;
          v60 = CGRectUnion(v59, v62);
        }
        else if (objc_msgSend(v8, "hasLeftEye"))
        {
          objc_msgSend(v8, "leftEyeRect");
        }
        else if (objc_msgSend(v8, "hasRightEye"))
        {
          objc_msgSend(v8, "rightEyeRect");
        }
        else
        {
          objc_msgSend(v8, "faceRect");
        }
        v58.origin.x = (double)(int)v60.origin.x;
        v58.origin.y = (double)(int)v60.origin.y;
        v58.size.width = (double)(int)v60.size.width;
        v58.size.height = (double)(int)v60.size.height;
        v21 = (double)(int)(objc_msgSend(a3, "width") - 2);
        v63.size.height = (double)(int)(objc_msgSend(a3, "height") - 2);
        v63.origin.x = 1.0;
        v63.origin.y = 1.0;
        v63.size.width = v21;
        v61 = CGRectIntersection(v58, v63);
        v58 = v61;
        BurstLoggingMessage("   adding rect: %.3f,%.3f,%.3f,%.3f\n", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v58, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
        ++v7;
      }
      while (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count") > v7);
    }
    v57 = objc_msgSend(a3, "height");
    v56 = objc_msgSend(a3, "bytesPerRow");
    v22 = (char *)malloc_type_malloc(v56 * v57, 0x100004077774924uLL);
    if (objc_msgSend(v6, "count"))
    {
      v23 = 0;
      do
      {
        memset(&v58, 0, sizeof(v58));
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v23), "getValue:", &v58);
        v58.origin.y = (double)v57 - v58.origin.y - v58.size.height;
        v24 = objc_msgSend(a3, "Ybuffer");
        height = (int)v58.size.height;
        if ((int)v58.size.height >= 1)
        {
          v26 = 0;
          x = (int)v58.origin.x;
          v28 = &v22[v56 * (uint64_t)(int)v58.origin.y + x];
          v29 = v24 + v56 * (uint64_t)(int)v58.origin.y;
          v30 = x + v56 * (uint64_t)(int)v58.origin.y;
          v31 = v24 + ~v56 + v30;
          v32 = v24 + 1 - v56 + v30;
          v33 = v24 + v56 + v30;
          v34 = v24 + v56 - 1 + v30;
          v35 = v24 + v56 + 1 + v30;
          v36 = v24 - v56 + v30;
          width = (int)v58.size.width;
          do
          {
            if (width >= 1)
            {
              v38 = 0;
              do
              {
                v39 = *(unsigned __int8 *)(v31 + v38);
                v40 = *(unsigned __int8 *)(v32 + v38);
                v41 = *(unsigned __int8 *)(v34 + v38);
                v42 = *(unsigned __int8 *)(v35 + v38);
                v43 = 3 * (v41 - v42 + v39 - v40)
                    + 10 * (*(unsigned __int8 *)(v29 + x + v38 - 1) - *(unsigned __int8 *)(v29 + x + v38 + 1));
                v44 = 3 * (v40 - v42 + v39 - v41)
                    + 10 * (*(unsigned __int8 *)(v36 + v38) - *(unsigned __int8 *)(v33 + v38));
                v45 = (v43 * v43 + v44 * v44) >> 11;
                if (v45 >= 0xFF)
                  LOBYTE(v45) = -1;
                v28[v38++] = v45;
              }
              while ((int)v38 < width);
            }
            ++v26;
            v28 += v56;
            v31 += v56;
            v32 += v56;
            v33 += v56;
            v29 += v56;
            v34 += v56;
            v35 += v56;
            v36 += v56;
          }
          while (v26 < height);
        }
        ++v23;
      }
      while (objc_msgSend(v6, "count") > v23);
    }
    if (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count"))
    {
      v46 = 0;
      do
      {
        v47 = (void *)objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "objectAtIndex:", v46);
        v48 = (void *)objc_msgSend(v6, "objectAtIndex:", v46);
        memset(&v58, 0, sizeof(v58));
        objc_msgSend(v48, "getValue:", &v58);
        v49 = (double)v57 - v58.origin.y - v58.size.height;
        v58.origin.y = v49;
        if ((int)v58.size.height < 1)
        {
          v51 = 0;
        }
        else
        {
          v50 = 0;
          v51 = 0;
          v52 = (uint64_t)&v22[v56 * (uint64_t)(int)v49 + (int)v58.origin.x];
          v53 = (int)v58.size.width;
          do
          {
            if (v53 >= 1)
            {
              v54 = 0;
              do
                v51 += *(unsigned __int8 *)(v52 + v54++);
              while (v53 != (_DWORD)v54);
            }
            ++v50;
            v52 += v56;
          }
          while (v50 != (int)v58.size.height);
        }
        BurstLoggingMessage("   focusScore = %d, %.3f\n", v51, v58.size.height * v58.size.width);
        v55 = (double)v51 / (v58.size.width * v58.size.height);
        *(float *)&v55 = v55;
        objc_msgSend(v47, "setFocusScore:", v55);
        ++v46;
      }
      while (objc_msgSend((id)objc_msgSend(a4, "faceStatArray"), "count") > v46);
    }
    free(v22);
  }
}

- (void)calcFaceScores:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CIBurstFaceScoreEntry *v12;
  CIBurstFaceScoreEntry *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  double v22;
  float v23;
  float v24;
  float v25;
  double v26;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  if (objc_msgSend(a3, "count"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v5), "burstImages"), "objectAtIndex:", 0);
      if (objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "count"))
      {
        v7 = 0;
        do
        {
          v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "objectAtIndex:", v7);
          v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "faceId"));
          v10 = objc_msgSend(v4, "objectForKey:", v9);
          if (v10)
          {
            v11 = (void *)v10;
            objc_msgSend(v8, "focusScore");
            objc_msgSend(v11, "addScore:");
          }
          else
          {
            v12 = [CIBurstFaceScoreEntry alloc];
            objc_msgSend(v8, "focusScore");
            v13 = -[CIBurstFaceScoreEntry initWithScore:](v12, "initWithScore:");
            objc_msgSend(v4, "setObject:forKey:", v13, v9);

          }
          ++v7;
        }
        while (objc_msgSend((id)objc_msgSend(v6, "faceStatArray"), "count") > v7);
      }
      ++v5;
    }
    while (objc_msgSend(a3, "count") > v5);
  }
  if (objc_msgSend(a3, "count"))
  {
    v14 = 0;
    do
    {
      v15 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v14), "burstImages"), "objectAtIndex:", 0);
      if (objc_msgSend((id)objc_msgSend(v15, "faceStatArray"), "count"))
      {
        v16 = 0;
        do
        {
          v17 = (void *)objc_msgSend((id)objc_msgSend(v15, "faceStatArray"), "objectAtIndex:", v16);
          v18 = (void *)objc_msgSend(v4, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "faceId")));
          objc_msgSend(v18, "computeAverage");
          v20 = v19;
          objc_msgSend(v17, "focusScore");
          *(float *)&v22 = v21 / v20;
          objc_msgSend(v17, "setNormalizedFocusScore:", v22);
          objc_msgSend(v17, "focusScore");
          v24 = v23 - v20;
          objc_msgSend(v18, "computeStandardDeviation");
          *(float *)&v26 = v24 / v25;
          objc_msgSend(v17, "setNormalizedSigma:", v26);
          ++v16;
        }
        while (objc_msgSend((id)objc_msgSend(v15, "faceStatArray"), "count") > v16);
      }
      ++v14;
    }
    while (objc_msgSend(a3, "count") > v14);
  }
}

- (void)adjustFaceIdsForImageStat:(id)a3
{
  id v3;
  void *i;
  void *v6;
  NSMutableArray *faceInfoArray;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CIBurstFaceInfo *v12;
  int v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  CIBurstFaceInfo *v20;
  float v21;
  int v22;
  float v23;
  int v24;
  uint64_t v25;
  double MidX;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  uint64_t v43;
  CIBurstFaceConfigEntry *v44;
  NSMutableDictionary *renameMapping;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSMutableDictionary *v50;
  void *v51;
  uint64_t v52;
  uint64_t faceIdCounter;
  void *v54;
  void *v55;
  CIBurstFaceConfigEntry *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CIBurstFaceConfigEntry *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  int v65;
  int v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  uint64_t v78;
  double v79;
  double MidY;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  unint64_t v88;
  unint64_t v89;
  void *v90;
  void *v91;
  unint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  unint64_t v125;
  void *v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  uint64_t v136;
  void *v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t j;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t k;
  void *v152;
  CIBurstFaceConfigEntry *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  CIBurstFaceConfigEntry *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t m;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  id v168;
  int v169;
  void *v170;
  uint64_t v171;
  id obj;
  id obja;
  void *v174;
  uint64_t v175;
  void *v176;
  id v177;
  id v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  uint64_t v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;

  v3 = a3;
  v214 = *MEMORY[0x1E0C80C00];
  BurstLoggingMessage("AdjustFaceIds: Examining '%s'\n", (const char *)objc_msgSend((id)objc_msgSend(a3, "imageId"), "UTF8String"));
  if (!objc_msgSend((id)objc_msgSend(v3, "faceStatArray"), "count"))
    return;
  v174 = v3;
  if (-[CIBurstImageFaceAnalysisContext version](self, "version") >= 2)
  {
    v205 = 0u;
    v206 = 0u;
    v203 = 0u;
    v204 = 0u;
    obj = (id)objc_msgSend(v3, "faceStatArray");
    v177 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v203, v213, 16);
    if (!v177)
      return;
    v175 = *(_QWORD *)v204;
    while (1)
    {
      for (i = 0; i != v177; i = (char *)i + 1)
      {
        if (*(_QWORD *)v204 != v175)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * (_QWORD)i);
        v199 = 0u;
        v200 = 0u;
        v201 = 0u;
        v202 = 0u;
        faceInfoArray = self->faceInfoArray;
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](faceInfoArray, "countByEnumeratingWithState:objects:count:", &v199, v212, 16);
        if (!v8)
          goto LABEL_20;
        v9 = v8;
        v10 = *(_QWORD *)v200;
LABEL_10:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v200 != v10)
            objc_enumerationMutation(faceInfoArray);
          v12 = *(CIBurstFaceInfo **)(*((_QWORD *)&v199 + 1) + 8 * v11);
          v13 = objc_msgSend(v6, "hwFaceId");
          if (v13 == -[CIBurstFaceInfo hwFaceId](v12, "hwFaceId"))
            break;
          if (v9 == ++v11)
          {
            v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](faceInfoArray, "countByEnumeratingWithState:objects:count:", &v199, v212, 16);
            if (!v9)
              goto LABEL_20;
            goto LABEL_10;
          }
        }
        if (-[CIBurstFaceInfo swFaceId](v12, "swFaceId") == -1)
        {
          ++self->faceIdCounter;
          -[CIBurstFaceInfo setSwFaceId:](v12, "setSwFaceId:");
        }
        if (v12)
          goto LABEL_44;
LABEL_20:
        v197 = 0u;
        v198 = 0u;
        v195 = 0u;
        v196 = 0u;
        v14 = self->faceInfoArray;
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v195, v211, 16);
        if (!v15)
          goto LABEL_43;
        v16 = v15;
        v17 = 0;
        v12 = 0;
        v18 = *(_QWORD *)v196;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v196 != v18)
              objc_enumerationMutation(v14);
            v20 = *(CIBurstFaceInfo **)(*((_QWORD *)&v195 + 1) + 8 * v19);
            objc_msgSend(v6, "faceRect");
            -[CIBurstFaceInfo overlapWithHwRect:](v20, "overlapWithHwRect:");
            if (v21 >= 0.25)
            {
              v22 = -[CIBurstFaceInfo hwLastFrameSeen](v20, "hwLastFrameSeen");
              if (!v12)
                goto LABEL_31;
              if (v22 > v17
                && (-[CIBurstFaceInfo hwLastFrameSeen](v20, "hwLastFrameSeen") - v17 > 3
                 || -[CIBurstFaceInfo swFaceId](v20, "swFaceId") != -1
                 || -[CIBurstFaceInfo swFaceId](v12, "swFaceId") == -1))
              {
                v22 = -[CIBurstFaceInfo hwLastFrameSeen](v20, "hwLastFrameSeen");
LABEL_31:
                v17 = v22;
                v12 = v20;
              }
            }
            objc_msgSend(v6, "faceRect");
            -[CIBurstFaceInfo overlapWithSwRect:](v20, "overlapWithSwRect:");
            if (v23 < 0.25)
              goto LABEL_37;
            v24 = -[CIBurstFaceInfo swLastFrameSeen](v20, "swLastFrameSeen");
            if (v12)
            {
              if (v24 <= v17)
                goto LABEL_37;
              v24 = -[CIBurstFaceInfo swLastFrameSeen](v20, "swLastFrameSeen");
            }
            v17 = v24;
            v12 = v20;
LABEL_37:
            ++v19;
          }
          while (v16 != v19);
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v195, v211, 16);
          v16 = v25;
        }
        while (v25);
        v3 = v174;
        if (!v12)
        {
LABEL_43:
          v12 = objc_alloc_init(CIBurstFaceInfo);
          -[NSMutableArray addObject:](self->faceInfoArray, "addObject:", v12);

        }
LABEL_44:
        if (-[CIBurstFaceInfo swFaceId](v12, "swFaceId") == -1)
        {
          ++self->faceIdCounter;
          -[CIBurstFaceInfo setSwFaceId:](v12, "setSwFaceId:");
        }
        -[CIBurstFaceInfo setSwLastFrameSeen:](v12, "setSwLastFrameSeen:", objc_msgSend(v3, "temporalOrder"));
        objc_msgSend(v6, "faceRect");
        MidX = CGRectGetMidX(v215);
        objc_msgSend(v6, "faceRect");
        -[CIBurstFaceInfo setSwCenter:](v12, "setSwCenter:", MidX, CGRectGetMidY(v216));
        objc_msgSend(v6, "faceRect");
        -[CIBurstFaceInfo setSwSize:](v12, "setSwSize:", v27, v28);
        objc_msgSend(v6, "setFaceId:", -[CIBurstFaceInfo swFaceId](v12, "swFaceId"));
      }
      v177 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v203, v213, 16);
      if (!v177)
        return;
    }
  }
  v178 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v3, "faceStatArray"), "count"));
  v176 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(v3, "faceStatArray"), "count"));
  v191 = 0u;
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  v29 = (void *)objc_msgSend(v3, "faceStatArray");
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v191, v210, 16);
  v31 = 0x1E0CB3000uLL;
  if (!v30)
    goto LABEL_67;
  v32 = v30;
  v33 = *(_QWORD *)v192;
  v34 = *MEMORY[0x1E0C9D648];
  v35 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v36 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v37 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  do
  {
    v38 = 0;
    do
    {
      if (*(_QWORD *)v192 != v33)
        objc_enumerationMutation(v29);
      v39 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v38);
      BurstLoggingMessage("faceStat.id = %d\n", objc_msgSend(v39, "faceId"));
      if (!objc_msgSend(v39, "faceId"))
      {
        faceIdCounter = self->faceIdCounter;
        self->faceIdCounter = faceIdCounter + 1;
        BurstLoggingMessage("    no id: assigning %d\n", faceIdCounter);
        v51 = v39;
        v52 = faceIdCounter;
        goto LABEL_60;
      }
      v40 = -[NSMutableDictionary objectForKey:](self->renameMapping, "objectForKey:", objc_msgSend(*(id *)(v31 + 2024), "numberWithInt:", objc_msgSend(v39, "faceId")));
      if (!v40)
        goto LABEL_58;
      v41 = (void *)v40;
      v42 = objc_msgSend(v3, "temporalOrder");
      if ((int)(v42 - objc_msgSend(v41, "framesSinceLast")) >= 41)
      {
        -[NSMutableDictionary removeObjectForKey:](self->renameMapping, "removeObjectForKey:", objc_msgSend(*(id *)(v31 + 2024), "numberWithInt:", objc_msgSend(v39, "faceId")));
LABEL_58:
        v43 = self->faceIdCounter;
        self->faceIdCounter = v43 + 1;
        BurstLoggingMessage("    new id: %d mapped to %d\n", objc_msgSend(v39, "faceId"), v43);
        v44 = -[CIBurstFaceConfigEntry initWithRect:withFaceId:]([CIBurstFaceConfigEntry alloc], "initWithRect:withFaceId:", v43, v34, v35, v36, v37);
        -[CIBurstFaceConfigEntry setFramesSinceLast:](v44, "setFramesSinceLast:", objc_msgSend(v3, "temporalOrder"));
        renameMapping = self->renameMapping;
        v46 = (void *)MEMORY[0x1E0CB37E8];
        v47 = objc_msgSend(v39, "faceId");
        v48 = v46;
        v31 = 0x1E0CB3000;
        v49 = objc_msgSend(v48, "numberWithInt:", v47);
        v50 = renameMapping;
        v3 = v174;
        -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", v44, v49);

        v51 = v39;
        v52 = v43;
LABEL_60:
        objc_msgSend(v51, "setFaceId:", v52);
        goto LABEL_61;
      }
      BurstLoggingMessage("    rename found: %d mapped to %d\n", objc_msgSend(v39, "faceId"), objc_msgSend(v41, "faceId"));
      objc_msgSend(v39, "setFaceId:", objc_msgSend(v41, "faceId"));
      objc_msgSend(v41, "setFramesSinceLast:", objc_msgSend(v3, "temporalOrder"));
LABEL_61:
      v54 = (void *)-[NSMutableDictionary objectForKey:](self->faceIdMapping, "objectForKey:", objc_msgSend(*(id *)(v31 + 2024), "numberWithInt:", objc_msgSend(v39, "faceId")));
      if (v54)
      {
        v55 = v54;
        BurstLoggingMessage("    map found: %d maps to %d\n", objc_msgSend(v39, "faceId"), objc_msgSend(v54, "intValue"));
        objc_msgSend(v39, "setFaceId:", objc_msgSend(v55, "intValue"));
        objc_msgSend(v176, "setObject:forKey:", objc_msgSend(*(id *)(v31 + 2024), "numberWithInt:", objc_msgSend(v39, "faceId")), objc_msgSend(*(id *)(v31 + 2024), "numberWithInt:", objc_msgSend(v39, "faceId")));
      }
      v56 = [CIBurstFaceConfigEntry alloc];
      objc_msgSend(v39, "faceRect");
      v61 = -[CIBurstFaceConfigEntry initWithRect:withFaceId:](v56, "initWithRect:withFaceId:", objc_msgSend(v39, "faceId"), v57, v58, v59, v60);
      objc_msgSend(v178, "addObject:", v61);

      ++v38;
    }
    while (v32 != v38);
    v62 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v191, v210, 16);
    v32 = v62;
  }
  while (v62);
LABEL_67:
  v170 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->curConfig, "count"));
  objc_msgSend(v170, "addEntriesFromDictionary:", self->curConfig);
  v63 = v178;
  if (objc_msgSend(v178, "count"))
  {
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0.0;
    v68 = 0.0;
    v69 = 0.0;
    v70 = 0.0;
    while (1)
    {
      v71 = (void *)objc_msgSend(v63, "objectAtIndex:", v64);
      v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v71, "faceId"));
      v73 = objc_msgSend(v176, "objectForKey:", v72);
      v74 = 1.0;
      if (v73)
      {
        v75 = 1.0;
      }
      else
      {
        v76 = (void *)objc_msgSend(v170, "objectForKey:", v72, 1.0);
        if (!v76)
        {
          v3 = v174;
          v63 = v178;
          goto LABEL_74;
        }
        v77 = v76;
        v78 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v76, "faceId"));
        objc_msgSend(v176, "setObject:forKey:", v78, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v71, "faceId")));
        BurstLoggingMessage("       entry exists with same id: %d\n", objc_msgSend(v77, "faceId"));
        objc_msgSend(v71, "faceRect");
        v79 = CGRectGetMidX(v217);
        objc_msgSend(v71, "faceRect");
        MidY = CGRectGetMidY(v218);
        objc_msgSend(v77, "faceRect");
        v81 = CGRectGetMidX(v219);
        objc_msgSend(v77, "faceRect");
        v67 = v67 + v79 - v81;
        v68 = v68 + MidY - CGRectGetMidY(v220);
        objc_msgSend(v71, "faceRect");
        v83 = v82;
        objc_msgSend(v77, "faceRect");
        v75 = v83 / v84;
        objc_msgSend(v71, "faceRect");
        v86 = v85;
        objc_msgSend(v77, "faceRect");
        v74 = v86 / v87;
        v3 = v174;
      }
      v69 = v69 + v75;
      v70 = v70 + v74;
      ++v65;
      v63 = v178;
      objc_msgSend(v178, "removeObjectAtIndex:", v64);
      --v66;
      objc_msgSend(v170, "removeObjectForKey:", v72);
LABEL_74:
      v64 = ++v66;
      if (objc_msgSend(v63, "count") <= (unint64_t)v66)
        goto LABEL_78;
    }
  }
  v65 = 0;
  v70 = 0.0;
  v69 = 0.0;
  v68 = 0.0;
  v67 = 0.0;
LABEL_78:
  BurstLoggingMessage("%d faces so far unmatched:\n", objc_msgSend(v63, "count"));
  if (objc_msgSend(v63, "count"))
  {
    v88 = 0;
    do
      BurstLoggingMessage("    face %d\n", objc_msgSend((id)objc_msgSend(v63, "objectAtIndex:", v88++), "faceId"));
    while (objc_msgSend(v63, "count") > v88);
  }
  v89 = 0x1E0CB3000;
  v90 = v170;
  if (objc_msgSend(v63, "count"))
  {
    if (v65 <= 0)
    {
      if (objc_msgSend(v178, "count"))
      {
        v118 = 0;
        v169 = 0;
        v119 = 0;
        while (1)
        {
          v166 = v118;
          v120 = (void *)objc_msgSend(v90, "allKeys");
          BurstLoggingMessage("  prevConfig has %d entries\n", objc_msgSend(v120, "count"));
          v167 = v120;
          if (objc_msgSend(v120, "count"))
          {
            v121 = 0;
            v168 = v119;
            v122 = v178;
            do
            {
              v171 = v121;
              v123 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v122);
              v124 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v90);
              obja = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v122, "count"));
              if (objc_msgSend(v123, "count"))
              {
                v125 = 0;
                do
                {
                  v126 = (void *)objc_msgSend(v123, "objectAtIndex:", v125);
                  objc_msgSend(v126, "faceRect");
                  v128 = v127;
                  v130 = v129;
                  v132 = v131;
                  v134 = v133;
                  v135 = (void *)objc_msgSend(v124, "allKeys");
                  if (objc_msgSend(v135, "count"))
                  {
                    v136 = 0;
                    while (1)
                    {
                      v137 = (void *)objc_msgSend(v124, "objectForKey:", objc_msgSend(v135, "objectAtIndex:", v136));
                      objc_msgSend(v137, "faceRect");
                      v226.origin.x = v128;
                      v226.origin.y = v130;
                      v226.size.width = v132;
                      v226.size.height = v134;
                      v224 = CGRectIntersection(v223, v226);
                      v138 = v224.size.width * v224.size.height;
                      if (v224.size.width * v224.size.height >= v132 * v134 * 0.5)
                        break;
                      if (objc_msgSend(v135, "count", v138, v224.origin.y) <= (unint64_t)++v136)
                        goto LABEL_105;
                    }
                    v139 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v137, "faceId", v138, v224.origin.y));
                    objc_msgSend(obja, "setObject:forKey:", v139, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v126, "faceId")));
                    objc_msgSend(v124, "removeObjectForKey:", objc_msgSend(v135, "objectAtIndex:", v136));
                  }
LABEL_105:
                  ++v125;
                }
                while (objc_msgSend(v123, "count") > v125);
              }
              v119 = obja;
              v90 = v170;
              v122 = v178;
              if (objc_msgSend(obja, "count") > (unint64_t)v169)
              {
                v168 = obja;
                v169 = objc_msgSend(obja, "count");
                if (objc_msgSend((id)objc_msgSend(v174, "faceStatArray"), "count") == v169)
                  break;
              }
              v121 = v171 + 1;
              v119 = v168;
            }
            while (objc_msgSend(v167, "count") > (unint64_t)(v171 + 1));
          }
          else
          {
            v122 = v178;
          }
          v3 = v174;
          if (objc_msgSend((id)objc_msgSend(v174, "faceStatArray"), "count") == v169)
            break;
          v118 = v166 + 1;
          v89 = 0x1E0CB3000;
          if (objc_msgSend(v122, "count") <= (unint64_t)(v166 + 1))
            goto LABEL_115;
        }
        BurstLoggingMessage("Found mapping!\n");
        v89 = 0x1E0CB3000uLL;
LABEL_115:
        if (v169 >= 1)
        {
          if (objc_msgSend(v178, "count"))
          {
            v140 = 0;
            v141 = 0;
            do
            {
              if (objc_msgSend(v119, "objectForKey:", objc_msgSend(*(id *)(v89 + 2024), "numberWithInt:", objc_msgSend((id)objc_msgSend(v178, "objectAtIndex:", v140), "faceId"))))
              {
                objc_msgSend(v178, "removeObjectAtIndex:", v140);
                --v141;
              }
              v140 = ++v141;
            }
            while (objc_msgSend(v178, "count") > (unint64_t)v141);
          }
          objc_msgSend(v176, "addEntriesFromDictionary:", v119);
        }
      }
      v189 = 0u;
      v190 = 0u;
      v187 = 0u;
      v188 = 0u;
      v142 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v187, v209, 16);
      if (v142)
      {
        v143 = v142;
        v144 = *(_QWORD *)v188;
        do
        {
          for (j = 0; j != v143; ++j)
          {
            if (*(_QWORD *)v188 != v144)
              objc_enumerationMutation(v178);
            v146 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * j);
            objc_msgSend(v176, "setObject:forKey:", objc_msgSend(*(id *)(v89 + 2024), "numberWithInt:", objc_msgSend(v146, "faceId")), objc_msgSend(*(id *)(v89 + 2024), "numberWithInt:", objc_msgSend(v146, "faceId")));
            BurstLoggingMessage("   mapping not found for %d, mapping to itself\n", objc_msgSend(v146, "faceId"));
          }
          v143 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v187, v209, 16);
        }
        while (v143);
      }
    }
    else
    {
      v91 = v178;
      if (objc_msgSend(v178, "count"))
      {
        v92 = 0;
        v93 = (float)(1.0 / (float)v65);
        v94 = v67 * v93;
        v95 = v68 * v93;
        v96 = v69 * v93;
        v97 = v70 * v93;
        do
        {
          v98 = (void *)objc_msgSend(v91, "objectAtIndex:", v92);
          v99 = (void *)objc_msgSend(v90, "allKeys");
          if (objc_msgSend(v99, "count"))
          {
            v100 = 0;
            while (1)
            {
              v101 = (void *)objc_msgSend(v90, "objectForKey:", objc_msgSend(v99, "objectAtIndex:", v100));
              objc_msgSend(v98, "faceRect");
              v103 = v94 + v102;
              v105 = v95 + v104;
              v107 = v96 * v106;
              v109 = v97 * v108;
              objc_msgSend(v98, "faceRect");
              v225.origin.x = v110;
              v225.origin.y = v111;
              v225.size.width = v112;
              v225.size.height = v113;
              v221.origin.x = v103;
              v221.origin.y = v105;
              v221.size.width = v107;
              v221.size.height = v109;
              v222 = CGRectIntersection(v221, v225);
              *(float *)&v103 = v222.size.width * v222.size.height;
              BurstLoggingMessage("    %d overlaps with %d by %.3f %% : ", objc_msgSend(v101, "faceId"), objc_msgSend(v98, "faceId"), (float)(*(float *)&v103 * 100.0) / (v107 * v109));
              v114 = *(float *)&v103;
              v115 = v107 * v109 * 0.5;
              if (v115 <= *(float *)&v103)
                break;
              BurstLoggingMessage("    not matched\n", v114, v115);
              if (objc_msgSend(v99, "count") <= (unint64_t)++v100)
                goto LABEL_89;
            }
            BurstLoggingMessage("    matched!  mapping %d to %d\n", objc_msgSend(v98, "faceId", v114, v115), objc_msgSend(v101, "faceId"));
            v117 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v101, "faceId"));
            v90 = v170;
            objc_msgSend(v176, "setObject:forKey:", v117, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v98, "faceId")));
            objc_msgSend(v170, "removeObjectForKey:", objc_msgSend(v99, "objectAtIndex:", v100));
          }
          else
          {
LABEL_89:
            BurstLoggingMessage("      no match found for id %d - adding face\n", objc_msgSend(v98, "faceId"));
            v116 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v98, "faceId"));
            objc_msgSend(v176, "setObject:forKey:", v116, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v98, "faceId")));
          }
          ++v92;
          v91 = v178;
          v3 = v174;
        }
        while (objc_msgSend(v178, "count") > v92);
      }
    }
  }
  -[NSMutableDictionary addEntriesFromDictionary:](self->faceIdMapping, "addEntriesFromDictionary:", v176);
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v147 = (void *)objc_msgSend(v3, "faceStatArray");
  v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v183, v208, 16);
  if (v148)
  {
    v149 = v148;
    v150 = *(_QWORD *)v184;
    do
    {
      for (k = 0; k != v149; ++k)
      {
        if (*(_QWORD *)v184 != v150)
          objc_enumerationMutation(v147);
        v152 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * k);
        objc_msgSend(v152, "setFaceId:", objc_msgSend((id)objc_msgSend(v176, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v152, "faceId"))), "intValue"));
        v153 = [CIBurstFaceConfigEntry alloc];
        objc_msgSend(v152, "faceRect");
        v158 = -[CIBurstFaceConfigEntry initWithRect:withFaceId:](v153, "initWithRect:withFaceId:", objc_msgSend(v152, "faceId"), v154, v155, v156, v157);
        -[NSMutableDictionary setObject:forKey:](self->curConfig, "setObject:forKey:", v158, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v152, "faceId")));

      }
      v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v183, v208, 16);
    }
    while (v149);
  }
  v159 = (void *)-[NSMutableDictionary allKeys](self->curConfig, "allKeys");
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  v182 = 0u;
  v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v179, v207, 16);
  if (v160)
  {
    v161 = v160;
    v162 = *(_QWORD *)v180;
    do
    {
      for (m = 0; m != v161; ++m)
      {
        if (*(_QWORD *)v180 != v162)
          objc_enumerationMutation(v159);
        v164 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * m);
        v165 = (void *)-[NSMutableDictionary objectForKey:](self->curConfig, "objectForKey:", v164);
        objc_msgSend(v165, "setFramesSinceLast:", objc_msgSend(v165, "framesSinceLast") + 1);
        if ((int)objc_msgSend(v165, "framesSinceLast") >= 4)
        {
          BurstLoggingMessage("removing config entry: %d\n", objc_msgSend(v165, "faceId"));
          -[NSMutableDictionary removeObjectForKey:](self->curConfig, "removeObjectForKey:", v164);
        }
      }
      v161 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v179, v207, 16);
    }
    while (v161);
  }
}

- (void)addFaceToArray:(id)a3
{
  const __CFDictionary *v5;
  double Seconds;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  double v16;
  void *v17;
  uint64_t v18;
  const __CFDictionary *v19;
  void *v20;
  CGFloat MidX;
  void *v22;
  CGFloat MidY;
  double v24;
  double v25;
  double latestFaceTimestamp;
  CGRect v27;
  CMTime time;

  v5 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("Timestamp"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memset(&v27, 0, 24);
    CMTimeMakeFromDictionary((CMTime *)&v27, v5);
    *(CGPoint *)&time.value = v27.origin;
    time.epoch = *(_QWORD *)&v27.size.width;
    Seconds = CMTimeGetSeconds(&time);
LABEL_5:
    v7 = Seconds;
    goto LABEL_6;
  }
  objc_opt_class();
  v7 = -1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[__CFDictionary unsignedLongLongValue](v5, "unsignedLongLongValue");
    Seconds = timestampToSeconds(v8, v9, v10, v11);
    goto LABEL_5;
  }
LABEL_6:
  BurstLoggingMessage("  face ID = %d, timestamp = %.6f\n", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("FaceID")), "intValue"), v7);
  v12 = -[NSMutableArray count](self->faceTimestampArray, "count");
  v13 = v12 & (v12 >> 31);
  v14 = v12 - 1;
  while (1)
  {
    v15 = __OFSUB__(v12--, 1);
    if (v12 < 0 != v15)
      break;
    objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->faceTimestampArray, "objectAtIndex:", v14--), "objectForKey:", CFSTR("Timestamp")), "doubleValue");
    if (v7 >= v16)
    {
      v13 = v12 + 1;
      break;
    }
  }
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7), CFSTR("Timestamp"));
  v18 = objc_msgSend(v17, "objectForKey:", CFSTR("Rect"));
  if (v18)
  {
    v19 = (const __CFDictionary *)v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(&v27, 0, sizeof(v27));
      if (CGRectMakeWithDictionaryRepresentation(v19, &v27))
      {
        v20 = (void *)MEMORY[0x1E0CB37E8];
        MidX = CGRectGetMidX(v27);
        *(float *)&MidX = MidX;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v20, "numberWithFloat:", MidX), CFSTR("X"));
        v22 = (void *)MEMORY[0x1E0CB37E8];
        MidY = CGRectGetMidY(v27);
        *(float *)&MidY = MidY;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v22, "numberWithFloat:", MidY), CFSTR("Y"));
        HIDWORD(v24) = HIDWORD(v27.size.width);
        *(float *)&v24 = v27.size.width;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24), CFSTR("Width"));
        HIDWORD(v25) = HIDWORD(v27.size.height);
        *(float *)&v25 = v27.size.height;
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25), CFSTR("Height"));
        objc_msgSend(v17, "removeObjectForKey:", CFSTR("Rect"));
      }
    }
  }
  -[NSMutableArray insertObject:atIndex:](self->faceTimestampArray, "insertObject:atIndex:", v17, v13);
  BurstLoggingMessage("    inserting at index %d, count=%d\n", v13, objc_msgSend(v17, "count"));
  latestFaceTimestamp = self->latestFaceTimestamp;
  if (v7 > latestFaceTimestamp)
    latestFaceTimestamp = v7;
  self->latestFaceTimestamp = latestFaceTimestamp;
}

- (void)extractFacesFromMetadata:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  Float64 latestFaceTimestamp;
  CMTime time;
  CMTime v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  BurstLoggingMessage("  extractFacesFromMetadata\n", a2);
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BurstLoggingMessage("extractFaceMetadata: invalid properties\n");
    return;
  }
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AccumulatedFaceMetadata"));
  BurstLoggingMessage("  accumulatedFaceMetadata = %x\n", (_DWORD)v5);
  if (v5)
  {
    BurstLoggingMessage("adding %d faces\n", objc_msgSend(v5, "count"));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          -[CIBurstImageFaceAnalysisContext addFaceToArray:](self, "addFaceToArray:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }
    goto LABEL_27;
  }
  v10 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  if (v10)
  {
    v11 = (void *)v10;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v13 = *MEMORY[0x1E0CBCA28];
    if ((isKindOfClass & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CBCA28]);
      if (v14)
      {
LABEL_19:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = objc_msgSend(v14, "objectForKey:", CFSTR("Regions"));
          if (v15)
          {
            v16 = (void *)v15;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              BurstLoggingMessage("regions exist\n");
              v17 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("RegionList"));
              if (v17)
              {
                v18 = v17;
                if (objc_msgSend(v17, "count"))
                {
                  BurstLoggingMessage("  num regions = %d\n", objc_msgSend(v18, "count"));
                  if (objc_msgSend(v18, "count"))
                  {
                    v19 = 0;
                    do
                      -[CIBurstImageFaceAnalysisContext addFaceToArray:](self, "addFaceToArray:", objc_msgSend(v18, "objectAtIndex:", v19++));
                    while (objc_msgSend(v18, "count") > v19);
                  }
                }
              }
            }
          }
        }
        goto LABEL_27;
      }
    }
  }
  else
  {
    v13 = *MEMORY[0x1E0CBCA28];
  }
  v14 = (void *)objc_msgSend(a3, "objectForKey:", v13);
  if (v14)
    goto LABEL_19;
LABEL_27:
  v20 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CBCF70]);
  if (v20)
  {
    v21 = (void *)v20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (const __CFDictionary *)objc_msgSend(v21, "objectForKey:", CFSTR("3"));
      if (v22)
      {
        memset(&v25, 0, sizeof(v25));
        CMTimeMakeFromDictionary(&v25, v22);
        time = v25;
        latestFaceTimestamp = CMTimeGetSeconds(&time) + -0.100000001;
        if (self->latestFaceTimestamp > latestFaceTimestamp)
          latestFaceTimestamp = self->latestFaceTimestamp;
        self->latestFaceTimestamp = latestFaceTimestamp;
      }
    }
  }
  BurstLoggingMessage("    latestFaceTimestamp = %.6f\n", self->latestFaceTimestamp);
}

- (void)addFacesToImageStat:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  void *v10;
  unint64_t lastFaceIndex;
  double v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  double v17;
  double v18;
  CIBurstFaceStat *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  _BOOL8 v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  _BOOL8 v47;
  double MidX;
  double MidY;
  double v50;
  double v51;
  double v52;
  float v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  float v60;
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
  int v102;
  double v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t i;
  void *v110;
  double v111;
  float v112;
  int v113;
  double v114;
  int v115;
  double v116;
  float v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  float v126;
  double v127;
  double v128;
  double v129;
  double v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  uint64_t v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  height = a4.height;
  width = a4.width;
  v136 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "timestamp");
  v9 = v8;
  BurstLoggingMessage("addFacesToImageStat: timestamp = %.6f, lastFaceIndex=%d\n", v8, self->lastFaceIndex);
  if (v9 <= self->latestFaceTimestamp)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    lastFaceIndex = self->lastFaceIndex;
    if (-[NSMutableArray count](self->faceTimestampArray, "count") > lastFaceIndex)
    {
      v12 = v9 + 0.0160000008;
      v13 = width;
      v14 = height;
      v15 = v13;
      v126 = v14;
      v124 = *MEMORY[0x1E0C9D648];
      v125 = v14;
      v122 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v123 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v121 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v117 = v13;
      do
      {
        v16 = (void *)-[NSMutableArray objectAtIndex:](self->faceTimestampArray, "objectAtIndex:", self->lastFaceIndex);
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("Timestamp")), "doubleValue");
        if (v17 > v12)
          break;
        v18 = v17;
        v19 = objc_alloc_init(CIBurstFaceStat);
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("Width")), "floatValue");
        v21 = v20;
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("Height")), "floatValue");
        v23 = v22;
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("X")), "floatValue");
        v25 = v24;
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("Y")), "floatValue");
        v27 = v26;
        -[CIBurstFaceStat setFaceId:](v19, "setFaceId:", objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("FaceID")), "intValue"));
        v129 = v27;
        v130 = v25;
        v127 = v23;
        v128 = v21;
        -[CIBurstFaceStat setNormalizedFaceRect:](v19, "setNormalizedFaceRect:");
        -[CIBurstFaceStat setTimestamp:](v19, "setTimestamp:", v18);
        v28 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("RollAngle"));
        v29 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("YawAngle"));
        if (v28)
        {
          -[CIBurstFaceStat setHasRollAngle:](v19, "setHasRollAngle:", 1);
          objc_msgSend(v28, "floatValue");
          -[CIBurstFaceStat setRollAngle:](v19, "setRollAngle:");
        }
        else
        {
          -[CIBurstFaceStat setHasRollAngle:](v19, "setHasRollAngle:", 0);
        }
        if (v29)
        {
          -[CIBurstFaceStat setHasYawAngle:](v19, "setHasYawAngle:", 1);
          objc_msgSend(v29, "floatValue");
          -[CIBurstFaceStat setYawAngle:](v19, "setYawAngle:");
        }
        else
        {
          -[CIBurstFaceStat setHasYawAngle:](v19, "setHasYawAngle:", 0);
        }
        -[CIBurstFaceStat setFaceRect:](v19, "setFaceRect:", (float)((float)(v25 - (float)(v21 * 0.5)) * v15), v125 - (float)((float)(v27 - (float)(v23 * 0.5)) * v126) - (float)(v23 * v126), (float)(v21 * v15));
        objc_msgSend(v10, "setObject:forKey:", v19, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIBurstFaceStat faceId](v19, "faceId")));

        -[CIBurstFaceStat setFramesSinceLast:](v19, "setFramesSinceLast:", 0);
        if (objc_msgSend(v16, "objectForKey:", CFSTR("LeftEyeX")))
        {
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("LeftEyeX")), "floatValue");
          v31 = v30;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("LeftEyeY")), "floatValue");
          v33 = v32;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("LeftEyeWidth")), "floatValue");
          v35 = v34;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("LeftEyeHeight")), "floatValue");
          v37 = v36;
          v38 = v36 > 0.0 && v35 > 0.0;
          -[CIBurstFaceStat setHasLeftEye:](v19, "setHasLeftEye:", v38);
          if (-[CIBurstFaceStat hasLeftEye](v19, "hasLeftEye"))
          {
            -[CIBurstFaceStat setLeftEyeRect:](v19, "setLeftEyeRect:", (float)((float)(v31 - (float)(v35 * 0.5)) * v15), (float)((float)(v33 - (float)(v37 * 0.5)) * v126), (float)(v35 * v15), (float)(v37 * v126));
            objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("LeftEyeBlinkLevel")), "floatValue");
            -[CIBurstFaceStat setLeftEyeBlinkScore:](v19, "setLeftEyeBlinkScore:");
          }
        }
        else
        {
          -[CIBurstFaceStat setLeftEyeRect:](v19, "setLeftEyeRect:", v124, v123, v122, v121);
          -[CIBurstFaceStat setHasLeftEye:](v19, "setHasLeftEye:", 0);
        }
        if (objc_msgSend(v16, "objectForKey:", CFSTR("RightEyeX")))
        {
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("RightEyeX")), "floatValue");
          v40 = v39;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("RightEyeY")), "floatValue");
          v42 = v41;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("RightEyeWidth")), "floatValue");
          v44 = v43;
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("RightEyeHeight")), "floatValue");
          v46 = v45;
          v47 = v45 > 0.0 && v44 > 0.0;
          -[CIBurstFaceStat setHasRightEye:](v19, "setHasRightEye:", v47);
          if (-[CIBurstFaceStat hasRightEye](v19, "hasRightEye"))
          {
            -[CIBurstFaceStat setRightEyeRect:](v19, "setRightEyeRect:", (float)((float)(v40 - (float)(v44 * 0.5)) * v15), (float)((float)(v42 - (float)(v46 * 0.5)) * v126), (float)(v44 * v15), (float)(v46 * v126));
            objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("RightEyeBlinkLevel")), "floatValue");
            -[CIBurstFaceStat setRightEyeBlinkScore:](v19, "setRightEyeBlinkScore:");
          }
        }
        else
        {
          -[CIBurstFaceStat setRightEyeRect:](v19, "setRightEyeRect:", v124, v123, v122, v121);
          -[CIBurstFaceStat setHasRightEye:](v19, "setHasRightEye:", 0);
        }
        if (-[CIBurstFaceStat hasLeftEye](v19, "hasLeftEye") && -[CIBurstFaceStat hasRightEye](v19, "hasRightEye"))
        {
          -[CIBurstFaceStat leftEyeRect](v19, "leftEyeRect");
          MidX = CGRectGetMidX(v137);
          -[CIBurstFaceStat leftEyeRect](v19, "leftEyeRect");
          MidY = CGRectGetMidY(v138);
          -[CIBurstFaceStat rightEyeRect](v19, "rightEyeRect");
          v50 = CGRectGetMidX(v139);
          -[CIBurstFaceStat rightEyeRect](v19, "rightEyeRect");
          v119 = CGRectGetMidY(v140);
          v120 = v50;
          v51 = v50 - MidX;
          v52 = v119 - MidX;
          v53 = sqrt(v52 * v52 + v51 * v51);
          v54 = 0.0;
          v55 = 0.0;
          if (v53 >= 0.01)
          {
            v56 = (float)(1.0 / v53);
            v55 = v51 * v56;
            v54 = v52 * v56;
          }
          -[CIBurstFaceStat faceRect](v19, "faceRect");
          v58 = v57;
          -[CIBurstFaceStat faceRect](v19, "faceRect");
          v60 = (v58 + v59) * 0.5;
          v61 = (float)((float)(v60 * 0.3) * 0.5);
          v62 = (float)((float)(v60 * 0.2) * 0.5);
          v63 = MidX - v61 * v55;
          v64 = v63 - v62 * v54;
          v65 = MidY - v61 * v54;
          v66 = v65 - v62 * v55;
          v67 = v63 + v62 * v54;
          v68 = v65 + v62 * v55;
          v69 = MidX + v61 * v55;
          v70 = v69 - v62 * v54;
          v71 = MidY + v61 * v54;
          v72 = v71 - v62 * v55;
          v73 = v69 + v62 * v54;
          v74 = v71 + v62 * v55;
          if (v72 >= v74)
            v75 = v74;
          else
            v75 = v72;
          if (v72 > v74)
            v74 = v72;
          if (v66 >= v68)
            v76 = v68;
          else
            v76 = v66;
          if (v66 > v68)
            v68 = v66;
          if (v70 >= v73)
            v77 = v73;
          else
            v77 = v70;
          if (v70 > v73)
            v73 = v70;
          if (v64 >= v67)
            v78 = v67;
          else
            v78 = v64;
          if (v64 > v67)
            v67 = v64;
          if (v78 >= v77)
            v79 = v77;
          else
            v79 = v78;
          if (v76 >= v75)
            v80 = v75;
          else
            v80 = v76;
          if (v67 <= v73)
            v67 = v73;
          v118 = v67;
          if (v68 <= v74)
            v81 = v74;
          else
            v81 = v68;
          -[CIBurstFaceStat leftEyeRect](v19, "leftEyeRect");
          v145.size.width = v118 - v79;
          v145.size.height = v81 - v80;
          v145.origin.x = v79;
          v145.origin.y = v80;
          v142 = CGRectUnion(v141, v145);
          -[CIBurstFaceStat setLeftEyeRect:](v19, "setLeftEyeRect:", v142.origin.x, v142.origin.y, v142.size.width, v142.size.height);
          v82 = v120 - v61 * v55;
          v83 = v82 - v62 * v54;
          v84 = v119 - v61 * v54;
          v85 = v84 - v62 * v55;
          v86 = v82 + v62 * v54;
          v87 = v84 + v62 * v55;
          v88 = v120 + v61 * v55;
          v89 = v88 - v62 * v54;
          v90 = v119 + v61 * v54;
          v91 = v90 - v62 * v55;
          v92 = v88 + v62 * v54;
          v93 = v90 + v62 * v55;
          if (v91 >= v93)
            v94 = v93;
          else
            v94 = v91;
          if (v91 > v93)
            v93 = v91;
          if (v85 >= v87)
            v95 = v87;
          else
            v95 = v85;
          if (v85 > v87)
            v87 = v85;
          if (v89 >= v92)
            v96 = v92;
          else
            v96 = v89;
          if (v89 > v92)
            v92 = v89;
          if (v83 >= v86)
            v97 = v86;
          else
            v97 = v83;
          if (v83 > v86)
            v86 = v83;
          if (v97 >= v96)
            v98 = v96;
          else
            v98 = v97;
          if (v95 >= v94)
            v99 = v94;
          else
            v99 = v95;
          if (v86 <= v92)
            v100 = v92;
          else
            v100 = v86;
          if (v87 <= v93)
            v101 = v93;
          else
            v101 = v87;
          -[CIBurstFaceStat rightEyeRect](v19, "rightEyeRect");
          v146.size.width = v100 - v98;
          v146.size.height = v101 - v99;
          v146.origin.x = v98;
          v146.origin.y = v99;
          v144 = CGRectUnion(v143, v146);
          -[CIBurstFaceStat setRightEyeRect:](v19, "setRightEyeRect:", v144.origin.x, v144.origin.y, v144.size.width, v144.size.height);
          v12 = v9 + 0.0160000008;
          v15 = v117;
        }
        if (objc_msgSend(v16, "objectForKey:", CFSTR("SmileLevel")))
        {
          objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("SmileLevel")), "floatValue");
          -[CIBurstFaceStat setSmileScore:](v19, "setSmileScore:");
        }
        v102 = -[CIBurstFaceStat faceId](v19, "faceId");
        -[CIBurstFaceStat timestamp](v19, "timestamp");
        BurstLoggingMessage("      found face id %d, timestamp=%.6f, x=%.3f,y=%.3f,w=%.3f,h=%.3f\n", v102, v103, v130, v129, v128, v127);
        v104 = self->lastFaceIndex;
        self->lastFaceIndex = v104 + 1;
      }
      while (-[NSMutableArray count](self->faceTimestampArray, "count") > (unint64_t)(v104 + 1));
    }
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v105 = (void *)objc_msgSend(v10, "allKeys");
    v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v131, v135, 16);
    if (v106)
    {
      v107 = v106;
      v108 = *(_QWORD *)v132;
      do
      {
        for (i = 0; i != v107; ++i)
        {
          if (*(_QWORD *)v132 != v108)
            objc_enumerationMutation(v105);
          v110 = (void *)objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i));
          objc_msgSend(v110, "timestamp");
          *(float *)&v111 = v111 - v9;
          v112 = fabsf(*(float *)&v111);
          if (v112 <= 0.016)
          {
            v115 = objc_msgSend(v110, "faceId");
            objc_msgSend(v110, "timestamp");
            BurstLoggingMessage("    adding face id %d, timestamp %.6f\n", v115, v116);
            objc_msgSend(v110, "setIsSyncedWithImage:", 1);
            objc_msgSend((id)objc_msgSend(a3, "faceStatArray"), "addObject:", v110);
          }
          else if (v112 <= 0.04)
          {
            objc_msgSend(v110, "setIsSyncedWithImage:", 0);
            objc_msgSend((id)objc_msgSend(a3, "faceStatArray"), "addObject:", v110);
            v113 = objc_msgSend(v110, "faceId");
            objc_msgSend(v110, "timestamp");
            BurstLoggingMessage("    face id %d, timestamp %.6f - delta = %.6f, perhaps should use FaceCore\n", v113, v114, v112);
          }
        }
        v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v131, v135, 16);
      }
      while (v107);
    }
  }
  else
  {
    BurstLoggingMessage("    imageTimestamp > latestFaceTimestamp\n");
  }
}

- (void)dumpFaceInfoArray
{
  NSMutableArray *faceInfoArray;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  BurstLoggingMessage("FaceInfoArray:\n", a2);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  faceInfoArray = self->faceInfoArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](faceInfoArray, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(faceInfoArray);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "hwFaceId");
        v10 = objc_msgSend(v8, "hwLastFrameSeen");
        objc_msgSend(v8, "hwCenter");
        v12 = v11;
        objc_msgSend(v8, "hwCenter");
        v14 = v13;
        objc_msgSend(v8, "hwSize");
        v16 = v15;
        objc_msgSend(v8, "hwSize");
        v18 = v17;
        v19 = objc_msgSend(v8, "swFaceId");
        v20 = objc_msgSend(v8, "swLastFrameSeen");
        objc_msgSend(v8, "swCenter");
        v22 = v21;
        objc_msgSend(v8, "swCenter");
        v24 = v23;
        objc_msgSend(v8, "swSize");
        v26 = v25;
        objc_msgSend(v8, "swSize");
        BurstLoggingMessage("hwId = %d (lastSeen=%d, ctr=%.3f,%.3f size=%.3f,%.3f), swId = %d (lastSeen=%d, ctr=%.3f,%.3f size=%.3f,%.3f)\n", v9, v10, v12, v14, v16, v18, v19, v20, v22, v24, v26, v27);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](faceInfoArray, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }
}

- (double)timeBlinkDetectionDone
{
  return self->timeBlinkDetectionDone;
}

- (void)setTimeBlinkDetectionDone:(double)a3
{
  self->timeBlinkDetectionDone = a3;
}

- (double)timeFaceDetectionDone
{
  return self->timeFaceDetectionDone;
}

- (void)setTimeFaceDetectionDone:(double)a3
{
  self->timeFaceDetectionDone = a3;
}

- (BOOL)forceFaceDetectionEnable
{
  return self->forceFaceDetectionEnable;
}

- (void)setForceFaceDetectionEnable:(BOOL)a3
{
  self->forceFaceDetectionEnable = a3;
}

- (double)latestFaceTimestamp
{
  return self->latestFaceTimestamp;
}

- (void)setLatestFaceTimestamp:(double)a3
{
  self->latestFaceTimestamp = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void)findFacesInImage:imageStat:.cold.1()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRFaceExpressionLeftEyeClosedScore(void)"), CFSTR("CIBurstFaceAnalysis.m"), 102, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.2()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRFaceExpressionRightEyeClosedScore(void)"), CFSTR("CIBurstFaceAnalysis.m"), 108, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.3()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRFaceExpressionSmileScore(void)"), CFSTR("CIBurstFaceAnalysis.m"), 96, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.4()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRExtractionParamExtractBlink(void)"), CFSTR("CIBurstFaceAnalysis.m"), 111, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.5()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRExtractionParamExtractSmile(void)"), CFSTR("CIBurstFaceAnalysis.m"), 114, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.6()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRExtractionParamExtractFaceprint(void)"), CFSTR("CIBurstFaceAnalysis.m"), 117, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.7()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRExtractionParamExtractLandmarkPoints(void)"), CFSTR("CIBurstFaceAnalysis.m"), 120, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.8()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRExtractionParamEnhancedEyesAndMouthLocalization(void)"), CFSTR("CIBurstFaceAnalysis.m"), 123, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.9()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRExtractionParamInitialAngle(void)"), CFSTR("CIBurstFaceAnalysis.m"), 126, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.10()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRDetectionParamInitialAngle(void)"), CFSTR("CIBurstFaceAnalysis.m"), 87, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)findFacesInImage:imageStat:.cold.11()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("NSString *getFCRDetectionParamDetectionRegion(void)"), CFSTR("CIBurstFaceAnalysis.m"), 90, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

@end
