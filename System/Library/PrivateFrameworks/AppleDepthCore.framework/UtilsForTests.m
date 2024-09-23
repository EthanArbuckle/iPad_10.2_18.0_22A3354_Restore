@implementation UtilsForTests

+ (unint64_t)preferredEspressoEngine
{
  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
    return 4;
  else
    return 2;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreRefZeros:(BOOL)a5
{
  float v5;
  float v6;
  float v7;
  float v8;
  BaselineTestStats_s result;

  objc_msgSend(a1, "compareBuffer:offset:toRefBuffer:ignoreRefZeros:", a3, a4, a5, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  result.var3 = v8;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreResultZeros:(BOOL)a5 ignoreRefZeros:(BOOL)a6
{
  double v6;
  float v7;
  float v8;
  float v9;
  float v10;
  BaselineTestStats_s result;

  LODWORD(v6) = 1064514355;
  +[UtilsForTests compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:](UtilsForTests, "compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", a3, a4, a5, a6, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), v6);
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 offset:(CGSize)a4 toRefBuffer:(__CVBuffer *)a5 ignoreRefZeros:(BOOL)a6
{
  double v6;
  float v7;
  float v8;
  float v9;
  float v10;
  BaselineTestStats_s result;

  LODWORD(v6) = 1064514355;
  +[UtilsForTests compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:](UtilsForTests, "compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", a3, a5, 0, a6, a4.width, a4.height, v6);
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 toRefBuffer:(__CVBuffer *)a4 ignoreRefZeros:(BOOL)a5 outlierPercentile:(float)a6
{
  double v6;
  float v7;
  float v8;
  float v9;
  float v10;
  BaselineTestStats_s result;

  *(float *)&v6 = a6;
  +[UtilsForTests compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:](UtilsForTests, "compareBuffer:offset:toRefBuffer:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", a3, a4, 0, a5, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), v6);
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (BaselineTestStats_s)compareVImageBuffer:(vImage_Buffer *)a3 pixelTypeResult:(unsigned int)a4 offset:(CGSize)a5 toRefBuffer:(vImage_Buffer *)a6 pixelTypeRef:(unsigned int)a7 ignoreResultZeros:(BOOL)a8 ignoreRefZeros:(BOOL)a9 outlierPercentile:(float)a10
{
  PixelBufferUtils *v11;
  double height;
  double width;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t rowBytes;
  size_t v24;
  char *v25;
  int v26;
  int v27;
  float v28;
  float v29;
  float v30;
  float v31;
  int v32;
  float v33;
  float v34;
  float v35;
  int v36;
  int v37;
  float *v38;
  uint64_t v39;
  float *v40;
  unint64_t v41;
  uint64_t v42;
  unsigned int v43;
  BOOL v44;
  unint64_t v45;
  char *v46;
  float *v47;
  float v48;
  float *v49;
  float v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  float v55;
  float *v56;
  int v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  uint64_t v61;
  float *v62;
  unint64_t v63;
  unint64_t v64;
  int v65;
  unint64_t v66;
  BOOL v67;
  int v68;
  unint64_t v69;
  char *v70;
  char *v71;
  float *v77;
  float v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  float *v85;
  int v86;
  uint64_t v87;
  unint64_t v88;
  int v89;
  int v90;
  int v91;
  float v92;
  float *v93;
  uint64_t v94;
  float v95;
  uint64_t v96;
  uint64_t v97;
  float *v98;
  unint64_t v99;
  unint64_t v100;
  int v101;
  unint64_t v102;
  BOOL v103;
  int v104;
  unint64_t v105;
  char *v106;
  float *v107;
  float v108;
  float *v109;
  float v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  float v117;
  float *v118;
  int v119;
  uint64_t v120;
  unint64_t v121;
  int v122;
  int v123;
  float v124;
  float v125;
  int v126;
  int v127;
  uint64_t v128;
  float v129;
  float *v130;
  uint64_t v131;
  float v132;
  float *v133;
  uint64_t v134;
  float v135;
  uint64_t v136;
  char *v137;
  char *v138;
  char *v139;
  uint64_t v140;
  char *v141;
  char *v142;
  char *v143;
  size_t v144;
  size_t v145;
  size_t v146;
  size_t v147;
  size_t v148;
  size_t v149;
  unint64_t v150;
  BaselineTestStats_s result;

  v11 = *(PixelBufferUtils **)&a7;
  height = a5.height;
  width = a5.width;
  v17 = PixelBufferUtils::componentsPerPixelForPixelFormat(*(PixelBufferUtils **)&a4, 0);
  if (v17 != PixelBufferUtils::componentsPerPixelForPixelFormat(v11, 0))
  {
    NSLog(CFSTR("invalid params: can't compare buffers with different components per pixel"));
    __assert_rtn("+[UtilsForTests compareVImageBuffer:pixelTypeResult:offset:toRefBuffer:pixelTypeRef:ignoreResultZeros:ignoreRefZeros:outlierPercentile:]", "UtilsForTests.mm", 210, "0");
  }
  v18 = (unint64_t)((double)a3->width - fabs(width));
  if (width < 0.0)
    v19 = 0;
  else
    v19 = (int)width;
  if (width < 0.0)
    v20 = (int)-width;
  else
    v20 = 0;
  v150 = (unint64_t)((double)a3->height - fabs(height));
  v21 = (int)height;
  v22 = (int)-height;
  if (height >= 0.0)
    v22 = 0;
  else
    v21 = 0;
  rowBytes = a3->rowBytes;
  a3->data = (char *)a3->data + rowBytes * v22;
  v24 = a6->rowBytes;
  v25 = (char *)a6->data + v24 * v21;
  a6->data = v25;
  if ((int)a4 <= 1717855599)
  {
    if (a4 == 1278226534)
      goto LABEL_18;
    v26 = 1380410945;
  }
  else
  {
    if (a4 == 1717855600 || a4 == 1919365990)
      goto LABEL_18;
    v26 = 1717856627;
  }
  if (a4 != v26)
    goto LABEL_28;
LABEL_18:
  if ((int)v11 > 1717855599)
  {
    if ((_DWORD)v11 == 1717855600 || (_DWORD)v11 == 1919365990)
      goto LABEL_25;
    v27 = 1717856627;
LABEL_24:
    if ((_DWORD)v11 == v27)
      goto LABEL_25;
LABEL_28:
    v140 = v20;
    v36 = isF16Type(a4);
    if (v36 && isF16Type((int)v11))
    {
      v28 = compareRawBuffers<half,half>((uint64_t)a3->data + 2 * v140, rowBytes, (uint64_t)&v25[2 * v19], v24, v17 * v18, v150, a8, a9, a10);
      goto LABEL_26;
    }
    if ((int)a4 <= 1717855599)
    {
      if (a4 != 1278226534)
      {
        v37 = 1380410945;
LABEL_37:
        if (a4 != v37)
          goto LABEL_87;
      }
    }
    else if (a4 != 1717855600 && a4 != 1919365990)
    {
      v37 = 1717856627;
      goto LABEL_37;
    }
    if ((_DWORD)v11 == 825306677 || (_DWORD)v11 == 1647392359 || (_DWORD)v11 == 825437747)
    {
      if (a10 > 0.0 && a10 <= 1.0)
      {
        if (v150)
        {
          v144 = rowBytes;
          v147 = v24;
          v38 = 0;
          v39 = v19;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v141 = (char *)a3->data + 4 * v140;
          v137 = &v25[2 * v39];
          v44 = a8;
          while (!v18)
          {
            v49 = v40;
LABEL_85:
            v40 = v49;
            v42 = ++v43;
            if (v43 >= v150)
              goto LABEL_143;
          }
          LODWORD(v45) = 0;
          v46 = &v137[v42 * v147];
          v47 = (float *)&v141[v42 * v144];
          while (1)
          {
            v48 = *v47;
            if (*v47 != 0.0 || !v44)
            {
              if (*(_WORD *)v46)
              {
                v50 = fabsf((float)((float)*(unsigned __int16 *)v46 - v48) / (float)*(unsigned __int16 *)v46);
                if ((unint64_t)v40 >= v41)
                {
                  v51 = v40 - v38;
                  v52 = v51 + 1;
                  if ((unint64_t)(v51 + 1) >> 62)
                    goto LABEL_244;
                  if ((uint64_t)(v41 - (_QWORD)v38) >> 1 > v52)
                    v52 = (uint64_t)(v41 - (_QWORD)v38) >> 1;
                  if (v41 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
                    v53 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v53 = v52;
                  if (v53)
                    v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v53);
                  else
                    v54 = 0;
                  v56 = (float *)(v53 + 4 * v51);
                  *v56 = v50;
                  v49 = v56 + 1;
                  while (v40 != v38)
                  {
                    v57 = *((_DWORD *)v40-- - 1);
                    *((_DWORD *)v56-- - 1) = v57;
                  }
LABEL_67:
                  v41 = v53 + 4 * v54;
                  if (v38)
                    operator delete(v38);
                  v38 = v56;
                  v44 = a8;
                  goto LABEL_70;
                }
LABEL_62:
                *v40 = v50;
                v49 = v40 + 1;
                goto LABEL_70;
              }
              if (!a9)
              {
                v55 = v48 / 0.0001;
                v50 = fabsf(v55);
                if ((unint64_t)v40 >= v41)
                {
                  v58 = v40 - v38;
                  v59 = v58 + 1;
                  if ((unint64_t)(v58 + 1) >> 62)
LABEL_244:
                    std::vector<Element *>::__throw_length_error[abi:ne180100]();
                  if ((uint64_t)(v41 - (_QWORD)v38) >> 1 > v59)
                    v59 = (uint64_t)(v41 - (_QWORD)v38) >> 1;
                  if (v41 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
                    v53 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v53 = v59;
                  if (v53)
                    v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v53);
                  else
                    v54 = 0;
                  v56 = (float *)(v53 + 4 * v58);
                  *v56 = v50;
                  v49 = v56 + 1;
                  while (v40 != v38)
                  {
                    v60 = *((_DWORD *)v40-- - 1);
                    *((_DWORD *)v56-- - 1) = v60;
                  }
                  goto LABEL_67;
                }
                goto LABEL_62;
              }
            }
            v49 = v40;
LABEL_70:
            v45 = (v45 + 1);
            ++v47;
            v46 += 2;
            v40 = v49;
            if (v45 >= v18)
              goto LABEL_85;
          }
        }
        v38 = 0;
        v49 = 0;
LABEL_143:
        v91 = (int)(float)((float)(unint64_t)(v49 - v38) * a10);
        if (v91 > 0)
        {
          std::__sort<std::__less<float,float> &,float *>();
          if (v91 < 2)
          {
            v96 = 0;
            v92 = 0.0;
          }
          else
          {
            v92 = 0.0;
            v93 = v38;
            v94 = (v91 - 1);
            do
            {
              v95 = *v93++;
              v92 = v92 + v95;
              --v94;
            }
            while (v94);
            v96 = (v91 - 1);
          }
          v29 = (float)(v92 / (float)(v91 - 1)) * 100.0;
          v124 = v38[v96] * 100.0;
          v125 = v92 * 100.0;
          v30 = (float)v91;
          goto LABEL_237;
        }
LABEL_233:
        v30 = 0.0;
        v29 = 1.0e17;
        v124 = 1.0e17;
        v125 = 0.0;
        *(float *)&v32 = 1.0e17;
        v33 = 0.0;
        if (!v38)
          goto LABEL_27;
        goto LABEL_237;
      }
LABEL_198:
      NSLog(CFSTR("cannot compare with outlierPercentile %f"), a10);
      v30 = 0.0;
      v29 = 1.0e17;
      *(float *)&v32 = 1.0e17;
      v33 = 0.0;
      goto LABEL_27;
    }
LABEL_87:
    if (v36 && ((_DWORD)v11 == 825306677 || (_DWORD)v11 == 1647392359 || (_DWORD)v11 == 825437747))
    {
      if (a10 <= 0.0 || a10 > 1.0)
        goto LABEL_198;
      if (v150)
      {
        v145 = rowBytes;
        v148 = v24;
        v38 = 0;
        v61 = v19;
        v62 = 0;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        v138 = (char *)a3->data + 2 * v140;
        v142 = &v25[2 * v61];
        v66 = v17 * v18;
        v67 = a8;
        while (1)
        {
          v68 = v65;
          if (v66)
            break;
          v77 = v62;
LABEL_136:
          v64 = (v68 + 1);
          v62 = v77;
          v65 = v68 + 1;
          if (v64 >= v150)
            goto LABEL_222;
        }
        LODWORD(v69) = 0;
        v70 = &v142[v64 * v148];
        v71 = &v138[v64 * v145];
        while (1)
        {
          __asm { FCMP            H0, #0 }
          if (!_ZF || !v67)
          {
            if (*(_WORD *)v70)
            {
              __asm { FCVT            S0, H0 }
              v79 = fabsf((float)((float)*(unsigned __int16 *)v70 - _S0) / (float)*(unsigned __int16 *)v70);
              if ((unint64_t)v62 >= v63)
              {
                v80 = v62 - v38;
                v81 = v80 + 1;
                if ((unint64_t)(v80 + 1) >> 62)
                  goto LABEL_245;
                if ((uint64_t)(v63 - (_QWORD)v38) >> 1 > v81)
                  v81 = (uint64_t)(v63 - (_QWORD)v38) >> 1;
                if (v63 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
                  v82 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v82 = v81;
                if (v82)
                  v82 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v82);
                else
                  v83 = 0;
                v85 = (float *)(v82 + 4 * v80);
                *v85 = v79;
                v77 = v85 + 1;
                while (v62 != v38)
                {
                  v86 = *((_DWORD *)v62-- - 1);
                  *((_DWORD *)v85-- - 1) = v86;
                }
LABEL_130:
                v63 = v82 + 4 * v83;
                if (v38)
                  operator delete(v38);
                v38 = v85;
                v67 = a8;
                goto LABEL_133;
              }
LABEL_113:
              *v62 = v79;
              v77 = v62 + 1;
              goto LABEL_133;
            }
            if (!a9)
            {
              __asm { FCVT            D0, H0 }
              *(float *)&_D0 = _D0 / 0.0001;
              v79 = fabsf(*(float *)&_D0);
              if ((unint64_t)v62 >= v63)
              {
                v87 = v62 - v38;
                v88 = v87 + 1;
                if ((unint64_t)(v87 + 1) >> 62)
LABEL_245:
                  std::vector<Element *>::__throw_length_error[abi:ne180100]();
                if ((uint64_t)(v63 - (_QWORD)v38) >> 1 > v88)
                  v88 = (uint64_t)(v63 - (_QWORD)v38) >> 1;
                if (v63 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
                  v82 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v82 = v88;
                if (v82)
                  v82 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v82);
                else
                  v83 = 0;
                v85 = (float *)(v82 + 4 * v87);
                *v85 = v79;
                v77 = v85 + 1;
                while (v62 != v38)
                {
                  v89 = *((_DWORD *)v62-- - 1);
                  *((_DWORD *)v85-- - 1) = v89;
                }
                goto LABEL_130;
              }
              goto LABEL_113;
            }
          }
          v77 = v62;
LABEL_133:
          v69 = (v69 + 1);
          v71 += 2;
          v70 += 2;
          v62 = v77;
          if (v66 <= v69)
            goto LABEL_136;
        }
      }
      v38 = 0;
      v77 = 0;
LABEL_222:
      v127 = (int)(float)((float)(unint64_t)(v77 - v38) * a10);
      if (v127 <= 0)
        goto LABEL_233;
      std::__sort<std::__less<float,float> &,float *>();
      v128 = (v127 - 1);
      if (v127 >= 2)
      {
        v129 = 0.0;
        v130 = v38;
        v131 = (v127 - 1);
        do
        {
          v132 = *v130++;
          v129 = v129 + v132;
          --v131;
        }
        while (v131);
LABEL_232:
        v136 = v128;
LABEL_236:
        v29 = (float)(v129 / (float)(int)v128) * 100.0;
        v124 = v38[v136] * 100.0;
        v125 = v129 * 100.0;
        v30 = (float)v127;
LABEL_237:
        *(float *)&v32 = v29;
        v33 = v30;
        operator delete(v38);
        v30 = v125;
        v29 = v124;
        goto LABEL_27;
      }
      goto LABEL_235;
    }
    if ((int)a4 <= 1717855599)
    {
      if (a4 != 1278226534)
      {
        v90 = 1380410945;
LABEL_150:
        if (a4 != v90)
          goto LABEL_199;
      }
    }
    else if (a4 != 1717855600 && a4 != 1919365990)
    {
      v90 = 1717856627;
      goto LABEL_150;
    }
    if (isF16Type((int)v11))
    {
      if (a10 <= 0.0 || a10 > 1.0)
        goto LABEL_198;
      if (!v150)
      {
        v38 = 0;
        v109 = 0;
LABEL_228:
        v127 = (int)(float)((float)(unint64_t)(v109 - v38) * a10);
        if (v127 <= 0)
          goto LABEL_233;
        std::__sort<std::__less<float,float> &,float *>();
        v128 = (v127 - 1);
        if (v127 >= 2)
        {
          v129 = 0.0;
          v133 = v38;
          v134 = (v127 - 1);
          do
          {
            v135 = *v133++;
            v129 = v129 + v135;
            --v134;
          }
          while (v134);
          goto LABEL_232;
        }
LABEL_235:
        v136 = 0;
        v129 = 0.0;
        goto LABEL_236;
      }
      v146 = rowBytes;
      v149 = v24;
      v38 = 0;
      v97 = v19;
      v98 = 0;
      v99 = 0;
      v100 = 0;
      v101 = 0;
      v139 = (char *)a3->data + 4 * v140;
      v143 = &v25[2 * v97];
      v102 = v17 * v18;
      v103 = a8;
      while (1)
      {
        v104 = v101;
        if (v102)
          break;
        v109 = v98;
LABEL_196:
        v100 = (v104 + 1);
        v98 = v109;
        v101 = v104 + 1;
        if (v100 >= v150)
          goto LABEL_228;
      }
      LODWORD(v105) = 0;
      v106 = &v143[v100 * v149];
      v107 = (float *)&v139[v100 * v146];
      while (1)
      {
        v108 = *v107;
        if (*v107 != 0.0 || !v103)
        {
          __asm { FCMP            H1, #0 }
          if (!_ZF)
          {
            __asm { FCVT            S1, H1 }
            v112 = fabsf((float)(_S1 - v108) / _S1);
            if ((unint64_t)v98 >= v99)
            {
              v113 = v98 - v38;
              v114 = v113 + 1;
              if ((unint64_t)(v113 + 1) >> 62)
                goto LABEL_247;
              if ((uint64_t)(v99 - (_QWORD)v38) >> 1 > v114)
                v114 = (uint64_t)(v99 - (_QWORD)v38) >> 1;
              if (v99 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
                v115 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v115 = v114;
              if (v115)
                v115 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v115);
              else
                v116 = 0;
              v118 = (float *)(v115 + 4 * v113);
              *v118 = v112;
              v109 = v118 + 1;
              while (v98 != v38)
              {
                v119 = *((_DWORD *)v98-- - 1);
                *((_DWORD *)v118-- - 1) = v119;
              }
LABEL_190:
              v99 = v115 + 4 * v116;
              if (v38)
                operator delete(v38);
              v38 = v118;
              v103 = a8;
              goto LABEL_193;
            }
LABEL_173:
            *v98 = v112;
            v109 = v98 + 1;
            goto LABEL_193;
          }
          if (!a9)
          {
            v117 = v108 / 0.0001;
            v112 = fabsf(v117);
            if ((unint64_t)v98 >= v99)
            {
              v120 = v98 - v38;
              v121 = v120 + 1;
              if ((unint64_t)(v120 + 1) >> 62)
LABEL_247:
                std::vector<Element *>::__throw_length_error[abi:ne180100]();
              if ((uint64_t)(v99 - (_QWORD)v38) >> 1 > v121)
                v121 = (uint64_t)(v99 - (_QWORD)v38) >> 1;
              if (v99 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
                v115 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v115 = v121;
              if (v115)
                v115 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v115);
              else
                v116 = 0;
              v118 = (float *)(v115 + 4 * v120);
              *v118 = v112;
              v109 = v118 + 1;
              while (v98 != v38)
              {
                v122 = *((_DWORD *)v98-- - 1);
                *((_DWORD *)v118-- - 1) = v122;
              }
              goto LABEL_190;
            }
            goto LABEL_173;
          }
        }
        v109 = v98;
LABEL_193:
        v105 = (v105 + 1);
        ++v107;
        v106 += 2;
        v98 = v109;
        if (v102 <= v105)
          goto LABEL_196;
      }
    }
LABEL_199:
    if (v36)
    {
      if ((int)v11 <= 1717855599)
      {
        if ((_DWORD)v11 == 1278226534)
        {
LABEL_209:
          v28 = compareRawBuffers<half,float>((uint64_t)a3->data + 2 * v140, rowBytes, (uint64_t)&v25[4 * v19], v24, v17 * v18, v150, a8, a9, a10);
          goto LABEL_26;
        }
        v123 = 1380410945;
      }
      else
      {
        if ((_DWORD)v11 == 1717855600 || (_DWORD)v11 == 1919365990)
          goto LABEL_209;
        v123 = 1717856627;
      }
      if ((_DWORD)v11 == v123)
        goto LABEL_209;
    }
    if ((int)a4 > 1111970368)
    {
      if (a4 != 1111970369)
      {
        if (a4 == 1647392359)
          goto LABEL_240;
        if (a4 != 1278226488)
          goto LABEL_248;
      }
    }
    else if (a4 != 32)
    {
      if (a4 != 825306677)
      {
        v126 = 825437747;
        goto LABEL_239;
      }
LABEL_240:
      if ((_DWORD)v11 == 825306677 || (_DWORD)v11 == 1647392359 || (_DWORD)v11 == 825437747)
      {
        v28 = compareRawBuffers<unsigned short,unsigned short>((uint64_t)a3->data + 2 * v140, rowBytes, (uint64_t)&v25[2 * v19], v24, v17 * v18, v150, a8, a9, a10);
        goto LABEL_26;
      }
LABEL_248:
      NSLog(CFSTR("this comparison is not supported but you can easily add it!"));
      __assert_rtn("+[UtilsForTests compareVImageBuffer:pixelTypeResult:offset:toRefBuffer:pixelTypeRef:ignoreResultZeros:ignoreRefZeros:outlierPercentile:]", "UtilsForTests.mm", 286, "0");
    }
    if ((_DWORD)v11 == 32 || (_DWORD)v11 == 1278226488 || (_DWORD)v11 == 1111970369)
    {
      v28 = compareRawBuffers<unsigned char,unsigned char>((uint64_t)a3->data + v140, rowBytes, (uint64_t)&v25[v19], v24, v17 * v18, v150, a8, a9, a10);
      goto LABEL_26;
    }
    v126 = 825306677;
LABEL_239:
    if (a4 != v126)
      goto LABEL_248;
    goto LABEL_240;
  }
  if ((_DWORD)v11 != 1278226534)
  {
    v27 = 1380410945;
    goto LABEL_24;
  }
LABEL_25:
  v28 = compareRawBuffers<float,float>((uint64_t)a3->data + 4 * v20, rowBytes, (uint64_t)&v25[4 * v19], v24, v17 * v18, v150, a8, a9, a10);
LABEL_26:
  *(float *)&v32 = v28;
  v33 = v31;
LABEL_27:
  v34 = *(float *)&v32;
  v35 = v33;
  result.var3 = v35;
  result.var2 = v30;
  result.var1 = v29;
  result.var0 = v34;
  return result;
}

+ (BaselineTestStats_s)compareBuffer:(__CVBuffer *)a3 offset:(CGSize)a4 toRefBuffer:(__CVBuffer *)a5 ignoreResultZeros:(BOOL)a6 ignoreRefZeros:(BOOL)a7 outlierPercentile:(float)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  size_t v16;
  size_t v17;
  size_t v18;
  PixelBufferUtils *PixelFormatType;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  __CVBuffer *v27;
  __CVBuffer *v28;
  float v29;
  CGRect *v30;
  double v31;
  float v32;
  float v33;
  float v34;
  float v35;
  CGRect *v36;
  double v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  size_t v46;
  vImage_Buffer v47;
  vImage_Buffer v48;
  vImage_Buffer v49;
  vImage_Buffer v50;
  vImage_Buffer v51;
  vImage_Buffer v52;
  BaselineTestStats_s result;

  if (!a3 || !a5)
  {
    NSLog(CFSTR("invalid params: null buffers for comparison"), a2, a4.width, a4.height);
    v21 = 0.0;
    v22 = 1.0e17;
    goto LABEL_12;
  }
  v10 = a7;
  v11 = a6;
  height = a4.height;
  width = a4.width;
  v16 = CVPixelBufferGetWidth(a3);
  v46 = CVPixelBufferGetHeight(a3);
  v17 = CVPixelBufferGetWidth(a5);
  v18 = CVPixelBufferGetHeight(a5);
  PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  v20 = CVPixelBufferGetPixelFormatType(a5);
  v21 = 0.0;
  v22 = 1.0e17;
  if (v16 != v17)
  {
LABEL_12:
    v23 = 1.0e17;
    v24 = 1.0e17;
    goto LABEL_15;
  }
  v23 = 1.0e17;
  v24 = 1.0e17;
  if (v46 == v18)
  {
    v25 = v20;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a5, 1uLL);
    v26 = PixelBufferUtils::planeCountForPixelFormat(PixelFormatType);
    if (v26)
    {
      v27 = (__CVBuffer *)v26;
      v28 = 0;
      v29 = (float)(unint64_t)v26;
      v30 = (CGRect *)MEMORY[0x24BDBF090];
      v24 = 0.0;
      v23 = 0.0;
      v22 = 0.0;
      do
      {
        PixelBufferUtils::asVImageBuffer(a3, v28, *v30, &v52);
        PixelBufferUtils::asVImageBuffer(a5, v28, *v30, &v51);
        v48 = v52;
        v47 = v51;
        *(float *)&v31 = a8;
        objc_msgSend(a1, "compareVImageBuffer:pixelTypeResult:offset:toRefBuffer:pixelTypeRef:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", &v48, PixelFormatType, &v47, v25, v11, v10, width, height, v31);
        v22 = v22 + (float)(v35 / v29);
        if (v23 < v32)
          v23 = v32;
        v24 = v24 + (float)(v33 / v29);
        v21 = v21 + (float)(v34 / v29);
        v28 = (__CVBuffer *)((char *)v28 + 1);
      }
      while (v27 != v28);
    }
    else
    {
      v36 = (CGRect *)MEMORY[0x24BDBF090];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &v52);
      PixelBufferUtils::asVImageBuffer(a5, *v36, &v51);
      v50 = v52;
      v49 = v51;
      *(float *)&v37 = a8;
      objc_msgSend(a1, "compareVImageBuffer:pixelTypeResult:offset:toRefBuffer:pixelTypeRef:ignoreResultZeros:ignoreRefZeros:outlierPercentile:", &v50, PixelFormatType, &v49, v25, v11, v10, width, height, v37);
      v22 = v38;
      v23 = v39;
      v24 = v40;
      v21 = v41;
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(a5, 1uLL);
  }
LABEL_15:
  v42 = v22;
  v43 = v23;
  v44 = v24;
  v45 = v21;
  result.var3 = v45;
  result.var2 = v44;
  result.var1 = v43;
  result.var0 = v42;
  return result;
}

+ (BaselineTestStats_s)compareResults:(__CVBuffer *)a3 toBaseLineInPath:(id)a4 ignoreRefZeros:(BOOL)a5
{
  double v5;
  float v6;
  float v7;
  float v8;
  float v9;
  BaselineTestStats_s result;

  LODWORD(v5) = 1064514355;
  +[UtilsForTests compareResults:toBaseLineInPath:ignoreRefZeros:outlierPercentile:](UtilsForTests, "compareResults:toBaseLineInPath:ignoreRefZeros:outlierPercentile:", a3, a4, a5, v5);
  result.var3 = v9;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

+ (BaselineTestStats_s)compareResults:(__CVBuffer *)a3 toBaseLineInPath:(id)a4 ignoreRefZeros:(BOOL)a5 outlierPercentile:(float)a6
{
  void *v9;
  size_t Width;
  size_t Height;
  signed int PixelFormatType;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  size_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  size_t v24;
  void *BaseAddress;
  size_t BytesPerRow;
  float v27;
  float v28;
  float v29;
  float v30;
  BaselineTestStats_s result;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v13 = 0.0;
  if (PixelFormatType <= 1717856626)
  {
    if (PixelFormatType == 843264104)
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v19 = compareRawBuffers<half,half>((uint64_t)BaseAddress, BytesPerRow, objc_msgSend(objc_retainAutorelease(v9), "bytes"), 4 * Width, 2 * Width, Height, 0, a5, a6);
      goto LABEL_12;
    }
    if (PixelFormatType != 1278226536)
    {
      v14 = 0.0;
      v15 = 0.0;
      v16 = 0.0;
      if (PixelFormatType != 1717855600)
        goto LABEL_13;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (PixelFormatType == 1717856627)
  {
LABEL_10:
    v23 = CVPixelBufferGetBaseAddress(a3);
    v24 = CVPixelBufferGetBytesPerRow(a3);
    v19 = compareRawBuffers<float,float>((uint64_t)v23, v24, objc_msgSend(objc_retainAutorelease(v9), "bytes"), 4 * Width, Width, Height, 0, a5, a6);
    goto LABEL_12;
  }
  if (PixelFormatType == 1751410032 || (v14 = 0.0, v15 = 0.0, v16 = 0.0, PixelFormatType == 1751411059))
  {
LABEL_9:
    v17 = CVPixelBufferGetBaseAddress(a3);
    v18 = CVPixelBufferGetBytesPerRow(a3);
    v19 = compareRawBuffers<half,half>((uint64_t)v17, v18, objc_msgSend(objc_retainAutorelease(v9), "bytes"), 2 * Width, Width, Height, 0, a5, a6);
LABEL_12:
    v13 = v19;
    v14 = v20;
    v15 = v21;
    v16 = v22;
  }
LABEL_13:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);

  v27 = v13;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  result.var3 = v30;
  result.var2 = v29;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

+ (id)getJasperPointCloudFromPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  char *v35;
  _BYTE *v36;
  char *v37;
  _QWORD *v38;
  _QWORD *v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  int v52;
  int v53;
  char *v54;
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
  ADJasperPointCloud *v67;
  ADJasperPointCloud *v68;
  uint64_t v70;
  uint64_t *v71;
  uint64_t *v72;
  char *v73;
  char *v74;
  char *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v80 = a3;
  if ((objc_msgSend(v80, "hasSuffix:", CFSTR(".txt")) & 1) != 0)
  {
    +[UtilsForTests pointsArrayFromFilePath:](UtilsForTests, "pointsArrayFromFilePath:", v80);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v81 = (id)objc_claimAutoreleasedReturnValue();
      v87 = v3;
      v4 = objc_msgSend(v3, "count");
      v70 = (uint64_t)&v70;
      v5 = MEMORY[0x24BDAC7A8](v4);
      v76 = &v70 - 4 * v6;
      v7 = MEMORY[0x24BDAC7A8](v5);
      v75 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      v9 = MEMORY[0x24BDAC7A8](v7);
      v73 = (char *)&v70 - v10;
      v78 = v11;
      v12 = MEMORY[0x24BDAC7A8](v9);
      v74 = (char *)&v70 - v13;
      v14 = MEMORY[0x24BDAC7A8](v12);
      v86 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = MEMORY[0x24BDAC7A8](v14);
      v72 = &v70 - 4 * v17;
      v77 = v18;
      v19 = MEMORY[0x24BDAC7A8](v16);
      v71 = &v70 - 4 * v20;
      v21 = MEMORY[0x24BDAC7A8](v19);
      v85 = (char *)&v70 - v22;
      v23 = MEMORY[0x24BDAC7A8](v21);
      v84 = (char *)&v70 - v24;
      v25 = MEMORY[0x24BDAC7A8](v23);
      v83 = (char *)&v70 - v26;
      v79 = v27;
      v28 = MEMORY[0x24BDAC7A8](v25);
      v82 = (char *)&v70 - v30;
      if (v28 >= 3)
      {
        v31 = 0;
        v32 = 0;
        if (v29 <= 1)
          v33 = 1;
        else
          v33 = v29;
        v34 = (double *)(v76 + 2);
        v35 = v75 + 1;
        v36 = v74 + 1;
        v37 = v73 + 1;
        v38 = v71 + 2;
        __asm { FMOV            V11.2S, #1.0 }
        v44 = v72 + 2;
        do
        {
          objc_msgSend(v87, "objectAtIndexedSubscript:", v31);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "floatValue");
          v47 = v46;

          objc_msgSend(v87, "objectAtIndexedSubscript:", v31 + 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "floatValue");
          v50 = v49;

          objc_msgSend(v87, "objectAtIndexedSubscript:", v31 + 2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "floatValue");
          v53 = v52;

          *(v34 - 2) = v47;
          *(v34 - 1) = v50;
          *v34 = v47;
          v34[1] = v50;
          v34 += 4;
          *(_QWORD *)&v86[8 * v32] = _D11;
          *(_WORD *)(v35 - 1) = 256;
          *((_DWORD *)v44 - 2) = v53;
          *(v44 - 2) = 0;
          *((_DWORD *)v44 + 2) = v53;
          *(_QWORD *)&v85[8 * v32] = _D11;
          *v44 = 0;
          v44 += 4;
          *(_QWORD *)&v84[8 * v32] = _D11;
          *(_QWORD *)&v83[8 * v32] = _D11;
          *(v38 - 2) = 0;
          *(v38 - 1) = 0;
          v54 = &v82[8 * v32];
          *(v36 - 1) = v32;
          *v36 = v32;
          v36 += 2;
          ++v32;
          v31 += 3;
          *v38 = 0;
          v38[1] = 0;
          v38 += 4;
          v35 += 2;
          *(_WORD *)(v37 - 1) = 0;
          v37 += 2;
          *(_QWORD *)v54 = 0;
        }
        while (v33 != v32);
      }
      v3 = v87;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v78);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v55, CFSTR("Size"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v76, v77);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v56, CFSTR("CameraPixels"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v75, v78);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v57, CFSTR("EchoIds"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v74, v78);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v58, CFSTR("SpotIds"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v73, v78);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v59, CFSTR("BankIds"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v86, v79);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v60, CFSTR("Confidences"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v72, v77);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v61, CFSTR("Points"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v71, v77);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v62, CFSTR("UndistortedCameraPixels"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v85, v79);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v63, CFSTR("EuclideanDistances"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v84, v79);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v64, CFSTR("Intensities"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v83, v79);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v65, CFSTR("SignalToNoiseRatios"));

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v82, v79);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v66, CFSTR("Flags"));

      v67 = [ADJasperPointCloud alloc];
      v68 = -[ADJasperPointCloud initWithDictionaryRepresentation:](v67, "initWithDictionaryRepresentation:", v81);

    }
    else
    {
      v68 = 0;
    }

  }
  else
  {
    +[ADJasperPointCloud pointCloudFromFile:](ADJasperPointCloud, "pointCloudFromFile:", v80);
    v68 = (ADJasperPointCloud *)objc_claimAutoreleasedReturnValue();
  }

  return v68;
}

+ (vector<float,)pointsVectorFromFilePath:(id)a2
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::ios_base *v10;
  _QWORD *v11;
  int v12;
  const std::locale::facet *v13;
  unsigned __int8 v14;
  uint64_t v15;
  _QWORD *v16;
  _BYTE *v17;
  int v18;
  std::string *v19;
  void **v20;
  char *v21;
  float *var1;
  float *var0;
  float *v24;
  float v25;
  float *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  float *v31;
  int v32;
  void **v33;
  vector<float, std::allocator<float>> *result;
  id v35;
  std::string v36;
  void *__p[2];
  char v38;
  std::locale v39;
  _QWORD v40[2];
  _BYTE v41[408];
  _QWORD v42[21];

  v42[19] = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(a4);
  objc_msgSend(v5, "UTF8String");
  v6 = MEMORY[0x24BEDB838];
  v7 = MEMORY[0x24BEDB838] + 64;
  v8 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  v42[0] = MEMORY[0x24BEDB838] + 64;
  v40[0] = v8;
  *(_QWORD *)((char *)v40 + *(_QWORD *)(v8 - 24)) = v9;
  v40[1] = 0;
  v10 = (std::ios_base *)((char *)v40 + *(_QWORD *)(v40[0] - 24));
  std::ios_base::init(v10, v41);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  v40[0] = v6 + 24;
  v42[0] = v7;
  MEMORY[0x23B7F1C50](v41);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)v40 + *(_QWORD *)(v40[0] - 24)), *(_DWORD *)&v41[*(_QWORD *)(v40[0] - 24) + 16] | 4);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (!*(_DWORD *)&v41[*(_QWORD *)(v40[0] - 24) + 16])
  {
    v35 = v5;
    std::string::basic_string[abi:ne180100]<0>(__p, ", ");
    v11 = (_QWORD *)(v40[0] - 24);
    if ((v41[*(_QWORD *)(v40[0] - 24) + 16] & 2) != 0)
      goto LABEL_58;
    v12 = 0;
    while (1)
    {
      memset(&v36, 0, sizeof(v36));
      std::ios_base::getloc((const std::ios_base *)((char *)v40 + *v11));
      v13 = std::locale::use_facet(&v39, MEMORY[0x24BEDB350]);
      v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
      std::locale::~locale(&v39);
      MEMORY[0x23B7F1C68](&v39, v40, 1);
      if (!LOBYTE(v39.__locale_))
        goto LABEL_23;
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      {
        *v36.__r_.__value_.__l.__data_ = 0;
        v36.__r_.__value_.__l.__size_ = 0;
      }
      else
      {
        v36.__r_.__value_.__s.__data_[0] = 0;
        *((_BYTE *)&v36.__r_.__value_.__s + 23) = 0;
      }
      v15 = 0;
      while (1)
      {
        v16 = *(_QWORD **)&v41[*(_QWORD *)(v40[0] - 24) + 24];
        v17 = (_BYTE *)v16[3];
        if (v17 != (_BYTE *)v16[4])
        {
          v16[3] = v17 + 1;
          LOBYTE(v16) = *v17;
          goto LABEL_14;
        }
        LODWORD(v16) = (*(uint64_t (**)(_QWORD *))(*v16 + 80))(v16);
        if ((_DWORD)v16 == -1)
          break;
LABEL_14:
        if (v14 == v16)
        {
          v18 = 0;
          goto LABEL_22;
        }
        std::string::push_back(&v36, (std::string::value_type)v16);
        ++v15;
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0 && v36.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
        {
          v18 = 4;
          goto LABEL_22;
        }
      }
      if (v15)
        v18 = 2;
      else
        v18 = 6;
LABEL_22:
      std::ios_base::clear((std::ios_base *)((char *)v40 + *(_QWORD *)(v40[0] - 24)), *(_DWORD *)&v41[*(_QWORD *)(v40[0] - 24) + 16] | v18);
LABEL_23:
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      {
        if (!v36.__r_.__value_.__l.__size_)
          goto LABEL_55;
        v19 = (std::string *)v36.__r_.__value_.__r.__words[0];
LABEL_28:
        if (v38 >= 0)
          v20 = __p;
        else
          v20 = (void **)__p[0];
        v21 = strtok((char *)v19, (const char *)v20);
        if (v21)
        {
          var1 = retstr->var1;
          var0 = retstr->var2.var0;
          v24 = retstr->var0;
          do
          {
            v25 = atof(v21);
            if (var1 >= var0)
            {
              v27 = var1 - v24;
              v28 = v27 + 1;
              if ((unint64_t)(v27 + 1) >> 62)
                std::vector<Element *>::__throw_length_error[abi:ne180100]();
              if (((char *)var0 - (char *)v24) >> 1 > v28)
                v28 = ((char *)var0 - (char *)v24) >> 1;
              if ((unint64_t)((char *)var0 - (char *)v24) >= 0x7FFFFFFFFFFFFFFCLL)
                v29 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v29 = v28;
              if (v29)
                v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v29);
              else
                v30 = 0;
              v31 = (float *)(v29 + 4 * v27);
              *v31 = v25;
              v26 = v31 + 1;
              while (var1 != v24)
              {
                v32 = *((_DWORD *)var1-- - 1);
                *((_DWORD *)v31-- - 1) = v32;
              }
              var0 = (float *)(v29 + 4 * v30);
              retstr->var0 = v31;
              retstr->var1 = v26;
              retstr->var2.var0 = var0;
              if (v24)
                operator delete(v24);
              v24 = v31;
            }
            else
            {
              *var1 = v25;
              v26 = var1 + 1;
            }
            retstr->var1 = v26;
            if (v38 >= 0)
              v33 = __p;
            else
              v33 = (void **)__p[0];
            v21 = strtok(0, (const char *)v33);
            var1 = v26;
          }
          while (v21);
        }
        ++v12;
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
LABEL_55:
          operator delete(v36.__r_.__value_.__l.__data_);
      }
      else if (*((_BYTE *)&v36.__r_.__value_.__s + 23))
      {
        v19 = &v36;
        goto LABEL_28;
      }
      v11 = (_QWORD *)(v40[0] - 24);
      if ((v41[*(_QWORD *)(v40[0] - 24) + 16] & 2) != 0 || v12 == -1)
      {
LABEL_58:
        if (!std::filebuf::close())
          std::ios_base::clear((std::ios_base *)((char *)v40 + *(_QWORD *)(v40[0] - 24)), *(_DWORD *)&v41[*(_QWORD *)(v40[0] - 24) + 16] | 4);
        v5 = v35;
        if (v38 < 0)
          operator delete(__p[0]);
        break;
      }
    }
  }
  v40[0] = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)v40 + *(_QWORD *)(v40[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x23B7F1C5C](v41);
  std::istream::~istream();
  MEMORY[0x23B7F1D1C](v42);

  return result;
}

+ (id)pointsArrayFromFilePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  _DWORD *v7;
  unint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  _DWORD *__p;
  _BYTE *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  if (v5)
  {
    objc_msgSend(v5, "pointsVectorFromFilePath:", v3);
    v7 = __p;
    if (v14 != (_BYTE *)__p)
    {
      v8 = 0;
      v9 = 1;
      do
      {
        LODWORD(v6) = v7[v8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        v8 = v9;
        v7 = __p;
        ++v9;
      }
      while (v8 < (v14 - (_BYTE *)__p) >> 2);
    }
  }
  else
  {
    __p = 0;
  }
  v11 = (void *)objc_msgSend(v4, "copy");
  if (__p)
    operator delete(__p);

  return v11;
}

+ (id)createJasperCameraCalibration
{
  ADMillimeterRadiusPairsLensDistortionModel *v2;
  void *v3;
  void *v4;
  ADMillimeterRadiusPairsLensDistortionModel *v5;
  ADMutableCameraCalibration *v6;
  double v7;
  ADMutableCameraCalibration *v8;
  _BYTE v10[1024];
  _BYTE __dst[1024];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  memcpy(__dst, &unk_2363DF808, sizeof(__dst));
  memcpy(v10, &unk_2363DFC08, sizeof(v10));
  v2 = [ADMillimeterRadiusPairsLensDistortionModel alloc];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __dst, 1024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, 1024);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ADMillimeterRadiusPairsLensDistortionModel initWithDistortionCenter:distortedRadii:undistortedRadii:](v2, "initWithDistortionCenter:distortedRadii:undistortedRadii:", v3, v4, 65.5749545, 89.8015503);

  v6 = [ADMutableCameraCalibration alloc];
  LODWORD(v7) = 1009067670;
  v8 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v6, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v5, *(double *)&_PromotedConst, unk_2363E1530, 2.20156376e13, *(double *)&_PromotedConst_1627, unk_2363E1560, 0.0, unk_2363E1580, v7, 0x4061800000000000, 0x4066800000000000);

  return v8;
}

+ (id)createSuperWideCameraCalibration
{
  ADMillimeterRadiusPairsLensDistortionModel *v2;
  void *v3;
  void *v4;
  ADMillimeterRadiusPairsLensDistortionModel *v5;
  ADMutableCameraCalibration *v6;
  double v7;
  ADMutableCameraCalibration *v8;
  _BYTE v10[1024];
  _BYTE __dst[1024];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  memcpy(__dst, &unk_2363E0008, sizeof(__dst));
  memcpy(v10, &unk_2363E0408, sizeof(v10));
  v2 = [ADMillimeterRadiusPairsLensDistortionModel alloc];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __dst, 1024);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, 1024);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ADMillimeterRadiusPairsLensDistortionModel initWithDistortionCenter:distortedRadii:undistortedRadii:](v2, "initWithDistortionCenter:distortedRadii:undistortedRadii:", v3, v4, 2084.05811, 1403.30347);

  v6 = [ADMutableCameraCalibration alloc];
  LODWORD(v7) = 980151802;
  v8 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v6, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v5, *(double *)&_PromotedConst_1628, unk_2363E15A0, 7.41717015e22, *(double *)&_PromotedConst_1629, unk_2363E15D0, 4.84969978e-20, unk_2363E15F0, v7, 0x40B0400000000000, 0x40A5F00000000000);

  return v8;
}

+ (id)createWideCameraCalibrationWithPolynomials
{
  ADPolynomialsLensDistortionModel *v2;
  ADMutableCameraCalibration *v3;
  double v4;
  ADMutableCameraCalibration *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7 = xmmword_2363E0808;
  v8 = unk_2363E0818;
  v9 = xmmword_2363E0828;
  v10 = unk_2363E0838;
  v2 = -[ADPolynomialsLensDistortionModel initWithDistortionCenter:andPolynomials:]([ADPolynomialsLensDistortionModel alloc], "initWithDistortionCenter:andPolynomials:", &v7, 1272.26655, 957.504985);
  v3 = [ADMutableCameraCalibration alloc];
  LODWORD(v4) = 985834580;
  v5 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v3, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v2, *(double *)&_PromotedConst_1630, unk_2363E1610, 4.63031801e21, *(double *)&_PromotedConst_1631, unk_2363E1640, 1.88571355e-19, unk_2363E1660, v4, 0x40A4000000000000, 0x409E000000000000, v7, v8, v9, v10);

  return v5;
}

+ (id)createSyntheticCameraCalibrationWithDistortion:(id)a3
{
  id v3;
  ADMutableCameraCalibration *v4;
  double v5;
  ADMutableCameraCalibration *v6;

  v3 = a3;
  v4 = [ADMutableCameraCalibration alloc];
  LODWORD(v5) = 1008981770;
  v6 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v4, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v3, *(double *)&_PromotedConst_1632, unk_2363E1680, 5.76460897e17, *(double *)&_PromotedConst_1627, unk_2363E1560, 0.0, unk_2363E1580, v5, 0x407E000000000000, 0x4084000000000000);

  return v6;
}

+ (id)createSyntheticCameraCalibrationNilDistortion
{
  return +[UtilsForTests createSyntheticCameraCalibrationWithDistortion:](UtilsForTests, "createSyntheticCameraCalibrationWithDistortion:", 0);
}

+ (id)createSyntheticCameraCalibrationXThetaDistortion
{
  ADXThetaDistortionModel *v2;
  void *v3;

  v2 = -[ADXThetaDistortionModel initWithDistortionCenter:XThetaType:]([ADXThetaDistortionModel alloc], "initWithDistortionCenter:XThetaType:", 0, 240.0, 320.0);
  +[UtilsForTests createSyntheticCameraCalibrationWithDistortion:](UtilsForTests, "createSyntheticCameraCalibrationWithDistortion:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getNewTempFilePathWithExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  do
  {
    NSTemporaryDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathExtension:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v10;
  }
  while ((objc_msgSend(v4, "fileExistsAtPath:", v10) & 1) != 0);

  return v10;
}

@end
