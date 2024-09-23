@implementation MPSGraphDeinterleaveOp

- (MPSGraphDeinterleaveOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 interleaveFactor:(unint64_t)a6 name:(id)a7
{
  self->_interleaveFactor = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a7);
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
  __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *Context;
  uint64_t v28;
  char v29;
  mlir::GenericProgramPoint *v30;
  mlir::GenericProgramPoint *v31;
  uint64_t v32;
  void *v33;
  const char *v35;
  int v36;
  const char *v37;
  const char *v38;
  uint64_t AttrData;
  uint64_t v40;
  void *__p[2];
  char v44;
  uint64_t v45;
  uint64_t v46[4];
  __int16 v47;
  std::string v48;
  uint64_t v49;
  __int16 v50;
  int8x16_t __dst;
  unint64_t v52;
  _QWORD v53[4];
  __int16 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  mpsFileLoc("-[MPSGraphDeinterleaveOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  v12 = v11;
  v54 = 260;
  v53[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v53);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x62Fu, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    HIBYTE(v52) = 17;
    LOBYTE(v52) = 101;
    __dst = *(int8x16_t *)"mpsx.deinterleave";
    v19 = (char *)&v52 + 1;
    goto LABEL_13;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v20 = v16 | 7;
    v21 = v20 + 1;
    p_dst = (int8x16_t *)operator new(v20 + 1);
    __dst.i64[1] = v17;
    v52 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v52) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  v19 = &p_dst->i8[v17];
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v48);
  v22 = (std::string *)v48.__r_.__value_.__r.__words[0];
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v48;
  v23 = 1;
  HIBYTE(v54) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v53[0] = v22;
    v23 = 3;
  }
  LOBYTE(v54) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v53);
  v25 = mlir::NameLoc::get(v24, v14);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v48.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v52) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v52) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v44 < 0)
    operator delete(__p[0]);
  v26 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v45 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v45);
  v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.deinterleave", (const unsigned __int8 *)0x11, Context);
  if (!v29)
  {
    v50 = 1283;
    v48.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.deinterleave";
    v49 = 17;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v47 = 259;
    llvm::operator+((uint64_t *)&v48, v46, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v53, v25, v28);
  mlir::mpsx::DeinterleaveOp::build((mlir::Builder *)a3, (uint64_t)v53, *v26, self->_interleaveFactor);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v53);
  v31 = v30;
  if (!v30)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_46;
  }
  v32 = *((_QWORD *)v30 + 6);
  v33 = *(void **)(v32 + 16);
  if (v33 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v32 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v40 == 17
      && *(_QWORD *)AttrData == 0x6965642E7873706DLL
      && *(_QWORD *)(AttrData + 8) == 0x7661656C7265746ELL
      && *(_BYTE *)(AttrData + 16) == 101)
    {
      v50 = 1283;
      v48.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v48.__r_.__value_.__r.__words[2] = (std::string::size_type)"mpsx.deinterleave";
      v49 = 17;
      v46[0] = (uint64_t)"' failed due to the operation not being registered";
      v47 = 259;
      llvm::operator+((uint64_t *)&v48, v46, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_45;
  }
  if (v33 != &mlir::detail::TypeIDResolver<mlir::mpsx::DeinterleaveOp,void>::id)
  {
LABEL_45:
    v35 = "result && \"builder didn't return the right type\";
    v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_46:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v53);

  return v31;
}

@end
