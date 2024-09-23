@implementation MPSGraphStitchedOp

- (MPSGraphStitchedOp)initWithGraph:(id)a3 withBlock:(id)a4 inputTensors:(id)a5 controlDependencies:(id)a6 name:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id stitchingBlock;
  MPSGraphStitchedOp *v18;
  objc_super v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)MEMORY[0x186DA1DA0](a4);
  stitchingBlock = self->_stitchingBlock;
  self->_stitchingBlock = v16;

  v20.receiver = self;
  v20.super_class = (Class)MPSGraphStitchedOp;
  v18 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](&v20, sel_initWithGraph_inputTensors_controlDependencies_name_, v15, v14, v13, v12);

  return v18;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  _BOOL4 v7;
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
  mlir::MLIRContext *v23;
  uint64_t F32Type;
  mlir::GenericProgramPoint *v25;
  uint64_t v26;
  void *v27;
  unint64_t DefiningOp;
  NSString *name;
  uint64_t v30;
  unint64_t Body;
  _OWORD *Block;
  id *WeakRetained;
  MPSGraphTensor *v34;
  MPSGraphTensor *finalOutputTensorForStitchedRegion;
  id *v36;
  NSArray *v37;
  NSArray *opsAddedInStitchedRegion;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t **v49;
  uint64_t **v50;
  unint64_t v51;
  uint64_t *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t *v57;
  uint64_t **v58;
  uint64_t *v59;
  uint64_t **v60;
  unint64_t v61;
  NSArray *v62;
  NSArray *inputTensors;
  Value v64;
  uint64_t *Context;
  uint64_t v66;
  char v67;
  mlir::GenericProgramPoint *v68;
  Value v69;
  mlir::GenericProgramPoint *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v76;
  int v77;
  const char *v78;
  const char *v79;
  const char *v80;
  int v81;
  const char *v82;
  const char *v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  id v89;
  id v90;
  _QWORD v91[5];
  int8x16_t __dst;
  unint64_t v93;
  __n128 (*v94)(__n128 *, __n128 *);
  void (*v95)(uint64_t);
  const char *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  _QWORD v100[5];
  id v101;
  uint64_t v102;
  void *v103;
  char v104;
  uint64_t v105;
  char *v106;
  void *__p[2];
  char v108;
  uint64_t v109;
  const char *v110;
  __int16 v111;
  uint64_t v112[4];
  __int16 v113;
  std::string v114;
  unint64_t v115[2];
  void **p_data;
  uint64_t *v117;
  uint64_t v118;
  __int16 v119;
  uint64_t v120;

  v7 = a6;
  v120 = *MEMORY[0x1E0C80C00];
  v85 = a7;
  mpsFileLoc("-[MPSGraphStitchedOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphStitchedOps.mm", __p);
  v90 = v85;
  v119 = 260;
  p_data = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&p_data);
  v12 = mlir::FileLineColLoc::get(StringAttr, 0x33u, 0);
  if (!v12)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v90)
  {
    HIBYTE(v93) = 13;
    qmemcpy(&__dst, "mpsx.stitched", 13);
    v17 = &__dst.i8[13];
    goto LABEL_13;
  }
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v90), "UTF8String");
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
    v93 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v93) = v14;
    p_dst = &__dst;
    if (!v14)
      goto LABEL_12;
  }
  memmove(p_dst, v13, v15);
LABEL_12:
  v17 = &p_dst->i8[v15];
LABEL_13:
  *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v114);
  v20 = (std::string *)v114.__r_.__value_.__r.__words[0];
  if ((v114.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v114;
  v21 = 1;
  HIBYTE(v119) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    p_data = (void **)&v20->__r_.__value_.__l.__data_;
    v21 = 3;
  }
  LOBYTE(v119) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&p_data);
  v87 = mlir::NameLoc::get(v22, v12);
  if (!v87)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v114.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v93) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SHIBYTE(v93) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v108 < 0)
    operator delete(__p[0]);
  v106 = 0;
  F32Type = mlir::Builder::getF32Type((mlir::Float32Type **)a3, v23);
  v105 = mlir::UnrankedTensorType::get(F32Type);
  v25 = mlir::OpBuilder::create<mlir::mpsx::StitchedOp,mlir::UnrankedTensorType &>((mlir::OpBuilder *)a3, v87, &v105);
  if (!*((_DWORD *)v25 + 9))
  {
    v76 = "resultNumber < getNumResults() && \"Result number is out of range for operation\";
    v77 = 984;
    v78 = "Operation.h";
    v79 = "getOpResultImpl";
    goto LABEL_76;
  }
  v26 = *(_QWORD *)(*((_QWORD *)v25 - 1) & 0xFFFFFFFFFFFFFFF8);
  if (!v26)
  {
    v76 = "abstractType && \"Malformed type storage object.\";
    v77 = 160;
    v78 = "TypeSupport.h";
    v79 = "getAbstractType";
    goto LABEL_76;
  }
  v27 = *(void **)(v26 + 136);
  if (v27 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id
    && v27 != &mlir::detail::TypeIDResolver<mlir::UnrankedTensorType,void>::id)
  {
    v76 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v77 = 566;
    v78 = "Casting.h";
    v79 = "cast";
LABEL_76:
    __assert_rtn(v79, v78, v77, v76);
  }
  v106 = (char *)v25 - 16;
  DefiningOp = mlir::Value::getDefiningOp((mlir::Value *)&v106);
  if (self->super._name)
    name = self->super._name;
  else
    name = (NSString *)v90;
  MPSSymbolTable::insertOp((MPSSymbolTable *)a4, DefiningOp, name, (uint64_t)&v103);
  v30 = mlir::Value::getDefiningOp((mlir::Value *)&v106);
  if (!v30)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  v102 = llvm::DefaultDoCastIfPossible<mlir::mpsx::StitchedOp,mlir::Operation *,llvm::CastInfo<mlir::mpsx::StitchedOp,mlir::Operation *,void>>::doCastIfPossible(v30);
  Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v102);
  mlir::ValueRange::ValueRange(v115, 0, 0);
  Block = mlir::OpBuilder::createBlock(a3, Body, 0, v115[0], v115[1], 0, 0);
  *((_QWORD *)a3 + 2) = Block;
  *((_QWORD *)a3 + 3) = Block + 2;
  if (v7)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->super._graph);
    v86 = (void *)objc_msgSend(WeakRetained[10], "copyWithZone:", 0);

    (*((void (**)(void))self->_stitchingBlock + 2))();
    v34 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
    finalOutputTensorForStitchedRegion = self->_finalOutputTensorForStitchedRegion;
    self->_finalOutputTensorForStitchedRegion = v34;

    v36 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
    v89 = v36[10];

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v89);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "removeObjectsInArray:", v86);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v84);
    v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
    opsAddedInStitchedRegion = self->_opsAddedInStitchedRegion;
    self->_opsAddedInStitchedRegion = v37;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = MEMORY[0x1E0C809B0];
    while (v40 < -[NSArray count](self->_opsAddedInStitchedRegion, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_opsAddedInStitchedRegion, "objectAtIndexedSubscript:", v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "inputTensors");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = v41;
      v100[1] = 3221225472;
      v100[2] = __90__MPSGraphStitchedOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke;
      v100[3] = &unk_1E0E76E20;
      v100[4] = self;
      v101 = v39;
      objc_msgSend(v43, "enumerateObjectsUsingBlock:", v100);

      ++v40;
    }
    objc_msgSend(v39, "allObjects");
    v62 = (NSArray *)objc_claimAutoreleasedReturnValue();
    inputTensors = self->super._inputTensors;
    self->super._inputTensors = v62;

    __dst.i64[0] = 0;
    __dst.i64[1] = (uint64_t)&__dst;
    v93 = 0x4812000000;
    v94 = __Block_byref_object_copy__3;
    v95 = __Block_byref_object_dispose__3;
    v96 = "";
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v91[0] = v41;
    v91[1] = 3221225472;
    v91[2] = __90__MPSGraphStitchedOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke_55;
    v91[3] = &unk_1E0E76EE8;
    v91[4] = &__dst;
    objc_msgSend(v39, "enumerateObjectsUsingBlock:", v91);
    v64.impl = (ValueImpl *)-[MPSGraphTensor value](self->_finalOutputTensorForStitchedRegion, "value");
    v109 = v87;
    Context = (uint64_t *)mlir::Attribute::getContext((mlir::Attribute *)&v109);
    v66 = mlir::RegisteredOperationName::lookup((int8x16_t *)"mpsx.stitched_return", (const unsigned __int8 *)0x14, Context);
    if (!v67)
    {
      v113 = 1283;
      v112[2] = (uint64_t)"mpsx.stitched_return";
      v112[3] = 20;
             " by the dialect. See also https://mlir.llvm.org/getting_started/Faq/#registered-loaded-dependent-whats-up-w"
             "ith-dialects-management";
      v111 = 259;
      llvm::operator+(v112, (uint64_t *)&v110, (uint64_t)&v114);
      llvm::report_fatal_error((llvm::Twine *)&v114, 1);
    }
    mlir::OperationState::OperationState(&p_data, v87, v66);
    mlir::pdl_interp::EraseOp::build((uint64_t)a3, (uint64_t)&p_data, (uint64_t)v64.impl);
    v68 = mlir::OpBuilder::create((mlir::OpBuilder *)a3, (const mlir::OperationState *)&p_data);
    if (v68)
    {
      if (llvm::DefaultDoCastIfPossible<mlir::mpsx::ReturnStitchedOp,mlir::Operation *,llvm::CastInfo<mlir::mpsx::ReturnStitchedOp,mlir::Operation *,void>>::doCastIfPossible((uint64_t)v68))
      {
        mlir::OperationState::~OperationState((mlir::OperationState *)&p_data);
        v69.impl = (ValueImpl *)-[MPSGraphTensor value](self->_finalOutputTensorForStitchedRegion, "value");
        *((_QWORD *)v106 + 1) = *((_QWORD *)v69.impl + 1) & 0xFFFFFFFFFFFFFFF8 | *((_QWORD *)v106 + 1) & 7;
        _Block_object_dispose(&__dst, 8);
        if (v97)
        {
          v98 = v97;
          operator delete(v97);
        }

        goto LABEL_66;
      }
      v80 = "result && \"builder didn't return the right type\";
      v81 = 497;
      v82 = "Builders.h";
      v83 = "create";
    }
    else
    {
      v80 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
      v81 = 662;
      v82 = "Casting.h";
      v83 = "dyn_cast";
    }
    __assert_rtn(v83, v82, v81, v80);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v117 = 0;
  v118 = 0;
  p_data = (void **)&v117;
  while (v44 < -[NSArray count](self->super._inputTensors, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->super._inputTensors, "objectAtIndexedSubscript:", v44);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v45;
    if (v44 >= (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3)
      std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
    v47 = *(_QWORD *)(*(_QWORD *)a5 + 8 * v44);
    v48 = v117;
    v49 = &v117;
    v50 = &v117;
    if (v117)
    {
      while (1)
      {
        while (1)
        {
          v50 = (uint64_t **)v48;
          v51 = v48[4];
          if (v45 >= v51)
            break;
          v48 = *v50;
          v49 = v50;
          if (!*v50)
            goto LABEL_44;
        }
        if (v51 >= v45)
          break;
        v48 = v50[1];
        if (!v48)
        {
          v49 = v50 + 1;
          goto LABEL_44;
        }
      }
    }
    else
    {
LABEL_44:
      v52 = (uint64_t *)operator new(0x30uLL);
      v52[4] = (uint64_t)v46;
      v52[5] = v47;
      *v52 = 0;
      v52[1] = 0;
      v52[2] = (uint64_t)v50;
      *v49 = v52;
      if (*p_data)
      {
        p_data = (void **)*p_data;
        v52 = *v49;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v117, v52);
      v46 = 0;
      ++v118;
    }

    ++v44;
  }
  -[MPSGraphTensor operation](self->_finalOutputTensorForStitchedRegion, "operation");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphStitchedOp recurseOperation:builder:symbolTable:tensorToValueMap:operationsRecursed:](self, "recurseOperation:builder:symbolTable:tensorToValueMap:operationsRecursed:", v53, a3, a4, &p_data, v86);

  -[MPSGraphTensor operation](self->_finalOutputTensorForStitchedRegion, "operation");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "outputTensors");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v117;
  if (!v117)
    goto LABEL_58;
  v58 = &v117;
  do
  {
    v59 = v57;
    v60 = v58;
    v61 = v57[4];
    if (v61 >= (unint64_t)v56)
      v58 = (uint64_t **)v57;
    else
      ++v57;
    v57 = (uint64_t *)*v57;
  }
  while (v57);
  if (v58 == &v117)
    goto LABEL_58;
  if (v61 < (unint64_t)v56)
    v59 = (uint64_t *)v60;
  if ((unint64_t)v56 < v59[4])
LABEL_58:
    v58 = &v117;
  __dst.i64[0] = (uint64_t)v58[5];

  mlir::OpBuilder::create<mlir::mpsx::ReturnStitchedOp,mlir::Value &>((mlir::OpBuilder *)a3, v87, __dst.i64);
  std::__tree<MPSGraphTensor * {__strong}>::destroy((uint64_t)&p_data, v117);
LABEL_66:

  v70 = (mlir::GenericProgramPoint *)mlir::Value::getDefiningOp((mlir::Value *)&v106);
  v71 = *((_QWORD *)v70 + 2);
  mlir::GenericProgramPoint::~GenericProgramPoint(v70);
  v73 = *(_QWORD *)(v72 + 8);
  *((_QWORD *)a3 + 2) = v71;
  *((_QWORD *)a3 + 3) = v73;
  v74 = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v106);
  if (v104 < 0)
    operator delete(v103);

  return v74;
}

void __90__MPSGraphStitchedOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v6 = v3;
  objc_msgSend(v3, "operation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __90__MPSGraphStitchedOp_makeMLIROpWithBuilder_symbolTable_inputValues_opInitialization_name___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t *v16;
  char *v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  char *v23;
  uint64_t *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  id v28;

  v3 = a2;
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v28 = v3;
  v5 = objc_msgSend(v3, "value");
  v6 = v5;
  v8 = (uint64_t *)v4[7];
  v7 = v4[8];
  if ((unint64_t)v8 < v7)
  {
    *v8 = v5;
    v9 = (uint64_t)(v8 + 1);
    goto LABEL_14;
  }
  v10 = (char *)v4[6];
  v11 = ((char *)v8 - v10) >> 3;
  v12 = v11 + 1;
  if ((unint64_t)(v11 + 1) >> 61)
    std::vector<long>::__throw_length_error[abi:ne180100]();
  v13 = v7 - (_QWORD)v10;
  if (v13 >> 2 > v12)
    v12 = v13 >> 2;
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
    v14 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v14 = v12;
  if (v14)
  {
    if (v14 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v15 = (char *)operator new(8 * v14);
    v16 = (uint64_t *)&v15[8 * v11];
    v17 = &v15[8 * v14];
    *v16 = v6;
    v9 = (uint64_t)(v16 + 1);
    v18 = (char *)((char *)v8 - v10);
    if (v8 == (uint64_t *)v10)
    {
LABEL_12:
      v4[6] = v16;
      v4[7] = v9;
      v4[8] = v17;
      if (!v8)
        goto LABEL_14;
LABEL_13:
      operator delete(v8);
      goto LABEL_14;
    }
  }
  else
  {
    v15 = 0;
    v16 = (uint64_t *)(8 * v11);
    v17 = 0;
    *(_QWORD *)(8 * v11) = v6;
    v9 = 8 * v11 + 8;
    v18 = (char *)((char *)v8 - v10);
    if (v8 == (uint64_t *)v10)
      goto LABEL_12;
  }
  v19 = (unint64_t)(v18 - 8);
  if (v19 < 0x58)
    goto LABEL_28;
  if ((unint64_t)(v10 - v15) < 0x20)
    goto LABEL_28;
  v20 = (v19 >> 3) + 1;
  v21 = 8 * (v20 & 0x3FFFFFFFFFFFFFFCLL);
  v22 = &v8[v21 / 0xFFFFFFFFFFFFFFF8];
  v16 = (uint64_t *)((char *)v16 - v21);
  v23 = &v15[8 * v11 - 16];
  v24 = v8 - 2;
  v25 = v20 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v26 = *(_OWORD *)v24;
    *((_OWORD *)v23 - 1) = *((_OWORD *)v24 - 1);
    *(_OWORD *)v23 = v26;
    v23 -= 32;
    v24 -= 4;
    v25 -= 4;
  }
  while (v25);
  v8 = v22;
  if (v20 != (v20 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_28:
    do
    {
      v27 = *--v8;
      *--v16 = v27;
    }
    while (v8 != (uint64_t *)v10);
  }
  v8 = (uint64_t *)v4[6];
  v4[6] = v16;
  v4[7] = v9;
  v4[8] = v17;
  if (v8)
    goto LABEL_13;
LABEL_14:
  v4[7] = v9;

}

- (void)recurseOperation:(id)a3 builder:(void *)a4 symbolTable:(void *)a5 tensorToValueMap:(void *)a6 operationsRecursed:(id)a7
{
  id v11;
  id v12;
  void *v13;
  unint64_t i;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  char *v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  char *v25;
  unint64_t v26;
  BOOL v27;
  uint64_t **v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  char *v34;
  unint64_t v35;
  BOOL v36;
  uint64_t **v37;
  uint64_t v38;
  _BYTE *v39;
  _BYTE *v40;
  int64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  _BYTE *v46;
  _QWORD *v47;
  int64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _OWORD *v53;
  __int128 *v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t j;
  void *v62;
  uint64_t v63;
  void *v64;
  unint64_t v65;
  uint64_t *v66;
  uint64_t **v67;
  uint64_t **v68;
  unint64_t v69;
  uint64_t *v70;
  uint64_t *v71;
  id v72;
  void *v73;
  void *v75;
  uint64_t **v76;
  void *__p;
  char *v78;
  char *v79;

  v11 = a3;
  v12 = a7;
  if (!v11)
    goto LABEL_80;
  if (!-[NSArray containsObject:](self->_opsAddedInStitchedRegion, "containsObject:", v11))
    goto LABEL_80;
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    goto LABEL_80;
  objc_msgSend(v12, "setObject:forKey:", v11, v11);
  for (i = 0; ; ++i)
  {
    objc_msgSend(v11, "controlDependencies");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (i >= v16)
      break;
    objc_msgSend(v11, "controlDependencies");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", i);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPSGraphStitchedOp recurseOperation:builder:symbolTable:tensorToValueMap:operationsRecursed:](self, "recurseOperation:builder:symbolTable:tensorToValueMap:operationsRecursed:", v18, a4, a5, a6, v12);
  }
  v72 = v12;
  objc_msgSend(v11, "inputTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = (char *)a6 + 8;
  v76 = (uint64_t **)a6;
  while (v20 < objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = *(uint64_t **)v21;
    if (!*(_QWORD *)v21)
      goto LABEL_21;
    v25 = (char *)a6 + 8;
    do
    {
      v26 = v24[4];
      v27 = v26 >= (unint64_t)v22;
      if (v26 >= (unint64_t)v22)
        v28 = (uint64_t **)v24;
      else
        v28 = (uint64_t **)(v24 + 1);
      if (v27)
        v25 = (char *)v24;
      v24 = *v28;
    }
    while (*v28);
    if (v25 == v21 || (unint64_t)v22 < *((_QWORD *)v25 + 4))
    {
LABEL_21:

      objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "operation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        __assert_rtn("-[MPSGraphStitchedOp recurseOperation:builder:symbolTable:tensorToValueMap:operationsRecursed:]", "MPSGraphStitchedOps.mm", 181, "currentOp");
      -[MPSGraphStitchedOp recurseOperation:builder:symbolTable:tensorToValueMap:operationsRecursed:](self, "recurseOperation:builder:symbolTable:tensorToValueMap:operationsRecursed:", v23, a4, a5, a6, v12);
    }

    ++v20;
  }
  v30 = 0;
  __p = 0;
  v78 = 0;
  v79 = 0;
  v75 = v11;
  v73 = a4;
  while (v30 < objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(uint64_t **)v21;
    if (!*(_QWORD *)v21)
      goto LABEL_38;
    v34 = v21;
    do
    {
      v35 = v33[4];
      v36 = v35 >= (unint64_t)v32;
      if (v35 >= (unint64_t)v32)
        v37 = (uint64_t **)v33;
      else
        v37 = (uint64_t **)(v33 + 1);
      if (v36)
        v34 = (char *)v33;
      v33 = *v37;
    }
    while (*v37);
    if (v34 == v21 || (unint64_t)v32 < *((_QWORD *)v34 + 4))
LABEL_38:
      v34 = v21;
    v38 = *((_QWORD *)v34 + 5);

    v39 = v78;
    if (v78 < v79)
    {
      *(_QWORD *)v78 = v38;
      v31 = (uint64_t)(v39 + 8);
      goto LABEL_25;
    }
    v40 = __p;
    v41 = v78 - (_BYTE *)__p;
    v42 = (v78 - (_BYTE *)__p) >> 3;
    v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 61)
      std::vector<long>::__throw_length_error[abi:ne180100]();
    v44 = v79 - (_BYTE *)__p;
    if ((v79 - (_BYTE *)__p) >> 2 > v43)
      v43 = v44 >> 2;
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
      v45 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v45 = v43;
    if (v45)
    {
      if (v45 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v46 = operator new(8 * v45);
      v47 = &v46[8 * v42];
      *v47 = v38;
      v31 = (uint64_t)(v47 + 1);
      v48 = v39 - v40;
      if (v39 == v40)
      {
LABEL_58:
        __p = v47;
        v79 = &v46[8 * v45];
        v11 = v75;
        if (!v39)
          goto LABEL_25;
LABEL_59:
        operator delete(v39);
        goto LABEL_25;
      }
    }
    else
    {
      v46 = 0;
      v47 = (_QWORD *)(8 * v42);
      *(_QWORD *)(8 * v42) = v38;
      v31 = 8 * v42 + 8;
      v48 = v39 - v40;
      if (v39 == v40)
        goto LABEL_58;
    }
    v49 = v48 - 8;
    if (v49 < 0x58)
      goto LABEL_87;
    if ((unint64_t)(v39 - v46 - v41) < 0x20)
      goto LABEL_87;
    v50 = (v49 >> 3) + 1;
    v51 = 8 * (v50 & 0x3FFFFFFFFFFFFFFCLL);
    v52 = &v39[-v51];
    v47 = (_QWORD *)((char *)v47 - v51);
    v53 = &v46[8 * v42 - 16];
    v54 = (__int128 *)(v39 - 16);
    v55 = v50 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v56 = *v54;
      *(v53 - 1) = *(v54 - 1);
      *v53 = v56;
      v53 -= 2;
      v54 -= 2;
      v55 -= 4;
    }
    while (v55);
    v39 = v52;
    if (v50 != (v50 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_87:
      do
      {
        v57 = *((_QWORD *)v39 - 1);
        v39 -= 8;
        *--v47 = v57;
      }
      while (v39 != v40);
    }
    v39 = __p;
    __p = v47;
    v79 = &v46[8 * v45];
    v11 = v75;
    if (v39)
      goto LABEL_59;
LABEL_25:
    v78 = (char *)v31;
    ++v30;
    a4 = v73;
  }
  objc_msgSend(v11, "name");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v11, "makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:", a4, a5, &__p, 0, v58);

  v60 = *(unsigned int *)(v59 + 36);
  if ((int)v60 >= 1)
  {
    for (j = 0; j != v60; ++j)
    {
      if (j >= *(unsigned int *)(v59 + 36))
        __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
      if (j <= 5)
        v63 = v59 + 16 * ~j;
      else
        v63 = v59 - 96 - 24 * (j - 5);
      objc_msgSend(v75, "outputTensors");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndexedSubscript:", j);
      v65 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v65;
      v66 = *(uint64_t **)v21;
      v67 = (uint64_t **)v21;
      v68 = (uint64_t **)v21;
      if (*(_QWORD *)v21)
      {
        while (1)
        {
          while (1)
          {
            v68 = (uint64_t **)v66;
            v69 = v66[4];
            if (v65 >= v69)
              break;
            v66 = *v68;
            v67 = v68;
            if (!*v68)
              goto LABEL_75;
          }
          if (v69 >= v65)
            break;
          v66 = v68[1];
          if (!v66)
          {
            v67 = v68 + 1;
            goto LABEL_75;
          }
        }
      }
      else
      {
LABEL_75:
        v70 = (uint64_t *)operator new(0x30uLL);
        v70[4] = (uint64_t)v62;
        v70[5] = v63;
        *v70 = 0;
        v70[1] = 0;
        v70[2] = (uint64_t)v68;
        *v67 = v70;
        v71 = (uint64_t *)**v76;
        if (v71)
        {
          *v76 = v71;
          v70 = *v67;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v76[1], v70);
        v62 = 0;
        v76[2] = (uint64_t *)((char *)v76[2] + 1);
      }

    }
  }
  if (__p)
  {
    v78 = (char *)__p;
    operator delete(__p);
  }

  v11 = v75;
  v12 = v72;
LABEL_80:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opsAddedInStitchedRegion, 0);
  objc_storeStrong((id *)&self->_finalOutputTensorForStitchedRegion, 0);
  objc_storeStrong(&self->_stitchingBlock, 0);
}

@end
