@implementation MPSGraphColToImOp

- (MPSGraphColToImOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 outputShape:(id)a7 name:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MPSGraphImToColOpDescriptor *v20;
  MPSGraphImToColOpDescriptor *colToImDesc;
  NSArray *v22;
  NSArray *shape;
  MPSGraphColToImOp *v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (MPSGraphImToColOpDescriptor *)objc_msgSend(v17, "copy");
  colToImDesc = self->_colToImDesc;
  self->_colToImDesc = v20;

  v22 = (NSArray *)objc_msgSend(v18, "copy");
  shape = self->_shape;
  self->_shape = v22;

  v24 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v14, v15, v16, v19);
  return v24;
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
  mlir::GenericProgramPoint *v43;
  mlir::GenericProgramPoint *v44;
  uint64_t v45;
  void *v46;
  void *DefiningOp;
  const char *v49;
  int v50;
  const char *v51;
  const char *v52;
  _QWORD *AttrData;
  uint64_t v54;
  __int128 *v57;
  id v58;
  char *v59;
  void *__p[2];
  char v61;
  uint64_t v62;
  uint64_t v63[4];
  __int16 v64;
  std::string v65;
  uint64_t v66;
  __int16 v67;
  int8x16_t __dst;
  unint64_t v69;
  _QWORD v70[4];
  __int16 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphColToImOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphImToColOps.mm", __p);
  v58 = v10;
  v71 = 260;
  v70[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v70);
  v12 = mlir::FileLineColLoc::get(StringAttr, 0xBEu, 0);
  if (!v12)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v58)
  {
    HIBYTE(v69) = 13;
    qmemcpy(&__dst, "mps.col_to_im", 13);
    v17 = &__dst.i8[13];
    goto LABEL_13;
  }
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
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
    v69 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v69) = v14;
    p_dst = &__dst;
    if (!v14)
      goto LABEL_12;
  }
  memmove(p_dst, v13, v15);
LABEL_12:
  v17 = &p_dst->i8[v15];
LABEL_13:
  *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v65);
  v20 = (std::string *)v65.__r_.__value_.__r.__words[0];
  if ((v65.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v65;
  v21 = 1;
  HIBYTE(v71) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v70[0] = v20;
    v21 = 3;
  }
  LOBYTE(v71) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v70);
  v23 = mlir::NameLoc::get(v22, v12);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v65.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v69) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v69) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v61 < 0)
    operator delete(__p[0]);
  v24 = -[MPSGraphImToColOpDescriptor kernelHeight](self->_colToImDesc, "kernelHeight");
  v25 = -[MPSGraphImToColOpDescriptor kernelWidth](self->_colToImDesc, "kernelWidth");
  v26 = (__int128 *)operator new(0x10uLL);
  *(_QWORD *)v26 = v24;
  *((_QWORD *)v26 + 1) = v25;
  v57 = v26;
  v27 = -[MPSGraphImToColOpDescriptor strideInY](self->_colToImDesc, "strideInY");
  v28 = -[MPSGraphImToColOpDescriptor strideInX](self->_colToImDesc, "strideInX");
  v29 = (__int128 *)operator new(0x10uLL);
  *(_QWORD *)v29 = v27;
  *((_QWORD *)v29 + 1) = v28;
  v30 = -[MPSGraphImToColOpDescriptor dilationRateInY](self->_colToImDesc, "dilationRateInY");
  v31 = -[MPSGraphImToColOpDescriptor dilationRateInX](self->_colToImDesc, "dilationRateInX");
  v32 = (__int128 *)operator new(0x10uLL);
  *(_QWORD *)v32 = v30;
  *((_QWORD *)v32 + 1) = v31;
  v33 = -[MPSGraphImToColOpDescriptor paddingTop](self->_colToImDesc, "paddingTop");
  v34 = -[MPSGraphImToColOpDescriptor paddingBottom](self->_colToImDesc, "paddingBottom");
  v35 = -[MPSGraphImToColOpDescriptor paddingLeft](self->_colToImDesc, "paddingLeft");
  v36 = -[MPSGraphImToColOpDescriptor paddingRight](self->_colToImDesc, "paddingRight");
  v37 = (uint64_t *)operator new(0x20uLL);
  *v37 = v33;
  v37[1] = v34;
  v37[2] = v35;
  v37[3] = v36;
  v38 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v39 = -[MPSGraphImToColOpDescriptor dataLayout](self->_colToImDesc, "dataLayout");
  v62 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v62);
  v41 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.col_to_im", (const unsigned __int8 *)0xD, Context);
  if (!v42)
  {
    v67 = 1283;
    v65.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.col_to_im";
    v66 = 13;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v64 = 259;
    llvm::operator+((uint64_t *)&v65, v63, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v70, v23, v41);
  mlir::mps::ColToImOp::build((mlir::Builder *)a3, (uint64_t)v70, *v38, v38[1], v57, 2, v29, 2, v32, 2, v37, 4, v39);
  v43 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v70);
  v44 = v43;
  if (!v43)
  {
    v49 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v50 = 662;
    v51 = "Casting.h";
    v52 = "dyn_cast";
    goto LABEL_45;
  }
  v45 = *((_QWORD *)v43 + 6);
  v46 = *(void **)(v45 + 16);
  if (v46 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v45 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v54 == 13 && *AttrData == 0x5F6C6F632E73706DLL && *(_QWORD *)((char *)AttrData + 5) == 0x6D695F6F745F6C6FLL)
    {
      v67 = 1283;
      v65.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v65.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.col_to_im";
      v66 = 13;
      v63[0] = (uint64_t)"' failed due to the operation not being registered";
      v64 = 259;
      llvm::operator+((uint64_t *)&v65, v63, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_44;
  }
  if (v46 != &mlir::detail::TypeIDResolver<mlir::mps::ColToImOp,void>::id)
  {
LABEL_44:
    v49 = "result && \"builder didn't return the right type\";
    v50 = 497;
    v51 = "Builders.h";
    v52 = "create";
LABEL_45:
    __assert_rtn(v52, v51, v50, v49);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v70);
  if (!*((_DWORD *)v44 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v59 = (char *)v44 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v59);
  operator delete(v37);
  operator delete(v32);
  operator delete(v29);
  operator delete(v57);

  return DefiningOp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_colToImDesc, 0);
}

@end
