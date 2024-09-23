@implementation MPSGraphNormalizationOp

- (MPSGraphNormalizationOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 epsilon:(float)a6 name:(id)a7
{
  self->_eps = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a7);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  id v12;
  uint64_t StringAttr;
  uint64_t v14;
  MPSGraphNormalizationOp *v15;
  const char *v16;
  size_t v17;
  size_t v18;
  int8x16_t *p_dst;
  __int8 *v20;
  uint64_t v21;
  uint64_t v22;
  std::string *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  llvm::APFloatBase *v28;
  void *v29;
  uint64_t *Context;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  llvm::APFloatBase *v39;
  void *v40;
  mlir::GenericProgramPoint *v41;
  uint64_t v42;
  void *DefiningOp;
  const char *v45;
  int v46;
  const char *v47;
  const char *v48;
  mlir::Float32Type **v49;
  uint64_t v50;
  void *__p[2];
  char v52;
  uint64_t v53;
  const char *v54;
  __int16 v55;
  std::string v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[4];
  __int16 v62;
  int8x16_t __dst;
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphNormalizationOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphNormalizationOps.mm", __p);
  v12 = v11;
  v62 = 260;
  v61[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v61);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x2Du, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    HIBYTE(v64[0]) = 17;
    LOBYTE(v64[0]) = 110;
    __dst = *(int8x16_t *)"mps.normalization";
    v20 = (char *)v64 + 1;
    goto LABEL_13;
  }
  v15 = self;
  v16 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v18 = v17;
  if (v17 >= 0x17)
  {
    v21 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v21 = v17 | 7;
    v22 = v21 + 1;
    p_dst = (int8x16_t *)operator new(v21 + 1);
    __dst.i64[1] = v18;
    v64[0] = v22 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v64[0]) = v17;
    p_dst = &__dst;
    if (!v17)
      goto LABEL_12;
  }
  memmove(p_dst, v16, v18);
LABEL_12:
  v20 = &p_dst->i8[v18];
  self = v15;
LABEL_13:
  *v20 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v56);
  v23 = (std::string *)v56.__r_.__value_.__r.__words[0];
  if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v23 = &v56;
  v24 = 1;
  HIBYTE(v62) = 1;
  if (v23->__r_.__value_.__s.__data_[0])
  {
    v61[0] = v23;
    v24 = 3;
  }
  LOBYTE(v62) = v24;
  v25 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v61);
  v26 = mlir::NameLoc::get(v25, v14);
  if (!v26)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v56.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v64[0]) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v64[0]) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  v49 = (mlir::Float32Type **)a3;
  if (v52 < 0)
    operator delete(__p[0]);
  v27 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x20uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v28 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v61, self->_eps);
  v29 = llvm::APFloatBase::IEEEsingle(v28);
  llvm::APFloat::Storage::Storage(&v59, v61, v29);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v61);
  v53 = v26;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v53);
  v31 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.normalization", (const unsigned __int8 *)0x11, Context);
  if (!v32)
  {
    v58 = 1283;
    v56.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.normalization";
    v57 = 17;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v55 = 259;
    llvm::operator+((uint64_t *)&v56, (uint64_t *)&v54, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v61, v26, v31);
  v33 = *v27;
  v34 = v27[1];
  v35 = v27[2];
  v36 = v27[3];
  v37 = v27[4];
  v38 = v59;
  v40 = llvm::APFloatBase::PPCDoubleDouble(v39);
  if (v40 == v38)
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&__dst.i64[1], &v59);
  else
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&__dst.i64[1], (uint64_t)&v59);
  mlir::mps::NormalizationOp::build(v49, (uint64_t)v61, v33, v34, v35, v36, v37, (uint64_t)&__dst);
  if (v40 == (void *)__dst.i64[1])
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)v64);
  else
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&__dst.u64[1]);
  v41 = mlir::OpBuilder::create((mlir::OpBuilder *)v49, (const mlir::OperationState *)v61);
  if (!v41)
  {
    v45 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v46 = 662;
    v47 = "Casting.h";
    v48 = "dyn_cast";
    goto LABEL_44;
  }
  v42 = llvm::DefaultDoCastIfPossible<mlir::mps::NormalizationOp,mlir::Operation *,llvm::CastInfo<mlir::mps::NormalizationOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v41);
  if (!v42)
  {
    v45 = "result && \"builder didn't return the right type\";
    v46 = 497;
    v47 = "Builders.h";
    v48 = "create";
LABEL_44:
    __assert_rtn(v48, v47, v46, v45);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v61);
  if (!*(_DWORD *)(v42 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v50 = v42 - 16;
  if (v40 == v59)
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v60);
  else
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v59);
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v50);

  return DefiningOp;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MPSGraph **p_graph;
  id WeakRetained;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  uint64_t v24;
  id v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  id v29;
  __CFString *v30;
  id v31;
  __CFString *v32;
  id v33;
  __CFString *v34;
  id v35;
  __CFString *v36;
  id v37;
  __CFString *v38;
  id v39;
  __CFString *v40;
  id v41;
  __CFString *v42;
  id v43;
  __CFString *v44;
  id v45;
  id v46;
  __CFString *v47;
  id v48;
  __CFString *v49;
  id v50;
  __CFString *v51;
  id v52;
  __CFString *v53;
  id v54;
  __CFString *v55;
  id v56;
  __CFString *v57;
  id v58;
  __CFString *v59;
  id v60;
  __CFString *v61;
  id v62;
  __CFString *v63;
  id v64;
  __CFString *v65;
  id v66;
  __CFString *v67;
  id v68;
  __CFString *v69;
  void *v70;
  id v71;
  __CFString *v72;
  void *v73;
  id v74;
  __CFString *v75;
  void *v76;
  id v77;
  __CFString *v78;
  void *v79;
  id v80;
  __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  char isKindOfClass;
  void *v87;
  void *v88;
  char v89;
  void *v90;
  void *v91;
  char v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  id v100;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  _QWORD v142[7];

  v142[5] = *MEMORY[0x1E0C80C00];
  v141 = a3;
  v8 = a4;
  v9 = a5;
  v104 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", 0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", 1);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", 2);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", 3);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", 4);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphOperation outputTensors](self, "outputTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  p_graph = &self->super._graph;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(WeakRetained, "broadcastGradientArgsForPrimaryTensor:withSecondaryTensor:name:", v140, v138, 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v13, "broadcastGradientArgsForPrimaryTensor:withSecondaryTensor:name:", v140, v136, 0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v14, "broadcastGradientArgsForPrimaryTensor:withSecondaryTensor:name:", v140, v139, 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v15, "broadcastGradientArgsForPrimaryTensor:withSecondaryTensor:name:", v140, v137, 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v16, "broadcastGradientArgsForPrimaryTensor:withSecondaryTensor:name:", v140, v135, 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v17, "constantWithScalar:shape:dataType:", &unk_1E0E9B2C0, 268435488, self->_eps);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_loadWeakRetained((id *)&self->super._graph);
  v19 = objc_msgSend(v139, "dataType");
  if (v9)
  {
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("/cast"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("normalizationGradient/cast");
  }
  objc_msgSend(v18, "castTensor:toType:name:", v132, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v105 = (void *)v21;
  if (v9)
  {

    v22 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/addition"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v22 = objc_loadWeakRetained((id *)p_graph);
    v23 = CFSTR("normalizationGradient/addition");
  }
  objc_msgSend(v22, "additionWithPrimaryTensor:secondaryTensor:name:", v139, v21, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v102 = v24;
  if (v9)
  {

    v25 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/sqrt"), v24);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v25 = objc_loadWeakRetained((id *)p_graph);
    v26 = CFSTR("normalizationGradient/sqrt");
  }
  objc_msgSend(v25, "squareRootWithTensor:name:", v24, v26, v102);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v27 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/divison"));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v27 = objc_loadWeakRetained((id *)p_graph);
    v28 = CFSTR("normalizationGradient/divison");
  }
  objc_msgSend(v27, "divisionWithPrimaryTensor:secondaryTensor:name:", v137, v133, v28);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v29 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/multiplication"));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v29 = objc_loadWeakRetained((id *)p_graph);
    v30 = CFSTR("normalizationGradient/multiplication");
  }
  objc_msgSend(v29, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v140, v130, v30);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v31 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("/sum"));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v31 = objc_loadWeakRetained((id *)p_graph);
    v32 = CFSTR("normalizationGradient/sum");
  }
  objc_msgSend(v31, "reductionSumWithTensor:axesTensor:name:", v134, v131, v32);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v33 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/broadcastGradShape"));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v33 = objc_loadWeakRetained((id *)p_graph);
    v34 = CFSTR("normalizationGradient/broadcastGradShape");
  }
  objc_msgSend(v33, "shapeOfTensor:name:", v138, v34);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v35 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/broadcastGradReshape"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v35 = objc_loadWeakRetained((id *)p_graph);
    v36 = CFSTR("normalizationGradient/broadcastGradReshape");
  }
  objc_msgSend(v35, "reshapeTensor:withShapeTensor:name:", v128, v127, v36);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v37 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/meannegative"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v37 = objc_loadWeakRetained((id *)p_graph);
    v38 = CFSTR("normalizationGradient/mean/negative");
  }
  objc_msgSend(v37, "negativeWithTensor:name:", v134, v38);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v39 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("/mean/sum"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v39 = objc_loadWeakRetained((id *)p_graph);
    v40 = CFSTR("normalizationGradient/mean/sum");
  }
  objc_msgSend(v39, "reductionSumWithTensor:axesTensor:name:", v126, v129, v40);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v41 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/mean/broadcastGradShape"));
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v41 = objc_loadWeakRetained((id *)p_graph);
    v42 = CFSTR("normalizationGradient/mean/broadcastGradShape");
  }
  objc_msgSend(v41, "shapeOfTensor:name:", v136, v42);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v43 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/mean/broadcastGradReshape"));
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v43 = objc_loadWeakRetained((id *)p_graph);
    v44 = CFSTR("normalizationGradient/mean/broadcastGradReshape");
  }
  objc_msgSend(v43, "reshapeTensor:withShapeTensor:name:", v124, v123, v44);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)

  v45 = objc_loadWeakRetained((id *)p_graph);
  objc_msgSend(v45, "constantWithScalar:dataType:", objc_msgSend(v138, "dataType"), -0.5);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_loadWeakRetained((id *)p_graph);
  if (v9)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/variance/multiplication"));
    v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v47 = CFSTR("normalizationGradient/variance/multiplication");
  }
  objc_msgSend(v46, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v140, v121, v47);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v48 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/variance/subtraction"));
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v48 = objc_loadWeakRetained((id *)p_graph);
    v49 = CFSTR("normalizationGradient/variance/subtraction");
  }
  objc_msgSend(v48, "subtractionWithPrimaryTensor:secondaryTensor:name:", v125, v135, v49);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v50 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/variance/multiplication"));
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v50 = objc_loadWeakRetained((id *)p_graph);
    v51 = CFSTR("normalizationGradient/variance/multiplication");
  }
  objc_msgSend(v50, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v120, v119, v51);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v52 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/variance/divison"));
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v52 = objc_loadWeakRetained((id *)p_graph);
    v53 = CFSTR("batchNormGammaGradient/variance/divison");
  }
  objc_msgSend(v52, "divisionWithPrimaryTensor:secondaryTensor:name:", v118, v24, v53);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v54 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("/variance/sum"));
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v54 = objc_loadWeakRetained((id *)p_graph);
    v55 = CFSTR("normalizationGradient/variance/sum");
  }
  objc_msgSend(v54, "reductionSumWithTensor:axesTensor:name:", v116, v122, v55);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v56 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/variance/broadcastGradShape"));
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v56 = objc_loadWeakRetained((id *)p_graph);
    v57 = CFSTR("normalizationGradient/variance/broadcastGradShape");
  }
  objc_msgSend(v56, "shapeOfTensor:name:", v139, v57);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v58 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/variance/broadcastGradReshape"));
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v58 = objc_loadWeakRetained((id *)p_graph);
    v59 = CFSTR("normalizationGradient/variance/broadcastGradReshape");
  }
  objc_msgSend(v58, "reshapeTensor:withShapeTensor:name:", v114, v113, v59);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v60 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/gamma/subtraction"));
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v60 = objc_loadWeakRetained((id *)p_graph);
    v61 = CFSTR("normalizationGradient/gamma/subtraction");
  }
  objc_msgSend(v60, "subtractionWithPrimaryTensor:secondaryTensor:name:", v138, v136, v61);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v62 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/gamma/divison"));
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v62 = objc_loadWeakRetained((id *)p_graph);
    v63 = CFSTR("normalizationGradient/gamma/divison");
  }
  objc_msgSend(v62, "divisionWithPrimaryTensor:secondaryTensor:name:", v112, v133, v63);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v64 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/gamma/multiplication"));
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v64 = objc_loadWeakRetained((id *)p_graph);
    v65 = CFSTR("normalizationGradient/gamma/multiplication");
  }
  objc_msgSend(v64, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v140, v111, v65);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v66 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("/gamma/sum"));
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v66 = objc_loadWeakRetained((id *)p_graph);
    v67 = CFSTR("normalizationGradient/gamma/sum");
  }
  objc_msgSend(v66, "reductionSumWithTensor:axesTensor:name:", v109, v117, v67);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v68 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/gamma/broadcastGradShape"));
    v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v68 = objc_loadWeakRetained((id *)p_graph);
    v69 = CFSTR("normalizationGradient/gamma/broadcastGradShape");
  }
  objc_msgSend(v68, "shapeOfTensor:name:", v137, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v71 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/gamma/broadcastGradReshape"));
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v71 = objc_loadWeakRetained((id *)p_graph);
    v72 = CFSTR("normalizationGradient/gamma/broadcastGradReshape");
  }
  objc_msgSend(v71, "reshapeTensor:withShapeTensor:name:", v107, v70, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v74 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("/beta/sum"));
    v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v74 = objc_loadWeakRetained((id *)p_graph);
    v75 = CFSTR("normalizationGradient/beta/sum");
  }
  objc_msgSend(v74, "reductionSumWithTensor:axesTensor:name:", v140, v115, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v77 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/beta/broadcastGradShape"));
    v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v77 = objc_loadWeakRetained((id *)p_graph);
    v78 = CFSTR("normalizationGradient/beta/broadcastGradShape");
  }
  objc_msgSend(v77, "shapeOfTensor:name:", v135, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v80 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/beta/broadcastGradReshape"));
    v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v80 = objc_loadWeakRetained((id *)p_graph);
    v81 = CFSTR("normalizationGradient/beta/broadcastGradReshape");
  }
  objc_msgSend(v80, "reshapeTensor:withShapeTensor:name:", v76, v79, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)

  v142[0] = v110;
  v142[1] = v108;
  v142[2] = v106;
  v142[3] = v73;
  v142[4] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v83, "mutableCopy");

  objc_msgSend(v141, "objectAtIndexedSubscript:", 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v141, "objectAtIndexedSubscript:", 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:atIndexedSubscript:", v87, 0);

  }
  objc_msgSend(v141, "objectAtIndexedSubscript:", 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v89 = objc_opt_isKindOfClass();

  if ((v89 & 1) != 0)
  {
    objc_msgSend(v141, "objectAtIndexedSubscript:", 1);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:atIndexedSubscript:", v90, 1);

  }
  objc_msgSend(v141, "objectAtIndexedSubscript:", 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v92 = objc_opt_isKindOfClass();

  if ((v92 & 1) != 0)
  {
    objc_msgSend(v141, "objectAtIndexedSubscript:", 2);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:atIndexedSubscript:", v93, 2);

  }
  objc_msgSend(v141, "objectAtIndexedSubscript:", 3);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v95 = objc_opt_isKindOfClass();

  if ((v95 & 1) != 0)
  {
    objc_msgSend(v141, "objectAtIndexedSubscript:", 3);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:atIndexedSubscript:", v96, 3);

  }
  objc_msgSend(v141, "objectAtIndexedSubscript:", 4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v98 = objc_opt_isKindOfClass();

  if ((v98 & 1) != 0)
  {
    objc_msgSend(v141, "objectAtIndexedSubscript:", 4);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:atIndexedSubscript:", v99, 4);

  }
  v100 = v84;

  return v100;
}

@end
