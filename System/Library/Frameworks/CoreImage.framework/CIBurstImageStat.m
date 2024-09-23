@implementation CIBurstImageStat

- (void)allocateMeanStdPingPongBuffers:(float *)a3 :(float *)a4 :(float *)a5 :(float *)a6
{
  signed int v10;
  unsigned int v11;
  float *v12;
  float *v13;
  float *v14;

  if (a3)
  {
    if (a4)
    {
      *a3 = 0;
      *a4 = 0;
      if (self->projectionSignature.piCol)
      {
        if (self->projectionSignature.piRow)
        {
          v10 = (4 * LODWORD(self->projectionSignature.nPiCol) + 35) & 0xFFFFFFE0;
          v11 = ((4 * LODWORD(self->projectionSignature.nPiRow) + 35) & 0xFFFFFFE0) + v10;
          v12 = (float *)malloc_type_calloc(1uLL, (int)(5 * v11), 0x6B5AA37BuLL);
          if (v12)
          {
            *a3 = v12;
            v13 = (float *)((char *)v12 + (int)(2 * v11));
            *a4 = v13;
            v14 = (float *)((char *)v13 + (int)(2 * v11));
            *a5 = v14;
            *a6 = (float *)((char *)v14 + v10);
          }
        }
      }
    }
  }
}

- (void)assignMeanStdBuffers:(float *)a3
{
  float *piCol;
  int nPiCol;
  signed int v6;
  float *v7;
  float *v8;

  if (a3)
  {
    piCol = self->projectionSignature.piCol;
    if (piCol)
    {
      if (self->projectionSignature.piRow)
      {
        nPiCol = self->projectionSignature.nPiCol;
        v6 = (4 * LODWORD(self->projectionSignature.nPiRow) + 35) & 0xFFFFFFE0;
        self->projectionSignature.piRowTable.sumTable = a3;
        v7 = (float *)((char *)a3 + v6);
        self->projectionSignature.piRowTable.sumSqTable = v7;
        v8 = (float *)((char *)v7 + v6);
        self->projectionSignature.piColTable.sumTable = v8;
        self->projectionSignature.piColTable.sumSqTable = (float *)((char *)v8 + (int)((4 * nPiCol + 35) & 0xFFFFFFE0));
        Projections_computeMeanStdTable(piCol, nPiCol, &self->projectionSignature.piColTable.sumTable);
        Projections_computeMeanStdTable(self->projectionSignature.piRow, self->projectionSignature.nPiRow, &self->projectionSignature.piRowTable.sumTable);
      }
    }
  }
}

- (CIBurstImageStat)initWithIdentifier:(id)a3
{
  CIBurstImageStat *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIBurstImageStat;
  v4 = -[CIBurstImageStat init](&v6, sel_init);
  if (v4)
  {
    v4->imageId = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", a3);
    v4->faceStatArray = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v4->orientation = 1;
    v4->sharpnessGrid = 0;
    v4->maxSkewness = 0.0;
    v4->hasRegistrationData = 0;
    *(_OWORD *)&v4->timestamp = 0u;
    -[CIBurstImageStat setFullsizeJpegData:](v4, "setFullsizeJpegData:", 0);
  }
  return v4;
}

- (void)dealloc
{
  NSString *imageId;
  NSMutableArray *faceStatArray;
  SharpnessGridElement_t *sharpnessGrid;
  void *projectionMemoryBlock;
  objc_super v7;

  imageId = self->imageId;
  if (imageId)
  {

    self->imageId = 0;
  }
  faceStatArray = self->faceStatArray;
  if (faceStatArray)
  {

    self->faceStatArray = 0;
  }
  sharpnessGrid = self->sharpnessGrid;
  if (sharpnessGrid)
    free(sharpnessGrid);
  projectionMemoryBlock = self->projectionMemoryBlock;
  if (projectionMemoryBlock)
    free(projectionMemoryBlock);
  v7.receiver = self;
  v7.super_class = (Class)CIBurstImageStat;
  -[CIBurstImageStat dealloc](&v7, sel_dealloc);
}

- (void)computeImageColorHistogram:(id)a3
{
  int v5;
  int v6;
  int v7;
  float *colorHistogram;
  int v9;
  uint64_t v10;
  double v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  float32x4_t v20;

  v5 = objc_msgSend(a3, "bytesPerRow");
  v6 = (int)objc_msgSend(a3, "width") >> 1;
  v7 = (int)objc_msgSend(a3, "height") >> 1;
  self->numEntries = 0;
  colorHistogram = self->colorHistogram;
  bzero(self->colorHistogram, 0x1000uLL);
  v9 = (int)((float)v6 * 0.05);
  v10 = objc_msgSend(a3, "Cbuffer");
  v12 = v7 - v9;
  if (v7 - v9 > v9)
  {
    v11 = (float)v7 * 0.05;
    v13 = (int)v11;
    v14 = v10 + v5 * (uint64_t)v9 + 2 * (int)v11;
    do
    {
      if (v6 - (int)v11 > v13)
      {
        v15 = 0;
        v16 = self->numEntries + 1;
        v17 = v6 - 2 * v13;
        do
        {
          v18 = scaledBins[*(unsigned __int8 *)(v14 + v15)] + 32 * scaledBins[*(unsigned __int8 *)(v14 + v15 + 1)];
          colorHistogram[v18] = colorHistogram[v18] + 1.0;
          self->numEntries = v16++;
          v15 += 2;
          --v17;
        }
        while (v17);
      }
      ++v9;
      v14 += v5;
    }
    while (v9 != v12);
  }
  v19 = 0;
  *(float *)&v11 = (float)self->numEntries;
  v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v11, 0);
  do
  {
    *(float32x4_t *)&colorHistogram[v19] = vdivq_f32(*(float32x4_t *)&colorHistogram[v19], v20);
    v19 += 4;
  }
  while (v19 != 1024);
}

- (GridROI_t)getSharpnessAndBlurLimits
{
  uint64_t v2;
  uint64_t v3;
  GridROI_t result;

  v2 = *(_QWORD *)&self->gridWidth;
  v3 = 0;
  result.endX = v2;
  result.endY = HIDWORD(v2);
  result.startX = v3;
  result.startY = HIDWORD(v3);
  return result;
}

- (void)computeImageSharpnessOnGrid:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int8x16_t *v13;
  SharpnessGridElement_t *sharpnessGrid;
  uint64_t v15;
  int v16;
  float v17;
  int v18;
  uint64_t v19;

  v19 = objc_msgSend(a3, "Ybuffer");
  v5 = -[CIBurstImageStat getSharpnessAndBlurLimits](self, "getSharpnessAndBlurLimits");
  v7 = HIDWORD(v5);
  v8 = HIDWORD(v6);
  if (SHIDWORD(v5) < SHIDWORD(v6))
  {
    v9 = v5;
    v10 = v6;
    v18 = v6 - v5;
    v11 = (int)v5;
    do
    {
      v12 = objc_msgSend(a3, "bytesPerRow");
      if (v10 > v9)
      {
        v13 = (int8x16_t *)(v19 + 32 * (int)v7 * v12);
        sharpnessGrid = self->sharpnessGrid;
        v15 = v11;
        v16 = v18;
        do
        {
          if (!sharpnessGrid)
            break;
          v17 = (float)(int)horzDiff32x32(v13, objc_msgSend(a3, "bytesPerRow"), 32);
          sharpnessGrid = self->sharpnessGrid;
          sharpnessGrid[v15 + self->gridWidth * (uint64_t)(int)v7].var2 = v17;
          v13 += 2;
          ++v15;
          --v16;
        }
        while (v16);
      }
      LODWORD(v7) = v7 + 1;
    }
    while ((_DWORD)v7 != (_DWORD)v8);
  }
}

- (void)computeBlurStatsOnGrid:(id)a3
{
  int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  SharpnessGridElement_t *sharpnessGrid;
  int v15;
  int32x4_t *v16;
  char v17;
  uint64_t v18;
  int32x4_t *v19;
  uint8x16_t v20;
  uint8x16_t v21;
  int16x8_t v22;
  uint8x16_t v23;
  int16x8_t v24;
  uint8x16_t v25;
  int16x8_t v26;
  uint8x16_t v27;
  int16x8_t v28;
  uint8x16_t v29;
  int16x8_t v30;
  uint8x16_t v31;
  int16x8_t v32;
  uint8x16_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int8x16_t v68;
  int8x16_t v69;
  int8x16_t v70;
  int8x16_t v71;
  int16x8_t v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int8x16_t v86;
  int8x16_t v87;
  int8x16_t v88;
  int8x16_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int8x16_t v102;
  int8x16_t v103;
  int8x16_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int16x8_t v107;
  int16x8_t v108;
  int16x8_t v109;
  int16x8_t v110;
  int32x4_t v111;
  int16x8_t v112;
  int16x8_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int32x4_t v116;
  int8x16_t v117;
  int8x16_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int8x16_t v121;
  int8x16_t v122;
  int8x16_t v123;
  char v124;
  BOOL v125;
  SharpnessGridElement_t *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  unint64_t v142;
  int v143;
  int v144;
  int v145;
  unint64_t v146;
  int v147;
  uint64_t v148;
  _BYTE v149[32];
  uint64_t v150;
  uint64_t v151;
  _QWORD v152[126];

  v152[124] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "bytesPerRow");
  v140 = objc_msgSend(a3, "Ybuffer");
  v6 = -[CIBurstImageStat getSharpnessAndBlurLimits](self, "getSharpnessAndBlurLimits");
  v145 = v9;
  v146 = HIDWORD(v6);
  v142 = HIDWORD(v9);
  v143 = v6;
  if (SHIDWORD(v6) < SHIDWORD(v9))
  {
    v141 = 32 * v5;
    v10 = 8 * v5;
    v139 = v140 - v5 + 8 * v5;
    v144 = 32 * v5 * HIDWORD(v6);
    v137 = v140 + 5 * v5;
    v138 = v140 + 6 * v5;
    v135 = v140 + 3 * v5;
    v136 = v140 + 4 * v5;
    v133 = v140 + v5;
    v134 = v140 + 2 * v5;
    do
    {
      if (v143 < v145)
      {
        v11 = 0;
        v12 = v143;
        do
        {
          v13 = 0;
          v147 = v12;
          sharpnessGrid = self->sharpnessGrid;
          v15 = v12 + self->gridWidth * v146;
          v16 = (int32x4_t *)v149;
          v148 = v11;
          do
          {
            v17 = 1;
            v18 = v11;
            v19 = v16;
            do
            {
              v20 = *(uint8x16_t *)(v140 + v144 + v18);
              v21 = *(uint8x16_t *)(v133 + v144 + v18);
              v22 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v21.i8, *(uint8x8_t *)v20.i8);
              v23 = *(uint8x16_t *)(v134 + v144 + v18);
              v24 = (int16x8_t)vaddl_high_u8(v21, v20);
              v25 = *(uint8x16_t *)(v135 + v144 + v18);
              v26 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v25.i8, *(uint8x8_t *)v23.i8);
              v27 = *(uint8x16_t *)(v136 + v144 + v18);
              v28 = (int16x8_t)vaddl_high_u8(v25, v23);
              v29 = *(uint8x16_t *)(v137 + v144 + v18);
              v30 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v29.i8, *(uint8x8_t *)v27.i8);
              v31 = *(uint8x16_t *)(v138 + v144 + v18);
              v32 = (int16x8_t)vaddl_high_u8(v29, v27);
              v33 = *(uint8x16_t *)(v139 + v144 + v18);
              v34 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v33.i8, *(uint8x8_t *)v31.i8);
              v35 = (int16x8_t)vaddl_high_u8(v33, v31);
              v36 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v20.i8, *(uint8x8_t *)v21.i8);
              v37 = (int16x8_t)vsubl_high_u8(v20, v21);
              v38 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v23.i8, *(uint8x8_t *)v25.i8);
              v39 = (int16x8_t)vsubl_high_u8(v23, v25);
              v40 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v27.i8, *(uint8x8_t *)v29.i8);
              v41 = (int16x8_t)vsubl_high_u8(v27, v29);
              v42 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v31.i8, *(uint8x8_t *)v33.i8);
              v43 = (int16x8_t)vsubl_high_u8(v31, v33);
              v44 = vaddq_s16(v26, v22);
              v45 = vaddq_s16(v28, v24);
              v46 = vaddq_s16(v34, v30);
              v47 = vaddq_s16(v35, v32);
              v48 = vsubq_s16(v22, v26);
              v49 = vsubq_s16(v24, v28);
              v50 = vsubq_s16(v30, v34);
              v51 = vsubq_s16(v32, v35);
              v52 = vaddq_s16(v46, v44);
              v53 = vaddq_s16(v47, v45);
              v54 = vsubq_s16(v44, v46);
              v55 = vsubq_s16(v45, v47);
              v56 = vuzp1q_s16(v52, v54);
              v57 = vuzp1q_s16(v48, v50);
              v58 = vuzp2q_s16(v48, v50);
              v59 = vuzp1q_s16(v36, v38);
              v60 = vuzp2q_s16(v36, v38);
              v61 = vuzp2q_s16(v52, v54);
              v62 = vuzp1q_s16(v40, v42);
              v63 = vuzp2q_s16(v40, v42);
              v64 = vaddq_s16(v57, v58);
              v65 = vaddq_s16(v59, v60);
              v66 = vaddq_s16(v62, v63);
              v67 = vaddq_s16(v56, v61);
              v68 = (int8x16_t)vsubq_s16(v56, v61);
              v69 = (int8x16_t)vsubq_s16(v57, v58);
              v70 = (int8x16_t)vsubq_s16(v59, v60);
              v71 = (int8x16_t)vsubq_s16(v62, v63);
              v72 = vuzp1q_s16(v67, v64);
              v73 = vuzp2q_s16(v67, v64);
              v74 = vuzp1q_s16(v65, v66);
              v75 = vuzp2q_s16(v65, v66);
              v76 = vaddq_s16(v72, v73);
              v77 = vaddq_s16(v74, v75);
              v78 = (int32x4_t)vsubq_s16(v74, v75);
              v79 = (int32x4_t)vsubq_s16(v72, v73);
              v80 = vuzp1q_s16(v76, v77);
              v81 = vuzp2q_s16(v76, v77);
              v82 = vaddq_s16(v80, v81);
              v83 = vsubq_s16(v80, v81);
              v84 = (int32x4_t)vzip1q_s16(v82, v83);
              v85 = (int32x4_t)vzip2q_s16(v82, v83);
              v86 = (int8x16_t)vzip1q_s32(v84, v79);
              v87 = (int8x16_t)vzip2q_s32(v84, v79);
              v88 = (int8x16_t)vzip1q_s32(v85, v78);
              v89 = (int8x16_t)vzip2q_s32(v85, v78);
              v79.i64[0] = vextq_s8(v86, v86, 8uLL).u64[0];
              v85.i64[0] = v86.i64[0];
              v78.i64[0] = vextq_s8(v87, v87, 8uLL).u64[0];
              v90 = vuzp1q_s16(v53, v55);
              v91 = vuzp2q_s16(v53, v55);
              v92 = vuzp1q_s16(v49, v51);
              v53.i64[0] = vextq_s8(v88, v88, 8uLL).u64[0];
              v93 = vuzp2q_s16(v49, v51);
              v94 = vuzp1q_s16(v37, v39);
              v95 = vuzp2q_s16(v37, v39);
              v96 = vuzp1q_s16(v41, v43);
              v97 = vuzp2q_s16(v41, v43);
              v39.i64[0] = v88.i64[0];
              v98 = vaddq_s16(v90, v91);
              v99 = vaddq_s16(v92, v93);
              v100 = vaddq_s16(v94, v95);
              v101 = vaddq_s16(v96, v97);
              v102 = (int8x16_t)vsubq_s16(v90, v91);
              v37.i64[0] = vextq_s8(v89, v89, 8uLL).u64[0];
              v103 = (int8x16_t)vsubq_s16(v92, v93);
              v104 = (int8x16_t)vsubq_s16(v94, v95);
              v105 = vuzp1q_s16(v98, v99);
              v106 = vuzp2q_s16(v98, v99);
              v107 = vuzp1q_s16(v100, v101);
              v93.i64[0] = v89.i64[0];
              v108 = vuzp2q_s16(v100, v101);
              v109 = vaddq_s16(v105, v106);
              v110 = vaddq_s16(v107, v108);
              v111 = (int32x4_t)vsubq_s16(v105, v106);
              v85.i64[1] = v68.i64[0];
              v112 = vuzp1q_s16(v109, v110);
              v113 = vuzp2q_s16(v109, v110);
              v114 = vaddq_s16(v112, v113);
              v115 = vsubq_s16(v112, v113);
              v87.i64[1] = v69.i64[0];
              v116 = (int32x4_t)vzip1q_s16(v114, v115);
              v117 = (int8x16_t)vzip1q_s32(v116, v111);
              v100.i64[0] = vextq_s8(v117, v117, 8uLL).u64[0];
              v39.i64[1] = v70.i64[0];
              v118 = (int8x16_t)vzip2q_s32(v116, v111);
              v116.i64[0] = vextq_s8(v118, v118, 8uLL).u64[0];
              v79.i64[1] = vextq_s8(v68, v68, 8uLL).u64[0];
              v68.i64[0] = vextq_s8(v69, v69, 8uLL).u64[0];
              v69.i64[0] = vextq_s8(v70, v70, 8uLL).u64[0];
              v93.i64[1] = v71.i64[0];
              v78.i64[1] = v68.i64[0];
              v119 = (int32x4_t)vsubq_s16(v107, v108);
              v120 = (int32x4_t)vzip2q_s16(v114, v115);
              v121 = (int8x16_t)vzip1q_s32(v120, v119);
              v115.i64[0] = vextq_s8(v121, v121, 8uLL).u64[0];
              v53.i64[1] = v69.i64[0];
              v122 = (int8x16_t)vzip2q_s32(v120, v119);
              v69.i64[0] = vextq_s8(v122, v122, 8uLL).u64[0];
              v37.i64[1] = vextq_s8(v71, v71, 8uLL).u64[0];
              v117.i64[1] = v102.i64[0];
              *v19 = v85;
              v19[1] = (int32x4_t)v117;
              v100.i64[1] = vextq_s8(v102, v102, 8uLL).u64[0];
              v118.i64[1] = v103.i64[0];
              v19[8] = (int32x4_t)v87;
              v19[9] = (int32x4_t)v118;
              v123 = (int8x16_t)vsubq_s16(v96, v97);
              v121.i64[1] = v104.i64[0];
              v19[16] = (int32x4_t)v39;
              v19[17] = (int32x4_t)v121;
              v116.i64[1] = vextq_s8(v103, v103, 8uLL).u64[0];
              v122.i64[1] = v123.i64[0];
              v19[4] = v79;
              v19[5] = (int32x4_t)v100;
              v19[24] = (int32x4_t)v93;
              v19[25] = (int32x4_t)v122;
              v115.i64[1] = vextq_s8(v104, v104, 8uLL).u64[0];
              v19[12] = v78;
              v19[13] = v116;
              v69.i64[1] = vextq_s8(v123, v123, 8uLL).u64[0];
              v19[20] = (int32x4_t)v53;
              v19[21] = (int32x4_t)v115;
              v124 = v17;
              v19[28] = (int32x4_t)v37;
              v19[29] = (int32x4_t)v69;
              v18 += 16;
              v19 += 2;
              v17 = 0;
            }
            while ((v124 & 1) != 0);
            v16 += 32;
            v11 += v10;
            v125 = v13 >= 0x18;
            v13 += 8;
          }
          while (!v125);
          v126 = &sharpnessGrid[v15];
          updateBlurStatsOne16x16((uint64_t)v149, v126, v7, v8);
          updateBlurStatsOne16x16((uint64_t)&v150, v126, v127, v128);
          updateBlurStatsOne16x16((uint64_t)&v151, v126, v129, v130);
          updateBlurStatsOne16x16((uint64_t)v152, v126, v131, v132);
          v12 = v147 + 1;
          v11 = v148 + 32;
        }
        while (v147 + 1 != v145);
      }
      v144 += v141;
      LODWORD(v146) = v146 + 1;
    }
    while ((_DWORD)v146 != (_DWORD)v142);
  }
}

- (float)computeSmoothedGridROI:(id)a3 nextStat:(id)a4
{
  int32x4_t gridROI;
  int startX;
  int startY;
  int endX;
  int endY;
  GridROI_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t *v15;
  float32x2_t v16;
  float result;

  if (self->doLimitedSharpnessAndBlur)
  {
    gridROI = (int32x4_t)self->gridROI;
LABEL_22:
    self->smoothedROI = (GridROI_t)gridROI;
    goto LABEL_23;
  }
  startX = self->gridROI.startX;
  if (startX == -1
    || (startY = self->gridROI.startY, startY == -1)
    || (endX = self->gridROI.endX, endX == -1)
    || (endY = self->gridROI.endY, endY == -1))
  {
    startY = 0;
    startX = 0;
    endX = self->gridWidth - 1;
    self->gridROI.endX = endX;
    *(_QWORD *)&self->gridROI.startX = 0;
    endY = self->gridHeight - 1;
    self->gridROI.endY = endY;
  }
  if (a4
    && (*((_DWORD *)a4 + 1184) == -1
     || *((_DWORD *)a4 + 1185) == -1
     || *((_DWORD *)a4 + 1186) == -1
     || *((_DWORD *)a4 + 1187) == -1))
  {
    *((_DWORD *)a4 + 1184) = 0;
    *((_DWORD *)a4 + 1186) = self->gridWidth - 1;
    *((_DWORD *)a4 + 1185) = 0;
    *((_DWORD *)a4 + 1187) = self->gridHeight - 1;
    startX = self->gridROI.startX;
    startY = self->gridROI.startY;
    endX = self->gridROI.endX;
    endY = self->gridROI.endY;
  }
  BurstLoggingMessage("Original ROI = %d,%d -> %d,%d\t\t", startX, startY, endX, endY);
  if (a3 && a4)
  {
    v12 = self->gridROI;
    v13 = *((int32x4_t *)a3 + 296);
    v14 = vminq_s32((int32x4_t)v12, v13);
    gridROI = (int32x4_t)vbslq_s8((int8x16_t)vcgtq_s32(v14, *((int32x4_t *)a4 + 296)), (int8x16_t)v14, (int8x16_t)vminq_s32(vmaxq_s32((int32x4_t)v12, v13), *((int32x4_t *)a4 + 296)));
    goto LABEL_22;
  }
  if (a3)
    v15 = (int32x4_t *)a3;
  else
    v15 = (int32x4_t *)a4;
  if (v15)
  {
    gridROI = vshrq_n_s32(vaddq_s32(v15[296], (int32x4_t)self->gridROI), 1uLL);
    goto LABEL_22;
  }
LABEL_23:
  BurstLoggingMessage("Smoothed ROI = %d,%d -> %d,%d\n", self->smoothedROI.startX, self->smoothedROI.startY, self->smoothedROI.endX, self->smoothedROI.endY);
  v16 = vdiv_f32(vcvt_f32_s32(vsub_s32(*(int32x2_t *)&self->smoothedROI.endX, *(int32x2_t *)&self->smoothedROI.startX)), vcvt_f32_s32(*(int32x2_t *)&self->gridWidth));
  LODWORD(result) = vmul_lane_f32(v16, v16, 1).u32[0];
  self->roiSize = result;
  return result;
}

- (void)updateROI:(GridROI_t)a3
{
  int startY;
  int startX;
  int v5;
  int endX;
  int v7;
  int endY;
  int gridWidth;
  int gridHeight;

  if (!self->doLimitedSharpnessAndBlur)
  {
    startY = a3.startY;
    startX = self->gridROI.startX;
    if (startX == -1
      || (v5 = self->gridROI.startY, v5 == -1)
      || (endX = self->gridROI.endX, endX == -1)
      || (v7 = self->gridROI.endY, v7 == -1))
    {
      *(_QWORD *)&self->gridROI.endX = *(_QWORD *)&a3.endX;
      endY = a3.endY;
    }
    else
    {
      a3.startX = (a3.startX + startX + 1) >> 1;
      startY = (a3.startY + v5 + 1) >> 1;
      self->gridROI.endX = (a3.endX + endX + 1) >> 1;
      endY = (a3.endY + v7 + 1) >> 1;
      self->gridROI.endY = endY;
      a3.endX = (a3.endX + endX + 1) >> 1;
    }
    self->gridROI.startX = a3.startX & ~(a3.startX >> 31);
    self->gridROI.startY = startY & ~(startY >> 31);
    gridWidth = self->gridWidth;
    if (a3.endX >= gridWidth)
      self->gridROI.endX = gridWidth - 1;
    gridHeight = self->gridHeight;
    if (endY >= gridHeight)
      self->gridROI.endY = gridHeight - 1;
    BurstLoggingMessage("Sharpness ROI for %s updated to (%d,%d)->(%d,%d)\n", -[NSString UTF8String](self->imageId, "UTF8String"), self->gridROI.startX, self->gridROI.startY, self->gridROI.endX, self->gridROI.endY);
  }
}

- (void)flagAsGarbage
{
  self->isGarbage = 1;
  self->registrationErrorX = 0.0;
  *(_QWORD *)&self->registrationErrorY = 0;
}

- (void)performRegistration:(id)a3 deltaCol:(float *)a4 deltaRow:(float *)a5
{
  float *p_tx;
  float *p_ty;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t gridHeight;
  uint64_t v24;
  float v25;
  float v26;
  double v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  int v51;
  float *v52;
  uint64_t v53;
  double v54;
  float v55;
  uint64_t v56;
  float v57;
  float v58;
  float *v59;
  uint64_t v60;
  float v61;
  double v62;
  uint64_t v63;
  float v64;
  float v65;
  double v66;
  float v67;
  double v68;
  double v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  uint64_t v78;
  int v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  float v94;
  double v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int);
  void *v105;
  uint64_t *v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109[2];
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  int v118;
  int v119;
  char v120[8];

  v109[0] = 0x7F7FFFFF7F7FFFFFLL;
  BurstLoggingMessage("%s REGISTERED AGAINST %s\n", -[NSString UTF8String](self->imageId, "UTF8String"), (const char *)objc_msgSend((id)objc_msgSend(a3, "imageId"), "UTF8String"));
  p_tx = &self->tx;
  p_ty = &self->ty;
  LODWORD(v11) = 0.5;
  FastRegistration_register((_DWORD)self + 4656, (_DWORD)a3 + 4656, 0, (_DWORD)self + 4840, (_DWORD)self + 4844, (int)v109 + 4, (int)v109, v12, v11, v13, v14, v15, v16, v17, v18, v19, v96, v97, v98,
    v99,
    v100,
    v101,
    v102,
    v103,
    v104,
    v105,
    v106,
    v107,
    v108,
    (float *)0x7F7FFFFF7F7FFFFFLL,
    (float *)v109[1],
    v110,
    v111,
    v112,
    v113,
    v114,
    v115,
    v116,
    v117,
    v118,
    v119,
    *(float *)v120);
  v20 = -[CIBurstImageStat AEAverage](self, "AEAverage") - *((_DWORD *)a3 + 1198);
  if (v20 >= 0)
    v21 = v20;
  else
    v21 = -v20;
  -[CIBurstImageStat setAEDelta:](self, "setAEDelta:", v21);
  if (!a4 || !a5)
    return;
  v107 = 0;
  v108 = 0;
  v105 = 0;
  v106 = 0;
  v103 = 0;
  v104 = 0;
  v22 = (self->gridWidth - 1);
  gridHeight = self->gridHeight;
  v24 = (gridHeight - 1);
  FastRegistration_compareSignatures((uint64_t *)&self->projectionSignature, (uint64_t *)a3 + 582, a4, (vDSP_Length *)&v104, a5, (vDSP_Length *)&v103, gridHeight, self->tx, self->ty);
  BurstLoggingMessage("Registration result: tx = %d, ty = %d\n", (int)self->tx, (int)self->ty);
  v26 = computeRegistrationErrorStats((float *)&v107, a5, v103, v25);
  *(float *)&v27 = computeRegistrationErrorStats((float *)&v105, a4, (int)v104, v26);
  -[CIBurstImageStat maxSkewness](self, "maxSkewness", v27);
  if (v28 < *(float *)&v107)
    -[CIBurstImageStat setMaxSkewness:](self, "setMaxSkewness:");
  -[CIBurstImageStat maxSkewness](self, "maxSkewness");
  if (*(float *)&v29 < *(float *)&v105)
    -[CIBurstImageStat setMaxSkewness:](self, "setMaxSkewness:");
  LODWORD(v29) = HIDWORD(v106);
  -[CIBurstImageStat setRegistrationErrorX:](self, "setRegistrationErrorX:", v29);
  LODWORD(v30) = HIDWORD(v108);
  -[CIBurstImageStat setRegistrationErrorY:](self, "setRegistrationErrorY:", v30);
  -[CIBurstImageStat setHasRegistrationData:](self, "setHasRegistrationData:", 1);
  LODWORD(v32) = HIDWORD(v106);
  v33 = *((float *)&v106 + 1) <= 5000.0 && *((float *)&v108 + 1) <= 5000.0;
  if (v33 || (LODWORD(v32) = 1153957888, (float)(*((float *)&v107 + 1) + *((float *)&v105 + 1)) <= 1600.0))
  {
    LODWORD(v31) = 0;
    -[CIBurstImageStat setRegistrationErrorIntegral:](self, "setRegistrationErrorIntegral:", v31, v32);
    -[CIBurstImageStat registrationErrorIntegral](self, "registrationErrorIntegral");
    BurstLoggingMessage("----------REGISTRATION ERROR INTEGRAL \t\t= \t\t\t%f\n", v94);
    BurstLoggingMessage("Registration rejected due to insufficient local motion.\n");
LABEL_63:
    if (self->doLimitedSharpnessAndBlur)
      return;
    -[CIBurstImageStat updateROI:](self, "updateROI:", 0, v22 | (v24 << 32));
    v92 = a3;
    v91 = 0;
    v93 = v22 | (v24 << 32);
    goto LABEL_65;
  }
  v101 = 0;
  v102 = 0;
  computeForegroundInterval((uint64_t)&v107, (uint64_t)a5, v103, (int *)&v102 + 1, (int *)&v102);
  computeForegroundInterval((uint64_t)&v105, (uint64_t)a4, (int)v104, (int *)&v101 + 1, (int *)&v101);
  v34 = v102;
  v35 = HIDWORD(v102);
  v36 = v101;
  v37 = HIDWORD(v101);
  v38 = HIDWORD(v102) + (((int)v102 - HIDWORD(v102)) >> 1);
  v39 = v38 - 49;
  v40 = v38 + 49;
  if ((int)v102 - HIDWORD(v102) < 97)
  {
    v34 = v40;
    v35 = v39;
  }
  v41 = HIDWORD(v101) + (((int)v101 - HIDWORD(v101)) >> 1);
  v42 = v41 - 49;
  v43 = v41 + 49;
  if ((int)v101 - HIDWORD(v101) < 97)
  {
    v36 = v43;
    v37 = v42;
  }
  v44 = v36 - v37;
  v45 = v34 - v35;
  if ((v36 - v37) * (v34 - v35) <= 20480)
  {
    v46 = (float)v45 / (float)v44;
    v47 = (float)(v35 + (v45 >> 1));
    v48 = (float)(v46 * 144.0) * 0.5;
    v35 = (int)(float)(v47 - v48);
    v34 = (int)(float)(v48 + v47);
    v49 = (float)(v37 + (v44 >> 1));
    v50 = (float)(144.0 / v46) * 0.5;
    v37 = (int)(float)(v49 - v50);
    v36 = (int)(float)(v50 + v49);
  }
  v51 = v35 & ~(v35 >> 31);
  HIDWORD(v101) = v37 & ~(v37 >> 31);
  if ((int)v103 - 1 < v34)
    v34 = v103 - 1;
  v102 = __PAIR64__(v51, v34);
  if ((int)v104 - 1 < v36)
    v36 = (_DWORD)v104 - 1;
  LODWORD(v101) = v36;
  v52 = &a5[v51];
  qsort(v52, v34 - v51, 4uLL, (int (__cdecl *)(const void *, const void *))compareFloats);
  v54 = (float)((int)v102 - HIDWORD(v102)) * 0.2;
  v53 = (int)v54;
  LODWORD(v54) = 0;
  v55 = 0.0;
  if ((int)v53 >= 1)
  {
    v56 = v53;
    do
    {
      v57 = *v52++;
      v55 = v55 + v57;
      --v56;
    }
    while (v56);
  }
  v58 = v55 / (float)(int)v53;
  if ((_DWORD)v53)
    *(float *)&v54 = v58;
  -[CIBurstImageStat setRegistrationErrorIntegral:](self, "setRegistrationErrorIntegral:", v54);
  v59 = &a4[SHIDWORD(v101)];
  qsort(v59, (int)v101 - (uint64_t)SHIDWORD(v101), 4uLL, (int (__cdecl *)(const void *, const void *))compareFloats);
  v62 = (float)(v101 - HIDWORD(v101)) * 0.2;
  v60 = (int)v62;
  v61 = 0.0;
  LODWORD(v62) = 0;
  if ((int)v60 >= 1)
  {
    v63 = v60;
    do
    {
      v64 = *v59++;
      *(float *)&v62 = *(float *)&v62 + v64;
      --v63;
    }
    while (v63);
  }
  if ((_DWORD)v60)
    v61 = *(float *)&v62 / (float)(int)v60;
  -[CIBurstImageStat registrationErrorIntegral](self, "registrationErrorIntegral", v62);
  *(float *)&v66 = v61 + v65;
  -[CIBurstImageStat setRegistrationErrorIntegral:](self, "setRegistrationErrorIntegral:", v66);
  -[CIBurstImageStat registrationErrorIntegral](self, "registrationErrorIntegral");
  BurstLoggingMessage("----------REGISTRATION ERROR INTEGRAL \t\t= \t\t\t%f\n", v67);
  -[CIBurstImageStat registrationErrorIntegral](self, "registrationErrorIntegral");
  -[CIBurstImageStat setActionClusteringScore:](self, "setActionClusteringScore:");
  if (*(float *)&v107 <= 0.5 || *((float *)&v108 + 1) <= 5000.0)
  {
    LODWORD(v69) = (_DWORD)v105;
    if (*(float *)&v105 <= 0.5 || *((float *)&v106 + 1) <= 5000.0)
    {
      LODWORD(v68) = 0;
      -[CIBurstImageStat setRegistrationErrorIntegral:](self, "setRegistrationErrorIntegral:", v68, v69);
      BurstLoggingMessage("Registration rejected due to skewness, which can indicate a bad registration result.\n");
      goto LABEL_63;
    }
  }
  BurstLoggingMessage("Row interval: (%d->%d)\n", HIDWORD(v102), v102);
  BurstLoggingMessage("Column interval: (%d->%d)\n", HIDWORD(v101), v101);
  v70 = v102;
  v71 = HIDWORD(v102);
  if ((int)v102 - HIDWORD(v102) >= 64)
  {
    v72 = v101;
    v73 = HIDWORD(v101);
    if ((int)v101 - HIDWORD(v101) >= 64)
    {
      if (!self->doLimitedSharpnessAndBlur)
      {
        v74 = (int)(float)(*p_tx + (float)SHIDWORD(v101));
        v75 = (int)(float)(*p_tx + (float)(int)v101);
        if (*p_tx <= 0.0)
        {
          v74 = HIDWORD(v101);
          v75 = v101;
          v73 = (int)(float)((float)SHIDWORD(v101) - *p_tx);
          v72 = (int)(float)((float)(int)v101 - *p_tx);
        }
        v76 = (int)(float)(*p_ty + (float)SHIDWORD(v102));
        v77 = (int)(float)(*p_ty + (float)(int)v102);
        if (*p_ty <= 0.0)
        {
          v76 = HIDWORD(v102);
          v77 = v102;
          v71 = (int)(float)((float)SHIDWORD(v102) - *p_ty);
          v70 = (int)(float)((float)(int)v102 - *p_ty);
        }
        v78 = (v73 >> 5);
        v79 = v72 >> 5;
        v80 = self->gridWidth - 1;
        if (v79 < v80)
          v81 = (v79 + 1);
        else
          v81 = v80;
        v82 = (v71 >> 5);
        v83 = v70 >> 5;
        v84 = self->gridHeight - 1;
        if (v83 < v84)
          v85 = (v83 + 1);
        else
          v85 = v84;
        v86 = v81 | (v85 << 32);
        v87 = (v74 >> 5);
        if (v75 >> 5 < v80)
          v88 = ((v75 >> 5) + 1);
        else
          v88 = v80;
        v89 = (v76 >> 5);
        if (v77 >> 5 < v84)
          v90 = ((v77 >> 5) + 1);
        else
          v90 = v84;
        BurstLoggingMessage("sensedROI = (%d,%d)->(%d,%d)\n", v78, v82, v81, v85);
        -[CIBurstImageStat updateROI:](self, "updateROI:", v87 | (v89 << 32), v88 | (v90 << 32));
        BurstLoggingMessage("referenceROI = (%d,%d)->(%d,%d)\n", v87, v89, v88, v90);
        v91 = v78 | (v82 << 32);
        v92 = a3;
        v93 = v86;
LABEL_65:
        objc_msgSend(v92, "updateROI:", v91, v93);
        return;
      }
LABEL_61:
      BurstLoggingMessage("Registration in favor of face detection ROI.\n");
      return;
    }
  }
  if (self->doLimitedSharpnessAndBlur)
    goto LABEL_61;
  BurstLoggingMessage("Registration rejected due to ROI too large or too small.\n");
  -[CIBurstImageStat updateROI:](self, "updateROI:", 0, v22 | (v24 << 32));
  objc_msgSend(a3, "updateROI:", 0, v22 | (v24 << 32));
  LODWORD(v95) = 0;
  -[CIBurstImageStat setRegistrationErrorIntegral:](self, "setRegistrationErrorIntegral:", v95);
}

- (void)computeImageProjections:(id)a3
{
  char *SignatureBuffers;
  _QWORD v6[4];

  v6[2] = (int)(objc_msgSend(a3, "width") & 0xFFFFFFE0);
  v6[1] = (int)objc_msgSend(a3, "height");
  v6[3] = (int)objc_msgSend(a3, "bytesPerRow", objc_msgSend(a3, "Ybuffer"));
  SignatureBuffers = allocateSignatureBuffers((uint64_t)&self->projectionSignature, (uint64_t)v6, 0);
  self->projectionMemoryBlock = SignatureBuffers;
  if (SignatureBuffers)
    FastRegistration_computeSignatures((uint64_t)v6, 0, 0, (uint64_t)&self->projectionSignature);
}

- (int)canRegister
{
  return self->projectionSignature.piRow && self->projectionSignature.piCol != 0;
}

- (void)writeGridROI:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->gridROI.startX);
  objc_msgSend(a3, "setObject:forKey:", v5, kCIBurstImageProperty_ImageROIGridStartX);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->gridROI.startY);
  objc_msgSend(a3, "setObject:forKey:", v6, kCIBurstImageProperty_ImageROIGridStartY);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->gridROI.endX);
  objc_msgSend(a3, "setObject:forKey:", v7, kCIBurstImageProperty_ImageROIGridEndX);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->gridROI.endY);
  objc_msgSend(a3, "setObject:forKey:", v8, kCIBurstImageProperty_ImageROIGridEndY);
}

- (void)computeImageData:(id)a3 faceIDCounts:(id)a4
{
  int v6;
  int32x2_t v7;
  int endX;
  int gridWidth;
  int gridHeight;

  -[CIBurstImageStat computeImageColorHistogram:](self, "computeImageColorHistogram:", a3, a4);
  self->gridWidth = (int)objc_msgSend(a3, "width") >> 5;
  self->gridHeight = (int)objc_msgSend(a3, "height") >> 5;
  *(_QWORD *)&self->gridROI.startX = -1;
  *(_QWORD *)&self->gridROI.endX = -1;
  self->doLimitedSharpnessAndBlur = 0;
  BurstLoggingMessage("\t\t----------------------- facecore count = %d, numHWFaces = %d\n", -[NSMutableArray count](self->faceStatArray, "count"), self->numHWFaces);
  if (-[NSMutableArray count](self->faceStatArray, "count") || self->numHWFaces >= 1)
  {
    self->gridROI.startX = (int)self->facesRoiRect.origin.x >> 5;
    self->gridROI.startY = (int)((double)(int)objc_msgSend(a3, "height")
                               - self->facesRoiRect.origin.y
                               - (double)(int)self->facesRoiRect.size.height) >> 5;
    self->gridROI.endX = (((int)self->facesRoiRect.size.width + (int)self->facesRoiRect.origin.x) >> 5) + 1;
    v6 = ((int)((double)(int)objc_msgSend(a3, "height") - self->facesRoiRect.origin.y) >> 5) + 1;
    self->gridROI.endY = v6;
    v7 = vmax_s32(*(int32x2_t *)&self->gridROI.startX, 0);
    *(int32x2_t *)&self->gridROI.startX = v7;
    endX = self->gridROI.endX;
    gridWidth = self->gridWidth;
    if (endX >= gridWidth)
    {
      endX = gridWidth - 1;
      self->gridROI.endX = gridWidth - 1;
    }
    gridHeight = self->gridHeight;
    if (v6 >= gridHeight)
    {
      v6 = gridHeight - 1;
      self->gridROI.endY = gridHeight - 1;
    }
    self->doLimitedSharpnessAndBlur = 1;
    BurstLoggingMessage("Limited ROI = (%d,%d)->(%d,%d)\n", v7.i32[0], v7.i32[1], endX, v6);
  }
  self->sharpnessGrid = (SharpnessGridElement_t *)malloc_type_calloc(1uLL, 8 * self->gridHeight * self->gridWidth, 0x1000040CE7E837CuLL);
  -[CIBurstImageStat computeImageSharpnessOnGrid:](self, "computeImageSharpnessOnGrid:", a3);
  -[CIBurstImageStat computeBlurStatsOnGrid:](self, "computeBlurStatsOnGrid:", a3);
  -[CIBurstImageStat computeImageProjections:](self, "computeImageProjections:", a3);
}

- (void)collapseSharpnessGrid
{
  int32x2_t v3;
  float *v4;
  float *v5;
  int startY;
  int endY;
  int v8;
  int v9;
  int v10;
  SharpnessGridElement_t *sharpnessGrid;
  int startX;
  SharpnessGridElement_t *v13;
  char *v14;
  int v15;
  uint64_t v16;
  SharpnessGridElement_t *v18;
  uint64_t gridHeight;
  uint64_t v20;
  int gridWidth;
  unsigned __int8 *p_var1;
  uint64_t v23;
  unsigned __int8 *v24;
  int v25;
  int v26;
  float avgHorzDiffY;
  uint64_t v28;
  float *v29;
  float v30;
  float v31;
  float v32;
  int v33;

  self->gridROI = self->smoothedROI;
  if (-[NSMutableArray count](self->faceStatArray, "count") && !self->doLimitedSharpnessAndBlur)
  {
    *(_QWORD *)&self->avgHorzDiffY = 0x3F80000000000000;
  }
  else
  {
    self->avgHorzDiffY = 0.0;
    BurstLoggingMessage("Computing sharpness over grid points (%d,%d)->(%d,%d)\n", self->gridROI.startX, self->gridROI.startY, self->gridROI.endX, self->gridROI.endY);
    v3 = vadd_s32(vsub_s32(*(int32x2_t *)&self->gridROI.endX, *(int32x2_t *)&self->gridROI.startX), (int32x2_t)0x100000001);
    v33 = vmul_lane_s32(v3, v3, 1).u32[0];
    v4 = (float *)malloc_type_malloc(8 * v33, 0x1000040CE7E837CuLL);
    if (v4)
    {
      v5 = v4;
      startY = self->gridROI.startY;
      endY = self->gridROI.endY;
      if (startY <= endY)
      {
        v9 = 0;
        v10 = 0;
        v8 = 0;
        do
        {
          sharpnessGrid = self->sharpnessGrid;
          if (!sharpnessGrid)
            break;
          startX = self->gridROI.startX;
          if (startX <= self->gridROI.endX)
          {
            v13 = &sharpnessGrid[startX + self->gridWidth * startY];
            v14 = (char *)&v4[2 * v10];
            v15 = startX - 1;
            do
            {
              if (!self->doLimitedSharpnessAndBlur)
              {
                v9 += v13->var0;
                v8 += v13->var1;
              }
              v16 = (uint64_t)*v13++;
              *(_QWORD *)v14 = v16;
              v14 += 8;
              ++v10;
              ++v15;
            }
            while (v15 < self->gridROI.endX);
            endY = self->gridROI.endY;
          }
        }
        while (startY++ < endY);
      }
      else
      {
        v8 = 0;
        v9 = 0;
      }
      if (self->doLimitedSharpnessAndBlur)
      {
        v18 = self->sharpnessGrid;
        if (v18)
        {
          gridHeight = self->gridHeight;
          if ((int)gridHeight >= 1)
          {
            v20 = 0;
            gridWidth = self->gridWidth;
            p_var1 = &v18->var1;
            do
            {
              v23 = self->gridWidth;
              v24 = p_var1;
              if (gridWidth >= 1)
              {
                do
                {
                  v9 += *(v24 - 1);
                  v25 = *v24;
                  v24 += 8;
                  v8 += v25;
                  --v23;
                }
                while (v23);
              }
              ++v20;
              p_var1 += 8 * gridWidth;
            }
            while (v20 != gridHeight);
          }
        }
      }
      qsort(v4, v33, 8uLL, (int (__cdecl *)(const void *, const void *))compareGridElements);
      if (v33 >= 32)
        v26 = 32;
      else
        v26 = v33;
      avgHorzDiffY = self->avgHorzDiffY;
      if (v33 >= 1)
      {
        if (v26 <= 1)
          v28 = 1;
        else
          v28 = v26;
        v29 = v5 + 1;
        do
        {
          v30 = *v29;
          v29 += 2;
          avgHorzDiffY = v30 + avgHorzDiffY;
          self->avgHorzDiffY = avgHorzDiffY;
          --v28;
        }
        while (v28);
      }
      v31 = avgHorzDiffY / (float)((float)v26 * 1024.0);
      self->avgHorzDiffY = v31;
      v32 = (float)v8 / (float)v9;
      if (!v9)
        v32 = 1.0;
      self->blurExtent = v32;
      BurstLoggingMessage("After collapse avgHorzDiffY = %f, blurExtent = %f\n", v31, v32);
      free(v5);
    }
  }
}

- (float)computeFacialFocusScoreSum
{
  int numHWFaces;
  int v4;
  NSMutableArray *faceStatArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t i;
  void *v11;
  float v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  float v19;
  float v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  BurstLoggingMessage("Num HW faces = %d, facecore faces = %d\n", self->numHWFaces, -[NSMutableArray count](self->faceStatArray, "count"));
  numHWFaces = self->numHWFaces;
  if (numHWFaces <= (int)-[NSMutableArray count](self->faceStatArray, "count"))
    v4 = -[NSMutableArray count](self->faceStatArray, "count");
  else
    v4 = self->numHWFaces;
  if (-[CIBurstImageStat version](self, "version") >= 2)
  {
    v28 = 0uLL;
    v29 = 0uLL;
    v26 = 0uLL;
    v27 = 0uLL;
    faceStatArray = self->faceStatArray;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](faceStatArray, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      v9 = 1.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(faceStatArray);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v11, "normalizedFocusScore");
          v9 = v9 * v12;
          if (!objc_msgSend(v11, "leftEyeOpen") || (objc_msgSend(v11, "rightEyeOpen") & 1) == 0)
            v9 = v9 * 0.9;
          if ((objc_msgSend(v11, "leftEyeOpen") & 1) == 0 && !objc_msgSend(v11, "rightEyeOpen"))
            v9 = v9 * 0.7;
          if (!objc_msgSend(v11, "smiling"))
            v9 = v9 * 0.5;
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](faceStatArray, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
      goto LABEL_38;
    }
LABEL_37:
    v9 = 1.0;
    goto LABEL_38;
  }
  v24 = 0uLL;
  v25 = 0uLL;
  v22 = 0uLL;
  v23 = 0uLL;
  v13 = self->faceStatArray;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (!v14)
    goto LABEL_37;
  v15 = v14;
  v16 = *(_QWORD *)v23;
  v9 = 1.0;
  do
  {
    for (j = 0; j != v15; ++j)
    {
      if (*(_QWORD *)v23 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
      objc_msgSend(v18, "normalizedFocusScore");
      v9 = v9 * v19;
      if (!objc_msgSend(v18, "leftEyeOpen") || (objc_msgSend(v18, "rightEyeOpen") & 1) == 0)
        v9 = v9 * 0.9;
      if ((objc_msgSend(v18, "leftEyeOpen") & 1) == 0 && !objc_msgSend(v18, "rightEyeOpen"))
        v9 = v9 * 0.7;
      if (!objc_msgSend(v18, "smiling"))
        v9 = v9 * 0.5;
    }
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  }
  while (v15);
LABEL_38:
  if (-[NSMutableArray count](self->faceStatArray, "count"))
    v9 = v9 * 20.0;
  BurstLoggingMessage("combined normalized focus score for face core detections = %f\n", v9);
  if (self->doLimitedSharpnessAndBlur)
    v20 = self->avgHorzDiffY / (float)(self->blurExtent + 1.0);
  else
    v20 = 0.0;
  BurstLoggingMessage("Limited sharpness score = %f, with number of faces = %d\n", v20, self->numHWFaces);
  return (float)((float)((float)v4 * 2000.0) * v9) * (float)(v20 + 5.0);
}

- (float)computeRuleOfThreeDistance
{
  NSMutableArray *faceStatArray;
  float v4;
  unint64_t v5;
  float v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  float v16;
  float v17;
  float v18;

  faceStatArray = self->faceStatArray;
  v4 = 1.0;
  if (faceStatArray && -[NSMutableArray count](faceStatArray, "count"))
  {
    if (-[NSMutableArray count](self->faceStatArray, "count"))
    {
      v5 = 0;
      v6 = 0.0;
      do
      {
        v7 = (void *)-[NSMutableArray objectAtIndex:](self->faceStatArray, "objectAtIndex:", v5);
        objc_msgSend(v7, "normalizedFaceRect");
        v9 = v8;
        objc_msgSend(v7, "normalizedFaceRect");
        v11 = v9 + v10 * 0.5;
        objc_msgSend(v7, "normalizedFaceRect");
        v13 = v12;
        objc_msgSend(v7, "normalizedFaceRect");
        v14 = 0;
        v16 = v13 + v15 * 0.5;
        v17 = 100.0;
        do
        {
          v18 = v16 - *(float *)&ruleOfThirdsY[v14];
          if ((float)((float)((float)(v11 - *(float *)&ruleOfThirdsX[v14])
                             * (float)(v11 - *(float *)&ruleOfThirdsX[v14]))
                     + (float)(v18 * v18)) < v17)
            v17 = (float)((float)(v11 - *(float *)&ruleOfThirdsX[v14]) * (float)(v11 - *(float *)&ruleOfThirdsX[v14]))
                + (float)(v18 * v18);
          ++v14;
        }
        while (v14 != 9);
        v6 = v6 + sqrtf(v17);
        ++v5;
      }
      while (-[NSMutableArray count](self->faceStatArray, "count") > v5);
    }
    else
    {
      v6 = 0.0;
    }
    v4 = v6 / (float)(unint64_t)-[NSMutableArray count](self->faceStatArray, "count");
  }
  return 1.3333 - v4;
}

- (float)computeSmilePercentage
{
  NSMutableArray *faceStatArray;
  float v4;
  unint64_t v5;
  int v6;

  faceStatArray = self->faceStatArray;
  v4 = 0.0;
  if (faceStatArray && -[NSMutableArray count](faceStatArray, "count"))
  {
    if (-[NSMutableArray count](self->faceStatArray, "count"))
    {
      v5 = 0;
      v6 = 0;
      do
        v6 += objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->faceStatArray, "objectAtIndex:", v5++), "smiling");
      while (-[NSMutableArray count](self->faceStatArray, "count") > v5);
      v4 = (float)v6;
    }
    return v4 / (float)(unint64_t)-[NSMutableArray count](self->faceStatArray, "count");
  }
  return v4;
}

- (float)computeImageDistance:(id)a3
{
  uint64_t v3;
  double v4;
  float64x2_t v5;

  v3 = 0;
  v4 = 0.0;
  do
  {
    v5 = vsqrtq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->colorHistogram[v3]), vcvtq_f64_f32(*(float32x2_t *)((char *)a3 + v3 * 4 + 16))));
    v4 = v4 + v5.f64[0] + v5.f64[1];
    v3 += 2;
  }
  while (v3 != 1024);
  return sqrt(1.0 - v4);
}

- (float)computeAEMatrixDifference:(id)a3
{
  uint64_t v3;
  float result;
  uint16x8_t v5;
  int32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;

  v3 = 0;
  result = 0.0;
  do
  {
    v5 = vabdq_u16(*(uint16x8_t *)&self->aeMatrix[v3], *(uint16x8_t *)((char *)a3 + v3 * 2 + 4116));
    v6 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v5.i8);
    v7 = vcvtq_f32_s32((int32x4_t)vmovl_high_u16(v5));
    v8 = vcvtq_f32_s32(v6);
    result = (float)((float)((float)((float)((float)((float)((float)(result + v8.f32[0]) + v8.f32[1]) + v8.f32[2])
                                           + v8.f32[3])
                                   + v7.f32[0])
                           + v7.f32[1])
                   + v7.f32[2])
           + v7.f32[3];
    v3 += 8;
  }
  while (v3 != 256);
  return result;
}

- (int)setAEMatrix:(id)a3
{
  unsigned __int16 *aeMatrix;
  uint64_t v4;
  int32x4_t v5;
  int32x4_t v6;
  uint16x8_t v7;

  if (!a3)
    return 0;
  aeMatrix = self->aeMatrix;
  objc_msgSend(a3, "getBytes:length:", self->aeMatrix, 512);
  v4 = 0;
  v5 = 0uLL;
  v6 = 0uLL;
  do
  {
    v7 = *(uint16x8_t *)&aeMatrix[v4];
    v6 = (int32x4_t)vaddw_high_u16((uint32x4_t)v6, v7);
    v5 = (int32x4_t)vaddw_u16((uint32x4_t)v5, *(uint16x4_t *)v7.i8);
    v4 += 8;
  }
  while (v4 != 256);
  if (!vaddvq_s32(vaddq_s32(v5, v6)))
    return -1;
  else
    return 0;
}

- (void)computeAEMatrix:(id)a3
{
  uint64_t v4;
  int v5;
  int v6;
  unsigned int i;
  unsigned int j;
  unsigned int v9;
  uint64_t v10;
  int16x8_t *aeMatrix;
  float32x4_t v12;
  float v14[256];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "Ybuffer");
  v5 = objc_msgSend(a3, "height");
  v6 = objc_msgSend(a3, "width");
  bzero(v14, 0x400uLL);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      if (v6)
      {
        for (j = 0; j != v6; ++j)
        {
          LOBYTE(v9) = *(_BYTE *)(v4 + (int)(j + i * objc_msgSend(a3, "bytesPerRow")));
          v14[16 * (i / ((v5 + 15) >> 4)) + j / ((v6 + 15) >> 4)] = v14[16 * (i / ((v5 + 15) >> 4)) + j / ((v6 + 15) >> 4)]
                                                                                              + (float)v9;
        }
      }
    }
  }
  v10 = 0;
  aeMatrix = (int16x8_t *)self->aeMatrix;
  v12 = (float32x4_t)vdupq_n_s32(0x44960000u);
  do
  {
    *aeMatrix++ = vuzp1q_s16((int16x8_t)vcvtq_u32_f32(vdivq_f32(*(float32x4_t *)&v14[v10], v12)), (int16x8_t)vcvtq_u32_f32(vdivq_f32(*(float32x4_t *)&v14[v10 + 4], v12)));
    v10 += 8;
  }
  while (v10 != 256);
}

- (unsigned)aeMatrix
{
  return self->aeMatrix;
}

- (float)computeScore:(float)a3
{
  BOOL *p_emotionallyRejected;
  NSMutableArray *faceStatArray;
  float v7;
  float v8;
  float registrationErrorIntegral;
  float v10;

  p_emotionallyRejected = &self->emotionallyRejected;
  BurstLoggingMessage("Thumbnail selection score computation for %s\n", -[NSString UTF8String](self->imageId, "UTF8String"));
  faceStatArray = self->faceStatArray;
  if (faceStatArray && -[NSMutableArray count](faceStatArray, "count"))
  {
    v7 = 0.0;
    if (!*p_emotionallyRejected)
    {
      -[CIBurstImageStat computeFacialFocusScoreSum](self, "computeFacialFocusScoreSum");
      v7 = v8;
    }
    BurstLoggingMessage("\tAverage facial focus score = %f\n");
  }
  else
  {
    v7 = (float)(self->avgHorzDiffY + self->avgHorzDiffY) / (float)(self->blurExtent + 1.0);
    BurstLoggingMessage("\tInitial score (no faces) = %f (isGarbage = %d)\n");
  }
  self->actionScore = v7;
  registrationErrorIntegral = self->registrationErrorIntegral;
  if (registrationErrorIntegral > a3 && !p_emotionallyRejected[2])
  {
    v10 = (float)(registrationErrorIntegral / 100.0) + (float)(v7 * 4.0);
    self->actionScore = v10;
    BurstLoggingMessage("\tAction selection score = %f\n", v10);
  }
  self->imageScore = v7;
  return v7;
}

- (int64_t)compareImageStats:(id)a3
{
  return 0;
}

- (int64_t)compareImageOrder:(id)a3
{
  float v4;
  float v5;
  int64_t v6;

  v4 = (float)-[CIBurstImageStat temporalOrder](self, "temporalOrder");
  v5 = (float)(int)objc_msgSend(a3, "temporalOrder");
  if (v5 <= v4)
    v6 = 0;
  else
    v6 = -1;
  if (v4 > v5)
    return 1;
  else
    return v6;
}

- (float)colorHistogram
{
  return self->colorHistogram;
}

- (NSString)imageId
{
  return self->imageId;
}

- (void)setImageId:(id)a3
{
  self->imageId = (NSString *)a3;
}

- (int)orientation
{
  return self->orientation;
}

- (void)setOrientation:(int)a3
{
  self->orientation = a3;
}

- (NSMutableArray)faceStatArray
{
  return self->faceStatArray;
}

- (void)setFaceStatArray:(id)a3
{
  self->faceStatArray = (NSMutableArray *)a3;
}

- (BOOL)exclude
{
  return self->exclude;
}

- (void)setExclude:(BOOL)a3
{
  self->exclude = a3;
}

- (BOOL)AEStable
{
  return self->AEStable;
}

- (void)setAEStable:(BOOL)a3
{
  self->AEStable = a3;
}

- (int)AEAverage
{
  return self->AEAverage;
}

- (void)setAEAverage:(int)a3
{
  self->AEAverage = a3;
}

- (int)AETarget
{
  return self->AETarget;
}

- (void)setAETarget:(int)a3
{
  self->AETarget = a3;
}

- (BOOL)AFStable
{
  return self->AFStable;
}

- (void)setAFStable:(BOOL)a3
{
  self->AFStable = a3;
}

- (int)temporalOrder
{
  return self->temporalOrder;
}

- (void)setTemporalOrder:(int)a3
{
  self->temporalOrder = a3;
}

- (float)avgHorzDiffY
{
  return self->avgHorzDiffY;
}

- (void)setAvgHorzDiffY:(float)a3
{
  self->avgHorzDiffY = a3;
}

- (float)blurExtent
{
  return self->blurExtent;
}

- (void)setBlurExtent:(float)a3
{
  self->blurExtent = a3;
}

- (float)imageScore
{
  return self->imageScore;
}

- (void)setImageScore:(float)a3
{
  self->imageScore = a3;
}

- (float)actionScore
{
  return self->actionScore;
}

- (void)setActionScore:(float)a3
{
  self->actionScore = a3;
}

- (double)timeReceived
{
  return self->timeReceived;
}

- (void)setTimeReceived:(double)a3
{
  self->timeReceived = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (float)maxSkewness
{
  return self->maxSkewness;
}

- (void)setMaxSkewness:(float)a3
{
  self->maxSkewness = a3;
}

- (float)registrationErrorX
{
  return self->registrationErrorX;
}

- (void)setRegistrationErrorX:(float)a3
{
  self->registrationErrorX = a3;
}

- (float)registrationErrorY
{
  return self->registrationErrorY;
}

- (void)setRegistrationErrorY:(float)a3
{
  self->registrationErrorY = a3;
}

- (BOOL)hasRegistrationData
{
  return self->hasRegistrationData;
}

- (void)setHasRegistrationData:(BOOL)a3
{
  self->hasRegistrationData = a3;
}

- (float)registrationErrorIntegral
{
  return self->registrationErrorIntegral;
}

- (void)setRegistrationErrorIntegral:(float)a3
{
  self->registrationErrorIntegral = a3;
}

- (float)actionClusteringScore
{
  return self->actionClusteringScore;
}

- (void)setActionClusteringScore:(float)a3
{
  self->actionClusteringScore = a3;
}

- (CGRect)facesRoiRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->facesRoiRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFacesRoiRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->facesRoiRect, &v3, 32, 1, 0);
}

- (int)numHWFaces
{
  return self->numHWFaces;
}

- (void)setNumHWFaces:(int)a3
{
  self->numHWFaces = a3;
}

- (BOOL)emotionallyRejected
{
  return self->emotionallyRejected;
}

- (void)setEmotionallyRejected:(BOOL)a3
{
  self->emotionallyRejected = a3;
}

- (BOOL)doLimitedSharpnessAndBlur
{
  return self->doLimitedSharpnessAndBlur;
}

- (void)setDoLimitedSharpnessAndBlur:(BOOL)a3
{
  self->doLimitedSharpnessAndBlur = a3;
}

- (float)tx
{
  return self->tx;
}

- (void)setTx:(float)a3
{
  self->tx = a3;
}

- (float)ty
{
  return self->ty;
}

- (void)setTy:(float)a3
{
  self->ty = a3;
}

- (BOOL)isGarbage
{
  return self->isGarbage;
}

- (void)setIsGarbage:(BOOL)a3
{
  self->isGarbage = a3;
}

- (float)roiSize
{
  return self->roiSize;
}

- (void)setRoiSize:(float)a3
{
  self->roiSize = a3;
}

- (int)AEDelta
{
  return self->_AEDelta;
}

- (void)setAEDelta:(int)a3
{
  self->_AEDelta = a3;
}

- (__IOSurface)fullsizeJpegData
{
  return self->_fullsizeJpegData;
}

- (void)setFullsizeJpegData:(__IOSurface *)a3
{
  self->_fullsizeJpegData = a3;
}

- (int)fullsizeJpegSize
{
  return self->_fullsizeJpegSize;
}

- (void)setFullsizeJpegSize:(int)a3
{
  self->_fullsizeJpegSize = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

@end
