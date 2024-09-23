@implementation ASTUISingularMatrixCalibrationStrategy

- (ASTUISingularMatrixCalibrationStrategy)init
{
  ASTUISingularMatrixCalibrationStrategy *v2;
  uint64_t v3;
  ASTUIGazeEnrollmentStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASTUISingularMatrixCalibrationStrategy;
  v2 = -[ASTUISingularMatrixCalibrationStrategy init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    store = v2->_store;
    v2->_store = (ASTUIGazeEnrollmentStore *)v3;

  }
  return v2;
}

- (void)captureGazeEnrollmentPoint:(id)a3
{
  ASTUIGazeEnrollmentStore *store;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  store = self->_store;
  v4 = a3;
  objc_msgSend(v4, "groundTruthPoint");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "predictedPoint");
  v10 = v9;
  v12 = v11;

  -[ASTUIGazeEnrollmentStore saveEnrollmentPoint:withGazePoint:](store, "saveEnrollmentPoint:withGazePoint:", v6, v8, v10, v12);
}

- (void)learnCalibration
{
  void *v3;
  id v4;

  -[ASTUIGazeEnrollmentStore enrollmentPointToGazePointDict](self->_store, "enrollmentPointToGazePointDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTUISingularMatrixCalibrationStrategy learnCalibrationForPoints:](self, "learnCalibrationForPoints:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[ASTUIGazeEnrollmentStore saveCalibratedArray:](self->_store, "saveCalibratedArray:", v4);
}

- (void)reset
{
  -[ASTUIGazeEnrollmentStore clearStore](self->_store, "clearStore");
}

- (id)calibratedArrayForGazePoint:(CGPoint)a3
{
  return -[ASTUIGazeEnrollmentStore calibratedArray](self->_store, "calibratedArray", a3.x, a3.y);
}

- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  v5.receiver = self;
  v5.super_class = (Class)ASTUISingularMatrixCalibrationStrategy;
  -[ASTUILinearMatrixCalibrationStrategy calibratedGazePointForGazePoint:](&v5, sel_calibratedGazePointForGazePoint_, a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)learnCalibrationForPoints:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASTUISingularMatrixCalibrationStrategy;
  -[ASTUILinearMatrixCalibrationStrategy learnCalibrationForPoints:](&v4, sel_learnCalibrationForPoints_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
