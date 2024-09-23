@implementation MPSGraphConstantOp

- (MPSGraphConstantOp)initWithGraph:(id)a3 data:(id)a4 shape:(id)a5 dataType:(unsigned int)a6 isSplat:(BOOL)a7 name:(id)a8
{
  NSData *v14;
  id v15;
  id v16;
  id v17;
  NSData *data;
  NSData *v19;
  MPSGraphConstantOp *v20;
  objc_super v22;

  v14 = (NSData *)a4;
  objc_storeStrong((id *)&self->_shape, a5);
  v15 = a5;
  v16 = a8;
  v17 = a3;
  self->_dataType = a6;
  data = self->_data;
  self->_data = v14;
  v19 = v14;

  self->_isSplat = a7;
  v22.receiver = self;
  v22.super_class = (Class)MPSGraphConstantOp;
  v20 = -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](&v22, sel_initWithGraph_inputTensors_controlDependencies_name_, v17, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v16);

  return v20;
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v10;
  uint64_t v11;
  uint64_t **MLIRType;
  NSData *data;
  void *DefiningOp;
  const char *v16;
  int v17;
  const char *v18;
  const char *v19;
  uint64_t ConstantOp;
  void *__p[2];
  char v22;

  v10 = a7;
  mpsFileLoc("-[MPSGraphConstantOp makeMLIROpWithBuilder:symbolTable:inputValues:opInitialization:name:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/Operations/MPSGraphMemoryOps.mm", __p);
  v11 = MPSSymbolTable::getLocationByInsertingOp<mlir::mps::ConstantOp>((uint64_t)a4, (mlir::StringAttr **)a3, (uint64_t)__p, 0xA5u, v10);
  if (v22 < 0)
    operator delete(__p[0]);
  MLIRType = getMLIRType((mlir::MLIRContext **)a3, self->_shape, (mlir::MLIRContext *)self->_dataType);
  if (!*MLIRType)
  {
    v16 = "abstractType && \"Malformed type storage object.\";
    v17 = 160;
    v18 = "TypeSupport.h";
    v19 = "getAbstractType";
    goto LABEL_8;
  }
  if ((_UNKNOWN *)(*MLIRType)[17] != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id)
  {
    v16 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\";
    v17 = 566;
    v18 = "Casting.h";
    v19 = "cast";
LABEL_8:
    __assert_rtn(v19, v18, v17, v16);
  }
  ConstantOp = createConstantOp((mlir::OpBuilder *)a3, v11, self->_data, MLIRType, self->_isSplat);
  data = self->_data;
  self->_data = 0;

  DefiningOp = (void *)mlir::Value::getDefiningOp((mlir::Value *)&ConstantOp);
  return DefiningOp;
}

- (NSArray)shape
{
  return self->_shape;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
