@implementation CMIStyleEngineSolveLinearSystemMPS

- (CMIStyleEngineSolveLinearSystemMPS)initWithMetalContext:(id)a3 ssytemCount:(unsigned int)a4 lhsSize:(unsigned int)a5 rhsSize:(unsigned int)a6
{
  CMIStyleEngineSolveLinearSystemMPS *v6;
  CMIStyleEngineSolveLinearSystemMPS *v7;
  CMIStyleEngineSolveLinearSystemMPS *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMIStyleEngineSolveLinearSystemMPS;
  v6 = -[CMIStyleEngineSolveLinearSystem initWithMetalContext:systemCount:lhsSize:rhsSize:](&v10, sel_initWithMetalContext_systemCount_lhsSize_rhsSize_, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    FigDebugAssert3();

  return v7;
}

- (int)solveLinearSystem:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unsigned int v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  int v55;
  unint64_t v57;
  unint64_t v58;
  CMIStyleEngineSolveLinearSystemMPS *v59;
  id *p_inputRHSBuffer;
  void *v61;
  void *v62;
  id *p_inputStatusBuffer;
  id *location;
  MTLBuffer **p_inputLHSBuffer;
  id v66;

  v66 = a3;
  v4 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize");
  v5 = -[CMIStyleEngineSolveLinearSystem rhsSize](self, "rhsSize");
  p_inputLHSBuffer = &self->_inputLHSBuffer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
  if (!WeakRetained)
    goto LABEL_27;
  v7 = WeakRetained;
  v8 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  if (!v8)
    goto LABEL_26;
  v9 = v8;
  location = (id *)&self->_outputCoefficients;
  v10 = objc_loadWeakRetained((id *)&self->_outputCoefficients);
  if (!v10)
  {

LABEL_26:
LABEL_27:
    FigDebugAssert3();
    v55 = FigSignalErrorAt();
    v32 = 0;
LABEL_28:
    v36 = 0;
LABEL_29:
    v37 = 0;
LABEL_30:
    v38 = 0;
    goto LABEL_31;
  }
  v11 = v10;
  p_inputStatusBuffer = (id *)&self->_inputStatusBuffer;
  v12 = objc_loadWeakRetained((id *)&self->_inputStatusBuffer);

  if (!v12)
    goto LABEL_27;
  v13 = 4 * v4;
  v14 = v4;
  v15 = objc_loadWeakRetained((id *)p_inputLHSBuffer);
  v16 = objc_msgSend(v15, "length");
  v17 = v13 * v14 * -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v16 != v17)
    goto LABEL_27;
  v18 = 4 * v5;
  v19 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  v20 = objc_msgSend(v19, "length");
  v21 = v18 * v14 * -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v20 != v21)
    goto LABEL_27;
  v22 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  v23 = objc_msgSend(v22, "length");
  v24 = objc_loadWeakRetained(location);
  v25 = objc_msgSend(v24, "length");

  if (v23 != v25)
    goto LABEL_27;
  v26 = objc_loadWeakRetained(p_inputStatusBuffer);
  v27 = objc_msgSend(v26, "length");
  v28 = -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v27 != 4 * v28)
    goto LABEL_27;
  v29 = objc_alloc(MEMORY[0x1E0CC6EF8]);
  -[CMIStyleEngineSolveLinearSystem device](self, "device");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v14;
  v32 = (void *)objc_msgSend(v29, "initWithDevice:lower:order:", v30, 0, v14);

  if (!v32)
  {
    FigDebugAssert3();
    v55 = FigSignalErrorAt();
    goto LABEL_28;
  }
  v33 = v5;
  v34 = objc_alloc(MEMORY[0x1E0CC6F40]);
  -[CMIStyleEngineSolveLinearSystem device](self, "device");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithDevice:upper:order:numberOfRightHandSides:", v35, 1, v31, v33);

  if (!v36)
  {
    FigDebugAssert3();
    v55 = FigSignalErrorAt();
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v31, v31, v13, 268435488);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    FigDebugAssert3();
    v55 = FigSignalErrorAt();
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v31, v33, v18, 268435488);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    if (-[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount"))
    {
      v62 = v37;
      v59 = self;
      p_inputRHSBuffer = (id *)&self->_inputRHSBuffer;
      v61 = v36;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v57 = 4 * v31 * (unint64_t)v31;
      v58 = 4 * v33 * (unint64_t)v31;
      while (1)
      {
        v45 = v44;
        v46 = objc_alloc(MEMORY[0x1E0CC6ED8]);
        v47 = objc_loadWeakRetained((id *)p_inputLHSBuffer);
        v44 = (void *)objc_msgSend(v46, "initWithBuffer:offset:descriptor:", v47, v39, v62);

        if (!v44)
        {
          FigDebugAssert3();
          v55 = FigSignalErrorAt();

          goto LABEL_20;
        }
        v48 = objc_alloc(MEMORY[0x1E0CC6ED8]);
        v49 = objc_loadWeakRetained(p_inputRHSBuffer);
        v50 = (void *)objc_msgSend(v48, "initWithBuffer:offset:descriptor:", v49, v40, v38);

        if (!v50)
          break;
        v51 = objc_alloc(MEMORY[0x1E0CC6ED8]);
        v52 = objc_loadWeakRetained(location);
        v53 = (void *)objc_msgSend(v51, "initWithBuffer:offset:descriptor:", v52, v40, v38);

        if (!v53)
        {
          FigDebugAssert3();
          v55 = FigSignalErrorAt();

          goto LABEL_20;
        }
        v54 = objc_loadWeakRetained(p_inputStatusBuffer);
        objc_msgSend(v32, "encodeToCommandBuffer:sourceMatrix:resultMatrix:status:", v66, v44, v44, v54);

        objc_msgSend(v61, "encodeToCommandBuffer:sourceMatrix:rightHandSideMatrix:solutionMatrix:", v66, v44, v50, v53);
        ++v41;
        v40 += v58;
        v39 += v57;
        v42 = v53;
        v43 = v50;
        if (v41 >= -[CMIStyleEngineSolveLinearSystem systemCount](v59, "systemCount"))
        {

          v55 = 0;
LABEL_20:
          v36 = v61;
          v37 = v62;
          goto LABEL_31;
        }
      }
      FigDebugAssert3();
      v55 = FigSignalErrorAt();

      v36 = v61;
      v37 = v62;
    }
    else
    {
      v55 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v55 = FigSignalErrorAt();
  }
LABEL_31:

  return v55;
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
}

@end
