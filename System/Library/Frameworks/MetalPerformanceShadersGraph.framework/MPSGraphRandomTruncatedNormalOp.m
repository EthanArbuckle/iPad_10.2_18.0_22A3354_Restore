@implementation MPSGraphRandomTruncatedNormalOp

- (MPSGraphRandomTruncatedNormalOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  float v17;
  float v18;
  float v19;
  float v20;
  MPSGraphRandomTruncatedNormalOp *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  *(&self->_dataType + 1) = objc_msgSend(v15, "dataType");
  objc_msgSend(v15, "mean");
  self->_mean = v17;
  objc_msgSend(v15, "standardDeviation");
  self->_standardDeviation = v18;
  self->_samplingMethod = objc_msgSend(v15, "samplingMethod");
  objc_msgSend(v15, "min");
  self->_minimum = v19;
  objc_msgSend(v15, "max");
  self->_maximum = v20;
  v21 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v12, v13, v14, v16);

  return v21;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  uint64_t StringAttr;
  mlir::StringAttr **v12;
  uint64_t v13;
  const char *v14;
  size_t v15;
  size_t v16;
  void **p_dst;
  char *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t MLIRElementType;
  uint64_t *v27;
  uint64_t v28;
  llvm::APFloatBase *v29;
  void *v30;
  unsigned int samplingMethod;
  uint64_t *Context;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  llvm::APFloatBase *v38;
  void *v39;
  mlir::GenericProgramPoint *v40;
  mlir::GenericProgramPoint *v41;
  uint64_t v42;
  void *v43;
  void *DefiningOp;
  const char *v46;
  int v47;
  const char *v48;
  const char *v49;
  _QWORD *AttrData;
  uint64_t v51;
  BOOL v52;
  BOOL v53;
  id v55;
  mlir::Float32Type **v56;
  id v57;
  char *v58;
  void *__p[2];
  char v60;
  uint64_t v61;
  uint64_t v62[4];
  __int16 v63;
  std::string v64;
  uint64_t v65;
  __int16 v66;
  void **__dst;
  __int128 v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  char v77[8];
  void *v78;
  uint64_t v79;
  char v80[8];
  void *v81;
  uint64_t v82;
  char v83[8];
  void *v84;
  uint64_t v85;
  char v86[8];
  void *v87;
  uint64_t v88;
  _QWORD v89[4];
  __int16 v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v55 = a7;
  mpsFileLoc("-[MPSGraphRandomTruncatedNormalOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphRandomOps.mm", __p);
  v57 = v55;
  v90 = 260;
  v89[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v89);
  v12 = (mlir::StringAttr **)a3;
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x155u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v57)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    v68 = xmmword_181286A20;
    qmemcpy(v18, "mps.random_truncated_normal", 27);
    v19 = v18 + 27;
    goto LABEL_13;
  }
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
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
    *(_QWORD *)&v68 = v16;
    *((_QWORD *)&v68 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v68) = v15;
    p_dst = (void **)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v64);
  v22 = (std::string *)v64.__r_.__value_.__r.__words[0];
  if ((v64.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v64;
  v23 = 1;
  HIBYTE(v90) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v89[0] = v22;
    v23 = 3;
  }
  LOBYTE(v90) = v23;
  v24 = mlir::Builder::getStringAttr(v12, (mlir::MLIRContext *)v89);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v64.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v68) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v68) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v60 < 0)
    operator delete(__p[0]);
  MLIRElementType = getMLIRElementType(*v12, (mlir::MLIRContext *)*(&self->_dataType + 1));
  v27 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v28 = MLIRElementType;
  v29 = llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v89, self->_mean);
  v30 = llvm::APFloatBase::IEEEsingle(v29);
  llvm::APFloat::Storage::Storage(&v75, v89, v30);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v89);
  llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v89, self->_standardDeviation);
  llvm::APFloat::Storage::Storage(&v73, v89, v30);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v89);
  llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v89, self->_minimum);
  llvm::APFloat::Storage::Storage(&v71, v89, v30);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v89);
  llvm::detail::IEEEFloat::IEEEFloat((llvm::detail::IEEEFloat *)v89, self->_maximum);
  v56 = v12;
  llvm::APFloat::Storage::Storage(&v69, v89, v30);
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)v89);
  samplingMethod = self->_samplingMethod;
  v61 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v61);
  v33 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.random_truncated_normal", (const unsigned __int8 *)0x1B, Context);
  if (!v34)
  {
    v66 = 1283;
    v64.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.random_truncated_normal";
    v65 = 27;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v63 = 259;
    llvm::operator+((uint64_t *)&v64, v62, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v89, v25, v33);
  v35 = *v27;
  v36 = v27[1];
  v37 = v75;
  v39 = llvm::APFloatBase::PPCDoubleDouble(v38);
  if (v39 == v37)
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v87, &v75);
  else
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v87, (uint64_t)&v75);
  if (v39 == v73)
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v84, &v73);
  else
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v84, (uint64_t)&v73);
  if (v39 == v71)
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v81, &v71);
  else
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v81, (uint64_t)&v71);
  if (v39 == v69)
    llvm::detail::DoubleAPFloat::DoubleAPFloat(&v78, &v69);
  else
    llvm::detail::IEEEFloat::IEEEFloat((uint64_t)&v78, (uint64_t)&v69);
  mlir::mps::RandomTruncatedNormalOp::build(v56, (uint64_t)v89, v35, v36, v28, (uint64_t)v86, (uint64_t)v83, (uint64_t)v80, (uint64_t)v77, samplingMethod);
  if (v39 == v78)
  {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v79);
    if (v39 != v81)
    {
LABEL_40:
      llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v81);
      if (v39 != v84)
        goto LABEL_41;
LABEL_45:
      std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v85);
      if (v39 != v87)
        goto LABEL_42;
      goto LABEL_46;
    }
  }
  else
  {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v78);
    if (v39 != v81)
      goto LABEL_40;
  }
  std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v82);
  if (v39 == v84)
    goto LABEL_45;
LABEL_41:
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v84);
  if (v39 != v87)
  {
LABEL_42:
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v87);
    goto LABEL_47;
  }
LABEL_46:
  std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v88);
LABEL_47:
  v40 = mlir::OpBuilder::create((mlir::OpBuilder *)v56, (const mlir::OperationState *)v89);
  v41 = v40;
  if (!v40)
  {
    v46 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v47 = 662;
    v48 = "Casting.h";
    v49 = "dyn_cast";
    goto LABEL_81;
  }
  v42 = *((_QWORD *)v40 + 6);
  v43 = *(void **)(v42 + 16);
  if (v43 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v42 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v51 == 27)
    {
      v52 = *AttrData == 0x646E61722E73706DLL && AttrData[1] == 0x636E7572745F6D6FLL;
      v53 = v52 && AttrData[2] == 0x726F6E5F64657461;
      if (v53 && *(_QWORD *)((char *)AttrData + 19) == 0x6C616D726F6E5F64)
      {
        v66 = 1283;
        v64.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v64.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.random_truncated_normal";
        v65 = 27;
        v62[0] = (uint64_t)"' failed due to the operation not being registered";
        v63 = 259;
        llvm::operator+((uint64_t *)&v64, v62, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_80;
  }
  if (v43 != &mlir::detail::TypeIDResolver<mlir::mps::RandomTruncatedNormalOp,void>::id)
  {
LABEL_80:
    v46 = "result && \"builder didn't return the right type\";
    v47 = 497;
    v48 = "Builders.h";
    v49 = "create";
LABEL_81:
    __assert_rtn(v49, v48, v47, v46);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v89);
  if (!*((_DWORD *)v41 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v58 = (char *)v41 - 16;
  if (v39 == v69)
  {
    std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v70);
    if (v39 != v71)
    {
LABEL_53:
      llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v71);
      if (v39 != v73)
        goto LABEL_54;
LABEL_58:
      std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v74);
      if (v39 != v75)
        goto LABEL_55;
LABEL_59:
      std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v76);
      goto LABEL_60;
    }
  }
  else
  {
    llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v69);
    if (v39 != v71)
      goto LABEL_53;
  }
  std::unique_ptr<llvm::APFloat []>::reset[abi:ne180100]((llvm::APFloatBase *)&v72);
  if (v39 == v73)
    goto LABEL_58;
LABEL_54:
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v73);
  if (v39 == v75)
    goto LABEL_59;
LABEL_55:
  llvm::detail::IEEEFloat::~IEEEFloat((llvm::detail::IEEEFloat *)&v75);
LABEL_60:
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v58);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end
