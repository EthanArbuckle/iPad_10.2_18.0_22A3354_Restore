@implementation MPSGraphBroadcastGradientArgsOp

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
  void *DefiningOp;
  const char *v36;
  int v37;
  const char *v38;
  const char *v39;
  _QWORD *AttrData;
  uint64_t v41;
  BOOL v42;
  BOOL v43;
  char *v45;
  void *__p[2];
  char v47;
  uint64_t v48;
  uint64_t v49[4];
  __int16 v50;
  std::string v51;
  uint64_t v52;
  __int16 v53;
  void **__dst;
  __int128 v55;
  _QWORD v56[4];
  __int16 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphBroadcastGradientArgsOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  v11 = v10;
  v57 = 260;
  v56[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v56);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x58Eu, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    v55 = xmmword_181286A20;
    qmemcpy(v18, "mps.broadcast_gradient_args", 27);
    v19 = v18 + 27;
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
    *(_QWORD *)&v55 = v16;
    *((_QWORD *)&v55 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v55) = v15;
    p_dst = (void **)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v51);
  v22 = (std::string *)v51.__r_.__value_.__r.__words[0];
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v51;
  v23 = 1;
  HIBYTE(v57) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v56[0] = v22;
    v23 = 3;
  }
  LOBYTE(v57) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v56);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v51.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v55) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v55) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete(__dst);
LABEL_20:

  if (v47 < 0)
    operator delete(__p[0]);
  v26 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 8uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v48 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v48);
  v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.broadcast_gradient_args", (const unsigned __int8 *)0x1B, Context);
  if (!v29)
  {
    v53 = 1283;
    v51.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.broadcast_gradient_args";
    v52 = 27;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v50 = 259;
    llvm::operator+((uint64_t *)&v51, v49, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v56, v25, v28);
  mlir::mps::BroadcastGradientArgsOp::build((uint64_t *)a3, (uint64_t)v56, *v26, v26[1]);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v56);
  v31 = v30;
  if (!v30)
  {
    v36 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v37 = 662;
    v38 = "Casting.h";
    v39 = "dyn_cast";
    goto LABEL_51;
  }
  v32 = *((_QWORD *)v30 + 6);
  v33 = *(void **)(v32 + 16);
  if (v33 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __dst = *(void ***)(v32 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v41 == 27)
    {
      v42 = *AttrData == 0x616F72622E73706DLL && AttrData[1] == 0x72675F7473616364;
      v43 = v42 && AttrData[2] == 0x615F746E65696461;
      if (v43 && *(_QWORD *)((char *)AttrData + 19) == 0x736772615F746E65)
      {
        v53 = 1283;
        v51.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v51.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.broadcast_gradient_args";
        v52 = 27;
        v49[0] = (uint64_t)"' failed due to the operation not being registered";
        v50 = 259;
        llvm::operator+((uint64_t *)&v51, v49, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v33 != &mlir::detail::TypeIDResolver<mlir::mps::BroadcastGradientArgsOp,void>::id)
  {
LABEL_50:
    v36 = "result && \"builder didn't return the right type\";
    v37 = 497;
    v38 = "Builders.h";
    v39 = "create";
LABEL_51:
    __assert_rtn(v39, v38, v37, v36);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v56);
  if (!*((_DWORD *)v31 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v45 = (char *)v31 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v45);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return 0;
}

@end
