@implementation MPSGraphCropOp

- (MPSGraphCropOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension_index:(int64_t)a6 amount_before:(unint64_t)a7 amount_after:(unint64_t)a8 name:(id)a9
{
  self->_amount_after = a8;
  self->_amount_before = a7;
  self->_dimensionIndex = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a9);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  id v12;
  uint64_t StringAttr;
  uint64_t v14;
  const char *v15;
  size_t v16;
  size_t v17;
  int8x16_t *p_dst;
  uint64_t v19;
  uint64_t v20;
  std::string *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *Context;
  uint64_t v27;
  char v28;
  mlir::GenericProgramPoint *v29;
  uint64_t v30;
  void *DefiningOp;
  const char *v33;
  int v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *__p[2];
  char v39;
  uint64_t v40;
  const char *v41;
  __int16 v42;
  std::string v43;
  uint64_t v44;
  __int16 v45;
  int8x16_t __dst;
  unint64_t v47;
  uint64_t v48[4];
  __int16 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphCropOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  v12 = v11;
  v49 = 260;
  v48[0] = (uint64_t)__p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x1BFu, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    HIBYTE(v47) = 8;
    strcpy(__dst.i8, "mps.crop");
    goto LABEL_13;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v17;
    v47 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v47) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v43);
  v21 = (std::string *)v43.__r_.__value_.__r.__words[0];
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v43;
  v22 = 1;
  HIBYTE(v49) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v48[0] = (uint64_t)v21;
    v22 = 3;
  }
  LOBYTE(v49) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v48);
  v24 = mlir::NameLoc::get(v23, v14);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v43.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v47) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v47) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v39 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v40 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v40);
  v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.crop", (const unsigned __int8 *)8, Context);
  if (!v28)
  {
    v45 = 1283;
    v43.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.crop";
    v44 = 8;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v42 = 259;
    llvm::operator+((uint64_t *)&v43, (uint64_t *)&v41, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v48, v24, v27);
  mlir::mps::CropOp::build((mlir::mps::ConstantOp *)a3, v48, *v25, v25[1], self->_amount_before, self->_amount_after);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v48);
  if (!v29)
  {
    v33 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v34 = 662;
    v35 = "Casting.h";
    v36 = "dyn_cast";
    goto LABEL_35;
  }
  v30 = llvm::DefaultDoCastIfPossible<mlir::mps::CropOp,mlir::Operation *,llvm::CastInfo<mlir::mps::CropOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v29);
  if (!v30)
  {
    v33 = "result && \"builder didn't return the right type\";
    v34 = 497;
    v35 = "Builders.h";
    v36 = "create";
LABEL_35:
    __assert_rtn(v36, v35, v34, v33);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v48);
  if (!*(_DWORD *)(v30 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v37 = v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v37);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  int64_t dimensionIndex;
  void *v12;
  void *v13;
  void *v14;
  unint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v9 = a3;
  v26 = a4;
  v10 = a6;
  dimensionIndex = self->_dimensionIndex;
  if (dimensionIndex < 0)
  {
    objc_msgSend(v9, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dimensionIndex = self->_dimensionIndex + objc_msgSend(v12, "count");

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend(v9, "shape");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (i >= v17)
      break;
    if (dimensionIndex == i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_amount_before);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v18);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_amount_after);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v19);

    }
    else
    {
      objc_msgSend(v13, "addObject:", &unk_1E0E98B18);
      objc_msgSend(v14, "addObject:", &unk_1E0E98B18);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v21 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@/%@/pad"), v10, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", v26, 0, v13, v14, v23, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

@end
