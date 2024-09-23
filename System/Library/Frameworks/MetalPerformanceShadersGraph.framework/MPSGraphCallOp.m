@implementation MPSGraphCallOp

- (MPSGraphCallOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 outputTypes:(id)a6 symbolName:(id)a7 inliningOption:(unint64_t)a8 name:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  MPSGraphCallOp *v22;
  id v24;
  _QWORD v25[4];
  id v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v24 = a7;
  v19 = a9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __108__MPSGraphCallOp_initWithGraph_inputTensors_controlDependencies_outputTypes_symbolName_inliningOption_name___block_invoke;
  v25[3] = &unk_1E0E76D08;
  v21 = v20;
  v26 = v21;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v25);
  objc_storeStrong((id *)&self->_outputTypes, v20);
  objc_storeStrong((id *)&self->_symbolName, a7);
  self->_inliningOption = a8;
  v22 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v15, v16, v17, v19);

  return v22;
}

void __108__MPSGraphCallOp_initWithGraph_inputTensors_controlDependencies_outputTypes_symbolName_inliningOption_name___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[MPSGraphCallOp initWithGraph:inputTensors:controlDependencies:outputTypes:symbolName:inliningOption:name:]_block_invoke", "MPSGraphCallOp.mm", 47, "[obj isKindOfClass:MPSGraphShapedType.class]");
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

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
  uint64_t v18;
  uint64_t v19;
  std::string *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _BYTE *v26;
  _BYTE *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  __int128 *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  NSArray *outputTypes;
  uint64_t v42;
  char *v43;
  unint64_t inliningOption;
  uint64_t *Context;
  uint64_t v46;
  char v47;
  mlir::MLIRContext *v48;
  mlir::GenericProgramPoint *v49;
  void *v50;
  const char *v52;
  int v53;
  const char *v54;
  const char *v55;
  _QWORD v57[6];
  int8x16_t __dst;
  unint64_t v59;
  __n128 (*v60)(__n128 *, __n128 *);
  void (*v61)(uint64_t);
  const char *v62;
  void *v63;
  _BYTE *v64;
  char *v65;
  void *__p[2];
  char v67;
  uint64_t v68;
  const char *v69;
  __int16 v70;
  _QWORD v71[4];
  __int16 v72;
  uint64_t v73[4];
  __int16 v74;
  std::string v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphCallOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphCallOp.mm", __p);
  v11 = v10;
  v72 = 260;
  v71[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v71);
  v13 = mlir::FileLineColLoc::get(StringAttr, 0x47u, 0);
  if (!v13)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v11)
  {
    HIBYTE(v59) = 8;
    strcpy(__dst.i8, "mps.call");
    goto LABEL_13;
  }
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v15 = strlen(v14);
  if (v15 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v18 = v15 | 7;
    v19 = v18 + 1;
    p_dst = (int8x16_t *)operator new(v18 + 1);
    __dst.i64[1] = v16;
    v59 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v59) = v15;
    p_dst = &__dst;
    if (!v15)
      goto LABEL_12;
  }
  memmove(p_dst, v14, v16);
LABEL_12:
  p_dst->i8[v16] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v75);
  v20 = (std::string *)v75.__r_.__value_.__r.__words[0];
  if ((v75.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v75;
  v21 = 1;
  HIBYTE(v72) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v71[0] = v20;
    v21 = 3;
  }
  LOBYTE(v72) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v71);
  v23 = mlir::NameLoc::get(v22, v13);
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v75.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v59) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v59) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v67 < 0)
    operator delete(__p[0]);
  __dst.i64[0] = 0;
  __dst.i64[1] = (uint64_t)&__dst;
  v59 = 0x4812000000;
  v60 = __Block_byref_object_copy__2;
  v61 = __Block_byref_object_dispose__2;
  v62 = "";
  v63 = 0;
  v64 = 0;
  v65 = 0;
  v24 = -[NSArray count](self->_outputTypes, "count");
  v25 = v24;
  v26 = v63;
  if (v24 > (v65 - (_BYTE *)v63) >> 3)
  {
    if (v24 >> 61)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v27 = v64;
    v28 = (char *)operator new(8 * v24);
    v29 = v27 - v26;
    v30 = &v28[(v27 - v26) & 0xFFFFFFFFFFFFFFF8];
    v31 = v30;
    if (v27 == v26)
      goto LABEL_34;
    if ((unint64_t)(v29 - 8) >= 0x58)
    {
      v31 = &v28[(v27 - v26) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(v27 - &v28[v29 & 0xFFFFFFFFFFFFFFF8]) >= 0x20)
      {
        v32 = v29 >> 3;
        v33 = ((unint64_t)(v29 - 8) >> 3) + 1;
        v34 = 8 * (v33 & 0x3FFFFFFFFFFFFFFCLL);
        v35 = &v27[-v34];
        v31 = &v30[-v34];
        v36 = &v28[8 * v32 - 16];
        v37 = (__int128 *)(v27 - 16);
        v38 = v33 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v39 = *v37;
          *((_OWORD *)v36 - 1) = *(v37 - 1);
          *(_OWORD *)v36 = v39;
          v36 -= 32;
          v37 -= 2;
          v38 -= 4;
        }
        while (v38);
        v27 = v35;
        if (v33 == (v33 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_34:
          v63 = v31;
          v64 = v30;
          v65 = &v28[8 * v25];
          if (v26)
            operator delete(v26);
          goto LABEL_36;
        }
      }
    }
    else
    {
      v31 = &v28[(v27 - v26) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v40 = *((_QWORD *)v27 - 1);
      v27 -= 8;
      *((_QWORD *)v31 - 1) = v40;
      v31 -= 8;
    }
    while (v27 != v26);
    goto LABEL_34;
  }
LABEL_36:
  outputTypes = self->_outputTypes;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __86__MPSGraphCallOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke;
  v57[3] = &unk_1E0E76D30;
  v57[4] = &__dst;
  v57[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](outputTypes, "enumerateObjectsUsingBlock:", v57);
  v42 = __dst.i64[1];
  v43 = -[NSString UTF8String](self->_symbolName, "UTF8String");
  inliningOption = self->_inliningOption;
  if (inliningOption >= 3)
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
    LODWORD(inliningOption) = 0;
  }
  v68 = v23;
  Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v68);
  v46 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mps.call", (const unsigned __int8 *)8, Context);
  if (!v47)
  {
    v74 = 1283;
    v73[2] = (uint64_t)"mps.call";
    v73[3] = 8;
          " the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-with-di"
          "alects-management";
    v70 = 259;
    llvm::operator+(v73, (uint64_t *)&v69, (uint64_t)&v75);
    llvm::report_fatal_error((llvm::Twine *)&v75, 1);
  }
  mlir::OperationState::OperationState(v71, v23, v46);
  mlir::ValueRange::ValueRange((unint64_t *)&v75, *(_QWORD *)(v42 + 48), (uint64_t)(*(_QWORD *)(v42 + 56) - *(_QWORD *)(v42 + 48)) >> 3);
  mlir::ValueRange::ValueRange((unint64_t *)v73, *(_QWORD *)a5, (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3);
  if (v43)
    v48 = (mlir::MLIRContext *)strlen(v43);
  else
    v48 = 0;
  mlir::mps::CallOp::build((mlir::StringAttr **)a3, (uint64_t)v71, (uint64_t)v75.__r_.__value_.__l.__data_, v75.__r_.__value_.__l.__size_, v73[0], v73[1], v43, v48, inliningOption);
  v49 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)v71);
  if (!v49)
  {
    v52 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v53 = 662;
    v54 = "Casting.h";
    v55 = "dyn_cast";
    goto LABEL_54;
  }
  v50 = (void *)llvm::DefaultDoCastIfPossible<mlir::mps::CallOp,mlir::Operation *,llvm::CastInfo<mlir::mps::CallOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v49);
  if (!v50)
  {
    v52 = "result && \"builder didn't return the right type\";
    v53 = 497;
    v54 = "Builders.h";
    v55 = "create";
LABEL_54:
    __assert_rtn(v55, v54, v53, v52);
  }
  mlir::OperationState::~OperationState((mlir::OperationState *)v71);
  _Block_object_dispose(&__dst, 8);
  if (v63)
  {
    v64 = v63;
    operator delete(v63);
  }

  return v50;
}

void __86__MPSGraphCallOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  mlir::MLIRContext *v5;
  void *v6;
  mlir::MLIRContext *v7;
  id v8;
  uint64_t MLIRElementType;
  uint64_t **MLIRType;
  unint64_t v11;
  uint64_t ***v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t ***v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ***v26;
  char *v27;
  uint64_t ***v28;
  uint64_t v29;
  __int128 v30;
  uint64_t **v31;
  id v32;

  v3 = a2;
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = **(mlir::MLIRContext ***)(a1 + 40);
  v32 = v3;
  objc_msgSend(v3, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (mlir::MLIRContext *)objc_msgSend(v32, "dataType");
  v8 = v6;
  MLIRElementType = getMLIRElementType(v5, v7);
  MLIRType = getMLIRType(v8, MLIRElementType);

  v12 = (uint64_t ***)v4[7];
  v11 = v4[8];
  if ((unint64_t)v12 < v11)
  {
    *v12 = MLIRType;
    v13 = (uint64_t)(v12 + 1);
    goto LABEL_14;
  }
  v14 = (char *)v4[6];
  v15 = ((char *)v12 - v14) >> 3;
  v16 = v15 + 1;
  if ((unint64_t)(v15 + 1) >> 61)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  v17 = v11 - (_QWORD)v14;
  if (v17 >> 2 > v16)
    v16 = v17 >> 2;
  if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
    v18 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
  {
    if (v18 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v19 = (char *)operator new(8 * v18);
    v20 = (uint64_t ***)&v19[8 * v15];
    v21 = &v19[8 * v18];
    *v20 = MLIRType;
    v13 = (uint64_t)(v20 + 1);
    v22 = (char *)((char *)v12 - v14);
    if (v12 == (uint64_t ***)v14)
    {
LABEL_12:
      v4[6] = v20;
      v4[7] = v13;
      v4[8] = v21;
      if (!v12)
        goto LABEL_14;
LABEL_13:
      operator delete(v12);
      goto LABEL_14;
    }
  }
  else
  {
    v19 = 0;
    v20 = (uint64_t ***)(8 * v15);
    v21 = 0;
    *(_QWORD *)(8 * v15) = MLIRType;
    v13 = 8 * v15 + 8;
    v22 = (char *)((char *)v12 - v14);
    if (v12 == (uint64_t ***)v14)
      goto LABEL_12;
  }
  v23 = (unint64_t)(v22 - 8);
  if (v23 < 0x58)
    goto LABEL_28;
  if ((unint64_t)(v14 - v19) < 0x20)
    goto LABEL_28;
  v24 = (v23 >> 3) + 1;
  v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
  v26 = &v12[v25 / 0xFFFFFFFFFFFFFFF8];
  v20 = (uint64_t ***)((char *)v20 - v25);
  v27 = &v19[8 * v15 - 16];
  v28 = v12 - 2;
  v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v30 = *(_OWORD *)v28;
    *((_OWORD *)v27 - 1) = *((_OWORD *)v28 - 1);
    *(_OWORD *)v27 = v30;
    v27 -= 32;
    v28 -= 4;
    v29 -= 4;
  }
  while (v29);
  v12 = v26;
  if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_28:
    do
    {
      v31 = *--v12;
      *--v20 = v31;
    }
    while (v12 != (uint64_t ***)v14);
  }
  v12 = (uint64_t ***)v4[6];
  v4[6] = v20;
  v4[7] = v13;
  v4[8] = v21;
  if (v12)
    goto LABEL_13;
LABEL_14:
  v4[7] = v13;

}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_outputTypes, 0);
}

@end
