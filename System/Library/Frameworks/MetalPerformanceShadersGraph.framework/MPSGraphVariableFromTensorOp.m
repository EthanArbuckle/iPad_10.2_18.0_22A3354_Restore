@implementation MPSGraphVariableFromTensorOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  id v11;
  uint64_t StringAttr;
  uint64_t v13;
  const char *v14;
  size_t v15;
  size_t v16;
  void **p_dst;
  char *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *p_p;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *DefiningOp;
  const char *v32;
  int v33;
  const char *v34;
  const char *v35;
  void *v36[2];
  char v37;
  std::string __p;
  void **__dst;
  __int128 v40;
  _QWORD v41[4];
  __int16 v42;

  v10 = a7;
  mpsFileLoc("-[MPSGraphVariableFromTensorOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphVariableFromTensorOp.mm", v36);
  v11 = v10;
  v42 = 260;
  v41[0] = v36;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v41);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x1Du, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    v40 = xmmword_18125D370;
    qmemcpy(v18, "mps.variable_from_tensor", 24);
    v19 = v18 + 24;
    goto LABEL_13;
  }
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v20 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v20 = v15 | 7;
    v21 = v20 + 1;
    p_dst = (void **)operator new(v20 + 1);
    *(_QWORD *)&v40 = v16;
    *((_QWORD *)&v40 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v40) = v15;
    p_dst = (void **)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v23 = 1;
  HIBYTE(v42) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v41[0] = p_p;
    v23 = 3;
  }
  LOBYTE(v42) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v41);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v40) & 0x80000000) == 0)
    {
LABEL_20:

      if ((v37 & 0x80000000) == 0)
        goto LABEL_21;
      goto LABEL_29;
    }
  }
  else if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);

  if ((v37 & 0x80000000) == 0)
  {
LABEL_21:
    v26 = *(uint64_t **)a5;
    if (*((_QWORD *)a5 + 1) != *(_QWORD *)a5)
      goto LABEL_22;
LABEL_30:
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  }
LABEL_29:
  operator delete(v36[0]);
  v26 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    goto LABEL_30;
LABEL_22:
  v27 = mlir::OpBuilder::create<mlir::mps::VariableFromTensorOp,mlir::Value &>((mlir::OpBuilder *)a3, v25, v26);
  if (!*(_DWORD *)(v27 + 36))
  {
    v32 = "resultNumber < getNumResults() && \"Result number is out of range for operation\";
    v33 = 984;
    v34 = "Operation.h";
    v35 = "getOpResultImpl";
    goto LABEL_36;
  }
  v28 = *(_QWORD *)(*(_QWORD *)(v27 - 8) & 0xFFFFFFFFFFFFFFF8);
  if (!v28)
  {
    v32 = "abstractType && \"Malformed type storage object.\";
    v33 = 160;
    v34 = "TypeSupport.h";
    v35 = "getAbstractType";
    goto LABEL_36;
  }
  v29 = *(void **)(v28 + 136);
  if (v29 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id
    && v29 != &mlir::detail::TypeIDResolver<mlir::UnrankedTensorType,void>::id)
  {
    v32 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v33 = 566;
    v34 = "Casting.h";
    v35 = "cast";
LABEL_36:
    __assert_rtn(v35, v34, v33, v32);
  }
  v41[0] = v27 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)v41);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return a4;
}

- (MPSGraphVariableFromTensorOp)initWithGraph:(id)a3 tensor:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MPSGraphVariableFromTensorOp *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphVariableFromTensorOp;
  v12 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](&v14, sel_initWithGraph_inputTensors_controlDependencies_name_, v8, v11, MEMORY[0x1E0C9AA60], v10);

  return v12;
}

@end
