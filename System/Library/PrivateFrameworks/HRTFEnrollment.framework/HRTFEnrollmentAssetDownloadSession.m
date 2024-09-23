@implementation HRTFEnrollmentAssetDownloadSession

- (HRTFEnrollmentAssetDownloadSession)initWithOptions:(AssetDownloadOptions)a3 progressCallback:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  HRTFEnrollmentAssetDownloadSession *v10;
  HRTFEnrollmentAssetDownloadSession *v11;
  uint64_t v12;
  id progressCallback;
  uint64_t v14;
  id completion;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HRTFEnrollmentAssetDownloadSession;
  v10 = -[HRTFEnrollmentAssetDownloadSession init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_options = a3;
    v12 = MEMORY[0x22766DCE8](v8);
    progressCallback = v11->_progressCallback;
    v11->_progressCallback = (id)v12;

    v14 = MEMORY[0x22766DCE8](v9);
    completion = v11->_completion;
    v11->_completion = (id)v14;

  }
  return v11;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HRTFEnrollmentAssetDownloadSession_start__block_invoke;
  block[3] = &unk_24E718BA8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __43__HRTFEnrollmentAssetDownloadSession_start__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
}

- (void)cancel
{
  NSXPCConnection *connection;
  void *v3;
  HRTFEnrollmentAssetDownloadSession *obj;

  obj = self;
  objc_sync_enter(obj);
  connection = obj->_connection;
  if (connection)
  {
    -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAssetDownloadSession");

  }
  objc_sync_exit(obj);

}

- (void)assetDownloadSessionProgressUpdate:(id)a3
{
  void (**progressCallback)(id, id);

  progressCallback = (void (**)(id, id))self->_progressCallback;
  if (progressCallback)
    progressCallback[2](progressCallback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progressCallback, 0);
}

@end
