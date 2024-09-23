@implementation MPSGraphImToColOp

- (MPSGraphImToColOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphImToColOpDescriptor *v17;
  MPSGraphImToColOpDescriptor *imToColDesc;
  MPSGraphImToColOp *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (MPSGraphImToColOpDescriptor *)objc_msgSend(v15, "copy");
  imToColDesc = self->_imToColDesc;
  self->_imToColDesc = v17;

  v19 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v12, v13, v14, v16);
  return v19;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  uint64_t StringAttr;
  uint64_t v12;
  const char *v13;
  size_t v14;
  size_t v15;
  int8x16_t *p_dst;
  __int8 *v17;
  uint64_t v18;
  uint64_t v19;
  std::string *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  __int128 *v26;
  NSUInteger v27;
  NSUInteger v28;
  __int128 *v29;
  NSUInteger v30;
  NSUInteger v31;
  __int128 *v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t *v37;
  uint64_t *v38;
  unsigned int v39;
  uint64_t *Context;
  uint64_t v41;
  char v42;
  uint64_t v43;
  mlir::GenericProgramPoint *v44;
  mlir::GenericProgramPoint *v45;
  uint64_t v46;
  void *v47;
  void *DefiningOp;
  const char *v50;
  int v51;
  const char *v52;
  const char *v53;
  _QWORD *AttrData;
  uint64_t v55;
  __int128 *v58;
  id v59;
  char *v60;
  void *__p[2];
  char v62;
  uint64_t v63;
  uint64_t v64[4];
  __int16 v65;
  std::string v66;
  uint64_t v67;
  __int16 v68;
  int8x16_t __dst;
  unint64_t v70;
  _QWORD v71[4];
  __int16 v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphImToColOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphImToColOps.mm", __p);
  v59 = v10;
  v72 = 260;
  v71[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v71);
  v12 = mlir::FileLineColLoc::get(StringAttr, 0x85u, 0);
  if (!v12)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v59)
  {
    HIBYTE(v70) = 13;
    qmemcpy(&__dst, "mps.im_to_col", 13);
    v17 = &__dst.i8[13];
    goto LABEL_13;
  }
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
  v14 = strlen(v13);
  if (v14 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v15 = v14;
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    p_dst = (int8x16_t *)operator new(v18 + 1);
    __dst.i64[1] = v15;
    v70 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v70) = v14;
    p_dst = &__dst;
    if (!v14)
      goto LABEL_12;
  }
  memmove(p_dst, v13, v15);
LABEL_12:
  v17 = &p_dst->i8[v15];
LABEL_13:
  *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v66);
  v20 = (std::string *)v66.__r_.__value_.__r.__words[0];
  if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v66;
  v21 = 1;
  HIBYTE(v72) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v71[0] = v20;
    v21 = 3;
  }
  LOBYTE(v72) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v71);
  v23 = mlir::NameLoc::get(v22, v12);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v66.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v70) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v70) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v62 < 0)
    operator delete(__p[0]);
  v24 = -[MPSGraphImToColOpDescriptor kernelHeight](self->_imToColDesc, "kernelHeight");
  v25 = -[MPSGraphImToColOpDescriptor kernelWidth](self->_imToColDesc, "kernelWidth");
  v26 = (__int128 *)operator new(0x10uLL);
  *(_QWORD *)v26 = v24;
  *((_QWORD *)v26 + 1) = v25;
  v58 = v26;
  v27 = -[MPSGraphImToColOpDescriptor strideInY](self->_imToColDesc, "strideInY");
  v28 = -[MPSGraphImToColOpDescriptor strideInX](self->_imToColDesc, "strideInX");
  v29 = (__int128 *)operator new(0x10uLL);
  *(_QWORD *)v29 = v27;
  *((_QWORD *)v29 + 1) = v28;
  v30 = -[MPSGraphImToColOpDescriptor dilationRateInY](self->_imToColDesc, "dilationRateInY");
  v31 = -[MPSGraphImToColOpDescriptor dilationRateInX](self->_imToColDesc, "dilationRateInX");
  v32 = (__int128 *)operator new(0x10uLL);
  *(_QWORD *)v32 = v30;
  *((_QWORD *)v32 + 1) = v31;
  v33 = -[MPSGraphImToColOpDescriptor paddingTop](self->_imToColDesc, "paddingTop");
  v34 = -[MPSGraphImToColOpDescriptor paddingBottom](self->_imToColDesc, "paddingBottom");
  v35 = -[MPSGraphImToColOpDescriptor paddingLeft](self->_imToColDesc, "paddingLeft");
  v36 = -[MPSGraphImToColOpDescriptor paddingRight](self->_imToColDesc, "paddingRight");
  v37 = (uint64_t *)operator new(0x20uLL);
  *v37 = v33;
  v37[1] = v34;
  v37[2] = v35;
  v37[3] = v36;
  v38 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v39 = -[MPSGraphImToColOpDescriptor dataLayout](self->_imToColDesc, "dataLayout");
  v63 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v63);
  v41 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.im_to_col", (const unsigned __int8 *)0xD, Context);
  if (!v42)
  {
    v68 = 1283;
    v66.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.im_to_col";
    v67 = 13;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v65 = 259;
    llvm::operator+((uint64_t *)&v66, v64, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v71, v23, v41);
  mlir::mps::ImToColOp::build((mlir::Builder *)a3, (uint64_t)v71, *v38, v58, 2, v29, 2, v43, v32, 2, v37, 4, v39);
  v44 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v71);
  v45 = v44;
  if (!v44)
  {
    v50 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v51 = 662;
    v52 = "Casting.h";
    v53 = "dyn_cast";
    goto LABEL_45;
  }
  v46 = *((_QWORD *)v44 + 6);
  v47 = *(void **)(v46 + 16);
  if (v47 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v46 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v55 == 13 && *AttrData == 0x745F6D692E73706DLL && *(_QWORD *)((char *)AttrData + 5) == 0x6C6F635F6F745F6DLL)
    {
      v68 = 1283;
      v66.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v66.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.im_to_col";
      v67 = 13;
      v64[0] = (uint64_t)"' failed due to the operation not being registered";
      v65 = 259;
      llvm::operator+((uint64_t *)&v66, v64, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_44;
  }
  if (v47 != &mlir::detail::TypeIDResolver<mlir::mps::ImToColOp,void>::id)
  {
LABEL_44:
    v50 = "result && \"builder didn't return the right type\";
    v51 = 497;
    v52 = "Builders.h";
    v53 = "create";
LABEL_45:
    __assert_rtn(v53, v52, v51, v50);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v71);
  if (!*((_DWORD *)v45 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v60 = (char *)v45 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v60);
  operator delete(v37);
  operator delete(v32);
  operator delete(v29);
  operator delete(v58);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imToColDesc, 0);
}

@end
