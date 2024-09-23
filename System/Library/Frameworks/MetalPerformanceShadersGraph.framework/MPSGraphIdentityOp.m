@implementation MPSGraphIdentityOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  uint64_t v11;
  mlir::GenericProgramPoint *v12;
  void *DefiningOp;
  char *v15;
  void *__p[2];
  char v17;

  v10 = a7;
  mpsFileLoc("-[MPSGraphIdentityOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphTensorShapeOps.mm", __p);
  v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::IdentityOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x4E0u, v10);
  if (v17 < 0)
    operator delete(__p[0]);
  if (*((_QWORD *)a5 + 1) == *(_QWORD *)a5)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v12 = mlir::OpBuilder::create<mlir::mps::IdentityOp,mlir::Value>((mlir::OpBuilder *)a3, v11, *(uint64_t **)a5);
  if (!*((_DWORD *)v12 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v15 = (char *)v12 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v15);

  return DefiningOp;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  return a4;
}

@end
