@implementation MPSGraphWhileOp

- (MPSGraphWhileOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 beforeBlock:(id)a6 afterBlock:(id)a7 name:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id beforeBlock;
  void *v21;
  id afterBlock;
  MPSGraphTensor *predicateTensor;
  AutodiffOpData *value;
  MPSGraphTensor *itersCountTensor;
  MPSGraphRegion *v26;
  MPSGraphWhileOp *v27;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = a7;
  v19 = (void *)MEMORY[0x186DA1DA0](a6);
  beforeBlock = self->_beforeBlock;
  self->_beforeBlock = v19;

  v21 = (void *)MEMORY[0x186DA1DA0](v18);
  afterBlock = self->_afterBlock;
  self->_afterBlock = v21;

  predicateTensor = self->_predicateTensor;
  self->_predicateTensor = 0;

  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(AutodiffOpData *))(*(_QWORD *)value + 8))(value);
  itersCountTensor = self->_itersCountTensor;
  self->_itersCountTensor = 0;

  v26 = objc_alloc_init(MPSGraphRegion);
  v29.receiver = self;
  v29.super_class = (Class)MPSGraphWhileOp;
  v27 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:region:name:](&v29, sel_initWithGraph_inputTensors_controlDependencies_region_name_, v14, v15, v16, v26, v17);

  return v27;
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
  unint64_t v24;
  _QWORD *WeakRetained;
  void *v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  MPSGraphTensor *v33;
  id v34;
  id v35;
  id *v36;
  MPSGraphTensor *v37;
  MPSGraphTensor *predicateTensor;
  id beforeBlock;
  NSArray *v40;
  NSArray *beforeResult;
  id v42;
  id v43;
  void *v44;
  MPSGraphConditionOp *v45;
  id v46;
  id *v47;
  void *v48;
  _QWORD *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  MPSGraphTensor *v55;
  id v56;
  id v57;
  id *v58;
  NSArray *v59;
  NSArray *afterResult;
  id afterBlock;
  MPSGraphYieldOp *v62;
  id v63;
  id *v64;
  id *v65;
  uint64_t v66;
  int64x2_t *v67;
  int64x2_t *v68;
  std::string::size_type v69;
  unint64_t *v70;
  unint64_t v71;
  unint64_t v72;
  int64x2_t v73;
  int64x2_t *v74;
  uint64_t v75;
  unint64_t Body;
  _QWORD *Block;
  _QWORD *v78;
  uint64_t *v79;
  uint64_t *v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t *v85;
  uint64_t *v86;
  BOOL v87;
  _QWORD *v88;
  _QWORD *v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  int64x2_t *v93;
  int64x2_t *v94;
  char *v95;
  unint64_t *v96;
  unint64_t v97;
  unint64_t v98;
  int64x2_t v99;
  int64x2_t *v100;
  uint64_t v101;
  unint64_t v102;
  int8x16_t *v103;
  int8x16_t *v104;
  int8x16_t *v105;
  int8x16_t *v106;
  _QWORD *v107;
  _QWORD *v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t *v111;
  uint64_t *v112;
  BOOL v113;
  _QWORD *v114;
  _QWORD *v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t Results;
  uint64_t v119;
  _QWORD *v120;
  _QWORD *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *DefiningOp;
  id v127;
  id v128;
  __int128 v129;
  _OWORD *v130;
  MPSGraphYieldOp *v132;
  void *v133;
  void *v134;
  void *v135;
  MPSGraphConditionOp *v136;
  unint64_t v137;
  void *v138;
  id v139;
  id v140;
  id obj;
  id v142;
  uint64_t NextResultAtOffset;
  int64x2_t *v144;
  char *v145;
  char *v146;
  mlir::GenericProgramPoint *v147;
  std::string v148;
  __int16 v149;
  void *v150;
  _BYTE *v151;
  void *v152;
  _BYTE *v153;
  void *__p[2];
  char v155;
  unint64_t v156[2];
  unint64_t v157[2];
  int8x16_t __dst;
  __int128 v159;
  _QWORD *v160;
  int8x16_t *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  _QWORD v166[4];
  _QWORD *v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  mpsFileLoc("-[MPSGraphWhileOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm", __p);
  v139 = v10;
  LOWORD(v167) = 260;
  v166[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v166);
  v12 = mlir::FileLineColLoc::get(StringAttr, 0x938u, 0);
  if (!v12)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v139)
  {
    BYTE7(v159) = 9;
    __dst.i8[8] = 101;
    __dst.i64[0] = *(_QWORD *)"scf.while";
    v17 = &__dst.i8[9];
    goto LABEL_13;
  }
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v139), "UTF8String");
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
    *(_QWORD *)&v159 = v19 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    BYTE7(v159) = v14;
    p_dst = &__dst;
    if (!v14)
      goto LABEL_12;
  }
  memmove(p_dst, v13, v15);
LABEL_12:
  v17 = &p_dst->i8[v15];
LABEL_13:
  *v17 = 0;
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v148);
  v20 = (std::string *)v148.__r_.__value_.__r.__words[0];
  if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v148;
  v21 = 1;
  BYTE1(v167) = 1;
  if (v20->__r_.__value_.__s.__data_[0])
  {
    v166[0] = v20;
    v21 = 3;
  }
  LOBYTE(v167) = v21;
  v22 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v166);
  v23 = mlir::NameLoc::get(v22, v12);
  v24 = v23;
  if (!v23)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v148.__r_.__value_.__l.__data_);
    v137 = v24;
    if ((SBYTE7(v159) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else
  {
    v137 = v23;
    if ((SBYTE7(v159) & 0x80000000) == 0)
      goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v155 < 0)
    operator delete(__p[0]);
  v129 = *((_OWORD *)a3 + 1);
  v130 = (char *)a3 + 16;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v128 = (id)WeakRetained[22];
  v127 = v128;

  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  getTypesFromTensors(v26, (char **)&v152);

  memset(v166, 0, sizeof(v166));
  v167 = &v167;
  v168 = (uint64_t *)&v167;
  v170 = 0;
  v171 = 0;
  v169 = 0;
  -[MPSGraphRegion appendNewBlock](self->super._region, "appendNewBlock");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v142 = (id)objc_opt_new();
  v27 = v152;
  if (v153 != v152)
  {
    v28 = 0;
    do
    {
      v29 = v27[v28];
      __dst.i64[0] = (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerforman"
                              "ceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm";
      LOWORD(v160) = 259;
      v30 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&__dst);
      v31 = mlir::FileLineColLoc::get(v30, 0x94Fu, 0);
      if (!v31)
        __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
      mlir::Block::addArgument(v166, v29, v31);
      v32 = *(_QWORD *)(v169 + 8 * v28);
      v33 = [MPSGraphTensor alloc];
      v34 = objc_loadWeakRetained((id *)&self->super._graph);
      v35 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v33, "initTensorWithOperation:value:graph:parentBlock:name:", self, v32, v34, obj, 0);

      objc_msgSend(v142, "addObject:", v35);
      ++v28;
      v27 = v152;
    }
    while (v28 < (v153 - (_BYTE *)v152) >> 3);
  }
  *((_QWORD *)a3 + 2) = v166;
  *((_QWORD *)a3 + 3) = &v167;
  v36 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  objc_storeStrong(v36 + 22, obj);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_beforeBlock + 2))();
  v37 = (MPSGraphTensor *)objc_claimAutoreleasedReturnValue();
  predicateTensor = self->_predicateTensor;
  self->_predicateTensor = v37;

  beforeBlock = self->_beforeBlock;
  self->_beforeBlock = 0;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v133);
  v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
  beforeResult = self->_beforeResult;
  self->_beforeResult = v40;

  if (!self->_predicateTensor && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v42 = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v42, "castTensor:toType:name:", self->_predicateTensor, 2147483656, CFSTR("if_cast"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v43, "reshapeTensor:withShape:name:", v134, MEMORY[0x1E0C9AA60], CFSTR("whilePredicate/reshape"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v165 = v135;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v165, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = (void *)objc_msgSend(v44, "mutableCopy");

  objc_msgSend(v138, "addObjectsFromArray:", self->_beforeResult);
  v45 = [MPSGraphConditionOp alloc];
  v46 = objc_loadWeakRetained((id *)&self->super._graph);
  v136 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v45, "initWithGraph:inputTensors:controlDependencies:name:", v46, v138, MEMORY[0x1E0C9AA60], 0);

  v47 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v47[22], "addTerminatorOperation:", v136);

  getTypesFromTensors(self->_beforeResult, (char **)&v150);
  __dst = 0u;
  v159 = 0u;
  v160 = &v160;
  v161 = (int8x16_t *)&v160;
  v163 = 0;
  v164 = 0;
  v162 = 0;
  -[MPSGraphRegion appendNewBlock](self->super._region, "appendNewBlock");
  v140 = (id)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_opt_new();
  v49 = v150;
  if (v151 != v150)
  {
    v50 = 0;
    do
    {
      v51 = v49[v50];
      v148.__r_.__value_.__r.__words[0] = (std::string::size_type)"/Library/Caches/com.apple.xbs/Sources/MetalPerformance"
                                                                  "ShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Cor"
                                                                  "e/Files/Operations/MPSGraphControlFlowOps.mm";
      v149 = 259;
      v52 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)&v148);
      v53 = mlir::FileLineColLoc::get(v52, 0x97Du, 0);
      if (!v53)
        __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
      mlir::Block::addArgument(&__dst, v51, v53);
      v54 = *(_QWORD *)(v162 + 8 * v50);
      v55 = [MPSGraphTensor alloc];
      v56 = objc_loadWeakRetained((id *)&self->super._graph);
      v57 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v55, "initTensorWithOperation:value:graph:parentBlock:name:", self, v54, v56, v140, 0);

      objc_msgSend(v48, "addObject:", v57);
      ++v50;
      v49 = v150;
    }
    while (v50 < (v151 - (_BYTE *)v150) >> 3);
  }
  *((_QWORD *)a3 + 2) = &__dst;
  *((_QWORD *)a3 + 3) = &v160;
  v58 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  objc_storeStrong(v58 + 22, v140);

  (*((void (**)(void))self->_afterBlock + 2))();
  v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
  afterResult = self->_afterResult;
  self->_afterResult = v59;

  afterBlock = self->_afterBlock;
  self->_afterBlock = 0;

  v62 = [MPSGraphYieldOp alloc];
  v63 = objc_loadWeakRetained((id *)&self->super._graph);
  v132 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v62, "initWithGraph:inputTensors:controlDependencies:name:", v63, self->_afterResult, MEMORY[0x1E0C9AA60], 0);

  v64 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(v64[22], "addTerminatorOperation:", v132);

  if ((_QWORD)v129)
  {
    *v130 = v129;
  }
  else
  {
    *(_QWORD *)v130 = 0;
    *((_QWORD *)a3 + 3) = 0;
  }
  v65 = (id *)objc_loadWeakRetained((id *)&self->super._graph);
  objc_storeStrong(v65 + 22, v128);

  v147 = (mlir::GenericProgramPoint *)mlir::OpBuilder::create<mlir::scf::WhileOp,std::vector<mlir::Type> &,std::vector<mlir::Value> &>((mlir::OpBuilder *)a3, v137, (uint64_t *)&v150, (uint64_t *)a5);
  memset(&v148, 0, sizeof(v148));
  v66 = v153 - (_BYTE *)v152;
  if (v153 == v152)
  {
    v69 = 0;
    v68 = 0;
  }
  else
  {
    if (v66 < 0)
      std::vector<long>::__throw_length_error[abi:ne180100]();
    v67 = (int64x2_t *)operator new(v153 - (_BYTE *)v152);
    v68 = v67;
    v69 = (std::string::size_type)v67 + 8 * (v66 >> 3);
    v148.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
    v148.__r_.__value_.__r.__words[2] = v69;
    v70 = (unint64_t *)v67;
    v71 = v137;
    if ((unint64_t)(v66 - 8) < 0x18)
      goto LABEL_122;
    v72 = ((unint64_t)(v66 - 8) >> 3) + 1;
    v70 = (unint64_t *)v67 + (v72 & 0x3FFFFFFFFFFFFFFCLL);
    v73 = vdupq_n_s64(v137);
    v74 = v67 + 1;
    v75 = v72 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v74[-1] = v73;
      *v74 = v73;
      v74 += 2;
      v75 -= 4;
    }
    while (v75);
    v71 = v137;
    if (v72 != (v72 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_122:
      do
        *v70++ = v71;
      while (v70 != (unint64_t *)v69);
    }
    v148.__r_.__value_.__l.__size_ = (std::string::size_type)v67 + 8 * (v66 >> 3);
  }
  Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v147);
  mlir::ValueRange::ValueRange(v157, (uint64_t)v152, (v153 - (_BYTE *)v152) >> 3);
  Block = mlir::OpBuilder::createBlock(a3, Body, 0, v157[0], v157[1], (uint64_t)v68, (uint64_t)(v69 - (_QWORD)v68) >> 3);
  v78 = Block;
  if (v167 != &v167 && Block != v166)
  {
    v79 = Block + 4;
    v80 = v168;
    llvm::ilist_traits<mlir::Operation>::transferNodesFromList((uint64_t)(Block + 4), (uint64_t)&v167, (uint64_t)v168, (uint64_t)&v167);
    if (v80 != (uint64_t *)&v167)
    {
      if (v80 == v79)
        __assert_rtn("transferBeforeImpl", "ilist_base.h", 60, "&Next != &First && \"Insertion point can't be one of the transferred nodes\");
      v81 = v167;
      v82 = (_QWORD *)*v80;
      v82[1] = &v167;
      v167 = v82;
      v83 = *v79;
      v81[1] = v79;
      *v80 = v83;
      *(_QWORD *)(v83 + 8) = v80;
      *v79 = (uint64_t)v81;
    }
  }
  if (v153 != v152)
  {
    v84 = 0;
    do
    {
      v85 = *(uint64_t **)(v169 + 8 * v84);
      v86 = *(uint64_t **)(v78[6] + 8 * v84);
      if (v86)
        v87 = v85 == v86;
      else
        v87 = 0;
      if (v87)
        __assert_rtn("replaceAllUsesWith", "UseDefLists.h", 213, "(!newValue || this != OperandType::getUseList(newValue)) && \"cannot RAUW a value with itself\");
      v88 = (_QWORD *)*v85;
      if (*v85)
      {
        do
        {
          v89 = (_QWORD *)v88[1];
          if (v89)
          {
            *v89 = *v88;
            if (*v88)
              *(_QWORD *)(*v88 + 8) = v88[1];
          }
          v88[3] = v86;
          v88[1] = v86;
          v90 = *v86;
          *v88 = *v86;
          if (v90)
            *(_QWORD *)(v90 + 8) = v88;
          *v86 = (uint64_t)v88;
          v88 = (_QWORD *)*v85;
        }
        while (*v85);
        v86 = *(uint64_t **)(v78[6] + 8 * v84);
      }
      objc_msgSend(v142, "objectAtIndexedSubscript:", v84);
      v91 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v91[1] = v86;

      ++v84;
    }
    while (v84 < (v153 - (_BYTE *)v152) >> 3);
  }
  v145 = 0;
  v146 = 0;
  v144 = 0;
  v92 = v151 - (_BYTE *)v150;
  if (v151 == v150)
  {
    v95 = 0;
    v94 = 0;
  }
  else
  {
    if (v92 < 0)
      std::vector<long>::__throw_length_error[abi:ne180100]();
    v93 = (int64x2_t *)operator new(v151 - (_BYTE *)v150);
    v94 = v93;
    v95 = &v93->i8[8 * (v92 >> 3)];
    v144 = v93;
    v146 = v95;
    v96 = (unint64_t *)v93;
    v97 = v137;
    if ((unint64_t)(v92 - 8) < 0x18)
      goto LABEL_123;
    v98 = ((unint64_t)(v92 - 8) >> 3) + 1;
    v96 = (unint64_t *)v93 + (v98 & 0x3FFFFFFFFFFFFFFCLL);
    v99 = vdupq_n_s64(v137);
    v100 = v93 + 1;
    v101 = v98 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v100[-1] = v99;
      *v100 = v99;
      v100 += 2;
      v101 -= 4;
    }
    while (v101);
    v97 = v137;
    if (v98 != (v98 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_123:
      do
        *v96++ = v97;
      while (v96 != (unint64_t *)v95);
    }
    v145 = &v93->i8[8 * (v92 >> 3)];
  }
  v102 = mlir::scf::WhileOp::getAfter((mlir::scf::WhileOp *)&v147);
  mlir::ValueRange::ValueRange(v156, (uint64_t)v150, (v151 - (_BYTE *)v150) >> 3);
  v103 = (int8x16_t *)mlir::OpBuilder::createBlock(a3, v102, 0, v156[0], v156[1], (uint64_t)v94, (v95 - (char *)v94) >> 3);
  v104 = v103;
  if (v160 != &v160 && v103 != &__dst)
  {
    v105 = v103 + 2;
    v106 = v161;
    llvm::ilist_traits<mlir::Operation>::transferNodesFromList((uint64_t)v103[2].i64, (uint64_t)&v160, (uint64_t)v161, (uint64_t)&v160);
    if (v106 != (int8x16_t *)&v160)
    {
      if (v106 == v105)
        __assert_rtn("transferBeforeImpl", "ilist_base.h", 60, "&Next != &First && \"Insertion point can't be one of the transferred nodes\");
      v107 = v160;
      v108 = (_QWORD *)v106->i64[0];
      v108[1] = &v160;
      v160 = v108;
      v109 = v105->i64[0];
      v107[1] = v105;
      v106->i64[0] = v109;
      *(_QWORD *)(v109 + 8) = v106;
      v105->i64[0] = (uint64_t)v107;
    }
  }
  if (v151 != v150)
  {
    v110 = 0;
    do
    {
      v111 = *(uint64_t **)(v162 + 8 * v110);
      v112 = *(uint64_t **)(v104[3].i64[0] + 8 * v110);
      if (v112)
        v113 = v111 == v112;
      else
        v113 = 0;
      if (v113)
        __assert_rtn("replaceAllUsesWith", "UseDefLists.h", 213, "(!newValue || this != OperandType::getUseList(newValue)) && \"cannot RAUW a value with itself\");
      v114 = (_QWORD *)*v111;
      if (*v111)
      {
        do
        {
          v115 = (_QWORD *)v114[1];
          if (v115)
          {
            *v115 = *v114;
            if (*v114)
              *(_QWORD *)(*v114 + 8) = v114[1];
          }
          v114[3] = v112;
          v114[1] = v112;
          v116 = *v112;
          *v114 = *v112;
          if (v116)
            *(_QWORD *)(v116 + 8) = v114;
          *v112 = (uint64_t)v114;
          v114 = (_QWORD *)*v111;
        }
        while (*v111);
        v112 = *(uint64_t **)(v104[3].i64[0] + 8 * v110);
      }
      objc_msgSend(v48, "objectAtIndexedSubscript:", v110);
      v117 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v117[1] = v112;

      ++v110;
    }
    while (v110 < (v151 - (_BYTE *)v150) >> 3);
  }
  Results = mlir::pdl::ApplyNativeRewriteOp::getResults((mlir::pdl::ApplyNativeRewriteOp *)&v147);
  if (!v119)
    __assert_rtn("operator[]", "STLExtras.h", 1281, "Index < size() && \"invalid index for value range\");
  NextResultAtOffset = mlir::detail::OpResultImpl::getNextResultAtOffset(Results, 0);
  objc_storeStrong((id *)&self->_beforeBlockArguments, v142);
  objc_storeStrong((id *)&self->_afterBlockArguments, v48);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._region->_blocks, "objectAtIndexedSubscript:", 0);
  v120 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v120[3] = v78;

  -[NSMutableArray objectAtIndexedSubscript:](self->super._region->_blocks, "objectAtIndexedSubscript:", 1);
  v121 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v121[3] = v104;

  v122 = *((_QWORD *)v147 + 2);
  mlir::GenericProgramPoint::~GenericProgramPoint(v147);
  v124 = *(_QWORD *)(v123 + 8);
  *((_QWORD *)a3 + 2) = v122;
  *((_QWORD *)a3 + 3) = v124;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&NextResultAtOffset);
  if (v94)
    operator delete(v94);
  if (v68)
    operator delete(v68);

  mlir::Block::~Block((mlir::Block *)&__dst);
  if (v150)
  {
    v151 = v150;
    operator delete(v150);
  }

  mlir::Block::~Block((mlir::Block *)v166);
  if (v152)
  {
    v153 = v152;
    operator delete(v152);
  }

  return DefiningOp;
}

- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(void *)a5
{
  return recurseForUsesOnEscaped((Autodiff *)a5, (MPSGraphBlock *)a3, (MPSGraphTensor *)a4);
}

- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(void *)a4
{
  id v6;
  _QWORD *OpData;

  v6 = a3;
  OpData = getOpData(&self->super);
  LOBYTE(a4) = (*(uint64_t (**)(_QWORD *, void *, id))(*OpData + 24))(OpData, a4, v6);

  return (char)a4;
}

- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(void *)a4
{
  id v6;
  _QWORD *OpData;

  v6 = a3;
  OpData = getOpData(&self->super);
  LOBYTE(a4) = (*(uint64_t (**)(_QWORD *, void *, id))(*OpData + 32))(OpData, a4, v6);

  return (char)a4;
}

- (void)partialDerivateForCFOpWithAutodiff:(void *)a3
{
  AutodiffOpData *OpData;

  OpData = (AutodiffOpData *)getOpData(&self->super);
  AutodiffOpData::createPartialDerivatives(OpData, (Autodiff *)a3);
}

- (void).cxx_destruct
{
  AutodiffOpData *value;

  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(AutodiffOpData *, SEL))(*(_QWORD *)value + 8))(value, a2);
  objc_storeStrong((id *)&self->_itersCountTensor, 0);
  objc_storeStrong((id *)&self->_predicateTensor, 0);
  objc_storeStrong((id *)&self->_afterBlockArguments, 0);
  objc_storeStrong((id *)&self->_beforeBlockArguments, 0);
  objc_storeStrong((id *)&self->_afterResult, 0);
  objc_storeStrong((id *)&self->_beforeResult, 0);
  objc_storeStrong((id *)&self->_initInputTensors, 0);
  objc_storeStrong(&self->_afterBlock, 0);
  objc_storeStrong(&self->_beforeBlock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 20) = 0;
  return self;
}

@end
