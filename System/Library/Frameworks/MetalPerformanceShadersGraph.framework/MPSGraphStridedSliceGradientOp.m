@implementation MPSGraphStridedSliceGradientOp

- (MPSGraphStridedSliceGradientOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 starts:(id)a6 ends:(id)a7 strides:(id)a8 startMask:(unsigned int)a9 endMask:(unsigned int)a10 shrinkAxisMask:(unsigned int)a11 name:(id)a12
{
  NSArray *v18;
  NSArray *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSArray *ends;
  NSArray *v25;
  NSArray *strides;
  MPSGraphStridedSliceGradientOp *v27;
  id v30;

  v30 = a6;
  v18 = (NSArray *)a7;
  v19 = (NSArray *)a8;
  objc_storeStrong((id *)&self->_starts, a6);
  v20 = a12;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  ends = self->_ends;
  self->_ends = v18;
  v25 = v18;

  strides = self->_strides;
  self->_strides = v19;

  self->_begin_mask = a9;
  self->_end_mask = a10;
  self->_shrink_axis_mask = a11;
  v27 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v23, v22, v21, v20);

  return v27;
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
  uint64_t AttrData;
  uint64_t v41;
  BOOL v42;
  BOOL v43;
  char *v46;
  void *__p[2];
  char v48;
  uint64_t v49;
  uint64_t v50[4];
  __int16 v51;
  std::string v52;
  uint64_t v53;
  __int16 v54;
  void **__dst;
  __int128 v56;
  _QWORD v57[4];
  __int16 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphStridedSliceGradientOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  v11 = v10;
  v58 = 260;
  v57[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x257u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    v18 = (char *)operator new(0x20uLL);
    __dst = (void **)v18;
    v56 = xmmword_181268730;
    qmemcpy(v18, "mps.strided_slice_gradient", 26);
    v19 = v18 + 26;
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
    *(_QWORD *)&v56 = v16;
    *((_QWORD *)&v56 + 1) = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v56) = v15;
    p_dst = (void **)&__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  v19 = (char *)p_dst + v16;
LABEL_13:
  *v19 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, (int8x16_t *)&__dst, &v52);
  v22 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v52;
  v23 = 1;
  HIBYTE(v58) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v57[0] = v22;
    v23 = 3;
  }
  LOBYTE(v58) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v57);
  v25 = mlir::NameLoc::get(v24, v13);
  if (!v25)
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
  operator delete(__dst);
LABEL_20:

  if (v48 < 0)
    operator delete(__p[0]);
  v26 = *(uint64_t **)a5;
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x20uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v49 = v25;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v49);
  v28 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.strided_slice_gradient", (const unsigned __int8 *)0x1A, Context);
  if (!v29)
  {
    v54 = 1283;
    v52.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.strided_slice_gradient";
    v53 = 26;
                      "een added by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-de"
                      "pendent-whats-up-with-dialects-management";
    v51 = 259;
    llvm::operator+((uint64_t *)&v52, v50, (uint64_t)&__dst);
    llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
  }
  mlir::OperationState::OperationState(v57, v25, v28);
  mlir::mps::StridedSliceGradientOp::build((mlir::Builder *)a3, (uint64_t)v57, *v26, v26[1], v26[2], v26[3], v26[4], self->_begin_mask, self->_end_mask, self->_shrink_axis_mask, 0);
  v30 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v57);
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
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__dst);
    if (v41 == 26)
    {
      v42 = *(_QWORD *)AttrData == 0x697274732E73706DLL && *(_QWORD *)(AttrData + 8) == 0x63696C735F646564;
      v43 = v42 && *(_QWORD *)(AttrData + 16) == 0x6569646172675F65;
      if (v43 && *(_WORD *)(AttrData + 24) == 29806)
      {
        v54 = 1283;
        v52.__r_.__value_.__r.__words[0] = (std::string::size_type)"classof on '";
        v52.__r_.__value_.__r.__words[2] = (std::string::size_type)"mps.strided_slice_gradient";
        v53 = 26;
        v50[0] = (uint64_t)"' failed due to the operation not being registered";
        v51 = 259;
        llvm::operator+((uint64_t *)&v52, v50, (uint64_t)&__dst);
        llvm::report_fatal_error((llvm::Twine *)&__dst, 1);
      }
    }
    goto LABEL_50;
  }
  if (v33 != &mlir::detail::TypeIDResolver<mlir::mps::StridedSliceGradientOp,void>::id)
  {
LABEL_50:
    v36 = "result && \"builder didn't return the right type\";
    v37 = 497;
    v38 = "Builders.h";
    v39 = "create";
LABEL_51:
    __assert_rtn(v39, v38, v37, v36);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v57);
  if (!*((_DWORD *)v31 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v46 = (char *)v31 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v46);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v13;

  v8 = a4;
  v9 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  LODWORD(v13) = self->_shrink_axis_mask;
  objc_msgSend(WeakRetained, "sliceTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:", v8, self->_starts, self->_ends, self->_strides, self->_begin_mask, self->_end_mask, v13, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_ends, 0);
  objc_storeStrong((id *)&self->_starts, 0);
}

@end
