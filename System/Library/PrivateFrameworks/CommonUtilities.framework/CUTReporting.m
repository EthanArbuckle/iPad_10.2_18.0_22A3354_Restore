@implementation CUTReporting

+ (id)reportingSession
{
  if (qword_1EE5CD6A8 != -1)
    dispatch_once(&qword_1EE5CD6A8, &unk_1E448FF78);
  return (id)qword_1EE5CD6B8;
}

- (CUTReporting)init
{
  CUTReporting *v2;
  CUTReporting *v3;
  CUTPromise *promise;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUTReporting;
  v2 = -[CUTReporting init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    promise = v2->_promise;
    v2->_promise = 0;

    v3->_promiseLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

+ (void)startRTCReportingSessionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  if (CUTIsInternalInstall())
  {
    sub_1A0BCA954();
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A0BCA994;
    block[3] = &unk_1E4490288;
    v6 = v3;
    dispatch_async(v4, block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

+ (id)RTCSessionPromiseWithBatchingInterval:(double)a3
{
  void *v4;
  void *v5;

  +[CUTReporting reportingSession](CUTReporting, "reportingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_RTCSessionPromiseWithBatchingInterval:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_RTCSessionPromiseWithBatchingInterval:(double)a3
{
  os_unfair_lock_s *p_promiseLock;
  CUTPromise *promise;
  CUTPromise *v7;
  CUTPromiseSeal *v8;
  void *v9;
  CUTPromiseSeal *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  p_promiseLock = &self->_promiseLock;
  os_unfair_lock_lock(&self->_promiseLock);
  promise = self->_promise;
  if (promise)
  {
    v7 = promise;
    os_unfair_lock_unlock(p_promiseLock);
  }
  else
  {
    v8 = [CUTPromiseSeal alloc];
    sub_1A0BCA954();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CUTPromiseSeal initWithQueue:](v8, "initWithQueue:", v9);

    -[CUTPromiseSeal promise](v10, "promise");
    v7 = (CUTPromise *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_promise, v7);
    os_unfair_lock_unlock(p_promiseLock);
    if (v10)
    {
      -[CUTReporting _beginPromiseTimeoutWithInterval:](self, "_beginPromiseTimeoutWithInterval:", (uint64_t)a3);
      if (CUTIsInternalInstall())
      {
        +[CUTReporting _rtcReportingSession](CUTReporting, "_rtcReportingSession");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[CUTReporting _startConfigurationOfSession:withPromiseSeal:](self, "_startConfigurationOfSession:withPromiseSeal:", v11, v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CUTReportingErrorDomain"), 2, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUTReporting _failSeal:withError:](self, "_failSeal:withError:", v10, v15);

        }
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB2938];
        v18[0] = CFSTR("CUTReporting does not support non-internal builds.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("CUTReportingErrorDomain"), 1, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUTReporting _failSeal:withError:](self, "_failSeal:withError:", v10, v14);

      }
    }
  }
  return v7;
}

+ (id)_rtcReportingSession
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  if (qword_1EE5CD640 != -1)
    dispatch_once(&qword_1EE5CD640, &unk_1E4490428);
  v2 = (void *)qword_1EE5CD638;
  if (qword_1EE5CD638)
    v2 = *(void **)qword_1EE5CD638;
  v3 = v2;
  v22[0] = v3;
  v23[0] = &unk_1E4494078;
  if (qword_1EE5CD650 != -1)
    dispatch_once(&qword_1EE5CD650, &unk_1E4490448);
  v4 = (void *)qword_1EE5CD648;
  if (qword_1EE5CD648)
    v4 = *(void **)qword_1EE5CD648;
  v5 = v4;
  v22[1] = v5;
  v23[1] = &unk_1E4494090;
  if (qword_1EE5CD660 != -1)
    dispatch_once(&qword_1EE5CD660, &unk_1E4490468);
  v6 = (void *)qword_1EE5CD658;
  if (qword_1EE5CD658)
    v6 = *(void **)qword_1EE5CD658;
  v7 = v6;
  v22[2] = v7;
  v23[2] = &unk_1E4494090;
  if (qword_1EE5CD630 != -1)
    dispatch_once(&qword_1EE5CD630, &unk_1E4490488);
  v8 = (void *)qword_1EE5CD628;
  if (qword_1EE5CD628)
    v8 = *(void **)qword_1EE5CD628;
  v22[3] = v8;
  v23[3] = MEMORY[0x1E0C9AAB0];
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = v8;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1EE5CD670 != -1)
    dispatch_once(&qword_1EE5CD670, &unk_1E4490038);
  v12 = (void *)qword_1EE5CD668;
  if (qword_1EE5CD668)
    v12 = *(void **)qword_1EE5CD668;
  v13 = v12;
  v20[0] = v13;
  v21[0] = CFSTR("ids");
  if (qword_1EE5CD680 != -1)
    dispatch_once(&qword_1EE5CD680, &unk_1E44904A8);
  v14 = (void *)qword_1EE5CD678;
  if (qword_1EE5CD678)
    v14 = *(void **)qword_1EE5CD678;
  v20[1] = v14;
  v21[1] = CFSTR("client");
  v15 = (void *)MEMORY[0x1E0C99D80];
  v16 = v14;
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1EE5CD690 != -1)
    dispatch_once(&qword_1EE5CD690, &unk_1E448FFF8);
  v18 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass(CFSTR("RTCReporting"), CFSTR("RTCReporting"))), "initWithSessionInfo:userInfo:frameworksToCheck:", v11, v17, qword_1EE5CD688);

  return v18;
}

- (void)_beginPromiseTimeoutWithInterval:(int64_t)a3
{
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = dispatch_time(0, 1000000000 * a3);
  sub_1A0BCA954();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A0BCB034;
  block[3] = &unk_1E44903C0;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

- (void)_startConfigurationOfSession:(id)a3 withPromiseSeal:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A0BCB11C;
  v10[3] = &unk_1E44903E8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "startConfigurationWithCompletionHandler:", v10);

}

- (void)_fullfillSeal:(id)a3 withSession:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  sub_1A0BCA954();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A0BCB248;
  v10[3] = &unk_1E44901E0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

- (void)_failSeal:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  sub_1A0BCA954();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A0BCB304;
  v10[3] = &unk_1E44901E0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

- (CUTPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (os_unfair_lock_s)promiseLock
{
  return self->_promiseLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
}

@end
