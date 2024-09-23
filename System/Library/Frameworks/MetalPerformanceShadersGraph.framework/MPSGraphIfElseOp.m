@implementation MPSGraphIfElseOp

- (MPSGraphIfElseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 trueBlock:(id)a6 falseBlock:(id)a7 name:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id trueBlock;
  void *v21;
  id falseBlock;
  AutodiffOpData *value;
  MPSGraphRegion *v24;
  MPSGraphIfElseOp *v25;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = a7;
  v19 = (void *)MEMORY[0x186DA1DA0](a6);
  trueBlock = self->_trueBlock;
  self->_trueBlock = v19;

  v21 = (void *)MEMORY[0x186DA1DA0](v18);
  falseBlock = self->_falseBlock;
  self->_falseBlock = v21;

  value = self->_opData.__ptr_.__value_;
  self->_opData.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(AutodiffOpData *))(*(_QWORD *)value + 8))(value);
  v24 = objc_alloc_init(MPSGraphRegion);
  v27.receiver = self;
  v27.super_class = (Class)MPSGraphIfElseOp;
  v25 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:region:name:](&v27, sel_initWithGraph_inputTensors_controlDependencies_region_name_, v14, v15, v16, v24, v17);

  return v25;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  _QWORD *WeakRetained;
  id v13;
  uint64_t StringAttr;
  uint64_t v15;
  const char *v16;
  size_t v17;
  size_t v18;
  int8x16_t *p_dst;
  uint64_t v20;
  uint64_t v21;
  std::string *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  mlir::GenericProgramPoint *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  NSArray *v30;
  NSArray *trueResults;
  id trueBlock;
  MPSGraphYieldOp *v33;
  id v34;
  id *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  NSArray *v39;
  NSArray *falseResults;
  MPSGraphYieldOp *v41;
  id v42;
  id *v43;
  NSArray *v44;
  uint64_t v45;
  unint64_t i;
  void *v47;
  uint64_t ElementTypeOrSelf;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSArray *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  char *v59;
  unint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  int64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  _BYTE *v68;
  uint64_t *v69;
  int64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  _OWORD *v75;
  __int128 *v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  _BYTE *v80;
  int64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  _BYTE *v86;
  unint64_t *v87;
  int64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  _OWORD *v93;
  __int128 *v94;
  uint64_t v95;
  __int128 v96;
  unint64_t v97;
  id *v98;
  mlir::OpBuilder *v99;
  id falseBlock;
  uint64_t v101;
  _QWORD *v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t *v106;
  _QWORD *v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  int8x16_t *v111;
  int8x16_t *v112;
  uint64_t v113;
  int8x16_t *v114;
  int8x16_t *v115;
  _QWORD *v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  int8x16_t *v120;
  int8x16_t *v121;
  uint64_t v122;
  int8x16_t *v123;
  _QWORD *v124;
  uint64_t v125;
  unint64_t Body;
  uint64_t v127;
  mlir::GenericProgramPoint **v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  mlir::GenericProgramPoint **v133;
  uint64_t v134;
  uint64_t v135;
  std::string::size_type v136;
  uint64_t v137;
  uint64_t v138;
  std::string::size_type size;
  uint64_t v140;
  _QWORD *v141;
  uint64_t v142;
  char *v143;
  _QWORD *v144;
  char *v145;
  uint64_t Results;
  uint64_t v147;
  void *DefiningOp;
  char *v150;
  uint64_t v151;
  BOOL v152;
  uint64_t **v153;
  uint64_t **v154;
  char *v155;
  int64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  _BYTE *v161;
  _QWORD *v162;
  int64_t v163;
  unint64_t v164;
  char *v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  _OWORD *v170;
  char *v171;
  uint64_t v172;
  __int128 v173;
  const char *v174;
  int v175;
  MPSGraphYieldOp *v176;
  void *v177;
  id v178;
  __int128 v179;
  _QWORD *v180;
  id obj;
  MPSGraphYieldOp *v182;
  uint64_t v183;
  _QWORD *v184;
  id *location;
  id *locationa;
  unint64_t v187;
  MPSGraphIfElseOp *v188;
  uint64_t **NextResultAtOffset;
  void *v190;
  uint64_t v191;
  char *v192;
  uint64_t Inputs;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  std::string v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  char *v202;
  char *v203;
  uint64_t v204;
  void *__p[2];
  char v206;
  int8x16_t __dst;
  __int128 v208;
  _QWORD *v209;
  int8x16_t *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  _QWORD v214[4];
  _QWORD *v215;
  int8x16_t *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;

  v220 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v179 = *((_OWORD *)a3 + 1);
  v180 = (char *)a3 + 16;
  location = (id *)&self->super._graph;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  obj = (id)WeakRetained[22];
  v178 = obj;

  mpsFileLoc("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphControlFlowOps.mm", __p);
  v13 = v11;
  LOWORD(v215) = 260;
  v214[0] = __p;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v214);
  v15 = mlir::FileLineColLoc::get(StringAttr, 0x891u, 0);
  if (!v15)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  v184 = a3;
  if (!v13)
  {
    BYTE7(v208) = 6;
    strcpy(__dst.i8, "scf.if");
    goto LABEL_13;
  }
  v16 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v18 = v17;
  if (v17 >= 0x17)
  {
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    p_dst = (int8x16_t *)operator new(v20 + 1);
    __dst.i64[1] = v18;
    *(_QWORD *)&v208 = v21 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
    a3 = v184;
  }
  else
  {
    BYTE7(v208) = v17;
    p_dst = &__dst;
    if (!v17)
      goto LABEL_12;
  }
  memmove(p_dst, v16, v18);
LABEL_12:
  p_dst->i8[v18] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &v197);
  v22 = (std::string *)v197.__r_.__value_.__r.__words[0];
  if ((v197.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v197;
  v23 = 1;
  BYTE1(v215) = 1;
  if (v22->__r_.__value_.__s.__data_[0])
  {
    v214[0] = v22;
    v23 = 3;
  }
  LOBYTE(v215) = v23;
  v24 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v214);
  v25 = mlir::NameLoc::get(v24, v15);
  if (!v25)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  v183 = v25;
  if (SHIBYTE(v197.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v197.__r_.__value_.__l.__data_);
    if ((SBYTE7(v208) & 0x80000000) == 0)
      goto LABEL_20;
  }
  else if ((SBYTE7(v208) & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  operator delete((void *)__dst.i64[0]);
LABEL_20:

  if (v206 < 0)
    operator delete(__p[0]);
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v26 = mlir::OpBuilder::create<mlir::tensor::ExtractOp,mlir::Value &>((mlir::OpBuilder *)v184, v183, *(_QWORD *)a5);
  if (!*((_DWORD *)v26 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v203 = 0;
  v204 = (uint64_t)v26 - 16;
  v201 = 0;
  v202 = 0;
  memset(v214, 0, sizeof(v214));
  v215 = &v215;
  v216 = (int8x16_t *)&v215;
  v218 = 0;
  v219 = 0;
  v217 = 0;
  v184[2] = v214;
  v184[3] = &v215;
  -[MPSGraphRegion appendNewBlock](self->super._region, "appendNewBlock");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = objc_loadWeakRetained(location);
  v29 = (void *)v28[22];
  v28[22] = v27;

  (*((void (**)(void))self->_trueBlock + 2))();
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trueResults = self->_trueResults;
  self->_trueResults = v30;

  trueBlock = self->_trueBlock;
  self->_trueBlock = 0;

  v33 = [MPSGraphYieldOp alloc];
  v34 = objc_loadWeakRetained(location);
  v182 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v33, "initWithGraph:inputTensors:controlDependencies:name:", v34, self->_trueResults, MEMORY[0x1E0C9AA60], 0);

  v35 = (id *)objc_loadWeakRetained(location);
  objc_msgSend(v35[22], "addTerminatorOperation:", v182);

  if (!self->_falseBlock)
  {
    -[NSArray count](self->_trueResults, "count");
    if (-[NSArray count](self->_trueResults, "count"))
    {
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
    }
  }
  __dst = 0u;
  v208 = 0u;
  v209 = &v209;
  v210 = (int8x16_t *)&v209;
  v212 = 0;
  v213 = 0;
  v211 = 0;
  v188 = self;
  v177 = v13;
  if (self->_falseBlock)
  {
    v184[2] = &__dst;
    v184[3] = &v209;
    -[MPSGraphRegion appendNewBlock](self->super._region, "appendNewBlock");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = objc_loadWeakRetained(location);
    v38 = (void *)v37[22];
    v37[22] = v36;

    (*((void (**)(void))self->_falseBlock + 2))();
    v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
    falseResults = self->_falseResults;
    self->_falseResults = v39;

    v41 = [MPSGraphYieldOp alloc];
    v42 = objc_loadWeakRetained(location);
    v176 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](v41, "initWithGraph:inputTensors:controlDependencies:name:", v42, self->_falseResults, MEMORY[0x1E0C9AA60], 0);

    v43 = (id *)objc_loadWeakRetained(location);
    objc_msgSend(v43[22], "addTerminatorOperation:", v176);

    if (self->_trueResults)
    {
      v44 = self->_falseResults;
      if (v44)
      {
        v45 = -[NSArray count](v44, "count");
        if (v45 == -[NSArray count](self->_trueResults, "count"))
        {
          for (i = 0; ; ++i)
          {
            if (i >= -[NSArray count](self->_trueResults, "count"))
              goto LABEL_81;
            -[NSArray objectAtIndexedSubscript:](self->_trueResults, "objectAtIndexedSubscript:", i);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            ElementTypeOrSelf = mlir::getElementTypeOrSelf((_QWORD *)(*(_QWORD *)(objc_msgSend(v47, "value") + 8) & 0xFFFFFFFFFFFFFFF8));
            -[NSArray objectAtIndexedSubscript:](self->_falseResults, "objectAtIndexedSubscript:", i);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (ElementTypeOrSelf != mlir::getElementTypeOrSelf((_QWORD *)(*(_QWORD *)(objc_msgSend(v49, "value") + 8) & 0xFFFFFFFFFFFFFFF8)))
              __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2235, "getElementTypeOrSelf(_trueResults[i].value.getType()) == getElementTypeOrSelf(_falseResults[i].value.getType())");

            -[NSArray objectAtIndexedSubscript:](self->_trueResults, "objectAtIndexedSubscript:", i);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = *(_QWORD *)(objc_msgSend(v50, "value") + 8);
            -[NSArray objectAtIndexedSubscript:](self->_falseResults, "objectAtIndexedSubscript:", i);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v51) = (v51 & 0xFFFFFFFFFFFFFFF8) == (*(_QWORD *)(objc_msgSend(v52, "value") + 8) & 0xFFFFFFFFFFFFFFF8);

            v53 = self->_trueResults;
            if ((_DWORD)v51)
            {
              -[NSArray objectAtIndexedSubscript:](v53, "objectAtIndexedSubscript:", i);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = *(_QWORD *)(objc_msgSend(v54, "value") + 8) & 0xFFFFFFFFFFFFFFF8;
              v58 = v202;
              if (v202 < v203)
              {
                *(_QWORD *)v202 = v60;
                v59 = v58 + 8;
                goto LABEL_38;
              }
              v80 = v201;
              v81 = v202 - (_BYTE *)v201;
              v82 = (v202 - (_BYTE *)v201) >> 3;
              v83 = v82 + 1;
              if ((unint64_t)(v82 + 1) >> 61)
                std::vector<int>::__throw_length_error[abi:ne180100]();
              v84 = v203 - (_BYTE *)v201;
              if ((v203 - (_BYTE *)v201) >> 2 > v83)
                v83 = v84 >> 2;
              if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFF8)
                v85 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v85 = v83;
              if (v85)
              {
                if (v85 >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v86 = operator new(8 * v85);
                v87 = (unint64_t *)&v86[8 * v82];
                *v87 = v60;
                v61 = (uint64_t)(v87 + 1);
                v88 = v58 - v80;
                if (v58 == v80)
                {
LABEL_72:
                  v201 = v87;
                  v202 = (char *)v61;
                  v203 = &v86[8 * v85];
                  if (v58)
                    goto LABEL_69;
                  goto LABEL_70;
                }
              }
              else
              {
                v86 = 0;
                v87 = (unint64_t *)(8 * v82);
                *(_QWORD *)(8 * v82) = v60;
                v61 = 8 * v82 + 8;
                v88 = v58 - v80;
                if (v58 == v80)
                  goto LABEL_72;
              }
              v89 = v88 - 8;
              if (v89 < 0x58)
                goto LABEL_190;
              if ((unint64_t)(v58 - v86 - v81) < 0x20)
                goto LABEL_190;
              v90 = (v89 >> 3) + 1;
              v91 = 8 * (v90 & 0x3FFFFFFFFFFFFFFCLL);
              v92 = &v58[-v91];
              v87 = (unint64_t *)((char *)v87 - v91);
              v93 = &v86[8 * v82 - 16];
              v94 = (__int128 *)(v58 - 16);
              v95 = v90 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v96 = *v94;
                *(v93 - 1) = *(v94 - 1);
                *v93 = v96;
                v93 -= 2;
                v94 -= 2;
                v95 -= 4;
              }
              while (v95);
              v58 = v92;
              if (v90 != (v90 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_190:
                do
                {
                  v97 = *((_QWORD *)v58 - 1);
                  v58 -= 8;
                  *--v87 = v97;
                }
                while (v58 != v80);
              }
              v58 = v201;
              v201 = v87;
              v202 = (char *)v61;
              v203 = &v86[8 * v85];
              if (v58)
                goto LABEL_69;
            }
            else
            {
              -[NSArray objectAtIndexedSubscript:](v53, "objectAtIndexedSubscript:", i);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = mlir::getElementTypeOrSelf((_QWORD *)(*(_QWORD *)(objc_msgSend(v54, "value") + 8) & 0xFFFFFFFFFFFFFFF8));
              v56 = mlir::UnrankedTensorType::get(v55);
              v57 = v56;
              v58 = v202;
              if (v202 < v203)
              {
                *(_QWORD *)v202 = v56;
                v59 = v58 + 8;
LABEL_38:
                v61 = (uint64_t)v59;
                goto LABEL_70;
              }
              v62 = v201;
              v63 = v202 - (_BYTE *)v201;
              v64 = (v202 - (_BYTE *)v201) >> 3;
              v65 = v64 + 1;
              if ((unint64_t)(v64 + 1) >> 61)
                std::vector<int>::__throw_length_error[abi:ne180100]();
              v66 = v203 - (_BYTE *)v201;
              if ((v203 - (_BYTE *)v201) >> 2 > v65)
                v65 = v66 >> 2;
              if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8)
                v67 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v67 = v65;
              if (v67)
              {
                if (v67 >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v68 = operator new(8 * v67);
                v69 = (uint64_t *)&v68[8 * v64];
                *v69 = v57;
                v61 = (uint64_t)(v69 + 1);
                v70 = v58 - v62;
                if (v58 == v62)
                {
LABEL_68:
                  v201 = v69;
                  v202 = (char *)v61;
                  v203 = &v68[8 * v67];
                  if (!v58)
                    goto LABEL_70;
LABEL_69:
                  operator delete(v58);
                  goto LABEL_70;
                }
              }
              else
              {
                v68 = 0;
                v69 = (uint64_t *)(8 * v64);
                *(_QWORD *)(8 * v64) = v57;
                v61 = 8 * v64 + 8;
                v70 = v58 - v62;
                if (v58 == v62)
                  goto LABEL_68;
              }
              v71 = v70 - 8;
              if (v71 < 0x58)
                goto LABEL_191;
              if ((unint64_t)(v58 - v68 - v63) < 0x20)
                goto LABEL_191;
              v72 = (v71 >> 3) + 1;
              v73 = 8 * (v72 & 0x3FFFFFFFFFFFFFFCLL);
              v74 = &v58[-v73];
              v69 = (uint64_t *)((char *)v69 - v73);
              v75 = &v68[8 * v64 - 16];
              v76 = (__int128 *)(v58 - 16);
              v77 = v72 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v78 = *v76;
                *(v75 - 1) = *(v76 - 1);
                *v75 = v78;
                v75 -= 2;
                v76 -= 2;
                v77 -= 4;
              }
              while (v77);
              v58 = v74;
              if (v72 != (v72 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_191:
                do
                {
                  v79 = *((_QWORD *)v58 - 1);
                  v58 -= 8;
                  *--v69 = v79;
                }
                while (v58 != v62);
              }
              v58 = v201;
              v201 = v69;
              v202 = (char *)v61;
              v203 = &v68[8 * v67];
              if (v58)
                goto LABEL_69;
            }
LABEL_70:
            v202 = (char *)v61;

            self = v188;
          }
        }
        v174 = "_falseResults.count == _trueResults.count";
        v175 = 2232;
      }
      else
      {
        v174 = "_falseResults";
        v175 = 2231;
      }
      __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", v175, v174);
    }
LABEL_81:

  }
  v98 = (id *)objc_loadWeakRetained(location);
  objc_storeStrong(v98 + 22, obj);

  if (!(_QWORD)v179)
  {
    *v180 = 0;
    v180[1] = 0;
    v99 = (mlir::OpBuilder *)v184;
    v200 = 0;
    if (self->_falseBlock)
      goto LABEL_84;
LABEL_97:
    v197.__r_.__value_.__s.__data_[0] = 1;
    LOBYTE(Inputs) = 0;
    v200 = mlir::OpBuilder::create<mlir::scf::IfOp,std::vector<mlir::Type> &,mlir::Value &,BOOL,BOOL>(v99, v183, (uint64_t *)&v201, &v204, (unsigned __int8 *)&v197, (unsigned __int8 *)&Inputs);
    v119 = mlir::scf::IfOp::thenBlock((mlir::scf::IfOp *)&v200);
    v120 = (int8x16_t *)mlir::scf::IfOp::thenBlock((mlir::scf::IfOp *)&v200);
    if (v215 == &v215)
      goto LABEL_103;
    v121 = v120;
    if (v120 == (int8x16_t *)v214)
      goto LABEL_103;
    v122 = v119 + 32;
    v123 = v216;
    llvm::ilist_traits<mlir::Operation>::transferNodesFromList(v122, (uint64_t)&v215, (uint64_t)v216, (uint64_t)&v215);
    if (v123 == (int8x16_t *)&v215)
      goto LABEL_103;
    v115 = v121 + 2;
    if (v123 != &v121[2])
    {
      v116 = v215;
      v124 = (_QWORD *)v123->i64[0];
      v124[1] = &v215;
      v215 = v124;
      v125 = v115->i64[0];
      v116[1] = v115;
      v123->i64[0] = v125;
      *(_QWORD *)(v125 + 8) = v123;
      goto LABEL_102;
    }
    goto LABEL_171;
  }
  *(_OWORD *)v180 = v179;
  v99 = (mlir::OpBuilder *)v184;
  v200 = 0;
  if (!self->_falseBlock)
    goto LABEL_97;
LABEL_84:
  v197.__r_.__value_.__s.__data_[0] = 1;
  LOBYTE(Inputs) = 1;
  v200 = mlir::OpBuilder::create<mlir::scf::IfOp,std::vector<mlir::Type> &,mlir::Value &,BOOL,BOOL>(v99, v183, (uint64_t *)&v201, &v204, (unsigned __int8 *)&v197, (unsigned __int8 *)&Inputs);
  falseBlock = self->_falseBlock;
  self->_falseBlock = 0;

  v101 = mlir::scf::IfOp::thenBlock((mlir::scf::IfOp *)&v200);
  v102 = (_QWORD *)mlir::scf::IfOp::thenBlock((mlir::scf::IfOp *)&v200);
  if (v215 != &v215)
  {
    v103 = v102;
    if (v102 != v214)
    {
      v104 = v101 + 32;
      v105 = (uint64_t *)v216;
      llvm::ilist_traits<mlir::Operation>::transferNodesFromList(v104, (uint64_t)&v215, (uint64_t)v216, (uint64_t)&v215);
      if (v105 != (uint64_t *)&v215)
      {
        v106 = v103 + 4;
        if (v105 == v103 + 4)
          goto LABEL_171;
        v107 = v215;
        v108 = (_QWORD *)*v105;
        v108[1] = &v215;
        v215 = v108;
        v109 = *v106;
        v107[1] = v106;
        *v105 = v109;
        *(_QWORD *)(v109 + 8) = v105;
        *v106 = (uint64_t)v107;
      }
    }
  }
  v110 = mlir::scf::IfOp::elseBlock((mlir::scf::IfOp *)&v200);
  v111 = (int8x16_t *)mlir::scf::IfOp::elseBlock((mlir::scf::IfOp *)&v200);
  if (v209 == &v209)
    goto LABEL_103;
  v112 = v111;
  if (v111 == &__dst)
    goto LABEL_103;
  v113 = v110 + 32;
  v114 = v210;
  llvm::ilist_traits<mlir::Operation>::transferNodesFromList(v113, (uint64_t)&v209, (uint64_t)v210, (uint64_t)&v209);
  if (v114 == (int8x16_t *)&v209)
    goto LABEL_103;
  v115 = v112 + 2;
  if (v114 == &v112[2])
LABEL_171:
    __assert_rtn("transferBeforeImpl", "ilist_base.h", 60, "&Next != &First && \"Insertion point can't be one of the transferred nodes\");
  v116 = v209;
  v117 = (_QWORD *)v114->i64[0];
  v117[1] = &v209;
  v209 = v117;
  v118 = v115->i64[0];
  v116[1] = v115;
  v114->i64[0] = v118;
  *(_QWORD *)(v118 + 8) = v114;
LABEL_102:
  v115->i64[0] = (uint64_t)v116;
LABEL_103:
  Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v200);
  v127 = *(_QWORD *)(Body + 8);
  if (v127)
    v128 = (mlir::GenericProgramPoint **)(v127 - 8);
  else
    v128 = 0;
  mlir::Block::getTerminator(v128);
  if (!v129)
  {
    v199 = 0;
LABEL_186:
    __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2273, "thenYieldOp && \"thenRegion must have a terminator\");
  }
  v199 = llvm::DefaultDoCastIfPossible<mlir::scf::YieldOp,mlir::Operation *,llvm::CastInfo<mlir::scf::YieldOp,mlir::Operation *,void>>::doCastIfPossible(v129);
  if (!v199)
    goto LABEL_186;
  Inputs = mlir::anec::Concat::getInputs((mlir::anec::Concat *)&v199);
  v194 = v130;
  mlir::OperandRange::getTypes(&Inputs, (uint64_t *)&v197);
  v131 = mlir::scf::WhileOp::getAfter((mlir::scf::WhileOp *)&v200);
  v132 = *(_QWORD *)(v131 + 8);
  if (v132)
    v133 = (mlir::GenericProgramPoint **)(v132 - 8);
  else
    v133 = 0;
  mlir::Block::getTerminator(v133);
  if (!v134
    || !llvm::DefaultDoCastIfPossible<mlir::scf::YieldOp,mlir::Operation *,llvm::CastInfo<mlir::scf::YieldOp,mlir::Operation *,void>>::doCastIfPossible(v134))
  {
    __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2279, "elseYieldOp && \"elseRegion must have a terminator\");
  }
  v190 = (void *)mlir::anec::Concat::getInputs((mlir::anec::Concat *)&v199);
  v191 = v135;
  mlir::OperandRange::getTypes((uint64_t *)&v190, &Inputs);
  v190 = 0;
  v191 = 0;
  v192 = 0;
  v136 = v197.__r_.__value_.__r.__words[2];
  if (v197.__r_.__value_.__r.__words[2] != v197.__r_.__value_.__r.__words[0])
    __assert_rtn("operator-", "STLExtras.h", 1202, "base == rhs.base && \"incompatible iterators\");
  v137 = v195;
  if (v195 != Inputs)
    __assert_rtn("operator-", "STLExtras.h", 1202, "base == rhs.base && \"incompatible iterators\");
  v138 = v194;
  size = v197.__r_.__value_.__l.__size_;
  if (v198 - v197.__r_.__value_.__l.__size_ != v196 - v194)
    __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2285, "thenResultSize == elseResultSize && \"then and else blocks should have equal number of return values\");
  locationa = (id *)v131;
  v187 = Body;
  if (v198 != v197.__r_.__value_.__l.__size_)
  {
    v150 = 0;
    do
    {
      v153 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(v136 + 32 * size + 24) + 8) & 0xFFFFFFFFFFFFFFF8);
      v154 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(v137 + 32 * v138 + 24) + 8) & 0xFFFFFFFFFFFFFFF8);
      NextResultAtOffset = 0;
      if (!mlir::joinTypes(v153, v154, &NextResultAtOffset))
        __assert_rtn("-[MPSGraphIfElseOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "MPSGraphControlFlowOps.mm", 2293, "mlir::succeeded(joinTypes(thenType, elseType, resultType))");
      if (v150 < v192)
      {
        *(_QWORD *)v150 = NextResultAtOffset;
        v151 = (uint64_t)(v150 + 8);
      }
      else
      {
        v155 = (char *)v190;
        v156 = v150 - (_BYTE *)v190;
        v157 = (v150 - (_BYTE *)v190) >> 3;
        v158 = v157 + 1;
        if ((unint64_t)(v157 + 1) >> 61)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v159 = v192 - (_BYTE *)v190;
        if ((v192 - (_BYTE *)v190) >> 2 > v158)
          v158 = v159 >> 2;
        if ((unint64_t)v159 >= 0x7FFFFFFFFFFFFFF8)
          v160 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v160 = v158;
        if (v160)
        {
          if (v160 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v161 = operator new(8 * v160);
          v162 = &v161[8 * v157];
          *v162 = NextResultAtOffset;
          v151 = (uint64_t)(v162 + 1);
          v163 = v150 - v155;
          if (v150 != v155)
          {
LABEL_144:
            v164 = v163 - 8;
            if (v164 < 0x168)
            {
              v165 = v150;
              goto LABEL_146;
            }
            v167 = (v150 - 8 - v155) & 0xFFFFFFFFFFFFFFF8;
            if (&v161[v156 - 8 - v167] > &v161[v156 - 8])
            {
              v165 = v150;
              goto LABEL_146;
            }
            if (&v150[-v167 - 8] > v150 - 8)
            {
              v165 = v150;
              goto LABEL_146;
            }
            if ((unint64_t)(v150 - v161 - v156) < 0x20)
            {
              v165 = v150;
              goto LABEL_146;
            }
            v168 = (v164 >> 3) + 1;
            v169 = 8 * (v168 & 0x3FFFFFFFFFFFFFFCLL);
            v165 = &v150[-v169];
            v162 = (_QWORD *)((char *)v162 - v169);
            v170 = &v161[8 * v157 - 16];
            v171 = v150 - 16;
            v172 = v168 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v173 = *(_OWORD *)v171;
              *(v170 - 1) = *((_OWORD *)v171 - 1);
              *v170 = v173;
              v170 -= 2;
              v171 -= 32;
              v172 -= 4;
            }
            while (v172);
            if (v168 != (v168 & 0x3FFFFFFFFFFFFFFCLL))
            {
              do
              {
LABEL_146:
                v166 = *((_QWORD *)v165 - 1);
                v165 -= 8;
                *--v162 = v166;
              }
              while (v165 != v155);
            }
            v150 = (char *)v190;
            v190 = v162;
            v191 = v151;
            v192 = &v161[8 * v160];
            if (!v150)
              goto LABEL_129;
LABEL_151:
            operator delete(v150);
            goto LABEL_129;
          }
        }
        else
        {
          v161 = 0;
          v162 = (_QWORD *)(8 * v157);
          *(_QWORD *)(8 * v157) = NextResultAtOffset;
          v151 = 8 * v157 + 8;
          v163 = v150 - v155;
          if (v150 != v155)
            goto LABEL_144;
        }
        v190 = v162;
        v191 = v151;
        v192 = &v161[8 * v160];
        if (v150)
          goto LABEL_151;
      }
LABEL_129:
      v191 = v151;
      ++size;
      ++v138;
      v152 = v136 == v197.__r_.__value_.__r.__words[2] && size == v198;
      v150 = (char *)v151;
    }
    while (!v152);
  }
  v140 = *(_QWORD *)(v187 + 8);
  -[NSMutableArray objectAtIndexedSubscript:](v188->super._region->_blocks, "objectAtIndexedSubscript:", 0);
  v141 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v142 = v140 - 8;
  if (!v140)
    v142 = 0;
  v141[3] = v142;

  v143 = (char *)locationa[1];
  -[NSMutableArray objectAtIndexedSubscript:](v188->super._region->_blocks, "objectAtIndexedSubscript:", 1);
  v144 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v145 = v143 - 8;
  if (!v143)
    v145 = 0;
  v144[3] = v145;

  Results = mlir::pdl::ApplyNativeRewriteOp::getResults((mlir::pdl::ApplyNativeRewriteOp *)&v200);
  if (!v147)
    __assert_rtn("operator[]", "STLExtras.h", 1281, "Index < size() && \"invalid index for value range\");
  NextResultAtOffset = (uint64_t **)mlir::detail::OpResultImpl::getNextResultAtOffset(Results, 0);
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&NextResultAtOffset);
  if (v190)
    operator delete(v190);
  mlir::Block::~Block((mlir::Block *)&__dst);

  mlir::Block::~Block((mlir::Block *)v214);
  if (v201)
  {
    v202 = (char *)v201;
    operator delete(v201);
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
  objc_storeStrong((id *)&self->_trueResults, 0);
  objc_storeStrong((id *)&self->_falseResults, 0);
  objc_storeStrong(&self->_falseBlock, 0);
  objc_storeStrong(&self->_trueBlock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end
