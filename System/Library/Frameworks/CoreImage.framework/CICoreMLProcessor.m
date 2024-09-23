@implementation CICoreMLProcessor

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputWidths"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "objectAtIndex:", a3);
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputHeights")), "objectAtIndex:", a3);
  v9 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputChans")), "objectAtIndex:", a3);
  v10 = (double)(int)objc_msgSend(v7, "intValue");
  v11 = objc_msgSend(v8, "intValue");
  v12 = (double)(int)(objc_msgSend(v9, "intValue") * v11);
  v13 = 0.0;
  v14 = 0.0;
  v15 = v10;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  OSType v13;
  OSType v14;
  size_t Width;
  size_t Height;
  char *BaseAddress;
  size_t BytesPerRow;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  CVPixelBufferRef v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  __int16 *v27;
  _DWORD *v28;
  int *v29;
  _DWORD *v30;
  __int16 *v31;
  int *v32;
  uint64_t j;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  int v47;
  __CVBuffer *v48;
  __CVBuffer *v49;
  objc_class *v50;
  id v51;
  void *v52;
  char v54;
  void *v55;
  NSObject *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  int v61;
  unint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  long double *v80;
  float v81;
  long double *v82;
  uint64_t v83;
  float v84;
  uint64_t v85;
  float *v86;
  float *v87;
  uint64_t v88;
  int v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  float *v98;
  long double *v99;
  long double v100;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  unint64_t v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  double v120;
  uint64_t v121;
  double v122;
  int v123;
  uint64_t v124;
  uint64_t *v125;
  int v128;
  uint64_t v130;
  uint64_t v131;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  CIMLFeatureProvider *v136;
  char *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v144;
  int v145;
  id obj;
  void *v147;
  uint64_t i;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  char *v160;
  uint64_t v161;
  int v162;
  uint64_t v163;
  BOOL v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  int v170;
  uint64_t v171;
  float *v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  void *v177;
  uint64_t v178;
  __CVBuffer *v179;
  _BYTE v180[128];
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  Class (*v184)(uint64_t);
  void *v185;
  CVPixelBufferRef *v186;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferRef *p_pixelBufferOut;
  uint64_t v189;
  void (*v190)(uint64_t, uint64_t);
  void (*v191)(uint64_t);
  uint64_t v192;
  uint64_t v193;
  CGRect v194;
  CGRect v195;

  v193 = *MEMORY[0x1E0C80C00];
  v177 = 0;
  v147 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("model"));
  v131 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("headName"));
  v130 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v147, "modelDescription"), "outputDescriptionsByName"), "objectForKey:", v131), "type");
  v128 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("softmax")), "BOOLValue");
  v136 = objc_alloc_init(CIMLFeatureProvider);
  v142 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputWidths"));
  v141 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputHeights"));
  v140 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputChans"));
  v139 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputFormats"));
  v173 = 0u;
  v174 = 0u;
  v175 = 0u;
  v176 = 0u;
  obj = (id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputNames"));
  v144 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v173, v180, 16);
  if (v144)
  {
    v138 = *(_QWORD *)v174;
    v133 = *MEMORY[0x1E0CA8FF0];
    do
    {
      for (i = 0; i != v144; ++i)
      {
        if (*(_QWORD *)v174 != v138)
          objc_enumerationMutation(obj);
        v150 = *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * i);
        v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v147, "modelDescription"), "inputDescriptionsByName"), "objectForKey:", v150), "type");
        v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v147, "modelDescription"), "inputDescriptionsByName"), "objectForKey:", v150);
        if (v8
          && (v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "multiArrayConstraint"), "shapeConstraint"),
              objc_msgSend(v9, "type") == 2))
        {
          v145 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "enumeratedShapes"), "objectAtIndexedSubscript:", 0), "count");
        }
        else
        {
          v145 = -1;
        }
        v10 = objc_msgSend(obj, "indexOfObject:", v150);
        v11 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v10);
        v169 = objc_msgSend((id)objc_msgSend(v142, "objectAtIndexedSubscript:", v10), "unsignedLongValue");
        v171 = objc_msgSend((id)objc_msgSend(v141, "objectAtIndexedSubscript:", v10), "unsignedLongValue");
        v12 = objc_msgSend((id)objc_msgSend(v140, "objectAtIndexedSubscript:", v10), "intValue");
        v13 = objc_msgSend((id)objc_msgSend(v139, "objectAtIndexedSubscript:", v10), "unsignedLongValue");
        if (v7 == 5)
        {
          v163 = objc_msgSend(v11, "baseAddress");
          v161 = objc_msgSend(v11, "baseAddress");
          v23 = objc_msgSend(v11, "bytesPerRow");
          if (objc_msgSend(v11, "format") == 2309)
            v24 = 2;
          else
            v24 = 1;
          v135 = v171 * v169;
          v156 = v12;
          v134 = v171 * v169 * v12;
          v137 = (char *)malloc_type_malloc(4 * v134, 0x923E5137uLL);
          if (v12)
          {
            v25 = 0;
            v152 = 2 * v171 * (v23 >> v24);
            v154 = 4 * v171 * (v23 >> v24);
            v166 = 2 * (v23 >> v24);
            v168 = 4 * (v23 >> v24);
            v160 = v137;
            do
            {
              v158 = v25;
              if (v171)
              {
                v26 = 0;
                v28 = v160;
                v27 = (__int16 *)v161;
                v29 = (int *)v163;
                do
                {
                  v30 = v28;
                  v31 = v27;
                  v32 = v29;
                  for (j = v169; j; --j)
                  {
                    if (objc_msgSend(v11, "format") == 2312)
                    {
                      _S0 = *v32;
                    }
                    else
                    {
                      _H0 = *v31;
                      __asm { FCVT            S0, H0 }
                    }
                    *v30++ = _S0;
                    ++v32;
                    ++v31;
                  }
                  ++v26;
                  v29 = (int *)((char *)v29 + v168);
                  v27 = (__int16 *)((char *)v27 + v166);
                  v28 += v169;
                }
                while (v26 != v171);
              }
              v25 = v158 + 1;
              v163 += v154;
              v161 += v152;
              v160 += 4 * v171 * v169;
            }
            while (v158 + 1 != v156);
          }
          if (v145 == 3)
          {
            pixelBufferOut = (CVPixelBufferRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v156);
            p_pixelBufferOut = (CVPixelBufferRef *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v171);
            v189 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v169);
            v39 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &pixelBufferOut, 3);
            v182 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v135);
            v183 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v169);
            v184 = (Class (*)(uint64_t))objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1);
            v40 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v182, 3);
          }
          else
          {
            pixelBufferOut = (CVPixelBufferRef)&unk_1E2F1B6B0;
            p_pixelBufferOut = (CVPixelBufferRef *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v156);
            v189 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v171);
            v190 = (void (*)(uint64_t, uint64_t))objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v169);
            v39 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &pixelBufferOut, 4);
            v182 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v134);
            v183 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v135);
            v184 = (Class (*)(uint64_t))objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v169);
            v185 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1);
            v40 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v182, 4);
          }
          v41 = (void *)objc_msgSend(objc_alloc((Class)getMLMultiArrayClass()), "initWithDataPointer:shape:dataType:strides:deallocator:error:", v137, v39, 65568, v40, &__block_literal_global_14, &v177);
          -[CIMLFeatureProvider addOject:forName:](v136, "addOject:forName:", v41, v150);

        }
        else if (v7 == 4)
        {
          v14 = v13;
          pixelBufferOut = 0;
          Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v11, "pixelBuffer"));
          Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v11, "pixelBuffer"));
          v181 = v133;
          v182 = MEMORY[0x1E0C9AA70];
          CVPixelBufferCreate(0, Width, Height, v14, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1), &pixelBufferOut);
          if (pixelBufferOut)
          {
            CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
            BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
            v19 = objc_msgSend(v11, "baseAddress");
            if (Height)
            {
              v20 = v19;
              for (k = 0; k != Height; ++k)
              {
                memcpy(BaseAddress, (const void *)(v20 + objc_msgSend(v11, "bytesPerRow") * k), BytesPerRow);
                BaseAddress += BytesPerRow;
              }
            }
            CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
            v22 = pixelBufferOut;
          }
          else
          {
            v22 = 0;
          }
          -[CIMLFeatureProvider addOject:forName:](v136, "addOject:forName:", v22, v150);
          CFRelease(v22);
        }
      }
      v144 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v173, v180, 16);
    }
    while (v144);
  }
  if (v130 != 4)
    goto LABEL_49;
  shapeForLayer(v147, v131, 1);
  v43 = v42;
  v45 = v44;
  objc_msgSend(a5, "region");
  v195.origin.x = 0.0;
  v195.origin.y = 0.0;
  v195.size.width = v43;
  v195.size.height = v45;
  if (!CGRectEqualToRect(v194, v195))
    goto LABEL_49;
  v46 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v147, "modelDescription"), "outputDescriptionsByName"), "objectForKey:", v131);
  v47 = v46 ? objc_msgSend((id)objc_msgSend(v46, "imageConstraint"), "pixelFormatType") : 0;
  v48 = (__CVBuffer *)objc_msgSend(a5, "pixelBuffer");
  v49 = v48;
  if (v48 && CVPixelBufferGetPixelFormatType(v48) == v47)
  {
    pixelBufferOut = 0;
    p_pixelBufferOut = &pixelBufferOut;
    v189 = 0x3052000000;
    v190 = __Block_byref_object_copy__2;
    v191 = __Block_byref_object_dispose__2;
    v50 = (objc_class *)getMLPredictionOptionsClass(void)::softClass;
    v192 = getMLPredictionOptionsClass(void)::softClass;
    if (!getMLPredictionOptionsClass(void)::softClass)
    {
      v182 = MEMORY[0x1E0C809B0];
      v183 = 3221225472;
      v184 = ___ZL27getMLPredictionOptionsClassv_block_invoke;
      v185 = &unk_1E2EC2EB8;
      v186 = &pixelBufferOut;
      ___ZL27getMLPredictionOptionsClassv_block_invoke((uint64_t)&v182);
      v50 = p_pixelBufferOut[5];
    }
    _Block_object_dispose(&pixelBufferOut, 8);
    v51 = objc_alloc_init(v50);
    v178 = v131;
    v179 = v49;
    objc_msgSend(v51, "setOutputBackings:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1));
  }
  else
  {
LABEL_49:
    v51 = 0;
  }
  v52 = (void *)objc_msgSend(v147, "predictionFromFeatures:options:error:", v136, v51, &v177);

  if (v177)
    _ZF = 1;
  else
    _ZF = v52 == 0;
  v54 = !_ZF;
  v164 = v54;
  if (_ZF)
  {
    if (a6 && v177)
      *a6 = v177;
    v56 = ci_logger_api();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      +[CICoreMLProcessor processWithInputs:arguments:output:error:].cold.1(v56);
  }
  else
  {
    v55 = (void *)objc_msgSend(v52, "featureValueForName:", v131);
    if (objc_msgSend(v55, "type") == 4)
    {
      objc_msgSend(v55, "imageBufferValue");
    }
    else if (objc_msgSend(v55, "type") == 5)
    {
      v57 = (void *)objc_msgSend(v55, "multiArrayValue");
      if (objc_msgSend(v57, "dataType") == 65600)
        v58 = v128;
      else
        v58 = 0;
      if (v58 == 1)
      {
        v157 = objc_msgSend(v57, "dataPointer");
        v59 = (void *)objc_msgSend(v57, "shape");
        v60 = objc_msgSend(v59, "count");
        v170 = objc_msgSend((id)objc_msgSend(v59, "objectAtIndexedSubscript:", v60 - 3), "intValue");
        v159 = objc_msgSend((id)objc_msgSend(v59, "objectAtIndexedSubscript:", v60 - 2), "intValue");
        v61 = objc_msgSend((id)objc_msgSend(v59, "objectAtIndexedSubscript:", v60 - 1), "intValue");
        v151 = objc_msgSend(a5, "baseAddress");
        v62 = objc_msgSend(a5, "bytesPerRow");
        objc_msgSend(a5, "region");
        v64 = v63;
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v155 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "strides"), "objectAtIndexedSubscript:", v60 - 3), "unsignedLongValue");
        v153 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "strides"), "objectAtIndexedSubscript:", v60 - 2), "unsignedLongValue");
        v71 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "strides"), "objectAtIndexedSubscript:", v60 - 1), "unsignedLongValue");
        objc_msgSend(a5, "region");
        v73 = v72;
        v74 = objc_msgSend(a5, "bytesPerRow");
        objc_msgSend(a5, "region");
        bzero((void *)objc_msgSend(a5, "baseAddress"), v74 * ((int)v73 - 1) + 2 * (int)v75);
        v172 = (float *)malloc_type_calloc(v61 * v159, 4uLL, 0x100004052888210uLL);
        v76 = 8 * v71;
        if (v159 >= 1)
        {
          v149 = v71;
          v167 = 0;
          v77 = v61;
          v165 = v157;
          v162 = v61;
          do
          {
            if (v61 >= 1)
            {
              v78 = 0;
              v79 = v167 * v159;
              v80 = (long double *)v165;
              do
              {
                if (v170 >= 1)
                {
                  v81 = v172[v78 + v79];
                  v82 = v80;
                  v83 = v170;
                  do
                  {
                    v84 = exp(*v82);
                    v81 = v81 + v84;
                    v82 += v155;
                    --v83;
                  }
                  while (v83);
                  v172[v78 + v79] = v81;
                }
                ++v78;
                v80 = (long double *)((char *)v80 + v76);
              }
              while (v78 != v77);
            }
            v165 += 8 * v153;
            ++v167;
            v61 = v162;
          }
          while (v167 != v159);
          v85 = 0;
          v86 = v172;
          v71 = v149;
          do
          {
            v87 = v86;
            v88 = v77;
            if (v162 >= 1)
            {
              do
              {
                *v87 = 1.0 / *v87;
                ++v87;
                --v88;
              }
              while (v88);
            }
            ++v85;
            v86 += v159;
          }
          while (v85 != v159);
        }
        if (v70 > 0.0)
        {
          v89 = 0;
          v90 = (int)v66;
          v91 = (int)v64;
          v92 = 2 * (v62 >> 1);
          v93 = v151;
          v94 = v71 * v91;
          do
          {
            if (v68 > 0.0)
            {
              v95 = 0;
              v96 = v93;
              v97 = (v89 + v90) % v159;
              v98 = &v172[v91 + v97 * v159];
              v99 = (long double *)(v157 + 8 * (v94 + v155 * ((v89 + v90) / v159) + v153 * v97));
              do
              {
                v100 = exp(*v99);
                v93 = v96;
                _D0 = v100 * v98[v95];
                __asm { FCVT            H0, D0 }
                *(_WORD *)(v96 + 2 * v95++) = LOWORD(_D0);
                v99 = (long double *)((char *)v99 + v76);
              }
              while (v68 > (double)(int)v95);
            }
            ++v89;
            v93 += v92;
          }
          while (v70 > (double)v89);
        }
        free(v172);
      }
      else if (objc_msgSend(v57, "dataType") == 65600)
      {
        v102 = objc_msgSend(v57, "dataPointer");
        v103 = (void *)objc_msgSend(v57, "shape");
        v104 = objc_msgSend(v103, "count");
        v105 = objc_msgSend((id)objc_msgSend(v103, "objectAtIndexedSubscript:", v104 - 2), "intValue");
        v106 = objc_msgSend(a5, "baseAddress");
        v107 = objc_msgSend(a5, "bytesPerRow");
        objc_msgSend(a5, "region");
        v109 = v108;
        v111 = v110;
        v113 = v112;
        v115 = v114;
        v116 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "strides"), "objectAtIndexedSubscript:", v104 - 3), "unsignedLongValue");
        v117 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "strides"), "objectAtIndexedSubscript:", v104 - 2), "unsignedLongValue");
        v118 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "strides"), "objectAtIndexedSubscript:", v104 - 1), "unsignedLongValue");
        objc_msgSend(a5, "region");
        v120 = v119;
        v121 = objc_msgSend(a5, "bytesPerRow");
        objc_msgSend(a5, "region");
        bzero((void *)objc_msgSend(a5, "baseAddress"), v121 * ((int)v120 - 1) + 2 * (int)v122);
        if (v115 > 0.0)
        {
          v123 = 0;
          do
          {
            if (v113 > 0.0)
            {
              v124 = 0;
              v125 = (uint64_t *)(v102
                               + 8
                               * (v118 * (int)v109
                                + v116 * ((v123 + (int)v111) / v105)
                                + v117 * ((v123 + (int)v111) % v105)));
              do
              {
                _D0 = *v125;
                __asm { FCVT            H0, D0 }
                *(_WORD *)(v106 + 2 * v124++) = _D0;
                v125 += v118;
              }
              while (v113 > (double)(int)v124);
            }
            ++v123;
            v106 += 2 * (v107 >> 1);
          }
          while (v115 > (double)v123);
        }
      }
      else if (objc_msgSend(v57, "dataType") == 65568)
      {
        fillMultiArrayFloatToRh<float>(a5, v57);
      }
      else if (objc_msgSend(v57, "dataType") == 65552)
      {
        _ZL23fillMultiArrayFloatToRhIDF16_EvPU33objcproto22CIImageProcessorOutput11objc_objectP12MLMultiArray(a5, v57);
      }
    }
  }
  return v164;
}

+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4
{
  return objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputCIFormat")), "intValue");
}

+ (int)outputFormatWithArguments:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("outputCIFormat")), "intValue");
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (void)processWithInputs:(os_log_t)log arguments:output:error:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136446210;
  v2 = "+[CICoreMLProcessor processWithInputs:arguments:output:error:]";
  _os_log_error_impl(&dword_1921E4000, log, OS_LOG_TYPE_ERROR, "%{public}s prediction error", (uint8_t *)&v1, 0xCu);
}

@end
