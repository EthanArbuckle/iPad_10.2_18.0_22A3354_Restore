@implementation HKClinicalDocumentDownloader

- (HKClinicalDocumentDownloader)init
{
  void *v3;
  HKClinicalDocumentDownloader *v4;

  +[HKHealthRecordsDaemonConnection sharedConnection](HKHealthRecordsDaemonConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKClinicalDocumentDownloader initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (HKClinicalDocumentDownloader)initWithConnection:(id)a3
{
  id v4;
  HKClinicalDocumentDownloader *v5;
  HKHealthRecordsDaemonProxyProvider *v6;
  HKProxyProvider *proxyProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalDocumentDownloader;
  v5 = -[HKClinicalDocumentDownloader init](&v9, sel_init);
  if (v5)
  {
    v6 = -[HKHealthRecordsDaemonProxyProvider initWithConnection:serviceIdentifier:exportedObject:]([HKHealthRecordsDaemonProxyProvider alloc], "initWithConnection:serviceIdentifier:exportedObject:", v4, CFSTR("ClinicalDocumentDownloader"), v5);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = &v6->super;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

- (void)beginOrResumeDownloadingAttachments:(id)a3 shouldRequestMore:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __97__HKClinicalDocumentDownloader_beginOrResumeDownloadingAttachments_shouldRequestMore_completion___block_invoke;
  v15[3] = &unk_24D549B00;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __97__HKClinicalDocumentDownloader_beginOrResumeDownloadingAttachments_shouldRequestMore_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKClinicalDocumentDownloader _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __97__HKClinicalDocumentDownloader_beginOrResumeDownloadingAttachments_shouldRequestMore_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_beginOrResumeDownloadingAttachments:shouldRequestMore:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __97__HKClinicalDocumentDownloader_beginOrResumeDownloadingAttachments_shouldRequestMore_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)downloadAttachment:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__HKClinicalDocumentDownloader_downloadAttachment_completion___block_invoke;
  v13[3] = &unk_24D549B28;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __62__HKClinicalDocumentDownloader_downloadAttachment_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalDocumentDownloader _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __62__HKClinicalDocumentDownloader_downloadAttachment_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_downloadAttachment:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __62__HKClinicalDocumentDownloader_downloadAttachment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pingDownloaderWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__HKClinicalDocumentDownloader_pingDownloaderWithCompletion___block_invoke;
  v9[3] = &unk_24D549B50;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __61__HKClinicalDocumentDownloader_pingDownloaderWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalDocumentDownloader _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __61__HKClinicalDocumentDownloader_pingDownloaderWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pingDownloaderWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __61__HKClinicalDocumentDownloader_pingDownloaderWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerDownloadForAttachment:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__HKClinicalDocumentDownloader_triggerDownloadForAttachment_completion___block_invoke;
  v13[3] = &unk_24D549B28;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __72__HKClinicalDocumentDownloader_triggerDownloadForAttachment_completion___block_invoke_2;
  v11[3] = &unk_24D549308;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKClinicalDocumentDownloader _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __72__HKClinicalDocumentDownloader_triggerDownloadForAttachment_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerDownloadForAttachment:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __72__HKClinicalDocumentDownloader_triggerDownloadForAttachment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (id)exportedInterface
{
  return objc_alloc_init(MEMORY[0x24BDD1990]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
