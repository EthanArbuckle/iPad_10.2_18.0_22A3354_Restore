@implementation RotationTestProcessor

- (RotationTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  RotationTestProcessor *v4;
  RotationTestProcessor *v5;
  RotationTestProcessor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RotationTestProcessor;
  v4 = -[ContentInteractionTestRunner initWithTestName:browserController:](&v8, sel_initWithTestName_browserController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RotationTestProcessor setTestState:](v4, "setTestState:", 0);
    v6 = v5;
  }

  return v5;
}

- (BOOL)startPageAction:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  -[RotationTestProcessor setIterationsRemaining:](self, "setIterationsRemaining:", -[ContentInteractionTestRunner iterations](self, "iterations"));
  -[RotationTestProcessor setTestState:](self, "setTestState:", 1);
  v6.receiver = self;
  v6.super_class = (Class)RotationTestProcessor;
  LOBYTE(self) = -[ContentInteractionTestRunner startPageAction:](&v6, sel_startPageAction_, v4);

  return (char)self;
}

- (void)startRotation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusBarOrientation");

  if (v4 == 3)
    v5 = 1;
  else
    v5 = 3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__RotationTestProcessor_startRotation__block_invoke;
  v8[3] = &unk_1E9CF16A0;
  v8[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__RotationTestProcessor_startRotation__block_invoke_2;
  v7[3] = &unk_1E9CF16A0;
  objc_msgSend(v6, "rotateIfNeeded:before:after:", v5, v8, v7);
  -[RotationTestProcessor setTestState:](self, "setTestState:", 2);

}

uint64_t __38__RotationTestProcessor_startRotation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startTrackingFrameRate");
}

uint64_t __38__RotationTestProcessor_startRotation__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endTrackingFrameRate");
  return objc_msgSend(*(id *)(a1 + 32), "setTestState:", 4);
}

- (BOOL)performActionForPage:(id)a3
{
  if (-[RotationTestProcessor testState](self, "testState", a3) == 1)
    -[RotationTestProcessor startRotation](self, "startRotation");
  return -[RotationTestProcessor testState](self, "testState") != 4;
}

- (int)iterationsRemaining
{
  return self->_iterationsRemaining;
}

- (void)setIterationsRemaining:(int)a3
{
  self->_iterationsRemaining = a3;
}

- (int64_t)testState
{
  return self->_testState;
}

- (void)setTestState:(int64_t)a3
{
  self->_testState = a3;
}

@end
