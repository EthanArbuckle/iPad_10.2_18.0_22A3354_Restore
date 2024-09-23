@implementation VCPGaborFilter

- (VCPGaborFilter)initWithNumberOfScales:(int)numScales numOfOrientations:(int)numOrientations width:(unint64_t)a5 height:(unint64_t)a6
{
  VCPGaborFilter *v10;
  VCPGaborFilter *v11;
  VCPGaborFilter *v12;
  size_t v13;
  Kernel **v14;
  uint64_t v15;
  float v16;
  size_t v17;
  const std::nothrow_t *v18;
  float v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  Kernel **filterBanks;
  Kernel *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  Kernel *v29;
  __int128 v30;
  VCPGaborFilter *v31;
  __int128 v33;
  unint64_t var2;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)VCPGaborFilter;
  v10 = -[VCPGaborFilter init](&v35, sel_init);
  v11 = v10;
  if (v10)
  {
    v12 = 0;
    if ((a5 & a6 & 1) != 0 && (a6 | a5) >= 2)
    {
      v10->_numScales = numScales;
      v10->_numOrientations = numOrientations;
      v10->_num = numOrientations * numScales;
      if (numScales < 0)
        v13 = -1;
      else
        v13 = 8 * numScales;
      v14 = (Kernel **)operator new[](v13, MEMORY[0x1E0DE4E10]);
      v11->_filterBanks = v14;
      if (v14)
      {
        v12 = v11;
        if (numScales >= 1)
        {
          v15 = 0;
          v16 = 180.0 / (float)numOrientations;
          if ((a6 * a5) >> 62)
            v17 = -1;
          else
            v17 = 4 * a6 * a5;
          v18 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
          while (1)
          {
            v19 = exp2f((float)(int)v15 + 2.0);
            v20 = is_mul_ok(numOrientations, 0x18uLL) ? 24 * numOrientations : -1;
            v11->_filterBanks[v15] = (Kernel *)operator new[](v20, v18);
            v12 = (VCPGaborFilter *)v11->_filterBanks[v15];
            if (!v12)
              break;
            if (numOrientations >= 1)
            {
              v21 = 0;
              v22 = 0;
              while (1)
              {
                filterBanks = v11->_filterBanks;
                v24 = &filterBanks[v15][v21];
                v24->var1 = a5;
                v24->var2 = a6;
                filterBanks[v15][v21].var0 = (float *)operator new[](v17, v18);
                v29 = &v11->_filterBanks[v15][v21];
                if (!v29->var0)
                  goto LABEL_26;
                *(float *)&v27 = v16 * (float)(int)v22;
                v30 = *(_OWORD *)&v29->var0;
                var2 = v29->var2;
                v33 = v30;
                LODWORD(v28) = 0;
                *(float *)&v30 = v19;
                *(float *)&v25 = v19 * 1.2;
                *(float *)&v26 = v19;
                if (-[VCPGaborFilter createGaborFilterKernel:sigmaX:sigmaY:lambda:thetaInDegree:phaseInDegree:](v11, "createGaborFilterKernel:sigmaX:sigmaY:lambda:thetaInDegree:phaseInDegree:", &v33, *(double *)&v30, v25, v26, v27, v28))
                {
                  goto LABEL_26;
                }
                ++v22;
                ++v21;
                if (v22 >= v11->_numOrientations)
                {
                  numScales = v11->_numScales;
                  numOrientations = v11->_numOrientations;
                  break;
                }
              }
            }
            if (++v15 >= numScales)
            {
              v12 = v11;
              break;
            }
          }
        }
      }
      else
      {
LABEL_26:
        v12 = 0;
      }
    }
    v31 = v12;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)dealloc
{
  uint64_t v3;
  int numOrientations;
  uint64_t v5;
  uint64_t i;
  float *var0;
  Kernel *v8;
  Kernel **filterBanks;
  objc_super v10;

  if (self->_numScales >= 1)
  {
    v3 = 0;
    do
    {
      numOrientations = self->_numOrientations;
      if (numOrientations >= 1)
      {
        v5 = 0;
        for (i = 0; i < numOrientations; ++i)
        {
          var0 = self->_filterBanks[v3][v5].var0;
          if (var0)
          {
            MEMORY[0x1BCCA128C](var0, 0x1000C8052888210);
            numOrientations = self->_numOrientations;
          }
          ++v5;
        }
      }
      v8 = self->_filterBanks[v3];
      if (v8)
        MEMORY[0x1BCCA128C](v8, 0x1080C80468F112ELL);
      ++v3;
    }
    while (v3 < self->_numScales);
  }
  filterBanks = self->_filterBanks;
  if (filterBanks)
    MEMORY[0x1BCCA128C](filterBanks, 0x20C8093837F09);
  v10.receiver = self;
  v10.super_class = (Class)VCPGaborFilter;
  -[VCPGaborFilter dealloc](&v10, sel_dealloc);
}

- (int)processWithFilterScaleIdx:(int)a3 orientIdx:(int)a4 srcImage:(const float *)a5 outImage:(float *)a6 width:(unint64_t)a7 height:(unint64_t)a8
{
  Kernel *v11;

  v11 = &self->_filterBanks[a3][a4];
  vDSP_imgfir(a5, a8, a7, v11->var0, a6, v11->var2, v11->var1);
  vDSP_vabs(a6, 1, a6, 1, a8 * a7);
  return 0;
}

- (int)createGaborFilterKernel:(Kernel *)a3 sigmaX:(float)a4 sigmaY:(float)a5 lambda:(float)a6 thetaInDegree:(float)a7 phaseInDegree:(float)a8
{
  int result;
  Kernel *v13;
  unint64_t v14;
  float cosval;
  __float2 v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  unint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  Kernel *v27;
  float *v28;
  int v29;
  int v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v38;
  float v39;

  result = -50;
  if (a5 > 0.0 && a4 > 0.0 && a6 > 0.0)
  {
    v13 = a3;
    v14 = a3->var2 >> 1;
    v16 = __sincosf_stret(a7 * 0.017453);
    cosval = v16.__cosval;
    if ((v14 & 0x80000000) == 0)
    {
      v17 = 0;
      v18 = a8 * 0.017453;
      v19 = a4 * a4;
      v20 = a5 * a5;
      v21 = 1.0 / (a4 * 6.28318531 * a5);
      v22 = v13->var1 >> 1;
      v23 = -(int)v14;
      if ((v22 & 0x80000000) == 0)
        v24 = v22;
      else
        v24 = -(int)v22;
      v25 = v24 + 1;
      v26 = v24 + 1 + v22;
      v38 = 6.28318531 / a6;
      do
      {
        if ((v22 & 0x80000000) == 0)
        {
          v39 = cosval * (float)v23;
          v27 = v13;
          v28 = &v13->var0[v17];
          v17 += v26;
          v29 = v22;
          v30 = -(int)v22;
          do
          {
            v31 = (float)(v16.__sinval * (float)v23) + (float)((float)v30 * cosval);
            v32 = cosval;
            v33 = v19;
            v34 = v20;
            v35 = expf(-(float)((float)((float)(v31 * v31) / v19)
                              + (float)((float)((float)(v39 + (float)((float)v29 * v16.__sinval))
                                              * (float)(v39 + (float)((float)v29 * v16.__sinval)))
                                      / v20)))
                * v21;
            v36 = cosf(v18 + (float)(v38 * v31));
            v20 = v34;
            v19 = v33;
            cosval = v32;
            *v28++ = v36 * v35;
            ++v30;
            --v29;
          }
          while (v25 != v30);
          v13 = v27;
        }
      }
      while (v23++ != (_DWORD)v14);
    }
    return 0;
  }
  return result;
}

@end
