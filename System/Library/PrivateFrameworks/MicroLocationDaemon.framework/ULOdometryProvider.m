@implementation ULOdometryProvider

- (ULOdometryProvider)initWithQueue:(id)a3 delegate:(id)a4
{
  NSObject *v6;
  id v7;
  ULOdometryProvider *v8;
  void *v9;
  ULOdometryBridge *v10;
  void *v11;
  ULOdometryBridge *v12;
  ULOdometryProvider *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (+[ULOdometryBridge isBackgroundAvailable](ULOdometryBridge, "isBackgroundAvailable"))
  {
    v15.receiver = self;
    v15.super_class = (Class)ULOdometryProvider;
    v8 = -[ULOdometryProvider init](&v15, sel_init);
    dispatch_assert_queue_V2(v6);
    if (v8)
    {
      -[ULOdometryProvider _resetPosition](v8, "_resetPosition");
      -[ULOdometryProvider setTrajectoryUUID:](v8, "setTrajectoryUUID:", 0);
      -[ULOdometryProvider setQueue:](v8, "setQueue:", v6);
      -[ULOdometryProvider setDelegate:](v8, "setDelegate:", v7);
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULOdometryProvider setPreviousStatusUpdateDate:](v8, "setPreviousStatusUpdateDate:", v9);

      v10 = [ULOdometryBridge alloc];
      -[ULOdometryProvider queue](v8, "queue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ULOdometryBridge initWithQueue:delegate:](v10, "initWithQueue:delegate:", v11, v8);
      -[ULOdometryProvider setOdometryBridge:](v8, "setOdometryBridge:", v12);

    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)startBackgroundUpdates
{
  NSObject *v3;
  id v4;

  -[ULOdometryProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ULOdometryProvider setTrajectoryUUID:](self, "setTrajectoryUUID:", 0);
  -[ULOdometryProvider odometryBridge](self, "odometryBridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startBackgroundUpdates");

}

- (void)stopBackgroundUpdates
{
  NSObject *v3;
  id v4;

  -[ULOdometryProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ULOdometryProvider setTrajectoryUUID:](self, "setTrajectoryUUID:", 0);
  -[ULOdometryProvider odometryBridge](self, "odometryBridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopBackgroundUpdates");

}

- (void)_resetPosition
{
  -[ULOdometryProvider setDeltaPositionX:](self, "setDeltaPositionX:", &unk_2511ED840);
  -[ULOdometryProvider setDeltaPositionY:](self, "setDeltaPositionY:", &unk_2511ED840);
  -[ULOdometryProvider setDeltaPositionZ:](self, "setDeltaPositionZ:", &unk_2511ED840);
}

- (void)_resetTrajectory
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ULOdometryProvider setTrajectoryUUID:](self, "setTrajectoryUUID:");

}

- (BOOL)_checkIfExitedBubble
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  BOOL v27;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULOdometerUpdateDistanceIntervalMeters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = v6;
  else
    v7 = &unk_2511ECDF8;

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  -[ULOdometryProvider deltaPositionX](self, "deltaPositionX");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  -[ULOdometryProvider deltaPositionX](self, "deltaPositionX");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;
  -[ULOdometryProvider deltaPositionY](self, "deltaPositionY");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;
  -[ULOdometryProvider deltaPositionY](self, "deltaPositionY");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  -[ULOdometryProvider deltaPositionZ](self, "deltaPositionZ");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23;
  -[ULOdometryProvider deltaPositionZ](self, "deltaPositionZ");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v18 * v21 + v12 * v15 + v24 * v26 > v9 * v9;

  return v27;
}

- (void)_updatePosition:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  id v25;

  v25 = a3;
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[ULOdometryProvider deltaPositionX](self, "deltaPositionX");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v25, "deltaPositionX");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:", v7 + v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULOdometryProvider setDeltaPositionX:](self, "setDeltaPositionX:", v10);

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[ULOdometryProvider deltaPositionY](self, "deltaPositionY");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  objc_msgSend(v25, "deltaPositionY");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v11, "numberWithDouble:", v14 + v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULOdometryProvider setDeltaPositionY:](self, "setDeltaPositionY:", v17);

  v18 = (void *)MEMORY[0x24BDD16E0];
  -[ULOdometryProvider deltaPositionZ](self, "deltaPositionZ");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  objc_msgSend(v25, "deltaPositionZ");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  objc_msgSend(v18, "numberWithDouble:", v21 + v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULOdometryProvider setDeltaPositionZ:](self, "setDeltaPositionZ:", v24);

}

- (id)_getDateFromTimestamp:(double)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v6 + (double)mach_continuous_time() / -24000000.0 + a3);
}

- (void)didReceiveOdometryUpdate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ULOdometryStatus *v20;
  void *v21;
  void *v22;
  void *v23;
  ULOdometryStatus *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ULOdometryProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ULOdometryProvider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULOdometryProvider _updatePosition:](self, "_updatePosition:", v6);
  if (v7)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_42);
    v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v7;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "Received error from odometry, trajectory invalid until update, error: %@", (uint8_t *)&v26, 0xCu);
    }
    -[ULOdometryProvider setTrajectoryUUID:](self, "setTrajectoryUUID:", 0);
    -[ULOdometryProvider previousStatusUpdateDate](self, "previousStatusUpdateDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReceiveOdometryError:withDate:", v7, v11);
  }
  else
  {
    objc_msgSend(v6, "timestamp");
    -[ULOdometryProvider _getDateFromTimestamp:](self, "_getDateFromTimestamp:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULOdometryProvider trajectoryUUID](self, "trajectoryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_42);
      v13 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_DEFAULT, "got update after nil trajectory, starting new trajectory", (uint8_t *)&v26, 2u);
      }
      -[ULOdometryProvider _resetTrajectory](self, "_resetTrajectory");
      -[ULOdometryProvider _resetPosition](self, "_resetPosition");
    }
    -[ULOdometryProvider setPreviousStatusUpdateDate:](self, "setPreviousStatusUpdateDate:", v11);
    if (v12)
    {
      if (!-[ULOdometryProvider _checkIfExitedBubble](self, "_checkIfExitedBubble"))
        goto LABEL_24;
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_42);
      v14 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "odometer exited maximum radius, sending update to delegate", (uint8_t *)&v26, 2u);
      }
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_42);
    v15 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[ULOdometryProvider deltaPositionX](self, "deltaPositionX");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULOdometryProvider deltaPositionY](self, "deltaPositionY");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULOdometryProvider deltaPositionZ](self, "deltaPositionZ");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULOdometryProvider trajectoryUUID](self, "trajectoryUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138413314;
      v27 = v11;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_2419D9000, v15, OS_LOG_TYPE_DEFAULT, "sending odometry update with date: %@, deltaX: %@, deltaY: %@, deltaZ: %@, uuid: %@", (uint8_t *)&v26, 0x34u);

    }
    v20 = [ULOdometryStatus alloc];
    -[ULOdometryProvider deltaPositionX](self, "deltaPositionX");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULOdometryProvider deltaPositionY](self, "deltaPositionY");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULOdometryProvider deltaPositionZ](self, "deltaPositionZ");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[ULOdometryStatus initWithDate:deltaPositionX:deltaPositionY:deltaPositionZ:](v20, "initWithDate:deltaPositionX:deltaPositionY:deltaPositionZ:", v11, v21, v22, v23);
    -[ULOdometryProvider trajectoryUUID](self, "trajectoryUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReceiveOdometryUpdate:uuid:", v24, v25);

    -[ULOdometryProvider _resetPosition](self, "_resetPosition");
  }
LABEL_24:

}

- (ULOdometryProviderDelegate)delegate
{
  return (ULOdometryProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ULOdometryBridge)odometryBridge
{
  return self->_odometryBridge;
}

- (void)setOdometryBridge:(id)a3
{
  objc_storeStrong((id *)&self->_odometryBridge, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUUID)trajectoryUUID
{
  return self->_trajectoryUUID;
}

- (void)setTrajectoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_trajectoryUUID, a3);
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (void)setDeltaPositionX:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionX, a3);
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (void)setDeltaPositionY:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionY, a3);
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (void)setDeltaPositionZ:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionZ, a3);
}

- (NSDate)previousStatusUpdateDate
{
  return self->_previousStatusUpdateDate;
}

- (void)setPreviousStatusUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_previousStatusUpdateDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousStatusUpdateDate, 0);
  objc_storeStrong((id *)&self->_deltaPositionZ, 0);
  objc_storeStrong((id *)&self->_deltaPositionY, 0);
  objc_storeStrong((id *)&self->_deltaPositionX, 0);
  objc_storeStrong((id *)&self->_trajectoryUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_odometryBridge, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
