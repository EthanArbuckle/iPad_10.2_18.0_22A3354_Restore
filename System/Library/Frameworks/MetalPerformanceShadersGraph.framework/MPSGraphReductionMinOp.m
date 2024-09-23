@implementation MPSGraphReductionMinOp

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  mlir::GenericProgramPoint *v15;
  void *DefiningOp;
  unsigned __int8 v18;
  unsigned __int8 v19;
  char *v20;
  uint64_t v21;
  void *__p[2];
  char v23;

  v10 = a7;
  mpsFileLoc("-[MPSGraphReductionMinOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphReductionOps.mm", __p);
  v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ReductionMinOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x60u, v10);
  if (v23 < 0)
  {
    operator delete(__p[0]);
    v12 = *(uint64_t **)a5;
    v13 = (uint64_t *)*((_QWORD *)a5 + 1);
    if ((unint64_t)v13 - *(_QWORD *)a5 >= 9)
      goto LABEL_3;
  }
  else
  {
    v12 = *(uint64_t **)a5;
    v13 = (uint64_t *)*((_QWORD *)a5 + 1);
    if ((unint64_t)v13 - *(_QWORD *)a5 >= 9)
    {
LABEL_3:
      v14 = v12[1];
      goto LABEL_6;
    }
  }
  v14 = 0;
LABEL_6:
  v21 = v14;
  if (v13 == v12)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v19 = 1;
  v18 = 0;
  v15 = mlir::OpBuilder::create<mlir::mps::ReductionMinOp,mlir::Value &,mlir::Value &,BOOL,BOOL>((mlir::UnitAttr **)a3, v11, v12, &v21, &v19, &v18);
  if (!*((_DWORD *)v15 + 9))
    __assert_rtn("getOpResultImpl", "Operation.h", 984, "resultNumber < getNumResults() && \"Result number is out of range for operation\");
  v20 = (char *)v15 - 16;
  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&v20);

  return DefiningOp;
}

@end
