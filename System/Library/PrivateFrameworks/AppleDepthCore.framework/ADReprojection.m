@implementation ADReprojection

- (ADReprojection)init
{
  return -[ADReprojection initWithCapacity:](self, "initWithCapacity:", 0);
}

- (ADReprojection)initWithCapacity:(unint64_t)a3
{
  return -[ADReprojection initWithCapacity:streakingInfill:](self, "initWithCapacity:streakingInfill:", a3, 1);
}

- (ADReprojection)initWithStreakingInfill:(unint64_t)a3
{
  return -[ADReprojection initWithCapacity:streakingInfill:](self, "initWithCapacity:streakingInfill:", 0, a3);
}

- (ADReprojection)initWithCapacity:(unint64_t)a3 streakingInfill:(unint64_t)a4
{
  char *v6;
  void *v7;
  ADReprojection *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ADReprojection;
  v6 = -[ADReprojection init](&v10, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_3;
  *((_QWORD *)v6 + 10) = 0;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  v6[72] = 0;
  *((_QWORD *)v6 + 12) = 0;
  *((_QWORD *)v6 + 13) = 0;
  *((_QWORD *)v6 + 14) = a4;
  *((_WORD *)v6 + 44) = 257;
  if ((objc_msgSend(v6, "updateCapacity:", a3) & 1) == 0)
    v8 = 0;
  else
LABEL_3:
    v8 = v7;

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[ADReprojection deallocateBuffers](self, "deallocateBuffers");
  v3.receiver = self;
  v3.super_class = (Class)ADReprojection;
  -[ADReprojection dealloc](&v3, sel_dealloc);
}

- (void)deallocateBuffers
{
  CGPoint *intermediateUndistortedCameraPixels;
  uint64_t v4;
  float *inOutDepth;
  CGPoint *srcCameraPixels;
  CGPoint *dstCameraPixels;
  int *warpMaskX;
  int *warpMaskY;
  float *warpMaskZHelper;

  intermediateUndistortedCameraPixels = self->_intermediateUndistortedCameraPixels;
  if (intermediateUndistortedCameraPixels)
    MEMORY[0x23B7F1D4C](intermediateUndistortedCameraPixels, 0x1000C80451B5BE8);
  v4 = *(_QWORD *)self->_points;
  if (v4)
    MEMORY[0x23B7F1D4C](v4, 0x1000C80451B5BE8);
  inOutDepth = self->_inOutDepth;
  if (inOutDepth)
    MEMORY[0x23B7F1D4C](inOutDepth, 0x1000C8052888210);
  srcCameraPixels = self->_srcCameraPixels;
  if (srcCameraPixels)
    MEMORY[0x23B7F1D4C](srcCameraPixels, 0x1000C80451B5BE8);
  dstCameraPixels = self->_dstCameraPixels;
  if (dstCameraPixels)
    MEMORY[0x23B7F1D4C](dstCameraPixels, 0x1000C80451B5BE8);
  warpMaskX = self->_warpMaskX;
  if (warpMaskX)
    MEMORY[0x23B7F1D4C](warpMaskX, 0x1000C8052888210);
  warpMaskY = self->_warpMaskY;
  if (warpMaskY)
    MEMORY[0x23B7F1D4C](warpMaskY, 0x1000C8052888210);
  warpMaskZHelper = self->_warpMaskZHelper;
  if (warpMaskZHelper)
    MEMORY[0x23B7F1D4C](warpMaskZHelper, 0x1000C8052888210);
  CVPixelBufferRelease(self->_warpMap);
  self->_warpMap = 0;
}

- (BOOL)updateCapacity:(unint64_t)a3
{
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_capacity < a3)
  {
    -[ADReprojection deallocateBuffers](self, "deallocateBuffers");
    self->_intermediateUndistortedCameraPixels = (CGPoint *)operator new[]();
    *(_QWORD *)self->_points = operator new[]();
    self->_inOutDepth = (float *)operator new[]();
    self->_srcCameraPixels = (CGPoint *)operator new[]();
    self->_dstCameraPixels = (CGPoint *)operator new[]();
    self->_warpMaskX = (int *)operator new[]();
    self->_warpMaskY = (int *)operator new[]();
    self->_warpMaskZHelper = (float *)operator new[]();
    if (!self->_intermediateUndistortedCameraPixels
      || !*(_QWORD *)self->_points
      || !self->_inOutDepth
      || !self->_srcCameraPixels
      || !self->_dstCameraPixels
      || !self->_warpMaskX
      || !self->_warpMaskY)
    {
      -[ADReprojection deallocateBuffers](self, "deallocateBuffers");
      return 0;
    }
    self->_capacity = a3;
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 134217984;
        v7 = a3;
        _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "updated reprojection capacity to %zu ", (uint8_t *)&v6, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_debug_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "updated reprojection capacity to %zu ", (uint8_t *)&v6, 0xCu);
    }
  }
  return 1;
}

- (int64_t)updateWarpWithWarpedDepthBuffer:(__CVBuffer *)a3 dimensions:(CGSize)a4 validPixels:(unint64_t)a5
{
  void *v5;
  __CVBuffer *v9;
  signed int PixelFormatType;
  int *v11;
  int *v12;
  unint64_t v13;
  unint64_t v14;
  vImagePixelCount v15;
  vImagePixelCount v16;
  char *v17;
  size_t v18;
  float *v19;
  double *v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  char *v26;
  vImagePixelCount v36;
  uint64_t v39;
  uint64_t v40;
  vImagePixelCount v43;
  uint64_t v44;
  uint64_t v47;
  int *v48;
  int *v49;
  unint64_t v50;
  unint64_t v51;
  vImagePixelCount v52;
  vImagePixelCount v53;
  char *v54;
  size_t v55;
  float *v56;
  double *v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  float *v63;
  float v64;
  vImagePixelCount v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  vImagePixelCount v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  int *v75;
  int *v76;
  unint64_t v77;
  unint64_t v78;
  vImagePixelCount v79;
  vImagePixelCount v80;
  char *v81;
  size_t v82;
  float *v83;
  double *v84;
  double *v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  int v89;
  float *v90;
  float v91;
  vImagePixelCount v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  vImagePixelCount v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  int *v102;
  int *v103;
  unint64_t v104;
  unint64_t v105;
  vImagePixelCount v106;
  vImagePixelCount v107;
  char *v108;
  size_t v109;
  float *v110;
  double *v111;
  double *v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  int v116;
  char *v117;
  BOOL v122;
  vImagePixelCount v124;
  uint64_t v127;
  uint64_t v128;
  vImagePixelCount v131;
  uint64_t v132;
  uint64_t v135;
  int *warpMaskX;
  int *warpMaskY;
  unint64_t capacity;
  unint64_t streakingInfill;
  vImagePixelCount width;
  vImagePixelCount height;
  int64_t v142;
  char *data;
  size_t rowBytes;
  float *v145;
  double *p_y;
  double *v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  int v151;
  char *v152;
  float v153;
  vImagePixelCount v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  vImagePixelCount v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  PixelBufferUtils *v164;
  vImage_Buffer *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  CGPoint *v171;
  CGPoint *v172;
  CGPoint *v173;
  CGPoint *v174;
  CGPoint *srcCameraPixels;
  CGPoint *v176;
  CGPoint *v177;
  CGPoint *v178;
  CGPoint *v179;
  CGPoint *dstCameraPixels;
  vImage_Buffer __p;
  uint8_t buf[4];
  vImage_Buffer *v183;
  uint64_t v184;

  v184 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (!a3)
    v9 = PixelBufferUtils::asPixelBuffer((unint64_t)a4.width, (unint64_t)a4.height, (PixelBufferUtils *)0x66646570, self->_warpMaskZHelper, v5);
  PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
  if (PixelFormatType <= 1717856626)
  {
    if (PixelFormatType == 825437747)
    {
      warpMaskX = self->_warpMaskX;
      warpMaskY = self->_warpMaskY;
      capacity = self->_capacity;
      srcCameraPixels = self->_srcCameraPixels;
      dstCameraPixels = self->_dstCameraPixels;
      v170 = *(_QWORD *)self->_points;
      streakingInfill = self->_streakingInfill;
      CVPixelBufferLockBaseAddress(v9, 0);
      memset(&__p, 0, sizeof(__p));
      PixelBufferUtils::asVImageBuffer(v9, *MEMORY[0x24BDBF090], &__p);
      height = __p.height;
      width = __p.width;
      if (__p.height * __p.width > capacity)
        goto LABEL_122;
      memset(warpMaskX, 255, 4 * capacity);
      memset(warpMaskY, 255, 4 * capacity);
      data = (char *)__p.data;
      rowBytes = __p.rowBytes;
      bzero(__p.data, __p.rowBytes * height);
      if (a5)
      {
        v145 = (float *)(v170 + 8);
        p_y = &srcCameraPixels->y;
        v147 = &dstCameraPixels->y;
        do
        {
          v148 = (int)*(v147 - 1);
          if ((v148 & 0x80000000) == 0 && (int)v148 < (int)width)
          {
            v149 = (int)*v147;
            if ((v149 & 0x80000000) == 0 && (int)v149 < (int)height)
            {
              v150 = (int)*(p_y - 1);
              v151 = (int)*p_y;
              v152 = &data[2 * v148 + rowBytes * v149];
              v153 = *v145 * 8.0;
              if (!*(_WORD *)v152 || v153 < (float)*(unsigned __int16 *)v152)
              {
                *(_WORD *)v152 = (int)v153;
                v154 = v148 + width * v149;
                warpMaskX[v154] = v150;
                warpMaskY[v154] = v151;
              }
              if (streakingInfill - 1 <= 1)
              {
                if ((_DWORD)v148 && !*((_WORD *)v152 - 1))
                {
                  *((_WORD *)v152 - 1) = (int)v153;
                  v155 = 4 * (v148 + width * v149) - 4;
                  *(int *)((char *)warpMaskX + v155) = v150;
                  *(int *)((char *)warpMaskY + v155) = v151;
                }
                if ((_DWORD)v149)
                {
                  v156 = (v149 - 1);
                  v157 = &data[rowBytes * v156];
                  if (!*(_WORD *)&v157[2 * v148])
                  {
                    *(_WORD *)&v157[2 * v148] = (int)v153;
                    v158 = v148 + width * v156;
                    warpMaskX[v158] = v150;
                    warpMaskY[v158] = v151;
                  }
                }
                if (streakingInfill == 2)
                {
                  if ((_DWORD)v148)
                  {
                    if ((_DWORD)v149)
                    {
                      v159 = (v149 - 1);
                      v160 = &data[rowBytes * v159];
                      v161 = (v148 - 1);
                      if (!*(_WORD *)&v160[2 * v161])
                      {
                        *(_WORD *)&v160[2 * v161] = (int)v153;
                        v162 = 4 * (v148 + width * v159) - 4;
                        *(int *)((char *)warpMaskX + v162) = v150;
                        *(int *)((char *)warpMaskY + v162) = v151;
                      }
                    }
                  }
                }
              }
            }
          }
          v145 += 4;
          p_y += 2;
          v147 += 2;
          --a5;
        }
        while (a5);
      }
    }
    else
    {
      if (PixelFormatType != 1717855600)
        goto LABEL_124;
      v48 = self->_warpMaskX;
      v49 = self->_warpMaskY;
      v50 = self->_capacity;
      v172 = self->_srcCameraPixels;
      v177 = self->_dstCameraPixels;
      v167 = *(_QWORD *)self->_points;
      v51 = self->_streakingInfill;
      CVPixelBufferLockBaseAddress(v9, 0);
      memset(&__p, 0, sizeof(__p));
      PixelBufferUtils::asVImageBuffer(v9, *MEMORY[0x24BDBF090], &__p);
      v53 = __p.height;
      v52 = __p.width;
      if (__p.height * __p.width > v50)
        goto LABEL_122;
      memset(v48, 255, 4 * v50);
      memset(v49, 255, 4 * v50);
      v54 = (char *)__p.data;
      v55 = __p.rowBytes;
      bzero(__p.data, __p.rowBytes * v53);
      if (a5)
      {
        v56 = (float *)(v167 + 8);
        v57 = &v172->y;
        v58 = &v177->y;
        do
        {
          v59 = (int)*(v58 - 1);
          if ((v59 & 0x80000000) == 0 && (int)v59 < (int)v52)
          {
            v60 = (int)*v58;
            if ((v60 & 0x80000000) == 0 && (int)v60 < (int)v53)
            {
              v61 = (int)*(v57 - 1);
              v62 = (int)*v57;
              v63 = (float *)&v54[4 * v59 + v55 * v60];
              v64 = *v56 / 1000.0;
              if (*v63 == 0.0 || *v63 > v64)
              {
                *v63 = v64;
                v66 = v59 + v52 * v60;
                v48[v66] = v61;
                v49[v66] = v62;
              }
              if (v51 - 1 <= 1)
              {
                if ((_DWORD)v59 && *(v63 - 1) == 0.0)
                {
                  *(v63 - 1) = v64;
                  v67 = 4 * (v59 + v52 * v60) - 4;
                  *(int *)((char *)v48 + v67) = v61;
                  *(int *)((char *)v49 + v67) = v62;
                }
                if ((_DWORD)v60)
                {
                  v68 = (v60 - 1);
                  v69 = &v54[v55 * v68];
                  if (*(float *)&v69[4 * v59] == 0.0)
                  {
                    *(float *)&v69[4 * v59] = v64;
                    v70 = v59 + v52 * v68;
                    v48[v70] = v61;
                    v49[v70] = v62;
                  }
                }
                if (v51 == 2)
                {
                  if ((_DWORD)v59)
                  {
                    if ((_DWORD)v60)
                    {
                      v71 = (v60 - 1);
                      v72 = &v54[v55 * v71];
                      v73 = (v59 - 1);
                      if (*(float *)&v72[4 * v73] == 0.0)
                      {
                        *(float *)&v72[4 * v73] = v64;
                        v74 = 4 * (v59 + v52 * v71) - 4;
                        *(int *)((char *)v48 + v74) = v61;
                        *(int *)((char *)v49 + v74) = v62;
                      }
                    }
                  }
                }
              }
            }
          }
          v56 += 4;
          v57 += 2;
          v58 += 2;
          --a5;
        }
        while (a5);
      }
    }
  }
  else
  {
    switch(PixelFormatType)
    {
      case 1717856627:
        v75 = self->_warpMaskX;
        v76 = self->_warpMaskY;
        v77 = self->_capacity;
        v173 = self->_srcCameraPixels;
        v178 = self->_dstCameraPixels;
        v168 = *(_QWORD *)self->_points;
        v78 = self->_streakingInfill;
        CVPixelBufferLockBaseAddress(v9, 0);
        memset(&__p, 0, sizeof(__p));
        PixelBufferUtils::asVImageBuffer(v9, *MEMORY[0x24BDBF090], &__p);
        v80 = __p.height;
        v79 = __p.width;
        if (__p.height * __p.width > v77)
          goto LABEL_122;
        memset(v75, 255, 4 * v77);
        memset(v76, 255, 4 * v77);
        v81 = (char *)__p.data;
        v82 = __p.rowBytes;
        bzero(__p.data, __p.rowBytes * v80);
        if (a5)
        {
          v83 = (float *)(v168 + 8);
          v84 = &v173->y;
          v85 = &v178->y;
          do
          {
            v86 = (int)*(v85 - 1);
            if ((v86 & 0x80000000) == 0 && (int)v86 < (int)v79)
            {
              v87 = (int)*v85;
              if ((v87 & 0x80000000) == 0 && (int)v87 < (int)v80)
              {
                v88 = (int)*(v84 - 1);
                v89 = (int)*v84;
                v90 = (float *)&v81[4 * v86 + v82 * v87];
                v91 = 1000.0 / *v83;
                if (*v90 == 0.0 || *v90 < v91)
                {
                  *v90 = v91;
                  v93 = v86 + v79 * v87;
                  v75[v93] = v88;
                  v76[v93] = v89;
                }
                if (v78 - 1 <= 1)
                {
                  if ((_DWORD)v86 && *(v90 - 1) == 0.0)
                  {
                    *(v90 - 1) = v91;
                    v94 = 4 * (v86 + v79 * v87) - 4;
                    *(int *)((char *)v75 + v94) = v88;
                    *(int *)((char *)v76 + v94) = v89;
                  }
                  if ((_DWORD)v87)
                  {
                    v95 = (v87 - 1);
                    v96 = &v81[v82 * v95];
                    if (*(float *)&v96[4 * v86] == 0.0)
                    {
                      *(float *)&v96[4 * v86] = v91;
                      v97 = v86 + v79 * v95;
                      v75[v97] = v88;
                      v76[v97] = v89;
                    }
                  }
                  if (v78 == 2)
                  {
                    if ((_DWORD)v86)
                    {
                      if ((_DWORD)v87)
                      {
                        v98 = (v87 - 1);
                        v99 = &v81[v82 * v98];
                        v100 = (v86 - 1);
                        if (*(float *)&v99[4 * v100] == 0.0)
                        {
                          *(float *)&v99[4 * v100] = v91;
                          v101 = 4 * (v86 + v79 * v98) - 4;
                          *(int *)((char *)v75 + v101) = v88;
                          *(int *)((char *)v76 + v101) = v89;
                        }
                      }
                    }
                  }
                }
              }
            }
            v83 += 4;
            v84 += 2;
            v85 += 2;
            --a5;
          }
          while (a5);
        }
        break;
      case 1751411059:
        v102 = self->_warpMaskX;
        v103 = self->_warpMaskY;
        v104 = self->_capacity;
        v174 = self->_srcCameraPixels;
        v179 = self->_dstCameraPixels;
        v169 = *(_QWORD *)self->_points;
        v105 = self->_streakingInfill;
        CVPixelBufferLockBaseAddress(v9, 0);
        memset(&__p, 0, sizeof(__p));
        PixelBufferUtils::asVImageBuffer(v9, *MEMORY[0x24BDBF090], &__p);
        v107 = __p.height;
        v106 = __p.width;
        if (__p.height * __p.width > v104)
          goto LABEL_122;
        memset(v102, 255, 4 * v104);
        memset(v103, 255, 4 * v104);
        v108 = (char *)__p.data;
        v109 = __p.rowBytes;
        bzero(__p.data, __p.rowBytes * v107);
        if (a5)
        {
          v110 = (float *)(v169 + 8);
          v111 = &v174->y;
          v112 = &v179->y;
          do
          {
            v113 = (int)*(v112 - 1);
            if ((v113 & 0x80000000) == 0 && (int)v113 < (int)v106)
            {
              v114 = (int)*v112;
              if ((v114 & 0x80000000) == 0 && (int)v114 < (int)v107)
              {
                v115 = (int)*(v111 - 1);
                v116 = (int)*v111;
                v117 = &v108[2 * v113 + v109 * v114];
                _S0 = 1000.0 / *v110;
                _H1 = *(_WORD *)v117;
                __asm
                {
                  FCVT            S2, H1
                  FCMP            H1, #0
                }
                if (_ZF)
                  v122 = 0;
                else
                  v122 = _S0 <= _S2;
                if (!v122)
                {
                  __asm { FCVT            H1, S0 }
                  *(_WORD *)v117 = _H1;
                  v124 = v113 + v106 * v114;
                  v102[v124] = v115;
                  v103[v124] = v116;
                }
                if (v105 - 1 <= 1)
                {
                  if ((_DWORD)v113)
                  {
                    __asm { FCMP            H1, #0 }
                    if (_ZF)
                    {
                      __asm { FCVT            H1, S0 }
                      *((_WORD *)v117 - 1) = _H1;
                      v127 = 4 * (v113 + v106 * v114) - 4;
                      *(int *)((char *)v102 + v127) = v115;
                      *(int *)((char *)v103 + v127) = v116;
                    }
                  }
                  if ((_DWORD)v114)
                  {
                    v128 = (v114 - 1);
                    __asm { FCMP            H1, #0 }
                    if (_ZF)
                    {
                      __asm { FCVT            H1, S0 }
                      *(_WORD *)&v108[2 * v113 + v109 * v128] = _H1;
                      v131 = v113 + v106 * v128;
                      v102[v131] = v115;
                      v103[v131] = v116;
                    }
                  }
                  if (v105 == 2)
                  {
                    if ((_DWORD)v113)
                    {
                      if ((_DWORD)v114)
                      {
                        v132 = (v114 - 1);
                        __asm { FCMP            H1, #0 }
                        if (_ZF)
                        {
                          __asm { FCVT            H0, S0 }
                          *(_WORD *)&v108[2 * (v113 - 1) + v109 * v132] = _H0;
                          v135 = 4 * (v113 + v106 * v132) - 4;
                          *(int *)((char *)v102 + v135) = v115;
                          *(int *)((char *)v103 + v135) = v116;
                        }
                      }
                    }
                  }
                }
              }
            }
            v110 += 4;
            v111 += 2;
            v112 += 2;
            --a5;
          }
          while (a5);
        }
        break;
      case 1751410032:
        v11 = self->_warpMaskX;
        v12 = self->_warpMaskY;
        v13 = self->_capacity;
        v171 = self->_srcCameraPixels;
        v176 = self->_dstCameraPixels;
        v166 = *(_QWORD *)self->_points;
        v14 = self->_streakingInfill;
        CVPixelBufferLockBaseAddress(v9, 0);
        memset(&__p, 0, sizeof(__p));
        PixelBufferUtils::asVImageBuffer(v9, *MEMORY[0x24BDBF090], &__p);
        v16 = __p.height;
        v15 = __p.width;
        if (__p.height * __p.width <= v13)
        {
          memset(v11, 255, 4 * v13);
          memset(v12, 255, 4 * v13);
          v17 = (char *)__p.data;
          v18 = __p.rowBytes;
          bzero(__p.data, __p.rowBytes * v16);
          if (a5)
          {
            v19 = (float *)(v166 + 8);
            v20 = &v171->y;
            v21 = &v176->y;
            do
            {
              v22 = (int)*(v21 - 1);
              if ((v22 & 0x80000000) == 0 && (int)v22 < (int)v15)
              {
                v23 = (int)*v21;
                if ((v23 & 0x80000000) == 0 && (int)v23 < (int)v16)
                {
                  v24 = (int)*(v20 - 1);
                  v25 = (int)*v20;
                  v26 = &v17[2 * v22 + v18 * v23];
                  _S0 = *v19 / 1000.0;
                  _H1 = *(_WORD *)v26;
                  __asm
                  {
                    FCVT            S2, H1
                    FCMP            H1, #0
                  }
                  if (_ZF)
                    _NF = 1;
                  else
                    _NF = _S0 < _S2;
                  if (_NF)
                  {
                    __asm { FCVT            H1, S0 }
                    *(_WORD *)v26 = _H1;
                    v36 = v22 + v15 * v23;
                    v11[v36] = v24;
                    v12[v36] = v25;
                  }
                  if (v14 - 1 <= 1)
                  {
                    if ((_DWORD)v22)
                    {
                      __asm { FCMP            H1, #0 }
                      if (_ZF)
                      {
                        __asm { FCVT            H1, S0 }
                        *((_WORD *)v26 - 1) = _H1;
                        v39 = 4 * (v22 + v15 * v23) - 4;
                        *(int *)((char *)v11 + v39) = v24;
                        *(int *)((char *)v12 + v39) = v25;
                      }
                    }
                    if ((_DWORD)v23)
                    {
                      v40 = (v23 - 1);
                      __asm { FCMP            H1, #0 }
                      if (_ZF)
                      {
                        __asm { FCVT            H1, S0 }
                        *(_WORD *)&v17[2 * v22 + v18 * v40] = _H1;
                        v43 = v22 + v15 * v40;
                        v11[v43] = v24;
                        v12[v43] = v25;
                      }
                    }
                    if (v14 == 2)
                    {
                      if ((_DWORD)v22)
                      {
                        if ((_DWORD)v23)
                        {
                          v44 = (v23 - 1);
                          __asm { FCMP            H1, #0 }
                          if (_ZF)
                          {
                            __asm { FCVT            H0, S0 }
                            *(_WORD *)&v17[2 * (v22 - 1) + v18 * v44] = _H0;
                            v47 = 4 * (v22 + v15 * v44) - 4;
                            *(int *)((char *)v11 + v47) = v24;
                            *(int *)((char *)v12 + v47) = v25;
                          }
                        }
                      }
                    }
                  }
                }
              }
              v19 += 4;
              v20 += 2;
              v21 += 2;
              --a5;
            }
            while (a5);
          }
          break;
        }
LABEL_122:
        v142 = -22957;
        if (!a3)
          goto LABEL_150;
        return v142;
      default:
LABEL_124:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v164 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(v9);
          PixelBufferUtils::pixelFormatAsString(v164, (char *)&__p);
          v165 = (__p.width & 0x8000000000000000) == 0 ? &__p : (vImage_Buffer *)__p.data;
          *(_DWORD *)buf = 136315138;
          v183 = v165;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot reproject buffer. unknown pixel format %s", buf, 0xCu);
          if (SHIBYTE(__p.width) < 0)
            operator delete(__p.data);
        }
        v142 = -22953;
        if (!a3)
          goto LABEL_150;
        return v142;
    }
  }
  CVPixelBufferUnlockBaseAddress(v9, 0);
  v142 = 0;
  if (!a3)
LABEL_150:
    CVPixelBufferRelease(v9);
  return v142;
}

- (void)calculateWarpedPixelsFromSrcCalibration:(id)a3 dstCalibration:(id)a4 sourceToDestinationTransform:(id *)a5 validPixels:(unint64_t)a6
{
  id v10;
  CGPoint *srcCameraPixels;
  void *v12;
  char isKindOfClass;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v10 = a4;
  srcCameraPixels = self->_srcCameraPixels;
  objc_msgSend(v17, "distortionModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v17, "undistort:distortedPixels:outUndistorted:", a6, self->_srcCameraPixels, self->_intermediateUndistortedCameraPixels);
    srcCameraPixels = self->_intermediateUndistortedCameraPixels;
  }
  objc_msgSend(v17, "backProject:undistortedPixels:withZ:outPoints:", a6, srcCameraPixels, self->_inOutDepth, *(_QWORD *)self->_points);
  +[ADCameraCalibration transform:points:with:outPoints:](ADCameraCalibration, "transform:points:with:outPoints:", a6, *(_QWORD *)self->_points, *(_QWORD *)self->_points, *(double *)a5, *((double *)a5 + 2), *((double *)a5 + 4), *((double *)a5 + 6));
  objc_msgSend(v10, "distortionModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  v16 = *(_QWORD *)self->_points;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v10, "project:points:outUndistortedPixels:", a6, v16, self->_dstCameraPixels);
  }
  else
  {
    objc_msgSend(v10, "project:points:outUndistortedPixels:", a6, v16, self->_intermediateUndistortedCameraPixels);
    objc_msgSend(v10, "distort:undistortedPixels:outDistorted:", a6, self->_intermediateUndistortedCameraPixels, self->_dstCameraPixels);
  }

}

- (int)vectorizeCameraPixels:(__CVBuffer *)a3
{
  signed int PixelFormatType;
  CGPoint *v6;
  float *v7;
  size_t v8;
  size_t v9;
  unint64_t v10;
  int v11;
  float *v12;
  size_t v13;
  unint64_t n;
  float v15;
  double *v16;
  int v17;
  CGPoint *v18;
  float *v19;
  size_t v20;
  size_t v21;
  unint64_t v22;
  char *v23;
  size_t v24;
  unint64_t k;
  double *v32;
  CGPoint *v33;
  float *v34;
  size_t v35;
  size_t v36;
  unint64_t v37;
  float *v38;
  size_t v39;
  unint64_t j;
  float v41;
  double *v42;
  CGPoint *srcCameraPixels;
  float *inOutDepth;
  size_t Height;
  size_t Width;
  unint64_t v47;
  _WORD *data;
  size_t rowBytes;
  unint64_t i;
  float v51;
  double *p_x;
  CGPoint *v53;
  float *v54;
  size_t v55;
  size_t v56;
  unint64_t v57;
  char *v58;
  size_t v59;
  unint64_t m;
  double *v63;
  PixelBufferUtils *v65;
  vImage_Buffer *v66;
  vImage_Buffer __p;
  uint8_t buf[4];
  vImage_Buffer *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType <= 1717855599)
  {
    if (PixelFormatType == 825437747)
    {
      inOutDepth = self->_inOutDepth;
      srcCameraPixels = self->_srcCameraPixels;
      Height = CVPixelBufferGetHeight(a3);
      Width = CVPixelBufferGetWidth(a3);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      memset(&__p, 0, sizeof(__p));
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
      if (Height)
      {
        v47 = 0;
        v11 = 0;
        data = __p.data;
        rowBytes = __p.rowBytes;
        do
        {
          if (Width)
          {
            for (i = 0; i != Width; ++i)
            {
              if (data[i])
              {
                v51 = (double)(unsigned __int16)data[i] * 0.125;
                inOutDepth[v11] = v51;
                p_x = &srcCameraPixels[v11].x;
                *p_x = (double)i + 0.5;
                p_x[1] = (double)v47 + 0.5;
                ++v11;
              }
            }
          }
          ++v47;
          data = (_WORD *)((char *)data + rowBytes);
        }
        while (v47 != Height);
        goto LABEL_57;
      }
      goto LABEL_56;
    }
    if (PixelFormatType == 1278226534)
    {
LABEL_29:
      v34 = self->_inOutDepth;
      v33 = self->_srcCameraPixels;
      v35 = CVPixelBufferGetHeight(a3);
      v36 = CVPixelBufferGetWidth(a3);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      memset(&__p, 0, sizeof(__p));
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
      if (v35)
      {
        v37 = 0;
        v11 = 0;
        v38 = (float *)__p.data;
        v39 = __p.rowBytes;
        do
        {
          if (v36)
          {
            for (j = 0; j != v36; ++j)
            {
              v41 = v38[j];
              if (v41 > 0.00000011921)
              {
                v34[v11] = v41 * 1000.0;
                v42 = &v33[v11].x;
                *v42 = (double)j + 0.5;
                v42[1] = (double)v37 + 0.5;
                ++v11;
              }
            }
          }
          ++v37;
          v38 = (float *)((char *)v38 + v39);
        }
        while (v37 != v35);
        goto LABEL_57;
      }
      goto LABEL_56;
    }
    v17 = 1278226536;
LABEL_19:
    if (PixelFormatType == v17)
    {
      v19 = self->_inOutDepth;
      v18 = self->_srcCameraPixels;
      v20 = CVPixelBufferGetHeight(a3);
      v21 = CVPixelBufferGetWidth(a3);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      memset(&__p, 0, sizeof(__p));
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
      if (v20)
      {
        v22 = 0;
        v11 = 0;
        v23 = (char *)__p.data;
        v24 = __p.rowBytes;
        do
        {
          if (v21)
          {
            for (k = 0; k != v21; ++k)
            {
              _H3 = *(_WORD *)&v23[2 * k];
              __asm { FCVT            S3, H3 }
              if (_S3 > 0.00000011921)
              {
                v19[v11] = _S3 * 1000.0;
                v32 = &v18[v11].x;
                *v32 = (double)k + 0.5;
                v32[1] = (double)v22 + 0.5;
                ++v11;
              }
            }
          }
          ++v22;
          v23 += v24;
        }
        while (v22 != v20);
        goto LABEL_57;
      }
      goto LABEL_56;
    }
    goto LABEL_59;
  }
  if (PixelFormatType > 1751410031)
  {
    if (PixelFormatType == 1751411059)
    {
      v54 = self->_inOutDepth;
      v53 = self->_srcCameraPixels;
      v55 = CVPixelBufferGetHeight(a3);
      v56 = CVPixelBufferGetWidth(a3);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      memset(&__p, 0, sizeof(__p));
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
      if (v55)
      {
        v57 = 0;
        v11 = 0;
        v58 = (char *)__p.data;
        v59 = __p.rowBytes;
        do
        {
          if (v56)
          {
            for (m = 0; m != v56; ++m)
            {
              _H3 = *(_WORD *)&v58[2 * m];
              __asm { FCVT            S3, H3 }
              if (_S3 > 0.00000011921)
              {
                v54[v11] = 1000.0 / _S3;
                v63 = &v53[v11].x;
                *v63 = (double)m + 0.5;
                v63[1] = (double)v57 + 0.5;
                ++v11;
              }
            }
          }
          ++v57;
          v58 += v59;
        }
        while (v57 != v55);
        goto LABEL_57;
      }
      goto LABEL_56;
    }
    v17 = 1751410032;
    goto LABEL_19;
  }
  if (PixelFormatType == 1717855600)
    goto LABEL_29;
  if (PixelFormatType == 1717856627)
  {
    v7 = self->_inOutDepth;
    v6 = self->_srcCameraPixels;
    v8 = CVPixelBufferGetHeight(a3);
    v9 = CVPixelBufferGetWidth(a3);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    memset(&__p, 0, sizeof(__p));
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &__p);
    if (v8)
    {
      v10 = 0;
      v11 = 0;
      v12 = (float *)__p.data;
      v13 = __p.rowBytes;
      do
      {
        if (v9)
        {
          for (n = 0; n != v9; ++n)
          {
            v15 = v12[n];
            if (v15 > 0.00000011921)
            {
              v7[v11] = 1000.0 / v15;
              v16 = &v6[v11].x;
              *v16 = (double)n + 0.5;
              v16[1] = (double)v10 + 0.5;
              ++v11;
            }
          }
        }
        ++v10;
        v12 = (float *)((char *)v12 + v13);
      }
      while (v10 != v8);
      goto LABEL_57;
    }
LABEL_56:
    v11 = 0;
LABEL_57:
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    return v11;
  }
LABEL_59:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v65 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
    PixelBufferUtils::pixelFormatAsString(v65, (char *)&__p);
    v66 = (__p.width & 0x8000000000000000) == 0 ? &__p : (vImage_Buffer *)__p.data;
    *(_DWORD *)buf = 136315138;
    v69 = v66;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot reproject buffer. unknown pixel format %s", buf, 0xCu);
    if (SHIBYTE(__p.width) < 0)
      operator delete(__p.data);
  }
  return -1;
}

- (uint64_t)updateWarpMapWithDepth:(uint64_t)a3 srcDepthUnits:(uint64_t)a4 dstDepthUnits:(uint64_t)a5 srcCalibration:(uint64_t)a6 dstCalibration:(uint64_t)a7 poseTransform:(uint64_t)a8 warpedDepth:
{
  return objc_msgSend(a1, "updateWarpMapWithDepth:srcCalibration:dstCalibration:poseTransform:warpedDepth:", a3, a6, a7, a8);
}

- (uint64_t)updateWarpMapWithDepth:(float32x4_t)a3 srcCalibration:(float32x4_t)a4 dstCalibration:(float32x4_t)a5 poseTransform:(uint64_t)a6 warpedDepth:(uint64_t)a7
{
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  ADCommonUtils *v20;
  simd_float4x3 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v41[4];
  simd_float4x3 v42;

  v14 = a8;
  v15 = a9;
  objc_msgSend(v14, "cameraToPlatformTransform");
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v36 = v19;
  v20 = (ADCommonUtils *)objc_msgSend(v15, "cameraToPlatformTransform");
  v22 = 0;
  v23 = v36;
  HIDWORD(v23) = 1.0;
  v25 = v34;
  v24 = v35;
  HIDWORD(v24) = 0;
  HIDWORD(v25) = 0;
  v26 = v33;
  HIDWORD(v26) = 0;
  v41[0] = v26;
  v41[1] = v25;
  v41[2] = v24;
  v41[3] = v23;
  do
  {
    v42.columns[v22] = (simd_float3)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v41[v22])), a3, *(float32x2_t *)&v41[v22], 1), a4, (float32x4_t)v41[v22], 2), a5, (float32x4_t)v41[v22], 3);
    ++v22;
  }
  while (v22 != 4);
  v27 = ADCommonUtils::computeTransform(v20, v21, v42);
  v31 = objc_msgSend(a1, "updateWarpMapWithDepth:srcCalibration:dstCalibration:sourceToDestinationTransform:warpedDepth:", a7, v14, v15, a10, v27, v28, v29, v30);

  return v31;
}

- (BOOL)isCalibrationUndistorted:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "distortionModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "distortionModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "distortionModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "XThetaType") == 2;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (uint64_t)updateWarpMapWithDepth:(uint64_t)a3 srcDepthUnits:(uint64_t)a4 dstDepthUnits:(uint64_t)a5 srcCalibration:(uint64_t)a6 dstCalibration:(uint64_t)a7 sourceToDestinationTransform:(uint64_t)a8 warpedDepth:
{
  return objc_msgSend(a1, "updateWarpMapWithDepth:srcCalibration:dstCalibration:sourceToDestinationTransform:warpedDepth:", a3, a6, a7, a8);
}

- (uint64_t)warpDepth:(float32x4_t)a3 srcCalibration:(float32x4_t)a4 dstCalibration:(float32x4_t)a5 poseTransform:(uint64_t)a6 warpedDepth:(uint64_t)a7
{
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  ADCommonUtils *v20;
  simd_float4x3 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v41[4];
  simd_float4x3 v42;

  v14 = a8;
  v15 = a9;
  objc_msgSend(v14, "cameraToPlatformTransform");
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v36 = v19;
  v20 = (ADCommonUtils *)objc_msgSend(v15, "cameraToPlatformTransform");
  v22 = 0;
  v23 = v36;
  HIDWORD(v23) = 1.0;
  v25 = v34;
  v24 = v35;
  HIDWORD(v24) = 0;
  HIDWORD(v25) = 0;
  v26 = v33;
  HIDWORD(v26) = 0;
  v41[0] = v26;
  v41[1] = v25;
  v41[2] = v24;
  v41[3] = v23;
  do
  {
    v42.columns[v22] = (simd_float3)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v41[v22])), a3, *(float32x2_t *)&v41[v22], 1), a4, (float32x4_t)v41[v22], 2), a5, (float32x4_t)v41[v22], 3);
    ++v22;
  }
  while (v22 != 4);
  v27 = ADCommonUtils::computeTransform(v20, v21, v42);
  v31 = objc_msgSend(a1, "updateWarpMapWithDepth:srcCalibration:dstCalibration:sourceToDestinationTransform:warpedDepth:warpMap:", a7, v14, v15, a10, 0, v27, v28, v29, v30);

  return v31;
}

- (uint64_t)updateWarpMapWithDepth:(__n128)a3 srcCalibration:(__n128)a4 dstCalibration:(__n128)a5 sourceToDestinationTransform:(uint64_t)a6 warpedDepth:(__CVBuffer *)a7
{
  id v14;
  id v15;
  __CVBuffer *v16;
  size_t Width;
  size_t v18;
  size_t Height;
  __CVBuffer *PixelBufferWithSameSize;
  size_t v21;
  size_t v22;
  uint64_t v23;
  uint8_t buf[4];
  size_t v30;
  __int16 v31;
  size_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v14 = a8;
  v15 = a9;
  if (*(_BYTE *)(a1 + 88))
  {
    v16 = *(__CVBuffer **)(a1 + 80);
    if (v16)
    {
      Width = CVPixelBufferGetWidth(v16);
      v18 = CVPixelBufferGetWidth(a7);
      v16 = *(__CVBuffer **)(a1 + 80);
      if (Width == v18)
      {
        Height = CVPixelBufferGetHeight(v16);
        if (Height == CVPixelBufferGetHeight(a7))
          goto LABEL_8;
        v16 = *(__CVBuffer **)(a1 + 80);
      }
    }
    CVPixelBufferRelease(v16);
    *(_QWORD *)(a1 + 80) = 0;
    PixelBufferWithSameSize = PixelBufferUtils::createPixelBufferWithSameSize(a7, (__CVBuffer *)0x32433136, 1);
    *(_QWORD *)(a1 + 80) = PixelBufferWithSameSize;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v21 = CVPixelBufferGetWidth(PixelBufferWithSameSize);
      v22 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 80));
      *(_DWORD *)buf = 134218240;
      v30 = v21;
      v31 = 2048;
      v32 = v22;
      _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "reallocated warp map for depth reprojection: %lu,%lu", buf, 0x16u);
    }
  }
LABEL_8:
  v23 = objc_msgSend((id)a1, "updateWarpMapWithDepth:srcCalibration:dstCalibration:sourceToDestinationTransform:warpedDepth:warpMap:", a7, v14, v15, a10, *(_QWORD *)(a1 + 80), a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);

  return v23;
}

- (uint64_t)updateWarpMapWithDepth:(__n128)a3 srcCalibration:(__n128)a4 dstCalibration:(__n128)a5 sourceToDestinationTransform:(uint64_t)a6 warpedDepth:(__CVBuffer *)a7 warpMap:(void *)a8
{
  id v16;
  id v17;
  void *v18;
  id v19;
  size_t Height;
  size_t Width;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  simd_float3 v30;
  simd_float3 v31;
  simd_float3 v32;
  simd_float3 v33;
  simd_float3 v34;
  simd_float3 v35;
  simd_float3x3 v37;
  simd_float3 v38;
  simd_float3 v39;
  simd_float3 v40;
  _BYTE v41[64];
  uint8_t buf[16];
  _OWORD v43[4];
  simd_float3x3 v44;

  *(__n128 *)v41 = a2;
  *(__n128 *)&v41[16] = a3;
  v43[0] = a2;
  v43[1] = a3;
  *(__n128 *)&v41[32] = a4;
  *(__n128 *)&v41[48] = a5;
  v43[2] = a4;
  v43[3] = a5;
  v16 = a8;
  v17 = a9;
  v18 = v17;
  if (v16 && v17)
  {
    v19 = a1;
    objc_sync_enter(v19);
    if (!*((_BYTE *)v19 + 88)
      || !objc_msgSend(v19, "isCalibrationUndistorted:", v16)
      || !objc_msgSend(v19, "isCalibrationUndistorted:", v18)
      || *((_QWORD *)v19 + 14))
    {
      if (!*((_BYTE *)v19 + 89))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "could not reproject. conditions for allowable methods did not meet", buf, 2u);
        }
        v29 = -22963;
        goto LABEL_24;
      }
      *((_BYTE *)v19 + 72) = 0;
      Height = CVPixelBufferGetHeight(a7);
      Width = CVPixelBufferGetWidth(a7);
      objc_msgSend(v18, "referenceDimensions");
      v23 = v22;
      objc_msgSend(v18, "referenceDimensions");
      if (Width * Height <= (unint64_t)(v23 * v24))
        v25 = (unint64_t)(v23 * v24);
      else
        v25 = Width * Height;
      if ((objc_msgSend(v19, "updateCapacity:", v25) & 1) != 0)
      {
        v26 = objc_msgSend(v19, "vectorizeCameraPixels:", a7);
        if ((v26 & 0x80000000) == 0)
        {
          v27 = v26;
          objc_msgSend(v19, "calculateWarpedPixelsFromSrcCalibration:dstCalibration:sourceToDestinationTransform:validPixels:", v16, v18, v43, v26);
          objc_msgSend(v18, "referenceDimensions");
          v28 = objc_msgSend(v19, "updateWarpWithWarpedDepthBuffer:dimensions:validPixels:", a10, v27);
LABEL_23:
          v29 = v28;
          goto LABEL_24;
        }
        v29 = -22953;
      }
      else
      {
        v29 = -22954;
      }
LABEL_24:
      objc_sync_exit(v19);

      goto LABEL_25;
    }
    *((_BYTE *)v19 + 72) = 1;
    objc_msgSend(v16, "intrinsicMatrix");
    v39 = v31;
    v40 = v30;
    v38 = v32;
    objc_msgSend(v18, "intrinsicMatrix");
    v37.columns[1] = v33;
    v37.columns[2] = v34;
    v37.columns[0] = v35;
    v44.columns[1] = v39;
    v44.columns[0] = v40;
    v44.columns[2] = v38;
    v28 = ADReprojectionOptimizations::reprojectUndistortedDepthMap(a7, a11, v44, *(simd_float4x3 *)v41, a10, v37);
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot reproject buffer. nil calibration data", buf, 2u);
  }
  v29 = -22953;
LABEL_25:

  return v29;
}

- (int64_t)warpImage:(__CVBuffer *)a3 intoImage:(__CVBuffer *)a4
{
  signed int PixelFormatType;
  __CVBuffer *warpMap;
  CGRect *v9;
  size_t v10;
  char *v11;
  vImagePixelCount v12;
  vImagePixelCount v13;
  vImagePixelCount v14;
  char *v15;
  size_t v16;
  char *v17;
  vImagePixelCount v18;
  __int128 v19;
  vImagePixelCount v20;
  unint64_t v21;
  char *v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  size_t v25;
  CGRect *v27;
  size_t v28;
  char *v29;
  vImagePixelCount v30;
  vImagePixelCount v31;
  uint64_t v32;
  unsigned __int16 *v33;
  size_t v34;
  char *v35;
  vImagePixelCount v36;
  __int128 v37;
  unsigned __int16 *v38;
  _WORD *v39;
  uint64_t j;
  signed int v41;
  int *v42;
  int *v43;
  size_t v44;
  size_t v45;
  CGRect *v46;
  size_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  size_t v51;
  uint64_t v52;
  int *v53;
  int *v54;
  _DWORD *v55;
  size_t ii;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  unsigned int v60;
  int *v61;
  int *v62;
  size_t v63;
  size_t v64;
  CGRect *v65;
  size_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  size_t v70;
  uint64_t v71;
  int *v72;
  int *v73;
  _WORD *v74;
  size_t n;
  __int16 v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  unsigned int v80;
  CGRect *v81;
  size_t rowBytes;
  char *data;
  vImagePixelCount height;
  vImagePixelCount v85;
  vImagePixelCount v86;
  char *v87;
  size_t v88;
  char *v89;
  vImagePixelCount width;
  __int128 v91;
  vImagePixelCount v92;
  unint64_t v93;
  _OWORD *v94;
  char *v95;
  unsigned __int16 v96;
  unsigned __int16 v97;
  CGRect *v98;
  size_t v99;
  char *v100;
  vImagePixelCount v101;
  vImagePixelCount v102;
  uint64_t v103;
  unsigned __int16 *v104;
  size_t v105;
  char *v106;
  vImagePixelCount v107;
  __int128 v108;
  unsigned __int16 *v109;
  _DWORD *v110;
  uint64_t i;
  __CVBuffer *v112;
  PixelBufferUtils *v113;
  vImage_Buffer *p_buf;
  NSObject *v115;
  int *warpMaskX;
  int *warpMaskY;
  size_t v118;
  size_t v119;
  CGRect *v120;
  size_t v121;
  char *v122;
  uint64_t v123;
  char *v124;
  size_t v125;
  uint64_t v126;
  int *v127;
  int *v128;
  _OWORD *v129;
  size_t k;
  uint64_t v131;
  unsigned int v132;
  uint64_t v133;
  unsigned int v134;
  int *v135;
  int *v136;
  size_t v137;
  size_t v138;
  CGRect *v139;
  size_t v140;
  char *v141;
  uint64_t v142;
  char *v143;
  size_t v144;
  uint64_t v145;
  int *v146;
  int *v147;
  _DWORD *v148;
  size_t m;
  int v150;
  uint64_t v151;
  unsigned int v152;
  uint64_t v153;
  unsigned int v154;
  PixelBufferUtils *v155;
  vImage_Buffer *v156;
  vImage_Buffer v157;
  vImage_Buffer buf;
  vImage_Buffer v159;
  uint64_t v160;

  v160 = *MEMORY[0x24BDAC8D0];
  if (self->_singlePassOptimizationUsed)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType > 1380410944)
    {
      switch(PixelFormatType)
      {
        case 1380410945:
          warpMap = self->_warpMap;
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(warpMap, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          memset(&buf, 0, sizeof(buf));
          v81 = (CGRect *)MEMORY[0x24BDBF090];
          PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
          memset(&v159, 0, sizeof(v159));
          PixelBufferUtils::asVImageBuffer(a4, *v81, &v159);
          memset(&v157, 0, sizeof(v157));
          PixelBufferUtils::asVImageBuffer(warpMap, *v81, &v157);
          rowBytes = v159.rowBytes;
          data = (char *)v159.data;
          height = v159.height;
          bzero(v159.data, v159.height * v159.rowBytes);
          v85 = buf.height;
          if (buf.height)
          {
            v86 = 0;
            v87 = (char *)v157.data;
            v88 = v157.rowBytes;
            v89 = (char *)buf.data;
            width = v159.width;
            v91 = *(_OWORD *)&buf.width;
            v92 = buf.width;
            do
            {
              if (v92)
              {
                v93 = 0;
                v94 = v89;
                do
                {
                  v95 = &v87[4 * v93];
                  v96 = *(_WORD *)v95;
                  if ((*(_WORD *)v95 & 0x8000) == 0)
                  {
                    v97 = *((_WORD *)v95 + 1);
                    if ((v97 & 0x8000) == 0 && width > v96 && height > v97)
                      *(_OWORD *)&data[16 * v96 + rowBytes * v97] = *v94;
                  }
                  ++v93;
                  ++v94;
                }
                while (v93 < (unint64_t)v91);
                v92 = v91;
              }
              ++v86;
              v89 += *((_QWORD *)&v91 + 1);
              v87 += v88;
            }
            while (v86 < v85);
          }
          goto LABEL_85;
        case 1717855600:
          warpMap = self->_warpMap;
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(warpMap, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          memset(&buf, 0, sizeof(buf));
          v98 = (CGRect *)MEMORY[0x24BDBF090];
          PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
          memset(&v159, 0, sizeof(v159));
          PixelBufferUtils::asVImageBuffer(a4, *v98, &v159);
          memset(&v157, 0, sizeof(v157));
          PixelBufferUtils::asVImageBuffer(warpMap, *v98, &v157);
          v99 = v159.rowBytes;
          v100 = (char *)v159.data;
          v101 = v159.height;
          bzero(v159.data, v159.height * v159.rowBytes);
          v102 = buf.height;
          if (buf.height)
          {
            v103 = 0;
            v104 = (unsigned __int16 *)v157.data;
            v105 = v157.rowBytes;
            v106 = (char *)buf.data;
            v107 = v159.width;
            v108 = *(_OWORD *)&buf.width;
            do
            {
              v109 = v104;
              v110 = v106;
              for (i = v108; i; --i)
              {
                if ((*v109 & 0x8000) == 0 && (v109[1] & 0x8000) == 0 && v107 > *v109 && v101 > v109[1])
                  *(_DWORD *)&v100[4 * *v109 + v99 * v109[1]] = *v110;
                ++v110;
                v109 += 2;
              }
              ++v103;
              v106 += *((_QWORD *)&v108 + 1);
              v104 = (unsigned __int16 *)((char *)v104 + v105);
            }
            while (v103 != v102);
          }
          goto LABEL_85;
        case 1751410032:
          warpMap = self->_warpMap;
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(warpMap, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          memset(&buf, 0, sizeof(buf));
          v27 = (CGRect *)MEMORY[0x24BDBF090];
          PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
          memset(&v159, 0, sizeof(v159));
          PixelBufferUtils::asVImageBuffer(a4, *v27, &v159);
          memset(&v157, 0, sizeof(v157));
          PixelBufferUtils::asVImageBuffer(warpMap, *v27, &v157);
          v28 = v159.rowBytes;
          v29 = (char *)v159.data;
          v30 = v159.height;
          bzero(v159.data, v159.height * v159.rowBytes);
          v31 = buf.height;
          if (buf.height)
          {
            v32 = 0;
            v33 = (unsigned __int16 *)v157.data;
            v34 = v157.rowBytes;
            v35 = (char *)buf.data;
            v36 = v159.width;
            v37 = *(_OWORD *)&buf.width;
            do
            {
              v38 = v33;
              v39 = v35;
              for (j = v37; j; --j)
              {
                if ((*v38 & 0x8000) == 0 && (v38[1] & 0x8000) == 0 && v36 > *v38 && v30 > v38[1])
                  *(_WORD *)&v29[2 * *v38 + v28 * v38[1]] = *v39;
                ++v39;
                v38 += 2;
              }
              ++v32;
              v35 += *((_QWORD *)&v37 + 1);
              v33 = (unsigned __int16 *)((char *)v33 + v34);
            }
            while (v32 != v31);
          }
          goto LABEL_85;
      }
    }
    else if (PixelFormatType == 32 || PixelFormatType == 1111970369 || PixelFormatType == 1380401729)
    {
      warpMap = self->_warpMap;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(warpMap, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      memset(&buf, 0, sizeof(buf));
      v9 = (CGRect *)MEMORY[0x24BDBF090];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
      memset(&v159, 0, sizeof(v159));
      PixelBufferUtils::asVImageBuffer(a4, *v9, &v159);
      memset(&v157, 0, sizeof(v157));
      PixelBufferUtils::asVImageBuffer(warpMap, *v9, &v157);
      v10 = v159.rowBytes;
      v11 = (char *)v159.data;
      v12 = v159.height;
      bzero(v159.data, v159.height * v159.rowBytes);
      v13 = buf.height;
      if (buf.height)
      {
        v14 = 0;
        v15 = (char *)v157.data;
        v16 = v157.rowBytes;
        v17 = (char *)buf.data;
        v18 = v159.width;
        v19 = *(_OWORD *)&buf.width;
        v20 = buf.width;
        do
        {
          if (v20)
          {
            v21 = 0;
            do
            {
              v22 = &v15[4 * v21];
              v23 = *(_WORD *)v22;
              if ((*(_WORD *)v22 & 0x8000) == 0)
              {
                v24 = *((_WORD *)v22 + 1);
                if ((v24 & 0x8000) == 0 && v18 > v23 && v12 > v24)
                  *(_DWORD *)&v11[4 * v23 + v10 * v24] = *(_DWORD *)&v17[4 * v21];
              }
              ++v21;
            }
            while (v21 < (unint64_t)v19);
            v20 = v19;
          }
          ++v14;
          v17 += *((_QWORD *)&v19 + 1);
          v15 += v16;
        }
        while (v14 < v13);
      }
LABEL_85:
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      v112 = warpMap;
LABEL_109:
      CVPixelBufferUnlockBaseAddress(v112, 1uLL);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return 0;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return -22953;
    v113 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
    PixelBufferUtils::pixelFormatAsString(v113, (char *)&buf);
    if ((buf.width & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (vImage_Buffer *)buf.data;
    LODWORD(v159.data) = 136315138;
    *(void **)((char *)&v159.data + 4) = p_buf;
    v115 = MEMORY[0x24BDACB70];
    goto LABEL_116;
  }
  v25 = CVPixelBufferGetHeight(a4);
  if (CVPixelBufferGetWidth(a4) * v25 <= self->_capacity)
  {
    v41 = CVPixelBufferGetPixelFormatType(a3);
    if (v41 > 1380410944)
    {
      switch(v41)
      {
        case 1380410945:
          warpMaskX = self->_warpMaskX;
          warpMaskY = self->_warpMaskY;
          v118 = CVPixelBufferGetHeight(a4);
          v119 = CVPixelBufferGetWidth(a4);
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          memset(&buf, 0, sizeof(buf));
          v120 = (CGRect *)MEMORY[0x24BDBF090];
          PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
          memset(&v159, 0, sizeof(v159));
          PixelBufferUtils::asVImageBuffer(a4, *v120, &v159);
          v121 = v159.rowBytes;
          v122 = (char *)v159.data;
          bzero(v159.data, v159.height * v159.rowBytes);
          if (v118)
          {
            v123 = 0;
            v124 = (char *)buf.data;
            v125 = buf.rowBytes;
            v126 = 4 * v119;
            do
            {
              v127 = warpMaskX;
              v128 = warpMaskY;
              v129 = v122;
              for (k = v119; k; --k)
              {
                v132 = *v127++;
                v131 = v132;
                v134 = *v128++;
                v133 = v134;
                if ((v131 & 0x80000000) == 0 && (v133 & 0x80000000) == 0)
                  *v129 = *(_OWORD *)&v124[16 * v131 + v125 * v133];
                ++v129;
              }
              ++v123;
              v122 += v121;
              warpMaskY = (int *)((char *)warpMaskY + v126);
              warpMaskX = (int *)((char *)warpMaskX + v126);
            }
            while (v123 != v118);
          }
          goto LABEL_108;
        case 1717855600:
          v135 = self->_warpMaskX;
          v136 = self->_warpMaskY;
          v137 = CVPixelBufferGetHeight(a4);
          v138 = CVPixelBufferGetWidth(a4);
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          memset(&buf, 0, sizeof(buf));
          v139 = (CGRect *)MEMORY[0x24BDBF090];
          PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
          memset(&v159, 0, sizeof(v159));
          PixelBufferUtils::asVImageBuffer(a4, *v139, &v159);
          v140 = v159.rowBytes;
          v141 = (char *)v159.data;
          bzero(v159.data, v159.height * v159.rowBytes);
          if (v137)
          {
            v142 = 0;
            v143 = (char *)buf.data;
            v144 = buf.rowBytes;
            v145 = 4 * v138;
            do
            {
              v146 = v135;
              v147 = v136;
              v148 = v141;
              for (m = v138; m; --m)
              {
                v150 = 0;
                v152 = *v146++;
                v151 = v152;
                v154 = *v147++;
                v153 = v154;
                if ((v151 & 0x80000000) == 0 && (v153 & 0x80000000) == 0)
                  v150 = *(_DWORD *)&v143[4 * v151 + v144 * v153];
                *v148++ = v150;
              }
              ++v142;
              v141 += v140;
              v136 = (int *)((char *)v136 + v145);
              v135 = (int *)((char *)v135 + v145);
            }
            while (v142 != v137);
          }
          goto LABEL_108;
        case 1751410032:
          v61 = self->_warpMaskX;
          v62 = self->_warpMaskY;
          v63 = CVPixelBufferGetHeight(a4);
          v64 = CVPixelBufferGetWidth(a4);
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          memset(&buf, 0, sizeof(buf));
          v65 = (CGRect *)MEMORY[0x24BDBF090];
          PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
          memset(&v159, 0, sizeof(v159));
          PixelBufferUtils::asVImageBuffer(a4, *v65, &v159);
          v66 = v159.rowBytes;
          v67 = (char *)v159.data;
          bzero(v159.data, v159.height * v159.rowBytes);
          if (v63)
          {
            v68 = 0;
            v69 = (char *)buf.data;
            v70 = buf.rowBytes;
            v71 = 4 * v64;
            do
            {
              v72 = v61;
              v73 = v62;
              v74 = v67;
              for (n = v64; n; --n)
              {
                v76 = 0;
                v78 = *v72++;
                v77 = v78;
                v80 = *v73++;
                v79 = v80;
                if ((v77 & 0x80000000) == 0 && (v79 & 0x80000000) == 0)
                  v76 = *(_WORD *)&v69[2 * v77 + v70 * v79];
                *v74++ = v76;
              }
              ++v68;
              v67 += v66;
              v62 = (int *)((char *)v62 + v71);
              v61 = (int *)((char *)v61 + v71);
            }
            while (v68 != v63);
          }
          goto LABEL_108;
      }
    }
    else if (v41 == 32 || v41 == 1111970369 || v41 == 1380401729)
    {
      v42 = self->_warpMaskX;
      v43 = self->_warpMaskY;
      v44 = CVPixelBufferGetHeight(a4);
      v45 = CVPixelBufferGetWidth(a4);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      memset(&buf, 0, sizeof(buf));
      v46 = (CGRect *)MEMORY[0x24BDBF090];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &buf);
      memset(&v159, 0, sizeof(v159));
      PixelBufferUtils::asVImageBuffer(a4, *v46, &v159);
      v47 = v159.rowBytes;
      v48 = (char *)v159.data;
      bzero(v159.data, v159.height * v159.rowBytes);
      if (v44)
      {
        v49 = 0;
        v50 = (char *)buf.data;
        v51 = buf.rowBytes;
        v52 = 4 * v45;
        do
        {
          v53 = v42;
          v54 = v43;
          v55 = v48;
          for (ii = v45; ii; --ii)
          {
            v58 = *v53++;
            v57 = v58;
            v60 = *v54++;
            v59 = v60;
            if ((v57 & 0x80000000) == 0 && (v59 & 0x80000000) == 0)
              *v55 = *(_DWORD *)&v50[4 * v57 + v51 * v59];
            ++v55;
          }
          ++v49;
          v48 += v47;
          v43 = (int *)((char *)v43 + v52);
          v42 = (int *)((char *)v42 + v52);
        }
        while (v49 != v44);
      }
LABEL_108:
      v112 = a3;
      goto LABEL_109;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return -22953;
    v155 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
    PixelBufferUtils::pixelFormatAsString(v155, (char *)&buf);
    if ((buf.width & 0x8000000000000000) == 0)
      v156 = &buf;
    else
      v156 = (vImage_Buffer *)buf.data;
    LODWORD(v159.data) = 136315138;
    *(void **)((char *)&v159.data + 4) = v156;
    v115 = MEMORY[0x24BDACB70];
LABEL_116:
    _os_log_error_impl(&dword_236382000, v115, OS_LOG_TYPE_ERROR, "cannot reproject buffer. unknown pixel format: %s", (uint8_t *)&v159, 0xCu);
    if (SHIBYTE(buf.width) < 0)
      operator delete(buf.data);
    return -22953;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.data) = 0;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "reprojection capacity does not fit input size. input may not match the depth used to update warp map", (uint8_t *)&buf, 2u);
  }
  return -22957;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)streakingInfill
{
  return self->_streakingInfill;
}

- (void)setStreakingInfill:(unint64_t)a3
{
  self->_streakingInfill = a3;
}

- (BOOL)singlePassReprojectionAllowed
{
  return self->_singlePassReprojectionAllowed;
}

- (void)setSinglePassReprojectionAllowed:(BOOL)a3
{
  self->_singlePassReprojectionAllowed = a3;
}

- (BOOL)fullPassReprojectionAllowed
{
  return self->_fullPassReprojectionAllowed;
}

- (void)setFullPassReprojectionAllowed:(BOOL)a3
{
  self->_fullPassReprojectionAllowed = a3;
}

@end
