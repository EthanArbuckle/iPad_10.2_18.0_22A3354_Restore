@implementation MPSGraphInitRandomPhiloxStateOp

- (MPSGraphInitRandomPhiloxStateOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 counterLow:(unint64_t)a6 counterHigh:(unint64_t)a7 key:(unint64_t)a8 name:(id)a9
{
  self->_counterLow = a6;
  self->_counterHigh = a7;
  self->_key = a8;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a9);
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
  uint64_t *p_dst;
  uint64_t *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t IntegerType;
  uint64_t **v27;
  uint64_t InterfaceFor;
  const char *v29;
  int v30;
  const char *v31;
  const char *v32;
  uint64_t *v33;
  mlir::GenericProgramPoint *v34;
  uint64_t v35;
  uint64_t **v36;
  uint64_t v37;
  const char *v38;
  int v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  mlir::GenericProgramPoint *v43;
  uint64_t v44;
  uint64_t **v45;
  uint64_t v46;
  const char *v47;
  int v48;
  const char *v49;
  const char *v50;
  uint64_t *v51;
  mlir::GenericProgramPoint *v52;
  uint64_t v53;
  void *DefiningOp;
  const char *v56;
  int v57;
  const char *v58;
  const char *v59;
  const char *v60;
  int v61;
  const char *v62;
  const char *v63;
  const char *v64;
  int v65;
  const char *v66;
  const char *v67;
  unint64_t key;
  void *__p[2];
  char v70;
  uint64_t *__dst;
  __int128 v72;
  uint64_t v73[4];
  __int16 v74;
  unint64_t counterHigh;
  unint64_t counterLow;
  std::string v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphInitRandomPhiloxStateOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRandomOps.mm", __p);
  v11 = v10;
  v74 = 260;
  v73[0] = (uint64_t)__p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0xB1u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (uint64_t *)operator new(0x20uLL);
    __dst = v18;
    v72 = xmmword_181268750;
    qmemcpy(v18, "mps.init_random_philox_state", 28);
    v19 = (char *)v18 + 28;
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
    p_dst = (uint64_t *)operator new(v20 + 1);
    *(_QWORD *)&v72 = v16;
    *((_QWORD *)&v72 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v72) = v15;
    p_dst = (uint64_t *)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v77);
  v22 = (std::string *)v77.__r_.__value_.__r.__words[0];
  if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v77;
  v23 = 1;
  HIBYTE(v74) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v73[0] = (uint64_t)v22;
    v23 = 3;
  }
  LOBYTE(v74) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v73);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v77.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v72) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v72) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v70 < 0)
    operator delete(__p[0]);
  v77.__r_.__value_.__r.__words[0] = 1;
  IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x40u, 1);
  v27 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)&v77, 1, IntegerType, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v27))
  {
    v29 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v30 = 566;
    v31 = "Casting.h";
    v32 = "cast";
LABEL_50:
    __assert_rtn(v32, v31, v30, v29);
  }
  if (v27)
  {
    InterfaceFor = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v27);
    if (!InterfaceFor)
    {
      v29 = "(!t || conceptImpl) && \"expected value to provide interface instance\";
      v30 = 98;
      v31 = "InterfaceSupport.h";
      v32 = "Interface";
      goto LABEL_50;
    }
  }
  else
  {
    InterfaceFor = 0;
  }
  counterLow = self->_counterLow;
  v33 = (uint64_t *)mlir::DenseElementsAttr::getFromRawBuffer(v27, InterfaceFor, &counterLow, 8, 8, 1, 1);
  if (!mlir::DenseIntElementsAttr::classof((uint64_t)v33))
  {
    v56 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v57 = 566;
    v58 = "Casting.h";
    v59 = "cast";
    goto LABEL_53;
  }
  __dst = v33;
  v34 = mlir::OpBuilder::create<mlir::mps::ConstantOp,mlir::DenseIntElementsAttr>((mlir::OpBuilder *)a3, v25, &__dst);
  if (!*((_DWORD *)v34 + 9))
  {
    v56 = "resultNumber < getNumResults() && \"Result number is out of range for operation\";
    v57 = 984;
    v58 = "Operation.h";
    v59 = "getOpResultImpl";
LABEL_53:
    __assert_rtn(v59, v58, v57, v56);
  }
  v73[0] = (uint64_t)v34 - 16;
  counterLow = 1;
  v35 = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x40u, 1);
  v36 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)&counterLow, 1, v35, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v36))
  {
    v38 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v39 = 566;
    v40 = "Casting.h";
    v41 = "cast";
LABEL_55:
    __assert_rtn(v41, v40, v39, v38);
  }
  if (v36)
  {
    v37 = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v36);
    if (!v37)
    {
      v38 = "(!t || conceptImpl) && \"expected value to provide interface instance\";
      v39 = 98;
      v40 = "InterfaceSupport.h";
      v41 = "Interface";
      goto LABEL_55;
    }
  }
  else
  {
    v37 = 0;
  }
  counterHigh = self->_counterHigh;
  v42 = mlir::DenseElementsAttr::getFromRawBuffer(v36, v37, &counterHigh, 8, 8, 1, 1);
  if (!mlir::DenseIntElementsAttr::classof(v42))
  {
    v60 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v61 = 566;
    v62 = "Casting.h";
    v63 = "cast";
    goto LABEL_58;
  }
  v77.__r_.__value_.__r.__words[0] = v42;
  v43 = mlir::OpBuilder::create<mlir::mps::ConstantOp,mlir::DenseIntElementsAttr>((mlir::OpBuilder *)a3, v25, (uint64_t **)&v77);
  if (!*((_DWORD *)v43 + 9))
  {
    v60 = "resultNumber < getNumResults() && \"Result number is out of range for operation\";
    v61 = 984;
    v62 = "Operation.h";
    v63 = "getOpResultImpl";
LABEL_58:
    __assert_rtn(v63, v62, v61, v60);
  }
  __dst = (uint64_t *)((char *)v43 - 16);
  counterHigh = 1;
  v44 = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x40u, 1);
  v45 = (uint64_t **)mlir::RankedTensorType::get((uint64_t)&counterHigh, 1, v44, 0);
  if (!mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v45))
  {
    v47 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v48 = 566;
    v49 = "Casting.h";
    v50 = "cast";
LABEL_60:
    __assert_rtn(v50, v49, v48, v47);
  }
  if (v45)
  {
    v46 = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v45);
    if (!v46)
    {
      v47 = "(!t || conceptImpl) && \"expected value to provide interface instance\";
      v48 = 98;
      v49 = "InterfaceSupport.h";
      v50 = "Interface";
      goto LABEL_60;
    }
  }
  else
  {
    v46 = 0;
  }
  key = self->_key;
  v51 = (uint64_t *)mlir::DenseElementsAttr::getFromRawBuffer(v45, v46, &key, 8, 8, 1, 1);
  if (!mlir::DenseIntElementsAttr::classof((uint64_t)v51))
  {
    v64 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v65 = 566;
    v66 = "Casting.h";
    v67 = "cast";
    goto LABEL_63;
  }
  counterLow = (unint64_t)v51;
  v52 = mlir::OpBuilder::create<mlir::mps::ConstantOp,mlir::DenseIntElementsAttr>((mlir::OpBuilder *)a3, v25, (uint64_t **)&counterLow);
  if (!*((_DWORD *)v52 + 9))
  {
    v64 = "resultNumber < getNumResults() && \"Result number is out of range for operation\";
    v65 = 984;
    v66 = "Operation.h";
    v67 = "getOpResultImpl";
LABEL_63:
    __assert_rtn(v67, v66, v65, v64);
  }
  v77.__r_.__value_.__r.__words[0] = (std::string::size_type)v52 - 16;
  v53 = mlir::OpBuilder::create<mlir::mps::InitRandomPhiloxStateOp,mlir::Value &,mlir::Value &,mlir::Value &>((uint64_t *)a3, v25, v73, (uint64_t *)&__dst, (uint64_t *)&v77);
  if (!*(_DWORD *)(v53 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  counterLow = v53 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&counterLow);

  return DefiningOp;
}

@end
