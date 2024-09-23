@implementation MPSGraphMaxWithIndicesPool4DOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t MLIRElementType;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  char v18;
  char v19;
  MPSGraphPoolingReturnIndicesMode v20;
  uint64_t v21;
  uint64_t *Context;
  uint64_t v23;
  char v24;
  mlir::GenericProgramPoint *v25;
  void *v26;
  const char *v28;
  int v29;
  const char *v30;
  const char *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *__p[2];
  char v42;
  uint64_t v43;
  const char *v44;
  __int16 v45;
  uint64_t v46[4];
  __int16 v47;
  _BYTE v48[40];
  _QWORD v49[40];

  v49[38] = *MEMORY[0x1E0C80C00];
  v32 = a7;
  mpsFileLoc("-[MPSGraphMaxWithIndicesPool4DOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPoolingOps.mm", __p);
  v40 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::PoolMaxOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x2D2u, v32);
  if (v42 < 0)
    operator delete(__p[0]);
  MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)-[MPSGraphPooling4DOpDescriptor returnIndicesDataType](self->super._desc, "returnIndicesDataType"));
  v12 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v13 = MLIRElementType;
  -[MPSGraphPooling4DOpDescriptor kernelSizes](self->super._desc, "kernelSizes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = nsArrayToAttr(v33, (mlir::Builder *)a3);
  -[MPSGraphPooling4DOpDescriptor strides](self->super._desc, "strides");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = nsArrayToAttr(v34, (mlir::Builder *)a3);
  -[MPSGraphPooling4DOpDescriptor dilationRates](self->super._desc, "dilationRates");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = nsArrayToAttr(v35, (mlir::Builder *)a3);
  v17 = -[MPSGraphPooling4DOpDescriptor paddingStyle](self->super._desc, "paddingStyle");
  -[MPSGraphPooling4DOpDescriptor paddingValues](self->super._desc, "paddingValues");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = nsArrayToAttr(v39, (mlir::Builder *)a3);
  v37 = v17;
  v38 = v16;
  v18 = -[MPSGraphPooling4DOpDescriptor ceilMode](self->super._desc, "ceilMode");
  v19 = -[MPSGraphPooling4DOpDescriptor includeZeroPadToAverage](self->super._desc, "includeZeroPadToAverage");
  v20 = -[MPSGraphPooling4DOpDescriptor returnIndicesMode](self->super._desc, "returnIndicesMode");
  if (v20 >= (MPSGraphPoolingReturnIndicesLocalFlatten4D|MPSGraphPoolingReturnIndicesGlobalFlatten1D))
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  else
  {
    v17 = dword_1812917B0[v20];
  }
  v21 = mlir::TypeAttr::get(v13);
  v43 = v40;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v43);
  v23 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.pooling_max", (const unsigned __int8 *)0xF, Context);
  if (!v24)
  {
    v47 = 1283;
    v46[2] = (uint64_t)"mps.pooling_max";
    v46[3] = 15;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v45 = 259;
    llvm::operator+(v46, (uint64_t *)&v44, (uint64_t)v48);
    llvm::report_fatal_error((llvm::Twine *)v48, 1);
  }
  mlir::OperationState::OperationState(v49, v40, v23);
  mlir::mps::PoolMaxOp::build((mlir::UnitAttr **)a3, (uint64_t)v49, *v12, v14, v15, v38, v37, v36, v18, v19, v17, v21);
  v25 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v49);
  if (!v25)
  {
    v28 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v29 = 662;
    v30 = "Casting.h";
    v31 = "dyn_cast";
    goto LABEL_15;
  }
  v26 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::PoolMaxOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PoolMaxOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v25);
  if (!v26)
  {
    v28 = "result && \"builder didn't return the right type\";
    v29 = 497;
    v30 = "Builders.h";
    v31 = "create";
LABEL_15:
    __assert_rtn(v31, v30, v29, v28);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v49);

  return v26;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *WeakRetained;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;

  v8 = a3;
  v45 = a4;
  v46 = a5;
  v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  -[MPSGraphPooling4DOpDescriptor kernelSizes](self->super._desc, "kernelSizes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "intValue") == 1)
  {
    -[MPSGraphPooling4DOpDescriptor kernelSizes](self->super._desc, "kernelSizes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "intValue") == 1)
    {
      -[MPSGraphPooling4DOpDescriptor strides](self->super._desc, "strides");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "intValue") == 1)
      {
        -[MPSGraphPooling4DOpDescriptor strides](self->super._desc, "strides");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "intValue") == 1;

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  -[MPSGraphPooling4DOpDescriptor kernelSizes](self->super._desc, "kernelSizes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "intValue") == 1)
  {
    -[MPSGraphPooling4DOpDescriptor kernelSizes](self->super._desc, "kernelSizes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "intValue") == 1)
    {
      -[MPSGraphPooling4DOpDescriptor strides](self->super._desc, "strides");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "intValue") == 1)
      {
        -[MPSGraphPooling4DOpDescriptor strides](self->super._desc, "strides");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "intValue") == 1;

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

    if (!v16 && !v23)
      goto LABEL_22;
  }
  else
  {

    if (!v16)
      goto LABEL_22;
  }
  if (!isValidIndicesInput4D((MPSGraphTensorNamedDataLayout)!v16, -[MPSGraphPooling4DOpDescriptor returnIndicesMode](self->super._desc, "returnIndicesMode"), self->super._desc))
  {
LABEL_22:
    v38 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%@/%@/maxPoolGrad"), v46, v39);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._graph);
    objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "maxPooling4DGradientWithGradientTensor:sourceTensor:descriptor:name:", v32, v33, self->super._desc, v26);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v24 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@/%@/shapeOf"), v46, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("%@/%@/maxPoolGradWithIndices"), v46, v28);
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_loadWeakRetained((id *)&self->super.super._graph);
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "shapeOfTensor:name:", v31, v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_loadWeakRetained((id *)&self->super.super._graph);
  objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation outputTensors](self, "outputTensors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "maxPooling4DGradientWithGradientTensor:indicesTensor:outputShapeTensor:descriptor:name:", v34, v36, v32, self->super._desc, WeakRetained);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  objc_msgSend(v44, "addObject:", v37);

  return v44;
}

@end
