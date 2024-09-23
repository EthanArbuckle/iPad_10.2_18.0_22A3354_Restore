@implementation CIRedEyeCorrections

- (void)setDefaults
{
  NSArray *v3;

  self->inputCameraModel = 0;
  v3 = self->inputCorrectionInfo;
  self->inputCorrectionInfo = 0;
}

- (BOOL)_isIdentity
{
  return -[NSArray count](self->inputCorrectionInfo, "count") == 0;
}

- (id)outputImage
{
  const __CFString *inputCameraModel;
  CIImage *v4;
  NSArray *inputCorrectionInfo;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[NSArray count](self->inputCorrectionInfo, "count"))
  {
    if (self->inputCameraModel)
      inputCameraModel = (const __CFString *)self->inputCameraModel;
    else
      inputCameraModel = CFSTR("undefined");
    v4 = self->inputImage;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    inputCorrectionInfo = self->inputCorrectionInfo;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](inputCorrectionInfo, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(inputCorrectionInfo);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          v16[0] = CFSTR("inputCorrectionInfo");
          v16[1] = CFSTR("inputCameraModel");
          v17[0] = v10;
          v17[1] = inputCameraModel;
          v4 = -[CIImage imageByCompositingOverImage:](-[CIImage imageByApplyingFilter:withInputParameters:](v4, "imageByApplyingFilter:withInputParameters:", CFSTR("CIRedEyeCorrection"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2)), "imageByCompositingOverImage:", v4);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](inputCorrectionInfo, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v7);
    }
    return v4;
  }
  return self->inputImage;
}

- (id)_outputProperties
{
  id v3;
  uint64_t v4;
  NSArray *inputCorrectionInfo;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  CIRedEyeCorrections *v73;
  id v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *k;
  void *v93;
  void *v94;
  void *v95;
  float v96;
  void *v97;
  float v98;
  void *v99;
  float v100;
  id v101;
  double v102;
  double v103;
  double v104;
  double v105;
  uint64_t inputCameraModel;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  CIRedEyeCorrections *v118;
  NSArray *obj;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  id v127;
  NSArray *v128;
  uint64_t v129;
  uint64_t v130;
  int v131;
  NSArray *v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  id v150;
  id v151;
  id v152;
  id v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->inputCorrectionInfo, "count"))
    return 0;
  v3 = -[NSArray objectAtIndexedSubscript:](self->inputCorrectionInfo, "objectAtIndexedSubscript:", 0);
  v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("convexHull"));
  if (!v4 && !objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pointX")))
  {
    puts("red-eye repair dictionary is of unknown type");
    return 0;
  }
  v123 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v117 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v118 = self;
  if (v4)
  {
    v140 = 0uLL;
    v141 = 0uLL;
    v138 = 0uLL;
    v139 = 0uLL;
    inputCorrectionInfo = self->inputCorrectionInfo;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](inputCorrectionInfo, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v139;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v139 != v8)
            objc_enumerationMutation(inputCorrectionInfo);
          v10 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("px")), "doubleValue");
          *(float *)&v12 = v12;
          v13 = *(float *)&v12;
          objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("py")), "doubleValue");
          *(float *)&v14 = 1.0 - v14;
          objc_msgSend(v123, "addObject:", objc_msgSend(v11, "stringWithFormat:", CFSTR("x = %.5f, y = %.5f, width = 10.0, height = 10.0, alpha = 0.0244, density = 0.86, strength = 0.0757, redBias = 0.253, pupilSize = 0.50, pupilDarkenAmount = 0.75"), *(_QWORD *)&v13, *(float *)&v14));
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](inputCorrectionInfo, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
      }
      while (v7);
    }
    v122 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    obj = self->inputCorrectionInfo;
    v121 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v134, v154, 16);
    if (v121)
    {
      v120 = *(_QWORD *)v135;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v135 != v120)
            objc_enumerationMutation(obj);
          v124 = v15;
          v125 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v15);
          v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v17 = (void *)objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("context"));
          v18 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("faceRect"));
          v126 = v16;
          objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v18, "objectAtIndexedSubscript:", 0), objc_msgSend(v18, "objectAtIndexedSubscript:", 1), objc_msgSend(v18, "objectAtIndexedSubscript:", 2), objc_msgSend(v18, "objectAtIndexedSubscript:", 3)), CFSTR("cfr"));
          v19 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftEye"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend(v19, "objectAtIndexedSubscript:", 0), objc_msgSend(v19, "objectAtIndexedSubscript:", 1)), CFSTR("cle"));
          v20 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftPoly0"));
          v21 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftPoly1"));
          v22 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftPoly2"));
          v23 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftPoly3"));
          v24 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftPoly4"));
          v25 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftPoly5"));
          v26 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftPoly6"));
          v27 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftPoly7"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@"), objc_msgSend(v20, "objectAtIndexedSubscript:", 0), objc_msgSend(v20, "objectAtIndexedSubscript:", 1), objc_msgSend(v21, "objectAtIndexedSubscript:", 0), objc_msgSend(v21, "objectAtIndexedSubscript:", 1), objc_msgSend(v22, "objectAtIndexedSubscript:", 0), objc_msgSend(v22, "objectAtIndexedSubscript:", 1), objc_msgSend(v23, "objectAtIndexedSubscript:", 0), objc_msgSend(v23, "objectAtIndexedSubscript:", 1), objc_msgSend(v24, "objectAtIndexedSubscript:", 0), objc_msgSend(v24, "objectAtIndexedSubscript:", 1), objc_msgSend(v25, "objectAtIndexedSubscript:", 0), objc_msgSend(v25, "objectAtIndexedSubscript:", 1), objc_msgSend(v26, "objectAtIndexedSubscript:", 0),
              objc_msgSend(v26, "objectAtIndexedSubscript:", 1),
              objc_msgSend(v27, "objectAtIndexedSubscript:", 0),
              objc_msgSend(v27, "objectAtIndexedSubscript:", 1)),
            CFSTR("clp"));
          v28 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftRect"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v28, "objectAtIndexedSubscript:", 0), objc_msgSend(v28, "objectAtIndexedSubscript:", 1), objc_msgSend(v28, "objectAtIndexedSubscript:", 2), objc_msgSend(v28, "objectAtIndexedSubscript:", 3)), CFSTR("clr"));
          v29 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("leftDistMatrix"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v29, "objectAtIndexedSubscript:", 0), objc_msgSend(v29, "objectAtIndexedSubscript:", 1), objc_msgSend(v29, "objectAtIndexedSubscript:", 2), objc_msgSend(v29, "objectAtIndexedSubscript:", 3)), CFSTR("clm"));
          v30 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightEye"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend(v30, "objectAtIndexedSubscript:", 0), objc_msgSend(v30, "objectAtIndexedSubscript:", 1)), CFSTR("cre"));
          v31 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightPoly0"));
          v32 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightPoly1"));
          v33 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightPoly2"));
          v34 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightPoly3"));
          v35 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightPoly4"));
          v36 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightPoly5"));
          v37 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightPoly6"));
          v38 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightPoly7"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@"), objc_msgSend(v31, "objectAtIndexedSubscript:", 0), objc_msgSend(v31, "objectAtIndexedSubscript:", 1), objc_msgSend(v32, "objectAtIndexedSubscript:", 0), objc_msgSend(v32, "objectAtIndexedSubscript:", 1), objc_msgSend(v33, "objectAtIndexedSubscript:", 0), objc_msgSend(v33, "objectAtIndexedSubscript:", 1), objc_msgSend(v34, "objectAtIndexedSubscript:", 0), objc_msgSend(v34, "objectAtIndexedSubscript:", 1), objc_msgSend(v35, "objectAtIndexedSubscript:", 0), objc_msgSend(v35, "objectAtIndexedSubscript:", 1), objc_msgSend(v36, "objectAtIndexedSubscript:", 0), objc_msgSend(v36, "objectAtIndexedSubscript:", 1), objc_msgSend(v37, "objectAtIndexedSubscript:", 0),
              objc_msgSend(v37, "objectAtIndexedSubscript:", 1),
              objc_msgSend(v38, "objectAtIndexedSubscript:", 0),
              objc_msgSend(v38, "objectAtIndexedSubscript:", 1)),
            CFSTR("crp"));
          v39 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightRect"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v39, "objectAtIndexedSubscript:", 0), objc_msgSend(v39, "objectAtIndexedSubscript:", 1), objc_msgSend(v39, "objectAtIndexedSubscript:", 2), objc_msgSend(v39, "objectAtIndexedSubscript:", 3)), CFSTR("crr"));
          v40 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rightDistMatrix"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v40, "objectAtIndexedSubscript:", 0), objc_msgSend(v40, "objectAtIndexedSubscript:", 1), objc_msgSend(v40, "objectAtIndexedSubscript:", 2), objc_msgSend(v40, "objectAtIndexedSubscript:", 3)), CFSTR("crm"));
          v41 = (void *)objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("convexHull"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("counterClockwise")), objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("maxPoints")), objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("nPoints"))), CFSTR("hin"));
          v42 = (void *)objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("hullBody"));
          v43 = objc_msgSend(v42, "count");
          v44 = v43;
          if (v43 < 1)
          {
            v47 = &stru_1E2ECD1B0;
          }
          else
          {
            v45 = 0;
            v46 = v43;
            v47 = &stru_1E2ECD1B0;
            v129 = v43;
            v131 = v43;
            do
            {
              if ((int)v46 - (int)v45 >= 4)
                v48 = 4;
              else
                v48 = v46 - v45;
              if (v46 - v45 >= 1)
              {
                v49 = 0;
                do
                {
                  *(&v150 + v49) = (id)objc_msgSend(v42, "objectAtIndexedSubscript:", v45 + v49);
                  ++v49;
                }
                while (v49 < v48);
              }
              if (v45)
                v47 = (__CFString *)-[__CFString stringByAppendingFormat:](v47, "stringByAppendingFormat:", CFSTR(" "));
              switch(v48)
              {
                case 1:
                  v50 = -[__CFString stringByAppendingFormat:](v47, "stringByAppendingFormat:", CFSTR("%@ %@"), objc_msgSend(v150, "objectAtIndexedSubscript:", 0), objc_msgSend(v150, "objectAtIndexedSubscript:", 1), v108, v109, v110, v113, v115, v116);
                  goto LABEL_32;
                case 2:
                  v68 = v150;
                  v69 = objc_msgSend(v150, "objectAtIndexedSubscript:", 0);
                  v70 = objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
                  v50 = -[__CFString stringByAppendingFormat:](v47, "stringByAppendingFormat:", CFSTR("%@ %@ %@ %@"), v69, v70, objc_msgSend(v151, "objectAtIndexedSubscript:", 0), objc_msgSend(v151, "objectAtIndexedSubscript:", 1), v110, v113, v115, v116);
                  goto LABEL_32;
                case 3:
                  v51 = v150;
                  v52 = objc_msgSend(v150, "objectAtIndexedSubscript:", 0);
                  v53 = objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
                  v54 = v151;
                  v55 = v47;
                  v56 = objc_msgSend(v151, "objectAtIndexedSubscript:", 0);
                  v57 = objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
                  v58 = v152;
                  v59 = objc_msgSend(v152, "objectAtIndexedSubscript:", 0);
                  v60 = v58;
                  v44 = v131;
                  v111 = v59;
                  v46 = v129;
                  v50 = -[__CFString stringByAppendingFormat:](v55, "stringByAppendingFormat:", CFSTR("%@ %@ %@ %@ %@ %@"), v52, v53, v56, v57, v111, objc_msgSend(v60, "objectAtIndexedSubscript:", 1), v115, v116);
                  goto LABEL_32;
                case 4:
                  v61 = v150;
                  v127 = (id)objc_msgSend(v150, "objectAtIndexedSubscript:", 0);
                  v62 = objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
                  v63 = v151;
                  v64 = v47;
                  v65 = objc_msgSend(v151, "objectAtIndexedSubscript:", 0);
                  v66 = objc_msgSend(v63, "objectAtIndexedSubscript:", 1);
                  v67 = v152;
                  v112 = objc_msgSend(v152, "objectAtIndexedSubscript:", 0);
                  v114 = objc_msgSend(v67, "objectAtIndexedSubscript:", 1);
                  v46 = v129;
                  v44 = v131;
                  v50 = -[__CFString stringByAppendingFormat:](v64, "stringByAppendingFormat:", CFSTR("%@ %@ %@ %@ %@ %@ %@ %@"), v127, v62, v65, v66, v112, v114, objc_msgSend(v153, "objectAtIndexedSubscript:", 0), objc_msgSend(v153, "objectAtIndexedSubscript:", 1));
LABEL_32:
                  v47 = (__CFString *)v50;
                  break;
                default:
                  break;
              }
              v45 += 4;
            }
            while ((int)v45 < v44);
          }
          objc_msgSend(v126, "setObject:forKeyedSubscript:", v47, CFSTR("hb"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@ %@"), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("px")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("py")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("ioffx")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("ioffy")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("xf")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("yf"))), CFSTR("g"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("xPosition")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("hue")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("saturation")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("luminance"))), CFSTR("ec"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@ %@ %@ %@"), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("skinval")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("avgLuminance")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("minLuminance")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("maxLuminance")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("darkPercent")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("clipPercent")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("variance")), objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("nNonZero"))), CFSTR("sk"));
          v71 = (void *)objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("settings"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@"), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("IOD")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("faceIndex")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("side")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("scale")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("height"))), CFSTR("sg"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@ %@ %@ %@ %@ %@"), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("alignmentTolerance")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("capture")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("connectThreshold")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("downsampleOversizeX")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("downsampleOversizeY")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("downsampleType")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("gradientChannel")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("edgeFindingChannel")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("minMagnitude")), objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("regressionRadius"))), CFSTR("sp"));
          v72 = (void *)objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("transform"));
          objc_msgSend(v126, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@ %@"), objc_msgSend(v72, "objectAtIndexedSubscript:", 0), objc_msgSend(v72, "objectAtIndexedSubscript:", 1), objc_msgSend(v72, "objectAtIndexedSubscript:", 2), objc_msgSend(v72, "objectAtIndexedSubscript:", 3), objc_msgSend(v72, "objectAtIndexedSubscript:", 4), objc_msgSend(v72, "objectAtIndexedSubscript:", 5)), CFSTR("st"));
          objc_msgSend(v122, "addObject:", v126);
          v15 = v124 + 1;
        }
        while (v124 + 1 != v121);
        v121 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v134, v154, 16);
      }
      while (v121);
    }
    v73 = v118;
    v74 = -[NSArray objectAtIndex:](v118->inputCorrectionInfo, "objectAtIndex:", 0);
    objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("xf")), "doubleValue");
    v76 = v117;
    objc_msgSend(v117, "addObject:", metadataPropertyWithDouble(v75));
    objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("yf")), "doubleValue");
    objc_msgSend(v117, "addObject:", metadataPropertyWithDouble(v77));
    objc_msgSend(v117, "addObject:", metadataPropertyWithDouble(1.0));
    objc_msgSend(v117, "addObject:", metadataPropertyWithDouble(1.0));
    v78 = 64.0;
  }
  else
  {
    v148 = 0uLL;
    v149 = 0uLL;
    v146 = 0uLL;
    v147 = 0uLL;
    v132 = self->inputCorrectionInfo;
    v79 = -[NSArray countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v146, v157, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v147;
      do
      {
        for (j = 0; j != v80; ++j)
        {
          if (*(_QWORD *)v147 != v81)
            objc_enumerationMutation(v132);
          v83 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * j);
          v84 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend((id)objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("pointX")), "doubleValue");
          *(float *)&v85 = v85;
          v86 = *(float *)&v85;
          objc_msgSend((id)objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("pointY")), "doubleValue");
          *(float *)&v87 = 1.0 - v87;
          v88 = *(float *)&v87;
          objc_msgSend((id)objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("size")), "doubleValue");
          v90 = v89;
          objc_msgSend((id)objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("size")), "doubleValue");
          objc_msgSend(v123, "addObject:", objc_msgSend(v84, "stringWithFormat:", CFSTR("x = %.5f, y = %.5f, width = %.5f, height = %.5f, alpha = 0.0244, density = 0.86, strength = 0.0757, redBias = 0.253, pupilSize = 0.50, pupilDarkenAmount = 0.75"), *(_QWORD *)&v86, *(_QWORD *)&v88, v90, v91));
        }
        v80 = -[NSArray countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v146, v157, 16);
      }
      while (v80);
    }
    v122 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v128 = self->inputCorrectionInfo;
    v133 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
    if (v133)
    {
      v130 = *(_QWORD *)v143;
      do
      {
        for (k = 0; k != v133; k = (char *)k + 1)
        {
          if (*(_QWORD *)v143 != v130)
            objc_enumerationMutation(v128);
          v93 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)k);
          v94 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("pointX")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("pointY")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("size"))), CFSTR("p"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("pupilShadeLow")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("pupilShadeMedium")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("pupilShadeHigh")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("pupilShadeAverage"))), CFSTR("ps"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("interocularDistance")), CFSTR("iod"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("snappedX")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("snappedY"))), CFSTR("s"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("bitmaskX")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("bitmaskY")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("bitmaskThreshold"))), CFSTR("b"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("cornealReflectionX")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("cornealReflectionY")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("cornealReflectionThreshold"))), CFSTR("cr"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("existingPupilLow")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("existingPupilMedium")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("existingPupilHigh")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("existingPupilAverage"))), CFSTR("ep"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("averageSkinLuminance")), CFSTR("asl"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("searchRectangleMinimumY")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("searchRectangleMaximumY")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("searchRectangleMinimumX")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("searchRectangleMaximumX"))), CFSTR("sr"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@ %@"), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("repairRectangleMinimumY")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("repairRectangleMaximumY")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("repairRectangleMinimumX")), objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("repairRectangleMaximumX"))), CFSTR("rr"));
          v95 = (void *)objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("forceCase"));
          objc_msgSend(v95, "floatValue");
          if (v96 != 0.0)
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v95, CFSTR("fc"));
          v97 = (void *)objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("pupilShadeAlignment"));
          objc_msgSend(v97, "floatValue");
          if (v98 != 0.0)
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v97, CFSTR("psa"));
          v99 = (void *)objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("finalEyeCase"));
          objc_msgSend(v99, "floatValue");
          if (v100 != 0.0)
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v99, CFSTR("fec"));
          objc_msgSend(v122, "addObject:", v94);
        }
        v133 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
      }
      while (v133);
    }
    v73 = self;
    v101 = -[NSArray objectAtIndex:](self->inputCorrectionInfo, "objectAtIndex:", 0);
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("fullImageWidth")), "doubleValue");
    v76 = v117;
    objc_msgSend(v117, "addObject:", metadataPropertyWithDouble(v102));
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("fullImageHeight")), "doubleValue");
    objc_msgSend(v117, "addObject:", metadataPropertyWithDouble(v103));
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("imageSpecialValue")), "doubleValue");
    objc_msgSend(v117, "addObject:", metadataPropertyWithDouble(v104));
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("imageOrientation")), "doubleValue");
    objc_msgSend(v117, "addObject:", metadataPropertyWithDouble(v105));
    objc_msgSend((id)objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("imageSignalToNoiseRatio")), "doubleValue");
  }
  objc_msgSend(v76, "addObject:", metadataPropertyWithDouble(v78));
  inputCameraModel = (uint64_t)v73->inputCameraModel;
  if (inputCameraModel)
    objc_msgSend(v76, "addObject:", metadataPropertyWithString((uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("aas"), (uint64_t)CFSTR("RedEyeModel"), inputCameraModel));
  objc_msgSend(v76, "addObject:", metadataPropertyWithArrayOfStructs((uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("aas"), (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/sType/redeye"), (uint64_t)CFSTR("re"), (uint64_t)CFSTR("RedEyeCorrections"), v122));
  objc_msgSend(v76, "addObject:", metadataPropertyWithBool());
  objc_msgSend(v76, "addObject:", metadataPropertyWithArray((uint64_t)CFSTR("http://ns.adobe.com/camera-raw-settings/1.0/"), (uint64_t)CFSTR("crs"), (uint64_t)CFSTR("RedEyeInfo"), v123));
  return v76;
}

- (id)_initFromProperties:(id)a3
{
  void *ArrayOfStructs;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  unint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  id String;
  id v191;
  id v193;
  CIRedEyeCorrections *v194;
  id obj;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _QWORD v232[2];
  _QWORD v233[23];
  _QWORD v234[23];
  _QWORD v235[4];
  _QWORD v236[4];
  _QWORD v237[2];
  _QWORD v238[2];
  _QWORD v239[2];
  _QWORD v240[2];
  _QWORD v241[2];
  _QWORD v242[2];
  _QWORD v243[2];
  _QWORD v244[2];
  _QWORD v245[2];
  _QWORD v246[4];
  _QWORD v247[4];
  _QWORD v248[2];
  _QWORD v249[2];
  _QWORD v250[2];
  _QWORD v251[2];
  _QWORD v252[2];
  _QWORD v253[2];
  _QWORD v254[2];
  _QWORD v255[2];
  _QWORD v256[2];
  _QWORD v257[4];
  _BYTE v258[128];
  _BYTE v259[128];
  uint64_t v260;

  v260 = *MEMORY[0x1E0C80C00];
  ArrayOfStructs = (void *)metadataPropertyArrayGetArrayOfStructs((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), CFSTR("http://ns.apple.com/adjustment-settings/1.0/sType/red-eye"));
  if (!ArrayOfStructs)
    goto LABEL_12;
  v6 = ArrayOfStructs;
  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  v7 = objc_msgSend(ArrayOfStructs, "countByEnumeratingWithState:objects:count:", &v228, v259, 16);
  if (!v7)
    goto LABEL_12;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v229;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v229 != v10)
        objc_enumerationMutation(v6);
      if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v228 + 1) + 8 * i), "allKeys"), "count"))
        v9 = 1;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v228, v259, 16);
  }
  while (v8);
  if ((v9 & 1) == 0)
  {
LABEL_12:
    v226 = 0.0;
    v227 = 0.0;
    v224 = 0.0;
    v225 = 0.0;
    v223 = 0.0;
    if (!metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("RedEyeW"), &v227)|| !metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("RedEyeH"), &v226)|| !metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("RedEyeISV"), &v225)|| !metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("RedEyeOrt"), &v224)
      || (metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("RedEyeSNR"), &v223) & 1) == 0)
    {
      goto LABEL_43;
    }
    v193 = a3;
    v194 = self;
    v12 = (void *)metadataPropertyArrayGetArrayOfStructs((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), CFSTR("http://ns.apple.com/adjustment-settings/1.0/sType/redeye"));
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v219 = 0u;
    v220 = 0u;
    v221 = 0u;
    v222 = 0u;
    obj = v12;
    v197 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v219, v258, 16);
    if (v197)
    {
      v196 = *(_QWORD *)v220;
      v13 = 0x1E0C99000uLL;
      while (2)
      {
        for (j = 0; j != v197; ++j)
        {
          if (*(_QWORD *)v220 != v196)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * j);
          if (objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hb"), v193, v194))
          {
            v217 = j;
            v218 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 50);
            v16 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cfr")), "componentsSeparatedByString:", CFSTR(" "));
            v17 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", 0), "floatValue");
            v257[0] = objc_msgSend(v17, "numberWithFloat:");
            v18 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", 1), "floatValue");
            v257[1] = objc_msgSend(v18, "numberWithFloat:");
            v19 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", 2), "floatValue");
            v257[2] = objc_msgSend(v19, "numberWithFloat:");
            v20 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", 3), "floatValue");
            v257[3] = objc_msgSend(v20, "numberWithFloat:");
            v216 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v257, 4);
            v21 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cle")), "componentsSeparatedByString:", CFSTR(" "));
            v22 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", 0), "floatValue");
            v256[0] = objc_msgSend(v22, "numberWithFloat:");
            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", 1), "floatValue");
            v256[1] = objc_msgSend(v23, "numberWithFloat:");
            v215 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v256, 2);
            v24 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("clp")), "componentsSeparatedByString:", CFSTR(" "));
            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 0), "floatValue");
            v255[0] = objc_msgSend(v25, "numberWithFloat:");
            v26 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 1), "floatValue");
            v255[1] = objc_msgSend(v26, "numberWithFloat:");
            v214 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v255, 2);
            v27 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 2), "floatValue");
            v254[0] = objc_msgSend(v27, "numberWithFloat:");
            v28 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 3), "floatValue");
            v254[1] = objc_msgSend(v28, "numberWithFloat:");
            v213 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v254, 2);
            v29 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 4), "floatValue");
            v253[0] = objc_msgSend(v29, "numberWithFloat:");
            v30 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 5), "floatValue");
            v253[1] = objc_msgSend(v30, "numberWithFloat:");
            v212 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v253, 2);
            v31 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 6), "floatValue");
            v252[0] = objc_msgSend(v31, "numberWithFloat:");
            v32 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 7), "floatValue");
            v252[1] = objc_msgSend(v32, "numberWithFloat:");
            v211 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v252, 2);
            v33 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 8), "floatValue");
            v251[0] = objc_msgSend(v33, "numberWithFloat:");
            v34 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 9), "floatValue");
            v251[1] = objc_msgSend(v34, "numberWithFloat:");
            v210 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v251, 2);
            v35 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 10), "floatValue");
            v250[0] = objc_msgSend(v35, "numberWithFloat:");
            v36 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 11), "floatValue");
            v250[1] = objc_msgSend(v36, "numberWithFloat:");
            v209 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v250, 2);
            v37 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 12), "floatValue");
            v249[0] = objc_msgSend(v37, "numberWithFloat:");
            v38 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 13), "floatValue");
            v249[1] = objc_msgSend(v38, "numberWithFloat:");
            v208 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v249, 2);
            v39 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 14), "floatValue");
            v248[0] = objc_msgSend(v39, "numberWithFloat:");
            v40 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 15), "floatValue");
            v248[1] = objc_msgSend(v40, "numberWithFloat:");
            v207 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v248, 2);
            v41 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("clr")), "componentsSeparatedByString:", CFSTR(" "));
            v42 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", 0), "floatValue");
            v247[0] = objc_msgSend(v42, "numberWithFloat:");
            v43 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", 1), "floatValue");
            v247[1] = objc_msgSend(v43, "numberWithFloat:");
            v44 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", 2), "floatValue");
            v247[2] = objc_msgSend(v44, "numberWithFloat:");
            v45 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v41, "objectAtIndexedSubscript:", 3), "floatValue");
            v247[3] = objc_msgSend(v45, "numberWithFloat:");
            v206 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v247, 4);
            v46 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("clm")), "componentsSeparatedByString:", CFSTR(" "));
            v47 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", 0), "floatValue");
            v246[0] = objc_msgSend(v47, "numberWithFloat:");
            v48 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", 1), "floatValue");
            v246[1] = objc_msgSend(v48, "numberWithFloat:");
            v49 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", 2), "floatValue");
            v246[2] = objc_msgSend(v49, "numberWithFloat:");
            v50 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v46, "objectAtIndexedSubscript:", 3), "floatValue");
            v246[3] = objc_msgSend(v50, "numberWithFloat:");
            v205 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v246, 4);
            v51 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cre")), "componentsSeparatedByString:", CFSTR(" "));
            v52 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v51, "objectAtIndexedSubscript:", 0), "floatValue");
            v245[0] = objc_msgSend(v52, "numberWithFloat:");
            v53 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v51, "objectAtIndexedSubscript:", 1), "floatValue");
            v245[1] = objc_msgSend(v53, "numberWithFloat:");
            v204 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v245, 2);
            v54 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("crp")), "componentsSeparatedByString:", CFSTR(" "));
            v55 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 0), "floatValue");
            v244[0] = objc_msgSend(v55, "numberWithFloat:");
            v56 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 1), "floatValue");
            v244[1] = objc_msgSend(v56, "numberWithFloat:");
            v203 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v244, 2);
            v57 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 2), "floatValue");
            v243[0] = objc_msgSend(v57, "numberWithFloat:");
            v58 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 3), "floatValue");
            v243[1] = objc_msgSend(v58, "numberWithFloat:");
            v202 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v243, 2);
            v59 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 4), "floatValue");
            v242[0] = objc_msgSend(v59, "numberWithFloat:");
            v60 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 5), "floatValue");
            v242[1] = objc_msgSend(v60, "numberWithFloat:");
            v201 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v242, 2);
            v61 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 6), "floatValue");
            v241[0] = objc_msgSend(v61, "numberWithFloat:");
            v62 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 7), "floatValue");
            v241[1] = objc_msgSend(v62, "numberWithFloat:");
            v200 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v241, 2);
            v63 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 8), "floatValue");
            v240[0] = objc_msgSend(v63, "numberWithFloat:");
            v64 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 9), "floatValue");
            v240[1] = objc_msgSend(v64, "numberWithFloat:");
            v199 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v240, 2);
            v65 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 10), "floatValue");
            v239[0] = objc_msgSend(v65, "numberWithFloat:");
            v66 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 11), "floatValue");
            v239[1] = objc_msgSend(v66, "numberWithFloat:");
            v67 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v239, 2);
            v68 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 12), "floatValue");
            v238[0] = objc_msgSend(v68, "numberWithFloat:");
            v69 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 13), "floatValue");
            v238[1] = objc_msgSend(v69, "numberWithFloat:");
            v198 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v238, 2);
            v70 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 14), "floatValue");
            v237[0] = objc_msgSend(v70, "numberWithFloat:");
            v71 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 15), "floatValue");
            v237[1] = objc_msgSend(v71, "numberWithFloat:");
            v72 = objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v237, 2);
            v73 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("crr")), "componentsSeparatedByString:", CFSTR(" "));
            v74 = v15;
            v75 = v13;
            v76 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v73, "objectAtIndexedSubscript:", 0), "floatValue");
            v236[0] = objc_msgSend(v76, "numberWithFloat:");
            v77 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v73, "objectAtIndexedSubscript:", 1), "floatValue");
            v236[1] = objc_msgSend(v77, "numberWithFloat:");
            v78 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v73, "objectAtIndexedSubscript:", 2), "floatValue");
            v236[2] = objc_msgSend(v78, "numberWithFloat:");
            v79 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v73, "objectAtIndexedSubscript:", 3), "floatValue");
            v236[3] = objc_msgSend(v79, "numberWithFloat:");
            v80 = objc_msgSend(*(id *)(v75 + 3360), "arrayWithObjects:count:", v236, 4);
            v81 = (void *)objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("crm")), "componentsSeparatedByString:", CFSTR(" "));
            v82 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v81, "objectAtIndexedSubscript:", 0), "floatValue");
            v235[0] = objc_msgSend(v82, "numberWithFloat:");
            v83 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v81, "objectAtIndexedSubscript:", 1), "floatValue");
            v235[1] = objc_msgSend(v83, "numberWithFloat:");
            v84 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v81, "objectAtIndexedSubscript:", 2), "floatValue");
            v235[2] = objc_msgSend(v84, "numberWithFloat:");
            v85 = (void *)MEMORY[0x1E0CB37E8];
            v86 = v81;
            v13 = v75;
            objc_msgSend((id)objc_msgSend(v86, "objectAtIndexedSubscript:", 3), "floatValue");
            v235[3] = objc_msgSend(v85, "numberWithFloat:");
            v87 = objc_msgSend(*(id *)(v75 + 3360), "arrayWithObjects:count:", v235, 4);
            v234[0] = v216;
            v234[1] = v215;
            v234[2] = v214;
            v234[3] = v213;
            v234[4] = v212;
            v234[5] = v211;
            v234[6] = v210;
            v234[7] = v209;
            v234[8] = v208;
            v234[9] = v207;
            v234[10] = v206;
            v234[11] = v204;
            v234[12] = v203;
            v234[13] = v202;
            v234[14] = v201;
            v234[15] = v200;
            v234[16] = v199;
            v234[17] = v67;
            v234[18] = v198;
            v234[19] = v72;
            v234[20] = v80;
            v234[21] = v205;
            v233[0] = CFSTR("faceRect");
            v233[1] = CFSTR("leftEye");
            v233[2] = CFSTR("leftPoly0");
            v233[3] = CFSTR("leftPoly1");
            v233[4] = CFSTR("leftPoly2");
            v233[5] = CFSTR("leftPoly3");
            v233[6] = CFSTR("leftPoly4");
            v233[7] = CFSTR("leftPoly5");
            v233[8] = CFSTR("leftPoly6");
            v233[9] = CFSTR("leftPoly7");
            v233[10] = CFSTR("leftRect");
            v233[11] = CFSTR("rightEye");
            v233[12] = CFSTR("rightPoly0");
            v233[13] = CFSTR("rightPoly1");
            v233[14] = CFSTR("rightPoly2");
            v233[15] = CFSTR("rightPoly3");
            v233[16] = CFSTR("rightPoly4");
            v233[17] = CFSTR("rightPoly5");
            v233[18] = CFSTR("rightPoly6");
            v233[19] = CFSTR("rightPoly7");
            v233[20] = CFSTR("rightRect");
            v233[21] = CFSTR("leftDistMatrix");
            v233[22] = CFSTR("rightDistMatrix");
            v234[22] = v87;
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v234, v233, 23), CFSTR("context"));
            v88 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v89 = v74;
            v90 = (void *)objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("hin")), "componentsSeparatedByString:", CFSTR(" "));
            v91 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v90, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v88, "setObject:forKeyedSubscript:", objc_msgSend(v91, "numberWithFloat:"), CFSTR("counterClockwise"));
            v92 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v90, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v88, "setObject:forKeyedSubscript:", objc_msgSend(v92, "numberWithFloat:"), CFSTR("maxPoints"));
            v93 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v90, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v88, "setObject:forKeyedSubscript:", objc_msgSend(v93, "numberWithFloat:"), CFSTR("nPoints"));
            v94 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v95 = (void *)objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("hb")), "componentsSeparatedByString:", CFSTR(" "));
            if (objc_msgSend(v95, "count"))
            {
              v96 = 0;
              do
              {
                v97 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend((id)objc_msgSend(v95, "objectAtIndexedSubscript:", v96), "floatValue");
                v232[0] = objc_msgSend(v97, "numberWithFloat:");
                v98 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend((id)objc_msgSend(v95, "objectAtIndexedSubscript:", v96 + 1), "floatValue");
                v99 = v98;
                v13 = v75;
                v232[1] = objc_msgSend(v99, "numberWithFloat:");
                objc_msgSend(v94, "addObject:", objc_msgSend(*(id *)(v75 + 3360), "arrayWithObjects:count:", v232, 2));
                v96 += 2;
              }
              while (objc_msgSend(v95, "count") > v96);
            }
            objc_msgSend(v88, "setObject:forKeyedSubscript:", v94, CFSTR("hullBody"));
            objc_msgSend(v218, "setObject:forKeyedSubscript:", v88, CFSTR("convexHull"));
            v100 = v218;
            v101 = (void *)objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("g")), "componentsSeparatedByString:", CFSTR(" "));
            v102 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 0), "floatValue");
            v103 = objc_msgSend(v102, "numberWithFloat:");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", v103, CFSTR("px"));
            objc_msgSend(v218, "setObject:forKeyedSubscript:", v103, CFSTR("pointX"));
            v104 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 1), "floatValue");
            v105 = objc_msgSend(v104, "numberWithFloat:");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", v105, CFSTR("py"));
            objc_msgSend(v218, "setObject:forKeyedSubscript:", v105, CFSTR("pointY"));
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 2), "intValue")), CFSTR("ioffx"));
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 3), "intValue")), CFSTR("ioffy"));
            v106 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 4), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v106, "numberWithFloat:"), CFSTR("xf"));
            v107 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v101, "objectAtIndexedSubscript:", 5), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v107, "numberWithFloat:"), CFSTR("yf"));
            v108 = (void *)objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("ec")), "componentsSeparatedByString:", CFSTR(" "));
            v109 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v108, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v109, "numberWithFloat:"), CFSTR("xPosition"));
            v110 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v108, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v110, "numberWithFloat:"), CFSTR("hue"));
            v111 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v108, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v111, "numberWithFloat:"), CFSTR("saturation"));
            v112 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v108, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v112, "numberWithFloat:"), CFSTR("luminance"));
            v113 = (void *)objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("sk")), "componentsSeparatedByString:", CFSTR(" "));
            v114 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v114, "numberWithFloat:"), CFSTR("skinval"));
            v115 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v115, "numberWithFloat:"), CFSTR("avgLuminance"));
            v116 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v116, "numberWithFloat:"), CFSTR("minLuminance"));
            v117 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v117, "numberWithFloat:"), CFSTR("maxLuminance"));
            v118 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 4), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v118, "numberWithFloat:"), CFSTR("darkPercent"));
            v119 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 5), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v119, "numberWithFloat:"), CFSTR("clipPercent"));
            v120 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 6), "floatValue");
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(v120, "numberWithFloat:"), CFSTR("variance"));
            objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v113, "objectAtIndexedSubscript:", 7), "intValue")), CFSTR("nNonZero"));
            v121 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v122 = (void *)objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("sg")), "componentsSeparatedByString:", CFSTR(" "));
            v123 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v123, "numberWithFloat:"), CFSTR("IOD"));
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 1), "intValue")), CFSTR("faceIndex"));
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 2), "intValue")), CFSTR("side"));
            v124 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v124, "numberWithFloat:"), CFSTR("scale"));
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v122, "objectAtIndexedSubscript:", 4), "intValue")), CFSTR("height"));
            v125 = (void *)objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("sp")), "componentsSeparatedByString:", CFSTR(" "));
            v126 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v126, "numberWithFloat:"), CFSTR("alignmentTolerance"));
            v127 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v127, "numberWithFloat:"), CFSTR("capture"));
            v128 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v128, "numberWithFloat:"), CFSTR("connectThreshold"));
            v129 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v129, "numberWithFloat:"), CFSTR("downsampleOversizeX"));
            v130 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 4), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v130, "numberWithFloat:"), CFSTR("downsampleOversizeY"));
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 5), "intValue")), CFSTR("downsampleType"));
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 6), "intValue")), CFSTR("gradientChannel"));
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 7), "intValue")), CFSTR("edgeFindingChannel"));
            v131 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 8), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v131, "numberWithFloat:"), CFSTR("minMagnitude"));
            v132 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v125, "objectAtIndexedSubscript:", 9), "floatValue");
            objc_msgSend(v121, "setObject:forKeyedSubscript:", objc_msgSend(v132, "numberWithFloat:"), CFSTR("regressionRadius"));
            v133 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v134 = (void *)objc_msgSend((id)objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("st")), "componentsSeparatedByString:", CFSTR(" "));
            v135 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v135, "numberWithFloat:"));
            v136 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v136, "numberWithFloat:"));
            v137 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v137, "numberWithFloat:"));
            v138 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v138, "numberWithFloat:"));
            v139 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 4), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v139, "numberWithFloat:"));
            v140 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v134, "objectAtIndexedSubscript:", 5), "floatValue");
            objc_msgSend(v133, "addObject:", objc_msgSend(v140, "numberWithFloat:"));
            objc_msgSend(v121, "setObject:forKeyedSubscript:", v133, CFSTR("transform"));
            objc_msgSend(v218, "setObject:forKeyedSubscript:", v121, CFSTR("settings"));
            j = v217;
          }
          else
          {
            if (!objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("p1")))
            {
              puts("red-eye repair dictionary is of unknown type");
              return 0;
            }
            v100 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 50);
            v141 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("p")), "componentsSeparatedByString:", CFSTR(" "));
            v142 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v141, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v142, "numberWithFloat:"), CFSTR("pointX"));
            v143 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v141, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v143, "numberWithFloat:"), CFSTR("pointY"));
            v144 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v141, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v144, "numberWithFloat:"), CFSTR("size"));
            v145 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ps")), "componentsSeparatedByString:", CFSTR(" "));
            v146 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v145, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v146, "numberWithFloat:"), CFSTR("pupilShadeLow"));
            v147 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v145, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v147, "numberWithFloat:"), CFSTR("pupilShadeMedium"));
            v148 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v145, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v148, "numberWithFloat:"), CFSTR("pupilShadeHigh"));
            v149 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v145, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v149, "numberWithFloat:"), CFSTR("pupilShadeAverage"));
            v150 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("iod")), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v150, "numberWithFloat:"), CFSTR("interocularDistance"));
            v151 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("s")), "componentsSeparatedByString:", CFSTR(" "));
            v152 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v151, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v152, "numberWithFloat:"), CFSTR("snappedX"));
            v153 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v151, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v153, "numberWithFloat:"), CFSTR("snappedY"));
            v154 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("b")), "componentsSeparatedByString:", CFSTR(" "));
            v155 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v154, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v155, "numberWithFloat:"), CFSTR("bitmaskX"));
            v156 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v154, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v156, "numberWithFloat:"), CFSTR("bitmaskY"));
            v157 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v154, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v157, "numberWithFloat:"), CFSTR("bitmaskThreshold"));
            v158 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cr")), "componentsSeparatedByString:", CFSTR(" "));
            v159 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v158, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v159, "numberWithFloat:"), CFSTR("cornealReflectionX"));
            v160 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v158, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v160, "numberWithFloat:"), CFSTR("cornealReflectionY"));
            v161 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v158, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v161, "numberWithFloat:"), CFSTR("cornealReflectionThreshold"));
            v162 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ep")), "componentsSeparatedByString:", CFSTR(" "));
            v163 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v162, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v163, "numberWithFloat:"), CFSTR("existingPupilLow"));
            v164 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v162, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v164, "numberWithFloat:"), CFSTR("existingPupilMedium"));
            v165 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v162, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v165, "numberWithFloat:"), CFSTR("existingPupilHigh"));
            v166 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v162, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v166, "numberWithFloat:"), CFSTR("existingPupilAverage"));
            v167 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("asl")), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v167, "numberWithFloat:"), CFSTR("averageSkinLuminance"));
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v224), CFSTR("imageOrientation"));
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v223), CFSTR("imageSignalToNoiseRatio"));
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v225), CFSTR("imageSpecialValue"));
            v168 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("sr")), "componentsSeparatedByString:", CFSTR(" "));
            v169 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v168, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v169, "numberWithFloat:"), CFSTR("searchRectangleMinimumY"));
            v170 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v168, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v170, "numberWithFloat:"), CFSTR("searchRectangleMaximumY"));
            v171 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v168, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v171, "numberWithFloat:"), CFSTR("searchRectangleMinimumX"));
            v172 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v168, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v172, "numberWithFloat:"), CFSTR("searchRectangleMaximumX"));
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v227), CFSTR("fullImageWidth"));
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v226), CFSTR("fullImageHeight"));
            v173 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rr")), "componentsSeparatedByString:", CFSTR(" "));
            v174 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v173, "objectAtIndexedSubscript:", 0), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v174, "numberWithFloat:"), CFSTR("repairRectangleMinimumY"));
            v175 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v173, "objectAtIndexedSubscript:", 1), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v175, "numberWithFloat:"), CFSTR("repairRectangleMaximumY"));
            v176 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v173, "objectAtIndexedSubscript:", 2), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v176, "numberWithFloat:"), CFSTR("repairRectangleMinimumX"));
            v177 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend((id)objc_msgSend(v173, "objectAtIndexedSubscript:", 3), "floatValue");
            objc_msgSend(v100, "setObject:forKeyedSubscript:", objc_msgSend(v177, "numberWithFloat:"), CFSTR("repairRectangleMaximumX"));
            v178 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("fc"));
            if (v178)
            {
              v179 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v178, "floatValue");
              v180 = (void *)objc_msgSend(v179, "numberWithFloat:");
              v181 = v100;
            }
            else
            {
              v181 = v100;
              v180 = &unk_1E2F1DAC8;
            }
            objc_msgSend(v181, "setObject:forKeyedSubscript:", v180, CFSTR("forceCase"));
            v182 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("psa"));
            if (v182)
            {
              v183 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v182, "floatValue");
              v184 = (void *)objc_msgSend(v183, "numberWithFloat:");
              v185 = v100;
            }
            else
            {
              v185 = v100;
              v184 = &unk_1E2F1DAC8;
            }
            objc_msgSend(v185, "setObject:forKeyedSubscript:", v184, CFSTR("pupilShadeAlignment"));
            v186 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("fec"));
            if (v186)
            {
              v187 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v186, "floatValue");
              v188 = (void *)objc_msgSend(v187, "numberWithFloat:");
              v189 = v100;
            }
            else
            {
              v189 = v100;
              v188 = &unk_1E2F1DAC8;
            }
            objc_msgSend(v189, "setObject:forKeyedSubscript:", v188, CFSTR("finalEyeCase"));
          }
          objc_msgSend(v6, "addObject:", v100);
        }
        v197 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v219, v258, 16);
        if (v197)
          continue;
        break;
      }
    }
    self = v194;
  }
  String = metadataPropertyArrayGetString();
  if (v6)
  {
    v191 = String;
    -[CIRedEyeCorrections setInputCorrectionInfo:](self, "setInputCorrectionInfo:", v6);
    -[CIRedEyeCorrections setInputCameraModel:](self, "setInputCameraModel:", v191);
    return self;
  }
LABEL_43:

  return 0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)inputCameraModel
{
  return self->inputCameraModel;
}

- (void)setInputCameraModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)inputCorrectionInfo
{
  return self->inputCorrectionInfo;
}

- (void)setInputCorrectionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

@end
