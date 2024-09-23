@implementation MPSGraphConcatOp

- (MPSGraphConcatOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dimension:(int64_t)a6 interleave:(BOOL)a7 name:(id)a8
{
  self->_dimensionIndex = a6;
  self->_interleave = a7;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a8);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  id v12;
  uint64_t StringAttr;
  uint64_t v14;
  const char *v15;
  size_t v16;
  size_t v17;
  int8x16_t *p_dst;
  uint64_t v19;
  uint64_t v20;
  std::string *p_p;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *DefiningOp;
  void *v29[2];
  char v30;
  std::string __p;
  int8x16_t __dst;
  unint64_t v33;
  uint64_t v34[4];
  __int16 v35;

  v11 = a7;
  mpsFileLoc("-[MPSGraphConcatOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", v29);
  v12 = v11;
  v35 = 260;
  v34[0] = (uint64_t)v29;
  StringAttr = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  v14 = mlir::FileLineColLoc::get(StringAttr, 0x2CCu, 0);
  if (!v14)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if (!v12)
  {
    HIBYTE(v33) = 10;
    strcpy(__dst.i8, "mps.concat");
    goto LABEL_13;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    p_dst = (int8x16_t *)operator new(v19 + 1);
    __dst.i64[1] = v17;
    v33 = v20 | 0x8000000000000000;
    __dst.i64[0] = (uint64_t)p_dst;
  }
  else
  {
    HIBYTE(v33) = v16;
    p_dst = &__dst;
    if (!v16)
      goto LABEL_12;
  }
  memmove(p_dst, v15, v17);
LABEL_12:
  p_dst->i8[v17] = 0;
LABEL_13:
  MPSSymbolTable::insertOpInSymbolTable((uint64_t)a4, &__dst, &__p);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  v22 = 1;
  HIBYTE(v35) = 1;
  if (p_p->__r_.__value_.__s.__data_[0])
  {
    v34[0] = (uint64_t)p_p;
    v22 = 3;
  }
  LOBYTE(v35) = v22;
  v23 = mlir::Builder::getStringAttr((mlir::StringAttr **)a3, (mlir::MLIRContext *)v34);
  v24 = mlir::NameLoc::get(v23, v14);
  if (!v24)
    __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v33) & 0x80000000) == 0)
      goto LABEL_20;
LABEL_24:
    operator delete((void *)__dst.i64[0]);

    if ((v30 & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_25;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v33) < 0)
    goto LABEL_24;
LABEL_20:

  if ((v30 & 0x80000000) == 0)
    goto LABEL_21;
LABEL_25:
  operator delete(v29[0]);
LABEL_21:
  v25 = *((_QWORD *)a5 + 1);
  v34[0] = *(_QWORD *)(v25 - 8);
  *((_QWORD *)a5 + 1) = v25 - 8;
  v26 = mlir::OpBuilder::create<mlir::mps::ConcatOp,std::vector<mlir::Value> &,mlir::Value&,BOOL &>((mlir::UnitAttr **)a3, v24, (uint64_t *)a5, v34, (unsigned __int8 *)&self->_interleave);
  if (!*(_DWORD *)(v26 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  __dst.i64[0] = v26 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&__dst);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 interleave;
  BOOL v22;
  int v23;
  char *v24;
  unint64_t v25;
  char *v26;
  char *i;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  __int128 v52;
  id *p_graph;
  id WeakRetained;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  int v83;
  MPSGraphConcatOp *v84;
  char *v85;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v84 = self;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count") - 1;

  if (v14 == a5)
  {
    v15 = 0;
    goto LABEL_50;
  }
  v78 = v11;
  v79 = v10;
  v80 = v12;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  v77 = a5;

  v20 = (v19 & (v84->_dimensionIndex >> 63)) + v84->_dimensionIndex;
  interleave = v84->_interleave;
  v22 = v84->_interleave && v20 == v19 - 1;
  v23 = !v22;
  v83 = v23;
  v24 = (char *)operator new(8uLL);
  v25 = 0;
  *(_QWORD *)v24 = 0;
  v26 = v24 + 8;
  v82 = v20 + interleave;
  v85 = v24;
  for (i = v24 + 8; ; i = (char *)v28)
  {
    -[MPSGraphOperation inputTensors](v84, "inputTensors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count") - 1;

    if (v25 >= v30)
      break;
    if (v83)
    {
      -[MPSGraphOperation inputTensors](v84, "inputTensors");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "shape");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", v82);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "integerValue");

      v36 = *((_QWORD *)i - 1) + v35;
      if (i < v26)
        goto LABEL_10;
    }
    else
    {
      v36 = *((_QWORD *)i - 1) + 1;
      if (i < v26)
      {
LABEL_10:
        *(_QWORD *)i = v36;
        v28 = (uint64_t)(i + 8);
        goto LABEL_11;
      }
    }
    v37 = v85;
    v38 = (i - v85) >> 3;
    v39 = v38 + 1;
    if ((unint64_t)(v38 + 1) >> 61)
      std::vector<long>::__throw_length_error[abi:ne180100]();
    if ((v26 - v85) >> 2 > v39)
      v39 = (v26 - v85) >> 2;
    if ((unint64_t)(v26 - v85) >= 0x7FFFFFFFFFFFFFF8)
      v40 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v40 = v39;
    if (v40)
    {
      if (v40 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v41 = (char *)operator new(8 * v40);
      v24 = &v41[8 * v38];
      *(_QWORD *)v24 = v36;
      v28 = (uint64_t)(v24 + 8);
      v42 = (char *)(i - v85);
      if (i == v85)
        goto LABEL_31;
    }
    else
    {
      v41 = 0;
      v24 = (char *)(8 * v38);
      *(_QWORD *)(8 * v38) = v36;
      v28 = 8 * v38 + 8;
      v42 = (char *)(i - v85);
      if (i == v85)
        goto LABEL_31;
    }
    v43 = (unint64_t)(v42 - 8);
    if (v43 < 0x168)
    {
      v44 = i;
      goto LABEL_30;
    }
    v46 = (i - 8 - v85) & 0xFFFFFFFFFFFFFFF8;
    if (&v41[i - v85 - 8 - v46] > &v41[i - v85 - 8])
    {
      v44 = i;
      do
      {
LABEL_30:
        v45 = *((_QWORD *)v44 - 1);
        v44 -= 8;
        *((_QWORD *)v24 - 1) = v45;
        v24 -= 8;
      }
      while (v44 != v85);
      goto LABEL_31;
    }
    if (&i[-v46 - 8] > i - 8)
    {
      v44 = i;
      goto LABEL_30;
    }
    if ((unint64_t)(v85 - v41) < 0x20)
    {
      v44 = i;
      goto LABEL_30;
    }
    v47 = (v43 >> 3) + 1;
    v48 = 8 * (v47 & 0x3FFFFFFFFFFFFFFCLL);
    v44 = &i[-v48];
    v24 -= v48;
    v49 = &v41[8 * v38 - 16];
    v50 = i - 16;
    v51 = v47 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v52 = *(_OWORD *)v50;
      *((_OWORD *)v49 - 1) = *((_OWORD *)v50 - 1);
      *(_OWORD *)v49 = v52;
      v49 -= 32;
      v50 -= 32;
      v51 -= 4;
    }
    while (v51);
    if (v47 != (v47 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_30;
LABEL_31:
    v26 = &v41[8 * v40];
    v85 = v24;
    if (v37)
      operator delete(v37);
LABEL_11:
    ++v25;
  }
  v11 = v78;
  v81 = v78;
  if ((v83 & 1) != 0)
  {
    p_graph = (id *)&v84->super._graph;
    WeakRetained = objc_loadWeakRetained((id *)&v84->super._graph);
    v55 = *(_QWORD *)&v24[8 * v77];
    v10 = v79;
    objc_msgSend(v79, "shape");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "objectAtIndexedSubscript:", v82);
    v77 = objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend((id)v77, "integerValue");
  }
  else
  {
    v10 = v79;
    -[MPSGraphOperation inputTensors](v84, "inputTensors");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "shape");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v59, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)i - 1));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setObject:atIndexedSubscript:", v61, v82);

    p_graph = (id *)&v84->super._graph;
    v62 = objc_loadWeakRetained((id *)&v84->super._graph);
    v63 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](v84, "name");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringWithFormat:", CFSTR("%@/%@/reshape1"), v80, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "reshapeTensor:withShape:name:", v81, v60, v65);
    v66 = objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&v84->super._graph);
    v55 = *(_QWORD *)&v24[8 * v77];
    v56 = 1;
    v81 = (id)v66;
  }
  v67 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](v84, "name");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "stringWithFormat:", CFSTR("%@/%@/slice"), v80, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sliceTensor:dimension:start:length:name:", v81, v82, v55, v56, v69);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v83 & 1) != 0)
  {
    v12 = v80;
    v70 = v76;
  }
  else
  {

    WeakRetained = objc_loadWeakRetained(p_graph);
    v12 = v80;
    objc_msgSend(v10, "shape");
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](v84, "name");
    v77 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)v71;
    objc_msgSend(v72, "stringWithFormat:", CFSTR("%@/%@/reshape2"), v80, v77);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reshapeTensor:withShape:name:", v15, v71, v73);
    v74 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v74;
  }

  operator delete(v24);
LABEL_50:

  return v15;
}

@end
