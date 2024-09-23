@implementation MPSGraphGatherOp

- (MPSGraphGatherOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 axis:(int64_t)a6 batchDimensions:(unint64_t)a7 name:(id)a8
{
  self->_axis = a6;
  self->_batchDims = a7;
  self->_allowNegativeIndices = 0;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a8);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *DefiningOp;
  uint64_t v16;
  void *__p[2];
  char v18;

  v11 = a7;
  mpsFileLoc("-[MPSGraphGatherOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphGatherOps.mm", __p);
  v12 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::GatherOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x89u, v11);
  if (v18 < 0)
    operator delete(__p[0]);
  if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 <= 0x10uLL)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v13 = mlir::OpBuilder::create<mlir::mps::GatherOp,mlir::Value &,mlir::Value &,mlir::Value &,unsigned long &,BOOL &>((mlir::Builder *)a3, v12, *(uint64_t **)a5, (uint64_t *)(*(_QWORD *)a5 + 8), (uint64_t *)(*(_QWORD *)a5 + 16), (unsigned int *)&self->_batchDims, (unsigned __int8 *)&self->_allowNegativeIndices);
  if (!*(_DWORD *)(v13 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v16 = v13 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v16);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t batchDims;
  void *v18;
  void *v19;
  int64_t axis;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id WeakRetained;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id *location;
  int64_t v49;
  void *v50;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v9)
  {
    v14 = 0;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v9, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = isStaticShape(v15);

  if (v16)
  {
    batchDims = self->_batchDims;
    v46 = v10;
    v47 = v11;
    v45 = v10;
    -[MPSGraphOperation inputTensors](self, "inputTensors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = batchDims;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    axis = self->_axis;
    v21 = self->_batchDims;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v19, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = axis - v21;

    if (axis != v21)
    {
      v26 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26 + self->_batchDims);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v27);

        objc_msgSend(v9, "shape");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", v26 + self->_batchDims);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "insertObject:atIndex:", v29, v26 + self->_batchDims);

        ++v26;
      }
      while (v25 != v26);
    }
    objc_msgSend(v50, "addObject:", &unk_1E0E98A88);
    objc_msgSend(v24, "addObject:", &unk_1E0E98AA0);
    location = (id *)&self->super._graph;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
    v31 = (void *)MEMORY[0x1E0CB3940];
    v11 = v47;
    v12 = v45;
    -[MPSGraphOperation name](self, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@/%@/expandDims"), v47, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "expandDimsOfTensor:axes:name:", v19, v50, v33);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 < 1)
    {
      v13 = v44;
    }
    else
    {
      v49 = self->_axis;
      v34 = objc_loadWeakRetained(location);
      v35 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%@/%@/broadcast"), v47, v43);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "broadcastTensor:toShape:name:", v44, v24, v36);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    v37 = objc_loadWeakRetained(location);
    objc_msgSend(v9, "shape");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1E0CB3940];
    -[MPSGraphOperation name](self, "name");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%@/%@/scatterND"), v47, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "scatterNDWithUpdatesTensor:indicesTensor:shape:batchDimensions:name:", v45, v13, v38, v49, v41);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v46;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

@end
