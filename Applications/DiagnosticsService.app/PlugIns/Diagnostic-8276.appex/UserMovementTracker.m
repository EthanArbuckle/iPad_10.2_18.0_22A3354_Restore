@implementation UserMovementTracker

- (id)init:(id)a3 noMovementAttitudeChangeMinThreshold:(double)a4 noMovementMinTimeSeconds:(double)a5 startMovementTrackingNow:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  UserMovementTracker *v11;
  UserMovementTracker *v12;
  UserMovementTracker *v13;
  objc_super v15;

  v6 = a6;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UserMovementTracker;
  v11 = -[UserMovementTracker init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    -[UserMovementTracker initMembers:noMovementAttitudeChangeMinThreshold:noMovementMinTimeSeconds:](v11, "initMembers:noMovementAttitudeChangeMinThreshold:noMovementMinTimeSeconds:", v10, a4, a5);
    if (v6)
      -[UserMovementTracker startUserMotionTracking](v12, "startUserMotionTracking");
    v13 = v12;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[UserMovementTracker stopDeviceMotionTracking](self, "stopDeviceMotionTracking");
  v3.receiver = self;
  v3.super_class = (Class)UserMovementTracker;
  -[UserMovementTracker dealloc](&v3, "dealloc");
}

- (void)initMembers:(id)a3 noMovementAttitudeChangeMinThreshold:(double)a4 noMovementMinTimeSeconds:(double)a5
{
  id v8;
  CMMotionManager *v9;
  CMMotionManager *m_cmMotionManager;
  NSOperationQueue *v11;
  NSOperationQueue *m_operationQueue;
  id v13;

  v8 = a3;
  v13 = v8;
  if (v8)
    v9 = (CMMotionManager *)v8;
  else
    v9 = objc_opt_new(CMMotionManager);
  m_cmMotionManager = self->m_cmMotionManager;
  self->m_cmMotionManager = v9;

  -[UserMovementTracker setMovementState:](self, "setMovementState:", 0);
  self->m_noMovementAttitudeChangeMinThreshold = a4;
  self->m_noMovementMinTimeSeconds = a5;
  self->m_isNoMovementPhase = 0;
  v11 = objc_opt_new(NSOperationQueue);
  m_operationQueue = self->m_operationQueue;
  self->m_operationQueue = v11;

}

- (void)startUserMotionTracking
{
  CMMotionManager *m_cmMotionManager;
  NSOperationQueue *m_operationQueue;
  _QWORD v5[5];

  if (-[CMMotionManager isDeviceMotionAvailable](self->m_cmMotionManager, "isDeviceMotionAvailable"))
  {
    if (!-[CMMotionManager isDeviceMotionActive](self->m_cmMotionManager, "isDeviceMotionActive"))
    {
      m_cmMotionManager = self->m_cmMotionManager;
      m_operationQueue = self->m_operationQueue;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000020C4;
      v5[3] = &unk_100028988;
      v5[4] = self;
      -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](m_cmMotionManager, "startDeviceMotionUpdatesToQueue:withHandler:", m_operationQueue, v5);
      -[UserMovementTracker frequencyToTimePeriod:](self, "frequencyToTimePeriod:", 2);
      -[CMMotionManager setDeviceMotionUpdateInterval:](self->m_cmMotionManager, "setDeviceMotionUpdateInterval:");
      -[UserMovementTracker setMovementState:](self, "setMovementState:", 0);
    }
  }
}

- (double)frequencyToTimePeriod:(unsigned int)a3
{
  return 1.0 / (double)a3;
}

- (void)stopDeviceMotionTracking
{
  CMMotionManager *m_cmMotionManager;

  m_cmMotionManager = self->m_cmMotionManager;
  if (m_cmMotionManager)
  {
    if (-[CMMotionManager isDeviceMotionActive](m_cmMotionManager, "isDeviceMotionActive"))
    {
      -[CMMotionManager stopDeviceMotionUpdates](self->m_cmMotionManager, "stopDeviceMotionUpdates");
      -[UserMovementTracker setMovementState:](self, "setMovementState:", 0);
    }
  }
}

- (void)processDeviceMotionUpdate:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (a4)
  {
    -[UserMovementTracker setMovementState:](self, "setMovementState:", 3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attitude"));
    objc_msgSend(v8, "timestamp");
    -[UserMovementTracker processAttitudeChange:timestamp:](self, "processAttitudeChange:timestamp:", v7);

  }
}

- (void)processAttitudeChange:(id)a3 timestamp:(double)a4
{
  id v6;
  AttitudeInformation *v7;
  void *v8;
  double v9;
  AttitudeInformation *m_lastAttitude;

  v6 = a3;
  v7 = -[AttitudeInformation init:]([AttitudeInformation alloc], "init:", v6);

  if (self->m_lastAttitude)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AttitudeInformation subtract:](v7, "subtract:"));
    objc_msgSend(v8, "l2Norm");
    if (v9 >= self->m_noMovementAttitudeChangeMinThreshold)
      -[UserMovementTracker handleUserMovement](self, "handleUserMovement");
    else
      -[UserMovementTracker handleNoUserMovement:](self, "handleNoUserMovement:", a4);

  }
  m_lastAttitude = self->m_lastAttitude;
  self->m_lastAttitude = v7;

}

- (void)handleNoUserMovement:(double)a3
{
  if (!self->m_isNoMovementPhase)
    -[UserMovementTracker initializeNoMovementPhase:](self, "initializeNoMovementPhase:", a3);
  if (-[UserMovementTracker movementState](self, "movementState") != 1
    && a3 - self->m_noMovementStartTimestamp > self->m_noMovementMinTimeSeconds)
  {
    -[UserMovementTracker setMovementState:](self, "setMovementState:", 1);
  }
}

- (void)initializeNoMovementPhase:(double)a3
{
  self->m_isNoMovementPhase = 1;
  self->m_noMovementStartTimestamp = a3;
}

- (void)handleUserMovement
{
  if (self->m_isNoMovementPhase)
  {
    self->m_isNoMovementPhase = 0;
    if (-[UserMovementTracker movementState](self, "movementState") != 2)
      -[UserMovementTracker setMovementState:](self, "setMovementState:", 2);
  }
}

- (int)movementState
{
  return self->movementState;
}

- (void)setMovementState:(int)a3
{
  self->movementState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_operationQueue, 0);
  objc_storeStrong((id *)&self->m_lastAttitude, 0);
  objc_storeStrong((id *)&self->m_cmMotionManager, 0);
}

@end
