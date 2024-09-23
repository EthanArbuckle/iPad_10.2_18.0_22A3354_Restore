@implementation MPSGraphPlaceholderOp

- (MPSGraphPlaceholderOp)initWithGraph:(id)a3 shape:(id)a4 dataType:(unsigned int)a5 name:(id)a6
{
  id v11;
  id v12;
  id v13;
  MPSGraphPlaceholderOp *v14;
  objc_super v16;

  objc_storeStrong((id *)&self->_shape, a4);
  v11 = a4;
  v12 = a6;
  v13 = a3;
  *(&self->_dataType + 1) = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSGraphPlaceholderOp;
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](&v16, sel_initWithGraph_inputTensors_controlDependencies_name_, v13, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v12);

  return v14;
}

- (MPSGraphPlaceholderOp)initWithGraph:(id)a3 shape:(id)a4 dataType:(unsigned int)a5 value:(Value)a6 name:(id)a7
{
  id *v9;
  MPSGraphPlaceholderOp *v10;
  NSArray *inputTensors;
  uint64_t v12;
  NSMutableArray *controlDependencies;
  NSString *name;
  id v15;
  uint64_t v16;
  NSArray *outputTensors;
  mlir::Operation *DefiningOp;
  uint64_t v19;
  NSString *v20;
  ValueImpl *impl;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  impl = a6.impl;
  v9 = (id *)a3;
  v10 = -[MPSGraphOperation initInternal](self, "initInternal");
  objc_storeWeak((id *)&v10->super._graph, v9);
  inputTensors = v10->super._inputTensors;
  v10->super._inputTensors = (NSArray *)MEMORY[0x1E0C9AA60];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = objc_claimAutoreleasedReturnValue();
  controlDependencies = v10->super._controlDependencies;
  v10->super._controlDependencies = (NSMutableArray *)v12;

  name = v10->super._name;
  v10->super._name = 0;

  if (a6.impl)
  {
    v15 = -[MPSGraphTensor initTensorWithOperation:value:graph:]([MPSGraphTensor alloc], "initTensorWithOperation:value:graph:", v10, a6.impl, v9);
    v23[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    outputTensors = v10->super._outputTensors;
    v10->super._outputTensors = (NSArray *)v16;

    DefiningOp = (mlir::Operation *)mlir::Value::getDefiningOp((mlir::Value *)&impl);
    getOpName(DefiningOp);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v10->super._name;
    v10->super._name = (NSString *)v19;

  }
  objc_msgSend(v9[10], "addObject:", v10);

  return v10;
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
  uint64_t **MLIRType;
  uint64_t *Context;
  uint64_t v27;
  char v28;
  mlir::GenericProgramPoint *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *DefiningOp;
  const char *v35;
  int v36;
  const char *v37;
  const char *v38;
  const char *v39;
  int v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *__p[2];
  char v45;
  uint64_t v46;
  const char *v47;
  __int16 v48;
  std::string v49;
  uint64_t v50;
  __int16 v51;
  int8x16_t __dst;
  unint64_t v53;
  _QWORD v54[4];
  __int16 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphPlaceholderOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMemoryOps.mm", __p);
  v11 = v10;
  v55 = 260;
  v54[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x77u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v53) = 15;
    qmemcpy(&__dst, "mps.placeholder", 15);
    v18 = &__dst.i8[15];
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
    v53 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v53) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v49);
  v21 = (std::string *)v49.__r_.__value_.__r.__words[0];
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v49;
  v22 = 1;
  HIBYTE(v55) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v54[0] = v21;
    v22 = 3;
  }
  LOBYTE(v55) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v49.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v53) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v53) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v45 < 0)
    operator delete(__p[0]);
  MLIRType = getMLIRType((mlir::MLIRContext **)a3, self->_shape, (mlir::MLIRContext *)*(&self->_dataType + 1));
  v46 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v46);
  v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.placeholder", (const unsigned __int8 *)0xF, Context);
  if (!v28)
  {
    v51 = 1283;
    v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.placeholder";
    v50 = 15;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v48 = 259;
    llvm::operator+((uint64_t *)&v49, (uint64_t *)&v47, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v54, v24, v27);
  mlir::mps::PlaceholderOp::build((uint64_t)a3, (uint64_t)v54, (uint64_t)MLIRType);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v54);
  if (!v29)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_37;
  }
  v30 = llvm::DefaultDoCastIfPossible<mlir::mps::PlaceholderOp,mlir::Operation *,llvm::CastInfo<mlir::mps::PlaceholderOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v29);
  if (!v30)
  {
    v35 = "result && \"builder didn't return the right type\";
    v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_37:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v54);
  if (!*(_DWORD *)(v30 + 36))
  {
    v39 = "resultNumber < getNumResults() && \"Result number is out of range for operation\";
    v40 = 984;
    v41 = "Operation.h";
    v42 = "getOpResultImpl";
    goto LABEL_41;
  }
  v31 = *(_QWORD *)(*(_QWORD *)(v30 - 8) & 0xFFFFFFFFFFFFFFF8);
  if (!v31)
  {
    v39 = "abstractType && \"Malformed type storage object.\";
    v40 = 160;
    v41 = "TypeSupport.h";
    v42 = "getAbstractType";
    goto LABEL_41;
  }
  v32 = *(void **)(v31 + 136);
  if (v32 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id
    && v32 != &mlir::detail::TypeIDResolver<mlir::UnrankedTensorType,void>::id)
  {
    v39 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v40 = 566;
    v41 = "Casting.h";
    v42 = "cast";
LABEL_41:
    __assert_rtn(v42, v41, v40, v39);
  }
  v43 = v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v43);

  return DefiningOp;
}

- (NSArray)shape
{
  return self->_shape;
}

- (unsigned)dataType
{
  return *(&self->_dataType + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

@end
