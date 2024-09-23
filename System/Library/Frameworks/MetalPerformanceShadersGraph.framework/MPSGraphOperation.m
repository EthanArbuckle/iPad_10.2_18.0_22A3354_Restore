@implementation MPSGraphOperation

- (NSArray)controlDependencies
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_controlDependencies);
}

- (MPSGraphOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPSGraphOperation;
  return -[MPSGraphOperation init](&v3, sel_init);
}

- (MPSGraphOperation)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 name:(id)a6
{
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:region:name:](self, "initWithGraph:inputTensors:controlDependencies:region:name:", a3, a4, a5, 0, a6);
}

- (MPSGraphOperation)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 region:(id)a6 name:(id)a7
{
  char *v12;
  MPSGraphOperation *v13;
  void *v14;
  id *WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *controlDependencies;
  MPSGraphRegion *region;
  unint64_t i;
  id *v22;
  char *v23;
  void *v24;
  char isKindOfClass;
  id v26;
  uint64_t v27;
  objc_class *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *inputTensors;
  unint64_t v33;
  uint64_t v34;
  MPSGraphOperation *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  _BYTE *v40;
  int64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  _BYTE *v46;
  uint64_t *v47;
  int64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  _OWORD *v54;
  __int128 *v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  unsigned int *mlirOperation;
  uint64_t v66;
  MPSGraphTensor *v67;
  id v68;
  id v69;
  _DWORD *v70;
  MPSGraphTensor *v71;
  id v72;
  id v73;
  _DWORD *v74;
  MPSGraphTensor *v75;
  id v76;
  id v77;
  _DWORD *v78;
  MPSGraphTensor *v79;
  id v80;
  id v81;
  _DWORD *v82;
  MPSGraphTensor *v83;
  id v84;
  id v85;
  _DWORD *v86;
  MPSGraphTensor *v87;
  id v88;
  id v89;
  uint64_t v90;
  unint64_t v91;
  unsigned int *v92;
  MPSGraphTensor *v93;
  id v94;
  id v95;
  id v96;
  id *v97;
  MPSGraphOperation *v98;
  const char *v100;
  int v101;
  const char *v102;
  const char *v103;
  id *location;
  id v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  id *p_parentBlock;
  id *p_name;
  void *v113;
  char *v114;
  void *v115;
  uint64_t Value;
  uint64_t v117;
  void *__p;
  char *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  objc_super v126;

  v12 = (char *)a3;
  v110 = a4;
  v109 = a5;
  v106 = a6;
  v105 = a7;
  v126.receiver = self;
  v126.super_class = (Class)MPSGraphOperation;
  v13 = -[MPSGraphOperation init](&v126, sel_init);
  v121 = 0x2B2B07D42B2B07D0;
  v122 = v12;
  v123 = 0;
  v124 = 0;
  v125 = 0;
  kdebug_trace();
  objc_storeWeak((id *)&v13->_graph, v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v110);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)&v13->_graph;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&v13->_graph);
  v114 = v12;
  v115 = v14;
  objc_msgSend(WeakRetained[21], "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v109);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "mutableCopy");
  controlDependencies = v13->_controlDependencies;
  v13->_controlDependencies = (NSMutableArray *)v18;

  p_name = (id *)&v13->_name;
  objc_storeStrong((id *)&v13->_name, a7);
  v13->_stopGradient = 0;
  objc_storeStrong((id *)&v13->_region, a6);
  region = v13->_region;
  if (region)
    objc_storeWeak((id *)&region->_parentOp, v13);
  p_parentBlock = (id *)&v13->_parentBlock;
  objc_storeWeak((id *)&v13->_parentBlock, *((id *)v12 + 22));
  for (i = 0; i < objc_msgSend(v14, "count"); ++i)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", i);
    v22 = (id *)objc_claimAutoreleasedReturnValue();

    v23 = (char *)objc_loadWeakRetained(v22 + 3);
    if (v23 != v12 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
    objc_msgSend(v22, "operation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = *p_name;
          if (*p_name)
          {
            objc_msgSend(*p_name, "stringByAppendingString:", CFSTR("/readVariable"));
            v27 = objc_claimAutoreleasedReturnValue();
            v113 = (void *)v27;
          }
          else
          {
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "stringByAppendingString:", CFSTR("/readVariable"));
            v27 = objc_claimAutoreleasedReturnValue();
            v107 = (void *)v27;
          }
          objc_msgSend(v12, "readVariable:name:", v22, v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v113;
          if (!v26)
          {

            v30 = v108;
          }

          objc_msgSend(v14, "setObject:atIndexedSubscript:", v29, i);
        }
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v14);
  v31 = objc_claimAutoreleasedReturnValue();
  inputTensors = v13->_inputTensors;
  v13->_inputTensors = (NSArray *)v31;

  v33 = 0;
  __p = 0;
  v119 = 0;
  v120 = 0;
  while (v33 < -[NSArray count](v13->_inputTensors, "count"))
  {
    v35 = v13;
    -[NSArray objectAtIndexedSubscript:](v13->_inputTensors, "objectAtIndexedSubscript:", v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "value");
    v38 = v37;
    v39 = v119;
    if (v119 < v120)
    {
      *(_QWORD *)v119 = v37;
      v34 = (uint64_t)(v39 + 8);
      v12 = v114;
      goto LABEL_20;
    }
    v40 = __p;
    v41 = v119 - (_BYTE *)__p;
    v42 = (v119 - (_BYTE *)__p) >> 3;
    v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 61)
      std::vector<long>::__throw_length_error[abi:ne180100]();
    v44 = v120 - (_BYTE *)__p;
    if ((v120 - (_BYTE *)__p) >> 2 > v43)
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
      v47 = (uint64_t *)&v46[8 * v42];
      *v47 = v38;
      v34 = (uint64_t)(v47 + 1);
      v48 = v39 - v40;
      if (v39 != v40)
      {
LABEL_32:
        v49 = v48 - 8;
        if (v49 < 0x58)
        {
          v13 = v35;
          goto LABEL_41;
        }
        v50 = v39 - &v46[v41];
        v13 = v35;
        if (v50 < 0x20)
          goto LABEL_74;
        v51 = (v49 >> 3) + 1;
        v52 = 8 * (v51 & 0x3FFFFFFFFFFFFFFCLL);
        v53 = &v39[-v52];
        v47 = (uint64_t *)((char *)v47 - v52);
        v54 = &v46[8 * v42 - 16];
        v55 = (__int128 *)(v39 - 16);
        v56 = v51 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v57 = *v55;
          *(v54 - 1) = *(v55 - 1);
          *v54 = v57;
          v54 -= 2;
          v55 -= 2;
          v56 -= 4;
        }
        while (v56);
        v39 = v53;
        if (v51 != (v51 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_74:
          do
          {
LABEL_41:
            v58 = *((_QWORD *)v39 - 1);
            v39 -= 8;
            *--v47 = v58;
          }
          while (v39 != v40);
        }
        v39 = __p;
        __p = v47;
        v119 = (char *)v34;
        v120 = &v46[8 * v45];
        v12 = v114;
        if (!v39)
          goto LABEL_20;
LABEL_43:
        operator delete(v39);
        goto LABEL_20;
      }
    }
    else
    {
      v46 = 0;
      v47 = (uint64_t *)(8 * v42);
      *(_QWORD *)(8 * v42) = v38;
      v34 = 8 * v42 + 8;
      v48 = v39 - v40;
      if (v39 != v40)
        goto LABEL_32;
    }
    v13 = v35;
    __p = v47;
    v119 = (char *)v34;
    v120 = &v46[8 * v45];
    v12 = v114;
    if (v39)
      goto LABEL_43;
LABEL_20:
    v119 = (char *)v34;

    ++v33;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v12 + 104));
  v59 = objc_loadWeakRetained(location);
  v13->_mlirOperation = -[MPSGraphOperation makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:](v13, "makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:", v59[7], v59[9], &__p, 1, *p_name);

  v60 = *((_QWORD *)v13->_mlirOperation + 3);
  if (!*(_QWORD *)v60)
  {
    v100 = "abstractAttribute && \"Malformed attribute storage object.\";
    v101 = 165;
    v102 = "AttributeSupport.h";
    v103 = "getAbstractAttribute";
    goto LABEL_68;
  }
  if (*(_UNKNOWN **)(*(_QWORD *)v60 + 136) != &mlir::detail::TypeIDResolver<mlir::NameLoc,void>::id)
  {
    v100 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v101 = 566;
    v102 = "Casting.h";
    v103 = "cast";
LABEL_68:
    __assert_rtn(v103, v102, v101, v100);
  }
  v117 = *((_QWORD *)v13->_mlirOperation + 3);
  v61 = (void *)MEMORY[0x1E0CB3940];
  Value = mlir::AffineMapAttr::getValue((mlir::AffineMapAttr *)&v117);
  objc_msgSend(v61, "stringWithUTF8String:", mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&Value));
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = *p_name;
  *p_name = (id)v62;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  mlirOperation = (unsigned int *)v13->_mlirOperation;
  v66 = mlirOperation[9];
  if ((int)v66 >= 1)
  {
    v67 = [MPSGraphTensor alloc];
    v68 = objc_loadWeakRetained(p_parentBlock);
    v69 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v67, "initTensorWithOperation:value:graph:parentBlock:name:", v13, mlirOperation - 4, v12, v68, *p_name);

    objc_msgSend(v64, "addObject:", v69);
    if ((_DWORD)v66 != 1)
    {
      v70 = v13->_mlirOperation;
      if (v70[9] < 2u)
        goto LABEL_69;
      v71 = [MPSGraphTensor alloc];
      v72 = objc_loadWeakRetained(p_parentBlock);
      v73 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v71, "initTensorWithOperation:value:graph:parentBlock:name:", v13, v70 - 8, v12, v72, *p_name);

      objc_msgSend(v64, "addObject:", v73);
      if ((_DWORD)v66 != 2)
      {
        v74 = v13->_mlirOperation;
        if (v74[9] < 3u)
          goto LABEL_69;
        v75 = [MPSGraphTensor alloc];
        v76 = objc_loadWeakRetained(p_parentBlock);
        v77 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v75, "initTensorWithOperation:value:graph:parentBlock:name:", v13, v74 - 12, v12, v76, *p_name);

        objc_msgSend(v64, "addObject:", v77);
        if ((_DWORD)v66 != 3)
        {
          v78 = v13->_mlirOperation;
          if (v78[9] < 4u)
            goto LABEL_69;
          v79 = [MPSGraphTensor alloc];
          v80 = objc_loadWeakRetained(p_parentBlock);
          v81 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v79, "initTensorWithOperation:value:graph:parentBlock:name:", v13, v78 - 16, v12, v80, *p_name);

          objc_msgSend(v64, "addObject:", v81);
          if ((_DWORD)v66 != 4)
          {
            v82 = v13->_mlirOperation;
            if (v82[9] < 5u)
              goto LABEL_69;
            v83 = [MPSGraphTensor alloc];
            v84 = objc_loadWeakRetained(p_parentBlock);
            v85 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v83, "initTensorWithOperation:value:graph:parentBlock:name:", v13, v82 - 20, v12, v84, *p_name);

            objc_msgSend(v64, "addObject:", v85);
            if ((_DWORD)v66 != 5)
            {
              v86 = v13->_mlirOperation;
              if (v86[9] < 6u)
                goto LABEL_69;
              v87 = [MPSGraphTensor alloc];
              v88 = objc_loadWeakRetained(p_parentBlock);
              v89 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v87, "initTensorWithOperation:value:graph:parentBlock:name:", v13, v86 - 24, v12, v88, *p_name);

              objc_msgSend(v64, "addObject:", v89);
              if ((_DWORD)v66 != 6)
              {
                v90 = 0x3FFFFFFFFFFFFFE2;
                v91 = 6;
                while (1)
                {
                  v92 = (unsigned int *)v13->_mlirOperation;
                  if (v91 >= v92[9])
                    break;
                  v93 = [MPSGraphTensor alloc];
                  v94 = objc_loadWeakRetained(p_parentBlock);
                  v95 = -[MPSGraphTensor initTensorWithOperation:value:graph:parentBlock:name:](v93, "initTensorWithOperation:value:graph:parentBlock:name:", v13, &v92[v90], v12, v94, *p_name);

                  objc_msgSend(v64, "addObject:", v95);
                  ++v91;
                  v90 -= 6;
                  if (v66 == v91)
                    goto LABEL_61;
                }
LABEL_69:
                __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
              }
            }
          }
        }
      }
    }
  }
LABEL_61:
  objc_storeStrong((id *)&v13->_outputTensors, v64);
  objc_msgSend(*((id *)v12 + 10), "addObject:", v13);
  v96 = objc_loadWeakRetained(p_parentBlock);

  if (v96)
  {
    v97 = (id *)objc_loadWeakRetained(p_parentBlock);
    objc_msgSend(v97[2], "addObject:", v13);

  }
  pthread_mutex_unlock((pthread_mutex_t *)(v12 + 104));
  v98 = v13;

  if (__p)
  {
    v119 = (char *)__p;
    operator delete(__p);
  }

  kdebug_trace();
  return v98;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphOperation *v3;
  MPSGraphOperation *v4;
  MPSGraphOperation *v5;

  v3 = self;
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  return 0;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  void *v6;

  -[MPSGraphOperation graph](self, "graph", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dump");

  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  return 0;
}

- (id)partialDerivativesForInputTensors:(id)a3 incomingGradients:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t i;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v8 = a3;
  v9 = a4;
  v21 = a5;
  if (objc_msgSend(v9, "count") == 1)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    for (i = 0; i < objc_msgSend(v8, "count"); ++i)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("gradient for %@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSGraphOperation partialDerivativeForInputTensor:incomingGradient:inputIndex:name:](self, "partialDerivativeForInputTensor:incomingGradient:inputIndex:name:", v14, v15, i, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "addObject:", v19);

    }
  }
  else
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
    v10 = 0;
  }

  return v10;
}

- (void)partialDerivateForCFOpWithAutodiff:(Autodiff *)a3
{
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
}

- (BOOL)recurseFromBlock:(id)a3 onEscaped:(id)a4 withAutodiff:(Autodiff *)a5
{
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  return 0;
}

- (BOOL)recurseOnBlocksFromOutput:(id)a3 withAutodiff:(Autodiff *)a4
{
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  return 0;
}

- (BOOL)recurseOutFromBlockInput:(id)a3 withAutodiff:(Autodiff *)a4
{
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
  return 0;
}

- (NSArray)inputTensors
{
  return self->_inputTensors;
}

- (NSArray)outputTensors
{
  return self->_outputTensors;
}

- (NSString)name
{
  return self->_name;
}

- (MPSGraph)graph
{
  return (MPSGraph *)objc_loadWeakRetained((id *)&self->_graph);
}

- (BOOL)pruneOp
{
  return self->_pruneOp;
}

- (void)setPruneOp:(BOOL)a3
{
  self->_pruneOp = a3;
}

- (NSMutableDictionary)tensorNameDict
{
  return self->_tensorNameDict;
}

- (void)setTensorNameDict:(id)a3
{
  objc_storeStrong((id *)&self->_tensorNameDict, a3);
}

- (BOOL)stopGradient
{
  return self->_stopGradient;
}

- (void)setStopGradient:(BOOL)a3
{
  self->_stopGradient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tensorNameDict, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_parentBlock);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_controlDependencies, 0);
  objc_storeStrong((id *)&self->_outputTensors, 0);
  objc_storeStrong((id *)&self->_inputTensors, 0);
  objc_destroyWeak((id *)&self->_graph);
}

@end
