@implementation GTAccelerationStructureServerSession

- (void)dealloc
{
  Server *server;
  Transport *htransport;
  Sampler *sampler;
  Server *v6;
  void *dataSource;
  objc_super v8;

  NSLog(CFSTR("Session is deallocating…"), a2);
  server = self->_server;
  if (server)
    (*((void (**)(Server *, Sampler *, _QWORD))server->var0 + 15))(server, self->_sampler, 0);
  htransport = self->_htransport;
  if (htransport)
    (*((void (**)(Transport *))htransport->var0 + 1))(htransport);
  self->_htransport = 0;
  sampler = self->_sampler;
  if (sampler)
    (*((void (**)(Sampler *))sampler->var0 + 1))(sampler);
  self->_sampler = 0;
  v6 = self->_server;
  if (v6)
    (*((void (**)(Server *))v6->var0 + 1))(v6);
  self->_server = 0;
  dataSource = self->_dataSource;
  if (dataSource)
    (*(void (**)(void *))(*(_QWORD *)dataSource + 8))(dataSource);
  self->_dataSource = 0;
  NSLog(CFSTR("Session is deallocated…"));
  v8.receiver = self;
  v8.super_class = (Class)GTAccelerationStructureServerSession;
  -[GTAccelerationStructureServerSession dealloc](&v8, "dealloc");
}

- (void)receiveData:(id)a3
{
  Server *server;
  id v5;
  id v6;

  v6 = a3;
  server = self->_server;
  if (server)
  {
    v5 = objc_retainAutorelease(v6);
    (*((void (**)(Server *, id, id))server->var0 + 4))(server, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  }

}

- (void)nextSample:(unint64_t)a3
{
  void *v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __51__GTAccelerationStructureServerSession_nextSample___block_invoke;
  v6[3] = &unk_7263A0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v6));
  objc_msgSend(self->_clientContext->var7.var0, "addOperation:", v5);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (unint64_t)sessionID
{
  return self->sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->sessionID = a3;
}

- (unint64_t)requestID
{
  return self->requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->requestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBufferDescriptor, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

void __51__GTAccelerationStructureServerSession_nextSample___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id obja;
  id obj;
  id v33;
  void *v34;
  _QWORD v35[5];
  id v36[2];
  id v37;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 7))
  {
    GTMTLReplayController_debugSubCommandStop(*(_QWORD *)(*((_QWORD *)WeakRetained + 1) + 8), *((_DWORD *)WeakRetained + 4), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(v4[1] + 8) + 8), "defaultCommandQueue"));
    v6 = v4[7];
    v7 = v5;
    std::mutex::lock((std::mutex *)(v6 + 48));
    if (*(_QWORD *)(v6 + 17712) && !*(_QWORD *)(v6 + 17728))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MTLCaptureManager sharedCaptureManager](MTLCaptureManager, "sharedCaptureManager"));
      v33 = objc_alloc_init((Class)MTLCaptureDescriptor);
      objc_msgSend(v33, "setDestination:", 2);
      v8 = NSTemporaryDirectory();
      obja = (id)objc_claimAutoreleasedReturnValue(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", obja));
      v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend((id)v10, "timeIntervalSince1970");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ASVSRenderer-%lu.gputrace"), (unint64_t)v11));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", v12));

      obj = (id)v13;
      objc_msgSend(v33, "setOutputURL:", v13);
      objc_msgSend(v33, "setCaptureObject:", v7);
      NSLog(CFSTR("Starting capture of %lu sample(s)…"), *(_QWORD *)(v6 + 17712));
      v37 = 0;
      LOBYTE(v10) = objc_msgSend(v34, "startCaptureWithDescriptor:error:", v33, &v37);
      v14 = v37;
      v15 = v14;
      if ((v10 & 1) != 0)
      {
        v16 = obj;
        objc_storeStrong((id *)(v6 + 17720), obj);
        v17 = v34;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
        NSLog(CFSTR("Unable to capture: %@"), v18);

        v19 = *(void **)(v6 + 17720);
        *(_QWORD *)(v6 + 17720) = 0;

        v17 = 0;
        *(_QWORD *)(v6 + 17712) = 0;
        v16 = obj;
      }
      v20 = *(void **)(v6 + 17728);
      *(_QWORD *)(v6 + 17728) = v17;

    }
    std::mutex::unlock((std::mutex *)(v6 + 48));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandBufferWithDescriptor:", v4[5]));
    objc_msgSend(v21, "setLabel:", CFSTR("ASV Generate Sample"));
    v22 = *(_QWORD *)(a1 + 40);
    if ((*(unsigned int (**)(_QWORD, id))(*(_QWORD *)v4[7] + 96))(v4[7], v7))
      v23 = 0;
    else
      v23 = (void *)(v22 + 30);
    if ((unint64_t)v23 <= 0x7530)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = __51__GTAccelerationStructureServerSession_nextSample___block_invoke_2;
      v35[3] = &unk_725AC0;
      objc_copyWeak(v36, v2);
      v36[1] = v23;
      v35[4] = v4;
      objc_msgSend(v21, "addCompletedHandler:", v35);
      objc_destroyWeak(v36);
    }
    else
    {
      v24 = v4[8];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[ASVError errorWithCode:localizedDescription:](ASVError, "errorWithCode:localizedDescription:", 7, CFSTR("Xcode isn't responding")));
      (*(void (**)(uint64_t, _QWORD, void *))(*(_QWORD *)v24 + 40))(v24, 0, v25);

    }
    GTMTLReplay_commitCommandBuffer(v21);
    v26 = v4[7];
    std::mutex::lock((std::mutex *)(v26 + 48));
    if (*(_QWORD *)(v26 + 17728))
    {
      v27 = *(_QWORD *)(v26 + 17712);
      if (v27)
      {
        v28 = v27 - 1;
        *(_QWORD *)(v26 + 17712) = v28;
        NSLog(CFSTR("Capturing… %lu remaining sample(s)…"), v28);
        if (!*(_QWORD *)(v26 + 17712))
        {
          NSLog(CFSTR("Stopping capture…"));
          objc_msgSend(*(id *)(v26 + 17728), "stopCapture");
          NSLog(CFSTR("Capture complete!"));
          v29 = *(void **)(v26 + 17720);
          *(_QWORD *)(v26 + 17720) = 0;

          v30 = *(void **)(v26 + 17728);
          *(_QWORD *)(v26 + 17728) = 0;

        }
      }
    }
    std::mutex::unlock((std::mutex *)(v26 + 48));

  }
}

void __51__GTAccelerationStructureServerSession_nextSample___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11[2];

  v3 = a2;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __51__GTAccelerationStructureServerSession_nextSample___block_invoke_3;
  v8[3] = &unk_725A98;
  v9 = v3;
  v6 = v3;
  objc_copyWeak(v11, (id *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v11[1] = *(id *)(a1 + 48);
  v10 = v7;
  dispatch_async(v5, v8);

  objc_destroyWeak(v11);
}

void __51__GTAccelerationStructureServerSession_nextSample___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  dispatch_time_t v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8[2];

  objc_msgSend(*(id *)(a1 + 32), "status");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3 > 0x64)
    {
      v4 = dispatch_time(0, 1000000 * v3);
      global_queue = dispatch_get_global_queue(0, 0);
      v6 = objc_claimAutoreleasedReturnValue(global_queue);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = __51__GTAccelerationStructureServerSession_nextSample___block_invoke_4;
      v7[3] = &unk_7263A0;
      objc_copyWeak(v8, (id *)(a1 + 48));
      v8[1] = *(id *)(a1 + 56);
      dispatch_after(v4, v6, v7);

      objc_destroyWeak(v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "nextSample:");
    }
  }

}

void __51__GTAccelerationStructureServerSession_nextSample___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[7])
    objc_msgSend(WeakRetained, "nextSample:", *(_QWORD *)(a1 + 40));

}

+ (void)sessionWithReplayClient:(GTMTLReplayClient *)a3 functionIndex:(unint64_t)a4 requestID:(id)a5 transport:(id)a6 dataHandler:(id)a7 accelerationStructureKey:(unint64_t)a8 completionHandler:(id)a9
{
  id v13;
  id v14;
  GTAccelerationStructureServerSession *v15;
  GTAccelerationStructureServerSession *v16;
  id v17;
  id dataHandler;
  id v19;
  id v20;

  v13 = a5;
  v14 = a6;
  v20 = a7;
  v19 = a9;
  v15 = objc_alloc_init(GTAccelerationStructureServerSession);
  v16 = v15;
  if (v15)
  {
    if (v13)
      v15->requestID = (unint64_t)objc_msgSend(v13, "unsignedLongValue");
    v16->_clientContext = a3;
    v16->_functionIndex = a4;
    objc_storeStrong((id *)&v16->_transport, a6);
    v17 = objc_retainBlock(v20);
    dataHandler = v16->_dataHandler;
    v16->_dataHandler = v17;

    operator new();
  }

}

void __153__GTAccelerationStructureServerSession_sessionWithReplayClient_functionIndex_requestID_transport_dataHandler_accelerationStructureKey_completionHandler___block_invoke(uint64_t a1)
{
  NSLog(CFSTR("sesssion addCompletedHandler - start"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "nextSample:", 0);
  NSLog(CFSTR("sesssion addCompletedHandler - end"));
}

@end
