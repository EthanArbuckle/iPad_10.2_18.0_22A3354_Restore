@implementation MPSGraphDequantizeOp

- (MPSGraphDequantizeOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataType:(unsigned int)a6 axis:(id)a7 name:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphDequantizeOp *v17;

  *(&self->_dataType + 1) = a6;
  objc_storeStrong((id *)&self->_axis, a7);
  v13 = a8;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", v16, v15, v14, v13);

  return v17;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  uint64_t MLIRElementType;
  uint64_t IntegerType;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *__p[2];
  char v22;
  uint64_t v23;
  uint64_t v24;

  v11 = a7;
  MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)a3, (mlir::MLIRContext *)*(&self->_dataType + 1));
  v23 = 0;
  v24 = mlir::TypeAttr::get(MLIRElementType);
  if (self->_axis)
  {
    IntegerType = mlir::Builder::getIntegerType((mlir::Builder *)a3, 0x20u, 1);
    v23 = mlir::IntegerAttr::get(IntegerType, -[NSNumber intValue](self->_axis, "intValue"));
  }
  mpsFileLoc("-[MPSGraphDequantizeOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphQuantizationOps.mm", __p);
  v14 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::DequantizeOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0x74u, v11);
  if (v22 < 0)
  {
    operator delete(__p[0]);
    v15 = *(uint64_t **)a5;
    v16 = (uint64_t *)*((_QWORD *)a5 + 1);
    v17 = (unint64_t)v16 - *(_QWORD *)a5;
    if (v17 == 24)
      goto LABEL_5;
  }
  else
  {
    v15 = *(uint64_t **)a5;
    v16 = (uint64_t *)*((_QWORD *)a5 + 1);
    v17 = (unint64_t)v16 - *(_QWORD *)a5;
    if (v17 == 24)
    {
LABEL_5:
      v18 = mlir::OpBuilder::create<mlir::mps::DequantizeOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::TypeAttr &,mlir::IntegerAttr &>((mlir::Float32Type **)a3, v14, v15, v15 + 1, v15 + 2, &v24, &v23);
      goto LABEL_10;
    }
  }
  if (v16 == v15 || v17 <= 0x18)
    std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
  v18 = mlir::OpBuilder::create<mlir::mps::DequantizeOp,mlir::Value &,mlir::Value &,mlir::Value &,mlir::Value &,mlir::TypeAttr &,mlir::IntegerAttr &>((mlir::UnknownLoc **)a3, v14, v15, v15 + 1, v15 + 2, v15 + 3, &v24, &v23);
LABEL_10:
  v19 = (void *)v18;

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axis, 0);
}

@end
