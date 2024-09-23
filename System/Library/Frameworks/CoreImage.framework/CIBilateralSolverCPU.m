@implementation CIBilateralSolverCPU

- (CIBilateralSolverCPU)initWithWidth:(int)a3 height:(int)a4 maxVertices:(unint64_t)a5
{
  CIBilateralSolverCPU *v8;
  CIBilateralSolverCPU *v9;
  size_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CIBilateralSolverCPU;
  v8 = -[CIBilateralSolverCPU init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_useTrilinearInterpolation = 1;
    v8->_width = a3;
    v8->_height = a4;
    v8->_maxVertices = a5;
    v10 = 4 * a5;
    v8->_Dn_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_Dm_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_A_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_b_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_x_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_M_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_Sc_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_q_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_r_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_d_buf = (float *)malloc_type_malloc(v10, 0x100004052888210uLL);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_Dn_buf);
  free(self->_Dm_buf);
  free(self->_A_buf);
  free(self->_b_buf);
  free(self->_x_buf);
  free(self->_M_buf);
  free(self->_Sc_buf);
  free(self->_q_buf);
  free(self->_r_buf);
  free(self->_d_buf);
  v3.receiver = self;
  v3.super_class = (Class)CIBilateralSolverCPU;
  -[CIBilateralSolverCPU dealloc](&v3, sel_dealloc);
}

- (int)doSolveWithBilateralGridhash:(id)a3 reference:(__IOSurface *)a4 disparity:(__CVBuffer *)a5 confidence:(__CVBuffer *)a6 output:(__CVBuffer *)a7 lambda:(float)a8 maxIterations:(int)a9
{
  uint64_t v9;
  id v16;
  double v17;

  v9 = *(_QWORD *)&a9;
  v16 = a3;
  -[CIBilateralSolverCPU _doBistochastize:nIterations:](self, "_doBistochastize:nIterations:", v16, 10);
  *(float *)&v17 = a8;
  -[CIBilateralSolverCPU _doSolve:t:c:x:lambda:pcgMaxIterations:](self, "_doSolve:t:c:x:lambda:pcgMaxIterations:", v16, a5, a6, self->_x_buf, v9, v17);
  if (self->_useTrilinearInterpolation)
    objc_msgSend(v16, "slice_trilinear:pin:pout:", a4, self->_x_buf, a7);
  else
    objc_msgSend(v16, "slice:outPixelBuffer:", self->_x_buf, a7);

  return 0;
}

- (void)_doBistochastize:(id)a3 nIterations:(int)a4
{
  int v6;
  int v7;
  uint64_t v8;
  float *q_buf;
  float *Dn_buf;
  float v11;
  float v12;
  float *v14;
  uint64_t v15;
  float *v16;
  float *Dm_buf;
  float v18;
  float v19;
  float v20;
  id v21;

  v21 = a3;
  v6 = objc_msgSend(v21, "countVertices");
  objc_msgSend(v21, "splat_ones:", self->_Dm_buf);
  if (v6 >= 1)
    memset_pattern16(self->_Dn_buf, &unk_19248E0F0, 4 * v6);
  if (a4 >= 1)
  {
    v7 = 1;
    do
    {
      objc_msgSend(v21, "blur:pout:", self->_Dn_buf, self->_q_buf);
      if (v6 >= 1)
      {
        v8 = 0;
        q_buf = self->_q_buf;
        Dn_buf = self->_Dn_buf;
        do
        {
          v11 = q_buf[v8];
          v12 = 0.0;
          if (v11 > 0.0)
            v12 = sqrtf((float)(Dn_buf[v8] * self->_Dm_buf[v8]) / v11);
          Dn_buf[v8++] = v12;
        }
        while (v6 != v8);
      }
    }
    while (v7++ != a4);
  }
  objc_msgSend(v21, "blur:pout:", self->_Dn_buf, self->_q_buf);
  if (v6 >= 1)
  {
    v14 = self->_q_buf;
    v15 = v6;
    v16 = self->_Dn_buf;
    Dm_buf = self->_Dm_buf;
    do
    {
      v18 = *v16++;
      v19 = v18;
      v20 = *v14++;
      *Dm_buf++ = v19 * v20;
      --v15;
    }
    while (v15);
  }

}

- (void)_doSolve:(id)a3 t:(const __CVBuffer *)a4 c:(const __CVBuffer *)a5 x:(float *)a6 lambda:(float)a7 pcgMaxIterations:(int)a8
{
  uint64_t v8;
  int v14;
  int v15;
  float *Dn_buf;
  float *Dm_buf;
  float *A_buf;
  uint64_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float *v24;
  float *Sc_buf;
  float *M_buf;
  double v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  uint64_t v34;
  float *v35;
  float v36;
  float v37;
  id v38;

  v8 = *(_QWORD *)&a8;
  v38 = a3;
  v14 = objc_msgSend(v38, "countVertices");
  v15 = objc_msgSend(v38, "countDims");
  if (v14 <= 0)
  {
    objc_msgSend(v38, "splat:pout:", a5, self->_Sc_buf);
    objc_msgSend(v38, "splat_w_mul_x:inPixelBuffer:pout:", a5, a4, self->_b_buf);
  }
  else
  {
    Dn_buf = self->_Dn_buf;
    Dm_buf = self->_Dm_buf;
    A_buf = self->_A_buf;
    v19 = v14;
    do
    {
      v20 = *Dn_buf++;
      v21 = v20;
      v22 = v20 * (float)(2 * v15);
      v23 = *Dm_buf++;
      *A_buf++ = v23 - (float)(v21 * v22);
      --v19;
    }
    while (v19);
    objc_msgSend(v38, "splat:pout:", a5, self->_Sc_buf);
    v24 = self->_A_buf;
    M_buf = self->_M_buf;
    Sc_buf = self->_Sc_buf;
    LODWORD(v27) = 1.0;
    v28 = v14;
    do
    {
      v29 = *Sc_buf++;
      v30 = v29 + (float)(a7 * *v24);
      *v24++ = v30;
      if (v30 >= 0.00001)
        v31 = 1.0 / v30;
      else
        v31 = 100000.0;
      *M_buf++ = v31;
      --v28;
    }
    while (v28);
    objc_msgSend(v38, "splat_w_mul_x:inPixelBuffer:pout:", a5, a4, self->_b_buf, v27);
    v34 = 0;
    v35 = self->_Sc_buf;
    do
    {
      v36 = v35[v34];
      if (v36 == 0.0)
        v37 = 0.0;
      else
        v37 = self->_b_buf[v34] / v36;
      a6[v34++] = v37;
    }
    while (v14 != v34);
  }
  LODWORD(v33) = 925353388;
  *(float *)&v32 = a7;
  -[CIBilateralSolverCPU _pcg:A:lambda:b:x:M:tol:maxIterations:](self, "_pcg:A:lambda:b:x:M:tol:maxIterations:", v38, self->_A_buf, self->_b_buf, a6, self->_M_buf, v8, v32, v33);

}

+ (void)_computeAx:(id)a3 A:(const float *)a4 Dn:(const float *)a5 lambda:(float)a6 x:(const float *)a7 output:(float *)a8
{
  id v13;
  int v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  float v18;
  int *v19;
  uint64_t v20;
  int v21;
  int v22;

  v13 = a3;
  v14 = objc_msgSend(v13, "countVertices");
  if (v14 >= 1)
  {
    v15 = 0;
    v16 = -a6;
    v17 = v14;
    do
    {
      v18 = a4[v15] * a7[v15];
      v22 = 0;
      v19 = (int *)objc_msgSend(v13, "blur_indices:n_blur_indices:", v15, &v22);
      v20 = v22;
      if (v22 >= 1)
      {
        do
        {
          v21 = *v19++;
          v18 = v18 + (float)(a7[v21] * (float)((float)(a5[v21] * a5[v15]) * v16));
          --v20;
        }
        while (v20);
      }
      a8[v15++] = v18;
    }
    while (v15 != v17);
  }

}

- (void)_pcg:(id)a3 A:(const float *)a4 lambda:(float)a5 b:(const float *)a6 x:(float *)a7 M:(const float *)a8 tol:(float)a9 maxIterations:(int)a10
{
  int v18;
  double v19;
  double v20;
  float *r_buf;
  float *d_buf;
  uint64_t v23;
  float v24;
  const float *v25;
  float v26;
  float v27;
  float v28;
  int v29;
  float *v30;
  float *q_buf;
  float v32;
  uint64_t v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float *v38;
  float *v39;
  float *v40;
  float v41;
  uint64_t v42;
  float *v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float *v48;
  float v49;
  uint64_t v50;
  const float *v51;
  float v52;
  float v53;
  float v54;
  float *v55;
  float *v56;
  uint64_t v57;
  const float *v58;
  float v59;
  float v60;
  float v61;
  id v63;

  v63 = a3;
  v18 = objc_msgSend(v63, "countVertices");
  *(float *)&v19 = a5;
  +[CIBilateralSolverCPU _computeAx:A:Dn:lambda:x:output:](CIBilateralSolverCPU, "_computeAx:A:Dn:lambda:x:output:", v63, a4, self->_Dn_buf, a7, self->_r_buf, v19);
  if (v18 < 1)
  {
    v24 = 0.0;
  }
  else
  {
    r_buf = self->_r_buf;
    d_buf = self->_d_buf;
    v23 = v18;
    v24 = 0.0;
    v25 = a8;
    do
    {
      v26 = *a6++;
      v27 = v26 - *r_buf;
      v28 = *v25++;
      v24 = v24 + (float)(v27 * (float)(v28 * v27));
      *r_buf++ = v27;
      *d_buf++ = v28 * v27;
      --v23;
    }
    while (v23);
  }
  if (a10 >= 1)
  {
    v29 = 1;
    do
    {
      *(float *)&v20 = a5;
      +[CIBilateralSolverCPU _computeAx:A:Dn:lambda:x:output:](CIBilateralSolverCPU, "_computeAx:A:Dn:lambda:x:output:", v63, a4, self->_Dn_buf, self->_d_buf, self->_q_buf, v20);
      if (v18 < 1)
      {
        v41 = 0.0;
      }
      else
      {
        v30 = self->_d_buf;
        q_buf = self->_q_buf;
        v32 = 0.0;
        v33 = v18;
        do
        {
          v34 = *v30++;
          v35 = v34;
          v36 = *q_buf++;
          v32 = v32 + (float)(v35 * v36);
          --v33;
        }
        while (v33);
        v37 = v24 / v32;
        v39 = self->_r_buf;
        v38 = self->_d_buf;
        v40 = self->_q_buf;
        v41 = 0.0;
        v42 = v18;
        v43 = a7;
        do
        {
          v44 = *v38++;
          v45 = *v43 + (float)(v37 * v44);
          v46 = *v40++;
          v47 = *v39 + (float)((float)-v37 * v46);
          *v43++ = v45;
          *v39++ = v47;
          v41 = v41 + (float)(v47 * v47);
          --v42;
        }
        while (v42);
      }
      if (sqrtf(v41) < a9)
        break;
      if (v18 < 1)
      {
        v49 = 0.0;
      }
      else
      {
        v48 = self->_r_buf;
        v49 = 0.0;
        v50 = v18;
        v51 = a8;
        do
        {
          v52 = *v48++;
          v53 = v52;
          v54 = *v51++;
          v49 = v49 + (float)(v53 * (float)(v53 * v54));
          --v50;
        }
        while (v50);
        v55 = self->_r_buf;
        v56 = self->_d_buf;
        v57 = v18;
        v58 = a8;
        do
        {
          v59 = *v58++;
          v60 = v59;
          v61 = *v55++;
          *v56 = (float)(v60 * v61) + (float)((float)(v49 / v24) * *v56);
          ++v56;
          --v57;
        }
        while (v57);
      }
      v24 = v49;
    }
    while (v29++ != a10);
  }

}

- (BOOL)useTrilinearInterpolation
{
  return self->_useTrilinearInterpolation;
}

- (void)setUseTrilinearInterpolation:(BOOL)a3
{
  self->_useTrilinearInterpolation = a3;
}

@end
