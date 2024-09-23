@implementation CMIStyleEngineSolveLinearSystemAccelerate

- (CMIStyleEngineSolveLinearSystemAccelerate)initWithMetalContext:(id)a3 systemCount:(unsigned int)a4 lhsSize:(unsigned int)a5 rhsSize:(unsigned int)a6
{
  CMIStyleEngineSolveLinearSystemAccelerate *v8;
  id v9;
  dispatch_queue_t v10;
  uint64_t v11;
  MTLSharedEventListener *sharedEventListener;
  uint64_t v13;
  NSMutableData *BMatrix;
  CMIStyleEngineSolveLinearSystemAccelerate *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CMIStyleEngineSolveLinearSystemAccelerate;
  v8 = -[CMIStyleEngineSolveLinearSystem initWithMetalContext:systemCount:lhsSize:rhsSize:](&v17, sel_initWithMetalContext_systemCount_lhsSize_rhsSize_, a3, *(_QWORD *)&a4);
  if (!v8)
    goto LABEL_7;
  v9 = objc_alloc(MEMORY[0x1E0CC6B88]);
  v10 = dispatch_queue_create("com.apple.coremedia.CMIStyleEngine.SolveLinearSystemAccelerate", 0);
  v11 = objc_msgSend(v9, "initWithDispatchQueue:", v10);
  sharedEventListener = v8->_sharedEventListener;
  v8->_sharedEventListener = (MTLSharedEventListener *)v11;

  if (!v8->_sharedEventListener)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * a6 * a5);
  v13 = objc_claimAutoreleasedReturnValue();
  BMatrix = v8->_BMatrix;
  v8->_BMatrix = (NSMutableData *)v13;

  if (v8->_BMatrix && !-[CMIStyleEngineSolveLinearSystemAccelerate _prewarmSolverRoutine](v8, "_prewarmSolverRoutine"))
  {
    v15 = v8;
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    v15 = 0;
  }

  return v15;
}

- (int)_prewarmSolverRoutine
{
  void *v3;
  void *v4;
  float *v5;
  char *v6;
  int v7;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1D824D210](self, a2);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4* -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize")* -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v11 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize"),
        v9 = -1,
        v10 = -[CMIStyleEngineSolveLinearSystem rhsSize](self, "rhsSize"),
        v5 = (float *)objc_msgSend(objc_retainAutorelease(v4), "mutableBytes"),
        v6 = -[NSMutableData mutableBytes](self->_BMatrix, "mutableBytes"),
        v12 = 0x100000001,
        AccelerateAR_sposv_NEWLAPACK(&v12, (uint64_t)"L", (int *)&v11, &v10, v5, (int *)&v11, v6, (int *)&v11, &v9),
        v9 < 0))
  {
    FigDebugAssert3();
    v7 = FigSignalErrorAt();
  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (int)solveLinearSystem:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  NSMutableData *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  MTLSharedEventListener *sharedEventListener;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NSMutableData *v42;
  void *v43;
  int v44;
  uint64_t v46;
  unsigned int v47;
  id v48;
  _QWORD v49[4];
  NSMutableData *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;

  v48 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
  if (!WeakRetained)
    goto LABEL_12;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  if (!v6)
    goto LABEL_11;
  v7 = v6;
  v8 = objc_loadWeakRetained((id *)&self->_outputCoefficients);
  if (!v8)
  {

LABEL_11:
LABEL_12:
    FigDebugAssert3();
    v44 = FigSignalErrorAt();
    v43 = v48;
    goto LABEL_13;
  }
  v9 = v8;
  v10 = objc_loadWeakRetained((id *)&self->_inputStatusBuffer);

  if (!v10)
    goto LABEL_12;
  v11 = objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
  v12 = objc_msgSend(v11, "length");
  v13 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize");
  v14 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize") * v13;
  v15 = v14 * (unint64_t)-[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v12 != 4 * v15)
    goto LABEL_12;
  v16 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  v17 = objc_msgSend(v16, "length");
  v18 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize");
  v19 = -[CMIStyleEngineSolveLinearSystem rhsSize](self, "rhsSize") * v18;
  v20 = v19 * (unint64_t)-[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v17 != 4 * v20)
    goto LABEL_12;
  v21 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  v22 = objc_msgSend(v21, "length");
  v23 = objc_loadWeakRetained((id *)&self->_outputCoefficients);
  v24 = objc_msgSend(v23, "length");

  if (v22 != v24)
    goto LABEL_12;
  v25 = objc_loadWeakRetained((id *)&self->_inputStatusBuffer);
  v26 = objc_msgSend(v25, "length");
  v27 = -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v26 != 4 * v27)
    goto LABEL_12;
  v47 = -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");
  v46 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize");
  v28 = -[CMIStyleEngineSolveLinearSystem rhsSize](self, "rhsSize");
  v29 = self->_BMatrix;
  v30 = objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
  v31 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  v32 = objc_loadWeakRetained((id *)&self->_inputStatusBuffer);
  v33 = objc_loadWeakRetained((id *)&self->_outputCoefficients);
  -[CMIStyleEngineSolveLinearSystem device](self, "device");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "newSharedEvent");

  sharedEventListener = self->_sharedEventListener;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __63__CMIStyleEngineSolveLinearSystemAccelerate_solveLinearSystem___block_invoke;
  v49[3] = &unk_1E94EB560;
  v56 = v46;
  v57 = v28;
  v58 = v47;
  v50 = v29;
  v51 = v30;
  v52 = v31;
  v53 = v32;
  v54 = v33;
  v55 = v35;
  v37 = v35;
  v38 = v33;
  v39 = v32;
  v40 = v31;
  v41 = v30;
  v42 = v29;
  objc_msgSend(v37, "notifyListener:atValue:block:", sharedEventListener, 1, v49);
  v43 = v48;
  objc_msgSend(v48, "encodeSignalEvent:value:", v37, 1);
  objc_msgSend(v48, "encodeWaitForEvent:value:", v37, 2);

  v44 = 0;
LABEL_13:

  return v44;
}

uint64_t __63__CMIStyleEngineSolveLinearSystemAccelerate_solveLinearSystem___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  char *v15;
  int *v16;
  char *v17;
  uint64_t i;
  int v19;
  unint64_t v20;
  float v21;
  unint64_t v23;
  unint64_t v24;
  float v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  char *v32;
  char *v33;
  _DWORD *v34;
  uint64_t j;
  uint64_t v37;
  int v38;
  unsigned int v39;
  int v40;
  uint64_t v41;

  v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "mutableBytes");
  v4 = *(_QWORD *)(a1 + 80);
  v39 = *(_QWORD *)(a1 + 88);
  v40 = v4;
  v38 = 1;
  if (*(_DWORD *)(a1 + 96))
  {
    v5 = (char *)v3;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "contents");
      v9 = v40;
      v10 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "contents");
      v12 = *(_QWORD *)(a1 + 80);
      v11 = *(_QWORD *)(a1 + 88);
      if (v12)
      {
        v13 = 0;
        v14 = (int *)(v10 + v11 * v6 * v40);
        v15 = v5;
        do
        {
          v16 = v14;
          v17 = v15;
          for (i = v11; i; --i)
          {
            v19 = *v16++;
            *(_DWORD *)v17 = v19;
            v17 += 4 * v12;
          }
          ++v13;
          v15 += 4;
          v14 += v11;
        }
        while (v13 != v12);
      }
      if (v12 * v12)
      {
        v20 = 0;
        do
          v21 = *(float *)(v8 + v6 * (int)v9 * (uint64_t)(int)v9 + 4 * v20++);
        while (v21 == 0.0 && v20 < v12 * v12);
        if (v21 != 0.0)
          goto LABEL_35;
      }
      v23 = v12 * v11;
      if (v23)
      {
        v24 = 0;
        do
          v25 = *(float *)&v5[4 * v24++];
        while (v25 == 0.0 && v24 < v23);
        if (v25 != 0.0)
        {
LABEL_35:
          v41 = 0x100000001;
          AccelerateAR_sposv_NEWLAPACK(&v41, (uint64_t)"L", &v40, &v39, (float *)(v8 + 4 * v7 * v9 * v9), &v40, v5, &v40, &v38);
          if (v38)
            break;
        }
      }
      v27 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "contents");
      v28 = *(_QWORD *)(a1 + 80);
      if (v28)
      {
        v29 = 0;
        v30 = *(_QWORD *)(a1 + 88);
        v31 = (_DWORD *)(v27 + v30 * v6 * v40);
        v32 = v5;
        do
        {
          v33 = v32;
          v34 = v31;
          for (j = v30; j; --j)
          {
            *v34++ = *(_DWORD *)v33;
            v33 += 4 * v28;
          }
          ++v29;
          v31 += v30;
          v32 += 4;
        }
        while (v29 != v28);
      }
      ++v7;
      v6 += 4;
      if (v7 >= *(unsigned int *)(a1 + 96))
        return objc_msgSend(*(id *)(a1 + 72), "setSignaledValue:", 2);
    }
    LODWORD(v37) = 0;
    FigDebugAssert3();
    *(_DWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "contents", v37, v1) + 4 * v7) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 72), "setSignaledValue:", 2);
}

- (id)inputLHSBuffer
{
  return objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
}

- (void)setInputLHSBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputLHSBuffer, a3);
}

- (id)inputRHSBuffer
{
  return objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
}

- (void)setInputRHSBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputRHSBuffer, a3);
}

- (id)inputStatusBuffer
{
  return objc_loadWeakRetained((id *)&self->_inputStatusBuffer);
}

- (void)setInputStatusBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputStatusBuffer, a3);
}

- (id)outputCoefficients
{
  return objc_loadWeakRetained((id *)&self->_outputCoefficients);
}

- (void)setOutputCoefficients:(id)a3
{
  objc_storeWeak((id *)&self->_outputCoefficients, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_outputCoefficients);
  objc_destroyWeak((id *)&self->_inputStatusBuffer);
  objc_destroyWeak((id *)&self->_inputRHSBuffer);
  objc_destroyWeak((id *)&self->_inputLHSBuffer);
  objc_storeStrong((id *)&self->_BMatrix, 0);
  objc_storeStrong((id *)&self->_sharedEventListener, 0);
}

@end
