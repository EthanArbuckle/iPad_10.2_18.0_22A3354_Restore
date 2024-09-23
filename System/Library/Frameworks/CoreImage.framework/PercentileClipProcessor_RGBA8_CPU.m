@implementation PercentileClipProcessor_RGBA8_CPU

+ (int)outputFormat
{
  return 266;
}

+ (int)formatForInputAtIndex:(int)a3
{
  int *v3;

  if ((a3 - 1) < 2)
  {
    v3 = &kCIFormatRGBAh;
    return *v3;
  }
  if ((a3 - 3) < 2)
  {
    v3 = &kCIFormatR8;
    return *v3;
  }
  if (!a3)
  {
    v3 = &kCIFormatBGRA8;
    return *v3;
  }
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  if ((a3 - 1) >= 2)
  {
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("roi"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, v5, v6), "CGRectValue");
  }
  else
  {
    v7 = 1.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 1.0;
  }
  result.size.height = v10;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

+ (BOOL)canReduceOutputChannels
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGPoint)centerInImg:(id)a3 fromRect:(CGRect)a4 toRect:(CGRect)a5 offset:(CGPoint)a6
{
  double height;
  double y;
  double x;
  double v9;
  double v10;
  vImage_Buffer dest;
  vImage_Buffer src;
  float v13[4];
  uint64_t v14;
  double v15;
  double v16;
  CGPoint result;

  height = a5.size.height;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&src.height = xmmword_19248E2C0;
  src.rowBytes = 8;
  dest.data = v13;
  *(_OWORD *)&dest.height = xmmword_19248E2C0;
  dest.rowBytes = 16;
  src.data = (void *)objc_msgSend(a3, "baseAddress", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width);
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
  v9 = roundf(v13[0]) - v15 - x;
  v10 = height - (roundf(v13[1]) - v16 - y) + -1.0;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t *v32;
  double v33;
  unint64_t *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
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
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  char v68;
  double v69;
  float v70;
  double v71;
  float v72;
  double v73;
  double v74;
  double v75;
  NSObject *v76;
  NSObject *v77;
  unint64_t v78;
  unint64_t v79;
  void *v80;
  uint64_t v81;
  float v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  vImagePixelCount *v93;
  vImage_Error v94;
  unint64_t *v95;
  unint64_t *v96;
  unsigned int v97;
  float v98;
  float PercentileNonZero;
  double v100;
  double v101;
  double v102;
  float v103;
  unsigned int v104;
  double v105;
  double v106;
  double v107;
  unsigned int v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  int v116;
  float v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned __int8 *v121;
  unsigned int v122;
  double v123;
  unsigned int v124;
  float v125;
  float v126;
  float v127;
  float v128;
  int v129;
  _BOOL4 v130;
  BOOL v132;
  unint64_t v133;
  unint64_t v134;
  int v135;
  BOOL v136;
  float v137;
  float v138;
  NSObject *v139;
  NSObject *v140;
  int v141;
  void *v142;
  NSObject *v143;
  NSObject *v144;
  NSObject *v145;
  NSObject *v146;
  float v147;
  float v148;
  float v149;
  float v150;
  NSObject *v151;
  NSObject *v152;
  float v153;
  double v154;
  double v155;
  float v156;
  char v157;
  int v158;
  NSObject *v159;
  float v160;
  float v161;
  void *v162;
  void *v163;
  NSObject *v164;
  double v165;
  double v166;
  float v167;
  double v168;
  double v169;
  float v170;
  float v171;
  NSObject *v172;
  float v173;
  NSObject *v174;
  float v175;
  void *v176;
  float v177;
  float v178;
  float v179;
  float v180;
  float v181;
  float v182;
  float v183;
  float v184;
  double v185;
  unint64_t v186;
  unsigned __int8 *v187;
  double v188;
  double v189;
  double v190;
  void *v191;
  float log;
  unint64_t *loga;
  NSObject *logb;
  NSObject *logc;
  unint64_t *v196;
  unint64_t *v197;
  unsigned __int8 v198;
  double v199;
  void *v200;
  unint64_t *v201;
  vImagePixelCount *v202;
  unsigned int v203;
  double v204;
  unsigned int v205;
  unsigned int v206;
  float v207;
  vImage_Buffer src;
  uint8_t buf[4];
  const char *v210;
  __int16 v211;
  unsigned int v212;
  __int16 v213;
  unsigned int v214;
  __int16 v215;
  unsigned int v216;
  __int16 v217;
  unsigned int v218;
  vImagePixelCount *histogram[4];
  uint64_t v220;
  CGPoint v221;
  CGPoint v222;

  v220 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("threshold"));
  v176 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("area"));
  v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("centerOffsetLeft"));
  v12 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("centerOffsetRight"));
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("interPeakMinRepair")), "floatValue");
  v180 = v13;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("abortMaxCenterDist")), "floatValue");
  log = v14;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("densityRadius")), "floatValue");
  v181 = v15;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("minDensity")), "floatValue");
  v182 = v16;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("maxRelDensity")), "floatValue");
  v183 = v17;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("minGobalLocalMeanDiff")), "floatValue");
  v175 = v18;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("percentileRepair")), "floatValue");
  v179 = v19;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("percentileSpecular")), "floatValue");
  v178 = v20;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("percentRepair")), "floatValue");
  v177 = v21;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("percentSpecular")), "floatValue");
  v184 = v22;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("centerExtentLeft")), "CGRectValue");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("centerExtentRight")), "CGRectValue");
  v201 = v32;
  v204 = v31;
  v196 = v34;
  v199 = v33;
  v35 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  objc_msgSend(v35, "format");
  objc_msgSend(a5, "format");
  objc_msgSend(v35, "region");
  v188 = v37;
  v190 = v36;
  v187 = (unsigned __int8 *)objc_msgSend(v35, "baseAddress");
  v186 = objc_msgSend(v35, "bytesPerRow");
  clearOutput(a5);
  v38 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  v39 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 2);
  if (objc_msgSend(v38, "format") == 2056)
    objc_msgSend(v39, "format");
  objc_msgSend(v35, "region");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  objc_msgSend(v11, "CGPointValue");
  objc_msgSend(a1, "centerInImg:fromRect:toRect:offset:", v38, v24, v26, v28, v30, v41, v43, v45, v47, v48, v49);
  v51 = v50;
  v53 = v52;
  objc_msgSend(v35, "region");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;
  objc_msgSend(v12, "CGPointValue");
  objc_msgSend(a1, "centerInImg:fromRect:toRect:offset:", v39, v204, *(double *)&v201, v199, *(double *)&v196, v55, v57, v59, v61, v62, v63);
  v65 = v64;
  v67 = v66;
  v68 = 0;
  objc_msgSend(v35, "region");
  v70 = v69 * 0.5;
  objc_msgSend(v35, "region");
  v72 = v71 * 0.5;
  v73 = v70;
  v74 = vabdd_f64(v51, v70);
  v75 = (float)(v70 * 0.8);
  if (v74 > v75 || vabdd_f64(v53, v72) > (float)(v72 * 0.8))
  {
    if (CI_LOG_DUALRED())
    {
      v76 = ci_logger_api();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.16();
    }
    v68 = 1;
  }
  if (vabdd_f64(v65, v73) > v75 || vabdd_f64(v67, v72) > (float)(v72 * 0.8))
  {
    if (CI_LOG_DUALRED())
    {
      v77 = ci_logger_api();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.1();
    }
    return 1;
  }
  if ((v68 & 1) != 0)
    return 1;
  v78 = (unint64_t)v190;
  v79 = (unint64_t)v188;
  v80 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 3);
  v81 = objc_msgSend(a3, "objectAtIndexedSubscript:", 4);
  if (objc_msgSend(v80, "format") == 261)
    objc_msgSend(v80, "format");
  v82 = (v53 - v67) / (double)v79 * ((v53 - v67) / (double)v79)
      + (v51 - v65) / (double)v78 * ((v51 - v65) / (double)v78);
  if (sqrtf(v82) > log)
  {
    if (CI_LOG_DUALRED())
    {
      v83 = ci_logger_api();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.2(v83, v84, v85, v86, v87, v88, v89, v90);
    }
    return 1;
  }
  src.data = v187;
  src.height = (unint64_t)v188;
  src.width = (unint64_t)v190;
  src.rowBytes = v186;
  v93 = (vImagePixelCount *)malloc_type_calloc(0x400uLL, 8uLL, 0x100004000313F17uLL);
  histogram[0] = v93;
  histogram[1] = v93 + 256;
  histogram[2] = v93 + 512;
  histogram[3] = v93 + 768;
  v94 = vImageHistogramCalculation_ARGB8888(&src, histogram, 0);
  v91 = v94 == 0;
  if (v94)
  {
    free(v93);
    return v91;
  }
  v200 = v80;
  v191 = (void *)v81;
  v96 = histogram[0];
  v95 = histogram[1];
  v202 = histogram[3];
  loga = histogram[2];
  v205 = (int)(float)(v177 * findPercentileNonZero(histogram[2], v179, 0xFFuLL, 0x100uLL));
  v97 = (int)(float)(v184 * findPercentileNonZero(v95, v178, 0xFFuLL, 0x100uLL));
  v197 = v96;
  v98 = v177 * findPercentileNonZero(v96, v179, 0xFFuLL, 0x100uLL);
  PercentileNonZero = findPercentileNonZero(v202, v178, 0xFFuLL, 0x100uLL);
  objc_msgSend(v10, "X");
  v101 = (double)v205;
  if (v100 * 255.0 > (double)v205)
  {
    objc_msgSend(v10, "X");
    v101 = v102 * 255.0;
  }
  v103 = v184 * PercentileNonZero;
  v104 = (int)v98;
  objc_msgSend(v10, "Y");
  v106 = (double)v97;
  if (v105 * 255.0 > (double)v97)
  {
    objc_msgSend(v10, "Y");
    v106 = v107 * 255.0;
  }
  v189 = v106;
  v108 = (int)v103;
  objc_msgSend(v10, "Z");
  v110 = v109 * 255.0;
  v111 = (double)v104;
  if (v110 > (double)v104)
  {
    objc_msgSend(v10, "Z");
    v111 = v112 * 255.0;
  }
  v206 = (int)v101;
  v203 = (int)v111;
  objc_msgSend(v10, "W");
  v114 = (double)v108;
  if (v113 * 255.0 > (double)v108)
  {
    objc_msgSend(v10, "W");
    v114 = v115 * 255.0;
  }
  v185 = v114;
  v116 = (int)findPercentileNonZero(loga, 0.25, 0xFFuLL, 0x100uLL);
  v117 = findPercentileNonZero(v197, 0.25, 0xFFuLL, 0x100uLL);
  v198 = v206 - v116;
  v118 = v203 - (int)v117;
  if ((v206 - v116) >= (v203 - (int)v117))
    v119 = (v203 - (int)v117);
  else
    v119 = (v206 - v116);
  v120 = (int)(float)(v180 * 255.0);
  if (v119 < v120)
  {
    if (CI_LOG_DUALRED())
    {
      logb = ci_logger_api();
      if (os_log_type_enabled(logb, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.15(v119, v120, logb);
    }
  }
  free(v93);
  v121 = v187;
  v122 = v187[(unint64_t)(v51 * 4.0 + v53 * (double)v186 + 2.0)];
  v123 = v65 * 4.0 + v67 * (double)v186 + 0.0;
  v124 = v187[(unint64_t)v123];
  v125 = (float)v122;
  v126 = (float)v206 * 0.5;
  v127 = (float)v124;
  v128 = (float)v203 * 0.5;
  if (v126 >= (float)v122 || v128 >= v127)
  {
    v129 = CI_LOG_DUALRED();
    v121 = v187;
    if (v129)
    {
      logc = ci_logger_api();
      v130 = os_log_type_enabled(logc, OS_LOG_TYPE_ERROR);
      v121 = v187;
      if (v130)
      {
        *(float *)buf = 4.8756e-34;
        v210 = "+[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]";
        v211 = 1024;
        v212 = v122;
        v213 = 1024;
        v214 = v206;
        v215 = 1024;
        v216 = v124;
        v217 = 1024;
        v218 = v203;
        _os_log_error_impl(&dword_1921E4000, logc, OS_LOG_TYPE_ERROR, "%{public}s [abort] Center pixel failed: L = %hhu < %hhu | R = %hhu < %hhu", buf, 0x24u);
        v121 = v187;
      }
    }
  }
  v132 = v128 >= v127 || v120 > v118;
  if (v78 >= v79)
    v133 = v79;
  else
    v133 = v78;
  v134 = (unint64_t)(float)(v181 * (float)v133);
  *(float *)buf = 0.0;
  v207 = 0.0;
  v135 = 1;
  if (v120 > v198)
  {
    v138 = v182;
    v137 = v183;
  }
  else
  {
    v136 = v126 < v125;
    v138 = v182;
    v137 = v183;
    if (v136)
    {
      v221.x = v51;
      v221.y = v53;
      computeDensity(v121, 2u, v78, v79, v186, v206, v221, v134, (float *)buf);
      if (CI_LOG_DUALRED())
      {
        v139 = ci_logger_api();
        if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.14();
      }
      if (*(float *)buf >= v182)
      {
        v135 = 0;
      }
      else if (CI_LOG_DUALRED())
      {
        v140 = ci_logger_api();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
          +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.13();
      }
      v121 = v187;
    }
  }
  if (v132)
  {
    v141 = 1;
    v142 = v200;
  }
  else
  {
    v222.x = v65;
    v222.y = v67;
    computeDensity(v121, 0, v78, v79, v186, v203, v222, v134, &v207);
    if (CI_LOG_DUALRED())
    {
      v143 = ci_logger_api();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.12();
    }
    v142 = v200;
    if (v207 >= v138)
    {
      v141 = 0;
    }
    else
    {
      if (CI_LOG_DUALRED())
      {
        v144 = ci_logger_api();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
          +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.11();
      }
      v141 = 1;
    }
  }
  if (*(float *)buf > v137)
  {
    if (CI_LOG_DUALRED())
    {
      v145 = ci_logger_api();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.10();
    }
    v135 = 1;
  }
  *(float *)&v123 = v207;
  if (v207 > v137)
  {
    if (CI_LOG_DUALRED())
    {
      v146 = ci_logger_api();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.9();
    }
    v141 = 1;
  }
  if ((v135 & v141 & 1) != 0)
    return v91;
  v147 = -1.0;
  v148 = -1.0;
  if ((v135 & 1) == 0)
  {
    sampleUnderCentroid(v142, v51, v53, 0.14);
    v148 = *(float *)&v123;
  }
  if ((v141 & 1) == 0)
  {
    sampleUnderCentroid(v191, v65, v67, 0.14);
    v147 = *(float *)&v123;
  }
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("minInterDispersion"), v123), "floatValue");
  v150 = v149;
  if (v148 < v149)
  {
    if (CI_LOG_DUALRED())
    {
      v151 = ci_logger_api();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.8(v148);
    }
    v135 = 1;
  }
  if (v147 < v150)
  {
    if (CI_LOG_DUALRED())
    {
      v152 = ci_logger_api();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.7(v147);
    }
    v141 = 1;
  }
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("maxInterDispersion")), "floatValue");
  v154 = vabds_f32(v148, v147);
  v155 = (float)(v148 + v147);
  if (v155 < 0.000001)
    v155 = 0.000001;
  v156 = v154 / v155;
  if (v153 >= v156)
    v157 = 1;
  else
    v157 = v135;
  if ((v141 & 1) == 0 && (v157 & 1) == 0)
  {
    v158 = CI_LOG_DUALRED();
    if (v147 >= v148)
    {
      if (v158)
      {
        v164 = ci_logger_api();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.6(v156);
      }
    }
    else if (v158)
    {
      v159 = ci_logger_api();
      if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.5(v156);
    }
    return v91;
  }
  if (((v141 | v135) & 1) != 0)
    return v91;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("areaMaxRatio")), "floatValue");
  v161 = v160;
  if (v160 > 0.0)
  {
    v162 = v176;
    v163 = v191;
LABEL_121:
    objc_msgSend(v162, "Y");
    radialFillRGBA8_circular(v35, a5, 1, 0, (unint64_t)v166, 0.2, v51, v53);
    goto LABEL_122;
  }
  v162 = v176;
  objc_msgSend(v176, "Y");
  v163 = v191;
  if (radialFillRGBA8(v35, a5, 1, (int)v189, (unint64_t)v165, v51, v53) <= 8)
    goto LABEL_121;
LABEL_122:
  clipRepair(v35, a5, 2, v206);
  calculateMeans(v142, a5, 2, v51, v53);
  if (v167 < v175)
  {
    v173 = v167;
    if (CI_LOG_DUALRED())
    {
      v174 = ci_logger_api();
      if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.4(v173);
    }
    goto LABEL_133;
  }
  if (v161 > 0.0
    || (objc_msgSend(v162, "W"), radialFillRGBA8(v35, a5, 3, (int)v185, (unint64_t)v168, v65, v67) <= 8))
  {
    objc_msgSend(v162, "W");
    radialFillRGBA8_circular(v35, a5, 3, 0, (unint64_t)v169, 0.2, v65, v67);
  }
  clipRepair(v35, a5, 0, v203);
  calculateMeans(v163, a5, 0, v65, v67);
  if (v170 < v175)
  {
    v171 = v170;
    if (CI_LOG_DUALRED())
    {
      v172 = ci_logger_api();
      if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
        +[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:].cold.3(v171);
    }
LABEL_133:
    clearOutput(a5);
  }
  return v91;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, v0, v1, "%{public}s [abort] Centroid distance from R center failed: (%.0f, %.0f)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:(uint64_t)a3 arguments:(uint64_t)a4 output:(uint64_t)a5 error:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, a1, a3, "%{public}s [abort] Inter centroid distance failed: %.3f > %.3f", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.3(float a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14(*MEMORY[0x1E0C80C00], a1);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v1, v2, "%{public}s [abort] Mask response (R) too close to global: %.0f%%", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.4(float a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14(*MEMORY[0x1E0C80C00], a1);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v1, v2, "%{public}s [abort] Mask response (L) too close to global: %.0f%%", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.5(float a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00], a1);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v1, v2, "%{public}s [abort] Maximum inter dispersion reached: %.3f. Eliminating right.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.6(float a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00], a1);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v1, v2, "%{public}s [abort] Maximum inter dispersion reached: %.3f. Eliminating left.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.7(float a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00], a1);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v1, v2, "%{public}s [abort] Minimum dispersion not reached (R): %.3f", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)processWithInputs:(float)a1 arguments:output:error:.cold.8(float a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00], a1);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v1, v2, "%{public}s [abort] Minimum dispersion not reached (L): %.3f", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)processWithInputs:arguments:output:error:.cold.9()
{
  float v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, v1, v2, "%{public}s [abort] Maximum density failed (right): %.4f > %.4f", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:arguments:output:error:.cold.10()
{
  float v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, v1, v2, "%{public}s [abort] Maximum density failed (left): %.4f > %.4f", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:arguments:output:error:.cold.11()
{
  float v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, v1, v2, "%{public}s [abort] Minimum density failed (right): %.4f < %.4f", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:arguments:output:error:.cold.12()
{
  float v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, v1, v2, "%{public}s Density (right): %.4f < %.4f", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:arguments:output:error:.cold.13()
{
  float v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, v1, v2, "%{public}s [abort] Minimum density failed (left): %.4f < %.4f", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:arguments:output:error:.cold.14()
{
  float v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, v1, v2, "%{public}s Density (left): %.4f < %.4f", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:(os_log_t)log arguments:output:error:.cold.15(int a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136446978;
  v4 = "+[PercentileClipProcessor_RGBA8_CPU processWithInputs:arguments:output:error:]";
  v5 = 2048;
  v6 = 0x3FD0000000000000;
  v7 = 1024;
  v8 = a1;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_1921E4000, log, OS_LOG_TYPE_ERROR, "%{public}s [abort] Interpeak percentile distance failed at p=%.2f: %hhu < %hhu", (uint8_t *)&v3, 0x22u);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:arguments:output:error:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_3(&dword_1921E4000, v0, v1, "%{public}s [abort] Centroid distance from L center failed: (%.0f, %.0f)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:(uint64_t)a3 arguments:(uint64_t)a4 output:(uint64_t)a5 error:(uint64_t)a6 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s [abort] L center is NaN", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
