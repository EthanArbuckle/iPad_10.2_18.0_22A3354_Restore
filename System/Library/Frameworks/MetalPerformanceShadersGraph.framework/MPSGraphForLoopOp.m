@implementation MPSGraphForLoopOp

- (MPSGraphForLoopOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 bodyBlock:(id)a6 iterArgs:(id)a7 name:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id bodyBlock;
  AutodiffOpData *value;
  MPSGraphRegion *v22;
  MPSGraphForLoopOp *v23;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x186DA1DA0](a6);
  bodyBlock = self->_bodyBlock;
  self->_bodyBlock = v19;

  objc_storeStrong((id *)&self->_iterArgs, a7);
  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(AutodiffOpData *))(*(_QWORD *)value + 8))(value);
  v22 = objc_alloc_init(MPSGraphRegion);
  v25.receiver = self;
  v25.super_class = (Class)MPSGraphForLoopOp;
  v23 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:region:name:](&v25, sel_initWithGraph_inputTensors_controlDependencies_region_name_, v14, v15, v16, v22, v18);

  return v23;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  id v11;
  uint64_t StringAttr;
  uint64_t v13;
  const char *v14;
  size_t v15;
  size_t v16;
  int8x16_t *p_dst;
  __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  std::string *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *WeakRetained;
  void *v26;
  mlir::GenericProgramPoint *v27;
  mlir::GenericProgramPoint *v28;
  mlir::GenericProgramPoint *v29;
  mlir::OpBuilder *v30;
  uint64_t v31;
  uint64_t *Context;
  uint64_t v33;
  char v34;
  uint64_t v35;
  mlir::GenericProgramPoint *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  id *v41;
  uint64_t Results;
  uint64_t v43;
  void *DefiningOp;
  const char *v46;
  int v47;
  const char *v48;
  const char *v49;
  id v50;
  _QWORD v51[3];
  void *v52;
  _BYTE *v53;
  uint64_t v54;
  void *__p[2];
  char v56;
  uint64_t v57;
  mlir::OpBuilder *v58;
  MPSGraphForLoopOp *v59;
  uint64_t v60;
  const char *v61;
  __int16 v62;
  std::string v63;
  uint64_t v64;
  __int16 v65;
  _QWORD v66[4];
  __int16 v67;
  int8x16_t __dst;
  unint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v58 = (mlir::OpBuilder *)a3;
  v59 = self;
  v10 = a7;
  mpsFileLoc("-[MPSGraphForLoopOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm", __p);
  v11 = v10;
  v67 = 260;
  v66[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v66);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x9F3u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v69) = 7;
    qmemcpy(&__dst, "scf.for", 7);
    v18 = &__dst.i8[7];
    goto LABEL_13;
  }
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v19 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v19 = v15 | 7;
    v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v16;
    v69 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v69) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v63);
  v21 = (std::string *)v63.__r_.__value_.__r.__words[0];
  if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v63;
  v22 = 1;
  HIBYTE(v67) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v66[0] = v21;
    v22 = 3;
  }
  LOBYTE(v67) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v66);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v69) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  v57 = v24;
  if (v56 < 0)
    operator delete(__p[0]);
  WeakRetained = objc_loadWeakRetained((id *)&v59->super._graph);
  v26 = (void *)WeakRetained[22];
  v50 = v26;

  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v27 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>(v58, v57, *(_QWORD *)a5);
  if (!*((_DWORD *)v27 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v28 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>(v58, v57, *(_QWORD *)a5 + 8);
  if (!*((_DWORD *)v28 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v29 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>(v58, v57, *(_QWORD *)a5 + 16);
  if (!*((_DWORD *)v29 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v31 = v57;
  v30 = v58;
  getValuesFromTensors(v59->_iterArgs, (char **)&v52);
  v51[0] = &v58;
  v51[1] = &v57;
  v51[2] = &v59;
  v60 = v31;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v60);
  v33 = mlir::RegisteredOperationName::lookup((int8x16_t *)"scf.for", (const unsigned __int8 *)7, Context);
  if (!v34)
  {
    v65 = 1283;
    v63.__r_.__value_.__r.__words[2] = (std::string::size_type)"scf.for";
    v64 = 7;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v62 = 259;
    llvm::operator+((uint64_t *)&v63, (uint64_t *)&v61, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v66, v31, v33);
  mlir::ValueRange::ValueRange((unint64_t *)&__dst, (uint64_t)v52, (v53 - (_BYTE *)v52) >> 3);
  mlir::scf::ForOp::build((uint64_t)v30, (uint64_t)v66, (uint64_t)v27 - 16, (uint64_t)v28 - 16, (uint64_t)v29 - 16, __dst.i64[0], __dst.i64[1], v35, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t))llvm::function_ref<void ()(mlir::OpBuilder &,mlir::Location,mlir::Value,mlir::ValueRange)>::callback_fn<-[MPSGraphForLoopOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]::$_1>, (uint64_t)v51);
  v36 = mlir::OpBuilder::create(v30, (const mlir::OperationState *)v66);
  if (!v36)
  {
    v46 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v47 = 662;
    v48 = "Casting.h";
    v49 = "dyn_cast";
    goto LABEL_47;
  }
  v37 = llvm::DefaultDoCastIfPossible<mlir::scf::ForOp,mlir::Operation *,llvm::CastInfo<mlir::scf::ForOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v36);
  if (!v37)
  {
    v46 = "result && \"builder didn't return the right type\";
    v47 = 497;
    v48 = "Builders.h";
    v49 = "create";
LABEL_47:
    __assert_rtn(v49, v48, v47, v46);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v66);
  v54 = v37;
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }
  v38 = *(_QWORD *)(mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v54) + 8);
  -[NSMutableArray objectAtIndexedSubscript:](v59->super._region->_blocks, "objectAtIndexedSubscript:", 0);
  v39 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v40 = v38 - 8;
  if (!v38)
    v40 = 0;
  v39[3] = v40;

  v41 = (id *)objc_loadWeakRetained((id *)&v59->super._graph);
  objc_storeStrong(v41 + 22, v26);

  Results = mlir::pdl::ApplyNativeRewriteOp::getResults((mlir::pdl::ApplyNativeRewriteOp *)&v54);
  if (!v43)
    __assert_rtn("operator[]", "STLExtras.h", 1281, "Index < size() && \"invalid index for value range\");
  v66[0] = mlir::detail::OpResultImpl::getNextResultAtOffset(Results, 0);
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v66);

  return DefiningOp;
}

- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(void *)a5
{
  return recurseForUsesOnEscaped((Autodiff *)a5, (MPSGraphBlock *)a3, (MPSGraphTensor *)a4);
}

- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(void *)a4
{
  id v6;
  _QWORD *OpData;

  v6 = a3;
  OpData = getOpData(&self->super);
  LOBYTE(a4) = (*(uint64_t (**)(_QWORD *, void *, id))(*OpData + 24))(OpData, a4, v6);

  return (char)a4;
}

- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(void *)a4
{
  id v6;
  _QWORD *OpData;

  v6 = a3;
  OpData = getOpData(&self->super);
  LOBYTE(a4) = (*(uint64_t (**)(_QWORD *, void *, id))(*OpData + 32))(OpData, a4, v6);

  return (char)a4;
}

- (void)partialDerivateForCFOpWithAutodiff:(void *)a3
{
  AutodiffOpData *OpData;

  OpData = (AutodiffOpData *)getOpData(&self->super);
  AutodiffOpData::createPartialDerivatives(OpData, (Autodiff *)a3);
}

- (void).cxx_destruct
{
  AutodiffOpData *value;

  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(AutodiffOpData *, SEL))(*(_QWORD *)value + 8))(value, a2);
  objc_storeStrong((id *)&self->_forBlockArguments, 0);
  objc_storeStrong((id *)&self->_iterArgs, 0);
  objc_storeStrong((id *)&self->_bodyResult, 0);
  objc_storeStrong(&self->_bodyBlock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  return self;
}

- (void)makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:
{
  mlir::OpBuilder *v8;
  uint64_t v9;
  uint64_t *Context;
  uint64_t v11;
  char v12;
  mlir::GenericProgramPoint *v13;
  mlir::GenericProgramPoint *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  mlir::UnknownLoc **v19;
  uint64_t v20;
  mlir::GenericProgramPoint *v21;
  void *v22;
  MPSGraphTensor *v23;
  uint64_t v24;
  id WeakRetained;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  MPSGraphTensor *v29;
  uint64_t v30;
  id v31;
  id v32;
  id *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  MPSGraphYieldOp *v39;
  id v40;
  MPSGraphYieldOp *v41;
  id *v42;
  const char *v43;
  int v44;
  const char *v45;
  const char *v46;
  uint64_t AttrData;
  uint64_t v48;
  BOOL v49;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54[4];
  __int16 v55;
  uint64_t v56[2];
  const char *v57;
  uint64_t v58;
  __int16 v59;
  _QWORD v60[5];
  uint64_t v61;
  unint64_t v62[2];
  uint64_t v63;
  unint64_t v64;
  uint64_t v65[40];

  v65[38] = *MEMORY[0x1E0C80C00];
  v63 = a5;
  v64 = a6;
  v8 = **a1;
  v9 = (uint64_t)*a1[1];
  v61 = a4;
  mlir::ValueRange::ValueRange(v62, (uint64_t)&v61, 1uLL);
  v53 = v9;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v53);
  v11 = mlir::RegisteredOperationName::lookup((int8x16_t *)"tensor.from_elements", (const unsigned __int8 *)0x14, Context);
  if (!v12)
  {
    v59 = 1283;
    v57 = "tensor.from_elements";
    v58 = 20;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v55 = 259;
    llvm::operator+(v56, v54, (uint64_t)v60);
    llvm::report_fatal_error((llvm::Twine *)v60, 1);
  }
  mlir::OperationState::OperationState(v65, v9, v11);
  mlir::tensor::FromElementsOp::build((uint64_t)v8, (uint64_t)v65, v62[0], v62[1]);
  v13 = mlir::OpBuilder::create(v8, (const mlir::OperationState *)v65);
  v14 = v13;
  if (!v13)
  {
    v43 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v44 = 662;
    v45 = "Casting.h";
    v46 = "dyn_cast";
    goto LABEL_30;
  }
  v15 = *((_QWORD *)v13 + 6);
  v16 = *(void **)(v15 + 16);
  if (v16 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    v60[0] = *(_QWORD *)(v15 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)v60);
    if (v48 == 20)
    {
      v49 = *(_QWORD *)AttrData == 0x662E726F736E6574 && *(_QWORD *)(AttrData + 8) == 0x6D656C655F6D6F72;
      if (v49 && *(_DWORD *)(AttrData + 16) == 1937010277)
      {
        v59 = 1283;
        v56[0] = (uint64_t)"classof on '";
        v57 = "tensor.from_elements";
        v58 = 20;
        v54[0] = (uint64_t)"' failed due to the operation not being registered";
        v55 = 259;
        llvm::operator+(v56, v54, (uint64_t)v60);
        llvm::report_fatal_error((llvm::Twine *)v60, 1);
      }
    }
    goto LABEL_29;
  }
  if (v16 != &mlir::detail::TypeIDResolver<mlir::tensor::FromElementsOp,void>::id)
  {
LABEL_29:
    v43 = "result && \"builder didn't return the right type\";
    v44 = 497;
    v45 = "Builders.h";
    v46 = "create";
LABEL_30:
    __assert_rtn(v46, v45, v44, v43);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v65);
  if (!*((_DWORD *)v14 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v17 = *(_QWORD *)(*((_QWORD *)v14 - 1) & 0xFFFFFFFFFFFFFFF8);
  if (!v17)
    __assert_rtn("getAbstractType", "TypeSupport.h", 160, "abstractType && \"Malformed type storage object.\");
  if (*(_UNKNOWN **)(v17 + 136) != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id)
    __assert_rtn("cast", "Casting.h", 566, "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\");
  v52 = (uint64_t)v14 - 16;
  v18 = mlir::IntegerType::get(*(_QWORD *)**a1, 0x20u, 1u);
  v19 = (mlir::UnknownLoc **)**a1;
  v20 = (uint64_t)*a1[1];
  v65[0] = mlir::TypeAttr::get(v18);
  v21 = mlir::OpBuilder::create<mlir::mps::CastOp,mlir::Value &,mlir::TypeAttr &>(v19, v20, &v52, v65);
  if (!*((_DWORD *)v21 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  objc_msgSend(*((id *)*a1[2] + 5), "appendNewBlock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = [MPSGraphTensor alloc];
  v24 = (uint64_t)*a1[2];
  WeakRetained = objc_loadWeakRetained((id *)(v24 + 8));
  v51 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v23, "initTensorWithOperation:value:graph:parentBlock:name:", v24, (char *)v21 - 16, WeakRetained, v22, 0);

  v26 = (void *)objc_opt_new();
  if (a6)
  {
    v27 = 0;
    do
    {
      v28 = mlir::ValueRange::dereference_iterator(&v63, v27);
      v29 = [MPSGraphTensor alloc];
      v30 = (uint64_t)*a1[2];
      v31 = objc_loadWeakRetained((id *)(v30 + 8));
      v32 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v29, "initTensorWithOperation:value:graph:parentBlock:name:", v30, v28, v31, v22, 0);

      objc_msgSend(v26, "addObject:", v32);
      ++v27;
    }
    while (v64 > v27);
  }
  objc_storeStrong((id *)*a1[2] + 14, v26);
  v33 = (id *)objc_loadWeakRetained((id *)*a1[2] + 1);
  objc_storeStrong(v33 + 22, v22);

  (*(void (**)(void))(*((_QWORD *)*a1[2] + 11) + 16))();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (uint64_t)*a1[2];
  v36 = *(void **)(v35 + 96);
  *(_QWORD *)(v35 + 96) = v34;

  v37 = (uint64_t)*a1[2];
  v38 = *(void **)(v37 + 88);
  *(_QWORD *)(v37 + 88) = 0;

  v39 = [MPSGraphYieldOp alloc];
  v40 = objc_loadWeakRetained((id *)*a1[2] + 1);
  v41 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v39, "initWithGraph:inputTensors:controlDependencies:name:", v40, *((_QWORD *)*a1[2] + 12), MEMORY[0x1E0C9AA60], 0);

  v42 = (id *)objc_loadWeakRetained((id *)*a1[2] + 1);
  objc_msgSend(v42[22], "addTerminatorOperation:", v41);

}

@end
