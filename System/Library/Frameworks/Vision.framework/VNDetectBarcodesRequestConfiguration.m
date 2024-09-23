@implementation VNDetectBarcodesRequestConfiguration

- (void)setDefaultSymbologiesForRevision:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v9;
  NSArray *v10;
  NSArray *symbologies;
  NSArray *v12;
  NSArray *v13;
  uint64_t v14;

  if ((uint64_t)a3 <= 3737841663)
  {
    switch(a3)
    {
      case 1uLL:
        +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev1");
        v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 2uLL:
        +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev2");
        v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3uLL:
        +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev3");
        v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 4uLL:
        +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev4");
        v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      default:
        goto LABEL_13;
    }
  }
  if (a3 == 3737841664)
  {
    +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev2Private");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    symbologies = self->_symbologies;
    self->_symbologies = v9;

    self->_useMLDetector = 0;
  }
  else
  {
    if (a3 == 3737841665)
    {
      +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev3Private");
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 3737841666)
      {
LABEL_13:
        VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), a3, v3, v4, v5, v6, v7, v14);
        v12 = self->_symbologies;
        self->_symbologies = 0;

        return;
      }
      +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev4Private");
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
LABEL_15:
    v13 = self->_symbologies;
    self->_symbologies = v10;

    self->_useMLDetector = 1;
  }
}

- (VNDetectBarcodesRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectBarcodesRequestConfiguration *v3;
  VNDetectBarcodesRequestConfiguration *v4;
  VNDetectBarcodesRequestConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectBarcodesRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v7, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    -[VNDetectBarcodesRequestConfiguration setDefaultSymbologiesForRevision:](v3, "setDefaultSymbologiesForRevision:", -[VNRequestConfiguration resolvedRevision](v3, "resolvedRevision"));
    v5 = v4;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectBarcodesRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setSymbologies:", self->_symbologies);
    objc_msgSend(v5, "setLocateMode:", self->_locateMode);
    objc_msgSend(v5, "setStopAtFirstPyramidWith2DCode:", self->_stopAtFirstPyramidWith2DCode);
    objc_msgSend(v5, "setUseMLDetector:", self->_useMLDetector);
  }
  return v5;
}

- (NSArray)symbologies
{
  return self->_symbologies;
}

- (void)setSymbologies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)locateMode
{
  return self->_locateMode;
}

- (void)setLocateMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)stopAtFirstPyramidWith2DCode
{
  return self->_stopAtFirstPyramidWith2DCode;
}

- (void)setStopAtFirstPyramidWith2DCode:(BOOL)a3
{
  self->_stopAtFirstPyramidWith2DCode = a3;
}

- (BOOL)useMLDetector
{
  return self->_useMLDetector;
}

- (void)setUseMLDetector:(BOOL)a3
{
  self->_useMLDetector = a3;
}

- (BOOL)coalesceCompositeSymbologies
{
  return self->_coalesceCompositeSymbologies;
}

- (void)setCoalesceCompositeSymbologies:(BOOL)a3
{
  self->_coalesceCompositeSymbologies = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locateMode, 0);
  objc_storeStrong((id *)&self->_symbologies, 0);
}

@end
