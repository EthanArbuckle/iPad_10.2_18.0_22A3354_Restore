@implementation MPSGraphVariableOp

- (id)mpsNDArrayWithDevice:(id)a3
{
  -[MPSGraphVariable mpsNDArrayWithDevice:](self->_variable, "mpsNDArrayWithDevice:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPSGraphVariableOp)initWithGraph:(id)a3 shape:(id)a4 dataType:(unsigned int)a5 name:(id)a6
{
  id v11;
  id v12;
  id v13;
  MPSGraphVariableOp *v14;
  objc_super v16;

  objc_storeStrong((id *)&self->_shape, a4);
  v11 = a4;
  v12 = a6;
  v13 = a3;
  self->_dataType = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSGraphVariableOp;
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](&v16, sel_initWithGraph_inputTensors_controlDependencies_name_, v13, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v12);

  return v14;
}

- (MPSGraphVariableOp)initWithGraph:(id)a3 variableMPSNDArray:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSArray *v12;
  NSArray *shape;
  MPSGraphVariableOp *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getShape");
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  shape = self->_shape;
  self->_shape = v12;

  self->_dataType = objc_msgSend(v9, "dataType");
  v16.receiver = self;
  v16.super_class = (Class)MPSGraphVariableOp;
  v14 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](&v16, sel_initWithGraph_inputTensors_controlDependencies_name_, v8, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v10);

  return v14;
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
  uint64_t v26;
  uint64_t Value;
  uint64_t *Context;
  uint64_t v29;
  char v30;
  mlir::GenericProgramPoint *v31;
  mlir::GenericProgramPoint *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *DefiningOp;
  const char *v39;
  int v40;
  const char *v41;
  const char *v42;
  const char *v43;
  int v44;
  const char *v45;
  const char *v46;
  _QWORD *AttrData;
  uint64_t v48;
  uint64_t v50;
  char *v51;
  void *__p[2];
  char v53;
  uint64_t v54;
  uint64_t v55[4];
  __int16 v56;
  std::string v57;
  uint64_t v58;
  __int16 v59;
  int8x16_t __dst;
  unint64_t v61;
  _QWORD v62[4];
  __int16 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphVariableOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMemoryOps.mm", __p);
  v11 = v10;
  v63 = 260;
  v62[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v62);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0xEFu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v61) = 15;
    qmemcpy(&__dst, "mpsx.var_handle", 15);
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
    v61 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v61) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v57);
  v21 = (std::string *)v57.__r_.__value_.__r.__words[0];
  if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v57;
  v22 = 1;
  HIBYTE(v63) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v62[0] = v21;
    v22 = 3;
  }
  LOBYTE(v63) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v62);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v57.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v61) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v61) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v53 < 0)
    operator delete(__p[0]);
  MLIRType = getMLIRType((mlir::MLIRContext **)a3, self->_shape, (mlir::MLIRContext *)self->_dataType);
  if (!*(_QWORD *)v24)
  {
    v39 = "abstractAttribute && \"Malformed attribute storage object.\";
    v40 = 165;
    v41 = "AttributeSupport.h";
    v42 = "getAbstractAttribute";
    goto LABEL_43;
  }
  if (*(_UNKNOWN **)(*(_QWORD *)v24 + 136) != &mlir::detail::TypeIDResolver<mlir::NameLoc,void>::id)
  {
LABEL_35:
    v39 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v40 = 566;
    v41 = "Casting.h";
    v42 = "cast";
    goto LABEL_43;
  }
  v26 = (uint64_t)MLIRType;
  v50 = v24;
  Value = mlir::AffineMapAttr::getValue((mlir::AffineMapAttr *)&v50);
  v54 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v54);
  v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.var_handle", (const unsigned __int8 *)0xF, Context);
  if (!v30)
  {
    v59 = 1283;
    v57.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.var_handle";
    v58 = 15;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v56 = 259;
    llvm::operator+((uint64_t *)&v57, v55, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v62, v24, v29);
  mlir::placement::StartTimer::build((uint64_t)a3, (uint64_t)v62, v26, Value);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v62);
  v32 = v31;
  if (!v31)
  {
    v43 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v44 = 662;
    v45 = "Casting.h";
    v46 = "dyn_cast";
    goto LABEL_52;
  }
  v33 = *((_QWORD *)v31 + 6);
  v34 = *(void **)(v33 + 16);
  if (v34 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v33 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v48 == 15 && *AttrData == 0x7261762E7873706DLL && *(_QWORD *)((char *)AttrData + 7) == 0x656C646E61685F72)
    {
      v59 = 1283;
      v57.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v57.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.var_handle";
      v58 = 15;
      v55[0] = (uint64_t)"' failed due to the operation not being registered";
      v56 = 259;
      llvm::operator+((uint64_t *)&v57, v55, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_51;
  }
  if (v34 != &mlir::detail::TypeIDResolver<mlir::mpsx::VarHandleOp,void>::id)
  {
LABEL_51:
    v43 = "result && \"builder didn't return the right type\";
    v44 = 497;
    v45 = "Builders.h";
    v46 = "create";
LABEL_52:
    __assert_rtn(v46, v45, v44, v43);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v62);
  if (!*((_DWORD *)v32 + 9))
  {
    v39 = "resultNumber < getNumResults() && \"Result number is out of range for operation\";
    v40 = 984;
    v41 = "Operation.h";
    v42 = "getOpResultImpl";
    goto LABEL_43;
  }
  v35 = *(_QWORD *)(*((_QWORD *)v32 - 1) & 0xFFFFFFFFFFFFFFF8);
  if (!v35)
  {
    v39 = "abstractType && \"Malformed type storage object.\";
    v40 = 160;
    v41 = "TypeSupport.h";
    v42 = "getAbstractType";
LABEL_43:
    __assert_rtn(v42, v41, v40, v39);
  }
  v36 = *(void **)(v35 + 136);
  if (v36 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id
    && v36 != &mlir::detail::TypeIDResolver<mlir::UnrankedTensorType,void>::id)
  {
    goto LABEL_35;
  }
  v51 = (char *)v32 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v51);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return a4;
}

- (MPSShape)shape
{
  return self->_shape;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (MPSGraphVariable)variable
{
  return self->_variable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

@end
