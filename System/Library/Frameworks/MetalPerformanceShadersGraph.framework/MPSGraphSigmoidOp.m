@implementation MPSGraphSigmoidOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *DefiningOp;
  uint64_t v15;
  void *__p[2];
  char v17;

  v10 = a7;
  mpsFileLoc("-[MPSGraphSigmoidOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphActivationOps.mm", __p);
  v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ReluOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x91u, v10);
  if (v17 < 0)
    operator delete(__p[0]);
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v12 = mlir::OpBuilder::create<mlir::mps::SigmoidOp,mlir::Value &>((mlir::OpBuilder *)a3, v11, *(uint64_t **)a5);
  if (!*(_DWORD *)(v12 + 36))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v15 = v12 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v15);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  MPSGraph **p_graph;
  id WeakRetained;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  id v18;
  __CFString *v19;
  void *v20;
  id v21;
  __CFString *v22;
  void *v23;
  id v24;
  __CFString *v25;
  void *v26;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  p_graph = &self->super._graph;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  objc_msgSend(WeakRetained, "constantWithScalar:shape:dataType:", &unk_1E0E9B338, objc_msgSend(v9, "dataType"), 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained((id *)p_graph);
  if (v11)
  {
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/sigmoid"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("sigmoidGrad/sigmoid");
  }
  objc_msgSend(v15, "sigmoidWithTensor:name:", v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    v18 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/subtraction"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v18 = objc_loadWeakRetained((id *)p_graph);
    v19 = CFSTR("sigmoidGrad/subtraction");
  }
  objc_msgSend(v18, "subtractionWithPrimaryTensor:secondaryTensor:name:", v14, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    v21 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/multiplication"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v21 = objc_loadWeakRetained((id *)p_graph);
    v22 = CFSTR("sigmoidGrad/multiplication");
  }
  objc_msgSend(v21, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v20, v17, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    v24 = objc_loadWeakRetained((id *)p_graph);
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/multiplication_1"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v24 = objc_loadWeakRetained((id *)p_graph);
    v25 = CFSTR("sigmoidGrad/multiplication_1");
  }
  objc_msgSend(v24, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v10, v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  return v26;
}

@end
