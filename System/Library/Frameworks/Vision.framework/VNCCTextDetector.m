@implementation VNCCTextDetector

- (VNCCTextDetector)initWithOptions:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  VNCCCharBoxContext *v11;
  void *v12;
  VNMetalInterface *v13;
  void *v14;
  char v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNCCTextDetector;
  v5 = -[VNCCTextDetector init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VNCCTextDetector_EnableDebug"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLValue"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VNCCTextDetector_DebugPathname"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        objc_msgSend(v5, "setDebugOut:", 1);
        objc_msgSend(v5, "setDebugFilename:", v7);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v16);
        if (v16)
          v10 = v9;
        else
          v10 = 0;
        if ((v10 & 1) == 0
          && (objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0) & 1) == 0)
        {
          objc_msgSend(v5, "setDebugOut:", 0);
          objc_msgSend(v5, "setDebugFilename:", 0);
        }

      }
    }
    v11 = objc_alloc_init(VNCCCharBoxContext);
    v12 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v11;

    *(_WORD *)(v5 + 25) = 257;
    *((_DWORD *)v5 + 2) = 0;
    v13 = objc_alloc_init(VNMetalInterface);
    v14 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v13;

  }
  return (VNCCTextDetector *)v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VNCCTextDetector;
  -[VNCCTextDetector dealloc](&v2, sel_dealloc);
}

- (void)initializeForImage:(vImage_Buffer *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;

  -[VNCCTextDetector setComputeZCVectorHighProbability:](self, "setComputeZCVectorHighProbability:", 1);
  if (a3->height == 480)
    v5 = 1;
  else
    v5 = 370;
  if (a3->height == 480)
    v6 = 57;
  else
    v6 = 45;
  if (a3->height == 480)
    v7 = 10;
  else
    v7 = 1;
  if (a3->height == 480)
    v8 = 600;
  else
    v8 = 480;
  if (a3->height == 480)
    v9 = 54.05;
  else
    v9 = 85.685;
  if (a3->height == 480)
    v10 = 85.685;
  else
    v10 = 54.05;
  if (a3->height == 480)
    v11 = 480;
  else
    v11 = 767;
  if (a3->height == 480)
    v12 = 767;
  else
    v12 = 480;
  if (a3->height == 480)
    v13 = 40;
  else
    v13 = 30;
  if (a3->height == 480)
    v14 = 767;
  else
    v14 = 479;
  if (a3->height == 480)
    v15 = 25;
  else
    v15 = 0;
  if (a3->height == 480)
    v16 = 499;
  else
    v16 = 329;
  -[VNCCTextDetector setMidRow:](self, "setMidRow:", v5);
  -[VNCCTextDetector setMinHeight:](self, "setMinHeight:", 11);
  -[VNCCTextDetector setMaxHeight:](self, "setMaxHeight:", v6);
  -[VNCCTextDetector setStartMaxFind:](self, "setStartMaxFind:", v7);
  -[VNCCTextDetector setStopMaxFind:](self, "setStopMaxFind:", v8);
  *(float *)&v17 = v9;
  -[VNCCTextDetector setMmHeightCard:](self, "setMmHeightCard:", v17);
  *(float *)&v18 = v10;
  -[VNCCTextDetector setMmWidthCard:](self, "setMmWidthCard:", v18);
  -[VNCCTextDetector setPixelHeightCard:](self, "setPixelHeightCard:", v11);
  -[VNCCTextDetector setPixelWidthCard:](self, "setPixelWidthCard:", v12);
  -[VNCCTextDetector setMinBoxWidth:](self, "setMinBoxWidth:", 7);
  -[VNCCTextDetector setMaxBoxWidth:](self, "setMaxBoxWidth:", v13);
  -[VNCCTextDetector setStartNormal:](self, "setStartNormal:", 0);
  -[VNCCTextDetector setStopNormal:](self, "setStopNormal:", v14);
  -[VNCCTextDetector setStartSensitized:](self, "setStartSensitized:", v15);
  -[VNCCTextDetector setStopSensitized:](self, "setStopSensitized:", v16);
}

- (int)_allocateVImageWithWidth:(unint64_t)a3 height:(unint64_t)a4 rowBytes:(unint64_t)a5 imageOut:(vImage_Buffer *)a6
{
  unint64_t v8;

  if (a6)
  {
    v8 = a5 * a4;
    if (a5 * a4)
    {
      v8 = (unint64_t)malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL);
      a6->data = (void *)v8;
      if (v8)
      {
        a6->height = a4;
        a6->width = a3;
        LODWORD(v8) = 1;
        a6->rowBytes = a5;
      }
      else
      {
        a6->height = 0;
        a6->width = 0;
        a6->rowBytes = 0;
      }
    }
  }
  else
  {
    LODWORD(v8) = 0;
  }
  return v8;
}

- (void)_freeVImage:(vImage_Buffer *)a3
{
  if (a3)
  {
    free(a3->data);
    *(_OWORD *)&a3->data = 0u;
    *(_OWORD *)&a3->width = 0u;
  }
}

- (int)_generateVotingImage:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 useLowLightEnhancement:(char *)a5
{
  vImagePixelCount v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  uint64_t v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  void *v18;
  int v19;
  size_t rowBytes;
  char *v21;
  uint64_t v22;
  _BYTE *v23;
  float v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  float v28;
  float v29;
  BOOL v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  const char *v35;
  int8x16_t v36;
  uint64_t v37;
  size_t v38;
  vImagePixelCount v39;
  char *data;
  size_t v41;
  vImagePixelCount v42;
  VNMetalInterface *VNMetalInterface;
  void *v44;
  void *v45;
  vImagePixelCount v46;
  size_t v47;
  void *v48;
  void *v49;
  id v50;
  const char *v51;
  void *v52;
  int8x16_t v53;
  size_t v54;
  id v55;
  const char *v56;
  void *v57;
  int8x16_t v58;
  size_t v59;
  int v61;
  vImagePixelCount height;
  vImagePixelCount v63;
  char *v64;
  vImagePixelCount width;
  size_t v66;
  char *v67;
  vImagePixelCount v68;
  char *v69;
  char v70;
  _QWORD v71[6];
  _QWORD v72[4];
  void *v73;
  int8x16_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v9 = (a3->height - 81) / 0x50;
  if ((unsigned __int16)v9 <= 0xAuLL)
    v10 = v9;
  else
    v10 = 10;
  if ((((a3->width - 81) / 0x50) & 0xFFF0) != 0)
    v11 = 15;
  else
    v11 = (a3->width - 81) / 0x50;
  v12 = v10;
  v13 = v11 * v10;
  v14 = malloc_type_calloc(v13, 4uLL, 0x100004052888210uLL);
  v18 = v14;
  if (v14)
  {
    if ((_DWORD)v12)
    {
      v19 = 0;
      rowBytes = a3->rowBytes;
      v21 = (char *)a3->data + 79 * rowBytes;
      v22 = 80 * rowBytes;
      LODWORD(v15) = 0;
      v23 = v14;
      LODWORD(v16) = 0;
      v24 = 0.0;
      do
      {
        if (v11)
        {
          v25 = 0;
          do
          {
            v23[2] = v21[v25 + 316];
            v23[1] = v21[v25 + 317];
            *v23 = v21[v25 + 318];
            v23[3] = v21[v25 + 319];
            LOBYTE(v17) = v21[v25 + 318];
            *(float *)&v26 = (float)LODWORD(v17);
            *(float *)&v15 = *(float *)&v15 + *(float *)&v26;
            LOBYTE(v26) = v21[v25 + 317];
            *(float *)&v27 = (float)v26;
            *(float *)&v16 = *(float *)&v16 + *(float *)&v27;
            LOBYTE(v27) = v21[v25 + 316];
            v17 = (float)v27;
            v24 = v24 + v17;
            v23 += 4;
            v25 += 320;
          }
          while (320 * v11 != (_DWORD)v25);
        }
        v21 += v22;
        ++v19;
      }
      while (v19 != (_DWORD)v12);
    }
    else
    {
      v13 = 0;
      v24 = 0.0;
      LODWORD(v16) = 0;
      LODWORD(v15) = 0;
    }
    v28 = (float)v13;
    v29 = v24 / (float)v13;
    if (v29 < 100.0
      && ((*(float *)&v16 = *(float *)&v16 / v28,
           v30 = (float)((float)(*(float *)&v15 / v28) * 3.0) < v29,
           LODWORD(v15) = 1117782016,
           v30)
        ? (v30 = *(float *)&v16 < 80.0)
        : (v30 = 0),
          v30))
    {
      v31 = 1;
      *a5 = 1;
      v61 = -[VNCCTextDetector midRow](self, "midRow", v15, v16);
      height = a3->height;
      if (height > v61)
      {
        v63 = v61;
        v64 = (char *)a4->data + a4->rowBytes * v61;
        width = a3->width;
        v66 = a3->rowBytes;
        v67 = (char *)a3->data + v66 * v61;
        do
        {
          if (width)
          {
            v68 = 0;
            v69 = v67 + 2;
            do
            {
              v70 = *v69;
              v69 += 4;
              v64[v68++] = v70;
              width = a3->width;
            }
            while (width > v68);
            v64 += v68;
            v66 = a3->rowBytes;
            height = a3->height;
          }
          v67 += v66;
          ++v63;
        }
        while (height > v63);
        v31 = 1;
      }
    }
    else
    {
      v31 = 0;
    }
    if (-[VNCCTextDetector debugOut](self, "debugOut", v15, v16))
    {
      -[VNCCTextDetector debugFilename](self, "debugFilename");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByAppendingPathComponent:", CFSTR("creditCardSubsampleImage.png"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = objc_retainAutorelease(v33);
      v35 = (const char *)objc_msgSend(v34, "UTF8String");
      v36.i64[0] = v11;
      v36.i64[1] = v12;
      v77 = 0;
      v76 = 2;
      v74 = v36;
      v73 = v18;
      v75 = 4 * v11;
      saveImage(v35, (uint64_t)&v73);

    }
    if ((v31 & 1) == 0)
    {
      v37 = -[VNCCTextDetector midRow](self, "midRow");
      v39 = a3->width;
      v38 = a3->rowBytes;
      data = (char *)a4->data;
      v41 = a4->rowBytes;
      v42 = a3->height - v37;
      VNMetalInterface = self->_VNMetalInterface;
      v72[0] = (char *)a3->data + v38 * v37;
      v72[1] = v42;
      v72[2] = v39;
      v72[3] = v38;
      -[VNMetalInterface textureWithPixelData:format:](VNMetalInterface, "textureWithPixelData:format:", v72, 73);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNMetalInterface textureWithWidth:height:format:usage:](self->_VNMetalInterface, "textureWithWidth:height:format:usage:", a4->width, a4->height - v37, 13, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNMetalInterface performVotingImage:outputTex:subBuffer:](self->_VNMetalInterface, "performVotingImage:outputTex:subBuffer:", v44, v45, v18);
      memset(v71, 0, 24);
      v46 = a4->height - v37;
      v47 = a4->rowBytes;
      v71[3] = a4->width;
      v71[4] = v46;
      v71[5] = 1;
      objc_msgSend(v45, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", &data[v41 * v37], v47, v71, 0);
      if (-[VNCCTextDetector debugOut](self, "debugOut"))
      {
        -[VNCCTextDetector debugFilename](self, "debugFilename");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringByAppendingPathComponent:", CFSTR("inverseVotingImage.png"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = objc_retainAutorelease(v49);
        v51 = (const char *)objc_msgSend(v50, "UTF8String");
        v52 = a4->data;
        v53 = *(int8x16_t *)&a4->height;
        v54 = a4->rowBytes;
        v77 = 0;
        v76 = 1;
        v74 = vextq_s8(v53, v53, 8uLL);
        v73 = v52;
        v75 = v54;
        saveY(v51, (uint64_t)&v73);

      }
    }
    if (-[VNCCTextDetector debugOut](self, "debugOut"))
    {
      objc_msgSend(CFSTR("/var/mobile/Media/DCIM/ccOutDebug/"), "stringByAppendingPathComponent:", CFSTR("inverseVotingImage.png"));
      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v56 = (const char *)objc_msgSend(v55, "UTF8String");
      v57 = a4->data;
      v58 = *(int8x16_t *)&a4->height;
      v59 = a4->rowBytes;
      v77 = 0;
      v76 = 1;
      v74 = vextq_s8(v58, v58, 8uLL);
      v73 = v57;
      v75 = v59;
      saveY(v56, (uint64_t)&v73);

    }
  }
  free(v18);
  return v18 != 0;
}

- (void)examinePulseWindow:(unsigned __int16)a3 prodBoostNormalized:(float *)a4 pwContext:(__CCPulseWindowContext *)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 thresholdSet:(ThresholdSet_t)a8
{
  double v8;
  double v9;
  float v10;
  int v11;
  int v12;
  float v13;
  unint64_t v14;
  float *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  BOOL v19;
  BOOL v20;
  int v21;
  float v22;
  float *v23;
  uint64_t v24;
  float v25;
  int v26;
  float *v27;
  float v28;
  float v29;
  __CCRange *var0;
  unsigned int var1;

  v8 = dbl_1A15FB720[!a5->var4];
  v9 = (double)a5->var3 / 100.0;
  v10 = v9 - v8;
  if (v10 < 0.0)
    v10 = 0.0;
  if (a3 >= 3u)
  {
    v11 = 0;
    v12 = 0;
    v13 = v8 + v9;
    v14 = (a3 - 1);
    v15 = &a4[a6 + 1];
    v16 = 1;
    v17 = a6;
    do
    {
      v18 = a4[v16];
      if (v18 >= v10)
      {
        v20 = v18 == v13;
        v19 = v18 >= v13;
      }
      else
      {
        v19 = 1;
        v20 = 0;
      }
      if (!v20 && v19)
      {
        if (v11 >= 1)
        {
          v21 = (_DWORD)v16 + a7;
          if (v16 + (unint64_t)a7 >= v14)
            v21 = a3 - 2;
          if (v16 + a6 > v21)
            goto LABEL_24;
          v22 = 0.0;
          v23 = v15;
          v24 = v17;
          do
          {
            if ((float)(v23[1] - *(v23 - 1)) < -0.001)
            {
              v22 = (float)(v24 + 1);
              if (*v23 <= a4[v11])
                break;
            }
            ++v24;
            ++v23;
          }
          while (v24 < v21);
          if (v22 == 0.0)
          {
LABEL_24:
            v12 = 0;
            v11 = 0;
          }
          else
          {
            v12 = (int)v22;
          }
        }
      }
      else if ((float)(a4[v16 + 1] - a4[v16 - 1]) <= 0.0)
      {
        if (v11)
          v12 = v16;
      }
      else
      {
        v11 = v16;
      }
      if (v12 - v11 >= a6 && v12 - v11 <= a7)
      {
        v25 = 0.0;
        if (v12 >= v11)
        {
          v26 = v12 - v11 + 1;
          v27 = &a4[v11];
          do
          {
            v28 = *v27++;
            v29 = v28;
            if (v28 > v25)
              v25 = v29;
            --v26;
          }
          while (v26);
        }
        if ((float)(v25 - a4[v11]) <= a8.var0
          || (float)(v25 - a4[v12]) <= a8.var0
          || (var0 = a5->var0, var0->var0 = v11, var0->var1 = v12, var1 = a5->var1, var1 >= a5->var2))
        {
          v12 = 0;
          v11 = 0;
        }
        else
        {
          v12 = 0;
          v11 = 0;
          a5->var1 = var1 + 1;
          a5->var0 = var0 + 1;
        }
      }
      ++v17;
      ++v16;
      ++v15;
    }
    while (v16 != v14);
  }
}

- (int)generatePulses:(unsigned __int16)a3 minHeight:(unsigned __int8)a4 maxHeight:(unsigned __int8)a5 thresholdSet:(ThresholdSet_t)a6 prodBoostNormalized:(float *)a7 pulseVectorFlag:(unint64_t)a8
{
  char *v8;
  int v9;
  float var2;
  float var1;
  float var0;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  unint64_t v24;
  int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  float v30;
  float v31;
  float *v32;
  float v33;
  float *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  uint64_t v39;
  float v40;
  float v41;
  unsigned int v42;
  float v43;
  uint64_t v44;
  float *v45;
  float v46;
  float v47;
  uint64_t v48;
  char *v51;
  uint64_t v52;

  v8 = 0;
  v9 = 0;
  v52 = 0x5C00000000;
  if (a3 && a7)
  {
    var2 = a6.var2;
    var1 = a6.var1;
    var0 = a6.var0;
    v15 = a5;
    v16 = a4;
    v17 = a3;
    v19 = (char *)malloc_type_calloc((11 * a3), 4uLL, 0x100004052888210uLL);
    v8 = v19;
    if (v19)
    {
      v51 = v19;
      WORD1(v52) = 11 * v17 - 1;
      do
      {
        *(float *)&v20 = var0;
        *(float *)&v21 = var1;
        *(float *)&v22 = var2;
        -[VNCCTextDetector examinePulseWindow:prodBoostNormalized:pwContext:minHeight:maxHeight:thresholdSet:](self, "examinePulseWindow:prodBoostNormalized:pwContext:minHeight:maxHeight:thresholdSet:", v17, a7, &v51, v16, v15, v20, v21, v22);
        WORD2(v52) -= 10;
      }
      while (SWORD2(v52) > 1);
      BYTE6(v52) = 1;
      WORD1(v52) = v17;
      WORD2(v52) = 2;
      do
      {
        *(float *)&v20 = var0;
        *(float *)&v21 = var1;
        *(float *)&v22 = var2;
        -[VNCCTextDetector examinePulseWindow:prodBoostNormalized:pwContext:minHeight:maxHeight:thresholdSet:](self, "examinePulseWindow:prodBoostNormalized:pwContext:minHeight:maxHeight:thresholdSet:", v17, a7, &v51, v16, v15, v20, v21, v22);
        --WORD2(v52);
      }
      while (SWORD2(v52) > 0);
      v23 = (unsigned __int16)v52;
      if ((_WORD)v52)
      {
        v24 = 0;
        v25 = v17 - 3;
        do
        {
          v26 = &v8[4 * v24];
          v27 = *(unsigned __int16 *)v26;
          v28 = *((unsigned __int16 *)v26 + 1);
          if (v27 >= 4 && v25 > (int)v28)
          {
            v30 = a7[*(unsigned __int16 *)v26];
            v31 = a7[(v27 - 1)];
            if ((float)(v30 - v31) > var2
              || (v32 = &a7[v27], v33 = v32[1], (float)(v33 - v30) > var2)
              || (float)(v32[2] - v33) > var2)
            {
              v34 = &a7[v28];
              v35 = *(v34 - 1);
              if ((float)(*(v34 - 2) - v35) > var2
                || (v36 = a7[v28], (float)(v35 - v36) > var2)
                || (float)(v36 - a7[v28 + 1]) > var2)
              {
                v37 = fmaxf(a7[(v27 - 2)], 0.0);
                if (v31 <= v37)
                  v31 = v37;
                v38 = v34[2];
                if (v34[1] > v31)
                  v31 = v34[1];
                v39 = (v28 - v27);
                if (v38 > v31)
                  v31 = v38;
                v40 = (double)v39 * 0.6;
                v41 = roundf((float)((float)v39 - roundf(v40)) * 0.5);
                if (v41 < 3.0)
                  v41 = 3.0;
                v42 = vcvtms_s32_f32(v41 + (float)v27);
                LODWORD(v39) = vcvtps_s32_f32((float)v28 - v41);
                v43 = 1.0;
                if (v42 <= v39)
                {
                  v44 = v39 - v42 + 1;
                  v45 = &a7[v42];
                  do
                  {
                    v46 = *v45++;
                    v47 = v46;
                    if (v46 < v43)
                      v43 = v47;
                    --v44;
                  }
                  while (v44);
                }
                v48 = (v27 + 1);
                if ((float)(v43 - v31) > var1 && v48 < v28)
                {
                  do
                  {
                    -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", a8, v48, v51);
                    v48 = (v48 + 1);
                  }
                  while ((_DWORD)v28 != (_DWORD)v48);
                  v23 = (unsigned __int16)v52;
                }
              }
            }
          }
          ++v24;
        }
        while (v24 < v23);
      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  free(v8);
  return v9;
}

- (void)_computeColumnSumsOverRange:(__CCRange *)a3 sampleImageAddress:(char *)a4 rowSumOut:(int *)a5 rowDerivOut:(int *)a6
{
  uint64_t var0;
  char *v7;
  int var1;
  int v9;
  int v10;
  int v11;
  int v12;
  char v13;
  int v14;
  int v15;
  int v16;
  int16x8_t v17;
  int8x16_t *v18;
  int8x16_t v19;
  int v20;
  uint64_t v21;
  int16x8_t v22;
  int8x16_t v23;
  int8x16_t v24;
  uint8x16_t v25;
  uint8x16_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;

  var0 = a3->var0;
  v7 = &a4[var0];
  var1 = a3->var1;
  if (((unint64_t)&a4[var0] & 0xF) != 0)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      if ((int)var0 > var1 - 2)
        break;
      v11 = a4[var0];
      v9 += v11;
      v12 = a4[var0 + 2] - v11;
      if (v12 < 0)
        v12 = v11 - a4[var0 + 2];
      v10 += v12;
      v13 = (_BYTE)a4 + 1 + var0++;
    }
    while ((v13 & 0xF) != 0);
    v7 = &a4[var0];
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v14 = var1 - var0;
  if (var1 - (int)var0 >= 4127)
    __assert_rtn("-[VNCCTextDetector _computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:]", "VNCCTextDetector.mm", 1202, "numNeonIter < 128");
  v15 = (v14 + 1) >> 5;
  v16 = v15 - 1;
  v17 = 0uLL;
  if (v14 < 63)
  {
    v22 = 0uLL;
  }
  else
  {
    v18 = (int8x16_t *)(v7 + 32);
    v19 = *(int8x16_t *)v7;
    if (v16 <= 1)
      v20 = 1;
    else
      v20 = v15 - 1;
    v21 = 32 * (v20 - 1) + 32;
    v22 = 0uLL;
    do
    {
      v23 = v18[-1];
      v24 = *v18;
      v22 = (int16x8_t)vaddw_u8(vaddw_high_u8((uint16x8_t)vaddq_s16((int16x8_t)vaddw_high_u8(vmovl_u8(*(uint8x8_t *)v19.i8), (uint8x16_t)v19), v22), (uint8x16_t)v23), *(uint8x8_t *)v23.i8);
      v25 = (uint8x16_t)vextq_s8(v19, v23, 2uLL);
      v26 = (uint8x16_t)vextq_s8(v23, *v18, 2uLL);
      v17 = (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_u8(vabal_u8((uint16x8_t)v17, *(uint8x8_t *)v25.i8, *(uint8x8_t *)v19.i8), *(uint8x8_t *)v26.i8, *(uint8x8_t *)v23.i8), v25, (uint8x16_t)v19), v26, (uint8x16_t)v23);
      v18 += 2;
      v19 = v24;
      --v20;
    }
    while (v20);
    v7 += v21;
  }
  v27 = v9 + (unsigned __int16)vaddvq_s16(v22);
  v28 = v10 + (unsigned __int16)vaddvq_s16(v17);
  if (v15 != 1)
  {
    v10 = v28;
    v9 = v27;
  }
  v29 = var0 + 32 * v16;
  if (v29 <= var1 - 2)
  {
    v30 = var0 + 32 * v15 - 33;
    do
    {
      v31 = *v7;
      v9 += v31;
      v32 = v7[2] - v31;
      if (v32 < 0)
        v32 = -v32;
      v10 += v32;
      ++v7;
      ++v30;
    }
    while (v30 < var1 - 2);
    v29 = var1 - 1;
  }
  else if (v29 > var1)
  {
    goto LABEL_30;
  }
  v33 = var1 - v29 + 1;
  do
  {
    v34 = *v7++;
    v9 += v34;
    --v33;
  }
  while (v33);
LABEL_30:
  *a5 = v9;
  *a6 = v10;
}

- (int)_allocateSumDerivVectors:(__CCSumDerivVectors *)a3 size:(int)a4
{
  float *v6;
  float *v7;
  float *v8;
  float *v9;

  if (a3)
  {
    v6 = (float *)malloc_type_calloc(5 * a4, 4uLL, 0x100004052888210uLL);
    a3->var0 = v6;
    if (v6)
    {
      v7 = &v6[a4];
      v8 = &v7[a4];
      a3->var1 = v7;
      a3->var2 = v8;
      v9 = &v8[a4];
      a3->var3 = v9;
      a3->var4 = &v9[a4];
      *(_QWORD *)&a3->var5 = 0;
      *(_QWORD *)&a3->var7 = 0;
      LODWORD(v6) = 1;
    }
  }
  else
  {
    LODWORD(v6) = 0;
  }
  return (int)v6;
}

- (void)_freeSumDerivVectors:(__CCSumDerivVectors *)a3
{
  if (a3)
  {
    free(a3->var0);
    a3->var0 = 0;
  }
}

- (void)_computeProdBoostNormalizedResult:(__CCSumDerivVectors *)a3 size:(int)a4 binOverride:(unsigned __int8)a5
{
  int v8;
  float *var4;
  uint64_t v10;
  float v11;
  double v12;
  uint64_t v13;
  float v14;
  int8x16_t v20;
  int8x16_t v21;

  if (a5)
    memcpy(a3->var4, a3->var2, 4 * a4);
  else
    vDSP_vmul(a3->var2, 1, a3->var3, 1, a3->var4, 1, a4);
  if (a4 == 480)
  {
    v8 = -[VNCCTextDetector midRow](self, "midRow");
    if (v8 >= 460)
    {
      var4 = a3->var4;
      v12 = 0.0;
    }
    else
    {
      var4 = a3->var4;
      v10 = v8 + 10;
      v11 = 0.0;
      do
      {
        if (var4[v10] > v11)
          v11 = var4[v10];
        ++v10;
      }
      while ((_DWORD)v10 != 470);
      v12 = v11;
    }
    v13 = 0;
    v14 = 0.9 / v12;
    if (v14 < 1.0)
      v14 = 1.0;
    __asm { FMOV            V1.4S, #1.0 }
    do
    {
      v20 = *(int8x16_t *)&var4[v13];
      v21 = (int8x16_t)vmulq_n_f32((float32x4_t)v20, v14);
      *(float32x4_t *)&var4[v13] = vaddq_f32((float32x4_t)v21, (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(_Q1, (float32x4_t)v21), v21, v20));
      v13 += 4;
    }
    while (v13 != 480);
  }
}

- (int)_getFilterResultOutBothSumDeriv:(unsigned __int8)a3 floatVectorResult:(float *)a4 bufferHeight:(unsigned __int16)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 config:(__CCFilterSumDerivConfig *)a8 bytesPerRow:(unsigned __int16)a9 thresholdSet:(ThresholdSet_t)a10 sampleImageAddressRef:(char *)a11
{
  float var0;
  int v14;
  char *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  float var2;
  float var1;
  unsigned int v22;
  _BOOL4 var3;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  const float *v33;
  float v34;
  float v35;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  float *v43;
  double v44;
  double v45;
  double v46;
  float *v47;
  unint64_t v48;
  uint64_t v49;
  float *v50;
  float *v51;
  uint64_t v52;
  float *v53;
  float v54;
  double v55;
  double v56;
  double v57;
  unint64_t v58;
  float *v59;
  float *v60;
  uint64_t v61;
  float *v62;
  float v63;
  float *__dst;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  int v69;
  uint64_t __B;
  float *v71[2];
  float *v72[2];
  __int128 v73;
  uint64_t v74;
  float *__A[2];
  float *__C[2];
  __int128 v77;
  _QWORD v78[2];

  var0 = a10.var0;
  v14 = 0;
  v78[0] = 0;
  *(_OWORD *)__C = 0u;
  v77 = 0u;
  *(_OWORD *)__A = 0u;
  v74 = 0;
  *(_OWORD *)v72 = 0u;
  v73 = 0u;
  *(_OWORD *)v71 = 0u;
  if (!a5)
    goto LABEL_64;
  if (!a8)
    goto LABEL_64;
  v15 = a11;
  if (!a11)
    goto LABEL_64;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  var2 = a10.var2;
  var1 = a10.var1;
  v22 = a3;
  v14 = -[VNCCTextDetector _allocateSumDerivVectors:size:](self, "_allocateSumDerivVectors:size:", __A, a5);
  if (v14 != 1)
    goto LABEL_64;
  var3 = a8->var3;
  if (a8->var3)
  {
    v14 = -[VNCCTextDetector _allocateSumDerivVectors:size:](self, "_allocateSumDerivVectors:size:", v71, v18);
    if (v14 != 1)
      goto LABEL_64;
    __dst = a4;
    v66 = v22;
    v67 = v17;
    v68 = v16;
    var3 = a8->var3;
  }
  else
  {
    __dst = a4;
    v66 = v22;
    v67 = v17;
    v68 = v16;
  }
  v24 = 0;
  if (v18 <= 1)
    v25 = 1;
  else
    v25 = v18;
  do
  {
    v78[0] = 0;
    if (!var3)
    {
      -[VNCCTextDetector _computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:](self, "_computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:", a8, v15, v78, (char *)v78 + 4);
      v30 = v78[0];
      goto LABEL_30;
    }
    __B = 0;
    v74 = 0;
    v69 = 0;
    if (!(_DWORD)v24)
    {
      v31 = a8->var1.var1;
      v27 = a8->var1.var0 + 250;
      v32 = a8->var0.var1 - 1;
      if (v27 >= v32)
        LOWORD(v27) = a8->var0.var1 - 1;
      a8->var1.var0 = v27;
      v29 = v31 + 250;
      if (v29 >= v32)
        LOWORD(v29) = v32;
      goto LABEL_24;
    }
    if ((_DWORD)v24 == 196)
    {
      v26 = a8->var1.var1;
      v27 = a8->var1.var0 - 250;
      v28 = a8->var0.var0;
      if (v27 <= v28)
        LOWORD(v27) = a8->var0.var0;
      a8->var1.var0 = v27;
      v29 = v26 - 250;
      if (v29 <= v28)
        LOWORD(v29) = v28;
LABEL_24:
      a8->var1.var1 = v29;
      goto LABEL_26;
    }
    LOWORD(v27) = a8->var1.var0;
LABEL_26:
    if ((_WORD)v27 && a8->var0.var0 != (unsigned __int16)v27)
    {
      WORD2(__B) = a8->var0.var0;
      HIWORD(__B) = v27 - 1;
      -[VNCCTextDetector _computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:](self, "_computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:", (char *)&__B + 4, v15, &__B, &v69);
      LODWORD(v78[0]) += __B;
      HIDWORD(v78[0]) += v69;
    }
    -[VNCCTextDetector _computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:](self, "_computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:", &a8->var1, v15, &__B, &v69, __dst);
    LODWORD(v78[0]) += __B;
    HIDWORD(v78[0]) += v69;
    LODWORD(v74) = v74 + __B;
    HIDWORD(v74) += v69;
    WORD2(__B) = a8->var1.var1 + 1;
    HIWORD(__B) = a8->var0.var1;
    -[VNCCTextDetector _computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:](self, "_computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:", (char *)&__B + 4, v15, &__B, &v69);
    v30 = LODWORD(v78[0]) + __B;
    LODWORD(v78[0]) += __B;
    HIDWORD(v78[0]) += v69;
LABEL_30:
    v33 = __A[0];
    __A[0][v24] = (float)v30;
    if (*((float *)&v77 + 2) < (float)v30)
      *((float *)&v77 + 2) = (float)v30;
    v34 = (float)SHIDWORD(v78[0]);
    __A[1][v24] = (float)SHIDWORD(v78[0]);
    if (*((float *)&v77 + 3) < v34)
      *((float *)&v77 + 3) = v34;
    var3 = a8->var3;
    if (a8->var3)
    {
      v35 = (float)(int)v74;
      v71[0][v24] = (float)(int)v74;
      if (*((float *)&v73 + 2) < v35)
        *((float *)&v73 + 2) = v35;
      v36 = (float)SHIDWORD(v74);
      v71[1][v24] = (float)SHIDWORD(v74);
      if (*((float *)&v73 + 3) < v36)
        *((float *)&v73 + 3) = v36;
    }
    v15 += a9;
    ++v24;
  }
  while (v25 != v24);
  *((float *)&__B + 1) = 1.0 / *((float *)&v77 + 2);
  vDSP_vsmul(v33, 1, (const float *)&__B + 1, __C[0], 1, v18);
  *(float *)&__B = 1.0 / *((float *)&v77 + 3);
  vDSP_vsmul(__A[1], 1, (const float *)&__B, __C[1], 1, v18);
  if (__dst)
    memcpy(__dst, __C[0], 4 * v18);
  if (a8->var3)
  {
    *((float *)&__B + 1) = 1.0 / *((float *)&v77 + 2);
    vDSP_vsmul(v71[0], 1, (const float *)&__B + 1, v72[0], 1, v18);
    *(float *)&__B = 1.0 / *((float *)&v77 + 3);
    vDSP_vsmul(v71[1], 1, (const float *)&__B, v72[1], 1, v18);
  }
  -[VNCCTextDetector _computeProdBoostNormalizedResult:size:binOverride:](self, "_computeProdBoostNormalizedResult:size:binOverride:", __A, v18, v66, __dst);
  if (a8->var3)
    -[VNCCTextDetector _computeProdBoostNormalizedResult:size:binOverride:](self, "_computeProdBoostNormalizedResult:size:binOverride:", v71, v18, v66);
  *(float *)&v37 = var0;
  *(float *)&v38 = var1;
  *(float *)&v39 = var2;
  v14 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](self, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v18, v67, v68, (_QWORD)v77, a8->var4, v37, v38, v39);
  if (v14 == 1)
  {
    if (!a8->var3
      || (*(float *)&v40 = var0,
          *(float *)&v41 = var1,
          *(float *)&v42 = var2,
          v14 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](self, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v18, v67, v68, (_QWORD)v73, a8->var5, v40, v41, v42), v14 == 1))
    {
      if (a8->var2)
      {
        v43 = (float *)malloc_type_calloc(v18, 4uLL, 0x100004052888210uLL);
        v47 = v43;
        if (v43)
        {
          v48 = 4 * a8->var4;
          v49 = (v18 - 3);
          if (v18 >= 7)
          {
            v50 = v43 + 3;
            v51 = (float *)(v77 + 12);
            v52 = v49 - 3;
            v53 = (float *)(v77 + 12);
            do
            {
              v54 = v53[1];
              ++v53;
              *v50++ = (float)((float)((float)((float)(*(v51 - 2) + *(v51 - 1)) + *v51) + v54) + v51[2]) / 5.0;
              v51 = v53;
              --v52;
            }
            while (v52);
          }
          *(float *)&v44 = var0;
          *(float *)&v45 = var1;
          *(float *)&v46 = var2;
          v14 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](self, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v18, v67, v68, v43, v48, v44, v45, v46);
          if (v14 == 1)
          {
            if (a8->var3)
            {
              v58 = 4 * a8->var5;
              if (v18 >= 7)
              {
                v59 = v47 + 3;
                v60 = (float *)(v73 + 12);
                v61 = v49 - 3;
                v62 = (float *)(v73 + 12);
                do
                {
                  v63 = v62[1];
                  ++v62;
                  *v59++ = (float)((float)((float)((float)(*(v60 - 2) + *(v60 - 1)) + *v60) + v63) + v60[2]) / 5.0;
                  v60 = v62;
                  --v61;
                }
                while (v61);
              }
              *(float *)&v55 = var0;
              *(float *)&v56 = var1;
              *(float *)&v57 = var2;
              v14 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](self, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v18, v67, v68, v47, v58, v55, v56, v57);
            }
            else
            {
              v14 = 1;
            }
          }
        }
        else
        {
          v14 = 0;
        }
        free(v47);
      }
      else
      {
        v14 = 1;
      }
    }
  }
LABEL_64:
  -[VNCCTextDetector _freeSumDerivVectors:](self, "_freeSumDerivVectors:", __A, a4);
  if (a8->var3)
    -[VNCCTextDetector _freeSumDerivVectors:](self, "_freeSumDerivVectors:", v71);
  return v14;
}

- (int)_getFilterResultOut:(float *)a3 defaultRows:(unsigned __int16)a4 bufferHeight:(unsigned __int16)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 startRange:(unsigned __int16)a8 stopRange:(unsigned __int16)a9 startMaxFind:(unsigned int)a10 stopMaxFind:(unsigned int)a11 bytesPerRow:(unsigned __int16)a12 thresholdSet:(ThresholdSet_t)a13 sampleImageAddressRef:(char *)a14 sampleImageFloatAddressRef:(float *)a15 pulseVectorFlag:(unint64_t)a16
{
  float *v16;
  BOOL v17;
  float var2;
  float var1;
  float var0;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  const float *v28;
  unsigned int v29;
  vDSP_Length v30;
  const float *v31;
  unint64_t v32;
  vDSP_Length v33;
  float v34;
  float *v37;
  int v38;
  double v39;
  double v40;
  double v41;
  float *v42;
  float *v43;
  float v44;
  float v45;
  float v46;
  float v47;
  unsigned int v48;
  float *v49;
  vDSP_Length v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  BOOL v56;
  BOOL v57;
  _BOOL4 v58;
  _BOOL4 v59;
  BOOL v60;
  _BOOL4 v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  unsigned int v70;
  float *v71;
  vDSP_Length v72;
  float v73;
  float v77;
  BOOL v78;
  BOOL v79;
  float v80;
  float *v81;
  float v82;
  uint64_t __n;
  float *v85;
  float *__dst;
  VNCCTextDetector *v87;
  uint64_t v88;
  unsigned int v89;
  float v90;
  float __B;
  float __C[3];

  v16 = a15;
  if (a14)
    v17 = a15 == 0;
  else
    v17 = 1;
  if (v17)
    goto LABEL_18;
  var2 = a13.var2;
  var1 = a13.var1;
  var0 = a13.var0;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v28 = (const float *)malloc_type_calloc(3 * a5, 4uLL, 0x100004052888210uLL);
  if (!v28)
  {
LABEL_18:
    v37 = 0;
    v38 = 0;
  }
  else
  {
    v29 = a10;
    v30 = v24;
    __dst = (float *)&v28[v24 + v24];
    v89 = v23;
    v87 = self;
    v88 = v24;
    v85 = (float *)&v28[v24];
    if ((_DWORD)v24)
    {
      v31 = v28;
      v32 = 0;
      v33 = a9 - (unint64_t)v21;
      v34 = 0.0;
      do
      {
        __C[0] = 0.0;
        vDSP_sve(v16, 1, __C, v33);
        v31[v32] = __C[0];
        if (__C[0] > v34 && v32 >= a10 - 1 && v32 <= a11 - 1)
          v34 = __C[0];
        ++v32;
        v16 += a12;
      }
      while (v30 != v32);
    }
    else
    {
      v34 = 0.0;
      v31 = v28;
    }
    __B = 1.0 / v34;
    vDSP_vsmul(v31, 1, &__B, v85, 1, v30);
    __n = 4 * v30;
    memcpy(__dst, v85, 4 * v30);
    v42 = v85;
    v37 = (float *)v31;
    if ((_DWORD)v88 == v25)
    {
      v40 = 0.0;
      if (a10 < a11)
      {
        v43 = (float *)&v31[(int)a10 + (unint64_t)__n / 4];
        v44 = 0.0;
        do
        {
          v45 = *v43++;
          v46 = v45;
          if (v45 > v44)
            v44 = v46;
          ++v29;
        }
        while (v29 < a11);
        v40 = v44;
      }
      if ((_DWORD)v88)
      {
        v47 = 0.0;
        v48 = -501;
        v49 = v85;
        v50 = v30;
        v51 = 0.0;
        v52 = 0.0;
        v53 = 0.0;
        v54 = 0.0;
        while (v48 + 401 > 0x64)
        {
          if (v48 + 300 > 0x63)
          {
            if (v48 + 200 > 0x63)
            {
              if (v48 < 0xFFFFFF9C)
              {
                if (v48 > 0x63 || *v49 <= v47)
                  goto LABEL_44;
                v55 = v54;
                v47 = *v49;
              }
              else
              {
                if (*v49 <= v51)
                  goto LABEL_44;
                v55 = v54;
                v51 = *v49;
              }
            }
            else
            {
              if (*v49 <= v52)
                goto LABEL_44;
              v55 = v54;
              v52 = *v49;
            }
          }
          else
          {
            if (*v49 <= v53)
              goto LABEL_44;
            v55 = v54;
            v53 = *v49;
          }
LABEL_45:
          ++v49;
          ++v48;
          v54 = v55;
          if (!--v50)
            goto LABEL_48;
        }
        v55 = *v49;
        if (*v49 > v54)
          goto LABEL_45;
LABEL_44:
        v55 = v54;
        goto LABEL_45;
      }
      v55 = 0.0;
      v53 = 0.0;
      v52 = 0.0;
      v51 = 0.0;
      v47 = 0.0;
LABEL_48:
      v56 = 0;
      HIDWORD(v39) = 1070805811;
      if (v53 < 0.3 && v52 < 0.3)
        v56 = v51 < 0.3;
      v57 = v55 < v53;
      v58 = v55 > v53;
      if (v53 >= v52)
        v57 = 0;
      if (v53 <= v52)
        v58 = 0;
      if (v52 >= v51)
        v57 = 0;
      v59 = v52 > v51 && v58;
      v60 = v51 < v47 && v57;
      v61 = v51 > v47 && v59;
      if (v40 < 0.3 || v56 || v60 || v61)
      {
        HIDWORD(v41) = 1072483532;
        v40 = 0.9 / v40;
        *(float *)&v40 = v40;
        v62 = 1.0;
        if (*(float *)&v40 >= 1.0)
          v63 = *(float *)&v40;
        else
          v63 = 1.0;
        v64 = 0.0;
        v65 = 0.0;
        v66 = 0.0;
        v67 = 0.0;
        v68 = 0.0;
        v69 = 0.0;
        if ((_DWORD)v88)
        {
          v70 = -501;
          v71 = v85;
          v72 = v30;
          do
          {
            v73 = v63 * *v71;
            *v71 = v73;
            if (v70 + 401 > 0x64)
            {
              if (v70 + 300 > 0x63)
              {
                if (v70 + 200 > 0x63)
                {
                  if (v70 < 0xFFFFFF9C)
                  {
                    if (v73 > v69 && v70 < 0x64)
                      v69 = v73;
                  }
                  else if (v73 > v68)
                  {
                    v68 = v73;
                  }
                }
                else if (v73 > v67)
                {
                  v67 = v73;
                }
              }
              else if (v73 > v66)
              {
                v66 = v73;
              }
            }
            else if (v73 > v65)
            {
              v65 = v73;
            }
            ++v70;
            ++v71;
            --v72;
          }
          while (v72);
        }
        if (v68 >= v69)
          v62 = 0.0;
        if (v67 < v68 && v66 < v67 && v65 < v66)
          v64 = v62;
        if (v64 != 0.0 && v65 < 0.3)
          goto LABEL_118;
        v77 = 1.0;
        if (v68 <= v69)
          v77 = 0.0;
        v78 = v67 <= v68 || v66 <= v67;
        v79 = v78 || v65 <= v66;
        v80 = v79 ? 0.0 : v77;
        if (v80 != 0.0)
        {
          v40 = v69;
          if (v40 < 0.3)
          {
LABEL_118:
            v90 = 3.0;
            vDSP_vsmul(v85, 1, &v90, v85, 1, v30);
            v42 = v85;
          }
        }
        if ((_DWORD)v88)
        {
          v81 = __dst;
          do
          {
            v82 = *v42++;
            *v81++ = fminf(v82, 1.0);
            --v30;
          }
          while (v30);
        }
      }
    }
    if (a3)
      memcpy(a3, __dst, __n);
    *(float *)&v39 = var0;
    *(float *)&v40 = var1;
    *(float *)&v41 = var2;
    v38 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](v87, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v88, v89, v22, __dst, a16, v39, v40, v41, __n);
  }
  free(v37);
  return v38;
}

- (void)_generatePulseAggregate:(unint64_t)a3 pulseVectorMain:(unint64_t)a4 pulseVectorResult:(unint64_t)a5 metricSelection:(unsigned __int8)a6 bufferHeight:(unsigned __int16)a7 bufferWidth:(unsigned __int16)a8
{
  uint64_t v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  BOOL v19;
  BOOL v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  if (a7 == 480)
  {
    v12 = 0;
    do
    {
      -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", a3, 0x80000, v12, a6);
      v12 = (v12 + 1);
    }
    while ((_DWORD)v12 != 480);
    v13 = 0;
    v14 = 0;
    v15 = 1;
    do
    {
      v16 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a4, v15);
      v17 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a4, (v15 - 1));
      if (v17)
        v18 = 1;
      else
        v18 = v16 == 0;
      if (!v18)
        v14 = v15;
      if (v17)
        v19 = v16 == 0;
      else
        v19 = 0;
      if (v19 && v14 != 0)
        v13 = v15 - 1;
      if (v14)
        v21 = v13 == 0;
      else
        v21 = 1;
      if (!v21)
      {
        if (v14 <= v13)
        {
          v22 = v14;
          do
          {
            -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 0x80000, v22);
            v22 = (v22 + 1);
          }
          while (v13 + 1 != (_DWORD)v22);
        }
        if (v14 >= 2u)
        {
          v23 = v14 + 1;
          do
          {
            if (!-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x80000, (v23 - 2)))break;
            -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 0x80000, (v23 - 2));
            --v23;
          }
          while (v23 > 2);
        }
        if (v13 <= 0x1DEu)
        {
          v24 = v13 + 1;
          do
          {
            if (!-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x80000, v24))
              break;
            -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 0x80000, v24);
            v24 = (v24 + 1);
          }
          while ((_DWORD)v24 != 480);
        }
        v14 = 0;
        v13 = 0;
      }
      v15 = (v15 + 1);
    }
    while ((_DWORD)v15 != 480);
    v25 = 0;
    v26 = a4 | 0x80000;
    do
    {
      -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", v26, a5, v25);
      v25 = (v25 + 1);
    }
    while ((_DWORD)v25 != 480);
  }
  else
  {
    v27 = a7;
    if (a6)
    {
      if (a6 == 1 && a7)
      {
        v28 = 0;
        do
        {
          -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", a4, a5, v28);
          v28 = (v28 + 1);
        }
        while (v27 != (_DWORD)v28);
      }
    }
    else if (a7)
    {
      v29 = 0;
      v30 = a4 | a3;
      do
      {
        -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", v30, a5, v29);
        v29 = (v29 + 1);
      }
      while (v27 != (_DWORD)v29);
    }
  }
}

- (void)_generatePulseAggregateSmallStubs:(unint64_t)a3 pulseVectorResult:(unint64_t)a4 bufferHeight:(unsigned __int16)a5 bufferWidth:(unsigned __int16)a6
{
  int v6;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int16 v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  int v24;
  BOOL v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unint64_t v34;

  if (a5)
  {
    v6 = a5;
    v10 = 0;
    do
    {
      -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", a4, v10);
      v10 = (v10 + 1);
    }
    while (v6 != (_DWORD)v10);
    if (v6 == 480)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 1;
      v34 = a3;
LABEL_6:
      while (2)
      {
        LODWORD(v33) = v14;
        HIDWORD(v33) = (unsigned __int16)v14 + 57;
        while (1)
        {
          v17 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", v34, v16, v33);
          v18 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", v34, (v16 - 1));
          if (v18)
            v19 = 1;
          else
            v19 = v17 == 0;
          if (v19)
            v20 = v12;
          else
            v20 = v16;
          v21 = (unsigned __int16)v20;
          if (v18)
            v22 = v17 == 0;
          else
            v22 = 0;
          if (!v22 || (unsigned __int16)v20 == 0)
            v24 = v11;
          else
            v24 = v16 - 1;
          if ((_WORD)v20)
            v25 = (unsigned __int16)v24 == 0;
          else
            v25 = 1;
          if (v25)
            goto LABEL_38;
          if ((unsigned __int16)v24 - (unsigned __int16)v20 >= 19)
            break;
          if (!v15)
          {
            v11 = 0;
            v12 = 0;
            v16 = (v16 + 1);
            v15 = 1;
            v13 = v24;
            v14 = v20;
            if ((_DWORD)v16 != 480)
              goto LABEL_6;
            goto LABEL_56;
          }
          if ((unsigned __int16)v20 - v13 >= 11)
          {
            if ((unsigned __int16)v20 <= (unsigned __int16)v24)
            {
              v27 = (unsigned __int16)v24 + 1;
              do
              {
                -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", a4, v21);
                v21 = (v21 + 1);
              }
              while (v27 != (_DWORD)v21);
            }
            v28 = (unsigned __int16)v33;
            if ((unsigned __int16)v33 <= v13)
            {
              do
              {
                -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", a4, v28);
                v28 = (v28 + 1);
              }
              while (v13 + 1 != (_DWORD)v28);
            }
LABEL_49:
            v15 = 0;
            v14 = 0;
            v13 = 0;
            v20 = 0;
            v24 = 0;
            goto LABEL_50;
          }
          v11 = 0;
          v12 = 0;
          if ((unsigned __int16)v24 < SHIDWORD(v33))
            v13 = v24;
          v16 = (v16 + 1);
          v15 = 1;
          if ((_DWORD)v16 == 480)
          {
            LOWORD(v20) = v33;
            LOWORD(v24) = v13;
LABEL_56:
            v31 = (unsigned __int16)v20;
            if ((unsigned __int16)v20 <= (unsigned __int16)v24)
            {
              v32 = (unsigned __int16)v24 + 1;
              do
              {
                -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", a4, v31);
                v31 = (v31 + 1);
              }
              while (v32 != (_DWORD)v31);
            }
            return;
          }
        }
        if ((unsigned __int16)v20 <= (unsigned __int16)v24)
        {
          v26 = (unsigned __int16)v24 + 1;
          do
          {
            -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", a4, v21);
            v21 = (v21 + 1);
          }
          while (v26 != (_DWORD)v21);
        }
        if (v15)
        {
          v29 = (unsigned __int16)v33;
          if ((unsigned __int16)v33 <= v13)
          {
            do
            {
              -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", a4, v29);
              v29 = (v29 + 1);
            }
            while (v13 + 1 != (_DWORD)v29);
          }
          goto LABEL_49;
        }
        v20 = 0;
        v24 = 0;
LABEL_38:
        v14 = v33;
LABEL_50:
        v16 = (v16 + 1);
        v11 = v24;
        v12 = v20;
        if ((_DWORD)v16 != 480)
          continue;
        break;
      }
      LOWORD(v20) = v14;
      LOWORD(v24) = v13;
      if (v15)
        goto LABEL_56;
    }
    else
    {
      v30 = 0;
      do
      {
        -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", a3, a4, v30);
        v30 = (v30 + 1);
      }
      while (v6 != (_DWORD)v30);
    }
  }
}

- (void)generateDominantPulse:(unint64_t)a3 rowLocationsRef:(unsigned __int16 *)a4 debugOut:(unsigned __int8)a5 bufferHeight:(unsigned __int16)a6 bufferWidth:(unsigned __int16)a7
{
  unsigned int v7;
  _BOOL4 v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unsigned __int16 v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  unsigned int v26;
  unsigned __int16 v28;
  unsigned __int16 v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  unsigned int v36;
  uint64_t v38;
  int v39;
  __int16 v40;
  unsigned int v41;
  BOOL v42;
  uint64_t v43;
  unsigned int v44;
  BOOL v45;
  BOOL v46;
  unsigned int v47;
  unsigned __int16 v49;
  int v50;
  unsigned int v51;
  BOOL v52;
  BOOL v53;
  _BOOL4 v54;
  BOOL v55;

  v7 = a6;
  if (a6)
  {
    if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, 0, a5, a6, a7))
    {
      v11 = 1;
    }
    else
    {
      v12 = 1;
      while (v7 != (_DWORD)v12)
      {
        v13 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, v12);
        v12 = (v12 + 1);
        if (v13)
        {
          v14 = v12 - 1;
          goto LABEL_10;
        }
      }
      v14 = v7;
LABEL_10:
      v11 = v14 < v7;
    }
  }
  else
  {
    v11 = 0;
  }
  v15 = -[VNCCTextDetector minHeight](self, "minHeight");
  v16 = -[VNCCTextDetector maxHeight](self, "maxHeight");
  if (!v11)
  {
    LOWORD(v18) = 0;
    v19 = 0;
    v28 = 0;
    v29 = 0;
    goto LABEL_122;
  }
  v17 = v16;
  if (v7 != 480)
  {
    if (v7 >= 0x191)
    {
      v19 = 0;
      LOWORD(v18) = 0;
      v30 = 400;
      v31 = 400 - v16;
      do
      {
        v32 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, v30);
        if (v32)
          v33 = (unsigned __int16)v18 == 0;
        else
          v33 = 0;
        if (v33)
          LOWORD(v18) = v30;
        if ((_WORD)v18)
          v34 = v32 == 0;
        else
          v34 = 0;
        if (v34)
          v19 = v30 - 1;
        if ((_WORD)v18)
          v35 = v19 == 0;
        else
          v35 = 1;
        if (!v35)
        {
          if ((unsigned __int16)v18 <= 0x191u)
          {
            if (v17 <= 0x190)
            {
              v38 = 400;
              while (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, v38))
              {
                v38 = (v38 - 1);
                if (v38 < v31)
                  goto LABEL_66;
              }
              v18 = (unsigned __int16)v38 + 1;
              if ((v18 & 0x10000) == 0)
                goto LABEL_101;
            }
          }
          else
          {
            v36 = v19 - (unsigned __int16)v18;
            if (v36 >= v15 && v36 <= v17)
              goto LABEL_101;
          }
LABEL_66:
          LOWORD(v18) = 0;
          v19 = 0;
        }
        v30 = (v30 + 1);
      }
      while ((_DWORD)v30 != v7);
    }
    LOWORD(v18) = 0;
    v19 = 0;
    goto LABEL_101;
  }
  LOWORD(v18) = 0;
  v19 = 0;
  v20 = 290;
  while (1)
  {
    v21 = v20 - 1;
    v22 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, (v20 - 1));
    if (v22)
      v23 = v19 == 0;
    else
      v23 = 0;
    if (v23)
      v19 = v20 - 1;
    if (v19)
      v24 = v22 == 0;
    else
      v24 = 0;
    if (v24)
      LOWORD(v18) = v20;
    if (v19)
      v25 = (unsigned __int16)v18 == 0;
    else
      v25 = 1;
    if (v25)
      goto LABEL_35;
    if (v19 >= 0x121u)
      break;
    v26 = v19 - (unsigned __int16)v18;
    if (v26 >= v15 && v26 <= v17)
      goto LABEL_101;
    v19 = 0;
LABEL_35:
    --v20;
    if (v21 <= 0xF0)
      goto LABEL_80;
  }
  if (v17 > 0xFFFFFEDE)
    goto LABEL_80;
  v39 = -1;
  while (1)
  {
    v40 = v39 + 290;
    if (!-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, (v39 + 290)))break;
    if (v17 == ++v39)
      goto LABEL_80;
  }
  v19 = v39 + 289;
  if (v40 == 1 || ((v41 = v19 - (unsigned __int16)v18, v41 >= v15) ? (v42 = v41 > v17) : (v42 = 1), v42))
  {
LABEL_80:
    v19 = 0;
    LOWORD(v18) = 0;
    v43 = 289;
    while (1)
    {
      v44 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, v43);
      if (v44)
        v45 = (unsigned __int16)v18 == 0;
      else
        v45 = 0;
      if (v45)
        LOWORD(v18) = v43;
      if (v44)
        v46 = 1;
      else
        v46 = (unsigned __int16)v18 == 0;
      if (!v46)
      {
        v19 = v43 - 1;
        if ((_WORD)v43 == 1)
        {
          v19 = 0;
        }
        else
        {
          v47 = (unsigned __int16)(v43 - 1) - (unsigned __int16)v18;
          if (v47 >= v15 && v47 <= v17)
          {
LABEL_99:
            if ((unsigned __int16)v18 == 0 || v19 == 0)
            {
              LOWORD(v18) = 0;
              v19 = 0;
            }
            break;
          }
          LOWORD(v18) = 0;
        }
      }
      v43 = (v43 + 1);
      if ((_DWORD)v43 == 480)
        goto LABEL_99;
    }
  }
LABEL_101:
  v49 = 0;
  v50 = v19 - 1;
  while (v50 + 2 < v7)
  {
    v51 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, (v50 + 2));
    if (v49)
      v52 = 1;
    else
      v52 = v51 == 0;
    if (!v52)
      v49 = v50 + 2;
    ++v50;
    if (v51)
      v53 = 1;
    else
      v53 = v49 == 0;
    if (!v53)
      goto LABEL_114;
  }
  LOWORD(v50) = 0;
LABEL_114:
  v54 = v49 == 0;
  if (!(_WORD)v50)
    v54 = 1;
  v55 = !v54;
  if (v54)
    v28 = v18;
  else
    v28 = v49;
  if (v55)
    v29 = v50;
  else
    v29 = v19;
LABEL_122:
  *a4 = v18;
  a4[1] = v19;
  a4[2] = v28;
  a4[3] = v29;
}

- (int)generateHistogramBounds:(__rgbaColor *)a3 rgbVector2Ref:(__rgbaColor *)a4 numPixels1:(unsigned int)a5 numPixels2:(unsigned int)a6 minMaxRGB:(__rgbMinMaxU8 *)a7 lowHighRGB:(__rgbMinMaxFloat *)a8
{
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v12;
  char *v13;
  char *v14;
  char v15;
  char v16;
  __rgbMinMaxU8 *v17;
  unsigned int var0;
  unsigned int var1;
  unsigned int var2;
  unsigned int var3;
  unsigned int var4;
  unsigned int var5;
  float v24;
  float v25;
  uint64_t v26;
  float v27;
  __rgbaColor *v28;
  unsigned __int8 *p_var2;
  uint64_t v30;
  float v31;
  double v32;
  int v33;
  float v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  char v38;
  unsigned int v39;
  char v40;
  uint64_t v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  float v54;
  uint64_t v55;
  unint64_t v56;
  float v57;
  uint64_t v58;
  unint64_t v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  uint64_t v65;
  float v66;
  float v67;
  float v68;
  float v69;
  int v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  __rgbMinMaxFloat *v77;
  __rgbaColor *v79;
  VNCCTextDetector *v81;
  float v82;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;

  LODWORD(v8) = 0;
  v9 = 0;
  if (a3 && a4 && a7 && a8)
  {
    v12 = malloc_type_calloc(0x99uLL, 1uLL, 0x100004077774924uLL);
    v9 = v12;
    if (v12)
    {
      v81 = self;
      v79 = a4;
      v8 = 0;
      v13 = (char *)v12 + 51;
      v14 = (char *)v12 + 102;
      v15 = 1;
      while (1)
      {
        v16 = v15;
        v17 = &a7[v8];
        *(_OWORD *)((char *)v9 + 137) = 0u;
        v9[7] = 0u;
        v9[8] = 0u;
        v9[5] = 0u;
        v9[6] = 0u;
        v9[3] = 0u;
        v9[4] = 0u;
        v9[1] = 0u;
        v9[2] = 0u;
        *v9 = 0u;
        var0 = v17->var0;
        var1 = v17->var1;
        var2 = v17->var2;
        var3 = v17->var3;
        var4 = v17->var4;
        var5 = v17->var5;
        v24 = (float)(int)(var1 - var0) / 50.0;
        v25 = (float)(int)(var3 - var2) / 50.0;
        if ((v16 & 1) != 0)
          v26 = a5;
        else
          v26 = a6;
        v27 = (float)(int)(var5 - var4) / 50.0;
        if ((_DWORD)v26)
        {
          v28 = v79;
          if ((v16 & 1) != 0)
            v28 = a3;
          p_var2 = &v28->var2;
          v30 = v26;
          do
          {
            v31 = (float)((float)(int)(*(p_var2 - 2) - var0) / v24) + -0.001;
            v32 = (float)((float)(int)(*(p_var2 - 1) - var2) / v25) + -0.001;
            v33 = *p_var2;
            p_var2 += 4;
            *(float *)&v32 = v32;
            v34 = (float)((float)(int)(v33 - var4) / v27) + -0.001;
            v35 = vcvtms_s32_f32(*(float *)&v32);
            v36 = vcvtms_s32_f32(v31);
            v37 = vcvtms_s32_f32(v34);
            if (v36 >= 0x32)
              v36 = 50;
            if (v35 >= 0x32)
              v35 = 50;
            v38 = v13[v35];
            ++*((_BYTE *)v9 + v36);
            if (v37 >= 0x32)
              v39 = 50;
            else
              v39 = v37;
            v40 = v14[v39];
            v13[v35] = v38 + 1;
            v14[v39] = v40 + 1;
            --v30;
          }
          while (v30);
        }
        v41 = 0;
        v42 = v24 * 0.5;
        v43 = v25 * 0.5;
        v44 = v27 * 0.5;
        v45 = (float)var1;
        v46 = (float)var3;
        v47 = (float)var5;
        v48 = (float)v26;
        v49 = (float)((float)v26 / 50.0) * 0.5;
        v89 = (float)var0;
        while (1)
        {
          LOBYTE(v48) = *((_BYTE *)v9 + v41);
          v48 = (float)LODWORD(v48);
          if (v49 < v48)
            break;
          if (++v41 == 51)
          {
            v92 = (float)var0;
            goto LABEL_29;
          }
        }
        v48 = (float)((float)var0 + (float)((float)(int)v41 * v24)) - v42;
        if (!(_DWORD)v41)
          v48 = (float)var0;
        v92 = v48;
LABEL_29:
        v50 = 0;
        v88 = (float)var2;
        while (1)
        {
          LOBYTE(v48) = *((_BYTE *)v9 + v50 + 51);
          v48 = (float)LODWORD(v48);
          if (v49 < v48)
            break;
          if (++v50 == 51)
          {
            v90 = (float)var2;
            goto LABEL_36;
          }
        }
        v48 = (float)((float)var2 + (float)((float)(int)v50 * v25)) - v43;
        if (!(_DWORD)v50)
          v48 = (float)var2;
        v90 = v48;
LABEL_36:
        v51 = 0;
        while (1)
        {
          LOBYTE(v48) = *((_BYTE *)v9 + v51 + 102);
          v48 = (float)LODWORD(v48);
          if (v49 < v48)
            break;
          if (++v51 == 51)
          {
            v91 = (float)var4;
            goto LABEL_43;
          }
        }
        v48 = (float)((float)var4 + (float)((float)(int)v51 * v27)) - v44;
        if (!(_DWORD)v51)
          v48 = (float)var4;
        v91 = v48;
LABEL_43:
        v52 = 50;
        while (1)
        {
          LOBYTE(v48) = *((_BYTE *)v9 + v52);
          v48 = (float)LODWORD(v48);
          if (v49 < v48)
            break;
          if (v52-- <= 1)
          {
            v54 = (float)var1;
            goto LABEL_49;
          }
        }
        v54 = (float)var1;
        if ((_DWORD)v52 != 50)
        {
          v24 = v45 - (float)((float)(50 - (int)v52) * v24);
          v54 = v42 + v24;
        }
LABEL_49:
        v55 = 101;
        while (1)
        {
          v56 = v55 - 51;
          LOBYTE(v24) = *((_BYTE *)v9 + v55);
          v24 = (float)LODWORD(v24);
          if (v49 < v24)
            break;
          --v55;
          if (v56 <= 1)
          {
            v57 = (float)var3;
            goto LABEL_55;
          }
        }
        v57 = (float)var3;
        if ((_DWORD)v55 != 101)
        {
          v25 = v46 - (float)((float)(101 - v55) * v25);
          v57 = v43 + v25;
        }
LABEL_55:
        v58 = 152;
        v82 = v43;
        v87 = (float)var4;
        while (1)
        {
          v59 = v58 - 102;
          LOBYTE(v25) = *((_BYTE *)v9 + v58);
          v25 = (float)LODWORD(v25);
          if (v49 < v25)
            break;
          --v58;
          if (v59 <= 1)
          {
            v60 = v42;
            v61 = (float)var5;
            goto LABEL_61;
          }
        }
        v60 = v42;
        v61 = (float)var5;
        if ((_DWORD)v58 != 152)
          v61 = v44 + (float)(v47 - (float)((float)(152 - v58) * v27));
LABEL_61:
        v62 = v27 * 0.5;
        if (-[VNCCTextDetector ii](v81, "ii", v79) == 1)
        {
          v63 = v92;
          if ((float)(v54 - v92) < 75.0)
          {
            v64 = v92 + v92 * -0.2;
            v63 = v64 >= 0.0 ? v92 + v92 * -0.2 : 0.0;
            v54 = v54 + v54 * 0.1;
            if (v54 > 255.0)
              v54 = 255.0;
          }
          v65 = v8;
          v67 = v90;
          v66 = v91;
          if ((float)(v57 - v90) < 75.0)
          {
            v68 = v90 + v90 * -0.2;
            v67 = v68 >= 0.0 ? v90 + v90 * -0.2 : 0.0;
            v57 = v57 + v57 * 0.1;
            if (v57 > 255.0)
              v57 = 255.0;
          }
          if ((float)(v61 - v91) < 75.0)
          {
            v69 = v91 + v91 * -0.2;
            if (v69 >= 0.0)
              v66 = v91 + v91 * -0.2;
            else
              v66 = 0.0;
            v47 = v61 + v61 * 0.1;
            v70 = 1132396544;
            if (v47 <= 255.0)
              goto LABEL_124;
            goto LABEL_123;
          }
          v47 = v61;
        }
        else
        {
          if (-[VNCCTextDetector ii](v81, "ii") == 2)
          {
            if (-[VNCCTextDetector profileNormal](v81, "profileNormal"))
            {
              if (var1 > 0x4A)
              {
                v54 = (float)var1;
                v63 = v89;
              }
              else
              {
                v71 = (float)(v60 + v89) + (float)(v60 + v89) * -0.3;
                if (v71 >= 0.0)
                  v63 = (float)(v60 + v89) + (float)(v60 + v89) * -0.3;
                else
                  v63 = 0.0;
                v72 = (float)(v45 - v60) + (float)(v45 - v60) * 0.3;
                if (v72 >= 30.0)
                  v54 = (float)(v45 - v60) + (float)(v45 - v60) * 0.3;
                else
                  v54 = 30.0;
                if (v54 > 75.0)
                  v54 = 75.0;
              }
              v66 = v87;
              v67 = v88;
              if (var3 > 0x4A)
              {
                v57 = (float)var3;
              }
              else
              {
                v73 = (float)(v82 + v88) + (float)(v82 + v88) * -0.3;
                if (v73 >= 0.0)
                  v67 = (float)(v82 + v88) + (float)(v82 + v88) * -0.3;
                else
                  v67 = 0.0;
                v74 = (float)(v46 - v82) + (float)(v46 - v82) * 0.3;
                if (v74 >= 30.0)
                  v57 = (float)(v46 - v82) + (float)(v46 - v82) * 0.3;
                else
                  v57 = 30.0;
                if (v57 > 75.0)
                  v57 = 75.0;
              }
              v65 = v8;
              if (var5 > 0x4A)
                goto LABEL_124;
              v75 = (float)(v62 + v87) + (float)(v62 + v87) * -0.3;
              v66 = v75 >= 0.0 ? (float)(v62 + v87) + (float)(v62 + v87) * -0.3 : 0.0;
              v76 = (float)(v47 - v62) + (float)(v47 - v62) * 0.3;
              v47 = v76 >= 30.0 ? (float)(v47 - v62) + (float)(v47 - v62) * 0.3 : 30.0;
              if (v47 <= 75.0)
                goto LABEL_124;
              v70 = 1117126656;
LABEL_123:
              v47 = *(float *)&v70;
              goto LABEL_124;
            }
            if (var1 <= 0xF5)
              v54 = (float)(int)(var1 + 10);
            else
              v54 = 255.0;
            if (var3 <= 0xF5)
              v57 = (float)(int)(var3 + 10);
            else
              v57 = 255.0;
            if (var5 <= 0xF5)
              v47 = (float)(int)(var5 + 10);
            else
              v47 = 255.0;
          }
          else
          {
            v54 = (float)var1;
            v57 = (float)var3;
          }
          v65 = v8;
          v67 = v88;
          v63 = v89;
          v66 = v87;
        }
LABEL_124:
        v15 = 0;
        v77 = &a8[v65];
        v77->var0 = v63;
        v77->var1 = v54;
        v77->var2 = v67;
        v77->var3 = v57;
        v77->var4 = v66;
        v77->var5 = v47;
        v8 = 1;
        if ((v16 & 1) == 0)
          goto LABEL_127;
      }
    }
    LODWORD(v8) = 0;
  }
LABEL_127:
  free(v9);
  return v8;
}

- (unsigned)_generateBinarizationForImage:(vImage_Buffer *)a3 textOut:(vImage_Buffer *)a4 firstOrSecondPassIndicator:(unsigned __int8)a5 minMaxRGB:(__rgbMinMaxFloat *)a6
{
  uint8x16_t v6;
  uint8x16_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  uint8x16_t v10;
  uint8x16_t v11;
  int8x16_t v12;
  vImagePixelCount width;
  int v15;
  vImagePixelCount v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  const char *data;
  _BYTE *v26;
  unint64_t v27;
  _BYTE *v28;
  const char *v29;
  int8x16_t v30;
  unsigned __int8 *v31;
  unsigned int v32;
  BOOL v33;
  unsigned int v34;
  BOOL v35;
  unsigned int v36;
  BOOL v37;
  void *v38;
  void *v39;
  id v40;
  const char *v41;
  __int128 v42;
  _OWORD v44[2];
  int8x16x4_t v45;

  width = a3->width;
  if (width >= 0x1000)
    __assert_rtn("-[VNCCTextDetector _generateBinarizationForImage:textOut:firstOrSecondPassIndicator:minMaxRGB:]", "VNCCTextDetector.mm", 2516, "image.width < 4096");
  v15 = a5;
  if (a3->height)
  {
    v17 = 0;
    v18 = 0;
    v19 = vcvtms_s32_f32(a6->var0);
    v20 = vcvtps_s32_f32(a6->var1);
    v21 = vcvtms_s32_f32(a6->var2);
    v22 = vcvtps_s32_f32(a6->var3);
    v23 = vcvtms_s32_f32(a6->var4);
    v24 = vcvtps_s32_f32(a6->var5);
    v6 = (uint8x16_t)vdupq_n_s8(v19);
    v7 = (uint8x16_t)vdupq_n_s8(v20);
    v8 = (uint8x16_t)vdupq_n_s8(v21);
    v9 = (uint8x16_t)vdupq_n_s8(v22);
    v10 = (uint8x16_t)vdupq_n_s8(v23);
    v11 = (uint8x16_t)vdupq_n_s8(v24);
    data = (const char *)a3->data;
    v26 = a4->data;
    v12.i16[0] = 257;
    v12.i8[2] = 1;
    v12.i8[3] = 1;
    v12.i8[4] = 1;
    v12.i8[5] = 1;
    v12.i8[6] = 1;
    v12.i8[7] = 1;
    v12.i8[8] = 1;
    v12.i8[9] = 1;
    v12.i8[10] = 1;
    v12.i8[11] = 1;
    v12.i8[12] = 1;
    v12.i8[13] = 1;
    v12.i8[14] = 1;
    v12.i8[15] = 1;
    do
    {
      if (width >= 0x10)
      {
        v27 = 0;
        v29 = data;
        do
        {
          v45 = vld4q_s8(v29);
          v29 += 64;
          v30 = vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v45.val[1], v8), (int8x16_t)vcgtq_u8(v9, (uint8x16_t)v45.val[1])), vandq_s8((int8x16_t)vcgtq_u8(v7, (uint8x16_t)v45.val[2]), (int8x16_t)vcgtq_u8((uint8x16_t)v45.val[2], v6))), vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v45.val[0], v10), (int8x16_t)vcgtq_u8(v11, (uint8x16_t)v45.val[0])), v12));
          *(int8x16_t *)&v26[v27] = v30;
          v18 += vaddvq_s8(v30);
          v27 += 16;
          width = a3->width;
        }
        while ((width & 0xFFFFFFFFFFFFFFF0) > v27);
        v28 = &v26[v27];
      }
      else
      {
        LODWORD(v27) = 0;
        v28 = v26;
        v29 = data;
      }
      if (width > v27)
      {
        v27 = v27;
        v31 = (unsigned __int8 *)(v29 + 2);
        do
        {
          v32 = *(v31 - 2);
          v33 = v32 <= v23 || v32 >= v24;
          if (v33
            || ((v34 = *(v31 - 1), v34 > v21) ? (v35 = v34 >= v22) : (v35 = 1),
                v35 || ((v36 = *v31, v36 > v19) ? (v37 = v36 >= v20) : (v37 = 1), v37)))
          {
            *v28 = 0;
          }
          else
          {
            *v28 = 1;
            ++v18;
          }
          ++v27;
          ++v28;
          width = a3->width;
          v31 += 4;
        }
        while (width > v27);
      }
      ++v17;
      v26 += a4->rowBytes;
      data += a3->rowBytes;
    }
    while (a3->height > v17);
  }
  else
  {
    v18 = 0;
  }
  if (-[VNCCTextDetector debugOut](self, "debugOut", *(double *)v6.i64, *(double *)v7.i64, *(double *)v8.i64, *(double *)v9.i64, *(double *)v10.i64, *(double *)v11.i64, *(double *)v12.i64))
  {
    -[VNCCTextDetector debugFilename](self, "debugFilename");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v38, "stringByAppendingPathComponent:", CFSTR("textOutSecondPassImage.png"));
    else
      objc_msgSend(v38, "stringByAppendingPathComponent:", CFSTR("textOutFirstPassImage.png"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_retainAutorelease(v39);
    v41 = (const char *)objc_msgSend(v40, "UTF8String");
    v42 = *(_OWORD *)&a4->width;
    v44[0] = *(_OWORD *)&a4->data;
    v44[1] = v42;
    saveVImage(v41, (unsigned __int8 **)v44, 1280061496);

  }
  return v18;
}

- (float)createLumaImage:(vImage_Buffer *)a3 lumaImage:(vImage_Buffer *)a4 numCropRows:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6
{
  unsigned int v6;
  _BYTE *data;
  vImagePixelCount width;
  float result;
  uint8x16_t v10;
  const char *v11;
  uint8x16_t v12;
  uint8x16_t v13;
  unint64_t v14;
  _BYTE *v15;
  const char *v16;
  uint16x8_t v17;
  uint16x8_t v18;
  uint8x16_t v19;
  float v20;
  unsigned __int8 *v21;
  signed int v22;
  int8x16x4_t v23;

  if (!a5)
    return 0.0;
  v6 = 0;
  data = a4->data;
  width = a3->width;
  result = 0.0;
  v10.i64[0] = 0x1D1D1D1D1D1D1D1DLL;
  v10.i64[1] = 0x1D1D1D1D1D1D1D1DLL;
  v11 = (char *)a3->data + a3->rowBytes * a6;
  v12.i64[0] = 0x9696969696969696;
  v12.i64[1] = 0x9696969696969696;
  v13.i64[0] = 0x4A4A4A4A4A4A4A4ALL;
  v13.i64[1] = 0x4A4A4A4A4A4A4A4ALL;
  do
  {
    if (width == 15)
    {
      LODWORD(v14) = 0;
      v15 = data;
      v16 = v11;
    }
    else
    {
      v14 = 0;
      v16 = v11;
      do
      {
        v23 = vld4q_s8(v16);
        v16 += 64;
        v17.i64[0] = 0x80008000800080;
        v17.i64[1] = 0x80008000800080;
        v18.i64[0] = 0x80008000800080;
        v18.i64[1] = 0x80008000800080;
        v19 = (uint8x16_t)vraddhn_high_s16(vraddhn_s16((int16x8_t)vmlal_u8(vmlal_u8(vmlal_u8(v17, *(uint8x8_t *)v23.val[0].i8, (uint8x8_t)0x1D1D1D1D1D1D1D1DLL), *(uint8x8_t *)v23.val[1].i8, (uint8x8_t)0x9696969696969696), *(uint8x8_t *)v23.val[2].i8, (uint8x8_t)0x4A4A4A4A4A4A4A4ALL), (int16x8_t)0), (int16x8_t)vmlal_high_u8(vmlal_high_u8(vmlal_high_u8(v18, (uint8x16_t)v23.val[0], v10), (uint8x16_t)v23.val[1], v12), (uint8x16_t)v23.val[2], v13), (int16x8_t)0);
        v23.val[1].i8[0] = vmaxvq_u8(v19);
        v20 = (float)v23.val[1].u32[0];
        if (result < v20)
          result = v20;
        *(uint8x16_t *)&data[v14] = v19;
        v14 += 16;
        width = a3->width;
      }
      while (width - 15 > v14);
      v15 = &data[v14];
    }
    if (width > v14)
    {
      v14 = v14;
      v21 = (unsigned __int8 *)(v16 + 2);
      do
      {
        v22 = (301 * *(v21 - 1) + 153 * *v21 + 58 * *(v21 - 2) + 256) >> 9;
        if (result < (float)v22)
          result = (float)v22;
        *v15++ = v22;
        ++v14;
        width = a3->width;
        v21 += 4;
      }
      while (width > v14);
    }
    ++v6;
    v11 += a3->rowBytes;
    data += a4->rowBytes;
  }
  while (v6 < a5);
  return result;
}

- (float)createLumaImageAlternative:(vImage_Buffer *)a3 lumaImageAlternative:(vImage_Buffer *)a4 numCropRows:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6
{
  unsigned int v6;
  _BYTE *data;
  vImagePixelCount width;
  size_t rowBytes;
  char *v10;
  float result;
  vImagePixelCount v12;
  unsigned __int8 *v13;
  char v14;
  unsigned int v15;
  float v16;

  if (!a5)
    return 0.0;
  v6 = 0;
  data = a4->data;
  width = a3->width;
  rowBytes = a3->rowBytes;
  v10 = (char *)a3->data + rowBytes * a6;
  result = 0.0;
  do
  {
    if (width)
    {
      v12 = 0;
      v13 = (unsigned __int8 *)(v10 + 2);
      do
      {
        v15 = *v13;
        v13 += 4;
        v14 = v15;
        v16 = (float)v15;
        if (result < (float)v15)
          result = v16;
        data[v12++] = v14;
        width = a3->width;
      }
      while (width > v12);
      rowBytes = a3->rowBytes;
    }
    ++v6;
    v10 += rowBytes;
    data += a4->rowBytes;
  }
  while (v6 < a5);
  return result;
}

- (void)getVotingHistogram:(vImage_Buffer *)a3 colorProfileContext:(__CCColorProfileContext *)a4 startCC:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6
{
  size_t rowBytes;
  unsigned int var7;
  unsigned int var6;
  char *v11;
  int v12;
  char *v13;
  uint64_t v14;
  int v15;
  signed int v16;
  BOOL v17;
  unsigned int v18;
  uint8x16_t v19;
  BOOL *data;
  int8x16_t v21;
  unsigned int v22;
  uint64_t v23;
  BOOL *v24;
  char *v25;
  signed int v26;
  _DWORD v27[256];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  rowBytes = a3->rowBytes;
  var7 = a4->var7;
  var6 = a4->var6;
  v11 = (char *)a3->data + rowBytes * a6 + a5;
  bzero(v27, 0x400uLL);
  if (var7)
  {
    v12 = 0;
    v13 = v11;
    do
    {
      if (var6)
      {
        v14 = 0;
        do
          ++v27[v13[v14++]];
        while (var6 > (unsigned __int16)v14);
      }
      ++v12;
      v13 += rowBytes;
    }
    while (var7 > (unsigned __int16)v12);
  }
  v15 = 0;
  v16 = 255;
  while (1)
  {
    v15 += v27[v16];
    if (v15 > (int)((double)var7 * 0.2 * (double)var6))
      break;
    v17 = v16-- != 0;
    if (v16 == 0 || !v17)
    {
      v16 = 0;
      break;
    }
  }
  if (var7)
  {
    v18 = 0;
    v19 = (uint8x16_t)vdupq_n_s8(v16);
    data = (BOOL *)a4->var0.data;
    v21.i64[0] = 0x101010101010101;
    v21.i64[1] = 0x101010101010101;
    do
    {
      v22 = (unsigned __int16)var6;
      if ((unsigned __int16)var6 < 0x10u)
      {
        LODWORD(v23) = 0;
        v25 = v11;
        v24 = data;
      }
      else
      {
        v23 = 0;
        do
        {
          *(int8x16_t *)&data[v23] = vandq_s8((int8x16_t)vcgeq_u8(*(uint8x16_t *)&v11[v23], v19), v21);
          v22 = a4->var6;
          v23 += 16;
        }
        while ((int)v23 < (int)(v22 - 15));
        v24 = &data[v23];
        v25 = &v11[v23];
        LOWORD(var6) = a4->var6;
      }
      if (v23 < v22)
      {
        do
        {
          v26 = *v25++;
          *v24++ = v16 <= v26;
          LODWORD(v23) = v23 + 1;
          var6 = a4->var6;
        }
        while (v23 < var6);
      }
      ++v18;
      v11 += a3->rowBytes;
      data += a4->var0.rowBytes;
    }
    while (v18 < a4->var7);
  }
}

- (void)getLumaHistogram:(vImage_Buffer *)a3 startCC:(unsigned __int16)a4 colorProfileContext:(__CCColorProfileContext *)a5
{
  unsigned int v6;
  unsigned int var7;
  unsigned int var6;
  char *data;
  int v11;
  size_t rowBytes;
  unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  int v21;
  int v22;
  _BYTE *v23;
  BOOL *v24;
  BOOL *v25;
  int v26;
  char *v27;
  _BYTE *v28;
  BOOL *v29;
  BOOL *v30;
  unsigned int v31;
  _DWORD v32[256];
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  var7 = a5->var7;
  var6 = a5->var6;
  bzero(v32, 0x400uLL);
  data = (char *)a3->data;
  if (var7)
  {
    v11 = 0;
    rowBytes = a3->rowBytes;
    v13 = (unsigned __int8 *)a3->data;
    do
    {
      if (var6)
      {
        v14 = 0;
        v15 = v6;
        do
        {
          ++v32[v13[v15]];
          ++v14;
          ++v15;
        }
        while (var6 > (unsigned __int16)v14);
      }
      ++v11;
      v13 += rowBytes;
    }
    while (var7 > (unsigned __int16)v11);
  }
  v16 = 0;
  v17 = (int)((double)var7 * 0.2 * (double)var6);
  v18 = 255;
  while (1)
  {
    v16 += v32[v18];
    if (v16 >= v17)
      break;
    v19 = v18-- != 0;
    if (v18 == 0 || !v19)
    {
      v18 = 0;
      break;
    }
  }
  v20 = 0;
  v21 = 0;
  do
  {
    v21 += v32[v20];
    if (v21 >= v17)
      break;
    ++v20;
  }
  while (v20 != 256);
  if (var7)
  {
    v22 = 0;
    v23 = a5->var3.data;
    v24 = (BOOL *)a5->var2.data;
    v25 = (BOOL *)a5->var1.data;
    do
    {
      if ((_WORD)var6)
      {
        v26 = 0;
        v27 = &data[v6];
        v28 = v23;
        v29 = v24;
        v30 = v25;
        do
        {
          v31 = *v27++;
          *v30++ = v18 <= (int)v31;
          *v29++ = v20 >= v31;
          *v28++ = v31;
          ++v26;
          var6 = a5->var6;
        }
        while (var6 > (unsigned __int16)v26);
        LOWORD(var7) = a5->var7;
      }
      else
      {
        LOWORD(var6) = 0;
      }
      ++v22;
      v25 += a5->var1.rowBytes;
      v24 += a5->var2.rowBytes;
      v23 += a5->var3.rowBytes;
      data += a3->rowBytes;
    }
    while ((unsigned __int16)v22 < (unsigned __int16)var7);
  }
  a5->var4 = v16;
  a5->var5 = v21;
}

- (unsigned)computeNumCropCols:(float *)a3 width:(unint64_t)a4 start:(unsigned __int16 *)a5
{
  uint64_t v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  double v10;
  unsigned __int16 v11;
  __int16 v12;
  __int16 v13;
  double v14;
  int v15;

  if (a4)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = a3[v5];
      if (v10 >= 0.0025)
        ++v8;
      else
        v8 = 0;
      if (v10 < 0.0025)
        ++v7;
      else
        v7 = 0;
      v11 = v6 - 25;
      if ((unsigned __int16)(v6 - 25) >= 5u)
        v12 = v6 - 25;
      else
        v12 = 50;
      if (v8 <= 0x19u)
        v13 = 0;
      else
        v13 = v12;
      if (v6 > 0xAFu)
        v13 = 50;
      if (!v9)
        v9 = v13;
      if (v9 && v7 > 0x19u)
        break;
      v5 = ++v6;
      if (v6 >= a4)
      {
        if (v9)
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    v14 = (double)a4;
    v15 = (int)((double)a4 * 0.75);
    if (v11)
      goto LABEL_26;
  }
  else
  {
LABEL_23:
    v9 = 50;
LABEL_24:
    v14 = (double)a4;
    v15 = (int)((double)a4 * 0.75);
  }
  v11 = v15;
LABEL_26:
  if (v11 - v9 >= (int)(v14 * 0.15))
    LOWORD(v15) = v11;
  else
    v9 = 50;
  *a5 = v9;
  return v15 - v9 + 1;
}

- (int)computeMainStub:(vImage_Buffer *)a3 numCropRows:(unsigned __int16)a4 numCropColsOut:(unsigned __int16 *)a5 maxY:(float)a6 start:(unsigned __int16 *)a7
{
  void *v7;
  int v8;
  float *v9;
  unsigned int v12;
  void *v15;
  float v16;
  float v17;
  float v18;
  unsigned __int8 *data;
  int v20;
  size_t rowBytes;
  float v22;
  unsigned __int8 *v23;
  unsigned int v24;
  unsigned __int8 *v25;
  unsigned int v26;
  BOOL v27;
  int v28;
  float v29;
  unsigned __int8 *v30;
  unsigned int v31;
  unsigned __int8 *v32;
  unsigned int v33;
  float v34;
  vImagePixelCount v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t i;
  int v39;
  unsigned __int8 *v40;
  float v41;
  uint64_t j;
  int v43;
  unint64_t v44;
  float v45;
  unsigned __int8 *v46;
  int v47;

  v7 = 0;
  v8 = 0;
  if (a5)
  {
    v9 = 0;
    if (a7)
    {
      v12 = a4;
      *a5 = 0;
      v9 = (float *)malloc_type_calloc(a3->width, 4uLL, 0x100004052888210uLL);
      if (v9)
      {
        v15 = malloc_type_calloc(a3->width, 4uLL, 0x100004052888210uLL);
        v7 = v15;
        if (v15)
        {
          v17 = 1.0 / (float)((float)((float)v12 * 5.0) * a6);
          v18 = v17 / a6;
          data = (unsigned __int8 *)a3->data;
          if (v12)
          {
            v20 = 0;
            rowBytes = a3->rowBytes;
            v22 = 0.0;
            v23 = (unsigned __int8 *)a3->data;
            do
            {
              v24 = 0;
              v25 = v23;
              do
              {
                v26 = *v25++;
                v22 = v22 + (float)v26;
                v27 = v24++ >= 4;
              }
              while (!v27);
              ++v20;
              v23 += rowBytes;
            }
            while (v12 > (unsigned __int16)v20);
            v28 = 0;
            v16 = v17 * v22;
            v9[2] = v17 * v22;
            v29 = 0.0;
            v30 = data;
            do
            {
              v31 = 0;
              v32 = v30;
              do
              {
                v33 = *v32++;
                v29 = v29 + (float)((float)((float)v33 - v16) * (float)((float)v33 - v16));
                v27 = v31++ >= 4;
              }
              while (!v27);
              ++v28;
              v30 += rowBytes;
            }
            while (v12 > (unsigned __int16)v28);
          }
          else
          {
            v22 = 0.0;
            v9[2] = v17 * 0.0;
            v29 = 0.0;
          }
          v34 = v18 * v29;
          *((float *)v15 + 2) = v34;
          v35 = a3->width - 2;
          if (v35 >= 4)
          {
            v36 = 0;
            v37 = 5;
            for (i = 3; i != v35; ++i)
            {
              if (v12)
              {
                v39 = 0;
                v40 = data;
                do
                {
                  LOBYTE(v34) = v40[v37];
                  LOBYTE(v16) = v40[v36];
                  v41 = v22 + (float)LODWORD(v34);
                  v34 = (float)LODWORD(v16);
                  v22 = v41 - (float)LODWORD(v16);
                  ++v39;
                  v40 += a3->rowBytes;
                }
                while (v12 > (unsigned __int16)v39);
              }
              v34 = v17 * v22;
              v9[i] = v17 * v22;
              ++v36;
              ++v37;
            }
            for (j = 3; j != v35; ++j)
            {
              if (v12)
              {
                v43 = 0;
                v44 = j + 2;
                v45 = 0.0;
                v46 = data;
                do
                {
                  if (v44 >= (unsigned __int16)(j - 2))
                  {
                    v47 = j - 2;
                    do
                    {
                      LOBYTE(v34) = v46[(unsigned __int16)v47];
                      v34 = (float)LODWORD(v34) + (float)((float)-v9[j] * a6);
                      v45 = v45 + (float)(v34 * v34);
                      ++v47;
                    }
                    while (v44 >= (unsigned __int16)v47);
                  }
                  ++v43;
                  v46 += a3->rowBytes;
                }
                while (v12 > (unsigned __int16)v43);
              }
              else
              {
                v45 = 0.0;
              }
              *((float *)v15 + j) = v18 * v45;
            }
          }
          *a5 = -[VNCCTextDetector computeNumCropCols:width:start:](self, "computeNumCropCols:width:start:", v15);
          v8 = 1;
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v8 = 0;
        v7 = 0;
      }
    }
  }
  else
  {
    v9 = 0;
  }
  free(v9);
  free(v7);
  return v8;
}

- (void)determineColorProfileType:(__CCColorProfileContext *)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  char *data;
  unsigned int var6;
  unsigned int v11;
  char *v12;
  char *v13;
  char *v14;
  int8x16_t v15;
  uint64_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  unsigned int v25;
  BOOL v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  float var4;
  float v36;
  float var5;
  float v38;
  float v39;
  float v40;
  VNCCTextDetector *v41;
  uint64_t v42;

  if (a3->var7)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    data = (char *)a3->var0.data;
    var6 = a3->var6;
    v11 = var6 & 0xFFF0;
    v12 = (char *)a3->var2.data;
    v13 = (char *)a3->var3.data;
    v14 = (char *)a3->var1.data;
    v15.i64[0] = 0x101010101010101;
    v15.i64[1] = 0x101010101010101;
    do
    {
      if ((var6 & 0xFFF0) != 0)
      {
        v16 = 0;
        do
        {
          v17 = *(int8x16_t *)&v14[v16];
          v18 = *(int8x16_t *)&v12[v16];
          v19 = *(int8x16_t *)&v13[v16];
          v20 = vceqq_s8(*(int8x16_t *)&data[v16], v15);
          v6 += vaddlvq_u8((uint8x16_t)vandq_s8(v19, vceqq_s8(v17, v15)));
          v7 += vaddlvq_u8((uint8x16_t)vandq_s8(v19, vceqq_s8(v18, v15)));
          v4 += vaddvq_s8(vandq_s8(v17, v20));
          v5 += vaddvq_s8(vandq_s8(v18, v20));
          v16 += 16;
        }
        while (v16 < v11);
        v21 = &v14[v16];
        v22 = &v12[v16];
        v23 = &data[v16];
        v24 = &v13[v16];
        v25 = ((v11 - 1) & 0xFFFFFFF0) + 16;
      }
      else
      {
        v25 = 0;
        v24 = v13;
        v23 = data;
        v22 = v12;
        v21 = v14;
      }
      v26 = var6 >= v25;
      v27 = var6 - v25;
      if (v27 != 0 && v26)
      {
        do
        {
          v29 = *v21++;
          v28 = v29;
          v31 = *v23++;
          v30 = v31;
          v4 += v31 * v28;
          v33 = *v22++;
          v32 = v33;
          v5 += v33 * v30;
          v34 = *v24++;
          v6 += v34 * v28;
          v7 += v34 * v32;
          --v27;
        }
        while (v27);
      }
      ++v8;
      v14 += a3->var1.rowBytes;
      v12 += a3->var2.rowBytes;
      data += a3->var0.rowBytes;
      v13 += a3->var3.rowBytes;
    }
    while (v8 < a3->var7);
  }
  else
  {
    v7 = 0;
    v6 = 0;
    v5 = 0;
    v4 = 0;
  }
  var4 = (float)a3->var4;
  v36 = (float)v6 / var4;
  var5 = (float)a3->var5;
  v38 = (float)v4 / var4;
  v39 = (float)v5 / var5;
  v40 = (float)v7 / var5;
  if (v38 <= v39 || v36 <= v40)
  {
    -[VNCCTextDetector setIi:](self, "setIi:", 2);
    if (v38 < v39)
    {
      if (v36 <= 115.0 || v40 >= 40.0)
      {
        v41 = self;
        v42 = 0;
      }
      else
      {
        v41 = self;
        v42 = 1;
      }
      -[VNCCTextDetector setProfileNormal:](v41, "setProfileNormal:", v42);
    }
  }
  else
  {
    -[VNCCTextDetector setIi:](self, "setIi:", 1);
  }
}

- (int)allocateColorProfileContext:(__CCColorProfileContext *)a3 width:(unsigned __int16)a4 height:(unsigned __int16)a5 rowBytes:(unint64_t)a6
{
  unsigned int v7;
  unsigned int v8;
  int result;

  v7 = a5;
  v8 = a4;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("color profile context must not be NULL"));
  *(_OWORD *)&a3->var2.data = 0u;
  *(_OWORD *)&a3->var3.data = 0u;
  *(_OWORD *)&a3->var3.width = 0u;
  *(_OWORD *)&a3->var2.width = 0u;
  *(_OWORD *)&a3->var1.data = 0u;
  *(_OWORD *)&a3->var1.width = 0u;
  *(_OWORD *)&a3->var0.data = 0u;
  *(_OWORD *)&a3->var0.width = 0u;
  result = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", v8, v7, a6, a3);
  if (result == 1)
  {
    result = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", v8, v7, a6, &a3->var1);
    if (result == 1)
    {
      result = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", v8, v7, a6, &a3->var2);
      if (result == 1)
      {
        result = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", v8, v7, a6, &a3->var3);
        if (result == 1)
        {
          a3->var6 = v8;
          a3->var7 = v7;
        }
      }
    }
  }
  return result;
}

- (void)freeColorProfileContext:(__CCColorProfileContext *)a3
{
  if (a3)
  {
    -[VNCCTextDetector _freeVImage:](self, "_freeVImage:");
    -[VNCCTextDetector _freeVImage:](self, "_freeVImage:", &a3->var1);
    -[VNCCTextDetector _freeVImage:](self, "_freeVImage:", &a3->var2);
    -[VNCCTextDetector _freeVImage:](self, "_freeVImage:", &a3->var3);
  }
}

- (int)_generateAndApplyColorProfileForImage:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 textOut:(vImage_Buffer *)a5 minMaxRGB:(__rgbMinMaxU8 *)a6 lowHighRGB:(__rgbMinMaxFloat *)a7 numCropRows:(unsigned __int16)a8 rowStartLocation:(unsigned __int16)a9 rowStopLocation:(unsigned __int16)a10 sumTextOutFirstPass:(unsigned int *)a11 useLowLightEnhancement:(unsigned __int8)a12
{
  _BYTE *v13;
  int v14;
  void *v16;
  uint64_t v17;
  int v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  unsigned __int8 *v35;
  _BYTE *v36;
  uint64_t v37;
  unsigned __int8 v38;
  _BYTE *v39;
  _BYTE *v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  uint64_t v46;
  unsigned __int8 *v47;
  _BYTE *v48;
  int v49;
  char *v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  char *v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  __rgbMinMaxFloat *v59;
  __int128 v60;
  __int128 v61;
  vImage_Buffer *v62;
  vImage_Buffer *v63;
  __rgbMinMaxU8 *v64;
  __rgbMinMaxFloat *v65;
  VNCCTextDetector *v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  size_t rowBytes;
  _BYTE *v72;
  uint64_t v73;
  _OWORD v74[2];
  _OWORD v75[2];
  _OWORD v76[2];
  _OWORD v77[2];
  _OWORD v78[2];
  _OWORD v79[2];
  _OWORD v80[2];
  _OWORD v81[2];
  _OWORD v82[2];
  int v83;
  __int128 v84;
  __int128 v85;
  _OWORD v86[2];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;

  v13 = 0;
  v14 = 0;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v87 = 0u;
  memset(v86, 0, sizeof(v86));
  v84 = 0u;
  v85 = 0u;
  v83 = 0;
  if (!a6 || !a7)
  {
    v16 = 0;
    goto LABEL_50;
  }
  v16 = 0;
  if (a11)
  {
    v17 = a8;
    v73 = a8;
    v22 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:");
    if (v22 != 1)
      goto LABEL_48;
    v23 = *(_OWORD *)&a3->width;
    if (a12)
    {
      v80[0] = *(_OWORD *)&a3->data;
      v80[1] = v23;
      v79[0] = v84;
      v79[1] = v85;
      -[VNCCTextDetector createLumaImageAlternative:lumaImageAlternative:numCropRows:rowStartLocation:](self, "createLumaImageAlternative:lumaImageAlternative:numCropRows:rowStartLocation:", v80, v79, v17, a9);
    }
    else
    {
      v82[0] = *(_OWORD *)&a3->data;
      v82[1] = v23;
      v81[0] = v84;
      v81[1] = v85;
      -[VNCCTextDetector createLumaImage:lumaImage:numCropRows:rowStartLocation:](self, "createLumaImage:lumaImage:numCropRows:rowStartLocation:", v82, v81, v17, a9);
    }
    v78[0] = v84;
    v78[1] = v85;
    v22 = -[VNCCTextDetector computeMainStub:numCropRows:numCropColsOut:maxY:start:](self, "computeMainStub:numCropRows:numCropColsOut:maxY:start:", v78, v17, (char *)&v83 + 2, &v83);
    if (v22 == 1
      && (v22 = -[VNCCTextDetector allocateColorProfileContext:width:height:rowBytes:](self, "allocateColorProfileContext:width:height:rowBytes:", v86), v22 == 1))
    {
      v24 = *(_OWORD *)&a4->width;
      v77[0] = *(_OWORD *)&a4->data;
      v77[1] = v24;
      -[VNCCTextDetector getVotingHistogram:colorProfileContext:startCC:rowStartLocation:](self, "getVotingHistogram:colorProfileContext:startCC:rowStartLocation:", v77, v86, (unsigned __int16)v83, a9);
      v76[0] = v84;
      v76[1] = v85;
      -[VNCCTextDetector getLumaHistogram:startCC:colorProfileContext:](self, "getLumaHistogram:startCC:colorProfileContext:", v76, (unsigned __int16)v83, v86);
      -[VNCCTextDetector determineColorProfileType:](self, "determineColorProfileType:", v86);
      v13 = malloc_type_malloc(4 * (int)v93, 0x100004052888210uLL);
      if (v13)
      {
        v67 = v13;
        v72 = malloc_type_malloc(4 * SDWORD1(v93), 0x100004052888210uLL);
        if (v72)
        {
          v64 = a6;
          v65 = a7;
          v62 = a3;
          v63 = a5;
          v66 = self;
          *(_QWORD *)&v93 = 0;
          if ((_DWORD)v17)
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v28 = 0;
            v29 = 0;
            v30 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            rowBytes = a3->rowBytes;
            v34 = (char *)a3->data + 4 * (unsigned __int16)v83 + rowBytes * a9;
            v35 = (unsigned __int8 *)v87;
            v36 = (_BYTE *)v89;
            v69 = *((_QWORD *)&v88 + 1);
            v70 = HIWORD(v83);
            v37 = 4 * HIWORD(v83);
            v68 = *((_QWORD *)&v90 + 1);
            v38 = -1;
            v39 = v72;
            v40 = v67;
            v41 = -1;
            v42 = -1;
            v43 = -1;
            v44 = -1;
            v45 = -1;
            do
            {
              if (v70)
              {
                v46 = 0;
                v47 = v35;
                v48 = v36;
                do
                {
                  v49 = *v47++;
                  if (v49 == 1)
                  {
                    v50 = &v34[v46];
                    v51 = v34[v46];
                    if (v51 < v43)
                      v43 = v34[v46];
                    v52 = v50[1];
                    if (v52 < v44)
                      v44 = v50[1];
                    v53 = v50[2];
                    if (v53 < v45)
                      v45 = v50[2];
                    if (v51 > v29)
                      v29 = v34[v46];
                    if (v52 > v30)
                      v30 = v50[1];
                    if (v53 > v31)
                      v31 = v50[2];
                    *v40 = v53;
                    v40[1] = v50[1];
                    v40[2] = *v50;
                    v40 += 4;
                    v32 = (v32 + 1);
                    LODWORD(v93) = v32;
                  }
                  if (*v48 == 1)
                  {
                    v54 = &v34[v46];
                    v55 = v34[v46];
                    if (v55 < v38)
                      v38 = v34[v46];
                    v56 = v54[1];
                    if (v56 < v41)
                      v41 = v54[1];
                    v57 = v54[2];
                    if (v57 < v42)
                      v42 = v54[2];
                    if (v55 > v26)
                      v26 = v34[v46];
                    if (v56 > v27)
                      v27 = v54[1];
                    if (v57 > v28)
                      v28 = v54[2];
                    *v39 = v57;
                    v39[1] = v54[1];
                    v39[2] = *v54;
                    v39 += 4;
                    v33 = (v33 + 1);
                    DWORD1(v93) = v33;
                  }
                  v46 += 4;
                  ++v48;
                }
                while (v37 != v46);
              }
              ++v25;
              v16 = v72;
              v34 += rowBytes;
              v36 += v68;
              v35 += v69;
            }
            while (v25 != v73);
          }
          else
          {
            v33 = 0;
            v32 = 0;
            v31 = 0;
            v30 = 0;
            v29 = 0;
            v28 = 0;
            v27 = 0;
            v26 = 0;
            v45 = -1;
            v44 = -1;
            v43 = -1;
            v42 = -1;
            v41 = -1;
            v38 = -1;
            v16 = v72;
          }
          v64->var0 = v45;
          v64->var1 = v31;
          v64->var2 = v44;
          v64->var3 = v30;
          v64->var4 = v43;
          v64->var5 = v29;
          v64[1].var0 = v42;
          v64[1].var1 = v28;
          v64[1].var2 = v41;
          v64[1].var3 = v27;
          v64[1].var4 = v38;
          v64[1].var5 = v26;
          self = v66;
          v14 = -[VNCCTextDetector generateHistogramBounds:rgbVector2Ref:numPixels1:numPixels2:minMaxRGB:lowHighRGB:](v66, "generateHistogramBounds:rgbVector2Ref:numPixels1:numPixels2:minMaxRGB:lowHighRGB:", v67, v16, v32, v33);
          if (v14 == 1)
          {
            v59 = &v65[-[VNCCTextDetector ii](v66, "ii") != 1];
            v60 = *(_OWORD *)&v62->width;
            v75[0] = *(_OWORD *)&v62->data;
            v75[1] = v60;
            v61 = *(_OWORD *)&v63->width;
            v74[0] = *(_OWORD *)&v63->data;
            v74[1] = v61;
            *a11 = -[VNCCTextDetector _generateBinarizationForImage:textOut:firstOrSecondPassIndicator:minMaxRGB:](v66, "_generateBinarizationForImage:textOut:firstOrSecondPassIndicator:minMaxRGB:", v75, v74, 0, v59);
          }
        }
        else
        {
          v14 = 0;
          v16 = 0;
        }
        v13 = v67;
        goto LABEL_50;
      }
      v14 = 0;
    }
    else
    {
LABEL_48:
      v14 = v22;
      v13 = 0;
    }
    v16 = 0;
  }
LABEL_50:
  free(v13);
  free(v16);
  -[VNCCTextDetector freeColorProfileContext:](self, "freeColorProfileContext:", v86);
  -[VNCCTextDetector _freeVImage:](self, "_freeVImage:", &v84);
  return v14;
}

- (int)_generateAdaptiveBinarization:(vImage_Buffer *)a3 adaptImage:(vImage_Buffer *)a4 useLowLightEnhancement:(unsigned __int8)a5
{
  int v5;
  vImagePixelCount width;
  int *v10;
  float *v11;
  char *v12;
  char *v13;
  int v14;
  char *data;
  vImagePixelCount v16;
  vImagePixelCount v17;
  char *v18;
  vImagePixelCount v19;
  vImagePixelCount v20;
  char *v21;
  int v22;
  char v23;
  size_t rowBytes;
  vImagePixelCount height;
  char *v26;
  vImagePixelCount v27;
  char *v28;
  vImagePixelCount v29;
  vImagePixelCount v30;
  char *v31;
  int v32;
  char v33;
  int v34;
  char *v35;
  char *v36;
  vImagePixelCount v37;
  vImagePixelCount v38;
  char *v39;
  int v40;
  char v41;
  vImagePixelCount v42;
  vImage_Buffer *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  float *v48;
  int *v49;
  float *v50;
  int *v51;
  int v52;
  float v53;
  vImagePixelCount v54;
  uint64_t v55;
  vImagePixelCount v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  float v64;
  float v65;
  vImagePixelCount v66;
  void *v67;
  void *v68;
  id v69;
  const char *v70;
  __int128 v71;
  int v72;
  vImagePixelCount v74;
  vImage_Buffer *v75;
  char *v76;
  vImagePixelCount v77;
  _OWORD v78[2];

  v5 = a5;
  width = a3->width;
  v10 = (int *)malloc_type_calloc((a3->height + 128) * width, 4uLL, 0x100004052888210uLL);
  if (v10)
  {
    v11 = (float *)malloc_type_calloc((a3->height + 128) * width, 4uLL, 0x100004052888210uLL);
    if (v11
      && (v77 = (a3->width + 63) & 0xFFFFFFFFFFFFFFC0,
          (v12 = (char *)malloc_type_calloc(v77 * (a3->height + 128), 1uLL, 0x100004077774924uLL)) != 0))
    {
      v74 = width;
      v75 = a4;
      v14 = 0;
      data = (char *)a3->data;
      v16 = a3->width;
      v17 = v16;
      v76 = v12;
      v18 = v12;
      v19 = v77;
      do
      {
        if (v17)
        {
          v20 = 0;
          v21 = data + 2;
          do
          {
            v22 = -[VNCCTextDetector ii](self, "ii", v74, v75);
            v23 = *(v21 - 1);
            if (v22 != 1)
              v23 = ~v23;
            v18[v20] = v23;
            if (v5)
              v18[v20] = *v21;
            ++v20;
            v16 = a3->width;
            v21 += 4;
          }
          while (v16 > v20);
          v17 = a3->width;
          v19 = v77;
        }
        ++v14;
        v18 += v19;
        rowBytes = a3->rowBytes;
        data += rowBytes;
      }
      while (v14 != 64);
      v26 = (char *)a3->data;
      height = a3->height;
      if (height)
      {
        v27 = 0;
        v28 = &v76[64 * v19];
        v29 = v16;
        do
        {
          if (v29)
          {
            v30 = 0;
            v31 = v26 + 2;
            do
            {
              v32 = -[VNCCTextDetector ii](self, "ii", v74, v75);
              v33 = *(v31 - 1);
              if (v32 != 1)
                v33 = ~v33;
              v28[v30] = v33;
              if (v5)
                v28[v30] = *v31;
              ++v30;
              v16 = a3->width;
              v31 += 4;
            }
            while (v16 > v30);
            rowBytes = a3->rowBytes;
            height = a3->height;
            v29 = a3->width;
            v19 = v77;
          }
          ++v27;
          v28 += v19;
          v26 += rowBytes;
        }
        while (height > v27);
        v26 = (char *)a3->data;
      }
      v34 = 0;
      v35 = &v26[rowBytes * (height - 66)];
      v36 = &v76[(height + 62) * v19];
      v37 = v16;
      do
      {
        if (v37)
        {
          v38 = 0;
          v39 = v35 + 2;
          do
          {
            v40 = -[VNCCTextDetector ii](self, "ii", v74, v75);
            v41 = *(v39 - 1);
            if (v40 != 1)
              v41 = ~v41;
            v36[v38] = v41;
            if (v5)
              v36[v38] = *v39;
            ++v38;
            v16 = a3->width;
            v39 += 4;
          }
          while (v16 > v38);
          rowBytes = a3->rowBytes;
          v37 = a3->width;
          v19 = v77;
        }
        ++v34;
        v36 += v19;
        v35 += rowBytes;
      }
      while (v34 != 64);
      v42 = a3->height;
      v43 = v75;
      v44 = v74;
      v45 = v76;
      if (v42 == -127)
        goto LABEL_42;
      v46 = 0;
      v47 = 0;
      v13 = v76;
      v48 = v11;
      v49 = v10;
      do
      {
        v50 = &v48[v74];
        v51 = &v49[v74];
        v52 = *v49 + v13[v19];
        *v51 = v52;
        v53 = *v48 + (float)(v13[v19] * v13[v19]);
        *v50 = v53;
        v54 = v19 + 1;
        v55 = v46;
        v56 = v16 - 1;
        if (v16 >= 2)
        {
          do
          {
            v52 = v52 + v13[v54] + *(int *)((char *)v10 + v55 + 4) - *(int *)((char *)v10 + v55);
            *(int *)((char *)&v10[v44 + 1] + v55) = v52;
            v53 = (float)(*(float *)((char *)v11 + v55 + 4)
                        + (float)(v53 + (float)(v13[v54] * v13[v54])))
                - *(float *)((char *)v11 + v55);
            *(float *)((char *)&v11[v44 + 1] + v55) = v53;
            v55 += 4;
            ++v54;
            --v56;
          }
          while (v56);
        }
        ++v47;
        v46 += v44 * 4;
        v13 += v19;
        v48 = v50;
        v49 = v51;
      }
      while (v47 != v42 + 127);
      if (v42 != 1)
      {
LABEL_42:
        v57 = 0;
        v58 = 0;
        v59 = (uint64_t)v75->data + 17;
        v60 = (uint64_t)&v76[65 * v19 + 17];
        do
        {
          if (v16 >= 0x22)
          {
            v61 = 0;
            v62 = v57;
            do
            {
              v13 = (char *)*(unsigned int *)((char *)v10 + v62 + 132);
              v63 = (float)(*(int *)((char *)v10 + v62)
                                        + *(int *)((char *)&v10[129 * v74 + 33] + v62)
                                        - (*(int *)((char *)&v10[129 * v74] + v62)
                                         + (_DWORD)v13))
                  * 0.00023491;
              v64 = *(float *)((char *)v11 + v62 + 132);
              v65 = sqrtf((float)((float)((float)((float)(*(float *)((char *)&v11[129 * v74 + 33] + v62)+ *(float *)((char *)v11 + v62))- *(float *)((char *)&v11[129 * v74] + v62))- v64)* 0.00023491)- (float)(v63 * v63));
              LOBYTE(v64) = *(_BYTE *)(v60 + v61);
              *(_BYTE *)(v59 + v61) = (float)(v63 + (float)(v65 * 0.2)) < (float)LODWORD(v64);
              v16 = a3->width;
              v66 = v61 + 34;
              ++v61;
              v62 += 4;
            }
            while (v16 > v66);
            v42 = a3->height;
          }
          ++v58;
          v60 += v19;
          v59 += v75->rowBytes;
          v57 += v44 * 4;
        }
        while (v42 - 1 > v58);
      }
      if (-[VNCCTextDetector debugOut](self, "debugOut", v13, v74, v75))
      {
        -[VNCCTextDetector debugFilename](self, "debugFilename");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringByAppendingPathComponent:", CFSTR("adaptiveOutImage.png"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        v69 = objc_retainAutorelease(v68);
        v70 = (const char *)objc_msgSend(v69, "UTF8String");
        v71 = *(_OWORD *)&v43->width;
        v78[0] = *(_OWORD *)&v43->data;
        v78[1] = v71;
        saveVImage(v70, (unsigned __int8 **)v78, 1280061496);

      }
      v72 = 1;
    }
    else
    {
      v72 = 0;
      v45 = 0;
    }
  }
  else
  {
    v72 = 0;
    v45 = 0;
    v11 = 0;
  }
  free(v10);
  free(v11);
  free(v45);
  return v72;
}

- (int)_generateSmoothedImage:(vImage_Buffer *)a3 uImage:(vImage_Buffer *)a4
{
  vImagePixelCount width;
  vImagePixelCount height;
  unint64_t *v9;
  unint64_t *v10;
  int v11;
  int v12;
  unint64_t v13;
  vImagePixelCount v14;
  unsigned __int8 *data;
  unint64_t v16;
  size_t rowBytes;
  vImagePixelCount v18;
  char *v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  int *v27;
  unint64_t v28;
  _DWORD *v29;
  int v30;
  int v31;
  unint64_t v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  vImagePixelCount v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  unint64_t v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  const char *v51;
  __int128 v52;
  void *v53;
  void *v54;
  id v55;
  const char *v56;
  __int128 v57;
  _OWORD v59[2];
  _OWORD v60[2];

  height = a3->height;
  width = a3->width;
  v9 = (unint64_t *)malloc_type_calloc(4 * width * height + 24, 1uLL, 0x3C7E5A79uLL);
  if (v9)
  {
    v10 = v9;
    *v9 = width;
    v9[1] = height;
    v11 = -[VNCCTextDetector midRow](self, "midRow");
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    v13 = (v12 - 1);
    v14 = a3->height;
    if (v14 > v13)
    {
      data = (unsigned __int8 *)a3->data;
      v16 = *v10;
      v18 = a3->width;
      rowBytes = a3->rowBytes;
      v19 = (char *)a3->data + rowBytes * v13 + 1;
      v20 = 4 * *v10;
      v21 = v12 - 2;
      v22 = (uint64_t)v10 + 4 * *v10 * v13 + 20;
      while (1)
      {
        v23 = data[rowBytes * v13];
        if (v13)
        {
          if (v16)
            break;
        }
        if (v16)
        {
          v24 = v10[1];
          goto LABEL_15;
        }
LABEL_17:
        if (v18 >= 2)
        {
          v26 = 0;
          v27 = (int *)((char *)v10 + v20 * v21 + 20);
          v28 = (v13 - 1);
          v29 = (_DWORD *)v22;
          do
          {
            if (v16 <= v26 || v10[1] <= v13)
              v30 = 0;
            else
              v30 = *(v29 - 1);
            v31 = 0;
            v32 = v26 + 1;
            if (v13 && v16 > v32)
            {
              if (v10[1] <= v28)
                v31 = 0;
              else
                v31 = *v27;
            }
            v33 = v30 + v19[v26] + v31;
            if (v13 && v16 > v26 && v10[1] > v28)
              v33 -= *(v27 - 1);
            if (v16 > v32 && v10[1] > v13)
              *v29 = v33;
            ++v27;
            ++v29;
            ++v26;
          }
          while (v18 - 1 != v32);
        }
        ++v13;
        v19 += rowBytes;
        ++v21;
        v22 += v20;
        if (v13 == v14)
          goto LABEL_37;
      }
      v24 = v10[1];
      if (v24 <= (v13 - 1))
        v25 = 0;
      else
        v25 = *((_DWORD *)v10 + v16 * (v13 - 1) + 4);
      v23 += v25;
LABEL_15:
      if (v24 > v13)
        *((_DWORD *)v10 + v16 * v13 + 4) = v23;
      goto LABEL_17;
    }
LABEL_37:
    if (v11 <= -4)
      v34 = -4;
    else
      v34 = v11;
    v35 = v34 + 4;
    if (v14 > v35)
    {
      v36 = a3->width;
      v37 = v35 - 2;
      do
      {
        if (v36 >= 0x41)
        {
          v38 = 0;
          v39 = (v35 - 4);
          v40 = (char *)a4->data + a4->rowBytes * v37 + 32;
          do
          {
            v41 = 0;
            v42 = v38 + 64;
            v43 = *v10;
            if ((v35 & 0x8000000000000000) == 0 && v43 > v42)
            {
              if (v10[1] <= v35)
                v41 = 0;
              else
                v41 = *((_DWORD *)v10 + v38 + v35 * v43 + 68);
            }
            v44 = 0;
            v45 = v38;
            if (v35 >= 4 && v43 > v38)
            {
              if (v10[1] <= v39)
                v44 = 0;
              else
                v44 = *((_DWORD *)v10 + v38 + v34 * v43 + 4);
            }
            v46 = 0;
            if ((v35 & 0x8000000000000000) == 0 && v43 > v38)
            {
              if (v10[1] <= v35)
                v46 = 0;
              else
                v46 = *((_DWORD *)v10 + v38 + v35 * v43 + 4);
            }
            v47 = 0;
            if (v35 >= 4 && v43 > v42)
            {
              if (v10[1] <= v39)
                v47 = 0;
              else
                v47 = *((_DWORD *)v10 + v38 + v34 * v43 + 68);
            }
            v40[v38] = v44 + v41 - (v46 + v47) > 2;
            v36 = a3->width;
            ++v38;
          }
          while (v36 > v45 + 65);
          v14 = a3->height;
        }
        ++v35;
        ++v34;
        ++v37;
      }
      while (v14 > v35);
    }
    free(v10);
    if (-[VNCCTextDetector debugOut](self, "debugOut"))
    {
      -[VNCCTextDetector debugFilename](self, "debugFilename");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringByAppendingPathComponent:", CFSTR("selectedTextOutImageArray.png"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = objc_retainAutorelease(v49);
      v51 = (const char *)objc_msgSend(v50, "UTF8String");
      v52 = *(_OWORD *)&a3->width;
      v60[0] = *(_OWORD *)&a3->data;
      v60[1] = v52;
      saveVImage(v51, (unsigned __int8 **)v60, 1280061496);
      -[VNCCTextDetector debugFilename](self, "debugFilename");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringByAppendingPathComponent:", CFSTR("uOutImage.png"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = objc_retainAutorelease(v54);
      v56 = (const char *)objc_msgSend(v55, "UTF8String");
      v57 = *(_OWORD *)&a4->width;
      v59[0] = *(_OWORD *)&a4->data;
      v59[1] = v57;
      saveVImage(v56, (unsigned __int8 **)v59, 1280061496);

    }
    LODWORD(v9) = 1;
  }
  return (int)v9;
}

- (int)_generateBoxes:(id)a3 pulseVector:(unint64_t)a4 uImage:(vImage_Buffer *)a5 countBigBoxOut:(unint64_t *)a6 bigBoxes:(__CCBigBox *)a7 bigBoxesA:(__CCBigBox *)a8 useLowLightEnhancement:(unsigned __int8)a9
{
  id v13;
  void *v14;
  int v15;
  char *v16;
  unsigned __int8 *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  unint64_t *v28;
  unsigned int v29;
  unsigned __int16 v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  unsigned int v34;
  vImagePixelCount v35;
  unint64_t v36;
  float v37;
  int v39;
  _BOOL4 v40;
  unint64_t v41;
  vImagePixelCount v43;
  int v44;
  vImagePixelCount v45;
  char *v46;
  char v47;
  unint64_t v48;
  unsigned __int16 width;
  __CCBigBox *v51;
  __CCBigBox *v52;
  vImagePixelCount v53;
  unsigned __int8 v54;
  size_t rowBytes;
  char *v56;
  unint64_t v57;
  int v58;
  uint64_t v59;
  unsigned __int8 *v60;
  int v61;
  char *v62;
  unsigned __int8 *v63;
  vImagePixelCount v64;
  int v65;
  int v66;
  uint64_t v67;
  unsigned __int16 v68;
  int v69;
  int v70;
  int v71;
  __CCBigBox *v72;
  __CCBigBox *v73;
  unsigned __int16 v74;
  __CCBigBox *v75;
  __CCBigBox *v76;
  unint64_t *v78;
  void *v79;
  unint64_t v80;
  unint64_t v81;
  VNCCTextDetector *v84;

  v13 = a3;
  v14 = v13;
  v15 = 0;
  v16 = 0;
  if (a6 && v13 && a7)
  {
    v17 = 0;
    if (a8)
    {
      v17 = (unsigned __int8 *)malloc_type_calloc(a5->width, 1uLL, 0x100004077774924uLL);
      if (v17)
      {
        v16 = (char *)malloc_type_calloc(a5->width, 2uLL, 0x1000040BDFB0063uLL);
        if (v16)
        {
          v79 = v14;
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("textBoxRevised"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("textBoxRevised"));

          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("textBoxRevisedNormalized"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("textBoxRevisedNormalized"));

          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("stubBox"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("stubBox"));

          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("stubBoxNormalized"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, CFSTR("stubBoxNormalized"));

          }
          v26 = -[VNCCTextDetector minHeight](self, "minHeight");
          v27 = -[VNCCTextDetector maxHeight](self, "maxHeight");
          v28 = -[VNCCCharBoxContext charBoxFlags](self->_charBoxContext, "charBoxFlags");
          v78 = a6;
          if (a5->height < 2)
          {
            v32 = 0;
            goto LABEL_98;
          }
          v84 = self;
          v29 = v27;
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v33 = *v28;
          v34 = v26;
          v35 = 1;
          v81 = v34;
          v80 = v29;
          while (1)
          {
            v36 = -[VNCCCharBoxContext charBoxFlags](v84->_charBoxContext, "charBoxFlags")[8 * v35];
            if ((v33 & a4) != 0 || (v36 & a4) == 0)
              v39 = v31;
            else
              v39 = v35;
            v40 = (unsigned __int16)v39 != 0;
            if ((v36 & a4) == 0 && v40)
              v30 = v35 - 1;
            if (!v30)
              v40 = 0;
            if (a9 || !v40)
            {
              v47 = !v40;
              if (!a9)
                v47 = 1;
              if ((v47 & 1) != 0)
              {
                v31 = v39;
                goto LABEL_91;
              }
              v48 = v30 - (unint64_t)(unsigned __int16)v39 + 1;
              if (v48 < v81 || v48 > v80)
              {
LABEL_89:
                v31 = 0;
              }
              else
              {
                v31 = 0;
                width = a5->width;
                v51 = &a7[v32];
                v51->var0 = v39;
                v51->var1 = v30;
                v51->var2 = 16;
                width -= 16;
                v51->var3 = width;
                v52 = &a8[v32];
                v52->var0 = v39;
                v52->var1 = v30;
                v52->var2 = 16;
                v52->var3 = width;
                if (v32 == 199)
                  v32 = 199;
                else
                  ++v32;
              }
              v30 = 0;
              goto LABEL_91;
            }
            v41 = v30 - (unsigned __int16)v39 + 1;
            if (v41 < v81 || v41 > v80)
              goto LABEL_89;
            if (v30 - (unsigned __int16)v39 != -1)
              bzero(v16, 2 * (v30 - (unsigned __int16)v39) + 2);
            v43 = a5->width;
            v44 = v43 - v41;
            if (v43 > (int)v43 - (int)v41)
              break;
            if (v43)
              goto LABEL_51;
LABEL_57:
            v58 = 0;
            if (v30 - (unsigned __int16)v39 != -1)
            {
              v59 = v41;
              v60 = v17;
              do
              {
                v61 = *v60++;
                v58 += v61;
                --v59;
              }
              while (v59);
            }
            *(_WORD *)&v16[2 * (v41 >> 1)] = v58;
            if (v43 != v41)
            {
              v62 = &v16[2 * (v41 >> 1) + 2];
              v63 = v17;
              v64 = v43;
              do
              {
                v65 = v63[v41];
                v66 = *v63++;
                v58 += v65 - v66;
                *(_WORD *)v62 = v58;
                v62 += 2;
                --v64;
              }
              while (v41 != v64);
            }
            if (!v43)
              goto LABEL_89;
            v67 = 0;
            v68 = 0;
            v69 = 0;
            do
            {
              LOBYTE(v37) = v17[v67];
              v37 = (float)LODWORD(v37);
              if ((float)((float)v41 / 5.0) < v37
                && (LOWORD(v37) = *(_WORD *)&v16[2 * v67],
                    v37 = (float)LODWORD(v37),
                    (float)((float)(unsigned __int16)(v41 * v41) / 12.0) <= v37))
              {
                if (!v69)
                  v69 = (unsigned __int16)v67;
              }
              else
              {
                if (!v69)
                  goto LABEL_79;
                v68 = v67 - 1;
              }
              if ((_WORD)v39 && v69 && v68 && v30)
              {
                v70 = v68 - 16;
                v71 = v69 + 16;
                if (v70 > v71)
                {
                  v72 = &a7[v32];
                  v72->var0 = v39;
                  v72->var1 = v30;
                  v72->var2 = v71;
                  v72->var3 = v70;
                  v73 = &a8[v32];
                  v73->var0 = v39;
                  v73->var1 = v30;
                  v73->var2 = v71;
                  v73->var3 = v70;
                  ++v32;
                }
                v69 = 0;
                v68 = 0;
                if (v32 == 200)
                  v32 = 199;
              }
LABEL_79:
              ++v67;
            }
            while (v43 != v67);
            v31 = 0;
            if ((_WORD)v39 && v69 && !v68 && v30)
            {
              v74 = v69 + 16;
              if (v69 + 16 < (unsigned __int16)v43)
              {
                v75 = &a7[v32];
                v75->var0 = v39;
                v75->var1 = v30;
                v75->var2 = v74;
                v75->var3 = v43;
                v76 = &a8[v32];
                v76->var0 = v39;
                v76->var1 = v30;
                v76->var2 = v74;
                v76->var3 = v43;
                ++v32;
              }
              v31 = 0;
              v30 = 0;
              if (v32 == 200)
                v32 = 199;
            }
            else
            {
              v30 = 0;
            }
LABEL_91:
            ++v35;
            v33 = v36;
            if (a5->height <= v35)
            {
LABEL_98:
              *v78 = v32;
              v15 = 1;
              v14 = v79;
              goto LABEL_99;
            }
          }
          v45 = v43 - v44;
          v46 = &v16[2 * v44];
          do
          {
            *(_WORD *)v46 = 0;
            v46 += 2;
            --v45;
          }
          while (v45);
LABEL_51:
          v53 = 0;
          do
          {
            if ((unsigned __int16)v39 <= v30)
            {
              v54 = 0;
              rowBytes = a5->rowBytes;
              v56 = (char *)a5->data + (unsigned __int16)v39 * rowBytes;
              v57 = v30 - (unint64_t)(unsigned __int16)v39 + 1;
              do
              {
                v54 += v56[v53];
                v56 += rowBytes;
                --v57;
              }
              while (v57);
            }
            else
            {
              v54 = 0;
            }
            v17[v53++] = v54;
            v43 = a5->width;
          }
          while (v43 > v53);
          goto LABEL_57;
        }
      }
      else
      {
        v16 = 0;
      }
      v15 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_99:
  free(v17);
  free(v16);

  return v15;
}

- (void)_generateCC:(id)a3 ccBigBoxes:(__CCBigBox *)a4 textOut:(vImage_Buffer *)a5 countBigBox:(unsigned __int8)a6 bufferHeight:(unsigned __int16)a7
{
  unsigned int v7;
  CGColorSpace *DeviceRGB;
  uint64_t v10;
  __CCBigBox *v11;
  uint64_t var0;
  uint64_t var2;
  unsigned int var1;
  int v15;
  int v16;
  int *v17;
  unint64_t v18;
  int *v19;
  int *v20;
  int v21;
  _BYTE *v22;
  int v23;
  char *v24;
  unint64_t v25;
  int v26;
  int v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  unint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _DWORD *v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  int *v45;
  int *v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _OWORD *v55;
  char *v56;
  int *v57;
  char *v58;
  char *v59;
  size_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t *v67;
  unsigned int *v68;
  __int32 v69;
  uint64_t v70;
  int8x16_t *v71;
  int8x16_t *v72;
  int8x16_t *v73;
  __int32 v74;
  uint64_t *v75;
  uint64_t *v76;
  int8x16_t *v77;
  int8x16_t *v78;
  BOOL v79;
  int *v80;
  int v81;
  _QWORD *v82;
  _QWORD **v83;
  _QWORD *v84;
  _QWORD **v85;
  int v86;
  _QWORD *v87;
  int v88;
  int v89;
  int v90;
  uint64_t **v91;
  unsigned __int16 *v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int *v101;
  int v102;
  _QWORD *v103;
  _QWORD **v104;
  _QWORD *v105;
  _QWORD **v106;
  int v107;
  _QWORD *v108;
  uint64_t **v109;
  int v110;
  int v111;
  int v112;
  float v113;
  float v114;
  float v115;
  uint64_t *v116;
  float v117;
  int v118;
  float v119;
  int v120;
  int v121;
  uint64_t v122;
  int v123;
  int v124;
  uint64_t v125;
  char *v127;
  unsigned __int16 *v128;
  unsigned __int16 *v129;
  unsigned __int16 v130;
  unsigned __int16 *v131;
  unsigned __int16 v132;
  unsigned __int16 *v133;
  uint64_t v134;
  unsigned int v135;
  uint64_t v136;
  void *v137;
  int v138;
  float v139;
  void *v140;
  uint64_t *v141;
  uint64_t *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  const char *v148;
  unsigned int v149;
  uint64_t v150;
  int v151;
  id v152;
  VNCCTextDetector *v153;
  int v154;
  uint64_t v155;
  CGContext *c;
  _BOOL4 v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  int v162;
  char *v163;
  int v164;
  _BYTE *v166;
  int v167;
  void *v168;
  char *__p;
  int __pa;
  int *v171;
  int v172;
  void *v173;
  int v174;
  uint64_t *v175;
  _QWORD *v176;
  uint64_t v177;
  uint64_t *i;
  _QWORD *v179;
  uint64_t v180;
  int8x16_t v181[2];
  int8x16_t *v182;
  int8x16_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  _QWORD v187[5];
  _QWORD v188[8];
  CGRect v189;
  CGRect v190;

  v151 = a7;
  v7 = a6;
  v188[5] = *MEMORY[0x1E0C80C00];
  v152 = a3;
  v153 = self;
  memset(v181, 0, sizeof(v181));
  v158 = -[VNCCTextDetector debugOut](self, "debugOut");
  if (v158)
  {
    -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", a5->width, a5->height, 4 * a5->rowBytes, v181);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    c = CGBitmapContextCreate((void *)v181[0].i64[0], v181[1].u64[0], v181[0].u64[1], 8uLL, v181[1].u64[1], DeviceRGB, 0x2006u);
    CGContextSetLineWidth(c, 3.0);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    c = 0;
  }
  if (v7)
  {
    v10 = 0;
    v150 = v7;
    while (1)
    {
      v160 = v10;
      v11 = &a4[v10];
      var0 = v11->var0;
      var2 = v11->var2;
      var1 = v11->var1;
      v15 = var1 - var0;
      v16 = v11->var3 - (_DWORD)var2;
      v183 = 0uLL;
      v182 = &v183;
      v159 = var0;
      v162 = var2;
      if (((var1 - (_DWORD)var0) & 0x80000000) == 0)
        break;
      v171 = 0;
      v20 = 0;
      v179 = 0;
      v180 = 0;
      i = (uint64_t *)&v179;
      if (v158)
      {
        v20 = 0;
        v171 = 0;
        v176 = 0;
        v177 = 0;
        v175 = (uint64_t *)&v176;
        goto LABEL_170;
      }
LABEL_172:
      if (v15 <= 14)
        v110 = 12;
      else
        v110 = 16;
      if (v151 != 480)
        v110 = 16;
      __pa = v110;
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = -[VNCCTextDetector pixelHeightCard](v153, "pixelHeightCard");
      v112 = -[VNCCTextDetector pixelWidthCard](v153, "pixelWidthCard");
      -[VNCCTextDetector mmHeightCard](v153, "mmHeightCard");
      v114 = v113;
      -[VNCCTextDetector mmWidthCard](v153, "mmWidthCard");
      v116 = i;
      if (i == (uint64_t *)&v179)
        goto LABEL_198;
      v117 = v115;
      v118 = 0;
      v119 = (float)v112;
      do
      {
        v120 = *((unsigned __int16 *)v116 + 18);
        v121 = *((unsigned __int16 *)v116 + 17);
        v122 = (v120 - v121);
        v123 = *((unsigned __int16 *)v116 + 20);
        v124 = *((unsigned __int16 *)v116 + 19);
        v125 = (v123 - v124);
        if ((int)v122 >= 6 && (int)v125 >= __pa)
        {
          if (v118 >= 1)
          {
            objc_msgSend(v173, "appendString:", CFSTR(", "));
            objc_msgSend(v168, "appendString:", CFSTR(", "));
            LOWORD(v121) = *((_WORD *)v116 + 17);
            LOWORD(v120) = *((_WORD *)v116 + 18);
            LOWORD(v124) = *((_WORD *)v116 + 19);
            LOWORD(v123) = *((_WORD *)v116 + 20);
          }
          v127 = (char *)&a4[v160] + 10 * v118;
          *((_WORD *)v127 + 8) = v123 + v159;
          v128 = (unsigned __int16 *)(v127 + 16);
          LOWORD(v134) = v121 + v162;
          *(v128 - 3) = v134;
          v129 = v128 - 3;
          v130 = v120 + v162;
          *(v128 - 2) = v120 + v162;
          v131 = v128 - 2;
          v132 = v124 + v159;
          *(v128 - 1) = v124 + v159;
          v133 = v128 - 1;
          v134 = (unsigned __int16)v134;
          *(v128 - 4) = ((unsigned __int16)v134 + v130 + 1) >> 1;
          if (v158)
          {
            CGContextSetRGBStrokeColor(c, 0.0, 1.0, 0.0, 0.5);
            v135 = *v129;
            v190.origin.x = (double)v135;
            v136 = *v128;
            v190.origin.y = (double)(unint64_t)(v181[0].i64[1] - v136);
            v190.size.width = (double)(int)(*v131 - v135);
            v190.size.height = (double)(int)(v136 - *v133);
            CGContextStrokeRect(c, v190);
            v134 = *v129;
            v132 = *v133;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%i,%i},{%i,%i}}"), v134, v132, v122, v125);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "appendString:", v137);

          v138 = *v128;
          v139 = v114 * (float)((v111 - v138) / v111);
          if (v139 < 0.0)
            v139 = 0.0;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%2.4f,%2.4f},{%2.4f,%2.4f}}"), (float)(v117 * (float)((float)*v129 / v119)), v139, (float)(v117 * (float)((float)(*v131 - *v129) / v119)), (float)(v114 * (float)((float)(v138 - *v133) / (float)v111)));
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "appendString:", v140);

          if (v118 > 48)
            goto LABEL_199;
          ++v118;
        }
        v141 = (uint64_t *)v116[1];
        if (v141)
        {
          do
          {
            v142 = v141;
            v141 = (uint64_t *)*v141;
          }
          while (v141);
        }
        else
        {
          do
          {
            v142 = (uint64_t *)v116[2];
            v79 = *v142 == (_QWORD)v116;
            v116 = v142;
          }
          while (!v79);
        }
        v116 = v142;
      }
      while (v142 != (uint64_t *)&v179);
      if (!v118)
      {
LABEL_198:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%i,%i},{%i,%i}}"), 1, 1, 1, 1);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "appendString:", v143);

      }
LABEL_199:
      v187[0] = CFSTR("textBox");
      v187[1] = CFSTR("textBoxMM");
      v188[1] = &stru_1E4549388;
      v188[2] = v173;
      v187[2] = CFSTR("charBox");
      v187[3] = CFSTR("charBoxMM");
      v188[0] = &stru_1E4549388;
      v187[4] = CFSTR("charConfidence");
      v188[3] = v168;
      v188[4] = CFSTR("{{1,1},{1,1}}");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v188, v187, 5);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v144);

      std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v179);
      if (v171)
        operator delete(v171);
      std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v183.i64[0]);
      if (v20)
        operator delete(v20);
      v10 = v160 + 1;
      if (v160 + 1 == v150)
        goto LABEL_204;
    }
    v149 = var1;
    v171 = 0;
    v17 = 0;
    v163 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = (char *)a5->data + a5->rowBytes * var0 + var2;
    v172 = v16 + 1;
    v154 = v15;
    v164 = v15 + 1;
    v23 = 1;
    v161 = v16;
LABEL_8:
    if (v16 < 0)
    {
      v17 = v171;
      goto LABEL_111;
    }
    v167 = v21;
    __p = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v166 = v22;
LABEL_10:
    v27 = 0;
    v28 = -1;
    while (1)
    {
      if (*v22)
      {
        if (v28 == -1)
          v27 = 1;
        else
          ++v27;
        if (v28 == -1)
          v28 = v26;
      }
      else if ((v28 & 0x80000000) == 0)
      {
        if ((unint64_t)v24 >= v25)
        {
          v155 = (v24 - __p) >> 4;
          v29 = v155 + 1;
          if ((unint64_t)(v155 + 1) >> 60)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v25 - (_QWORD)__p) >> 3 > v29)
            v29 = (uint64_t)(v25 - (_QWORD)__p) >> 3;
          if (v25 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF0)
            v30 = 0xFFFFFFFFFFFFFFFLL;
          else
            v30 = v29;
          if (v30)
            v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v30);
          else
            v31 = 0;
          v32 = (_DWORD *)(v30 + 16 * v155);
          *v32 = 0;
          v32[1] = v167;
          v32[2] = v28;
          v32[3] = v27;
          if (v24 == __p)
          {
            v35 = (char *)(v30 + 16 * v155);
            v34 = __p;
          }
          else
          {
            v33 = v30 + 16 * v155;
            v34 = __p;
            do
            {
              v35 = (char *)(v33 - 16);
              *(_OWORD *)(v33 - 16) = *((_OWORD *)v24 - 1);
              v24 -= 16;
              v33 -= 16;
            }
            while (v24 != __p);
          }
          v25 = v30 + 16 * v31;
          v24 = (char *)(v32 + 4);
          if (v34)
          {
            v36 = v30 + 16 * v31;
            operator delete(v34);
            v25 = v36;
          }
          __p = v35;
        }
        else
        {
          *(_DWORD *)v24 = 0;
          *((_DWORD *)v24 + 1) = v167;
          *((_DWORD *)v24 + 2) = v28;
          *((_DWORD *)v24 + 3) = v27;
          v24 += 16;
        }
        ++v26;
        ++v22;
        if (v26 == v172)
        {
LABEL_62:
          v44 = __p;
          v45 = (int *)__p;
          if (__p != v24)
          {
            do
            {
              LODWORD(i) = 0;
              v46 = v171;
              if (v171 == v17)
                goto LABEL_74;
              do
              {
                v47 = v45[2];
                v48 = v46[2];
                if (v47 < v46[3] + v48 && v45[3] + v47 > v48)
                {
                  v49 = (int)i;
                  v50 = *v46;
                  if ((_DWORD)i)
                  {
                    if ((_DWORD)i != v50)
                    {
                      if ((int)i < v50)
                        *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *v46, (unsigned int *)v46)+ 8) = v49;
                      else
                        *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, (int)i, (unsigned int *)&i)+ 8) = v50;
                    }
                  }
                  else
                  {
                    LODWORD(i) = *v46;
                    *v45 = v50;
                  }
                }
                v46 += 4;
              }
              while (v46 != v17);
              if (!(_DWORD)i)
              {
LABEL_74:
                LODWORD(i) = v23;
                *v45 = v23;
                *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, (int)i, (unsigned int *)&i)+ 8) = v23++;
              }
              if ((unint64_t)v19 >= v18)
              {
                v51 = ((char *)v19 - (char *)v20) >> 4;
                v52 = v51 + 1;
                if ((unint64_t)(v51 + 1) >> 60)
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                if ((uint64_t)(v18 - (_QWORD)v20) >> 3 > v52)
                  v52 = (uint64_t)(v18 - (_QWORD)v20) >> 3;
                if (v18 - (unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0)
                  v53 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v53 = v52;
                if (v53)
                  v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v53);
                else
                  v54 = 0;
                v55 = (_OWORD *)(v53 + 16 * v51);
                *v55 = *(_OWORD *)v45;
                if (v19 == v20)
                {
                  v57 = v19;
                  v20 = (int *)(v53 + 16 * v51);
                }
                else
                {
                  v56 = (char *)(v53 + 16 * v51);
                  do
                  {
                    *((_OWORD *)v56 - 1) = *((_OWORD *)v19 - 1);
                    v56 -= 16;
                    v19 -= 4;
                  }
                  while (v19 != v20);
                  v57 = v20;
                  v20 = (int *)v56;
                }
                v18 = v53 + 16 * v54;
                v19 = (int *)(v55 + 1);
                if (v57)
                  operator delete(v57);
              }
              else
              {
                *(_OWORD *)v19 = *(_OWORD *)v45;
                v19 += 4;
              }
              v45 += 4;
            }
            while (v45 != (int *)v24);
            v44 = v24;
          }
          v59 = __p;
          v58 = (char *)v171;
          v60 = v44 - __p;
          v61 = (v44 - __p) >> 4;
          v62 = (uint64_t)v163;
          if (v61 > (v163 - (char *)v171) >> 4)
          {
            if (v171)
            {
              operator delete(v171);
              v62 = 0;
            }
            if ((v60 & 0x8000000000000000) != 0)
              goto LABEL_208;
            v63 = v62 >> 3;
            if (v62 >> 3 <= v61)
              v63 = (v44 - __p) >> 4;
            v64 = (unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v63;
            if (v64 >> 60)
LABEL_208:
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v64);
            v163 = &v65[16 * v66];
            v58 = v65;
            v59 = __p;
          }
          if (v44 != v59)
            memmove(v58, v59, v60);
          v171 = (int *)v58;
          v17 = (int *)&v58[16 * v61];
          v16 = v161;
          if (v59)
            operator delete(v59);
          v21 = v167;
          v22 = v166;
LABEL_111:
          ++v21;
          v22 += a5->rowBytes;
          if (v21 == v164)
          {
            v67 = (uint64_t *)v182;
            if (v182 != &v183)
            {
              do
              {
                v68 = (unsigned int *)(v67 + 4);
                v69 = *((_DWORD *)v67 + 8);
                v70 = v183.i64[0];
                if (!v183.i64[0])
                  goto LABEL_122;
                v71 = &v183;
                do
                {
                  v72 = (int8x16_t *)v70;
                  v73 = v71;
                  v74 = *(_DWORD *)(v70 + 28);
                  v75 = (uint64_t *)(v70 + 8);
                  if (v74 >= v69)
                  {
                    v75 = (uint64_t *)v72;
                    v71 = v72;
                  }
                  v70 = *v75;
                }
                while (v70);
                if (v71 == &v183)
                  goto LABEL_122;
                if (v74 < v69)
                  v72 = v73;
                if (v69 >= v72[1].i32[3])
                {
                  v69 = *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *((_DWORD *)v67 + 8), v68)+ 8);
                  v76 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *((_DWORD *)v67 + 7), (unsigned int *)v67 + 7);
                }
                else
                {
LABEL_122:
                  v76 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *((_DWORD *)v67 + 8), v68);
                }
                *((_DWORD *)v76 + 8) = v69;
                v77 = (int8x16_t *)v67[1];
                if (v77)
                {
                  do
                  {
                    v78 = v77;
                    v77 = (int8x16_t *)v77->i64[0];
                  }
                  while (v77);
                }
                else
                {
                  do
                  {
                    v78 = (int8x16_t *)v67[2];
                    v79 = v78->i64[0] == (_QWORD)v67;
                    v67 = (uint64_t *)v78;
                  }
                  while (!v79);
                }
                v67 = (uint64_t *)v78;
              }
              while (v78 != &v183);
            }
            v179 = 0;
            v180 = 0;
            v80 = v20;
            for (i = (uint64_t *)&v179; v80 != v19; v80 += 4)
            {
              LODWORD(v175) = 0;
              v81 = *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *v80, (unsigned int *)v80)+ 8);
              LODWORD(v175) = v81;
              v82 = v179;
              if (!v179)
                goto LABEL_141;
              v83 = &v179;
              do
              {
                v84 = v82;
                v85 = v83;
                v86 = *((_DWORD *)v82 + 7);
                v87 = v82 + 1;
                if (v86 >= v81)
                {
                  v87 = v84;
                  v83 = (_QWORD **)v84;
                }
                v82 = (_QWORD *)*v87;
              }
              while (v82);
              if (v83 == &v179)
                goto LABEL_141;
              if (v86 < v81)
                v84 = v85;
              if (v81 >= *((_DWORD *)v84 + 7))
              {
                v92 = (unsigned __int16 *)std::__tree<std::__value_type<int,__CCCharBox>,std::__map_value_compare<int,std::__value_type<int,__CCCharBox>,std::less<int>,true>,std::allocator<std::__value_type<int,__CCCharBox>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&i, v81, &v175);
                v93 = v92[17];
                v94 = v80[2];
                if (v94 < v93)
                  LOWORD(v93) = v80[2];
                v92[17] = v93;
                v95 = v92[18];
                v96 = v94 + v80[3] - 1;
                if (v96 > v95)
                  LOWORD(v95) = v96;
                v92[18] = v95;
                v97 = v92[19];
                v98 = v80[1];
                if (v98 < v97)
                  LOWORD(v97) = v80[1];
                v92[19] = v97;
                v99 = v92[20];
                if (v98 > v99)
                  LOWORD(v99) = v98;
                v92[20] = v99;
              }
              else
              {
LABEL_141:
                v88 = v80[2];
                v89 = v80[3];
                v90 = v80[1];
                v91 = std::__tree<std::__value_type<int,__CCCharBox>,std::__map_value_compare<int,std::__value_type<int,__CCCharBox>,std::less<int>,true>,std::allocator<std::__value_type<int,__CCCharBox>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&i, v81, &v175);
                *((_WORD *)v91 + 17) = v88;
                *((_WORD *)v91 + 18) = v89 + v88 - 1;
                *((_WORD *)v91 + 19) = v90;
                *((_WORD *)v91 + 20) = v90;
              }
            }
            if (v158)
            {
              v176 = 0;
              v177 = 0;
              v175 = (uint64_t *)&v176;
              if (v20 != v19)
              {
                v100 = 0;
                v101 = v20;
                do
                {
                  v174 = 0;
                  v102 = *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *v101, (unsigned int *)v101)+ 8);
                  v174 = v102;
                  v103 = v176;
                  if (!v176)
                    goto LABEL_165;
                  v104 = &v176;
                  do
                  {
                    v105 = v103;
                    v106 = v104;
                    v107 = *((_DWORD *)v103 + 7);
                    v108 = v103 + 1;
                    if (v107 >= v102)
                    {
                      v108 = v105;
                      v104 = (_QWORD **)v105;
                    }
                    v103 = (_QWORD *)*v108;
                  }
                  while (v103);
                  if (v104 == &v176)
                    goto LABEL_165;
                  if (v107 < v102)
                    v105 = v106;
                  if (v102 < *((_DWORD *)v105 + 7))
LABEL_165:
                    *((_BYTE *)std::__tree<std::__value_type<int,unsigned char>,std::__map_value_compare<int,std::__value_type<int,unsigned char>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned char>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v175, v102, &v174)+ 32) = v100++;
                  v109 = std::__tree<std::__value_type<int,unsigned char>,std::__map_value_compare<int,std::__value_type<int,unsigned char>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned char>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v175, v102, &v174);
                  memset((void *)(v181[0].i64[0] + v181[1].i64[1] * (v101[1] + v159) + 4 * (v101[2] + v162)), ~(5 * *((unsigned __int8 *)v109 + 32)), 4 * v101[3]);
                  v101 += 4;
                }
                while (v101 != v19);
              }
              LODWORD(var2) = v162;
              v15 = v154;
              var1 = v149;
LABEL_170:
              CGContextSetRGBStrokeColor(c, 1.0, 0.0, 0.0, 0.5);
              v189.origin.x = (double)var2;
              v189.origin.y = (double)(v181[0].i64[1] - (unint64_t)var1);
              v189.size.width = (double)v16;
              v189.size.height = (double)v15;
              CGContextStrokeRect(c, v189);
              std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v176);
            }
            else
            {
              v15 = v154;
            }
            goto LABEL_172;
          }
          goto LABEL_8;
        }
        goto LABEL_10;
      }
      ++v26;
      ++v22;
      if (v172 == v26)
      {
        if ((v28 & 0x80000000) == 0)
        {
          if ((unint64_t)v24 >= v25)
          {
            v37 = (v24 - __p) >> 4;
            v38 = v37 + 1;
            if ((unint64_t)(v37 + 1) >> 60)
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v25 - (_QWORD)__p) >> 3 > v38)
              v38 = (uint64_t)(v25 - (_QWORD)__p) >> 3;
            if (v25 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF0)
              v39 = 0xFFFFFFFFFFFFFFFLL;
            else
              v39 = v38;
            if (v39)
              v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v39);
            v40 = (_DWORD *)(v39 + 16 * v37);
            *v40 = 0;
            v40[1] = v167;
            v40[2] = v28;
            v40[3] = v27;
            if (v24 == __p)
            {
              v43 = (char *)(v39 + 16 * v37);
              v42 = __p;
            }
            else
            {
              v41 = v39 + 16 * v37;
              v42 = __p;
              do
              {
                v43 = (char *)(v41 - 16);
                *(_OWORD *)(v41 - 16) = *((_OWORD *)v24 - 1);
                v24 -= 16;
                v41 -= 16;
              }
              while (v24 != __p);
            }
            v24 = (char *)(v40 + 4);
            if (v42)
              operator delete(v42);
            __p = v43;
          }
          else
          {
            *(_DWORD *)v24 = 0;
            *((_DWORD *)v24 + 1) = v167;
            *((_DWORD *)v24 + 2) = v28;
            *((_DWORD *)v24 + 3) = v27;
            v24 += 16;
          }
        }
        goto LABEL_62;
      }
    }
  }
LABEL_204:
  if (v158)
  {
    -[VNCCTextDetector debugFilename](v153, "debugFilename");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "stringByAppendingPathComponent:", CFSTR("connectedComponents.png"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    v147 = objc_retainAutorelease(v146);
    v148 = (const char *)objc_msgSend(v147, "UTF8String");
    v186 = 0;
    v184 = v181[1].i64[1];
    v185 = 7;
    v183 = vextq_s8(*(int8x16_t *)((char *)v181 + 8), *(int8x16_t *)((char *)v181 + 8), 8uLL);
    v182 = (int8x16_t *)v181[0].i64[0];
    saveImage(v148, (uint64_t)&v182);
    CGContextRelease(c);

  }
  -[VNCCTextDetector _freeVImage:](v153, "_freeVImage:", v181);

}

- (void)groupEndpoints:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4
{
  __CCBox *v4;

  *(_DWORD *)&a3->var2 = *(_DWORD *)&a3[1].var2;
  v4 = &a3[*a4];
  v4[-1].var2 = v4[-2].var2;
  v4[-1].var3 = v4[-2].var3;
}

- (void)computeIndependentTopAndBottomComponents:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4
{
  unsigned int v7;
  int64_t v8;
  unint64_t v9;
  unsigned __int16 *p_var2;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  int64_t v17;
  _BOOL4 v20;
  int v21;
  unsigned __int16 v22;
  unsigned int v23;
  _BOOL4 v25;
  int v26;
  unsigned __int16 v27;
  _BOOL4 v28;
  unsigned __int16 v29;
  _BOOL4 v30;

  v7 = -[VNCCTextDetector maxBoxWidth](self, "maxBoxWidth");
  if (*a4 - 1 >= 2)
  {
    v8 = v7;
    v9 = *a4 - 2;
    p_var2 = &a3[1].var2;
    while (1)
    {
      v11 = *p_var2;
      v12 = *(p_var2 - 4);
      v13 = p_var2[4];
      v14 = p_var2[1] + v11;
      v15 = *(p_var2 - 3) + v12;
      v16 = p_var2[5] + v13;
      v17 = p_var2[2] - (unint64_t)(unsigned __int16)(*(p_var2 - 1) + *(p_var2 - 2));
      if (v11 > v12 && v11 > v13)
        break;
      v20 = v11 >= v12 || v11 >= v13;
      v21 = !v20;
      if (v20)
        v22 = 0;
      else
        v22 = *(p_var2 - 4);
      if (!v20 && v17 < v8)
        goto LABEL_23;
LABEL_24:
      v23 = (unsigned __int16)(*(p_var2 - 3) + v12);
      if (v23 < v14 && (unsigned __int16)(p_var2[1] + v11) > v16)
      {
        if (v17 >= v8)
          goto LABEL_42;
LABEL_40:
        v27 = llround((double)(int)(v23 + v16) * 0.5);
        v26 = 1;
        goto LABEL_41;
      }
LABEL_29:
      v25 = (unsigned __int16)(p_var2[1] + v11) >= v15
         || (unsigned __int16)(p_var2[1] + v11) >= v16;
      v26 = !v25;
      if (v25)
        v27 = 0;
      else
        v27 = *(p_var2 - 3) + v12;
      if (!v25 && v17 < v8)
        goto LABEL_40;
LABEL_41:
      if (v17 >= v8)
      {
LABEL_42:
        v28 = 1;
        goto LABEL_50;
      }
      v28 = v21 != 0;
      if (v21 && !v26)
      {
        *p_var2 = v22;
        v29 = v14 - v22;
LABEL_52:
        p_var2[1] = v29;
        goto LABEL_53;
      }
      v30 = v26 != 0;
      if (!v21 && v26)
      {
        p_var2[1] = v27 - v11;
        v30 = 1;
      }
      LOWORD(v12) = v22;
      v15 = v27;
      if (!v30)
        goto LABEL_53;
LABEL_50:
      if (v28)
      {
        *p_var2 = v12;
        v29 = v15 - v12;
        goto LABEL_52;
      }
LABEL_53:
      p_var2 += 4;
      if (!--v9)
        goto LABEL_54;
    }
    if (v17 >= v8)
    {
      v23 = (unsigned __int16)(*(p_var2 - 3) + v12);
      v21 = 1;
      if (v23 >= v14)
      {
        v22 = *(p_var2 - 4);
      }
      else
      {
        v22 = *(p_var2 - 4);
        if ((unsigned __int16)(p_var2[1] + v11) > v16)
          goto LABEL_42;
      }
      goto LABEL_29;
    }
LABEL_23:
    v22 = vcvtmd_s64_f64((double)(int)(v13 + v12) * 0.5);
    v21 = 1;
    goto LABEL_24;
  }
LABEL_54:
  -[VNCCTextDetector groupEndpoints:finalCharBoxCoordCount:](self, "groupEndpoints:finalCharBoxCoordCount:", a3, a4);
}

- (int)computeDependentTopAndBottomComponents:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4
{
  unsigned __int16 *v4;
  int v5;
  unsigned int v9;
  unint64_t v10;
  unsigned __int16 *v11;
  unsigned __int16 *p_var3;
  unsigned __int16 *v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  int64_t v21;
  unsigned int v22;
  int v24;
  int v25;
  BOOL v27;
  BOOL v28;
  int v29;
  __int16 v30;
  unsigned __int16 v31;
  __int16 v32;
  unsigned __int16 v33;

  v4 = 0;
  v5 = 0;
  if (a3 && a4)
  {
    v4 = (unsigned __int16 *)malloc_type_malloc(0x640uLL, 0x100004000313F17uLL);
    if (v4)
    {
      v9 = -[VNCCTextDetector maxBoxWidth](self, "maxBoxWidth");
      memcpy(v4, a3, 8 * *a4);
      if (*a4 - 1 >= 2)
      {
        v10 = *a4 - 2;
        v11 = v4 + 6;
        p_var3 = &a3[1].var3;
        v13 = v4 + 6;
        while (1)
        {
          v14 = *v11;
          v15 = *(v11 - 4);
          v17 = v13[4];
          v13 += 4;
          v16 = v17;
          v18 = v11[1] + v14;
          v19 = *(v11 - 3) + v15;
          v20 = v11[5] + v17;
          v21 = v11[2] - (unint64_t)(unsigned __int16)(*(v11 - 1) + *(v11 - 2));
          v22 = v17 + 5;
          if (v15 + 5 >= v14 || v22 >= v14)
            break;
          v24 = v19;
          v25 = v20;
          if (v19 + 5 >= v18 || v20 + 5 >= v18)
            break;
          if (v21 < v9)
            goto LABEL_36;
LABEL_38:
          *(p_var3 - 1) = v15;
          *p_var3 = v19 - v15;
LABEL_39:
          p_var3 += 4;
          v11 = v13;
          if (!--v10)
            goto LABEL_40;
        }
        v27 = v15 - 5 <= (int)v14 || v16 - 5 <= (int)v14;
        if (v27 || (v24 = v19, v19 - 5 <= v18))
        {
          v30 = 0;
          v31 = 0;
          v29 = 1;
LABEL_30:
          if (v21 < v9)
          {
            LOWORD(v15) = v30;
            v19 = v31;
          }
          if (v29 && v21 < v9)
            goto LABEL_39;
          goto LABEL_38;
        }
        v25 = v20;
        v28 = v20 - 5 <= v18;
        v29 = v28;
        if (v28)
          v30 = 0;
        else
          v30 = v15;
        if (v28)
          v31 = 0;
        else
          v31 = v19;
        if (v28 || v21 >= v9)
          goto LABEL_30;
LABEL_36:
        v32 = vcvtmd_s64_f64((double)(v16 + v15) * 0.5);
        v33 = llround((double)(v25 + v24) * 0.5);
        if (v21 < v9)
        {
          LOWORD(v15) = v32;
          v19 = v33;
        }
        goto LABEL_38;
      }
LABEL_40:
      -[VNCCTextDetector groupEndpoints:finalCharBoxCoordCount:](self, "groupEndpoints:finalCharBoxCoordCount:", a3, a4);
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
  }
  free(v4);
  return v5;
}

- (int)_generateCRCharBoxInformation_TrackBox:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4
{
  int v4;
  _BYTE *v5;
  int v9;
  unint64_t v10;
  double v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  float v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  unsigned __int16 *p_var3;
  unsigned __int8 v19;
  int v20;
  int v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  __int16 v26;
  unsigned __int16 v27;
  __CCBox *v28;
  int var2;
  unsigned __int16 v30;
  unsigned __int16 v31;
  int v32;
  __CCBox *v33;
  int v34;
  unsigned __int16 v35;
  __CCBox *v36;
  int v37;
  __CCBox *v38;
  int v39;
  float v40;
  unsigned int v41;
  float v42;
  unsigned int v43;
  uint64_t v45;
  int v46;
  int v47;
  int v48;

  v4 = 0;
  v5 = 0;
  if (a3 && a4)
  {
    v5 = malloc_type_calloc(0xC8uLL, 1uLL, 0x100004077774924uLL);
    if (v5)
    {
      if (*a4 < 3)
      {
LABEL_73:
        v4 = 1;
        goto LABEL_74;
      }
      v9 = -[VNCCTextDetector computeDependentTopAndBottomComponents:finalCharBoxCoordCount:](self, "computeDependentTopAndBottomComponents:finalCharBoxCoordCount:", a3, a4);
      if (v9 == 1)
      {
        -[VNCCTextDetector computeIndependentTopAndBottomComponents:finalCharBoxCoordCount:](self, "computeIndependentTopAndBottomComponents:finalCharBoxCoordCount:", a3, a4);
        if (*a4)
        {
          v10 = 0;
          do
            v5[v10++] = 1;
          while (*a4 > v10);
          v11 = (double)*a4;
        }
        else
        {
          v11 = 0.0;
        }
        v12 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
        v13 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
        v15 = *a4;
        if (floor((double)*a4 * 0.5) < v11)
        {
          v16 = (unsigned __int16)(v12 - v13);
          v14 = 0.2;
          do
          {
            if (v15)
            {
              v17 = 0;
              p_var3 = &a3->var3;
              v19 = v15;
              do
              {
                v20 = *p_var3;
                p_var3 += 4;
                v21 = v16 - v20;
                if ((int)(v16 - v20) < 0)
                  v21 = -v21;
                if ((float)(v14 * (float)v16) > (float)v21)
                {
                  v5[v17] = 0;
                  if (v19)
                    --v19;
                  else
                    v19 = 0;
                  v15 = *a4;
                }
                ++v17;
              }
              while (v15 > v17);
            }
            else
            {
              v19 = 0;
            }
            v14 = v14 + 0.1;
          }
          while (floor((double)v15 * 0.5) < (double)v19);
        }
        v22 = v15 - 1;
        if (v15 - 1 >= 2)
        {
          v23 = 0;
          v24 = 1;
          do
          {
            if (v23 >= -1)
              v25 = -1;
            else
              v25 = v23;
            if (v5[v24] == 1)
            {
              v26 = v24;
              while (1)
              {
                v27 = v26 - 1;
                if (((v26 - 1) & 0x8000) != 0)
                  break;
                --v26;
                if (!v5[v27])
                {
                  v28 = &a3[v27];
                  var2 = v28->var2;
                  v30 = v28->var3 + var2;
                  v25 = v26;
                  goto LABEL_39;
                }
              }
              var2 = 0;
              v30 = 0;
LABEL_39:
              v31 = v24;
              do
              {
                v32 = ++v31;
                if (v15 <= v31)
                {
                  v34 = 0;
                  v35 = 0;
                  if (var2)
                    goto LABEL_45;
                  goto LABEL_48;
                }
              }
              while (v5[v31]);
              v33 = &a3[v31];
              v34 = v33->var2;
              v35 = v33->var3 + v34;
              if (!var2)
                goto LABEL_48;
LABEL_45:
              if (!v34)
              {
                v36 = &a3[v24];
                v36->var2 = var2;
                LOWORD(v37) = v30 - var2;
LABEL_47:
                v36->var3 = v37;
                goto LABEL_51;
              }
LABEL_48:
              if (var2 || !v34)
              {
                if (var2 && v34)
                {
                  v39 = v32 - v25;
                  v40 = (float)((v35 - v30) / v39);
                  v36 = &a3[v24];
                  v41 = (unsigned __int16)(v36->var3 + v36->var2);
                  LOWORD(v14) = a3[v25].var2;
                  v42 = (float)((int)v24 - v25);
                  v14 = (float)LODWORD(v14);
                  v43 = (int)(float)(roundf(v42 * (float)((v34 - var2) / v39)) + v14);
                  v36->var2 = v43;
                  v37 = (int)(float)((float)(roundf(v42 * v40) + (float)v41) - (float)v43);
                  goto LABEL_47;
                }
              }
              else
              {
                v38 = &a3[v24];
                v38->var2 = v34;
                v38->var3 = v35 - v34;
              }
LABEL_51:
              v5[v24] = 0;
              v15 = *a4;
            }
            ++v24;
            v22 = v15 - 1;
            ++v23;
          }
          while (v15 - 1 > v24);
        }
        if (*v5 == 1 && v15 >= 2)
        {
          v45 = 1;
          v46 = 1;
          while (v5[v45])
          {
            v45 = (unsigned __int16)++v46;
            if (v15 <= (unsigned __int16)v46)
              goto LABEL_67;
          }
          *(_DWORD *)&a3->var2 = *(_DWORD *)&a3[v45].var2;
        }
LABEL_67:
        v4 = 1;
        if (v5[v22] == 1)
        {
          v47 = (__int16)(v15 - 2);
          if ((v47 & 0x80000000) == 0)
          {
            while (v5[(unsigned __int16)v47])
            {
              v48 = (__int16)v47;
              LOWORD(v47) = v47 - 1;
              if (v48 < 1)
                goto LABEL_74;
            }
            *(_DWORD *)&a3[v22].var2 = *(_DWORD *)&a3[(unsigned __int16)v47].var2;
            goto LABEL_73;
          }
        }
      }
      else
      {
        v4 = v9;
      }
    }
    else
    {
      v4 = 0;
    }
  }
LABEL_74:
  free(v5);
  return v4;
}

- (int)computePulseVectorSum:(char *)a3 start:(unsigned __int16)a4 stop:(unsigned __int16)a5 imageHeight:(unint64_t)a6 imageWidth:(unint64_t)a7 bottomHeight:(unsigned __int16)a8 topHeight:(unsigned __int16)a9
{
  int v12;
  unsigned int v13;
  int v16;
  unsigned __int16 v17;
  void *v18;
  float v19;
  unsigned __int16 v20;
  uint64_t v21;
  void *v22;
  int v23;
  char *v24;
  float *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  double v30;
  double v31;
  double v32;
  int v33;
  uint64_t v35;
  uint64_t v36;
  int v37;

  v12 = a5;
  v13 = a4;
  v16 = a5 - a4;
  v17 = a8 - a9 + 1;
  v37 = a5 - a4 + 1;
  v18 = malloc_type_calloc(v37 * v17, 4uLL, 0x100004052888210uLL);
  if (v18)
  {
    if (a6 - 5 >= (unsigned __int16)(a8 + 1))
      v20 = v17;
    else
      v20 = a6 - 5 - a9;
    v21 = v20;
    v22 = v18;
    if (v20)
    {
      v23 = 0;
      v24 = &a3[a9 * a7];
      v25 = (float *)v18;
      do
      {
        v26 = v13;
        if ((v16 & 0x80000000) == 0)
        {
          do
          {
            LOBYTE(v19) = v24[v26];
            v19 = (float)LODWORD(v19);
            *v25++ = v19;
            ++v26;
          }
          while (v12 + 1 != (_DWORD)v26);
        }
        v24 += a7;
        ++v23;
      }
      while (v23 != (_DWORD)v21);
      v27 = 0;
      do
      {
        -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 0x40000, v27);
        v27 = (v27 + 1);
      }
      while ((_DWORD)v21 != (_DWORD)v27);
    }
    v28 = -[VNCCTextDetector minHeight](self, "minHeight");
    v29 = -[VNCCTextDetector maxHeight](self, "maxHeight");
    WORD2(v36) = v37;
    HIDWORD(v35) = 1;
    LODWORD(v36) = v37;
    LOWORD(v35) = v37;
    LODWORD(v30) = 1025758986;
    LODWORD(v31) = 1017370378;
    LODWORD(v32) = 1005961871;
    v33 = -[VNCCTextDetector _getFilterResultOut:defaultRows:bufferHeight:minHeight:maxHeight:startRange:stopRange:startMaxFind:stopMaxFind:bytesPerRow:thresholdSet:sampleImageAddressRef:sampleImageFloatAddressRef:pulseVectorFlag:](self, "_getFilterResultOut:defaultRows:bufferHeight:minHeight:maxHeight:startRange:stopRange:startMaxFind:stopMaxFind:bytesPerRow:thresholdSet:sampleImageAddressRef:sampleImageFloatAddressRef:pulseVectorFlag:", 0, 480, v21, v28, v29, 0, v30, v31, v32, v35, v36, a3, v22, 0x40000);
  }
  else
  {
    v33 = 0;
    v22 = 0;
  }
  free(v22);
  return v33;
}

- (__CCRange)tightenBox:(vImage_Buffer *)a3 startTop:(unsigned __int16)a4 startBottom:(unsigned __int16)a5 startPosition:(unsigned __int16)a6 stopPosition:(unsigned __int16)a7 imageHeight:(unint64_t)a8 halfWalk:(unsigned __int16)a9
{
  unsigned __int16 v9;
  unint64_t v10;
  char *data;
  __int16 v12;
  size_t rowBytes;
  unint64_t v14;
  char *v15;
  __int16 v16;
  unsigned __int16 v17;
  __int16 v18;
  char *v19;
  unint64_t v20;
  __int16 v21;
  unsigned __int16 v22;
  __int16 v23;
  char *v24;
  unint64_t v25;
  __int16 v26;
  __int16 v27;
  size_t v28;
  unint64_t v29;
  char *v30;
  __int16 v31;
  uint64_t v32;
  unsigned __int16 v33;
  __int16 v34;
  unsigned __int8 *v35;
  unint64_t v36;
  __int16 v37;
  uint64_t v38;
  unsigned __int16 v39;
  __int16 v40;
  unsigned __int8 *v41;
  unint64_t v42;
  __int16 v43;

  v9 = a4;
  if (a4)
  {
    if (a5 > a4 && (a4 + 1) < a8)
    {
      v10 = (a5 + 1);
      if (v10 < a8)
      {
        data = (char *)a3->data;
        if (a6 > a7)
          goto LABEL_17;
        v12 = 0;
        rowBytes = a3->rowBytes;
        v14 = a7 - (unint64_t)a6 + 1;
        v15 = &data[rowBytes * a4 - 1 + a6];
        do
        {
          v16 = *v15++;
          v12 += v16;
          --v14;
        }
        while (v14);
        if (v12)
        {
          if (a9)
          {
            v17 = 1;
            while (a4 != v17)
            {
              v18 = 0;
              v19 = &data[a6 - 1 + rowBytes * (a4 - (unint64_t)v17)];
              v20 = a7 - (unint64_t)a6 + 1;
              do
              {
                v21 = *v19++;
                v18 += v21;
                --v20;
              }
              while (v20);
              if (!v18)
              {
                v9 = a4 - v17;
                goto LABEL_28;
              }
              if (a9 < ++v17)
                goto LABEL_28;
            }
          }
        }
        else
        {
LABEL_17:
          if (a9)
          {
            v22 = 1;
            while (a4 + v22 + 1 < a8)
            {
              if (a6 <= a7)
              {
                v23 = 0;
                v24 = &data[a6 - 1 + a3->rowBytes * (a4 + (unint64_t)v22)];
                v25 = a7 - (unint64_t)a6 + 1;
                do
                {
                  v26 = *v24++;
                  v23 += v26;
                  --v25;
                }
                while (v25);
                if (v23)
                {
                  v9 = a4 + v22 - 1;
                  goto LABEL_28;
                }
              }
              if (a9 < ++v22)
                goto LABEL_28;
            }
          }
        }
        if (a6 > a7)
          goto LABEL_41;
LABEL_28:
        v27 = 0;
        v28 = a3->rowBytes;
        v29 = a7 - (unint64_t)a6 + 1;
        v30 = &data[v28 * a5 - 1 + a6];
        do
        {
          v31 = *v30++;
          v27 += v31;
          --v29;
        }
        while (v29);
        if (v27)
        {
          if (a9 && (a5 + 2) < a8)
          {
            v32 = (uint64_t)&data[a6 - 1];
            v33 = 1;
            while (1)
            {
              v34 = 0;
              v35 = (unsigned __int8 *)(v32 + v28 * (a5 + (unint64_t)v33));
              v36 = a7 - (unint64_t)a6 + 1;
              do
              {
                v37 = *v35++;
                v34 += v37;
                --v36;
              }
              while (v36);
              if (!v34)
                break;
              if (++v33 > a9 || v10 + v33 >= a8)
                return (__CCRange)(v9 | (a5 << 16));
            }
            a5 += v33;
          }
        }
        else
        {
LABEL_41:
          if (a9)
          {
            v38 = (uint64_t)&data[a6 - 1];
            v39 = 1;
            while (a5 != v39)
            {
              if (a6 <= a7)
              {
                v40 = 0;
                v41 = (unsigned __int8 *)(v38 + a3->rowBytes * (a5 - (unint64_t)v39));
                v42 = a7 - (unint64_t)a6 + 1;
                do
                {
                  v43 = *v41++;
                  v40 += v43;
                  --v42;
                }
                while (v42);
                if (v40)
                {
                  a5 = a5 - v39 + 1;
                  return (__CCRange)(v9 | (a5 << 16));
                }
              }
              if (a9 < ++v39)
                return (__CCRange)(v9 | (a5 << 16));
            }
          }
        }
      }
    }
  }
  return (__CCRange)(v9 | (a5 << 16));
}

- (void)_generateCRCharBoxInformation_spaceBoxRemovalTightenBox:(vImage_Buffer *)a3 singleVotingImageAddressRef:(char *)a4 adaptOut:(vImage_Buffer *)a5 textOut:(vImage_Buffer *)a6 zcStartLeft:(unsigned __int16)a7 zcStopRight:(unsigned __int16)a8 finalCoordinatesForStub:(__CCBox *)a9 finalCoordinatesForStubRevised:(__CCBox *)a10 finalCharBoxCoordCount:(unint64_t *)a11 useLowLightEnhancement:(unsigned __int8)a12
{
  int v12;
  int v13;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  float v20;
  double v21;
  unsigned __int16 v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  double v27;
  unsigned __int16 v29;
  int v30;
  int v31;
  int v32;
  unsigned __int16 height;
  float v34;
  unsigned __int16 v35;
  int v36;
  vImagePixelCount v37;
  vImagePixelCount v38;
  unsigned int v39;
  uint64_t v40;
  __int16 v41;
  unsigned __int16 v42;
  __int16 v43;
  __int16 v44;
  unsigned __int16 v45;
  unsigned __int16 v46;
  unsigned __int16 v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  __int16 v58;
  float v59;
  float v60;
  float v61;
  unsigned __int16 v62;
  unsigned __int16 v63;
  unsigned __int16 v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unint64_t *v69;
  _BOOL4 v71;
  _BOOL4 v72;
  __int16 v73;
  __int128 v74;
  _OWORD *v75;
  __int128 v76;
  __CCRange v77;
  unsigned __int16 var0;
  unsigned int v79;
  unint64_t v80;
  __CCBox *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int16 v85;
  unsigned __int16 v86;
  unsigned __int16 v87;
  unsigned __int16 v88;
  unsigned __int16 v89;
  unsigned __int16 v90;
  _OWORD v94[2];
  _OWORD v95[3];

  v12 = a8;
  v13 = a7;
  v16 = a7;
  v17 = a8;
  if (a7 - 2 <= a8)
    v18 = a8;
  else
    v18 = a7 - 2;
  while (1)
  {
    v19 = v16 - 2;
    if (v16 - 2 >= v17)
      break;
    v20 = *(-[VNCCCharBoxContext floatVectorSumProd](self->_charBoxContext, "floatVectorSumProd") + 4 * v16 - 4);
    v21 = (float)(v20
                - *(-[VNCCCharBoxContext floatVectorSumProd](self->_charBoxContext, "floatVectorSumProd") + 4 * v16++ - 8));
    if (v21 > 0.005)
    {
      v18 = v19;
      break;
    }
  }
  if (v18 <= v13 || v18 == v12 - 1)
    v23 = v13;
  else
    v23 = v18;
  if (v12 + 2 >= v23)
    v24 = v23;
  else
    v24 = (v12 + 2);
  while (1)
  {
    v25 = v17 + 2;
    if (v17 + 2 <= v23)
      break;
    v26 = (-[VNCCCharBoxContext floatVectorSumProd](self->_charBoxContext, "floatVectorSumProd") + 4 * v17)[4];
    v27 = (float)(v26
                - (-[VNCCCharBoxContext floatVectorSumProd](self->_charBoxContext, "floatVectorSumProd") + 4 * v17--)[8]);
    if (v27 > 0.005)
    {
      v24 = v25;
      break;
    }
  }
  if ((int)v24 >= v12 || (_DWORD)v24 == v23 + 1)
    v29 = v12;
  else
    v29 = v24;
  v30 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
  if (v30 - -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop") <= 34
    && (v31 = v29, v29 - v23 >= -[VNCCTextDetector minBoxWidth](self, "minBoxWidth") - 1)
    || (v32 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom"),
        v32 - -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop") >= 35)
    && (v31 = v29, v29 - v23 >= -[VNCCTextDetector minBoxWidth](self, "minBoxWidth") + 1))
  {
    height = a3->height;
    v34 = (double)(v31 + v23) * 0.5;
    v35 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
    v88 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
    v86 = v35;
    if (-[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop") >= 0x15)
      v36 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop") - 20;
    else
      LOWORD(v36) = 1;
    LODWORD(v24) = llroundf(v34);
    v37 = a3->height;
    if (v37 >= (unint64_t)-[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom")
              + 20)
      LODWORD(v38) = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom") + 20;
    else
      v38 = a3->height;
    LOWORD(v83) = v36;
    v39 = (unsigned __int16)v38;
    -[VNCCTextDetector computePulseVectorSum:start:stop:imageHeight:imageWidth:bottomHeight:topHeight:](self, "computePulseVectorSum:start:stop:imageHeight:imageWidth:bottomHeight:topHeight:", a4, v23, v29, v83);
    v85 = v36;
    if (v39 > (unsigned __int16)v36)
    {
      v40 = 0;
      v41 = 0;
      while (1)
      {
        if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x40000, (v40 + 1)))
        {
          if (!-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x40000, v40))
            v41 = v40 + 1;
        }
        else
        {
          if (v41)
          {
            v43 = v40;
            v42 = height;
            goto LABEL_47;
          }
          v41 = 0;
        }
        v40 = (v40 + 1);
        if (v39 - (unsigned __int16)v36 == (_DWORD)v40)
          goto LABEL_46;
      }
    }
    v41 = 0;
LABEL_46:
    v42 = height;
    v43 = height;
LABEL_47:
    v44 = v43;
    v90 = v29;
    if (-[VNCCCharBoxContext charboxROIFullVectorRowStart](self->_charBoxContext, "charboxROIFullVectorRowStart")[2 * v24])
    {
      v45 = -[VNCCCharBoxContext charboxROIFullVectorRowStart](self->_charBoxContext, "charboxROIFullVectorRowStart")[2 * v24];
      v46 = -[VNCCCharBoxContext charboxROIFullVectorHeight2](self->_charBoxContext, "charboxROIFullVectorHeight2")[2 * v24]
          + v45;
    }
    else
    {
      v45 = 0;
      v46 = v42;
    }
    v47 = v86 - v88;
    v89 = v44 - v41;
    if (-[VNCCCharBoxContext filterWalkUpDownCount](self->_charBoxContext, "filterWalkUpDownCount") < 3
      || (-[VNCCCharBoxContext posLL](self->_charBoxContext, "posLL"),
          v49 = v48,
          -[VNCCCharBoxContext posUL](self->_charBoxContext, "posUL"),
          (float)(v49 - v50) <= 0.0)
      || (-[VNCCCharBoxContext posLR](self->_charBoxContext, "posLR"),
          v52 = v51,
          -[VNCCCharBoxContext posUR](self->_charBoxContext, "posUR"),
          (float)(v52 - v53) <= 0.0))
    {
      v58 = 1;
    }
    else
    {
      -[VNCCCharBoxContext mTop](self->_charBoxContext, "mTop");
      v55 = v54;
      v56 = (float)v24;
      -[VNCCCharBoxContext bTop](self->_charBoxContext, "bTop");
      v58 = vcvtms_s32_f32(v57 + (float)(v55 * (float)v24));
      -[VNCCCharBoxContext mBottom](self->_charBoxContext, "mBottom");
      v60 = v59;
      -[VNCCCharBoxContext bBottom](self->_charBoxContext, "bBottom");
      v42 = llroundf(v61 + (float)(v60 * v56));
    }
    v87 = v42;
    v62 = v42 - v58;
    v63 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
    v64 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
    v65 = v47 - v89;
    if ((v65 & 0x80000000) != 0)
      v65 = v89 - v47;
    v66 = 3 * v47;
    v67 = v47 - (unsigned __int16)(v46 - v45);
    if ((v67 & 0x80000000) != 0)
      v67 = (unsigned __int16)(v46 - v45) - v47;
    v68 = v47 - v62;
    if ((v68 & 0x80000000) != 0)
      v68 = v62 - v47;
    if (v65 >= v66 || v65 >= v67 || v65 >= v68)
    {
      v69 = a11;
      if (v67 >= v66 || v67 >= v65 || v67 >= v68)
      {
        v71 = v68 < v66 && v68 < v65;
        v72 = v68 < v67;
        if (v72 && v71)
          v45 = v58;
        else
          v45 = v63;
        if (v72 && v71)
          v46 = v87;
        else
          v46 = v64;
      }
    }
    else
    {
      v45 = v85 + v41 - 1;
      v46 = v45 + v89;
      v69 = a11;
    }
    v73 = vcvtmd_s64_f64((double)(-[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom")- -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop"))* 0.5);
    if (a12)
    {
      v74 = *(_OWORD *)&a5->width;
      v94[0] = *(_OWORD *)&a5->data;
      v94[1] = v74;
      v75 = v94;
    }
    else
    {
      v76 = *(_OWORD *)&a6->width;
      v95[0] = *(_OWORD *)&a6->data;
      v95[1] = v76;
      v75 = v95;
    }
    LOWORD(v84) = v73;
    v77 = (__CCRange)-[VNCCTextDetector tightenBox:startTop:startBottom:startPosition:stopPosition:imageHeight:halfWalk:](self, "tightenBox:startTop:startBottom:startPosition:stopPosition:imageHeight:halfWalk:", v75, v45, v46, v23, v90, a3->height, v84);
    var0 = v77.var0;
    v79 = HIWORD(*(unsigned int *)&v77) - v77.var0;
    if (v79 > -[VNCCTextDetector minHeight](self, "minHeight"))
    {
      v80 = *v69;
      v81 = &a9[*v69];
      v81->var0 = v23;
      v81->var1 = v90 - v23;
      v81->var2 = var0;
      v81->var3 = v79;
      a10[v80] = *v81;
      v82 = *v69;
      if (*v69 != 199)
        ++v82;
      *v69 = v82;
    }
  }
}

- (void)_generateCRCharBoxInformation_spaceBoxRemovalTruthFilter:(float *)a3 magicThresh:(float *)a4 zcStartLeft:(unsigned __int16)a5 zcStopRight:(unsigned __int16)a6 isSpaceBoxAccepted:(BOOL *)a7 histCompliancePercent:(float *)a8 useLowLightEnhancement:(unsigned __int8)a9
{
  double v9;
  float v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  uint64_t v16;
  __int16 v17;
  int v19;
  int v20;
  int v21;
  int v22;
  float v23;
  _BOOL4 v24;
  _BOOL4 v25;
  BOOL v26;
  _BOOL4 v27;
  float *v28;

  v11 = sqrtf(*a3);
  v12 = *a4;
  HIDWORD(v13) = -1078355559;
  v14 = v12 + -0.1;
  v15 = v12 + -0.1 > v11 && v11 > 4.0;
  if (v15)
  {
    v16 = a5;
    LODWORD(v12) = 0;
    LODWORD(v13) = 0;
    LODWORD(v9) = 0;
    v17 = a6 - a5;
    if (a6 >= a5)
    {
      v28 = a8;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = a6 + 1;
      do
      {
        v19 += -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 4096, v16, v12, v13, v9);
        v21 += -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 1, v16);
        -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 16, v16);
        v20 += -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 2, v16);
        -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 32, v16);
        v16 = (v16 + 1);
      }
      while (v22 != (_DWORD)v16);
      *(float *)&v9 = (float)(unsigned __int16)v19;
      *(float *)&v12 = (float)(unsigned __int16)v21;
      *(float *)&v13 = (float)(unsigned __int16)v20;
      a8 = v28;
    }
    v23 = (float)(__int16)(v17 + 1);
    v24 = (float)(*(float *)&v9 / v23) > 0.9;
    if ((float)(*(float *)&v12 / v23) > 0.9)
      v24 = 1;
    if ((float)(*(float *)&v13 / v23) > 0.9)
      v24 = 1;
  }
  else
  {
    v24 = 0;
  }
  v25 = v11 > 4.0;
  if (v14 > v11)
    v25 = 0;
  if (a9)
  {
    if (v25)
      v26 = 1;
    else
      v26 = v24 && v15;
  }
  else
  {
    v27 = v24 && v15;
    v26 = (v25 || v27) && *a8 > 0.1;
  }
  *a7 = v26;
}

- (void)_generateCRCharBoxInformation_spaceBoxRemovalHistogram:(vImage_Buffer *)a3 zcStartLeft:(unsigned __int16)a4 zcStopRight:(unsigned __int16)a5 rowStartLocation2:(unsigned __int16)a6 lowHighRGB:(__rgbMinMaxFloat *)a7 histCompliancePercent:(float *)a8 varSpaceBox:(float *)a9
{
  unsigned int v10;
  int v11;
  void *data;
  size_t rowBytes;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  unsigned int v21;
  unsigned int v22;
  float v23;
  int v24;
  unsigned __int16 v25;
  void *v26;
  int v27;
  size_t v28;
  int v29;
  uint64_t v30;
  size_t v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  unsigned int v41;
  float v42;
  BOOL v43;
  __int16 v46;
  float v47;
  int v48;
  int v49;
  int v50;
  int v52;
  uint64_t v53;

  v10 = a6;
  v11 = a5;
  v52 = a4;
  data = a3->data;
  rowBytes = a3->rowBytes;
  if (-[VNCCTextDetector ii](self, "ii") == 1)
  {
    v15 = a7->var0 + -15.0;
    v16 = a7->var1 + 15.0;
    v17 = a7->var2 + -15.0;
    v18 = a7->var4 + -15.0;
    v19 = a7->var5 + 15.0;
    v20 = v16;
  }
  else
  {
    v19 = 0.0;
    v18 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v20 = 0.0;
    v15 = 0.0;
    if (-[VNCCTextDetector ii](self, "ii") == 2)
    {
      if (-[VNCCTextDetector profileNormal](self, "profileNormal") == 1)
      {
        v15 = a7[1].var0 + -60.0;
        v17 = a7[1].var2 + -60.0;
        v18 = a7[1].var4 + -60.0;
        v20 = fmaxf(a7[1].var1 + 60.0, 100.0);
        v16 = fmaxf(a7[1].var3 + 60.0, 100.0);
        v19 = fmaxf(a7[1].var5 + 60.0, 100.0);
      }
      else
      {
        v15 = a7->var0 + -60.0;
        v17 = a7->var2 + -60.0;
        v18 = a7->var4 + -60.0;
        v20 = a7->var1 + 60.0;
        v16 = a7->var3 + 60.0;
        v19 = a7->var5 + 60.0;
      }
    }
  }
  v49 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
  v48 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
  v21 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
  v22 = v21 - v10;
  v24 = ~v10;
  v50 = v11;
  if ((int)(v21 - v10) >= (int)(-[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom")
                               + ~v10))
  {
    v29 = 0;
    v27 = 0;
    v25 = 0;
  }
  else
  {
    v25 = 0;
    v26 = data;
    v27 = 0;
    v28 = rowBytes;
    v29 = 0;
    v30 = v10;
    v31 = v28 * v10;
    v32 = (__int16)(v11 - 2);
    v33 = v52 + 2;
    if (v32 <= (__int16)(v52 + 2))
      v34 = (__int16)(v52 + 2);
    else
      v34 = (__int16)(v11 - 2);
    v35 = v21 - v30;
    v36 = (int)v22;
    v37 = v34 - (uint64_t)v33 + 1;
    v53 = (uint64_t)v26 + 4 * v33 + v31 + 2;
    v38 = v35 + 1;
    do
    {
      if ((__int16)(v52 + 2) <= v32)
      {
        v39 = (_BYTE *)(v53 + a3->rowBytes * v38);
        v40 = v37;
        do
        {
          v41 = *(v39 - 1);
          LOBYTE(v23) = *v39;
          v42 = (float)LODWORD(v23);
          v43 = v15 >= v42 || v20 <= v42;
          v23 = (float)v41;
          if (!v43 && v17 < v23 && v16 > v23)
          {
            v23 = (float)*(v39 - 2);
            v46 = v18 < v23;
            if (v19 <= v23)
              v46 = 0;
            v25 += v46;
          }
          v39 += 4;
          v29 += v41;
          v27 += v41 * v41;
          --v40;
        }
        while (v40);
      }
      ++v36;
      ++v38;
    }
    while (v36 < -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom") + v24);
  }
  v47 = (float)((~v48 + v49) * (v50 - v52 - 3));
  *a8 = (float)v25 / v47;
  *a9 = (float)((float)v27 / v47) - (float)((float)((float)v29 / v47) * (float)((float)v29 / v47));
}

- (int)_generateCRCharBoxInformation_spaceBoxRemovalMagicThresh:(vImage_Buffer *)a3 magicMinHeight:(float)a4 magicMaxHeight:(float)a5 rowStartLocation2:(unsigned __int16)a6 magicThresh:(float *)a7 magicThreshPrev:(float *)a8 useLowLightEnhancement:(unsigned __int8)a9
{
  _BYTE *v9;
  int v10;
  float *v11;
  float *v12;
  _DWORD *v13;
  float *v14;
  _BYTE *v19;
  vImagePixelCount v20;
  unsigned __int16 v21;
  uint64_t v22;
  float v23;
  BOOL v24;
  unsigned int v25;
  int v26;
  int v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  int v31;
  float v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  float v41;
  double v42;
  float v43;
  uint64_t v44;
  unsigned __int8 v45;
  uint64_t v46;
  float v47;
  uint64_t v48;
  float v49;
  char *v51;
  float *v52;
  float *v53;
  _DWORD *v54;
  _BYTE *v55;
  int v56;
  int v57;
  unsigned __int16 v58;
  unsigned int v59;

  v59 = a6;
  v9 = 0;
  v10 = 0;
  if (!a7)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_78;
  }
  v11 = a8;
  v12 = 0;
  v13 = 0;
  if (a8)
  {
    v14 = a7;
    v12 = (float *)malloc_type_calloc(0x32uLL, 4uLL, 0x100004052888210uLL);
    if (!v12)
    {
      v10 = 0;
      v9 = 0;
      v13 = 0;
      goto LABEL_78;
    }
    v13 = malloc_type_calloc(0x32uLL, 4uLL, 0x100004052888210uLL);
    if (!v13)
    {
      v10 = 0;
      v9 = 0;
      goto LABEL_78;
    }
    v19 = malloc_type_calloc(0x32uLL, 1uLL, 0x100004077774924uLL);
    v9 = v19;
    if (!v19)
    {
      v10 = 0;
      goto LABEL_78;
    }
    if (!a3->width)
      goto LABEL_59;
    v52 = v14;
    v53 = v11;
    v54 = v13;
    v55 = v19;
    v20 = 0;
    v21 = 0;
    LODWORD(v14) = 0;
    LODWORD(v22) = 0;
    v51 = (char *)a3->data + a3->rowBytes * v59 + 1;
    do
    {
      if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v20))
      {
        v22 = (_DWORD)v22 ? v22 : (unsigned __int16)v20;
        v14 = (_DWORD)v22 ? (float *)(unsigned __int16)v20 : (float *)v14;
        if ((_DWORD)v22 && (_DWORD)v14)
        {
          v23 = (float)((int)v14 - v22);
          v24 = v23 < a4 || v23 > a5;
          if (!v24
            && -[VNCCTextDetector startSensitized](self, "startSensitized") <= v22
            && -[VNCCTextDetector stopSensitized](self, "stopSensitized") >= v14)
          {
            v57 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
            v56 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
            v25 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
            v58 = v21;
            if (v25 <= -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom"))
            {
              v27 = 0;
              v26 = 0;
              v28 = (int)(v25 - v59);
              do
              {
                if (v14 >= v22)
                {
                  v29 = &v51[4 * v22 + a3->rowBytes * v28];
                  v30 = (uint64_t)v14 - v22 + 1;
                  do
                  {
                    v31 = *v29;
                    v29 += 4;
                    v26 += v31;
                    v27 += v31 * v31;
                    --v30;
                  }
                  while (v30);
                }
                v24 = v28++ < (int)(-[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom")- v59);
              }
              while (v24);
            }
            else
            {
              v26 = 0;
              v27 = 0;
            }
            v32 = (float)((int)v14 - v22 + 1 + (v14 - v22 + 1) * (v57 - v56));
            v12[v58] = sqrtf((float)((float)v27 / v32) - (float)((float)((float)v26 / v32) * (float)((float)v26 / v32)));
            if (v14 >= v22)
            {
              v33 = 0;
              do
              {
                v33 += -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 4096, v22);
                v22 = (v22 + 1);
              }
              while ((_DWORD)v14 + 1 != (_DWORD)v22);
            }
            else
            {
              LOWORD(v33) = 0;
            }
            v55[v58] = (float)((float)(unsigned __int16)v33 / v23) > 0.5;
            v9 = v55;
            if ((unsigned __int16)(v58 + 1) >= 0x32u)
              v21 = 50;
            else
              v21 = v58 + 1;
          }
          LODWORD(v22) = (_DWORD)v14;
        }
      }
      ++v20;
    }
    while (a3->width > v20);
    LODWORD(v34) = v21;
    v11 = v53;
    v13 = v54;
    v14 = v52;
    if (v21)
    {
      v35 = 0;
      v36 = 100000.0;
      do
      {
        if (v9[v35] == 1 && v12[v35] < v36)
          v36 = v12[v35];
        ++v35;
      }
      while (v21 != v35);
      if (v21 > 1u)
      {
        v37 = 0;
        v38 = 1;
        do
        {
          v39 = v12[v37];
          v40 = v38;
          do
          {
            v41 = v12[v40];
            if (v41 < v39)
            {
              v12[v40] = v39;
              v12[v37] = v41;
              v39 = v41;
            }
            ++v40;
          }
          while (v21 != v40);
          ++v37;
          ++v38;
        }
        while (v37 != v21 - 1);
        *v54 = 0;
        v42 = v36 + -0.1;
        v43 = *v12;
        v44 = 1;
        while (1)
        {
          *(float *)&v54[v44] = v12[v44] - v43;
          v43 = v12[v44];
          if (v42 < v43)
            break;
          if (v21 == ++v44)
            goto LABEL_63;
        }
        LODWORD(v34) = v44;
        goto LABEL_63;
      }
      *v54 = 0;
      v21 = 1;
    }
    else
    {
LABEL_59:
      v21 = 0;
      *v13 = 0;
    }
    LODWORD(v34) = 1;
LABEL_63:
    v45 = 0;
    v34 = v34;
    if (v34 <= 1uLL)
      v34 = 1;
    v46 = -v34;
    v47 = -1.0;
    v48 = 1;
    do
    {
      if (*(float *)&v13[v48] > v47)
      {
        v47 = *(float *)&v13[v48];
        v45 = v48;
      }
      ++v48;
    }
    while (v46 + v48 != 1);
    *v14 = 0.0;
    v49 = (float)(v12[v45] + v12[v45 - 1]) * 0.5;
    *v14 = v49;
    if (v49 < 0.00001)
    {
      v49 = *v11;
      *v14 = *v11;
    }
    if (v49 > 19.0)
    {
      *v14 = 19.0;
      v49 = 19.0;
    }
    if (v47 < 11.0)
    {
      v49 = *v12 + -0.1;
      *v14 = v49;
    }
    v10 = 1;
    if (v21 >= 8u && v49 > 0.0)
      *v11 = v49;
  }
LABEL_78:
  free(v12);
  free(v13);
  free(v9);
  return v10;
}

- (unsigned)_extractCharBoxCuts:(__CCBigBox *)a3 heightConstraint:(unsigned __int8)a4 medianHeightTopVector:(unsigned __int16 *)a5 medianHeightBottomVector:(unsigned __int16 *)a6 isAdaptive:(BOOL)a7
{
  _BOOL4 v7;
  char v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char *v16;
  uint64_t v17;
  __CCBigBox *v18;
  char *v19;
  uint64_t v20;
  _BYTE *v21;
  char v22;
  unsigned __int16 *v23;
  int v24;
  int v25;
  int v26;
  int v30;
  char *v31;
  int v32;

  v7 = a7;
  v30 = a4;
  if (a7)
    v10 = 4;
  else
    v10 = 0;
  v31 = -[VNCCCharBoxContext pulseVectorHeightCharBox](self->_charBoxContext, "pulseVectorHeightCharBox");
  if (v7)
    v31 = -[VNCCCharBoxContext pulseVectorHeightCharBoxAdaptive](self->_charBoxContext, "pulseVectorHeightCharBoxAdaptive");
  v11 = -[VNCCCharBoxContext loopBigBoxPrev](self->_charBoxContext, "loopBigBoxPrev");
  if (v11 >= -[VNCCCharBoxContext loopBigBox](self->_charBoxContext, "loopBigBox"))
  {
    LOWORD(v32) = 0;
  }
  else
  {
    v32 = 0;
    v12 = 8 << v10;
    v13 = 2 << v10;
    v14 = v11;
    do
    {
      for (i = 0; i != 50; ++i)
      {
        v16 = (char *)&a3[v14] + 10 * i;
        v17 = *((unsigned __int16 *)v16 + 5);
        if (!*((_WORD *)v16 + 5))
          break;
        v18 = a3;
        v19 = (char *)&a3[v14] + 10 * i;
        v20 = *((unsigned __int16 *)v19 + 6);
        -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", v12, v17);
        -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", v12, v20);
        v22 = v19[14];
        v21 = v19 + 14;
        v23 = (unsigned __int16 *)(v21 + 2);
        v31[v17] = v21[2] - v22;
        v31[v20] = v21[2] - *v21;
        if (v17 <= v20)
        {
          v24 = v20 + 1;
          do
          {
            -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", v13, v17);
            v17 = (v17 + 1);
          }
          while (v24 != (_DWORD)v17);
        }
        v25 = *(unsigned __int16 *)v21;
        if (*v23 - v25 >= v30)
        {
          a5[(unsigned __int16)v32] = v25;
          a6[(unsigned __int16)v32] = *v23;
          if ((unsigned __int16)(v32 + 1) == 50)
            v26 = 49;
          else
            v26 = v32 + 1;
          v32 = v26;
        }
        a3 = v18;
      }
      ++v14;
    }
    while (v14 < -[VNCCCharBoxContext loopBigBox](self->_charBoxContext, "loopBigBox"));
  }
  return (unsigned __int16)v32;
}

- (void)_generateFilteredPulseVector:(unint64_t)a3 target:(unint64_t)a4 height:(unint64_t)a5
{
  unsigned int v9;
  unint64_t *v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _BOOL4 v16;
  BOOL v17;
  int v19;

  v9 = -[VNCCTextDetector maxHeight](self, "maxHeight");
  v10 = -[VNCCCharBoxContext charBoxFlags](self->_charBoxContext, "charBoxFlags");
  if (a5 >= 2)
  {
    v11 = 0;
    LODWORD(v12) = 0;
    v13 = *v10;
    v14 = 1;
    do
    {
      v15 = v13;
      v13 = -[VNCCCharBoxContext charBoxFlags](self->_charBoxContext, "charBoxFlags")[8 * v14];
      v16 = (v15 & a3) == 0 || (v13 & a3) != 0;
      if ((v13 & a3) != 0 && (v15 & a3) == 0)
        v12 = v14;
      else
        v12 = v12;
      if (!v16)
        v11 = v14 - 1;
      if ((_DWORD)v12)
        v17 = v11 == 0;
      else
        v17 = 1;
      if (!v17)
      {
        if (v11 - (int)v12 + 1 > v9 && v11 >= (int)v12)
        {
          v19 = v11 + 1;
          do
          {
            -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", a4, v12);
            v12 = (v12 + 1);
          }
          while (v19 != (_DWORD)v12);
        }
        LODWORD(v12) = 0;
        v11 = 0;
      }
      ++v14;
    }
    while (v14 != a5);
  }
}

- (void)_generateZeroCrossingVector:(unint64_t)a3 zcVectorFlag:(unint64_t)a4 width:(unint64_t)a5
{
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  VNCCCharBoxContext *charBoxContext;
  unint64_t v18;
  uint64_t v19;

  v9 = -[VNCCCharBoxContext charBoxFlags](self->_charBoxContext, "charBoxFlags");
  if (a5 >= 2)
  {
    v10 = 0;
    v11 = *v9;
    v12 = a5 - 1;
    do
    {
      v13 = v11;
      v11 = (-[VNCCCharBoxContext charBoxFlags](self->_charBoxContext, "charBoxFlags") + 8 * v10)[8];
      v14 = v13 & a3;
      if ((v11 & a3) != 0 && v14 == 0)
      {
        charBoxContext = self->_charBoxContext;
        v19 = (v10 + 1);
        v18 = a4;
      }
      else
      {
        if ((v11 & a3) != 0 || v14 == 0)
          goto LABEL_14;
        charBoxContext = self->_charBoxContext;
        v18 = a4;
        v19 = v10;
      }
      -[VNCCCharBoxContext setFlag:atIndex:](charBoxContext, "setFlag:atIndex:", v18, v19);
LABEL_14:
      ++v10;
    }
    while (v12 != v10);
  }
}

- (void)calculateSumProd:(vImage_Buffer *)a3 prodROIRef:(float *)a4 prodROIRotateRef:(float *)a5 rowStartLocation2:(unsigned __int16)a6 height:(unsigned __int16)a7
{
  unsigned int v7;
  float *v9;
  int v12;
  const char *v13;
  float v14;
  float *v15;
  int v16;
  vImagePixelCount width;
  vImagePixelCount v18;
  const char *v19;
  float32x4_t *v20;
  uint16x8_t v21;
  uint16x8_t v22;
  uint16x8_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float v28;
  vImagePixelCount v29;
  float32x4_t *v30;
  const char *v31;
  uint8x16_t v32;
  uint8x16_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float v38;
  uint64_t v39;
  float *v40;
  float *v41;
  float *v42;
  vImagePixelCount i;
  float v44;
  int8x16x4_t v45;
  int8x16x4_t v46;

  if ((a3->width & 0xF) != 0)
    __assert_rtn("-[VNCCTextDetector calculateSumProd:prodROIRef:prodROIRotateRef:rowStartLocation2:height:]", "VNCCTextDetector.mm", 5252, "!(inputImage.width & 0xf)");
  v7 = a7;
  if (a7)
  {
    v9 = a4;
    v12 = 0;
    v13 = (char *)a3->data + a3->rowBytes * a6;
    v14 = 0.0;
    v15 = a4;
    do
    {
      v16 = -[VNCCTextDetector ii](self, "ii");
      width = a3->width;
      if (v16 == 1)
      {
        if (width)
        {
          v18 = 0;
          v19 = v13;
          v20 = (float32x4_t *)v15;
          do
          {
            v45 = vld4q_s8(v19);
            v19 += 64;
            v21 = vmull_u8(*(uint8x8_t *)v45.val[0].i8, *(uint8x8_t *)v45.val[1].i8);
            v22 = vmull_high_u8((uint8x16_t)v45.val[0], (uint8x16_t)v45.val[1]);
            v23 = vmovl_u8(*(uint8x8_t *)v45.val[2].i8);
            v45.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v45.val[2]);
            v45.val[2] = (int8x16_t)vmull_high_u16(v21, v23);
            v45.val[3] = (int8x16_t)vmull_u16(*(uint16x4_t *)v22.i8, *(uint16x4_t *)v45.val[0].i8);
            v45.val[0] = (int8x16_t)vmull_high_u16(v22, (uint16x8_t)v45.val[0]);
            v24 = vcvtq_f32_u32(vmull_u16(*(uint16x4_t *)v21.i8, *(uint16x4_t *)v23.i8));
            v25 = vcvtq_f32_u32((uint32x4_t)v45.val[2]);
            v26 = vcvtq_f32_u32((uint32x4_t)v45.val[3]);
            v27 = vcvtq_f32_u32((uint32x4_t)v45.val[0]);
            *v20 = v24;
            v20[1] = v25;
            v20[2] = v26;
            v20[3] = v27;
            v20 += 4;
            v28 = vmaxvq_f32(vmaxq_f32(vmaxq_f32(v24, v25), vmaxq_f32(v26, v27)));
            if (v28 > v14)
              v14 = v28;
            v18 += 16;
            width = a3->width;
          }
          while (width > v18);
        }
      }
      else if (width)
      {
        v29 = 0;
        v30 = (float32x4_t *)v15;
        v31 = v13;
        do
        {
          v46 = vld4q_s8(v31);
          v31 += 64;
          v32 = (uint8x16_t)vmvnq_s8(v46.val[0]);
          v33 = (uint8x16_t)vmvnq_s8(v46.val[1]);
          v46.val[0] = vmvnq_s8(v46.val[2]);
          v46.val[1] = (int8x16_t)vmull_u8(*(uint8x8_t *)v32.i8, *(uint8x8_t *)v33.i8);
          v46.val[2] = (int8x16_t)vmull_high_u8(v32, v33);
          v46.val[3] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v46.val[0].i8);
          v46.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v46.val[0]);
          v34 = vcvtq_f32_u32(vmull_u16(*(uint16x4_t *)v46.val[1].i8, *(uint16x4_t *)v46.val[3].i8));
          v35 = vcvtq_f32_u32(vmull_high_u16((uint16x8_t)v46.val[1], (uint16x8_t)v46.val[3]));
          v36 = vcvtq_f32_u32(vmull_u16(*(uint16x4_t *)v46.val[2].i8, *(uint16x4_t *)v46.val[0].i8));
          v37 = vcvtq_f32_u32(vmull_high_u16((uint16x8_t)v46.val[2], (uint16x8_t)v46.val[0]));
          *v30 = v34;
          v30[1] = v35;
          v30[2] = v36;
          v30[3] = v37;
          v30 += 4;
          v38 = vmaxvq_f32(vmaxq_f32(vmaxq_f32(v34, v35), vmaxq_f32(v36, v37)));
          if (v38 > v14)
            v14 = v38;
          v29 += 16;
          width = a3->width;
        }
        while (width > v29);
      }
      v15 += width;
      ++v12;
      v13 += a3->rowBytes;
    }
    while (v12 != v7);
    v39 = 0;
    v40 = &a5[v7 - 1];
    do
    {
      v41 = v9;
      v42 = v40;
      for (i = width; i; --i)
      {
        v44 = *v41++;
        *v42 = (float)(1.0 / v14) * v44;
        v42 += v7;
      }
      ++v39;
      --v40;
      v9 += width;
    }
    while (v39 != v7);
  }
}

- (void)calculateSumProdAlternative:(vImage_Buffer *)a3 prodROIRef:(float *)a4 prodROIRotateRef:(float *)a5 rowStartLocation2:(unsigned __int16)a6 height:(unsigned __int16)a7
{
  float v7;
  uint64_t v8;
  vImagePixelCount width;
  size_t rowBytes;
  char *v11;
  uint64_t v12;
  float v13;
  float *v14;
  uint64_t v15;
  vImagePixelCount v16;
  uint64_t v17;
  float *v18;
  float v19;
  float *v20;
  float *v21;
  vImagePixelCount i;
  float v23;

  if (a7)
  {
    v8 = 0;
    width = a3->width;
    rowBytes = a3->rowBytes;
    v11 = (char *)a3->data + rowBytes * a6;
    v12 = 4 * width;
    v13 = 0.0;
    v14 = a4;
    do
    {
      if (width)
      {
        v15 = 0;
        v16 = width;
        do
        {
          LOBYTE(v7) = v11[v15 * 4 + 2];
          v7 = (float)LODWORD(v7);
          if (v13 < v7)
            v13 = v7;
          v14[v15++] = v7;
          --v16;
        }
        while (v16);
      }
      ++v8;
      v11 += rowBytes;
      v14 = (float *)((char *)v14 + v12);
    }
    while (v8 != a7);
    v17 = 0;
    v18 = &a5[a7 - 1];
    v19 = 1.0 / v13;
    do
    {
      v20 = a4;
      v21 = v18;
      for (i = width; i; --i)
      {
        v23 = *v20++;
        *v21 = v19 * v23;
        v21 += a7;
      }
      ++v17;
      --v18;
      a4 = (float *)((char *)a4 + v12);
    }
    while (v17 != a7);
  }
}

- (void)extractCharBoxHeightInfo:(__CCCharBox *)a3 ccCharBoxesFiltered:(__CCCharBox *)a4 ccYTopLocationsForSort:(unsigned __int16 *)a5 ccYBottomLocationsForSort:(unsigned __int16 *)a6 aggregateGreenBoxesForStubCount:(unsigned __int16)a7 imageWidth:(unsigned __int16)a8
{
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  __CCCharBox *v14;
  VNCCTextDetector *v15;
  uint64_t v16;
  VNCCCharBoxContext **p_charBoxContext;
  unint64_t v18;
  __CCCharBox *v19;
  uint64_t var1;
  uint64_t var2;
  __CCCharBox *v22;
  unsigned __int16 *p_var3;
  unsigned __int16 *p_var4;
  uint64_t v25;
  unsigned __int16 v26;
  __int16 v27;
  uint64_t v28;
  unsigned __int16 *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int16 *v33;
  unsigned __int16 *v34;
  unint64_t v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unint64_t v40;
  double v41;
  uint64_t v42;
  unint64_t v43;
  double v44;
  double v45;
  unsigned int v46;
  unsigned int v47;
  double v48;
  unsigned __int16 *v49;
  __CCCharBox *v50;
  unint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  unint64_t v56;
  unsigned __int16 *v57;
  unint64_t v58;
  unint64_t v59;
  double v60;
  double v61;
  double v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unsigned __int16 *v67;
  double v68;
  double v69;
  float v70;
  float v71;
  float v72;
  double v73;
  double v74;
  float v75;
  double v76;
  float v77;
  double v78;
  float v79;
  float v80;
  float v81;
  double v82;
  float v83;
  float v84;
  float v85;
  double v86;
  float v87;
  float v88;
  float v89;
  double v90;
  float v91;
  float v92;
  float v93;
  double v94;
  unsigned int v96;
  unsigned int v98;

  v10 = a8;
  v11 = a7;
  v14 = a4;
  v15 = self;
  if (!a7)
    goto LABEL_19;
  v98 = a8;
  v16 = 0;
  p_charBoxContext = &self->_charBoxContext;
  v96 = a7;
  v18 = a7;
  do
  {
    v19 = &a3[v16];
    var1 = v19->var1;
    var2 = v19->var2;
    if (var1 <= var2)
    {
      v22 = &a3[v16];
      p_var3 = &v22->var3;
      p_var4 = &v22->var4;
      v25 = var2 + 1;
      do
      {
        v26 = *p_var3;
        -[VNCCCharBoxContext charboxROIFullVectorRowStart](*p_charBoxContext, "charboxROIFullVectorRowStart")[2 * var1] = v26;
        v27 = *p_var4 - *p_var3;
        -[VNCCCharBoxContext charboxROIFullVectorHeight2](*p_charBoxContext, "charboxROIFullVectorHeight2")[2 * var1++] = v27;
      }
      while (v25 != var1);
    }
    ++v16;
  }
  while (v16 != v18);
  v28 = 0;
  v29 = a6 + 1;
  v30 = a5 + 1;
  v31 = 1;
  v10 = v98;
  v14 = a4;
  v11 = v96;
  do
  {
    v32 = v28 + 1;
    if (v28 + 1 < v18)
    {
      v33 = v30;
      v34 = v29;
      v35 = v18;
      do
      {
        v36 = *v33;
        v37 = a5[v28];
        if (v36 < v37)
        {
          *v33 = v37;
          a5[v28] = v36;
        }
        v38 = *v34;
        v39 = a6[v28];
        if (v38 < v39)
        {
          *v34 = v39;
          a6[v28] = v38;
        }
        --v35;
        ++v34;
        ++v33;
      }
      while (v31 != v35);
    }
    ++v31;
    ++v29;
    ++v30;
    ++v28;
  }
  while (v32 != v18);
  v15 = self;
  if (v96 > 1)
  {
    v40 = 0.5;
    v41 = (double)v96 * 0.5;
    *(float *)&v41 = v41;
    LODWORD(v15) = vcvtms_s32_f32(*(float *)&v41);
    if ((v96 & 1) != 0)
    {
      LOWORD(v40) = a5[(_QWORD)v15];
      v44 = (double)v40;
      LOWORD(v40) = a6[(_QWORD)v15];
      v45 = (double)v40;
    }
    else
    {
      v42 = 2 * (_QWORD)v15 - 2;
      LOWORD(v41) = *(unsigned __int16 *)((char *)a5 + v42);
      LOWORD(v8) = a5[(_QWORD)v15];
      *(double *)&v43 = (double)v8;
      v44 = ((double)*(unint64_t *)&v41 + *(double *)&v43) * 0.5;
      LOWORD(v43) = *(unsigned __int16 *)((char *)a6 + v42);
      LOWORD(v9) = a6[(_QWORD)v15];
      v45 = ((double)v43 + (double)v9) * 0.5;
    }
    v48 = v45 - v44;
    -[VNCCCharBoxContext setFilterWalkUpDownCount:](*p_charBoxContext, "setFilterWalkUpDownCount:", 0);
  }
  else
  {
LABEL_19:
    v46 = *a5;
    v47 = *a6;
    p_charBoxContext = &v15->_charBoxContext;
    -[VNCCCharBoxContext setFilterWalkUpDownCount:](v15->_charBoxContext, "setFilterWalkUpDownCount:", 0);
    if (!v11)
      goto LABEL_29;
    v48 = (double)v47 - (double)v46;
    v18 = v11;
  }
  v49 = &a3->var4;
  do
  {
    if ((v11 > 6 || vabdd_f64((double)(unsigned __int16)(*v49 - *(v49 - 1)), v48) / v48 < 0.2) && *(v49 - 4) <= 0x1C0u)
    {
      v50 = &v14[-[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount")];
      v50->var0 = *(v49 - 4);
      *(_DWORD *)&v50->var3 = *(_DWORD *)(v49 - 1);
      -[VNCCCharBoxContext setFilterWalkUpDownCount:](*p_charBoxContext, "setFilterWalkUpDownCount:", (unsigned __int16)(-[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount") + 1));
    }
    v49 += 5;
    --v18;
  }
  while (v18);
LABEL_29:
  if (-[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount") >= 3)
  {
    v52 = 0.0;
    v53 = 0.0;
    v54 = 0.0;
    v55 = 0.0;
    if (-[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount"))
    {
      v56 = 0;
      v57 = &v14->var4;
      do
      {
        LOWORD(v51) = *(v57 - 4);
        *(double *)&v58 = (double)v51;
        v53 = v53 + *(double *)&v58;
        LOWORD(v58) = *(v57 - 1);
        *(double *)&v59 = (double)v58;
        v54 = v54 + *(double *)&v59;
        LOWORD(v59) = *v57;
        v55 = v55 + (double)v59;
        ++v56;
        v57 += 5;
      }
      while (v56 < -[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount"));
    }
    v60 = v53 / (double)-[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount");
    v61 = v54 / (double)-[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount");
    v62 = v55 / (double)-[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount");
    if (-[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount"))
    {
      v66 = 0;
      v67 = &v14->var4;
      v68 = 0.0;
      v69 = 1.0;
      v52 = 0.0;
      do
      {
        LOWORD(v63) = *(v67 - 4);
        v70 = (double)v63 - v60;
        LOWORD(v64) = *(v67 - 1);
        v71 = (double)v64 - v61;
        LOWORD(v65) = *v67;
        v72 = (double)v65 - v62;
        v52 = v52 + (float)(v70 * v71);
        v68 = v68 + (float)(v70 * v72);
        v69 = v69 + (float)(v70 * v70);
        ++v66;
        v67 += 5;
      }
      while (v66 < -[VNCCCharBoxContext filterWalkUpDownCount](*p_charBoxContext, "filterWalkUpDownCount"));
    }
    else
    {
      v69 = 1.0;
      v68 = 0.0;
    }
    v73 = v52 / v69;
    *(float *)&v73 = v52 / v69;
    -[VNCCCharBoxContext setMTop:](*p_charBoxContext, "setMTop:", v73);
    v74 = v68 / v69;
    *(float *)&v74 = v68 / v69;
    -[VNCCCharBoxContext setMBottom:](*p_charBoxContext, "setMBottom:", v74);
    -[VNCCCharBoxContext mTop](*p_charBoxContext, "mTop");
    v76 = v61 - v75 * v60;
    *(float *)&v76 = v76;
    -[VNCCCharBoxContext setBTop:](*p_charBoxContext, "setBTop:", v76);
    -[VNCCCharBoxContext mBottom](*p_charBoxContext, "mBottom");
    v78 = v62 - v77 * v60;
    *(float *)&v78 = v78;
    -[VNCCCharBoxContext setBBottom:](*p_charBoxContext, "setBBottom:", v78);
    -[VNCCCharBoxContext mTop](*p_charBoxContext, "mTop");
    v80 = v79;
    -[VNCCCharBoxContext bTop](*p_charBoxContext, "bTop");
    *(float *)&v82 = v80 + v81;
    -[VNCCCharBoxContext setPosUL:](*p_charBoxContext, "setPosUL:", v82);
    -[VNCCCharBoxContext mBottom](*p_charBoxContext, "mBottom");
    v84 = v83;
    -[VNCCCharBoxContext bBottom](*p_charBoxContext, "bBottom");
    *(float *)&v86 = v84 + v85;
    -[VNCCCharBoxContext setPosLL:](*p_charBoxContext, "setPosLL:", v86);
    -[VNCCCharBoxContext mTop](*p_charBoxContext, "mTop");
    v88 = v87;
    -[VNCCCharBoxContext bTop](*p_charBoxContext, "bTop");
    *(float *)&v90 = v89 + (float)(v88 * (float)v10);
    -[VNCCCharBoxContext setPosUR:](*p_charBoxContext, "setPosUR:", v90);
    -[VNCCCharBoxContext mBottom](*p_charBoxContext, "mBottom");
    v92 = v91;
    -[VNCCCharBoxContext bBottom](*p_charBoxContext, "bBottom");
    *(float *)&v94 = v93 + (float)(v92 * (float)v10);
    -[VNCCCharBoxContext setPosLR:](*p_charBoxContext, "setPosLR:", v94);
  }
}

- (unsigned)charBoxesFromTextBoxes:(__CCCharBox *)a3 bigBoxes:(__CCBigBox *)a4 ccYTopLocationsForSort:(unsigned __int16 *)a5 ccYBottomLocationsForSort:(unsigned __int16 *)a6
{
  int v11;
  unsigned __int16 v12;
  uint64_t v13;
  __CCBigBox *v14;
  uint64_t i;
  char *v16;
  __CCCharBox *v17;

  v11 = -[VNCCCharBoxContext loopBigBoxPrev](self->_charBoxContext, "loopBigBoxPrev");
  if (v11 >= -[VNCCCharBoxContext loopBigBox](self->_charBoxContext, "loopBigBox"))
    return 0;
  v12 = 0;
  v13 = v11;
  v14 = &a4[v11];
  do
  {
    for (i = 0; i != 50; ++i)
    {
      v16 = (char *)v14 + i * 10;
      if (!v14->var4[i].var0)
        break;
      v17 = &a3[v12];
      v17->var0 = v14->var4[i].var0;
      *(_QWORD *)&v17->var1 = *(_QWORD *)(v16 + 10);
      a5[v12] = *((_WORD *)v16 + 7);
      a6[v12] = *((_WORD *)v16 + 8);
      if ((unsigned __int16)(v12 + 1) == 50)
        v12 = 49;
      else
        ++v12;
    }
    ++v13;
    ++v14;
  }
  while (v13 < -[VNCCCharBoxContext loopBigBox](self->_charBoxContext, "loopBigBox"));
  return v12;
}

- (int)extractBoxesForStub:(__CCBigBox *)a3 bigBoxesAdapt:(__CCBigBox *)a4 countBigBox:(unsigned __int8)a5 rowStartLocation2:(unsigned __int16)a6 rowStopLocation2:(unsigned __int16)a7 heightConstraint:(unsigned __int8)a8 imageWidth:(unsigned __int16)a9 height:(unsigned __int16)a10 ccCharBoxesAggr:(__CCCharBox *)a11 ccCharBoxesFiltered:(__CCCharBox *)a12 useLowLightEnhancement:(unsigned __int8)a13
{
  char *v13;
  int v14;
  uint64_t v17;
  unsigned int v18;
  int v19;
  int v22;
  int v23;
  __CCBigBox *v24;
  int var0;
  int v26;
  __CCBigBox *v27;
  unsigned __int16 *p_var3;
  uint64_t var2;
  BOOL v30;
  char *v31;
  char *v32;
  unsigned __int16 v33;
  uint64_t v34;
  uint64_t v35;
  _WORD *v36;
  uint64_t v37;
  uint64_t v38;
  _WORD *v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  double v45;
  float v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  __CCBigBox *v50;
  uint64_t v51;
  __CCCharBox *v53;
  uint64_t v54;
  __CCBigBox *v55;
  unsigned int v56;
  unsigned int v57;

  v13 = 0;
  v14 = 0;
  if (a3 && a4)
  {
    v57 = a7;
    if (a11 && a12 != 0)
    {
      v17 = a8;
      v18 = a6;
      v19 = a5;
      v22 = -[VNCCCharBoxContext loopBigBoxPrev](self->_charBoxContext, "loopBigBoxPrev");
      v23 = -[VNCCCharBoxContext loopBigBoxPrev](self->_charBoxContext, "loopBigBoxPrev");
      v53 = a12;
      v55 = a4;
      v56 = v18;
      if (v23 < v19)
      {
        v24 = &a3[v22];
        var0 = v24->var0;
        do
        {
          v26 = a3[(__int16)v23].var0;
          if (v26 == var0)
          {
            v27 = &a3[(__int16)v23];
            -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x10000, v27->var2);
            p_var3 = &v27->var3;
            -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x10000, v27->var3);
            var2 = v27->var2;
            if (var2 <= *p_var3)
            {
              do
              {
                -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x2000, var2, v53);
                v30 = var2 >= *p_var3;
                var2 = (var2 + 1);
              }
              while (!v30);
            }
          }
          if (v26 != v24->var0)
            break;
          LOWORD(v23) = v23 + 1;
          var0 = v26;
        }
        while (v19 > (__int16)v23);
      }
      -[VNCCCharBoxContext setLoopBigBox:](self->_charBoxContext, "setLoopBigBox:", (__int16)v23, v53);
      v31 = (char *)malloc_type_calloc(0x12CuLL, 2uLL, 0x1000040BDFB0063uLL);
      v13 = v31;
      if (v31)
      {
        v32 = v31 + 100;
        v33 = -[VNCCTextDetector _extractCharBoxCuts:heightConstraint:medianHeightTopVector:medianHeightBottomVector:isAdaptive:](self, "_extractCharBoxCuts:heightConstraint:medianHeightTopVector:medianHeightBottomVector:isAdaptive:", a3, v17, v31, v31 + 100, 0);
        if (-[VNCCTextDetector computeZCVectorHighProbability](self, "computeZCVectorHighProbability"))
          -[VNCCTextDetector _extractCharBoxCuts:heightConstraint:medianHeightTopVector:medianHeightBottomVector:isAdaptive:](self, "_extractCharBoxCuts:heightConstraint:medianHeightTopVector:medianHeightBottomVector:isAdaptive:", v55, v17, v13 + 200, v13 + 300, 1);
        v34 = a10;
        -[VNCCCharBoxContext setMedianHeightTop:](self->_charBoxContext, "setMedianHeightTop:", 0);
        -[VNCCCharBoxContext setMedianHeightBottom:](self->_charBoxContext, "setMedianHeightBottom:", 0);
        if (v33)
        {
          v35 = 0;
          v36 = v13 + 102;
          v37 = 1;
          do
          {
            v38 = v35 + 1;
            if (v35 + 1 < (unint64_t)v33)
            {
              v39 = v36;
              v40 = v33;
              do
              {
                v41 = (unsigned __int16)*(v39 - 50);
                v42 = *(unsigned __int16 *)&v13[2 * v35];
                if (v41 < v42)
                {
                  *(v39 - 50) = v42;
                  *(_WORD *)&v13[2 * v35] = v41;
                }
                v43 = (unsigned __int16)*v39;
                v44 = *(unsigned __int16 *)&v32[2 * v35];
                if (v43 < v44)
                {
                  *v39 = v44;
                  *(_WORD *)&v32[2 * v35] = v43;
                }
                --v40;
                ++v39;
              }
              while (v37 != v40);
            }
            ++v37;
            ++v36;
            ++v35;
          }
          while (v38 != v33);
          if (v33 <= 1u)
          {
            v47 = 0;
            v34 = 0;
          }
          else
          {
            v45 = (double)v33 * 0.5;
            v46 = v45;
            *(float *)&v45 = v45 + -1.0;
            LODWORD(v34) = llroundf(*(float *)&v45);
            v47 = (vcvtms_s32_f32(v46) - 1);
          }
          -[VNCCCharBoxContext setMedianHeightTop:](self->_charBoxContext, "setMedianHeightTop:", *(unsigned __int16 *)&v13[2 * v47]);
          -[VNCCCharBoxContext setMedianHeightBottom:](self->_charBoxContext, "setMedianHeightBottom:", *(unsigned __int16 *)&v32[2 * v34]);
          if (-[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop") < v56)
            -[VNCCCharBoxContext setMedianHeightTop:](self->_charBoxContext, "setMedianHeightTop:", v56);
          LODWORD(v34) = a10;
          if (-[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom") > v57)
            -[VNCCCharBoxContext setMedianHeightBottom:](self->_charBoxContext, "setMedianHeightBottom:", v57);
        }
        v48 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
        if ((double)v34 * 0.5 > (double)(v48
                                                      - -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop")))
        {
          -[VNCCCharBoxContext setMedianHeightTop:](self->_charBoxContext, "setMedianHeightTop:", v56);
          -[VNCCCharBoxContext setMedianHeightBottom:](self->_charBoxContext, "setMedianHeightBottom:", v57);
        }
        if (a9)
        {
          v49 = 0;
          do
          {
            -[VNCCCharBoxContext charboxROIFullVectorRowStart](self->_charBoxContext, "charboxROIFullVectorRowStart")[v49] = 0;
            -[VNCCCharBoxContext charboxROIFullVectorHeight2](self->_charBoxContext, "charboxROIFullVectorHeight2")[v49] = 0;
            v49 += 2;
          }
          while (2 * a9 != v49);
        }
        if (a13)
          v50 = v55;
        else
          v50 = a3;
        v51 = -[VNCCTextDetector charBoxesFromTextBoxes:bigBoxes:ccYTopLocationsForSort:ccYBottomLocationsForSort:](self, "charBoxesFromTextBoxes:bigBoxes:ccYTopLocationsForSort:ccYBottomLocationsForSort:", a11, v50, v13 + 400, v13 + 500);
        if ((_DWORD)v51)
          -[VNCCTextDetector extractCharBoxHeightInfo:ccCharBoxesFiltered:ccYTopLocationsForSort:ccYBottomLocationsForSort:aggregateGreenBoxesForStubCount:imageWidth:](self, "extractCharBoxHeightInfo:ccCharBoxesFiltered:ccYTopLocationsForSort:ccYBottomLocationsForSort:aggregateGreenBoxesForStubCount:imageWidth:", a11, v54, v13 + 400, v13 + 500, v51, a9);
        v14 = 1;
      }
      else
      {
        v14 = 0;
      }
    }
  }
  free(v13);
  return v14;
}

- (int)_generateCRCharBoxInformation_zcFinalVectorOriginate:(vImage_Buffer *)a3 textOut:(vImage_Buffer *)a4 adaptOut:(vImage_Buffer *)a5 bigBoxes:(__CCBigBox *)a6 bigBoxesAdapt:(__CCBigBox *)a7 ccCharBoxesAggr:(__CCCharBox *)a8 ccCharBoxesFiltered:(__CCCharBox *)a9 height:(unsigned __int16)a10 rowStartLocation2:(unsigned __int16)a11 rowStopLocation2:(unsigned __int16)a12 singleVotingImageAddressRef:(char *)a13 countBigBox:(unsigned __int8)a14 filterWalkUpDownCount:(unsigned __int16 *)a15 useLowLightEnhancement:(unsigned __int8)a16
{
  int v17;
  void *v18;
  char *v24;
  char *data;
  vImagePixelCount v26;
  char *v27;
  int v28;
  vImagePixelCount v29;
  __int128 v30;
  float *v31;
  double v32;
  double v33;
  double v34;
  int v35;
  double v36;
  vImagePixelCount v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  char *v41;
  vImagePixelCount v42;
  unsigned int v43;
  float v44;
  double v45;
  double v46;
  double v47;
  _BOOL4 v48;
  double v49;
  _BOOL4 v50;
  BOOL v51;
  vImagePixelCount v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  char *v56;
  vImagePixelCount v57;
  unsigned int v58;
  float v59;
  double v60;
  double v61;
  double v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  __CCCharBox *v72;
  unsigned int v73;
  vImagePixelCount width;
  _OWORD v76[2];
  _OWORD v77[3];

  v17 = 0;
  v18 = 0;
  if (!a6 || !a7 || !a8 || !a9 || !a13 || !a15)
    goto LABEL_43;
  width = a3->width;
  v24 = (char *)malloc_type_malloc(8 * a10 * width, 0x12B4ACE5uLL);
  v18 = v24;
  if (!v24)
  {
    v17 = 0;
LABEL_43:
    -[VNCCTextDetector computeZCVectorHighProbability](self, "computeZCVectorHighProbability", a3, a4, a5);
    free(v18);
    return v17;
  }
  v72 = a8;
  data = (char *)a4->data;
  v71 = (char *)a5->data;
  v26 = a3->width;
  v27 = &v24[4 * v26 * a10];
  if (v26 == 767)
    v28 = 15;
  else
    v28 = 12;
  v73 = v28;
  -[VNCCCharBoxContext setMedianHeightTop:](self->_charBoxContext, "setMedianHeightTop:", a11);
  -[VNCCCharBoxContext setMedianHeightBottom:](self->_charBoxContext, "setMedianHeightBottom:", a12);
  -[VNCCCharBoxContext resetBoxBounds](self->_charBoxContext, "resetBoxBounds");
  if (a3->width)
  {
    v29 = 0;
    do
    {
      -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 67203327, v29);
      -[VNCCCharBoxContext pulseVectorHeightCharBox](self->_charBoxContext, "pulseVectorHeightCharBox")[v29] = 0;
      -[VNCCCharBoxContext pulseVectorHeightCharBoxAdaptive](self->_charBoxContext, "pulseVectorHeightCharBoxAdaptive")[v29++] = 0;
    }
    while (a3->width > v29);
  }
  v30 = *(_OWORD *)&a3->width;
  if (a16)
  {
    v76[0] = *(_OWORD *)&a3->data;
    v76[1] = v30;
    -[VNCCTextDetector calculateSumProdAlternative:prodROIRef:prodROIRotateRef:rowStartLocation2:height:](self, "calculateSumProdAlternative:prodROIRef:prodROIRotateRef:rowStartLocation2:height:", v76, v18, v27, a11, a10);
  }
  else
  {
    v77[0] = *(_OWORD *)&a3->data;
    v77[1] = v30;
    -[VNCCTextDetector calculateSumProd:prodROIRef:prodROIRotateRef:rowStartLocation2:height:](self, "calculateSumProd:prodROIRef:prodROIRotateRef:rowStartLocation2:height:", v77, v18, v27, a11, a10);
  }
  v31 = -[VNCCCharBoxContext floatVectorSumProd](self->_charBoxContext, "floatVectorSumProd");
  WORD2(v67) = a10;
  HIDWORD(v64) = -[VNCCTextDetector startMaxFind](self, "startMaxFind");
  LODWORD(v67) = -[VNCCTextDetector stopMaxFind](self, "stopMaxFind");
  LOWORD(v64) = a10 - 1;
  LODWORD(v32) = 1028443341;
  LODWORD(v33) = 1003277517;
  LODWORD(v34) = 1008981770;
  v35 = -[VNCCTextDetector _getFilterResultOut:defaultRows:bufferHeight:minHeight:maxHeight:startRange:stopRange:startMaxFind:stopMaxFind:bytesPerRow:thresholdSet:sampleImageAddressRef:sampleImageFloatAddressRef:pulseVectorFlag:](self, "_getFilterResultOut:defaultRows:bufferHeight:minHeight:maxHeight:startRange:stopRange:startMaxFind:stopMaxFind:bytesPerRow:thresholdSet:sampleImageAddressRef:sampleImageFloatAddressRef:pulseVectorFlag:", v31, 767, (unsigned __int16)width, v73, 35, 0, v32, v33, v34, v64, v67, a13, v27, 4096);
  if (v35 != 1)
  {
    v17 = v35;
    goto LABEL_43;
  }
  if (a11 <= a12)
  {
    v37 = a3->width;
    v38 = a11 - 1;
    v36 = 255.0;
    v39 = a11;
    do
    {
      if (v37)
      {
        v40 = 0;
        v41 = &data[a4->rowBytes * v38];
        v42 = v37;
        do
        {
          v43 = *v41++;
          v44 = (double)v43 * 255.0;
          *(float *)&v27[4 * (a12 - v39) + 4 * v40] = v44;
          v40 += a10;
          --v42;
        }
        while (v42);
      }
      ++v38;
      v51 = a12 == v39++;
    }
    while (!v51);
  }
  WORD2(v68) = a10;
  HIDWORD(v65) = -[VNCCTextDetector startMaxFind](self, "startMaxFind", v36);
  LODWORD(v68) = -[VNCCTextDetector stopMaxFind](self, "stopMaxFind");
  LOWORD(v65) = a10 - 1;
  LODWORD(v45) = 1028443341;
  LODWORD(v46) = 1003277517;
  LODWORD(v47) = 1008981770;
  v17 = -[VNCCTextDetector _getFilterResultOut:defaultRows:bufferHeight:minHeight:maxHeight:startRange:stopRange:startMaxFind:stopMaxFind:bytesPerRow:thresholdSet:sampleImageAddressRef:sampleImageFloatAddressRef:pulseVectorFlag:](self, "_getFilterResultOut:defaultRows:bufferHeight:minHeight:maxHeight:startRange:stopRange:startMaxFind:stopMaxFind:bytesPerRow:thresholdSet:sampleImageAddressRef:sampleImageFloatAddressRef:pulseVectorFlag:", 0, 767, (unsigned __int16)width, v73, 35, 0, v45, v46, v47, v65, v68, a13, v27, 1);
  v48 = -[VNCCTextDetector computeZCVectorHighProbability](self, "computeZCVectorHighProbability");
  v50 = v48;
  v51 = v17 != 1 || !v48;
  if (!v51)
  {
    if (a11 <= a12)
    {
      v52 = a3->width;
      v53 = a11 - 1;
      v49 = 255.0;
      v54 = a11;
      do
      {
        if (v52)
        {
          v55 = 0;
          v56 = &v71[a5->rowBytes * v53];
          v57 = v52;
          do
          {
            v58 = *v56++;
            v59 = (double)v58 * 255.0;
            *(float *)&v27[4 * (a12 - v54) + 4 * v55] = v59;
            v55 += a10;
            --v57;
          }
          while (v57);
        }
        ++v53;
        v51 = a12 == v54++;
      }
      while (!v51);
    }
    WORD2(v69) = a10;
    HIDWORD(v66) = -[VNCCTextDetector startMaxFind](self, "startMaxFind", v49);
    LODWORD(v69) = -[VNCCTextDetector stopMaxFind](self, "stopMaxFind");
    LOWORD(v66) = a10 - 1;
    LODWORD(v60) = 1028443341;
    LODWORD(v61) = 1003277517;
    LODWORD(v62) = 1008981770;
    v17 = -[VNCCTextDetector _getFilterResultOut:defaultRows:bufferHeight:minHeight:maxHeight:startRange:stopRange:startMaxFind:stopMaxFind:bytesPerRow:thresholdSet:sampleImageAddressRef:sampleImageFloatAddressRef:pulseVectorFlag:](self, "_getFilterResultOut:defaultRows:bufferHeight:minHeight:maxHeight:startRange:stopRange:startMaxFind:stopMaxFind:bytesPerRow:thresholdSet:sampleImageAddressRef:sampleImageFloatAddressRef:pulseVectorFlag:", 0, 767, (unsigned __int16)width, v73, 35, 0, v60, v61, v62, v66, v69, a13, v27, 16);
  }
  free(v18);
  if (v17 == 1)
  {
    -[VNCCTextDetector _generateZeroCrossingVector:zcVectorFlag:width:](self, "_generateZeroCrossingVector:zcVectorFlag:width:", 4096, 0x4000, a3->width);
    -[VNCCTextDetector _generateZeroCrossingVector:zcVectorFlag:width:](self, "_generateZeroCrossingVector:zcVectorFlag:width:", 1, 4, a3->width);
    if (v50)
      -[VNCCTextDetector _generateZeroCrossingVector:zcVectorFlag:width:](self, "_generateZeroCrossingVector:zcVectorFlag:width:", 16, 64, a3->width);
    if (-[VNCCCharBoxContext loopBigBoxPrev](self->_charBoxContext, "loopBigBoxPrev") < a14
      && a6[-[VNCCCharBoxContext loopBigBoxPrev](self->_charBoxContext, "loopBigBoxPrev")].var0 == a11)
    {
      LOBYTE(v70) = a16;
      WORD1(v66) = a10;
      LOWORD(v66) = a3->width;
      return -[VNCCTextDetector extractBoxesForStub:bigBoxesAdapt:countBigBox:rowStartLocation2:rowStopLocation2:heightConstraint:imageWidth:height:ccCharBoxesAggr:ccCharBoxesFiltered:useLowLightEnhancement:](self, "extractBoxesForStub:bigBoxesAdapt:countBigBox:rowStartLocation2:rowStopLocation2:heightConstraint:imageWidth:height:ccCharBoxesAggr:ccCharBoxesFiltered:useLowLightEnhancement:", a6, a7, a14, v66, v72, a9, v70);
    }
    else
    {
      return 1;
    }
  }
  return v17;
}

- (int)_generateCRCharBoxInformation_zcFinalVectorHighProbability:(vImage_Buffer *)a3 zcFinalRange:(unsigned __int16)a4
{
  unsigned int v4;
  char *v7;
  _BYTE *v8;
  vImagePixelCount width;
  char *v10;
  vImagePixelCount v11;
  vImagePixelCount v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char v16;
  vImagePixelCount v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  uint64_t v23;
  _BOOL4 v24;
  int v26;
  double v27;
  float v28;
  float v29;
  uint64_t v30;
  unsigned int v31;
  vImagePixelCount v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  unsigned __int16 v42;
  int v43;
  char *v45;

  v4 = a4;
  v7 = (char *)malloc_type_calloc(3 * a3->width, 1uLL, 0x100004077774924uLL);
  v8 = v7;
  if (v7)
  {
    width = a3->width;
    v10 = &v7[width];
    if (!width)
      goto LABEL_6;
    v11 = 0;
    do
    {
      -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 0x8000, v11);
      -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 0x20000, v11);
      -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 0x4000000, v11++);
      v12 = a3->width;
    }
    while (v12 > v11);
    if (v12 != 1)
    {
LABEL_6:
      v13 = 0;
      do
      {
        if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 128, v13)
          && (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 64, (v13 - 1))|| -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 64, v13)|| -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 64, (v13 + 1))))
        {
          -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x4000000, v13);
        }
        ++v13;
        v12 = a3->width;
      }
      while (v12 - 1 > v13);
      if (v12 >= 2)
      {
        v14 = 1;
        v15 = &v8[2 * width];
        do
        {
          v16 = vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(-[VNCCCharBoxContext charBoxFlags](self->_charBoxContext, "charBoxFlags")[8 * v14] & 0x400400C)));
          v15[v14] = v16;
          v10[v14] = v16;
          if (v15[v14] >= 2u)
            v8[v14] = 1;
          ++v14;
          v12 = a3->width;
        }
        while (v12 > v14);
      }
    }
    v17 = v4 + 1;
    if (v12 - v4 > v17)
    {
      v18 = v4;
      v19 = v4 + 2;
      while (1)
      {
        v20 = v4 + 1;
        if (v8[v17] == 1)
          break;
LABEL_44:
        ++v17;
        ++v19;
        v4 = v20;
        if (v12 - v18 <= v17)
          goto LABEL_49;
      }
      if (v4 + 2 <= (int)v17 + (int)v18)
      {
        v23 = 0;
        v22 = 0;
        v21 = 0;
        do
        {
          if (v8[v4] == 1)
            v21 = v4;
          if (v8[v19 + v23] == 1)
            v22 = v19 + v23;
          ++v23;
          --v4;
        }
        while ((int)v17 + (int)v23 < (v17 + v18));
      }
      else
      {
        v21 = 0;
        v22 = 0;
      }
      v24 = (unsigned __int16)v20 != 0;
      if (!v21)
        v24 = 0;
      if (!v24 || v22 == 0)
      {
        if (v24)
        {
          v26 = (unsigned __int16)v20 + v21;
        }
        else
        {
          if (!(_WORD)v20 || !v22)
          {
            v29 = (float)v20;
            if (!(_WORD)v20)
              v29 = 0.0;
            goto LABEL_43;
          }
          v26 = (unsigned __int16)v20 + v22;
        }
        v27 = (double)v26 * 0.5;
      }
      else
      {
        v27 = (double)((unsigned __int16)v20 + v21 + v22) / 3.0;
      }
      v28 = v27;
      v29 = roundf(v28);
LABEL_43:
      v30 = (int)v29;
      -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x20000, v30);
      -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x8000, v30);
      v12 = a3->width;
      goto LABEL_44;
    }
LABEL_49:
    v31 = -[VNCCTextDetector minBoxWidth](self, "minBoxWidth");
    v32 = a3->width;
    if (v32 - v31 > (int)(v31 + 1))
    {
      v45 = v10;
      v33 = v31;
      v34 = 2 * v31;
      v35 = 2 * v31 + 2;
      v36 = 2;
      v37 = -2;
      do
      {
        if (v35 <= v36)
          v38 = v36;
        else
          v38 = v35;
        v39 = v36 - 1;
        if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x20000, v36 - 1 + v33)&& v39 <= v39 + v34)
        {
          bzero(&v45[v39], v38 + v37 + 1);
        }
        v40 = v33 + v36;
        v32 = a3->width;
        ++v35;
        ++v36;
        --v37;
      }
      while (v32 - v33 > v40);
      v10 = v45;
    }
    if (v32 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v41 = 1;
      v42 = 1;
      do
      {
        if (v10[v42 - 1] && v10[v41])
        {
          v43 = v10[v42 + 1];
          -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x20000, v42);
          -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x8000, v42);
          if (v43)
            ++v42;
          v32 = a3->width;
        }
        v41 = ++v42;
      }
      while (v32 - 1 > v42);
    }
  }
  free(v8);
  return v8 != 0;
}

- (void)fillInOneVector:(vImage_Buffer *)a3 checkFlag:(unint64_t)a4 checkHeight:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v9;
  unsigned int v10;
  vImagePixelCount v11;
  vImagePixelCount i;
  int v13;
  double v14;
  int v15;
  int v16;
  int v17;
  int v18;
  float v19;
  unsigned __int16 v20;
  vImagePixelCount v21;
  int v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  int v26;
  float v27;
  uint64_t v28;
  unsigned int v29;
  BOOL v30;
  unsigned int v32;

  v5 = a5;
  v9 = -[VNCCTextDetector minBoxWidth](self, "minBoxWidth");
  if (a3->width >= 2)
  {
    v10 = v9;
    v11 = v9;
    for (i = 1; a3->width > i; ++i)
    {
      if (v5)
      {
        v13 = -[VNCCCharBoxContext pulseVectorHeightCharBox](self->_charBoxContext, "pulseVectorHeightCharBox")[i];
        -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
        -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
        if (!v13)
          continue;
      }
      if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a4, i))
      {
        if (a3->height == 480)
        {
          v15 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
          v16 = v15 - -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
          v17 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
          v18 = v17 - -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
          v19 = (float)(int)i;
          if (v16 < 16)
          {
            v14 = (double)v18 / 3.0;
            *(float *)&v14 = v14;
          }
          else
          {
            *(float *)&v14 = (float)v18 * 0.5;
          }
          v27 = roundf(*(float *)&v14);
          *(float *)&v14 = v27 + v19;
          if ((float)(v27 + v19) < (float)a3->width)
          {
            v28 = v27 <= v19 ? (int)(float)(v19 - v27) : 0;
            v29 = (int)*(float *)&v14;
            v30 = !(_DWORD)v28 || v29 == 0;
            if (!v30 && v28 <= v29)
            {
              v32 = v29 + 1;
              while (!-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v28))
              {
                v28 = (v28 + 1);
                if (v32 == (_DWORD)v28)
                  goto LABEL_33;
              }
              continue;
            }
          }
        }
        else
        {
          v20 = i - v10;
          if (i < v11)
            v20 = 0;
          v21 = v10 + i;
          if (a3->width <= v21)
            LOWORD(v21) = 0;
          if ((unsigned __int16)(v20 - 1) < (unsigned __int16)v21)
          {
            v22 = 0;
            v23 = v20;
            v24 = (unsigned __int16)v21 + 1;
            do
            {
              v25 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v23);
              v26 = v22 << 31 >> 31;
              v22 = v25 != v26;
              v23 = (v23 + 1);
            }
            while (v24 != (_DWORD)v23);
            if (v25 != v26)
              continue;
          }
        }
LABEL_33:
        -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x8000, i, v14);
      }
    }
  }
}

- (void)_generateCRCharBoxInformation_zcFinalVectorFillIn:(vImage_Buffer *)a3
{
  BOOL v5;
  __int128 v6;
  __int16 v7;
  __int16 v8;
  vImagePixelCount v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  BOOL v14;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unsigned int v20;
  unsigned int v21;
  vImagePixelCount v22;
  unsigned __int16 v23;
  double v24;
  int v25;
  uint64_t v27;
  vImagePixelCount width;
  unsigned __int16 v29;
  unsigned __int16 v30;
  float v31;
  float v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  BOOL v36;
  BOOL v38;
  BOOL v40;
  float v41;
  float v42;
  unsigned int v43;
  float v44;
  float v45;
  uint64_t v46;
  unsigned int v47;
  BOOL v48;
  BOOL v49;
  unsigned int v50;
  float v51;
  uint64_t v52;
  float v53;
  unsigned int v54;
  BOOL v55;
  BOOL v56;
  unsigned int v57;
  float v58;
  uint64_t v59;
  vImagePixelCount v60;
  vImagePixelCount v61;
  int v62;
  unsigned __int16 v63;
  float v64;
  float v65;
  unsigned int v66;
  uint64_t v67;
  unsigned int v68;
  _OWORD v69[2];
  _OWORD v70[2];
  _OWORD v71[2];
  _OWORD v72[2];

  v5 = -[VNCCTextDetector computeZCVectorHighProbability](self, "computeZCVectorHighProbability");
  v6 = *(_OWORD *)&a3->width;
  v72[0] = *(_OWORD *)&a3->data;
  v72[1] = v6;
  -[VNCCTextDetector fillInOneVector:checkFlag:checkHeight:](self, "fillInOneVector:checkFlag:checkHeight:", v72, 0x4000, 0);
  if (a3->width >= 2)
  {
    v7 = 0;
    v8 = 0;
    v9 = 1;
    do
    {
      v10 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x2000, v9);
      v11 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x2000, (v9 - 1));
      if (v11)
        v12 = 1;
      else
        v12 = v10 == 0;
      if (!v12 && v8 == 0)
        v8 = v9;
      if (v8)
        v14 = v11 == 0;
      else
        v14 = 1;
      if (!v14 && v10 == 0)
        v7 = v9 - 1;
      if (v8)
        v16 = v7 == 0;
      else
        v16 = 1;
      if (!v16)
      {
        v17 = *(_OWORD *)&a3->width;
        v71[0] = *(_OWORD *)&a3->data;
        v71[1] = v17;
        -[VNCCTextDetector fillInOneVector:checkFlag:checkHeight:](self, "fillInOneVector:checkFlag:checkHeight:", v71, 8, 1);
        v8 = 0;
        v7 = 0;
      }
      ++v9;
    }
    while (a3->width > v9);
  }
  if (v5)
  {
    v18 = *(_OWORD *)&a3->width;
    v70[0] = *(_OWORD *)&a3->data;
    v70[1] = v18;
    -[VNCCTextDetector fillInOneVector:checkFlag:checkHeight:](self, "fillInOneVector:checkFlag:checkHeight:", v70, 128, 0);
    v19 = *(_OWORD *)&a3->width;
    v69[0] = *(_OWORD *)&a3->data;
    v69[1] = v19;
    -[VNCCTextDetector fillInOneVector:checkFlag:checkHeight:](self, "fillInOneVector:checkFlag:checkHeight:", v69, 64, 0);
  }
  v20 = -[VNCCTextDetector minBoxWidth](self, "minBoxWidth");
  v21 = -[VNCCTextDetector maxBoxWidth](self, "maxBoxWidth");
  if (a3->width)
  {
    v22 = 0;
    v23 = 0;
    v24 = (double)v21 * 1.5;
    v25 = -v20;
    do
    {
      if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v22))
      {
        if (v24 < (double)((unsigned __int16)v22 - v23) && v23 != 0)
        {
          v27 = (unsigned __int16)(v23 + v20);
          if (v27 <= (unsigned __int16)(v22 - v20))
          {
            do
            {
              if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 4, v27))
                -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x8000, v27);
              v27 = (v27 + 1);
            }
            while ((unsigned __int16)v25 + 1 != (_DWORD)v27);
          }
        }
        v23 = v22;
      }
      ++v22;
      width = a3->width;
      LOWORD(v25) = v25 + 1;
    }
    while (width > v22);
    if (width >= 2)
    {
      v29 = 0;
      v30 = 0;
      v31 = (double)v20 * 1.5;
      v32 = roundf(v31);
      v33 = 1;
      while (1)
      {
        v34 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x2000, v33);
        v35 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x2000, (v33 - 1));
        if (v35)
          v36 = 1;
        else
          v36 = v34 == 0;
        if (!v36 && v30 == 0)
          v30 = v33;
        if (v30)
          v38 = v35 == 0;
        else
          v38 = 1;
        if (!v38 && v34 == 0)
          v29 = v33 - 1;
        if (v30)
          v40 = v29 == 0;
        else
          v40 = 1;
        if (v40)
          goto LABEL_113;
        if (a3->height == 480)
          break;
        v58 = (float)v30;
        if (v32 <= v58)
          v59 = (int)(float)(v58 - v32);
        else
          v59 = 0;
        v60 = v20 + v30;
        v61 = a3->width;
        if (v61 <= v60)
          LOWORD(v60) = 0;
        if ((unsigned __int16)(v59 - 1) < (unsigned __int16)v60)
        {
          v62 = (unsigned __int16)v60 + 1;
          do
          {
            -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v59);
            v59 = (v59 + 1);
          }
          while (v62 != (_DWORD)v59);
          v61 = a3->width;
        }
        v30 = 0;
        v63 = v29 - v20;
        if (v20 > v29)
          v63 = 0;
        v64 = (float)v61;
        v65 = v32 + (float)v29;
        v66 = (int)v65;
        if (v65 >= v64)
          v66 = 0;
        if (!v63 || !v66)
        {
          v29 = 0;
          goto LABEL_113;
        }
        v29 = 0;
        if (v66 >= v63)
        {
          v67 = v63;
          v68 = v66 + 1;
          do
          {
            -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v67);
            v67 = (v67 + 1);
          }
          while (v68 != (_DWORD)v67);
LABEL_112:
          v30 = 0;
          v29 = 0;
        }
LABEL_113:
        if (a3->width <= ++v33)
          return;
      }
      v41 = roundf((float)(-[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom")- -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop"))* 0.5);
      v42 = (float)v30;
      v43 = (int)(float)(v42 - v41);
      v49 = v41 > v42;
      v44 = v41 + v42;
      v45 = (float)a3->width;
      if (v49)
        v46 = 0;
      else
        v46 = v43;
      if (v44 >= v45)
        v47 = 0;
      else
        v47 = (int)v44;
      if ((_DWORD)v46)
        v48 = v47 == 0;
      else
        v48 = 1;
      v49 = v48 || v46 > v47;
      if (!v49)
      {
        v50 = v47 + 1;
        do
        {
          -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v46);
          v46 = (v46 + 1);
        }
        while (v50 != (_DWORD)v46);
        v45 = (float)a3->width;
      }
      v30 = 0;
      v51 = (float)v29;
      if (v41 <= v51)
        v52 = (int)(float)(v51 - v41);
      else
        v52 = 0;
      v53 = v41 + v51;
      v54 = (int)v53;
      if (v53 >= v45)
        v54 = 0;
      if ((_DWORD)v52)
        v55 = v54 == 0;
      else
        v55 = 1;
      v56 = v55 || v52 > v54;
      v29 = 0;
      if (v56)
        goto LABEL_113;
      v57 = v54 + 1;
      do
      {
        -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v52);
        v52 = (v52 + 1);
      }
      while (v57 != (_DWORD)v52);
      goto LABEL_112;
    }
  }
}

- (int)_allocateCRCharBoxContext:(unint64_t)a3
{
  return -[VNCCCharBoxContext makeAllocationsForWidth:](self->_charBoxContext, "makeAllocationsForWidth:", a3);
}

- (void)_freeCRCharBoxContext
{
  -[VNCCCharBoxContext releaseAllocations](self->_charBoxContext, "releaseAllocations");
}

- (int)_generateCRCharBoxInformation_extendTextBoxes:(__CCBigBox *)a3 countBigBox:(unsigned __int8)a4 rowStartLocation2:(unsigned __int16)a5 finalCharBoxCoordCount:(unint64_t)a6 finalCoordinatesForStubRevised:(__CCBox *)a7 width:(unint64_t)a8 height:(unsigned __int16)a9 bigBoxIndicator:(char *)a10
{
  uint64_t v10;
  int v11;
  char v12;
  __CCBigBox *v13;
  char v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  int v18;
  __CCBox *v19;
  int var0;
  __int16 v21;
  int v22;
  unint64_t v23;
  int v24;
  unsigned __int16 *p_var3;
  uint64_t v26;
  int v27;
  int v28;
  BOOL v29;
  unsigned __int16 *v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  unsigned __int16 v37;
  char v38;
  unint64_t v39;
  unsigned __int16 v40;
  uint64_t v41;
  unsigned __int16 *p_var2;
  __CCBigBox *v43;
  unsigned __int16 v44;
  unsigned __int16 var1;
  __CCBigBox *v46;
  int var3;
  int var2;
  unsigned __int16 *v49;
  unint64_t v50;
  unsigned __int16 v51;
  unsigned __int16 v52;
  int v53;
  int v55;
  BOOL v56;

  if (a4)
  {
    v10 = 0;
    LOBYTE(v11) = 0;
    v12 = -1;
    v13 = a3;
    v14 = -1;
    do
    {
      if (v13->var0 == a5)
      {
        v15 = v12 == 255;
        if (v12 == 255)
          v12 = v10;
        if ((_BYTE)v11)
          v11 = 1;
        else
          v11 = v15;
        if (v11)
          v14 = v10;
      }
      else
      {
        if ((_BYTE)v11)
          break;
        LOBYTE(v11) = 0;
      }
      ++v13;
      ++v10;
    }
    while (a4 != v10);
  }
  else
  {
    v14 = -1;
    v12 = -1;
  }
  if (a6)
  {
    v16 = 0;
    v17 = 0;
    if (v12 <= v14)
      v18 = v14;
    else
      v18 = v12;
    do
    {
      v19 = &a7[v16];
      var0 = (__int16)v19->var0;
      v21 = v19->var1 + var0;
      if (v12 <= v14)
      {
        p_var3 = &a3[v12].var3;
        v26 = v12;
        while (1)
        {
          v27 = *(p_var3 - 1);
          v28 = *p_var3;
          v29 = var0 >= v27 && v21 <= v28;
          if (v29)
          {
            ++v17;
            goto LABEL_60;
          }
          if (var0 < v27 && v21 >= v27)
          {
            ++v17;
            *(p_var3 - 1) = (var0 - 7) & ~((__int16)(var0 - 7) >> 15);
            goto LABEL_60;
          }
          if (var0 < v28 && v21 > v28)
            break;
          ++v26;
          p_var3 += 254;
          if (v18 + 1 == v26)
            goto LABEL_22;
        }
        ++v17;
        v37 = v21 + 7;
        if (a8 <= (__int16)(v21 + 7))
          v37 = a8 - 1;
        *p_var3 = v37;
LABEL_60:
        v38 = 1;
      }
      else
      {
LABEL_22:
        v22 = v17 + 1;
        v23 = (unsigned __int16)++v17;
        while (v23 < a6)
        {
          v24 = (__int16)a7[v23].var0;
          if (v24 - v21 > 79)
          {
            v17 = v22;
            break;
          }
          v21 = a7[v23].var1 + v24;
          v23 = (unsigned __int16)++v22;
          v17 = v22;
        }
        if ((v12 & 0xFFFF) > v14)
          goto LABEL_73;
        v32 = &a3[(unsigned __int16)v12].var3;
        v26 = (unsigned __int16)v12;
        while (1)
        {
          v33 = (__int16)*(v32 - 1);
          v34 = *v32;
          if (var0 < v33 && v33 <= v21)
            break;
          v35 = (__int16)v34 - var0;
          if (v35 < 0)
            v35 = -v35;
          if (v35 <= 0x50)
          {
            v40 = v21 + 7;
            if (a8 <= (__int16)(v21 + 7))
              v40 = a8 - 1;
            *v32 = v40;
            goto LABEL_71;
          }
          v36 = v21 - v33;
          if (v36 < 0)
            v36 = -v36;
          if (v36 <= 0x50)
          {
            *(v32 - 1) = (var0 - 7) & ~((__int16)(var0 - 7) >> 15);
            goto LABEL_71;
          }
          ++v26;
          v32 += 254;
          if ((int)v26 > v14)
            goto LABEL_73;
        }
        *(v32 - 1) = (var0 - 7) & ~((__int16)(var0 - 7) >> 15);
        if (v21 <= (int)v34)
          v39 = v34;
        else
          v39 = v21;
        if (a8 - 1 < v39)
          LOWORD(v39) = a8 - 1;
        *v32 = v39;
LABEL_71:
        v38 = 2;
      }
      a10[v26] += v38;
LABEL_73:
      v16 = (unsigned __int16)v17;
    }
    while ((unsigned __int16)v17 < a6);
  }
  if ((v12 & 0x80) == 0 && v14 >= v12)
  {
    v41 = v12;
    p_var2 = &a7->var2;
    do
    {
      v43 = &a3[v41];
      v44 = v43->var0;
      var1 = v43->var1;
      if (a6)
      {
        v46 = &a3[v41];
        var3 = v46->var3;
        var2 = v46->var2;
        v49 = p_var2;
        v50 = 1;
        v51 = v43->var1;
        v52 = v43->var0;
        do
        {
          v53 = (__int16)(*(v49 - 1) + *(v49 - 2));
          if ((__int16)*(v49 - 2) >= var2 && v53 <= var3)
          {
            v55 = (__int16)*v49;
            if (v55 < v52)
              v52 = *v49;
            if ((__int16)(v49[1] + v55) > (int)v51)
              v51 = v49[1] + v55;
          }
          v56 = v53 > var3 || v50++ >= a6;
          v49 += 4;
        }
        while (!v56);
      }
      else
      {
        v52 = v43->var0;
        v51 = v43->var1;
      }
      if (v51 < a9)
      {
        v44 = v52;
        var1 = v51;
      }
      v43->var0 = v44;
      v43->var1 = var1;
      v29 = v41++ < v14;
    }
    while (v29);
  }
  return 1;
}

- (int)_generateCRCharBoxInformation:(id)a3 inputImage:(vImage_Buffer *)a4 singleVotingImageAddressRef:(char *)a5 bigBoxes:(__CCBigBox *)a6 bigBoxesAdapt:(__CCBigBox *)a7 textOut:(vImage_Buffer *)a8 adaptOut:(vImage_Buffer *)a9 lowHighRGB:(__rgbMinMaxFloat *)a10 countBigBox:(unsigned __int8)a11 useLowLightEnhancement:(unsigned __int8)a12
{
  id v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int16 *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t *v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  int v35;
  BOOL v36;
  BOOL v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  __int128 v47;
  int v48;
  vImagePixelCount v49;
  __int128 v50;
  double v51;
  double v52;
  __int128 v53;
  float v54;
  int v55;
  vImagePixelCount v56;
  unsigned __int16 v57;
  unsigned __int16 v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  int v64;
  float v65;
  float v66;
  float v67;
  float v68;
  unint64_t v69;
  char v70;
  unsigned __int16 *v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  unsigned __int16 v75;
  int v76;
  int v77;
  int v78;
  void *v79;
  void *v80;
  double v81;
  CFDictionaryRef DictionaryRepresentation;
  void *v83;
  double width;
  double height;
  CFDictionaryRef v86;
  float v87;
  void *v88;
  uint64_t v90;
  unsigned __int16 *p_var2;
  unsigned __int8 *v92;
  void *v94;
  unsigned int v95;
  unsigned int v96;
  CFDictionaryRef v97;
  void *v98;
  unsigned int v99;
  double v100;
  unsigned int v101;
  double v102;
  CFDictionaryRef v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned __int16 *v109;
  __CCBigBox *v110;
  void *v111;
  void *v112;
  _BOOL4 v113;
  vImage_Buffer *v114;
  void *v115;
  void *v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned __int8 *v121;
  char *v122;
  void *v123;
  void *v124;
  vImage_Buffer *v125;
  unsigned __int16 v126;
  unint64_t v127;
  __CCBigBox *v128;
  char *v129;
  void *v130;
  _OWORD v132[2];
  _OWORD v133[2];
  _OWORD v134[2];
  _OWORD v135[2];
  _OWORD v136[2];
  _OWORD v137[2];
  _OWORD v138[2];
  _OWORD v139[2];
  _OWORD v140[2];
  _OWORD v141[2];
  __int16 v142;
  unint64_t v143;
  char v144;
  uint64_t v145;
  _QWORD v146[2];
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;

  v17 = a3;
  LODWORD(v18) = 0;
  v19 = 0;
  if (!v17 || !a5 || !a6 || !a7)
  {
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_77;
  }
  v128 = a7;
  v129 = a5;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  if (a10)
  {
    v21 = malloc_type_calloc(0x32uLL, 0xAuLL, 0x100004080B1215BuLL);
    if (v21)
    {
      v22 = malloc_type_calloc(0x32uLL, 0xAuLL, 0x100004080B1215BuLL);
      if (v22)
      {
        v20 = malloc_type_calloc(0xC8uLL, 8uLL, 0x100004000313F17uLL);
        if (v20)
        {
          v23 = (unsigned __int16 *)malloc_type_calloc(0xC8uLL, 8uLL, 0x100004000313F17uLL);
          if (v23)
          {
            v18 = (unsigned __int8 *)malloc_type_calloc(0xC8uLL, 1uLL, 0x100004077774924uLL);
            if (v18)
            {
              v145 = 0;
              v146[0] = 0;
              v144 = 0;
              v143 = 0;
              v142 = 0;
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("stubBox"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v24)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("stubBox"));

              }
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("stubBoxNormalized"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v26)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("stubBoxNormalized"));

              }
              v120 = -[VNCCTextDetector minHeight](self, "minHeight");
              v119 = -[VNCCTextDetector maxHeight](self, "maxHeight");
              v113 = -[VNCCTextDetector computeZCVectorHighProbability](self, "computeZCVectorHighProbability");
              v28 = -[VNCCCharBoxContext charBoxFlags](self->_charBoxContext, "charBoxFlags");
              v121 = v18;
              v112 = v20;
              v115 = v22;
              v116 = v21;
              v122 = (char *)v23;
              if (a4->height < 2)
              {
                LODWORD(v18) = 1;
              }
              else
              {
                v114 = a8;
                v29 = 0;
                v30 = 0;
                v109 = v23 + 2;
                v31 = 1;
                v32 = *v28;
                do
                {
                  v33 = -[VNCCCharBoxContext charBoxFlags](self->_charBoxContext, "charBoxFlags");
                  v34 = v33[v31];
                  if ((((v32 & 0x1000000) == 0) & BYTE3(v34)) != 0)
                    v35 = v31;
                  else
                    v35 = v29;
                  if ((_WORD)v35)
                    v36 = (v33[v31] & 0x1000000) == 0;
                  else
                    v36 = 0;
                  if (v36)
                    v30 = v31 - 1;
                  if ((_WORD)v35)
                    v37 = v30 == 0;
                  else
                    v37 = 1;
                  if (v37)
                  {
                    LODWORD(v18) = 1;
                  }
                  else
                  {
                    v127 = v33[v31];
                    if (v120 <= (unsigned __int16)(v30 - v35 + 1) && v119 >= (unsigned __int16)(v30 - v35 + 1))
                    {
                      v39 = *(_OWORD *)&a4->width;
                      v141[0] = *(_OWORD *)&a4->data;
                      v141[1] = v39;
                      v40 = *(_OWORD *)&v114->width;
                      v140[0] = *(_OWORD *)&v114->data;
                      v140[1] = v40;
                      v41 = *(_OWORD *)&a9->width;
                      v139[0] = *(_OWORD *)&a9->data;
                      v139[1] = v41;
                      LOBYTE(v108) = a12;
                      LOBYTE(v107) = a11;
                      WORD2(v106) = v30;
                      v126 = v35;
                      WORD1(v106) = v35;
                      LOWORD(v106) = v30 - v35 + 1;
                      v42 = -[VNCCTextDetector _generateCRCharBoxInformation_zcFinalVectorOriginate:textOut:adaptOut:bigBoxes:bigBoxesAdapt:ccCharBoxesAggr:ccCharBoxesFiltered:height:rowStartLocation2:rowStopLocation2:singleVotingImageAddressRef:countBigBox:filterWalkUpDownCount:useLowLightEnhancement:](self, "_generateCRCharBoxInformation_zcFinalVectorOriginate:textOut:adaptOut:bigBoxes:bigBoxesAdapt:ccCharBoxesAggr:ccCharBoxesFiltered:height:rowStartLocation2:rowStopLocation2:singleVotingImageAddressRef:countBigBox:filterWalkUpDownCount:useLowLightEnhancement:", v141, v140, v139, a6, v128, v116, v115, v106, v129, v107, &v142, v108);
                      LOWORD(v35) = v126;
                      if (v42 == 1)
                      {
                        v43 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
                        v44 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
                        v45 = -[VNCCCharBoxContext medianHeightBottom](self->_charBoxContext, "medianHeightBottom");
                        v46 = -[VNCCCharBoxContext medianHeightTop](self->_charBoxContext, "medianHeightTop");
                        if (!v113
                          || (v47 = *(_OWORD *)&a4->width,
                              v138[0] = *(_OWORD *)&a4->data,
                              v138[1] = v47,
                              v48 = -[VNCCTextDetector _generateCRCharBoxInformation_zcFinalVectorHighProbability:zcFinalRange:](self, "_generateCRCharBoxInformation_zcFinalVectorHighProbability:zcFinalRange:", v138, 3), LOWORD(v35) = v126, v48 == 1))
                        {
                          -[VNCCCharBoxContext setLoopBigBoxPrev:](self->_charBoxContext, "setLoopBigBoxPrev:", -[VNCCCharBoxContext loopBigBox](self->_charBoxContext, "loopBigBox"));
                          if (!v113 && a4->width >= 2)
                          {
                            v49 = 1;
                            do
                              -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 0x8000, v49++);
                            while (a4->width > v49);
                          }
                          v50 = *(_OWORD *)&a4->width;
                          v137[0] = *(_OWORD *)&a4->data;
                          v137[1] = v50;
                          -[VNCCTextDetector _generateCRCharBoxInformation_zcFinalVectorFillIn:](self, "_generateCRCharBoxInformation_zcFinalVectorFillIn:", v137);
                          v51 = (double)(v43 - v44) * 0.25 + -1.0;
                          *(float *)&v51 = v51;
                          v52 = (double)(v45 - v46) + (double)(v45 - v46);
                          v53 = *(_OWORD *)&a4->width;
                          v54 = v52;
                          v136[0] = *(_OWORD *)&a4->data;
                          v136[1] = v53;
                          *(float *)&v52 = v54;
                          v55 = -[VNCCTextDetector _generateCRCharBoxInformation_spaceBoxRemovalMagicThresh:magicMinHeight:magicMaxHeight:rowStartLocation2:magicThresh:magicThreshPrev:useLowLightEnhancement:](self, "_generateCRCharBoxInformation_spaceBoxRemovalMagicThresh:magicMinHeight:magicMaxHeight:rowStartLocation2:magicThresh:magicThreshPrev:useLowLightEnhancement:", v136, v126, (char *)v146 + 4, v146, a12, v51, v52);
                          LOWORD(v35) = v126;
                          if (v55 == 1)
                          {
                            if (a4->width)
                            {
                              v56 = 0;
                              v57 = 0;
                              v58 = 0;
                              do
                              {
                                if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 0x8000, v56))
                                {
                                  if (v57)
                                    v58 = v56;
                                  else
                                    v57 = v56;
                                  if (v57 && v58)
                                  {
                                    v59 = v58 - v57;
                                    if (v59 >= 7
                                      && v54 >= (float)v59
                                      && (v60 = *(_OWORD *)&a4->width,
                                          v135[0] = *(_OWORD *)&a4->data,
                                          v135[1] = v60,
                                          -[VNCCTextDetector _generateCRCharBoxInformation_spaceBoxRemovalHistogram:zcStartLeft:zcStopRight:rowStartLocation2:lowHighRGB:histCompliancePercent:varSpaceBox:](self, "_generateCRCharBoxInformation_spaceBoxRemovalHistogram:zcStartLeft:zcStopRight:rowStartLocation2:lowHighRGB:histCompliancePercent:varSpaceBox:", v135, v57, v58, v126, a10, (char *)&v145 + 4, &v145), LOBYTE(v105) = a12, -[VNCCTextDetector _generateCRCharBoxInformation_spaceBoxRemovalTruthFilter:magicThresh:zcStartLeft:zcStopRight:isSpaceBoxAccepted:histCompliancePercent:useLowLightEnhancement:](self, "_generateCRCharBoxInformation_spaceBoxRemovalTruthFilter:magicThresh:zcStartLeft:zcStopRight:isSpaceBoxAccepted:histCompliancePercent:useLowLightEnhancement:", &v145, (char *)v146 + 4, v57, v58,
                                            &v144,
                                            (char *)&v145 + 4,
                                            v105),
                                          v144))
                                    {
                                      v61 = *(_OWORD *)&a4->width;
                                      v134[0] = *(_OWORD *)&a4->data;
                                      v134[1] = v61;
                                      v62 = *(_OWORD *)&a9->width;
                                      v133[0] = *(_OWORD *)&a9->data;
                                      v133[1] = v62;
                                      v63 = *(_OWORD *)&v114->width;
                                      v132[0] = *(_OWORD *)&v114->data;
                                      v132[1] = v63;
                                      LOBYTE(v107) = a12;
                                      -[VNCCTextDetector _generateCRCharBoxInformation_spaceBoxRemovalTightenBox:singleVotingImageAddressRef:adaptOut:textOut:zcStartLeft:zcStopRight:finalCoordinatesForStub:finalCoordinatesForStubRevised:finalCharBoxCoordCount:useLowLightEnhancement:](self, "_generateCRCharBoxInformation_spaceBoxRemovalTightenBox:singleVotingImageAddressRef:adaptOut:textOut:zcStartLeft:zcStopRight:finalCoordinatesForStub:finalCoordinatesForStubRevised:finalCharBoxCoordCount:useLowLightEnhancement:", v134, v129, v133, v132, v57, v58, v112, v122, &v143, v107);
                                      v57 = v58;
                                    }
                                    else
                                    {
                                      v57 = v58;
                                    }
                                  }
                                }
                                ++v56;
                              }
                              while (a4->width > v56);
                            }
                            v23 = (unsigned __int16 *)v122;
                            v64 = -[VNCCTextDetector _generateCRCharBoxInformation_TrackBox:finalCharBoxCoordCount:](self, "_generateCRCharBoxInformation_TrackBox:finalCharBoxCoordCount:", v122, &v143);
                            LOWORD(v35) = v126;
                            if (v64 == 1)
                            {
                              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                              v111 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E4549388);
                              v124 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E4549388);
                              v123 = (void *)objc_claimAutoreleasedReturnValue();
                              v118 = -[VNCCTextDetector pixelHeightCard](self, "pixelHeightCard");
                              v117 = -[VNCCTextDetector pixelWidthCard](self, "pixelWidthCard");
                              -[VNCCTextDetector mmHeightCard](self, "mmHeightCard");
                              v66 = v65;
                              v110 = a6;
                              -[VNCCTextDetector mmWidthCard](self, "mmWidthCard");
                              if (v143)
                              {
                                v68 = v67;
                                v69 = 0;
                                v70 = 1;
                                v71 = v109;
                                v130 = v17;
                                v125 = a4;
                                do
                                {
                                  v72 = *(v71 - 2);
                                  v73 = *(v71 - 1);
                                  v74 = *v71;
                                  v75 = v71[1];
                                  if ((v70 & 1) == 0)
                                  {
                                    objc_msgSend(v124, "appendString:", CFSTR(", "));
                                    objc_msgSend(v123, "appendString:", CFSTR(", "));
                                  }
                                  v76 = (unsigned __int16)(v73 + v72) - (_DWORD)v72;
                                  v77 = (unsigned __int16)(v75 + v74);
                                  v78 = v77 - v74;
                                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%i,%i},{%i,%i}}"), v72, v74, v76, (v77 - v74));
                                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v130, "objectForKey:", CFSTR("stubBox"));
                                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                                  v81 = (double)v74;
                                  v147.origin.x = (double)v72;
                                  v147.origin.y = (double)v74;
                                  v147.size.width = (double)v76;
                                  v147.size.height = (double)(v77 - (int)v74);
                                  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v147);
                                  objc_msgSend(v80, "addObject:", DictionaryRepresentation);

                                  objc_msgSend(v130, "objectForKey:", CFSTR("stubBoxNormalized"));
                                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                                  width = (double)v125->width;
                                  v148.origin.x = (double)v72 / width;
                                  height = (double)v125->height;
                                  v148.origin.y = v81 / height;
                                  v148.size.width = (double)v76 / width;
                                  v148.size.height = (double)v78 / height;
                                  v86 = CGRectCreateDictionaryRepresentation(v148);
                                  objc_msgSend(v83, "addObject:", v86);

                                  objc_msgSend(v124, "appendString:", v79);
                                  v87 = v66 * (float)((v118 - v77) / v118);
                                  if (v87 < 0.0)
                                    v87 = 0.0;
                                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%2.4f,%2.4f},{%2.4f,%2.4f}}"), (float)(v68 * (float)(v72 / v117)), v87, (float)(v68 * (float)(v76 / v117)), (float)(v66 * (float)(v78 / v118)));
                                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                                  v17 = v130;
                                  objc_msgSend(v123, "appendString:", v88);
                                  a4 = v125;
                                  v23 = (unsigned __int16 *)v122;
                                  v71 += 4;

                                  v70 = 0;
                                  ++v69;
                                }
                                while (v143 > v69);
                              }
                              objc_msgSend(v111, "setValue:forKey:", v124, CFSTR("stubBox"));
                              objc_msgSend(v111, "setValue:forKey:", v123, CFSTR("stubBoxMM"));

                              a6 = v110;
                              LOWORD(v35) = v126;
                            }
                          }
                        }
                      }
                    }
                    LOWORD(v104) = a4->height;
                    LODWORD(v18) = -[VNCCTextDetector _generateCRCharBoxInformation_extendTextBoxes:countBigBox:rowStartLocation2:finalCharBoxCoordCount:finalCoordinatesForStubRevised:width:height:bigBoxIndicator:](self, "_generateCRCharBoxInformation_extendTextBoxes:countBigBox:rowStartLocation2:finalCharBoxCoordCount:finalCoordinatesForStubRevised:width:height:bigBoxIndicator:", a6, a11, (unsigned __int16)v35, v143, v23, a4->width, v104, v121);
                    v30 = 0;
                    v35 = 0;
                    v143 = 0;
                    LODWORD(v34) = v127;
                  }
                  if (a4->height <= ++v31)
                    break;
                  v29 = v35;
                  LODWORD(v32) = v34;
                }
                while ((_DWORD)v18 == 1);
              }
              v20 = v112;
              v90 = a11;
              if (a11)
              {
                p_var2 = &a6->var2;
                v92 = v121;
                do
                {
                  if (*v92++)
                  {
                    objc_msgSend(v17, "objectForKey:", CFSTR("textBoxRevised"));
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    v95 = *p_var2;
                    v149.origin.x = (double)v95;
                    v96 = *(p_var2 - 2);
                    v149.origin.y = (double)v96;
                    v149.size.width = (double)(int)(p_var2[1] - v95);
                    v149.size.height = (double)(int)(*(p_var2 - 1) - v96);
                    v97 = CGRectCreateDictionaryRepresentation(v149);
                    objc_msgSend(v94, "addObject:", v97);

                    objc_msgSend(v17, "objectForKey:", CFSTR("textBoxRevisedNormalized"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    v99 = *p_var2;
                    v100 = (double)a4->width;
                    v150.origin.x = (double)v99 / v100;
                    v101 = *(p_var2 - 2);
                    v102 = (double)a4->height;
                    v150.origin.y = (double)v101 / v102;
                    v150.size.width = (double)(int)(p_var2[1] - v99) / v100;
                    v150.size.height = (double)(int)(*(p_var2 - 1) - v101) / v102;
                    v103 = CGRectCreateDictionaryRepresentation(v150);
                    objc_msgSend(v98, "addObject:", v103);

                  }
                  p_var2 += 254;
                  --v90;
                }
                while (v90);
              }
              v22 = v115;
              v21 = v116;
              v19 = v121;
              v23 = (unsigned __int16 *)v122;
            }
            else
            {
              v19 = 0;
            }
            goto LABEL_77;
          }
          v19 = 0;
LABEL_76:
          LODWORD(v18) = 0;
          goto LABEL_77;
        }
        v19 = 0;
      }
      else
      {
        v19 = 0;
        v20 = 0;
      }
    }
    else
    {
      v19 = 0;
      v20 = 0;
      v22 = 0;
    }
    v23 = 0;
    goto LABEL_76;
  }
LABEL_77:
  free(v21);
  free(v22);
  free(v20);
  free(v23);
  free(v19);

  return (int)v18;
}

- (int)_generatePulseVectorOutputs:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 rowLocationsRef:(unsigned __int16 *)a5
{
  uint64_t height_low;
  unsigned __int8 v10;
  unsigned __int8 v11;
  double v12;
  double v13;
  double v14;
  int result;
  vImagePixelCount v16;
  vImagePixelCount height;
  vImagePixelCount v18;
  vImagePixelCount i;
  uint64_t v20;
  _WORD v21[4];
  __int128 v22;
  uint64_t v23;

  if (!a5)
    return 0;
  v21[0] = -[VNCCTextDetector startNormal](self, "startNormal");
  v21[1] = -[VNCCTextDetector stopNormal](self, "stopNormal");
  v21[2] = -[VNCCTextDetector startSensitized](self, "startSensitized");
  v21[3] = -[VNCCTextDetector stopSensitized](self, "stopSensitized");
  v22 = xmmword_1A15FB730;
  LOWORD(v22) = 257;
  v23 = 512;
  height_low = LOWORD(a3->height);
  v10 = -[VNCCTextDetector minHeight](self, "minHeight");
  v11 = -[VNCCTextDetector maxHeight](self, "maxHeight");
  LOWORD(v20) = a4->rowBytes;
  LODWORD(v12) = 1025758986;
  LODWORD(v13) = 1017370378;
  LODWORD(v14) = 1005961871;
  result = -[VNCCTextDetector _getFilterResultOutBothSumDeriv:floatVectorResult:bufferHeight:minHeight:maxHeight:config:bytesPerRow:thresholdSet:sampleImageAddressRef:](self, "_getFilterResultOutBothSumDeriv:floatVectorResult:bufferHeight:minHeight:maxHeight:config:bytesPerRow:thresholdSet:sampleImageAddressRef:", 0, 0, height_low, v10, v11, v21, v12, v13, v14, v20, a4->data);
  if (result == 1)
  {
    -[VNCCTextDetector _generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:](self, "_generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:", 256, 512, 0x100000, 0, LOWORD(a3->height), LOWORD(a3->width));
    -[VNCCTextDetector _generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:](self, "_generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:", 1024, 2048, 0x200000, 0, LOWORD(a3->height), LOWORD(a3->width));
    if (a3->height)
    {
      v16 = 0;
      do
      {
        -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", 0x100000, 0x400000, v16);
        -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", 0x200000, 0x800000, v16++);
        height = a3->height;
      }
      while (height > v16);
    }
    else
    {
      height = 0;
    }
    -[VNCCTextDetector _generateFilteredPulseVector:target:height:](self, "_generateFilteredPulseVector:target:height:", 0x100000, 0x400000, height);
    -[VNCCTextDetector _generateFilteredPulseVector:target:height:](self, "_generateFilteredPulseVector:target:height:", 0x200000, 0x800000, a3->height);
    -[VNCCTextDetector _generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:](self, "_generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:", 0x200000, 0x100000, 0x1000000, 0, LOWORD(a3->height), LOWORD(a3->width));
    -[VNCCTextDetector _generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:](self, "_generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:", 0x800000, 0x400000, 0x1000000, 0, LOWORD(a3->height), LOWORD(a3->width));
    -[VNCCTextDetector generateDominantPulse:rowLocationsRef:debugOut:bufferHeight:bufferWidth:](self, "generateDominantPulse:rowLocationsRef:debugOut:bufferHeight:bufferWidth:", 0x1000000, a5, -[VNCCTextDetector debugOut](self, "debugOut"), LOWORD(a3->height), LOWORD(a3->width));
    v18 = a3->height;
    if (v18)
    {
      for (i = 0; i < v18; ++i)
      {
        -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", 0x1000000, 0x80000, i);
        v18 = a3->height;
      }
    }
    -[VNCCTextDetector _generatePulseAggregateSmallStubs:pulseVectorResult:bufferHeight:bufferWidth:](self, "_generatePulseAggregateSmallStubs:pulseVectorResult:bufferHeight:bufferWidth:", 0x80000, 0x1000000, (unsigned __int16)v18, LOWORD(a3->width));
    return 1;
  }
  return result;
}

- (id)textBoxesForBuffer:(vImage_Buffer *)a3 error:(id *)a4
{
  id v7;
  id v8;
  vImagePixelCount height;
  int v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BOOL4 v16;
  unsigned int v17;
  unsigned __int16 v18;
  int v19;
  unsigned __int16 v20;
  unsigned int v21;
  unsigned int v22;
  id v23;
  char v25;
  char v26;
  int v27;
  BOOL v28;
  __int128 v29;
  vImagePixelCount v30;
  vImagePixelCount v31;
  unsigned __int8 v32;
  double v33;
  double v34;
  double v35;
  vImagePixelCount v36;
  int v37;
  __int128 v39;
  __int128 v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  _BOOL4 v46;
  unsigned int v47;
  unsigned __int16 v48;
  int v49;
  int v50;
  _OWORD v51[2];
  _OWORD v52[2];
  _OWORD v53[2];
  _OWORD v54[2];
  _OWORD v55[2];
  _OWORD v56[2];
  _OWORD v57[2];
  _OWORD v58[2];
  _OWORD v59[2];
  _OWORD v60[2];
  _OWORD v61[2];
  _OWORD v62[2];
  _OWORD v63[2];
  _OWORD v64[2];
  _OWORD v65[2];
  _OWORD v66[2];
  _OWORD v67[2];
  _OWORD v68[2];
  _OWORD v69[2];
  _OWORD v70[2];
  _OWORD v71[2];
  _OWORD v72[2];
  unsigned int v73;
  unsigned __int8 v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _OWORD v84[3];
  uint64_t v85;
  int v86;
  unsigned __int16 v87;
  unsigned __int16 v88;
  unsigned __int16 v89;
  unsigned __int16 v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v75 = 0;
  v74 = 0;
  v73 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3->width <= a3->height)
    height = a3->height;
  else
    height = a3->width;
  v10 = -[VNCCTextDetector _allocateCRCharBoxContext:](self, "_allocateCRCharBoxContext:", height);
  if (v10 != 1
    || (v10 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", a3->width, a3->height, a3->width, &v82), v10 != 1)|| (v10 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", a3->width, a3->height, a3->width, &v80), v10 != 1)|| (v10 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", a3->width,
                a3->height,
                a3->width,
                &v78),
        v10 != 1)
    || (v10 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:"), v10 != 1))
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_18;
  }
  v11 = malloc_type_calloc(0xC8uLL, 0x1FCuLL, 0x10000402E06451DuLL);
  if (!v11)
  {
    v12 = 0;
    v10 = 0;
    goto LABEL_18;
  }
  v12 = malloc_type_calloc(0xC8uLL, 0x1FCuLL, 0x10000402E06451DuLL);
  v86 = 0;
  v85 = 0;
  memset(v84, 0, sizeof(v84));
  v13 = *(_OWORD *)&a3->width;
  v72[0] = *(_OWORD *)&a3->data;
  v72[1] = v13;
  -[VNCCTextDetector initializeForImage:](self, "initializeForImage:", v72);
  v14 = *(_OWORD *)&a3->width;
  v71[0] = *(_OWORD *)&a3->data;
  v71[1] = v14;
  v70[0] = v82;
  v70[1] = v83;
  v10 = -[VNCCTextDetector _generateVotingImage:votingImage:useLowLightEnhancement:](self, "_generateVotingImage:votingImage:useLowLightEnhancement:", v71, v70, &v74);
  if (v10 == 1)
  {
    v15 = *(_OWORD *)&a3->width;
    v69[0] = *(_OWORD *)&a3->data;
    v69[1] = v15;
    v68[0] = v82;
    v68[1] = v83;
    v10 = -[VNCCTextDetector _generatePulseVectorOutputs:votingImage:rowLocationsRef:](self, "_generatePulseVectorOutputs:votingImage:rowLocationsRef:", v69, v68, &v87);
    if (v10 == 1)
    {
      v16 = -[VNCCTextDetector computeZCVectorHighProbability](self, "computeZCVectorHighProbability");
      v17 = -[VNCCTextDetector minHeight](self, "minHeight");
      v18 = v88;
      v19 = v89;
      v20 = v90;
      v50 = v87;
      v21 = v88 - v87;
      v22 = v90 - v89;
      if (v21 <= v17 && v22 <= v17)
      {
LABEL_14:
        if (v21 > v17 || v22 > v17)
        {
          v40 = *(_OWORD *)&a3->width;
          if (v16)
          {
            v56[0] = *(_OWORD *)&a3->data;
            v56[1] = v40;
            v55[0] = v80;
            v55[1] = v81;
            v54[0] = v78;
            v54[1] = v79;
            BYTE1(v44) = v74;
            LOBYTE(v44) = v75;
            v41 = -[VNCCTextDetector _generateCRCharBoxInformation:inputImage:singleVotingImageAddressRef:bigBoxes:bigBoxesAdapt:textOut:adaptOut:lowHighRGB:countBigBox:useLowLightEnhancement:](self, "_generateCRCharBoxInformation:inputImage:singleVotingImageAddressRef:bigBoxes:bigBoxesAdapt:textOut:adaptOut:lowHighRGB:countBigBox:useLowLightEnhancement:", v8, v56, (_QWORD)v82, v11, v12, v55, v54, v84, v44);
          }
          else
          {
            v53[0] = *(_OWORD *)&a3->data;
            v53[1] = v40;
            v52[0] = v80;
            v52[1] = v81;
            v51[0] = v80;
            v51[1] = v81;
            BYTE1(v44) = v74;
            LOBYTE(v44) = v75;
            v41 = -[VNCCTextDetector _generateCRCharBoxInformation:inputImage:singleVotingImageAddressRef:bigBoxes:bigBoxesAdapt:textOut:adaptOut:lowHighRGB:countBigBox:useLowLightEnhancement:](self, "_generateCRCharBoxInformation:inputImage:singleVotingImageAddressRef:bigBoxes:bigBoxesAdapt:textOut:adaptOut:lowHighRGB:countBigBox:useLowLightEnhancement:", v8, v53, (_QWORD)v82, v11, v11, v52, v51, v84, v44);
          }
          v10 = v41;
        }
        else
        {
          v10 = 1;
        }
        goto LABEL_18;
      }
      v45 = v90 - v89;
      v46 = v16;
      v47 = v17;
      v25 = 0;
      v26 = 1;
      v48 = v90;
      v49 = v89;
      do
      {
        if ((v26 & 1) == 0)
          v18 = v20;
        v27 = v50;
        if ((v26 & 1) == 0)
          v27 = v19;
        v50 = v27;
        if ((_WORD)v27)
          v28 = v18 == 0;
        else
          v28 = 1;
        if (!v28)
        {
          v29 = *(_OWORD *)&a3->width;
          v67[0] = *(_OWORD *)&a3->data;
          v67[1] = v29;
          v66[0] = v82;
          v66[1] = v83;
          v65[0] = v80;
          v65[1] = v81;
          LOBYTE(v44) = v74;
          WORD1(v42) = v18;
          LOWORD(v42) = v27;
          v10 = -[VNCCTextDetector _generateAndApplyColorProfileForImage:votingImage:textOut:minMaxRGB:lowHighRGB:numCropRows:rowStartLocation:rowStopLocation:sumTextOutFirstPass:useLowLightEnhancement:](self, "_generateAndApplyColorProfileForImage:votingImage:textOut:minMaxRGB:lowHighRGB:numCropRows:rowStartLocation:rowStopLocation:sumTextOutFirstPass:useLowLightEnhancement:", v67, v66, v65, &v85, v84, (unsigned __int16)(v18 - v27 + 1), v42, &v73, v44);
          if (v10 != 1)
            goto LABEL_18;
          v25 = v26 & ((float)((float)v73 / (float)(a3->width * a3->height)) > 0.667);
          v20 = v48;
          v19 = v49;
        }
        v26 = 0;
        v28 = v25 == 0;
        v25 = 1;
      }
      while (!v28);
      v64[0] = v80;
      v64[1] = v81;
      v63[0] = v76;
      v63[1] = v77;
      v10 = -[VNCCTextDetector _generateSmoothedImage:uImage:](self, "_generateSmoothedImage:uImage:", v64, v63);
      if (v10 == 1)
      {
        if (a3->height)
        {
          v30 = 0;
          do
            -[VNCCCharBoxContext clearFlag:atIndex:](self->_charBoxContext, "clearFlag:atIndex:", 512, v30++);
          while (a3->height > v30);
        }
        v62[0] = 0u;
        LOWORD(v62[0]) = -[VNCCTextDetector startSensitized](self, "startSensitized");
        WORD1(v62[0]) = -[VNCCTextDetector stopSensitized](self, "stopSensitized");
        v62[1] = 0x200uLL;
        v31 = a3->height;
        v32 = -[VNCCTextDetector maxHeight](self, "maxHeight");
        LOWORD(v42) = a3->width;
        LODWORD(v33) = 1025758986;
        LODWORD(v34) = 1017370378;
        LODWORD(v35) = 1005961871;
        v10 = -[VNCCTextDetector _getFilterResultOutBothSumDeriv:floatVectorResult:bufferHeight:minHeight:maxHeight:config:bytesPerRow:thresholdSet:sampleImageAddressRef:](self, "_getFilterResultOutBothSumDeriv:floatVectorResult:bufferHeight:minHeight:maxHeight:config:bytesPerRow:thresholdSet:sampleImageAddressRef:", 1, 0, (unsigned __int16)v31, v47, v32, v62, v33, v34, v35, v42, (_QWORD)v76);
        if (v10 == 1)
        {
          -[VNCCTextDetector _generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:](self, "_generatePulseAggregate:pulseVectorMain:pulseVectorResult:metricSelection:bufferHeight:bufferWidth:", 512, 0x1000000, 0x2000000, 1, LOWORD(a3->height), LOWORD(a3->width));
          v16 = v46;
          if (a3->height >= 2)
          {
            v36 = 1;
            do
              -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", 0x2000000, 0x1000000, v36++);
            while (a3->height > v36);
          }
          v61[0] = v76;
          v61[1] = v77;
          LOBYTE(v43) = v74;
          v37 = -[VNCCTextDetector _generateBoxes:pulseVector:uImage:countBigBoxOut:bigBoxes:bigBoxesA:useLowLightEnhancement:](self, "_generateBoxes:pulseVector:uImage:countBigBoxOut:bigBoxes:bigBoxesA:useLowLightEnhancement:", v8, 0x1000000, v61, &v75, v11, v12, v43);
          v10 = v37;
          if (v37 == 1 && v46)
          {
            v39 = *(_OWORD *)&a3->width;
            v60[0] = *(_OWORD *)&a3->data;
            v60[1] = v39;
            v59[0] = v78;
            v59[1] = v79;
            v10 = -[VNCCTextDetector _generateAdaptiveBinarization:adaptImage:useLowLightEnhancement:](self, "_generateAdaptiveBinarization:adaptImage:useLowLightEnhancement:", v60, v59, v74);
            if (v10 != 1)
              goto LABEL_18;
            v58[0] = v78;
            v58[1] = v79;
            -[VNCCTextDetector _generateCC:ccBigBoxes:textOut:countBigBox:bufferHeight:](self, "_generateCC:ccBigBoxes:textOut:countBigBox:bufferHeight:", v7, v12, v58, v75, LOWORD(a3->height));
          }
          else if (v37 != 1)
          {
            goto LABEL_18;
          }
          v57[0] = v80;
          v57[1] = v81;
          -[VNCCTextDetector _generateCC:ccBigBoxes:textOut:countBigBox:bufferHeight:](self, "_generateCC:ccBigBoxes:textOut:countBigBox:bufferHeight:", v7, v11, v57, v75, LOWORD(a3->height));
          v21 = v18 - (unsigned __int16)v50;
          v17 = v47;
          v22 = v45;
          goto LABEL_14;
        }
      }
    }
  }
LABEL_18:
  free(v11);
  free(v12);
  -[VNCCTextDetector _freeCRCharBoxContext](self, "_freeCRCharBoxContext");
  -[VNCCTextDetector _freeVImage:](self, "_freeVImage:", &v82);
  -[VNCCTextDetector _freeVImage:](self, "_freeVImage:", &v76);
  -[VNCCTextDetector _freeVImage:](self, "_freeVImage:", &v78);
  -[VNCCTextDetector _freeVImage:](self, "_freeVImage:", &v80);
  if (v10)
  {
    v23 = v8;
  }
  else
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNCCTextDetector internal error"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = (id)MEMORY[0x1E0C9AA70];
  }

  return v23;
}

- (id)textBoxesForImage:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CVBuffer *v14;
  id v15;
  id v16;
  void *BaseAddress;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void *v21;
  void *v22;
  void *v23;
  VNTextObservation *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  const __CFDictionary *v31;
  VNRectangleObservation *v32;
  VNRectangleObservation *v33;
  void *v35;
  __CVBuffer *pixelBuffer;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  VNTextObservation *v44;
  uint64_t i;
  CGRect v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CGRect rect;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v37 = v8;
  v10 = objc_msgSend(v8, "width");
  v11 = objc_msgSend(v8, "height");
  if (v10 >= v11)
    v12 = 480;
  else
    v12 = 768;
  if (v10 >= v11)
    v13 = 768;
  else
    v13 = 480;
  v58 = 0;
  v14 = (__CVBuffer *)objc_msgSend(v8, "bufferWithWidth:height:format:options:error:", v13, v12, 1111970369, 0, &v58);
  v15 = v58;
  v16 = v15;
  if (v14)
  {
    CVPixelBufferLockBaseAddress(v14, 1uLL);
    BaseAddress = CVPixelBufferGetBaseAddress(v14);
    Width = CVPixelBufferGetWidth(v14);
    Height = CVPixelBufferGetHeight(v14);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
    -[VNCCTextDetector setComputeZCVectorHighProbability:](self, "setComputeZCVectorHighProbability:", 1);
    pixelBuffer = v14;
    v57[0] = BaseAddress;
    v57[1] = Height;
    v57[2] = Width;
    v57[3] = BytesPerRow;
    v56 = v16;
    -[VNCCTextDetector textBoxesForBuffer:error:](self, "textBoxesForBuffer:error:", v57, &v56);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v56;

    CVPixelBufferUnlockBaseAddress(v14, 1uLL);
    if (v38)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v38);
      CVPixelBufferRelease(v14);
      v21 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("stubBoxNormalized"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "arrayWithArray:", v23);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("textBoxRevisedNormalized"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v43)
      {
        v42 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v53 != v42)
              objc_enumerationMutation(obj);
            if (CGRectMakeWithDictionaryRepresentation(*(CFDictionaryRef *)(*((_QWORD *)&v52 + 1) + 8 * i), &rect))
            {
              v24 = [VNTextObservation alloc];
              v44 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:](v24, "initWithOriginatingRequestSpecifier:boundingBox:", v9, rect.origin.x, 1.0 - rect.origin.y - rect.size.height, rect.size.width);
              v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              v27 = v39;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v48;
                do
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v48 != v29)
                      objc_enumerationMutation(v27);
                    v31 = *(const __CFDictionary **)(*((_QWORD *)&v47 + 1) + 8 * j);
                    if (CGRectMakeWithDictionaryRepresentation(v31, &v46))
                    {
                      v62 = CGRectIntersection(v46, rect);
                      *(float *)&v62.origin.x = v62.size.width * v62.size.height / (v46.size.width * v46.size.height);
                      if (*(float *)&v62.origin.x >= 0.25)
                      {
                        v32 = [VNRectangleObservation alloc];
                        v33 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:](v32, "initWithOriginatingRequestSpecifier:boundingBox:", v9, v46.origin.x, 1.0 - v46.origin.y - v46.size.height, v46.size.width);
                        objc_msgSend(v25, "addObject:", v33);
                        objc_msgSend(v26, "addObject:", v31);

                      }
                    }
                  }
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                }
                while (v28);
              }

              objc_msgSend(v27, "removeObjectsInArray:", v26);
              -[VNTextObservation setCharacterBoxes:](v44, "setCharacterBoxes:", v25);
              objc_msgSend(v40, "addObject:", v44);

            }
          }
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v43);
      }

      objc_msgSend(v40, "sortedArrayUsingComparator:", &__block_literal_global_25003);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CVPixelBufferRelease(pixelBuffer);

    }
    v16 = v38;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA60];
    if (a5 && v15)
    {
      v16 = objc_retainAutorelease(v15);
      *a5 = v16;
    }
  }

  return v21;
}

- (VNCCCharBoxContext)charBoxContext
{
  return (VNCCCharBoxContext *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCharBoxContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)computeZCVectorHighProbability
{
  return self->_computeZCVectorHighProbability;
}

- (void)setComputeZCVectorHighProbability:(BOOL)a3
{
  self->_computeZCVectorHighProbability = a3;
}

- (int)midRow
{
  return self->_midRow;
}

- (void)setMidRow:(int)a3
{
  self->_midRow = a3;
}

- (unsigned)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(unsigned int)a3
{
  self->_minHeight = a3;
}

- (unsigned)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(unsigned int)a3
{
  self->_maxHeight = a3;
}

- (unsigned)startMaxFind
{
  return self->_startMaxFind;
}

- (void)setStartMaxFind:(unsigned int)a3
{
  self->_startMaxFind = a3;
}

- (unsigned)stopMaxFind
{
  return self->_stopMaxFind;
}

- (void)setStopMaxFind:(unsigned int)a3
{
  self->_stopMaxFind = a3;
}

- (float)mmHeightCard
{
  return self->_mmHeightCard;
}

- (void)setMmHeightCard:(float)a3
{
  self->_mmHeightCard = a3;
}

- (float)mmWidthCard
{
  return self->_mmWidthCard;
}

- (void)setMmWidthCard:(float)a3
{
  self->_mmWidthCard = a3;
}

- (unsigned)pixelHeightCard
{
  return self->_pixelHeightCard;
}

- (void)setPixelHeightCard:(unsigned int)a3
{
  self->_pixelHeightCard = a3;
}

- (unsigned)pixelWidthCard
{
  return self->_pixelWidthCard;
}

- (void)setPixelWidthCard:(unsigned int)a3
{
  self->_pixelWidthCard = a3;
}

- (unsigned)minBoxWidth
{
  return self->_minBoxWidth;
}

- (void)setMinBoxWidth:(unsigned int)a3
{
  self->_minBoxWidth = a3;
}

- (unsigned)maxBoxWidth
{
  return self->_maxBoxWidth;
}

- (void)setMaxBoxWidth:(unsigned int)a3
{
  self->_maxBoxWidth = a3;
}

- (unsigned)startNormal
{
  return self->_startNormal;
}

- (void)setStartNormal:(unsigned int)a3
{
  self->_startNormal = a3;
}

- (unsigned)stopNormal
{
  return self->_stopNormal;
}

- (void)setStopNormal:(unsigned int)a3
{
  self->_stopNormal = a3;
}

- (unsigned)startSensitized
{
  return self->_startSensitized;
}

- (void)setStartSensitized:(unsigned int)a3
{
  self->_startSensitized = a3;
}

- (unsigned)stopSensitized
{
  return self->_stopSensitized;
}

- (void)setStopSensitized:(unsigned int)a3
{
  self->_stopSensitized = a3;
}

- (unsigned)ii
{
  return self->_ii;
}

- (void)setIi:(unsigned __int8)a3
{
  self->_ii = a3;
}

- (unsigned)profileNormal
{
  return self->_profileNormal;
}

- (void)setProfileNormal:(unsigned __int8)a3
{
  self->_profileNormal = a3;
}

- (BOOL)debugMatlab
{
  return self->_debugMatlab;
}

- (void)setDebugMatlab:(BOOL)a3
{
  self->_debugMatlab = a3;
}

- (BOOL)debugOut
{
  return self->_debugOut;
}

- (void)setDebugOut:(BOOL)a3
{
  self->_debugOut = a3;
}

- (NSString)debugFilename
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDebugFilename:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugFilename, 0);
  objc_storeStrong((id *)&self->_charBoxContext, 0);
  objc_storeStrong((id *)&self->_VNMetalInterface, 0);
}

uint64_t __72__VNCCTextDetector_textBoxesForImage_originatingRequestSpecifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "characterBoxes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "characterBoxes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 > v8)
    v9 = -1;
  else
    v9 = v6 < v8;

  return v9;
}

@end
