@implementation MPSGraphCostVolumeOp

- (MPSGraphCostVolumeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 layout:(unint64_t)a6 normalizeCoordinates:(BOOL)a7 relativeCoordinates:(BOOL)a8 alignCorners:(BOOL)a9 coordinateIs1DInWidth:(BOOL)a10 paddingMode:(int64_t)a11 samplingMode:(unint64_t)a12 nearestRoundingMode:(unint64_t)a13 similarityType:(unint64_t)a14 windowWidth:(unint64_t)a15 windowHeight:(unint64_t)a16 name:(id)a17
{
  self->_relativeCoordinates = a7;
  self->_alignCorners = a8;
  self->_coordinateIs1DInWidth = a9;
  *(&self->_coordinateIs1DInWidth + 1) = a10;
  self->_paddingMode = a11;
  self->_samplingMode = a12;
  self->_nearestRoundingMode = a13;
  self->_layout = a6;
  self->_similarity = a14;
  self->_windowWidth = a15;
  self->_windowHeight = a16;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a17);
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
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
  uint64_t *v25;
  unsigned int layout;
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
  id v44;
  unsigned int similarity;
  char *v46;
  void *__p[2];
  char v48;
  uint64_t v49;
  uint64_t v50[4];
  __int16 v51;
  std::string v52;
  uint64_t v53;
  __int16 v54;
  int8x16_t __dst;
  unint64_t v56;
  _QWORD v57[4];
  __int16 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v44 = a7;
  mpsFileLoc("-[MPSGraphCostVolumeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphCostVolumeOps.mm", __p);
  v11 = v44;
  v58 = 260;
  v57[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x51u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v56) = 15;
    qmemcpy(&__dst, "mps.cost_volume", 15);
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
    v56 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v56) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v52);
  v21 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v52;
  v22 = 1;
  HIBYTE(v58) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v57[0] = v21;
    v22 = 3;
  }
  LOBYTE(v58) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v52.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v56) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v56) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v48 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  similarity = self->_similarity;
  layout = self->_layout;
  v27 = mlir::BoolAttr::get(*(mlir::BoolAttr **)a3, (mlir::MLIRContext *)*((unsigned __int8 *)&self->_coordinateIs1DInWidth + 1));
  v49 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v49);
  v29 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.cost_volume", (const unsigned __int8 *)0xF, Context);
  if (!v30)
  {
    v54 = 1283;
    v52.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.cost_volume";
    v53 = 15;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v51 = 259;
    llvm::operator+((uint64_t *)&v52, v50, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v57, v24, v29);
  mlir::mps::CostVolumeOp::build((mlir::UnitAttr **)a3, (uint64_t)v57, *v25, v25[1], v25[2], self->_relativeCoordinates, self->_alignCorners, self->_windowWidth, self->_windowHeight, similarity, layout, v27);
  v31 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v57);
  v32 = v31;
  if (!v31)
  {
    v37 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v38 = 662;
    v39 = "Casting.h";
    v40 = "dyn_cast";
    goto LABEL_45;
  }
  v33 = *((_QWORD *)v31 + 6);
  v34 = *(void **)(v33 + 16);
  if (v34 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v33 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v42 == 15 && *AttrData == 0x74736F632E73706DLL && *(_QWORD *)((char *)AttrData + 7) == 0x656D756C6F765F74)
    {
      v54 = 1283;
      v52.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
      v52.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.cost_volume";
      v53 = 15;
      v50[0] = (uint64_t)"' failed due to the operation not being registered";
      v51 = 259;
      llvm::operator+((uint64_t *)&v52, v50, (uint64_t)&__dst);
      llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
    }
    goto LABEL_44;
  }
  if (v34 != &mlir::detail::TypeIDResolver<mlir::mps::CostVolumeOp,void>::id)
  {
LABEL_44:
    v37 = "result && \"builder didn't return the right type\";
    v38 = 497;
    v39 = "Builders.h";
    v40 = "create";
LABEL_45:
    __assert_rtn(v40, v39, v38, v37);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v57);
  if (!*((_DWORD *)v32 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v46 = (char *)v32 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v46);

  return DefiningOp;
}

@end
