@implementation CRXFFetchUserInfoRequest

- (CRXFFetchUserInfoRequest)initWithTimeout:(double)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  CRXFFetchUserInfoRequest *v11;
  CRXFFetchUserInfoRequest *v12;
  uint64_t v13;
  id completion;
  uint64_t v15;
  CRXUTimer *timer;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRXFFetchUserInfoRequest;
  v11 = -[CRXFFetchUserInfoRequest init](&v18, sel_init);
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

  }
  return v12;
}

- (void)timerDidFire:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 7, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 214, MEMORY[0x24BDBD1B8]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRXFFetchUserInfoRequest finishWithUserInfo:error:](self, "finishWithUserInfo:error:", 0, v4);

}

- (void)finishWithUserInfo:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  CRXUTimer *timer;
  CRXUDispatchQueue *completionQueue;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[CRXUTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  if (!self->_finished)
  {
    self->_finished = 1;
    completionQueue = self->_completionQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __53__CRXFFetchUserInfoRequest_finishWithUserInfo_error___block_invoke;
    v10[3] = &unk_250B03C70;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[CRXUDispatchQueue dispatchAsync:](completionQueue, "dispatchAsync:", v10);

  }
}

uint64_t __53__CRXFFetchUserInfoRequest_finishWithUserInfo_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 24) + 16))(*(_QWORD *)(a1[4] + 24), a1[5], a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end
