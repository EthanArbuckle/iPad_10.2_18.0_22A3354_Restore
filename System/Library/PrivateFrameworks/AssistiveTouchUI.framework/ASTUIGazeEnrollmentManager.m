@implementation ASTUIGazeEnrollmentManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_SharedManager;
}

void __43__ASTUIGazeEnrollmentManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_SharedManager;
  sharedManager_SharedManager = v0;

}

- (ASTUIGazeEnrollmentManager)init
{
  ASTUIGazeEnrollmentManager *v2;
  ASTUIGazeEnrollmentManager *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASTUIGazeEnrollmentManager;
  v2 = -[ASTUIGazeEnrollmentManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ASTUIGazeEnrollmentManager _setupCalibrationStrategy](v2, "_setupCalibrationStrategy");
    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __34__ASTUIGazeEnrollmentManager_init__block_invoke;
    v6[3] = &unk_2508199D8;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "registerUpdateBlock:forRetrieveSelector:withListener:", v6, sel_assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy, v3);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __34__ASTUIGazeEnrollmentManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setupCalibrationStrategy");

}

- (void)setEnrollmentComplete:(BOOL)a3
{
  self->_enrollmentComplete = a3;
  if (a3)
    -[ASTUIGazeEnrollmentManager _learnCalibration](self, "_learnCalibration");
}

- (void)resetGazeEnrollment
{
  -[ASTUICalibrationStrategy reset](self->_calibrationStrategy, "reset");
  self->_enrollmentComplete = 0;
}

- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (-[ASTUIGazeEnrollmentManager enrollmentComplete](self, "enrollmentComplete"))
  {
    -[ASTUICalibrationStrategy calibratedGazePointForGazePoint:](self->_calibrationStrategy, "calibratedGazePointForGazePoint:", x, y);
    x = v6;
    y = v7;
  }
  v8 = x;
  v9 = y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)captureCurrentEnrollmentPoint:(CGPoint)a3 gazePoint:(CGPoint)a4 positionName:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;
  id v11;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v10 = a5;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setPredictedPoint:", x, y);
  objc_msgSend(v11, "setGroundTruthPoint:", v8, v7);
  objc_msgSend(v11, "setPositionName:", v10);

  -[ASTUICalibrationStrategy captureGazeEnrollmentPoint:](self->_calibrationStrategy, "captureGazeEnrollmentPoint:", v11);
}

- (void)_learnCalibration
{
  -[ASTUICalibrationStrategy learnCalibration](self->_calibrationStrategy, "learnCalibration");
}

- (void)_setupCalibrationStrategy
{
  void *v3;
  unint64_t v4;
  ASTUICalibrationStrategy *v5;
  ASTUICalibrationStrategy *calibrationStrategy;

  -[ASTUICalibrationStrategy reset](self->_calibrationStrategy, "reset");
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy");

  if (v4 <= 1)
  {
    v5 = (ASTUICalibrationStrategy *)objc_opt_new();
    calibrationStrategy = self->_calibrationStrategy;
    self->_calibrationStrategy = v5;

  }
  AXSCalibrationStrategyName();

}

- (BOOL)enrollmentComplete
{
  return self->_enrollmentComplete;
}

- (ASTUICalibrationStrategy)calibrationStrategy
{
  return self->_calibrationStrategy;
}

- (void)setCalibrationStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_calibrationStrategy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationStrategy, 0);
}

@end
