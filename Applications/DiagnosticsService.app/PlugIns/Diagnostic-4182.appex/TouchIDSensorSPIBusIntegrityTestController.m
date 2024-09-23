@implementation TouchIDSensorSPIBusIntegrityTestController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[TouchIDSensorSPIBusIntegrityTestController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController inputs](self, "inputs"));
  if (!objc_msgSend(v3, "numberOfRuns"))
  {

    goto LABEL_7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController inputs](self, "inputs"));
  objc_msgSend(v4, "runDelay");
  v6 = v5;

  if (v6 == 0.0)
  {
LABEL_7:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController result](self, "result"));
    objc_msgSend(v11, "setStatusCode:", &off_1000043A0);

    -[TouchIDSensorSPIBusIntegrityTestController setFinished:](self, "setFinished:", 1);
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController result](self, "result"));
  objc_msgSend(v7, "setStatusCode:", &off_1000043B8);

  v8 = objc_alloc((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController inputs](self, "inputs"));
  v10 = objc_msgSend(v8, "initWithCapacity:", (int)objc_msgSend(v9, "numberOfRuns"));
  -[TouchIDSensorSPIBusIntegrityTestController setAllResults:](self, "setAllResults:", v10);

  -[TouchIDSensorSPIBusIntegrityTestController setRunCount:](self, "setRunCount:", 0);
  if ((-[TouchIDSensorSPIBusIntegrityTestController isCancelled](self, "isCancelled") & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001C74;
    block[3] = &unk_100004128;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)runDiagnostic
{
  uint64_t v3;
  void *v4;
  signed int v5;
  void *v6;
  signed int v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];

  if ((-[TouchIDSensorSPIBusIntegrityTestController isCancelled](self, "isCancelled") & 1) != 0
    || (v3 = objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController runTimer](self, "runTimer"))) == 0
    || (v4 = (void *)v3,
        v5 = -[TouchIDSensorSPIBusIntegrityTestController runCount](self, "runCount"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController inputs](self, "inputs")),
        v7 = objc_msgSend(v6, "numberOfRuns"),
        v6,
        v4,
        v5 >= v7))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController runTimer](self, "runTimer"));
    objc_msgSend(v9, "invalidate");

  }
  else
  {
    v8 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4182.SPIIntegrity", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001DF0;
    block[3] = &unk_100004128;
    block[4] = self;
    dispatch_async(v8, block);

  }
}

- (void)finish
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v6 = CFSTR("results");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController allResults](self, "allResults"));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController result](self, "result"));
  objc_msgSend(v5, "setData:", v4);

  -[TouchIDSensorSPIBusIntegrityTestController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController runTimer](self, "runTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDSensorSPIBusIntegrityTestController runTimer](self, "runTimer"));
    objc_msgSend(v4, "invalidate");

    -[TouchIDSensorSPIBusIntegrityTestController setRunTimer:](self, "setRunTimer:", 0);
  }
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
  objc_storeStrong((id *)&self->_allResults, a3);
}

- (NSTimer)runTimer
{
  return self->_runTimer;
}

- (void)setRunTimer:(id)a3
{
  objc_storeStrong((id *)&self->_runTimer, a3);
}

- (int)runCount
{
  return self->_runCount;
}

- (void)setRunCount:(int)a3
{
  self->_runCount = a3;
}

- (TouchIDSensorSPIBusIntegrityInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_runTimer, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
}

@end
