@implementation MPSGraphPruningOp

- (MPSGraphPruningOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 shape:(id)a6 descriptor:(id)a7 name:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  MPSGraphPruningDescriptor *v16;
  MPSGraphPruningDescriptor *pruningDesc;
  MPSGraphPruningOp *v18;
  MPSGraphPruningOp *v19;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a8;
  v16 = (MPSGraphPruningDescriptor *)-[MPSGraphPruningDescriptor copy](self->_pruningDesc, "copy");
  pruningDesc = self->_pruningDesc;
  self->_pruningDesc = v16;

  objc_storeStrong((id *)&self->_shape, a6);
  v18 = [MPSGraphPruningOp alloc];
  v19 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v18, "initWithGraph:inputTensors:controlDependencies:name:", v12, v13, MEMORY[0x1E0C9AA60], v15);

  return v19;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(WeakRetained, "prunedGradientTensorWithDescriptor:inputTensor:gradientTensor:shape:name:", self->_pruningDesc, v8, v9, self->_shape, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
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
  uint64_t *v25;
  unsigned int v26;
  unsigned int v27;
  float v28;
  llvm::APFloatBase *v29;
  void *v30;
  uint64_t *Context;
  uint64_t v32;
  char v33;
  uint64_t v34;
  void *v35;
  llvm::APFloatBase *v36;
  void *v37;
  mlir::GenericProgramPoint *v38;
  mlir::GenericProgramPoint *v39;
  uint64_t v40;
  void *v41;
  void *DefiningOp;
  const char *v44;
  int v45;
  const char *v46;
  const char *v47;
  uint64_t AttrData;
  uint64_t v49;
  id v51;
  char *v52;
  void *__p[2];
  char v54;
  uint64_t v55;
  uint64_t v56[4];
  __int16 v57;
  std::string v58;
  uint64_t v59;
  __int16 v60;
  int8x16_t __dst;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  char v65[8];
  void *v66;
  uint64_t v67;
  _QWORD v68[4];
  __int16 v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v51 = a7;
  mpsFileLoc("-[MPSGraphPruningOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphPruningOps.mm", __p);
  v11 = v51;
  v69 = 260;
  v68[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x8Fu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v62) = 9;
    __dst.i8[8] = 101;
    __dst.i64[0] = *(_QWORD *)"mps.prune";
    v18 = &__dst.i8[9];
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
    v62 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v62) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v58);
  v21 = (std::string *)v58.__r_.__value_.__r.__words[0];
  if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v58;
  v22 = 1;
  HIBYTE(v69) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v68[0] = v21;
    v22 = 3;
  }
  LOBYTE(v69) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v68);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v58.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v62) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v62) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v54 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v26 = -[MPSGraphPruningDescriptor pruningMetric](self->_pruningDesc, "pruningMetric");
  v27 = -[MPSGraphPruningDescriptor pruningStructure](self->_pruningDesc, "pruningStructure");
  -[MPSGraphPruningDescriptor sparsity](self->_pruningDesc, "sparsity");
  v29 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v68, v28);
  v30 = llvm::APFloatBase::IEEEsingle(v29);
  llvm::APFloat::Storage::Storage(&v63, v68, v30);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v68);
  v55 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v55);
  v32 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.prune", (const unsigned __int8 *)9, Context);
  if (!v33)
  {
    v60 = 1283;
    v58.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.prune";
    v59 = 9;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v57 = 259;
    llvm::operator+((uint64_t *)&v58, v56, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v68, v24, v32);
  v34 = *v25;
  v35 = v63;
  v37 = llvm::APFloatBase::PPCDoubleDouble(v36);
  if (v37 == v35)
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v66, &v63);
  else
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v66, (uint64_t)&v63);
  mlir::mps::PruningOp::build((mlir::Float32Type **)a3, (uint64_t)v68, v34, v26, v27, (uint64_t)v65);
  if (v37 == v66)
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v67);
  else
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v66);
  v38 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v68);
  v39 = v38;
  if (!v38)
  {
    v44 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v45 = 662;
    v46 = "Casting.h";
    v47 = "dyn_cast";
    goto LABEL_54;
  }
  v40 = *((_QWORD *)v38 + 6);
  v41 = *(void **)(v40 + 16);
  if (v41 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v40 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v49 == 9 && *(_QWORD *)AttrData == 0x6E7572702E73706DLL && *(_BYTE *)(AttrData + 8) == 101)
    {
      v60 = 1283;
      v58.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v58.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.prune";
      v59 = 9;
      v56[0] = (uint64_t)"' failed due to the operation not being registered";
      v57 = 259;
      llvm::operator+((uint64_t *)&v58, v56, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_53;
  }
  if (v41 != &mlir::detail::TypeIDResolver<mlir::mps::PruningOp,void>::id)
  {
LABEL_53:
    v44 = "result && \"builder didn't return the right type\";
    v45 = 497;
    v46 = "Builders.h";
    v47 = "create";
LABEL_54:
    __assert_rtn(v47, v46, v45, v44);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v68);
  if (!*((_DWORD *)v39 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v52 = (char *)v39 - 16;
  if (v37 == v63)
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v64);
  else
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v63);
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v52);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_pruningDesc, 0);
}

@end
