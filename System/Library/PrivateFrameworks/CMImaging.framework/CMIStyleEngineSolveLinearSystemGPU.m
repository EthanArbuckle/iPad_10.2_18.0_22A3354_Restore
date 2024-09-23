@implementation CMIStyleEngineSolveLinearSystemGPU

- (CMIStyleEngineSolveLinearSystemGPU)initWithMetalContext:(id)a3 systemCount:(unsigned int)a4 lhsSize:(unsigned int)a5 rhsSize:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  CMIStyleEngineSolveLinearSystemGPU *v11;
  CMIStyleEngineSolveLinearSystemGPU *v12;
  CMIStyleEngineSolveLinearSystemGPU *v13;
  objc_super v15;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMIStyleEngineSolveLinearSystemGPU;
  v11 = -[CMIStyleEngineSolveLinearSystem initWithMetalContext:systemCount:lhsSize:rhsSize:](&v15, sel_initWithMetalContext_systemCount_lhsSize_rhsSize_, v10, v8, v7, v6);
  v12 = v11;
  if (!v11 || -[CMIStyleEngineSolveLinearSystemGPU _compileSubClassShaders:](v11, "_compileSubClassShaders:", v10))
  {
    FigDebugAssert3();
    v13 = 0;
  }
  else
  {
    v13 = v12;
  }

  return v13;
}

- (int)_compileSubClassShaders:(id)a3
{
  id v4;
  uint64_t v5;
  MTLComputePipelineState **computePipelineStates;
  MTLComputePipelineState *v7;
  uint64_t v8;
  MTLComputePipelineState *v9;
  int v10;

  v4 = a3;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineSolveLinearSystemGPU::CholeskyFactorize"), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  computePipelineStates = self->_computePipelineStates;
  v7 = *computePipelineStates;
  *computePipelineStates = (MTLComputePipelineState *)v5;

  if (*computePipelineStates
    && (objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineSolveLinearSystemGPU::UpperTriangularForwardBackwardNx3Substitution"), 0), v8 = objc_claimAutoreleasedReturnValue(), v9 = computePipelineStates[1], computePipelineStates[1] = (MTLComputePipelineState *)v8, v9, computePipelineStates[1]))
  {
    v10 = 0;
  }
  else
  {
    FigDebugAssert3();
    v10 = FigSignalErrorAt();
  }

  return v10;
}

- (int)solveLinearSystem:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  int64x2_t v47;
  uint64_t v48;
  int64x2_t v49;
  unint64_t v50;
  int64x2_t v51;
  uint64_t v52;
  int64x2_t v53;
  unint64_t v54;
  int64x2_t v55;
  __int16 v56;
  __int16 v57;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
  if (!WeakRetained)
    goto LABEL_18;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  if (!v7)
    goto LABEL_17;
  v8 = v7;
  v9 = objc_loadWeakRetained((id *)&self->_outputCoefficients);
  if (!v9)
  {

LABEL_17:
LABEL_18:
    FigDebugAssert3();
    v45 = FigSignalErrorAt();
    v29 = v4;
    goto LABEL_19;
  }
  v10 = v9;
  v11 = objc_loadWeakRetained((id *)&self->_inputStatusBuffer);

  if (!v11)
    goto LABEL_18;
  v12 = objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
  v13 = objc_msgSend(v12, "length");
  v14 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize");
  v15 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize") * v14;
  v16 = v15 * (unint64_t)-[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v13 != 4 * v16)
    goto LABEL_18;
  v17 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  v18 = objc_msgSend(v17, "length");
  v19 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize");
  v20 = -[CMIStyleEngineSolveLinearSystem rhsSize](self, "rhsSize") * v19;
  v21 = v20 * (unint64_t)-[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v18 != 4 * v21)
    goto LABEL_18;
  v22 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  v23 = objc_msgSend(v22, "length");
  v24 = objc_loadWeakRetained((id *)&self->_outputCoefficients);
  v25 = objc_msgSend(v24, "length");

  if (v23 != v25)
    goto LABEL_18;
  v26 = objc_loadWeakRetained((id *)&self->_inputStatusBuffer);
  v27 = objc_msgSend(v26, "length");
  v28 = -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");

  if (v27 != 4 * v28)
    goto LABEL_18;
  v29 = v4;
  if (-[CMIStyleEngineSolveLinearSystem rhsSize](self, "rhsSize") != 3)
    goto LABEL_26;
  v30 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
  v31 = objc_loadWeakRetained((id *)&self->_outputCoefficients);

  if (v30 != v31)
  {
    objc_msgSend(v4, "blitCommandEncoder");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      v34 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
      v35 = objc_loadWeakRetained((id *)&self->_outputCoefficients);
      v36 = objc_loadWeakRetained((id *)&self->_inputRHSBuffer);
      objc_msgSend(v33, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v34, 0, v35, 0, objc_msgSend(v36, "length"));

      v29 = v4;
      objc_msgSend(v33, "endEncoding");

      goto LABEL_13;
    }
LABEL_26:
    FigDebugAssert3();
    v45 = FigSignalErrorAt();
    goto LABEL_19;
  }
LABEL_13:
  objc_msgSend(v29, "computeCommandEncoder");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v57 = -[CMIStyleEngineSolveLinearSystem lhsSize](self, "lhsSize");
    v56 = -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount");
    objc_msgSend(v37, "setBytes:length:atIndex:", &v57, 2, 2);
    objc_msgSend(v37, "setBytes:length:atIndex:", &v56, 2, 3);
    v38 = objc_loadWeakRetained((id *)&self->_inputLHSBuffer);
    objc_msgSend(v37, "setBuffer:offset:atIndex:", v38, 0, 0);

    v39 = objc_loadWeakRetained((id *)&self->_outputCoefficients);
    objc_msgSend(v37, "setBuffer:offset:atIndex:", v39, 0, 1);

    v40 = objc_loadWeakRetained((id *)&self->_inputStatusBuffer);
    objc_msgSend(v37, "setBuffer:offset:atIndex:", v40, 0, 4);

    objc_msgSend(v37, "setComputePipelineState:", self->_computePipelineStates[0]);
    v41 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelineStates[0], "maxTotalThreadsPerThreadgroup");
    v42 = v41 / -[MTLComputePipelineState threadExecutionWidth](self->_computePipelineStates[0], "threadExecutionWidth");
    v54 = (v42 + -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount") - 1) / v42;
    v47 = vdupq_n_s64(1uLL);
    v55 = v47;
    v52 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelineStates[0], "maxTotalThreadsPerThreadgroup");
    v53 = v47;
    objc_msgSend(v37, "dispatchThreadgroups:threadsPerThreadgroup:", &v54, &v52);
    objc_msgSend(v37, "setComputePipelineState:", self->_computePipelineStates[1]);
    v43 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelineStates[1], "maxTotalThreadsPerThreadgroup");
    v44 = v43 / -[MTLComputePipelineState threadExecutionWidth](self->_computePipelineStates[1], "threadExecutionWidth");
    v50 = (v44 + -[CMIStyleEngineSolveLinearSystem systemCount](self, "systemCount") - 1) / v44;
    v51 = v47;
    v48 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelineStates[1], "maxTotalThreadsPerThreadgroup");
    v49 = v47;
    objc_msgSend(v37, "dispatchThreadgroups:threadsPerThreadgroup:", &v50, &v48);
    objc_msgSend(v37, "endEncoding");
    v45 = 0;
  }
  else
  {
    FigDebugAssert3();
    v45 = FigSignalErrorAt();
  }

LABEL_19:
  return v45;
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
  MTLComputePipelineState **computePipelineStates;
  uint64_t i;

  objc_destroyWeak((id *)&self->_outputCoefficients);
  objc_destroyWeak((id *)&self->_inputStatusBuffer);
  objc_destroyWeak((id *)&self->_inputRHSBuffer);
  objc_destroyWeak((id *)&self->_inputLHSBuffer);
  computePipelineStates = self->_computePipelineStates;
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&computePipelineStates[i], 0);
}

@end
