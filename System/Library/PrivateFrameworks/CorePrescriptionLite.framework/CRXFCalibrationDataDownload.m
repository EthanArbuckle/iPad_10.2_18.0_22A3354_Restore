@implementation CRXFCalibrationDataDownload

- (CRXFCalibrationDataDownload)initWithTimeout:(double)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  CRXFCalibrationDataDownload *v11;
  CRXFCalibrationDataDownload *v12;
  uint64_t v13;
  id completion;
  uint64_t v15;
  CRXUTimer *timer;
  void *v17;
  double v18;
  objc_super v20;

  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CRXFCalibrationDataDownload;
  v11 = -[CRXFCalibrationDataDownload init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_completionQueue, a4);
    v13 = MEMORY[0x23B83F660](v10);
    completion = v12->_completion;
    v12->_completion = (id)v13;

    +[CRXUTimer scheduledTimerWithTimeInterval:weakTarget:selector:repeats:queue:](CRXUTimer, "scheduledTimerWithTimeInterval:weakTarget:selector:repeats:queue:", v12, sel_timerDidFire_, 0, v12->_completionQueue, a3);
    v15 = objc_claimAutoreleasedReturnValue();
    timer = v12->_timer;
    v12->_timer = (CRXUTimer *)v15;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v12->_startTime = v18;

  }
  return v12;
}

- (double)roundtripTime
{
  return self->_roundtripTime;
}

- (void)timerDidFire:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 7, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 147, MEMORY[0x24BDBD1B8]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRXFCalibrationDataDownload finishWithData:error:](self, "finishWithData:error:", 0, v4);

}

- (void)finishWithData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  CRXUTimer *timer;
  void *v9;
  double v10;
  double v11;
  double v12;
  CRXUDispatchQueue *completionQueue;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v6 = a3;
  v7 = a4;
  -[CRXUTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  if (!self->_finished)
  {
    self->_finished = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;

    v12 = v11 - self->_startTime;
    self->_roundtripTime = v12;
    completionQueue = self->_completionQueue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__CRXFCalibrationDataDownload_finishWithData_error___block_invoke;
    v14[3] = &unk_250B03C48;
    v14[4] = self;
    v15 = v6;
    v17 = v12;
    v16 = v7;
    -[CRXUDispatchQueue dispatchAsync:](completionQueue, "dispatchAsync:", v14);

  }
}

uint64_t __52__CRXFCalibrationDataDownload_finishWithData_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end
