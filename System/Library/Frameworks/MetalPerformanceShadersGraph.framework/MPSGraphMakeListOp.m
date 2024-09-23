@implementation MPSGraphMakeListOp

- (MPSGraphMakeListOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 elementType:(id)a6 maxSize:(id)a7 name:(id)a8
{
  NSNumber *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSNumber *maxSize;
  MPSGraphMakeListOp *v21;
  id v23;

  v23 = a6;
  v15 = (NSNumber *)a7;
  objc_storeStrong((id *)&self->_elementType, a6);
  v16 = a8;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  maxSize = self->_maxSize;
  self->_maxSize = v15;

  v21 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v19, v18, v17, v16);
  return v21;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  uint64_t MLIRType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t StringAttr;
  uint64_t v17;
  const char *v18;
  size_t v19;
  size_t v20;
  int8x16_t *p_dst;
  uint64_t v22;
  uint64_t v23;
  std::string *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *Context;
  uint64_t v29;
  char v30;
  mlir::GenericProgramPoint *v31;
  mlir::GenericProgramPoint *v32;
  uint64_t v33;
  void *v34;
  void *DefiningOp;
  const char *v37;
  int v38;
  const char *v39;
  const char *v40;
  _QWORD *AttrData;
  uint64_t v42;
  char *v44;
  void *__p[2];
  char v46;
  uint64_t v47;
  uint64_t v48[4];
  __int16 v49;
  std::string v50;
  uint64_t v51;
  __int16 v52;
  int8x16_t __dst;
  unint64_t v54;
  _QWORD v55[4];
  __int16 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  MLIRType = getMLIRType(*(mlir::MLIRContext **)a3, self->_elementType);
  v12 = mlir::TypeAttr::get(MLIRType);
  if (self->_maxSize)
  {
    v13 = mlir::IntegerType::get(*(_QWORD *)a3, 0x20u, 2u);
    v14 = mlir::IntegerAttr::get(v13, -[NSNumber unsignedLongValue](self->_maxSize, "unsignedLongValue"));
  }
  else
  {
    v14 = 0;
  }
  mpsFileLoc("-[MPSGraphMakeListOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphListOps.mm", __p);
  v15 = v10;
  v56 = 260;
  v55[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  v17 = mlir::FileLineColLoc::get(StringAttr, 0x45u, 0);
  if (!v17)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v15)
  {
    HIBYTE(v54) = 14;
    strcpy(__dst.i8, "mpsx.make_list");
    goto LABEL_16;
  }
  v18 = (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
  v19 = strlen(v18);
  if (v19 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v20 = v19;
  if (v19 >= 0x17)
  {
    v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v22 = v19 | 7;
    v23 = v22 + 1;
    p_dst = (int8x16_t *)operator new(v22 + 1);
    __dst.i64[1] = v20;
    v54 = v23 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v54) = v19;
    p_dst = &__dst;
    if (!v19)
      goto LABEL_15;
  }
  memmove(p_dst, v18, v20);
LABEL_15:
  p_dst->i8[v20] = 0;
LABEL_16:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v50);
  v24 = (std::string *)v50.__r_.__value_.__r.__words[0];
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v24 = &v50;
  v25 = 1;
  HIBYTE(v56) = 1;
  if (v24->__r_.__value_.__s.__data_[0])
  {
    v55[0] = v24;
    v25 = 3;
  }
  LOBYTE(v56) = v25;
  v26 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v55);
  v27 = mlir::NameLoc::get(v26, v17);
  if (!v27)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v50.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v54) & 0x80000000) == 0)
      goto LABEL_23;
  }
  else if ((SHIBYTE(v54) & 0x80000000) == 0)
  {
    goto LABEL_23;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_23:

  if (v46 < 0)
    operator delete(__p[0]);
  v47 = v27;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v47);
  v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.make_list", (const unsigned __int8 *)0xE, Context);
  if (!v30)
  {
    v52 = 1283;
    v50.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.make_list";
    v51 = 14;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v49 = 259;
    llvm::operator+((uint64_t *)&v50, v48, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v55, v27, v29);
  mlir::mpsx::MakeListOp::build((mlir::UnknownLoc **)a3, (uint64_t)v55, v12, v14);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v55);
  v32 = v31;
  if (!v31)
  {
    v37 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v38 = 662;
    v39 = "Casting.h";
    v40 = "dyn_cast";
    goto LABEL_46;
  }
  v33 = *((_QWORD *)v31 + 6);
  v34 = *(void **)(v33 + 16);
  if (v34 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v33 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v42 == 14 && *AttrData == 0x6B616D2E7873706DLL && *(_QWORD *)((char *)AttrData + 6) == 0x7473696C5F656B61)
    {
      v52 = 1283;
      v50.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v50.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.make_list";
      v51 = 14;
      v48[0] = (uint64_t)"' failed due to the operation not being registered";
      v49 = 259;
      llvm::operator+((uint64_t *)&v50, v48, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_45;
  }
  if (v34 != &mlir::detail::TypeIDResolver<mlir::mpsx::MakeListOp,void>::id)
  {
LABEL_45:
    v37 = "result && \"builder didn't return the right type\";
    v38 = 497;
    v39 = "Builders.h";
    v40 = "create";
LABEL_46:
    __assert_rtn(v40, v39, v38, v37);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v55);
  if (!*((_DWORD *)v32 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v44 = (char *)v32 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v44);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSize, 0);
  objc_storeStrong((id *)&self->_elementType, 0);
}

@end
