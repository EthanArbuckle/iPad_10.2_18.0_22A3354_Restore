@implementation MPSGraphTileGradientOp

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
  uint64_t *v25;
  uint64_t *Context;
  uint64_t v27;
  char v28;
  mlir::GenericProgramPoint *v29;
  mlir::GenericProgramPoint *v30;
  uint64_t v31;
  void *v32;
  void *DefiningOp;
  const char *v35;
  int v36;
  const char *v37;
  const char *v38;
  uint64_t AttrData;
  uint64_t v40;
  BOOL v41;
  char *v43;
  void *__p[2];
  char v45;
  uint64_t v46;
  uint64_t v47[4];
  __int16 v48;
  std::string v49;
  uint64_t v50;
  __int16 v51;
  int8x16_t __dst;
  unint64_t v53;
  _QWORD v54[4];
  __int16 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphTileGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  v11 = v10;
  v55 = 260;
  v54[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x4CAu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v53) = 17;
    LOBYTE(v53) = 116;
    __dst = *(int8x16_t *)"mps.tile_gradient";
    v18 = (char *)&v53 + 1;
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
    v53 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v53) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v18 = &p_dst->i8[v16];
LABEL_13:
  *v18 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v49);
  v21 = (std::string *)v49.__r_.__value_.__r.__words[0];
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = &v49;
  v22 = 1;
  HIBYTE(v55) = 1;
  if (v21->__r_.__value_.__s.__data_[0])
  {
    v54[0] = v21;
    v22 = 3;
  }
  LOBYTE(v55) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v54);
  v24 = mlir::NameLoc::get(v23, v13);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v49.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v53) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v53) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v45 < 0)
    operator delete(__p[0]);
  v25 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v46 = v24;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v46);
  v27 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.tile_gradient", (const unsigned __int8 *)0x11, Context);
  if (!v28)
  {
    v51 = 1283;
    v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.tile_gradient";
    v50 = 17;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v48 = 259;
    llvm::operator+((uint64_t *)&v49, v47, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v54, v24, v27);
  mlir::mps::TileGradientOp::build((uint64_t)a3, (uint64_t)v54, *v25, v25[1], v25[2]);
  v29 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v54);
  v30 = v29;
  if (!v29)
  {
    v35 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v36 = 662;
    v37 = "Casting.h";
    v38 = "dyn_cast";
    goto LABEL_48;
  }
  v31 = *((_QWORD *)v29 + 6);
  v32 = *(void **)(v31 + 16);
  if (v32 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst.i64[0] = *(_QWORD *)(v31 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v40 == 17)
    {
      v41 = *(_QWORD *)AttrData == 0x656C69742E73706DLL && *(_QWORD *)(AttrData + 8) == 0x6E6569646172675FLL;
      if (v41 && *(_BYTE *)(AttrData + 16) == 116)
      {
        v51 = 1283;
        v49.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v49.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.tile_gradient";
        v50 = 17;
        v47[0] = (uint64_t)"' failed due to the operation not being registered";
        v48 = 259;
        llvm::operator+((uint64_t *)&v49, v47, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_47;
  }
  if (v32 != &mlir::detail::TypeIDResolver<mlir::mps::TileGradientOp,void>::id)
  {
LABEL_47:
    v35 = "result && \"builder didn't return the right type\";
    v36 = 497;
    v37 = "Builders.h";
    v38 = "create";
LABEL_48:
    __assert_rtn(v38, v37, v36, v35);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v54);
  if (!*((_DWORD *)v30 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v43 = (char *)v30 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v43);

  return DefiningOp;
}

@end
