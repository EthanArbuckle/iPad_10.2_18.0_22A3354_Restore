@implementation _CDPSerializedDataHarvester

- (void)loadWithLimit:(unint64_t)a3 dataPointReader:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;

  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72___CDPSerializedDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke;
  v17[3] = &unk_1E26E6680;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = a3;
  v12 = v17;
  v13 = v9;
  v14 = v8;
  v15 = (void *)os_transaction_create();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_9;
  block[3] = &unk_1E26E3380;
  v22 = v15;
  v23 = v12;
  v16 = v15;
  dispatch_async(v10, block);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
