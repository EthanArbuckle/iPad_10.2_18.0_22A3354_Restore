@implementation MPSGraphArithmeticOp

- (MPSGraphArithmeticOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 mathOpType:(unint64_t)a6 name:(id)a7
{
  self->_mathOpType = a6;
  return -[MPSGraphOperation initWithGraph:inputTensors:controlDependencies:name:](self, "initWithGraph:inputTensors:controlDependencies:name:", a3, a4, a5, a7);
}

- (void)makeMLIROpWithBuilder:(void *)a3 symbolTable:(void *)a4 inputValues:(void *)a5 opInitialization:(BOOL)a6 name:(id)a7
{
  id v11;
  void *IsInfinite;

  v11 = a7;
  switch(self->_mathOpType)
  {
    case 0uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::IdentityOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t)a5, v11);
      goto LABEL_76;
    case 1uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ExponentOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 2uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ExponentBase2Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 3uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ExponentBase10Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 4uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::LogarithmOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 5uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::LogarithmBase2Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 6uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::LogarithmBase10Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 7uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SquareOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 8uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SquareRootOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 9uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ReciprocalSquareRootOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xAuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ReciprocalOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xBuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::AbsoluteOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xCuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::AbsoluteSquareOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xDuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::NegativeOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xEuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SignOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0xFuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SignbitOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x10uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::CeilOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x11uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::FloorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x12uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::RoundOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x13uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::RintOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x14uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SinOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x15uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::CosOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x16uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::TanOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x17uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::SinhOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x18uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::CoshOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x19uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::TanhOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1AuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ASinOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1BuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ACosOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1CuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ATanOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1DuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ASinhOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1EuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ACoshOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x1FuLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ATanhOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x20uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::NotOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x21uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::IsInfiniteOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x22uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::IsFiniteOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x23uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::IsNaNOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x24uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ErfOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x25uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::BitwiseNotOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x26uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::BitwisePopcountOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x27uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ConjugateOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x28uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::RealPartOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x29uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::ImaginaryPartOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2AuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::AddOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2BuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::SubtractOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2CuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::MultiplyOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2DuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::DivideOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2EuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::ModuloOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x2FuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::PowerOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x30uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::MinimumOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x31uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::MaximumOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x32uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::EqualToOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x33uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::NotEqualToOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x34uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::LessThanOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x35uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::LessThanOrEqualToOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x36uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::GreaterThanOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x37uLL:
      IsInfinite = (void *)createBinaryCmpArithmeticOp<mlir::mps::GreaterThanOrEqualToOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x38uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::AndOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x39uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::OrOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3AuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::NandOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3BuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::NorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3CuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::XorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3DuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::XnorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3EuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::ATan2Op>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x3FuLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseAndOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x40uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseOrOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x41uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseXorOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x42uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseLeftShiftOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x43uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::BitwiseRightShiftOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x44uLL:
      IsInfinite = (void *)createBinaryArithmeticOp<mlir::mps::CreateComplexOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x45uLL:
      IsInfinite = (void *)createTernaryArithmeticOp<mlir::mps::SelectOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x46uLL:
      IsInfinite = (void *)createTernaryArithmeticOp<mlir::mps::ClampOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
      goto LABEL_76;
    case 0x47uLL:
      IsInfinite = (void *)createUnaryArithmeticOp<mlir::mps::TruncateOp>((mlir::StringAttr **)a3, (uint64_t)a4, (uint64_t **)a5, v11);
LABEL_76:
      a5 = IsInfinite;
      break;
    default:
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
      break;
  }

  return a5;
}

- (id)broadcastGradWithOutputGradient:(id)a3 inputIndex:(unint64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;

  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v34 = v8;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "broadcastGradientArgsForPrimaryTensor:withSecondaryTensor:name:", v8, v12, v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_loadWeakRetained((id *)&self->super._graph);
  v17 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v9, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reductionSumWithTensor:axesTensor:name:", v8, v35, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_loadWeakRetained((id *)&self->super._graph);
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v9, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "shapeOfTensor:name:", v23, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_loadWeakRetained((id *)&self->super._graph);
  v29 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v9, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reshapeTensor:withShapeTensor:name:", v20, v27, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)broadcastGradTernaryWithOutputGradient:(id)a3 inputIndex:(unint64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;

  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
  v34 = v8;
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "broadcastGradientArgsForPrimaryTensor:withSecondaryTensor:name:", v8, v12, v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_loadWeakRetained((id *)&self->super._graph);
  v17 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v9, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reductionSumWithTensor:axesTensor:name:", v8, v35, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_loadWeakRetained((id *)&self->super._graph);
  -[MPSGraphOperation inputTensors](self, "inputTensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v9, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "shapeOfTensor:name:", v23, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_loadWeakRetained((id *)&self->super._graph);
  v29 = (void *)MEMORY[0x1E0CB3940];
  -[MPSGraphOperation name](self, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@/%@/braodcastGrad"), v9, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reshapeTensor:withShapeTensor:name:", v20, v27, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)partialDerivativeForInputTensor:(id)a3 incomingGradient:(id)a4 inputIndex:(unint64_t)a5 name:(id)a6
{
  id v10;
  id v11;
  MPSGraph **p_graph;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  MPSGraph **v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  id v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  id v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  id v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  id v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  id v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  id v233;
  void *v234;
  void *v235;
  void *v236;
  uint64_t v237;
  id v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  id v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  id v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  id v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  id v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  id v268;
  void *v269;
  void *v270;
  void *v271;
  id v272;
  void *v273;
  void *v274;
  id v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  id v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  id v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  id v294;
  void *v295;
  void *v296;
  void *v297;
  id v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  id v307;
  id v308;
  void *v309;
  void *v310;
  void *v311;
  uint64_t v312;
  id v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *WeakRetained;
  id v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  id v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  id v330;
  void *v331;
  void *v332;
  void *v333;
  id v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  id v341;
  uint64_t v342;
  id v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  id v350;
  void *v351;
  void *v352;
  void *v353;
  uint64_t v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  uint64_t v359;
  id v360;
  uint64_t v361;
  id v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  id v369;
  void *v370;
  void *v371;
  id v372;
  id v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  uint64_t v380;
  void *v381;
  id v382;
  id v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  id v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  id v398;
  id v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  id v405;
  void *v406;
  void *v407;
  void *v408;
  id v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  id v414;
  void *v415;
  void *v416;
  void *v417;
  uint64_t v418;
  void *v419;
  id v420;
  uint64_t v421;
  id v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  id v429;
  uint64_t v430;
  id v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  int v441;
  void *v442;
  void *v443;
  int v444;
  MPSGraph **v445;
  id v446;
  void *v447;
  void *v448;
  int v449;
  uint64_t v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  int v455;
  id v456;
  uint64_t v457;
  id v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  id v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  id v472;
  id v473;
  id v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  id v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  int v493;
  id v494;
  uint64_t v495;
  id v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  id v505;
  id v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  id v512;
  void *v513;
  void *v514;
  void *v515;
  id v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  void *v522;
  id v523;
  void *v524;
  void *v525;
  void *v526;
  id v527;
  id v528;
  void *v529;
  void *v530;
  void *v531;
  void *v532;
  void *v533;
  id v534;
  void *v535;
  void *v536;
  void *v537;
  id v538;
  void *v539;
  void *v540;
  void *v541;
  void *v542;
  void *v543;
  void *v544;
  id v545;
  id v546;
  id v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  id v553;
  void *v554;
  void *v555;
  void *v556;
  void *v557;
  id v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  id v563;
  void *v564;
  void *v565;
  void *v566;
  void *v567;
  id v568;
  void *v569;
  void *v570;
  void *v571;
  id v572;
  void *v573;
  void *v574;
  id v575;
  id v576;
  void *v577;
  void *v578;
  void *v579;
  void *v580;
  void *v581;
  id v582;
  void *v583;
  void *v584;
  void *v585;
  void *v586;
  void *v587;
  id v588;
  void *v589;
  void *v590;
  void *v591;
  uint64_t v592;
  void *v593;
  void *v594;
  void *v595;
  void *v596;
  void *v597;
  MPSGraph **v598;
  id v599;
  void *v600;
  void *v601;
  int v602;
  uint64_t v603;
  uint64_t v604;
  id v605;
  void *v606;
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  id v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  id v617;
  void *v618;
  void *v619;
  void *v620;
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  void *v626;
  void *v627;
  void *v628;
  void *v629;
  void *v630;
  void *v631;
  void *v632;
  void *v633;
  void *v634;
  void *v635;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  id v641;
  id v642;
  void *v643;
  void *v644;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  void *v649;
  void *v650;
  void *v651;
  void *v652;
  void *v653;
  uint64_t v654;
  void *v655;
  void *v656;
  void *v657;
  void *v658;
  void *v659;
  void *v660;
  void *v661;
  void *v662;
  void *v664;
  id v665;
  void *v666;
  void *v667;
  void *v668;
  void *v669;
  void *v670;
  id v671;
  uint64_t v672;
  id v673;
  void *v674;
  void *v675;
  void *v676;
  void *v677;
  void *v678;
  void *v679;
  void *v680;
  void *v681;
  void *v682;
  id v683;
  uint64_t v684;
  void *v685;
  void *v686;
  id v687;
  id v688;
  void *v689;
  void *v690;
  id v691;
  void *v692;
  id v693;
  void *v694;
  void *v695;
  id v696;
  void *v697;
  uint64_t v698;
  id v699;
  void *v700;
  void *v701;
  uint64_t v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  void *v706;
  uint64_t v707;
  void *v708;
  uint64_t v709;
  void *v710;
  void *v711;
  void *v712;
  void *v713;
  void *v714;
  void *v715;
  uint64_t v716;
  void *v717;
  id v718;
  id v719;

  v718 = a3;
  v719 = a4;
  v10 = a6;
  v11 = 0;
  switch(self->_mathOpType)
  {
    case 0uLL:
      goto LABEL_69;
    case 1uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation outputTensors](self, "outputTensors");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "objectAtIndexedSubscript:", 0);
      v355 = (void *)objc_claimAutoreleasedReturnValue();
      v419 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v357 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v419, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v357);
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v355, v719, v358);
      v359 = objc_claimAutoreleasedReturnValue();
      goto LABEL_56;
    case 2uLL:
      v429 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v429, "constantWithScalar:shape:dataType:", &unk_1E0E9ABD0, 268435488, 0.693147181);
      v430 = objc_claimAutoreleasedReturnValue();

      v431 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v430;
      -[MPSGraphOperation outputTensors](self, "outputTensors");
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v432, "objectAtIndexedSubscript:", 0);
      v433 = (void *)objc_claimAutoreleasedReturnValue();
      v434 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v434, "stringWithFormat:", CFSTR("%@/%@/multiplication_LN2"), v10, v435);
      v436 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v431, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v433, v430, v436);
      v349 = (void *)objc_claimAutoreleasedReturnValue();

      v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v437 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v437, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v352);
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v350, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v349, v719, v353);
      v354 = objc_claimAutoreleasedReturnValue();
      goto LABEL_71;
    case 3uLL:
      v420 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v420, "constantWithScalar:shape:dataType:", &unk_1E0E9ABE8, 268435488, 2.30258509);
      v421 = objc_claimAutoreleasedReturnValue();

      v422 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v421;
      -[MPSGraphOperation outputTensors](self, "outputTensors");
      v423 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v423, "objectAtIndexedSubscript:", 0);
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      v425 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v426 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v425, "stringWithFormat:", CFSTR("%@/%@/multiplication_LN10"), v10, v426);
      v427 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v422, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v424, v421, v427);
      v349 = (void *)objc_claimAutoreleasedReturnValue();

      v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v428 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v428, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v352);
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v350, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v349, v719, v353);
      v354 = objc_claimAutoreleasedReturnValue();
      goto LABEL_71;
    case 4uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "objectAtIndexedSubscript:", 0);
      v355 = (void *)objc_claimAutoreleasedReturnValue();
      v381 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v357 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v381, "stringWithFormat:", CFSTR("%@/%@/division"), v10, v357);
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "divisionWithPrimaryTensor:secondaryTensor:name:", v719, v355, v358);
      v359 = objc_claimAutoreleasedReturnValue();
      goto LABEL_56;
    case 5uLL:
      v456 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v456, "constantWithScalar:shape:dataType:", &unk_1E0E9AC00, 268435488, 0.693147181);
      v457 = objc_claimAutoreleasedReturnValue();

      v458 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v457;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v459 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v459, "objectAtIndexedSubscript:", 0);
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      v461 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v462 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v461, "stringWithFormat:", CFSTR("%@/%@/multiplication_LN2"), v10, v462);
      v463 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v458, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v460, v457, v463);
      v349 = (void *)objc_claimAutoreleasedReturnValue();

      v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v464 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v464, "stringWithFormat:", CFSTR("%@/%@/division"), v10, v352);
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v350, "divisionWithPrimaryTensor:secondaryTensor:name:", v719, v349, v353);
      v354 = objc_claimAutoreleasedReturnValue();
      goto LABEL_71;
    case 6uLL:
      v360 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v360, "constantWithScalar:shape:dataType:", &unk_1E0E9AC18, 268435488, 2.30258509);
      v361 = objc_claimAutoreleasedReturnValue();

      v362 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v361;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v363 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v363, "objectAtIndexedSubscript:", 0);
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      v365 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "stringWithFormat:", CFSTR("%@/%@/multiplication_LN10"), v10, v366);
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v362, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v364, v361, v367);
      v349 = (void *)objc_claimAutoreleasedReturnValue();

      v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v368 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v368, "stringWithFormat:", CFSTR("%@/%@/division"), v10, v352);
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v350, "divisionWithPrimaryTensor:secondaryTensor:name:", v719, v349, v353);
      v354 = objc_claimAutoreleasedReturnValue();
      goto LABEL_71;
    case 7uLL:
      v341 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v341, "constantWithScalar:shape:dataType:", &unk_1E0E9AC30, 268435488, 2.0);
      v342 = objc_claimAutoreleasedReturnValue();

      v343 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v342;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v344, "objectAtIndexedSubscript:", 0);
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      v346 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v347 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v346, "stringWithFormat:", CFSTR("%@/%@/multiplication_2.0"), v10, v347);
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v343, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v345, v342, v348);
      v349 = (void *)objc_claimAutoreleasedReturnValue();

      v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v351 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v351, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v352);
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v350, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v349, v353);
      v354 = objc_claimAutoreleasedReturnValue();
LABEL_71:
      v11 = (id)v354;

      goto LABEL_72;
    case 8uLL:
      v382 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v382, "constantWithScalar:shape:dataType:", &unk_1E0E9AC48, 268435488, 0.5);
      v706 = (void *)objc_claimAutoreleasedReturnValue();

      v383 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v384, "objectAtIndexedSubscript:", 0);
      v385 = (void *)objc_claimAutoreleasedReturnValue();
      v386 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v387 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v386, "stringWithFormat:", CFSTR("%@/%@/reciprocalSqrt"), v10, v387);
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v383, "reciprocalSquareRootWithTensor:name:", v385, v388);
      v389 = (void *)objc_claimAutoreleasedReturnValue();

      v390 = objc_loadWeakRetained((id *)&self->super._graph);
      v391 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v391, "stringWithFormat:", CFSTR("%@/%@/multiplication_0.5"), v10, v392);
      v393 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v390, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v389, v706, v393);
      v394 = (void *)objc_claimAutoreleasedReturnValue();

      v123 = objc_loadWeakRetained((id *)&self->super._graph);
      v395 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v395, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v396);
      v397 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v394, v397);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_83;
    case 9uLL:
      v472 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v472, "constantWithScalar:shape:dataType:", &unk_1E0E9AC60, 268435488, -1.5);
      v706 = (void *)objc_claimAutoreleasedReturnValue();

      v473 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v473, "constantWithScalar:shape:dataType:", &unk_1E0E9AC78, 268435488, -0.5);
      v695 = (void *)objc_claimAutoreleasedReturnValue();

      v474 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v475 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v475, "objectAtIndexedSubscript:", 0);
      v476 = (void *)objc_claimAutoreleasedReturnValue();
      v477 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v478 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v477, "stringWithFormat:", CFSTR("%@/%@/pow_-1.5"), v10, v478);
      v479 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v474, "powerWithPrimaryTensor:secondaryTensor:name:", v476, v706, v479);
      v480 = (void *)objc_claimAutoreleasedReturnValue();

      v481 = objc_loadWeakRetained((id *)&self->super._graph);
      v482 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v483 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v482, "stringWithFormat:", CFSTR("%@/%@/multiplication_-0.5"), v10, v483);
      v484 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v481, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v480, v695, v484);
      v485 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_loadWeakRetained((id *)&self->super._graph);
      v486 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v487 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v486, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v487);
      v488 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v485, v488);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_76;
    case 0xAuLL:
      v233 = objc_loadWeakRetained((id *)&self->super._graph);
      v234 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v235);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "negativeWithTensor:name:", v719, v236);
      v237 = objc_claimAutoreleasedReturnValue();

      v238 = objc_loadWeakRetained((id *)&self->super._graph);
      v714 = (void *)v237;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "objectAtIndexedSubscript:", 0);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v241 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v241, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v242);
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "squareWithTensor:name:", v240, v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();

      v245 = objc_loadWeakRetained((id *)&self->super._graph);
      v246 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v247);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v244, v714, v248);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_118;
    case 0xBuLL:
      v465 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v466 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v466, "objectAtIndexedSubscript:", 0);
      v467 = (void *)objc_claimAutoreleasedReturnValue();
      v468 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v469 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v468, "stringWithFormat:", CFSTR("%@/%@/sign"), v10, v469);
      v470 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v465, "signWithTensor:name:", v467, v470);
      v114 = (id)objc_claimAutoreleasedReturnValue();

      v190 = objc_loadWeakRetained((id *)&self->super._graph);
      v471 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v471, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v114, v193);
      v194 = objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0xCuLL:
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v489 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v489, "objectAtIndexedSubscript:", 0);
      v490 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v490, "dataType");

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v491 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v491, "objectAtIndexedSubscript:", 0);
      v492 = (void *)objc_claimAutoreleasedReturnValue();
      v493 = objc_msgSend(v492, "dataType");

      if ((v493 & 0x1000000) != 0 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v494 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v494, "constantWithScalar:shape:dataType:", &unk_1E0E9AC90, 268435488, 2.0);
      v495 = objc_claimAutoreleasedReturnValue();

      v496 = objc_loadWeakRetained((id *)&self->super._graph);
      v706 = (void *)v495;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v497 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v497, "objectAtIndexedSubscript:", 0);
      v498 = (void *)objc_claimAutoreleasedReturnValue();
      v499 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v500 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v499, "stringWithFormat:", CFSTR("%@/%@/multiplication_2.0"), v10, v500);
      v501 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v496, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v498, v495, v501);
      v502 = (void *)objc_claimAutoreleasedReturnValue();

      v350 = objc_loadWeakRetained((id *)&self->super._graph);
      v503 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v503, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v352);
      v504 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v350, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v502, v504);
      v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_72:
      goto LABEL_88;
    case 0xDuLL:
      v14 = objc_loadWeakRetained((id *)&self->super._graph);
      v438 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v438, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "negativeWithTensor:name:", v719, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x47uLL:
      p_graph = &self->super._graph;
      v13 = objc_loadWeakRetained((id *)p_graph);
      objc_msgSend(v13, "constantWithScalar:dataType:", objc_msgSend(v719, "dataType"), 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_loadWeakRetained((id *)p_graph);
      objc_msgSend(v15, "shapeOfTensor:name:", v719, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_loadWeakRetained((id *)p_graph);
      objc_msgSend(v17, "broadcastTensor:toShapeTensor:name:", v14, v16, v10);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_3:
      v11 = (id)v18;

      goto LABEL_118;
    case 0xFuLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation outputTensors](self, "outputTensors");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "objectAtIndexedSubscript:", 0);
      v355 = (void *)objc_claimAutoreleasedReturnValue();
      v356 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v357 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v356, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v357);
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v355, v358);
      v359 = objc_claimAutoreleasedReturnValue();
LABEL_56:
      v11 = (id)v359;

      goto LABEL_57;
    case 0x14uLL:
      v298 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "objectAtIndexedSubscript:", 0);
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      v301 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "stringWithFormat:", CFSTR("%@/%@/cos"), v10, v302);
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "cosWithTensor:name:", v300, v303);
      v114 = (id)objc_claimAutoreleasedReturnValue();

      v190 = objc_loadWeakRetained((id *)&self->super._graph);
      v304 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v304, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v114, v193);
      v194 = objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x15uLL:
      v282 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "objectAtIndexedSubscript:", 0);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v285 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v285, "stringWithFormat:", CFSTR("%@/%@/cos"), v10, v286);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v282, "sinWithTensor:name:", v284, v287);
      v288 = (void *)objc_claimAutoreleasedReturnValue();

      v289 = objc_loadWeakRetained((id *)&self->super._graph);
      v290 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v291);
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "negativeWithTensor:name:", v288, v292);
      v293 = (void *)objc_claimAutoreleasedReturnValue();

      v294 = objc_loadWeakRetained((id *)&self->super._graph);
      v295 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v296);
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v294, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v293, v297);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_118;
    case 0x16uLL:
      v313 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v314, "objectAtIndexedSubscript:", 0);
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      v316 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v316, "stringWithFormat:", CFSTR("%@/%@/cos"), v10, v317);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v313, "cosWithTensor:name:", v315, v318);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      v320 = objc_loadWeakRetained((id *)&self->super._graph);
      v321 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v321, "stringWithFormat:", CFSTR("%@/%@/reciprocal"), v10, v322);
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "reciprocalWithTensor:name:", WeakRetained, v323);
      v324 = (void *)objc_claimAutoreleasedReturnValue();

      v325 = objc_loadWeakRetained((id *)&self->super._graph);
      v326 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v327 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v326, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v327);
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v325, "squareWithTensor:name:", v324, v328);
      v329 = (void *)objc_claimAutoreleasedReturnValue();

      v330 = objc_loadWeakRetained((id *)&self->super._graph);
      v331 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v331, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v332);
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v330, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v329, v333);
      v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_57:
      goto LABEL_118;
    case 0x17uLL:
      v334 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v335, "objectAtIndexedSubscript:", 0);
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      v337 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v337, "stringWithFormat:", CFSTR("%@/%@/cosh"), v10, v338);
      v339 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v334, "coshWithTensor:name:", v336, v339);
      v114 = (id)objc_claimAutoreleasedReturnValue();

      v190 = objc_loadWeakRetained((id *)&self->super._graph);
      v340 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v340, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v114, v193);
      v194 = objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x18uLL:
      v184 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "objectAtIndexedSubscript:", 0);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      v187 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "stringWithFormat:", CFSTR("%@/%@/sinh"), v10, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "sinhWithTensor:name:", v186, v189);
      v114 = (id)objc_claimAutoreleasedReturnValue();

      v190 = objc_loadWeakRetained((id *)&self->super._graph);
      v191 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v114, v193);
      v194 = objc_claimAutoreleasedReturnValue();
LABEL_74:
      v11 = (id)v194;

      goto LABEL_117;
    case 0x19uLL:
      v116 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v116, "constantWithScalar:shape:dataType:", &unk_1E0E9ACA8, 268435488, 1.0);
      v706 = (void *)objc_claimAutoreleasedReturnValue();

      v117 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "objectAtIndexedSubscript:", 0);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "stringWithFormat:", CFSTR("%@/%@/tanh"), v10, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "tanhWithTensor:name:", v119, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      v124 = objc_loadWeakRetained((id *)&self->super._graph);
      v125 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "squareWithTensor:name:", v123, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      v129 = objc_loadWeakRetained((id *)&self->super._graph);
      v130 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "stringWithFormat:", CFSTR("%@/%@/subtraction_1"), v10, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "subtractionWithPrimaryTensor:secondaryTensor:name:", v706, v128, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();

      v134 = objc_loadWeakRetained((id *)&self->super._graph);
      v135 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v133, v137);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_82;
    case 0x1AuLL:
      v505 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v505, "constantWithScalar:shape:dataType:", &unk_1E0E9ACC0, 268435488, 1.0);
      v706 = (void *)objc_claimAutoreleasedReturnValue();

      v506 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v507 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v507, "objectAtIndexedSubscript:", 0);
      v508 = (void *)objc_claimAutoreleasedReturnValue();
      v509 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v509, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v510);
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v506, "squareWithTensor:name:", v508, v511);
      v701 = (void *)objc_claimAutoreleasedReturnValue();

      v512 = objc_loadWeakRetained((id *)&self->super._graph);
      v513 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v514 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v513, "stringWithFormat:", CFSTR("%@/%@/subtraction"), v10, v514);
      v515 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v512, "subtractionWithPrimaryTensor:secondaryTensor:name:", v706, v701, v515);
      v694 = (void *)objc_claimAutoreleasedReturnValue();

      v516 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v517 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v517, "objectAtIndexedSubscript:", 0);
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      v519 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v520 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v519, "stringWithFormat:", CFSTR("%@/%@/reciprocalSquareRoot"), v10, v520);
      v521 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v516, "reciprocalSquareRootWithTensor:name:", v518, v521);
      v522 = (void *)objc_claimAutoreleasedReturnValue();

      v523 = objc_loadWeakRetained((id *)&self->super._graph);
      v524 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v525 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v524, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v525);
      v526 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v523, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v522, v526);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_88;
    case 0x1BuLL:
      v546 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v546, "constantWithScalar:shape:dataType:", &unk_1E0E9ACD8, 268435488, 1.0);
      v706 = (void *)objc_claimAutoreleasedReturnValue();

      v547 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v548 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v548, "objectAtIndexedSubscript:", 0);
      v549 = (void *)objc_claimAutoreleasedReturnValue();
      v550 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v551 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v550, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v551);
      v552 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v547, "squareWithTensor:name:", v549, v552);
      v695 = (void *)objc_claimAutoreleasedReturnValue();

      v553 = objc_loadWeakRetained((id *)&self->super._graph);
      v554 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v555 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v554, "stringWithFormat:", CFSTR("%@/%@/subtraction"), v10, v555);
      v556 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v553, "subtractionWithPrimaryTensor:secondaryTensor:name:", v706, v695, v556);
      v557 = (void *)objc_claimAutoreleasedReturnValue();

      v558 = objc_loadWeakRetained((id *)&self->super._graph);
      v559 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v560 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v559, "stringWithFormat:", CFSTR("%@/%@/reciprocalSquareRoot"), v10, v560);
      v561 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v558, "reciprocalSquareRootWithTensor:name:", v557, v561);
      v562 = (void *)objc_claimAutoreleasedReturnValue();

      v563 = objc_loadWeakRetained((id *)&self->super._graph);
      v564 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v565 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v564, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v565);
      v566 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v563, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v562, v566);
      v567 = (void *)objc_claimAutoreleasedReturnValue();

      v568 = objc_loadWeakRetained((id *)&self->super._graph);
      v569 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v570 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v569, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v570);
      v571 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v568, "negativeWithTensor:name:", v567, v571);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_87;
    case 0x1CuLL:
      v171 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v171, "constantWithScalar:shape:dataType:", &unk_1E0E9ACF0, 268435488, 1.0);
      v172 = objc_claimAutoreleasedReturnValue();

      v173 = objc_loadWeakRetained((id *)&self->super._graph);
      v712 = (void *)v172;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "objectAtIndexedSubscript:", 0);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "squareWithTensor:name:", v175, v178);
      v159 = (void *)objc_claimAutoreleasedReturnValue();

      v179 = objc_loadWeakRetained((id *)&self->super._graph);
      v180 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = v712;
      objc_msgSend(v180, "stringWithFormat:", CFSTR("%@/%@/addition"), v10, v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "additionWithPrimaryTensor:secondaryTensor:name:", v712, v159, v182);
      v165 = (void *)objc_claimAutoreleasedReturnValue();

      v166 = objc_loadWeakRetained((id *)&self->super._graph);
      v183 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "stringWithFormat:", CFSTR("%@/%@/division"), v10, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "divisionWithPrimaryTensor:secondaryTensor:name:", v719, v165, v169);
      v170 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 0x1DuLL:
      v398 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v398, "constantWithScalar:shape:dataType:", &unk_1E0E9AD08, 268435488, 1.0);
      v706 = (void *)objc_claimAutoreleasedReturnValue();

      v399 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v400, "objectAtIndexedSubscript:", 0);
      v401 = (void *)objc_claimAutoreleasedReturnValue();
      v402 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v402, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v403);
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v399, "squareWithTensor:name:", v401, v404);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      v405 = objc_loadWeakRetained((id *)&self->super._graph);
      v406 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v407 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v406, "stringWithFormat:", CFSTR("%@/%@/addition"), v10, v407);
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v405, "additionWithPrimaryTensor:secondaryTensor:name:", v706, v123, v408);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      v409 = objc_loadWeakRetained((id *)&self->super._graph);
      v410 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v411 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v410, "stringWithFormat:", CFSTR("%@/%@/rsqrt"), v10, v411);
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v409, "reciprocalSquareRootWithTensor:name:", v128, v412);
      v413 = (void *)objc_claimAutoreleasedReturnValue();

      v414 = objc_loadWeakRetained((id *)&self->super._graph);
      v415 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v415, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v416);
      v417 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v414, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v413, v417);
      v418 = objc_claimAutoreleasedReturnValue();
      goto LABEL_81;
    case 0x1EuLL:
      v527 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v527, "constantWithScalar:shape:dataType:", &unk_1E0E9AD20, 268435488, 1.0);
      v706 = (void *)objc_claimAutoreleasedReturnValue();

      v528 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v529 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v529, "objectAtIndexedSubscript:", 0);
      v530 = (void *)objc_claimAutoreleasedReturnValue();
      v531 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v532 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v531, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v532);
      v533 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v528, "squareWithTensor:name:", v530, v533);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      v534 = objc_loadWeakRetained((id *)&self->super._graph);
      v535 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v536 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v535, "stringWithFormat:", CFSTR("%@/%@/subtraction"), v10, v536);
      v537 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v534, "subtractionWithPrimaryTensor:secondaryTensor:name:", v123, v706, v537);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      v538 = objc_loadWeakRetained((id *)&self->super._graph);
      v539 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v540 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v539, "stringWithFormat:", CFSTR("%@/%@/rsqrt"), v10, v540);
      v541 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v538, "reciprocalSquareRootWithTensor:name:", v128, v541);
      v413 = (void *)objc_claimAutoreleasedReturnValue();

      v414 = objc_loadWeakRetained((id *)&self->super._graph);
      v542 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v542, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v416);
      v417 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v414, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v413, v417);
      v418 = objc_claimAutoreleasedReturnValue();
LABEL_81:
      v11 = (id)v418;

LABEL_82:
LABEL_83:

      goto LABEL_88;
    case 0x1FuLL:
      v151 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v151, "constantWithScalar:shape:dataType:", &unk_1E0E9AD38, 268435488, 1.0);
      v152 = objc_claimAutoreleasedReturnValue();

      v153 = objc_loadWeakRetained((id *)&self->super._graph);
      v711 = (void *)v152;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "objectAtIndexedSubscript:", 0);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "squareWithTensor:name:", v155, v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();

      v160 = objc_loadWeakRetained((id *)&self->super._graph);
      v161 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = v711;
      objc_msgSend(v161, "stringWithFormat:", CFSTR("%@/%@/subtraction"), v10, v162);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "subtractionWithPrimaryTensor:secondaryTensor:name:", v159, v711, v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();

      v166 = objc_loadWeakRetained((id *)&self->super._graph);
      v167 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "stringWithFormat:", CFSTR("%@/%@/division"), v10, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "divisionWithPrimaryTensor:secondaryTensor:name:", v719, v165, v169);
      v170 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v11 = (id)v170;

      goto LABEL_118;
    case 0x20uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3DuLL:
      goto LABEL_118;
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
      v19 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v19, "constantWithScalar:shape:dataType:", &unk_1E0E9AD50, 268435488, 0.0);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 0x24uLL:
      v21 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "squareWithTensor:name:", v23, v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v28 = objc_loadWeakRetained((id *)&self->super._graph);
      v29 = (void *)MEMORY[0x1E0CB3940];
      v706 = (void *)v27;
      -[MPSGraphOperation name](self, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "negativeWithTensor:name:", v27, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v33 = objc_loadWeakRetained((id *)&self->super._graph);
      v34 = (void *)MEMORY[0x1E0CB3940];
      v695 = (void *)v32;
      -[MPSGraphOperation name](self, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "exponentWithTensor:name:", v32, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v38, "constantWithScalar:shape:dataType:", &unk_1E0E9AD68, 268435488, 1.12837917);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = objc_loadWeakRetained((id *)&self->super._graph);
      v41 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v37, v39, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_loadWeakRetained((id *)&self->super._graph);
      v46 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("%@/%@/multiplication_1"), v10, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v719, v44, v48);
      v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_76:
LABEL_87:

LABEL_88:
      goto LABEL_118;
    case 0x27uLL:
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v451 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v451, "objectAtIndexedSubscript:", 0);
      v452 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v452, "dataType");

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v453, "objectAtIndexedSubscript:", 0);
      v454 = (void *)objc_claimAutoreleasedReturnValue();
      v455 = objc_msgSend(v454, "dataType");

      if ((v455 & 0x1000000) != 0 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      goto LABEL_69;
    case 0x28uLL:
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v442 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v442, "objectAtIndexedSubscript:", 0);
      v443 = (void *)objc_claimAutoreleasedReturnValue();
      v444 = objc_msgSend(v443, "dataType");

      if ((v444 & 0x1000000) == 0)
      {
LABEL_69:
        v11 = v719;
        goto LABEL_118;
      }
      v445 = &self->super._graph;
      v446 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v447 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v447, "objectAtIndexedSubscript:", 0);
      v448 = (void *)objc_claimAutoreleasedReturnValue();
      v449 = objc_msgSend(v448, "dataType");
      v450 = 268435472;
      if (v449 == 285212736)
      {
        v450 = 268435488;
      }
      else if (v449 != 285212704)
      {
        llvm::llvm_unreachable_internal((llvm *)"unsupported complex type", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/MPSGraphUtilities.mm", (const char *)0x67);
      }
      objc_msgSend(v446, "constantWithScalar:shape:dataType:", &unk_1E0E9AD98, v450, 0.0);
      v664 = (void *)objc_claimAutoreleasedReturnValue();

      v673 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v719, "shape");
      v674 = (void *)objc_claimAutoreleasedReturnValue();
      v675 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v676 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v675, "stringWithFormat:", CFSTR("%@/%@/broadcastZero"), v10, v676);
      v677 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v673, "broadcastTensor:toShape:name:", v664, v674, v677);
      v670 = (void *)objc_claimAutoreleasedReturnValue();

      v671 = objc_loadWeakRetained((id *)v445);
      objc_msgSend(v671, "complexTensorWithRealTensor:imaginaryTensor:name:", v719, v670, v10);
      v672 = objc_claimAutoreleasedReturnValue();
      goto LABEL_123;
    case 0x29uLL:
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v439 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v439, "objectAtIndexedSubscript:", 0);
      v440 = (void *)objc_claimAutoreleasedReturnValue();
      v441 = objc_msgSend(v440, "dataType");

      if ((v441 & 0x1000000) != 0)
      {
        v598 = &self->super._graph;
        v599 = objc_loadWeakRetained((id *)&self->super._graph);
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v600 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v600, "objectAtIndexedSubscript:", 0);
        v601 = (void *)objc_claimAutoreleasedReturnValue();
        v602 = objc_msgSend(v601, "dataType");
        v603 = 268435472;
        if (v602 == 285212736)
        {
          v603 = 268435488;
        }
        else if (v602 != 285212704)
        {
          llvm::llvm_unreachable_internal((llvm *)"unsupported complex type", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/MPSGraphUtilities.mm", (const char *)0x67);
        }
        objc_msgSend(v599, "constantWithScalar:shape:dataType:", &unk_1E0E9ADB0, v603, 0.0);
        v664 = (void *)objc_claimAutoreleasedReturnValue();

        v665 = objc_loadWeakRetained((id *)&self->super._graph);
        objc_msgSend(v719, "shape");
        v666 = (void *)objc_claimAutoreleasedReturnValue();
        v667 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v668 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v667, "stringWithFormat:", CFSTR("%@/%@/broadcastZero"), v10, v668);
        v669 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v665, "broadcastTensor:toShape:name:", v664, v666, v669);
        v670 = (void *)objc_claimAutoreleasedReturnValue();

        v671 = objc_loadWeakRetained((id *)v598);
        objc_msgSend(v671, "complexTensorWithRealTensor:imaginaryTensor:name:", v670, v719, v10);
        v672 = objc_claimAutoreleasedReturnValue();
LABEL_123:
        v11 = (id)v672;

        goto LABEL_118;
      }
      if ((MTLReportFailureTypeEnabled() & 1) == 0)
        goto LABEL_109;
      goto LABEL_108;
    case 0x2AuLL:
      v114 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v543 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v543, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v544, "objectAtIndexedSubscript:", a5);
      v545 = (id)objc_claimAutoreleasedReturnValue();

      if (v545 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      goto LABEL_85;
    case 0x2BuLL:
      v114 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v305, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v306, "objectAtIndexedSubscript:", a5);
      v307 = (id)objc_claimAutoreleasedReturnValue();

      if (v307 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      if (a5 == 1)
      {
        v308 = objc_loadWeakRetained((id *)&self->super._graph);
        v309 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v309, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v310);
        v311 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v308, "negativeWithTensor:name:", v114, v311);
        v312 = objc_claimAutoreleasedReturnValue();

        v114 = (id)v312;
      }
      goto LABEL_85;
    case 0x2CuLL:
      v369 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v370, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v371 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v371, "objectAtIndexedSubscript:", a5);
      v372 = (id)objc_claimAutoreleasedReturnValue();

      if (v372 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v373 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v374 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v374, "objectAtIndexedSubscript:", a5 == 0);
      v375 = (void *)objc_claimAutoreleasedReturnValue();
      v376 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v377 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v376, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v377);
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v373, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v369, v375, v378);
      v379 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraphArithmeticOp broadcastGradWithOutputGradient:inputIndex:name:](self, "broadcastGradWithOutputGradient:inputIndex:name:", v379, a5, v10);
      v380 = objc_claimAutoreleasedReturnValue();
      goto LABEL_97;
    case 0x2DuLL:
      v572 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v573 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v573, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v574 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v574, "objectAtIndexedSubscript:", a5);
      v575 = (id)objc_claimAutoreleasedReturnValue();

      if (v575 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v576 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      if (a5)
      {
        v577 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v577, "objectAtIndexedSubscript:", 1);
        v578 = (void *)objc_claimAutoreleasedReturnValue();
        v579 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v580 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v579, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v580);
        v581 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v576, "squareWithTensor:name:", v578, v581);
        v716 = objc_claimAutoreleasedReturnValue();

        v582 = objc_loadWeakRetained((id *)&self->super._graph);
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v583 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v583, "objectAtIndexedSubscript:", 0);
        v584 = (void *)objc_claimAutoreleasedReturnValue();
        v585 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v586 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v585, "stringWithFormat:", CFSTR("%@/%@/division"), v10, v586);
        v587 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v582, "divisionWithPrimaryTensor:secondaryTensor:name:", v584, v716, v587);
        v702 = objc_claimAutoreleasedReturnValue();

        v588 = objc_loadWeakRetained((id *)&self->super._graph);
        v589 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v590 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v589, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v590);
        v591 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v588, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v572, v702, v591);
        v592 = objc_claimAutoreleasedReturnValue();

        v593 = objc_loadWeakRetained((id *)&self->super._graph);
        v594 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v595 = (void *)objc_claimAutoreleasedReturnValue();
        v596 = (void *)v702;
        objc_msgSend(v594, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v595);
        v597 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v593, "negativeWithTensor:name:", v592, v597);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v572 = (id)v592;
        v576 = (id)v716;
      }
      else
      {
        v596 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v596, "objectAtIndexedSubscript:", 1);
        v593 = (void *)objc_claimAutoreleasedReturnValue();
        v635 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v595 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v635, "stringWithFormat:", CFSTR("%@/%@/division"), v10, v595);
        v597 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v576, "divisionWithPrimaryTensor:secondaryTensor:name:", v572, v593, v597);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[MPSGraphArithmeticOp broadcastGradWithOutputGradient:inputIndex:name:](self, "broadcastGradWithOutputGradient:inputIndex:name:", v19, a5, v10);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 0x2EuLL:
      v114 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "objectAtIndexedSubscript:", a5);
      v251 = (id)objc_claimAutoreleasedReturnValue();

      if (v251 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      if (a5 == 1)
      {
        v693 = objc_loadWeakRetained((id *)&self->super._graph);
        v700 = v114;
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v686 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v686, "objectAtIndexedSubscript:", 0);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v253, "objectAtIndexedSubscript:", 1);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        v255 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "stringWithFormat:", CFSTR("%@/%@/division"), v10, v256);
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v693, "divisionWithPrimaryTensor:secondaryTensor:name:", v252, v254, v257);
        v715 = (void *)objc_claimAutoreleasedReturnValue();

        v258 = objc_loadWeakRetained((id *)&self->super._graph);
        v259 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v260 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v259, "stringWithFormat:", CFSTR("%@/%@/floor"), v10, v260);
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "floorWithTensor:name:", v715, v261);
        v262 = (void *)objc_claimAutoreleasedReturnValue();

        v263 = objc_loadWeakRetained((id *)&self->super._graph);
        v264 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v264, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v265);
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v263, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v700, v262, v266);
        v267 = (void *)objc_claimAutoreleasedReturnValue();

        v268 = objc_loadWeakRetained((id *)&self->super._graph);
        v269 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v269, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v270);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v268, "negativeWithTensor:name:", v267, v271);
        v114 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_85:
      -[MPSGraphArithmeticOp broadcastGradWithOutputGradient:inputIndex:name:](self, "broadcastGradWithOutputGradient:inputIndex:name:", v114, a5, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_117;
    case 0x2FuLL:
      v49 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectAtIndexedSubscript:", a5);
      v52 = (id)objc_claimAutoreleasedReturnValue();

      if (v52 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v53 = objc_loadWeakRetained((id *)&self->super._graph);
      v54 = v53;
      if (a5)
      {
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringWithFormat:", CFSTR("%@/%@/logarithm"), v10, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "logarithmWithTensor:name:", v56, v59);
        v707 = objc_claimAutoreleasedReturnValue();

        v696 = objc_loadWeakRetained((id *)&self->super._graph);
        v60 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)v707;
        objc_msgSend(v60, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v696, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v49, v707, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = objc_loadWeakRetained((id *)&self->super._graph);
        -[MPSGraphOperation outputTensors](self, "outputTensors");
        v689 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v689, "objectAtIndexedSubscript:", 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringWithFormat:", CFSTR("%@/%@/multiplication2"), v10, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v64, v66, v69);
      }
      else
      {
        objc_msgSend(v53, "constantWithScalar:shape:dataType:", &unk_1E0E9AD80, 268435488, 1.0);
        v604 = objc_claimAutoreleasedReturnValue();

        v605 = objc_loadWeakRetained((id *)&self->super._graph);
        v717 = (void *)v604;
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v606 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v606, "objectAtIndexedSubscript:", 1);
        v607 = (void *)objc_claimAutoreleasedReturnValue();
        v608 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v609 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v608, "stringWithFormat:", CFSTR("%@/%@/subraction"), v10, v609);
        v610 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v605, "subtractionWithPrimaryTensor:secondaryTensor:name:", v607, v717, v610);
        v703 = objc_claimAutoreleasedReturnValue();

        v611 = objc_loadWeakRetained((id *)&self->super._graph);
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v612 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v612, "objectAtIndexedSubscript:", 0);
        v613 = (void *)objc_claimAutoreleasedReturnValue();
        v614 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v615 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v614, "stringWithFormat:", CFSTR("%@/%@/power"), v10, v615);
        v616 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v611, "powerWithPrimaryTensor:secondaryTensor:name:", v613, v703, v616);
        v689 = (void *)objc_claimAutoreleasedReturnValue();

        v617 = objc_loadWeakRetained((id *)&self->super._graph);
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v680 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v680, "objectAtIndexedSubscript:", 1);
        v618 = (void *)objc_claimAutoreleasedReturnValue();
        v619 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v620 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v619, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v620);
        v621 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v617, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v49, v618, v621);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = objc_loadWeakRetained((id *)&self->super._graph);
        v622 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (id)v703;
        v62 = v717;
        objc_msgSend(v622, "stringWithFormat:", CFSTR("%@/%@/multiplication2"), v10, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v689, v64, v69);
      }
      v379 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraphArithmeticOp broadcastGradWithOutputGradient:inputIndex:name:](self, "broadcastGradWithOutputGradient:inputIndex:name:", v379, a5, v10);
      v380 = objc_claimAutoreleasedReturnValue();
LABEL_97:
      v11 = (id)v380;

      goto LABEL_118;
    case 0x30uLL:
      v272 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v708 = v272;
      objc_msgSend(v273, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v274, "objectAtIndexedSubscript:", a5);
      v275 = (id)objc_claimAutoreleasedReturnValue();

      if (v275 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v74 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v690 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v690, "objectAtIndexedSubscript:", 0);
      if (a5)
      {
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v277, "objectAtIndexedSubscript:", 1);
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        v279 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v279, "stringWithFormat:", CFSTR("%@/%@/greaterThanOrEqualTo"), v10, v280);
        v281 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "greaterThanOrEqualToWithPrimaryTensor:secondaryTensor:name:", v276, v278, v281);
        v697 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v629 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v630 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v630, "objectAtIndexedSubscript:", 1);
        v631 = (void *)objc_claimAutoreleasedReturnValue();
        v632 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v633 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v632, "stringWithFormat:", CFSTR("%@/%@/lessThan"), v10, v633);
        v634 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "lessThanWithPrimaryTensor:secondaryTensor:name:", v629, v631, v634);
        v697 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_99;
    case 0x31uLL:
      v70 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v708 = v70;
      objc_msgSend(v71, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectAtIndexedSubscript:", a5);
      v73 = (id)objc_claimAutoreleasedReturnValue();

      if (v73 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v74 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v690 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v690, "objectAtIndexedSubscript:", 0);
      if (a5)
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectAtIndexedSubscript:", 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "stringWithFormat:", CFSTR("%@/%@/lessThanOrEqualTo"), v10, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "lessThanOrEqualToWithPrimaryTensor:secondaryTensor:name:", v75, v77, v80);
        v697 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v623 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v624 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v624, "objectAtIndexedSubscript:", 1);
        v625 = (void *)objc_claimAutoreleasedReturnValue();
        v626 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v627 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v626, "stringWithFormat:", CFSTR("%@/%@/greaterThan"), v10, v627);
        v628 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "greaterThanWithPrimaryTensor:secondaryTensor:name:", v623, v625, v628);
        v697 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_99:

      v81 = objc_loadWeakRetained((id *)&self->super._graph);
      v82 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v708, v697, v84);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPSGraphArithmeticOp broadcastGradWithOutputGradient:inputIndex:name:](self, "broadcastGradWithOutputGradient:inputIndex:name:", v19, a5, v10);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 0x3EuLL:
      v699 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "objectAtIndexedSubscript:", a5);
      v197 = (id)objc_claimAutoreleasedReturnValue();

      if (v197 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v198 = objc_loadWeakRetained((id *)&self->super._graph);
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "objectAtIndexedSubscript:", 0);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v201 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "stringWithFormat:", CFSTR("%@/%@/square"), v10, v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "squareWithTensor:name:", v200, v203);
      v204 = objc_claimAutoreleasedReturnValue();

      v205 = objc_loadWeakRetained((id *)&self->super._graph);
      v692 = (void *)v204;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "objectAtIndexedSubscript:", 1);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "stringWithFormat:", CFSTR("%@/%@/square_1"), v10, v209);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "squareWithTensor:name:", v207, v210);
      v713 = (void *)objc_claimAutoreleasedReturnValue();

      v211 = objc_loadWeakRetained((id *)&self->super._graph);
      v212 = (void *)MEMORY[0x1E0CB3940];
      -[MPSGraphOperation name](self, "name");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "stringWithFormat:", CFSTR("%@/%@/add"), v10, v213);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "additionWithPrimaryTensor:secondaryTensor:name:", v204, v713, v214);
      v215 = objc_claimAutoreleasedReturnValue();

      v216 = objc_loadWeakRetained((id *)&self->super._graph);
      v685 = (void *)v215;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        objc_msgSend(v217, "objectAtIndexedSubscript:", 1);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v219, "stringWithFormat:", CFSTR("%@/%@/divide"), v10, v220);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v216, "divisionWithPrimaryTensor:secondaryTensor:name:", v218, v215, v221);
        v222 = (void *)objc_claimAutoreleasedReturnValue();

        v223 = objc_loadWeakRetained((id *)&self->super._graph);
        v224 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v224, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v225);
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v223, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v699, v222, v226);
        v227 = (void *)objc_claimAutoreleasedReturnValue();

        v228 = objc_loadWeakRetained((id *)&self->super._graph);
        v229 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v229, "stringWithFormat:", CFSTR("%@/%@/negative"), v10, v230);
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v228, "negativeWithTensor:name:", v227, v231);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v217, "objectAtIndexedSubscript:", 0);
        v636 = (void *)objc_claimAutoreleasedReturnValue();
        v637 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v638 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v637, "stringWithFormat:", CFSTR("%@/%@/divide"), v10, v638);
        v639 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v216, "divisionWithPrimaryTensor:secondaryTensor:name:", v636, v215, v639);
        v222 = (void *)objc_claimAutoreleasedReturnValue();

        v228 = objc_loadWeakRetained((id *)&self->super._graph);
        v640 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v640, "stringWithFormat:", CFSTR("%@/%@/multiplication"), v10, v230);
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v228, "multiplicationWithPrimaryTensor:secondaryTensor:name:", v699, v222, v231);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = v699;
      }

      -[MPSGraphArithmeticOp broadcastGradWithOutputGradient:inputIndex:name:](self, "broadcastGradWithOutputGradient:inputIndex:name:", v232, a5, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_118;
    case 0x44uLL:
      if (a5 == 1)
      {
        v19 = objc_loadWeakRetained((id *)&self->super._graph);
        objc_msgSend(v19, "imaginaryPartOfTensor:name:", v719, v10);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_106;
      }
      if (!a5)
      {
        v19 = objc_loadWeakRetained((id *)&self->super._graph);
        objc_msgSend(v19, "realPartOfTensor:name:", v719, v10);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_106:
        v11 = (id)v20;

        goto LABEL_118;
      }
      if (MTLReportFailureTypeEnabled())
      {
LABEL_108:
        MTLReportFailure();
        v11 = 0;
      }
      else
      {
LABEL_109:
        v11 = 0;
      }
      goto LABEL_118;
    case 0x45uLL:
      v138 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "objectAtIndexedSubscript:", a5);
      v141 = (id)objc_claimAutoreleasedReturnValue();

      if (v141 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      if (a5 == 1)
      {
        v641 = objc_loadWeakRetained((id *)&self->super._graph);
        objc_msgSend(v641, "constantWithScalar:shape:dataType:", &unk_1E0E9ADE0, 268435488, 0.0);
        v710 = (void *)objc_claimAutoreleasedReturnValue();

        v642 = objc_loadWeakRetained((id *)&self->super._graph);
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "objectAtIndexedSubscript:", 2);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v643 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v643, "stringWithFormat:", CFSTR("%@/%@/select"), v10, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = v642;
        objc_msgSend(v642, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v145, v138, v710, v148);
        v150 = objc_claimAutoreleasedReturnValue();
        goto LABEL_111;
      }
      if (!a5)
      {
        v142 = objc_loadWeakRetained((id *)&self->super._graph);
        objc_msgSend(v142, "constantWithScalar:shape:dataType:", &unk_1E0E9ADC8, 268435488, 0.0);
        v710 = (void *)objc_claimAutoreleasedReturnValue();

        v143 = objc_loadWeakRetained((id *)&self->super._graph);
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "objectAtIndexedSubscript:", 2);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "stringWithFormat:", CFSTR("%@/%@/select"), v10, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = v143;
        objc_msgSend(v143, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v145, v710, v138, v148);
        v150 = objc_claimAutoreleasedReturnValue();
LABEL_111:
        v644 = (void *)v150;

        -[MPSGraphArithmeticOp broadcastGradTernaryWithOutputGradient:inputIndex:name:](self, "broadcastGradTernaryWithOutputGradient:inputIndex:name:", v644, a5, v10);
        v645 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v645;
        goto LABEL_118;
      }
      v11 = 0;

LABEL_118:
      return v11;
    case 0x46uLL:
      v691 = v719;
      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "objectAtIndexedSubscript:", a5);

      -[MPSGraphOperation inputTensors](self, "inputTensors");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "objectAtIndexedSubscript:", a5);
      v87 = (id)objc_claimAutoreleasedReturnValue();

      if (v87 != v718 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v88 = objc_loadWeakRetained((id *)&self->super._graph);
      objc_msgSend(v88, "constantWithScalar:shape:dataType:", &unk_1E0E9ADF8, 268435488, 0.0);
      v709 = objc_claimAutoreleasedReturnValue();

      v89 = &self->super._graph;
      if (a5 == 1)
      {
        v687 = objc_loadWeakRetained((id *)v89);
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v681 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v681, "objectAtIndexedSubscript:", 0);
        v646 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v647 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v647, "objectAtIndexedSubscript:", 1);
        v648 = (void *)objc_claimAutoreleasedReturnValue();
        v649 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v650 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v649, "stringWithFormat:", CFSTR("%@/%@/lessThan"), v10, v650);
        v651 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v687, "lessThanWithPrimaryTensor:secondaryTensor:name:", v646, v648, v651);
        v704 = objc_claimAutoreleasedReturnValue();

        v106 = objc_loadWeakRetained((id *)&self->super._graph);
        v652 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v653 = v652;
        v111 = v691;
        v115 = (void *)v704;
        v114 = (id)v709;
        objc_msgSend(v653, "stringWithFormat:", CFSTR("%@/%@/select"), v10, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v704, v691, v709, v109);
        v654 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!a5)
        {
          v683 = objc_loadWeakRetained((id *)v89);
          -[MPSGraphOperation inputTensors](self, "inputTensors");
          v678 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v678, "objectAtIndexedSubscript:", 0);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraphOperation inputTensors](self, "inputTensors");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "objectAtIndexedSubscript:", 1);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (void *)MEMORY[0x1E0CB3940];
          -[MPSGraphOperation name](self, "name");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "stringWithFormat:", CFSTR("%@/%@/lessThan"), v10, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v683, "lessThanWithPrimaryTensor:secondaryTensor:name:", v90, v92, v95);
          v698 = objc_claimAutoreleasedReturnValue();

          v96 = objc_loadWeakRetained((id *)&self->super._graph);
          -[MPSGraphOperation inputTensors](self, "inputTensors");
          v679 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v679, "objectAtIndexedSubscript:", 0);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSGraphOperation inputTensors](self, "inputTensors");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "objectAtIndexedSubscript:", 2);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = (void *)MEMORY[0x1E0CB3940];
          -[MPSGraphOperation name](self, "name");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "stringWithFormat:", CFSTR("%@/%@/greaterThan"), v10, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "lessThanWithPrimaryTensor:secondaryTensor:name:", v97, v99, v102);
          v684 = objc_claimAutoreleasedReturnValue();

          v103 = objc_loadWeakRetained((id *)&self->super._graph);
          v104 = (void *)MEMORY[0x1E0CB3940];
          -[MPSGraphOperation name](self, "name");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = (id)v684;
          objc_msgSend(v104, "stringWithFormat:", CFSTR("%@/%@/logicalOR"), v10, v105);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "logicalORWithPrimaryTensor:secondaryTensor:name:", v698, v684, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          v109 = objc_loadWeakRetained((id *)&self->super._graph);
          v110 = (void *)MEMORY[0x1E0CB3940];
          -[MPSGraphOperation name](self, "name");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "stringWithFormat:", CFSTR("%@/%@/select"), v10, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v108, v709, v691, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          v115 = (void *)v698;
          v114 = (id)v709;
          goto LABEL_116;
        }
        v688 = objc_loadWeakRetained((id *)v89);
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v682 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v682, "objectAtIndexedSubscript:", 0);
        v655 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSGraphOperation inputTensors](self, "inputTensors");
        v656 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v656, "objectAtIndexedSubscript:", 2);
        v657 = (void *)objc_claimAutoreleasedReturnValue();
        v658 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v659 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v658, "stringWithFormat:", CFSTR("%@/%@/greaterThan"), v10, v659);
        v660 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v688, "lessThanWithPrimaryTensor:secondaryTensor:name:", v655, v657, v660);
        v705 = objc_claimAutoreleasedReturnValue();

        v106 = objc_loadWeakRetained((id *)&self->super._graph);
        v661 = (void *)MEMORY[0x1E0CB3940];
        -[MPSGraphOperation name](self, "name");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v662 = v661;
        v111 = v691;
        v115 = (void *)v705;
        v114 = (id)v709;
        objc_msgSend(v662, "stringWithFormat:", CFSTR("%@/%@/select"), v10, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "selectWithPredicateTensor:truePredicateTensor:falsePredicateTensor:name:", v705, v691, v709, v109);
        v654 = objc_claimAutoreleasedReturnValue();
      }
      v113 = (void *)v654;
LABEL_116:

      -[MPSGraphArithmeticOp broadcastGradTernaryWithOutputGradient:inputIndex:name:](self, "broadcastGradTernaryWithOutputGradient:inputIndex:name:", v113, a5, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_117:
      goto LABEL_118;
    default:
      __assert_rtn("-[MPSGraphArithmeticOp partialDerivativeForInputTensor:incomingGradient:inputIndex:name:]", "MPSGraphArithmeticOps.mm", 1460, "0 && \"unimplemented math op\");
  }
}

@end
