@implementation IDSCloudKitContainer

- (IDSCloudKitContainer)initWithIdentifier:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  IDSCloudKitContainer *v8;
  IDSCloudKitContainer *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  IDSCKContainer *container;
  IDSCloudKitKeyValueStore *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  uint64_t v21;
  IDSCloudKitKeyValueStore *keyValueStore;
  IDSCloudKitGroupServer *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  uint64_t v34;
  IDSCloudKitGroupServer *publicGroupServer;
  IDSCloudKitGroupServer *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  uint64_t v47;
  IDSCloudKitGroupServer *privateGroupServer;
  IDSCloudKitTransportLog *v49;
  const char *v50;
  uint64_t v51;
  double v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  double v56;
  void *v57;
  const char *v58;
  double v59;
  uint64_t v60;
  IDSCloudKitTransportLog *transportLog;
  IDSCloudKitKeyElectionStore *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  uint64_t v73;
  IDSCloudKitKeyElectionStore *keyElectionStore;
  objc_super v76;

  v6 = a3;
  v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)IDSCloudKitContainer;
  v8 = -[IDSCloudKitContainer init](&v76, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_msgSend_containerWithIdentifier_(IDSCKContainer, v10, (uint64_t)v6, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    container = v9->_container;
    v9->_container = (IDSCKContainer *)v12;

    v14 = [IDSCloudKitKeyValueStore alloc];
    objc_msgSend_container(v9, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_initWithContainer_queue_(v14, v19, (uint64_t)v18, v20, v7);
    keyValueStore = v9->_keyValueStore;
    v9->_keyValueStore = (IDSCloudKitKeyValueStore *)v21;

    v23 = [IDSCloudKitGroupServer alloc];
    objc_msgSend_container(v9, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicCloudDatabase(v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_initWithDatabase_queue_(v23, v32, (uint64_t)v31, v33, v7);
    publicGroupServer = v9->_publicGroupServer;
    v9->_publicGroupServer = (IDSCloudKitGroupServer *)v34;

    v36 = [IDSCloudKitGroupServer alloc];
    objc_msgSend_container(v9, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateCloudDatabase(v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_initWithDatabase_queue_(v36, v45, (uint64_t)v44, v46, v7);
    privateGroupServer = v9->_privateGroupServer;
    v9->_privateGroupServer = (IDSCloudKitGroupServer *)v47;

    v49 = [IDSCloudKitTransportLog alloc];
    objc_msgSend_container(v9, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateCloudDatabase(v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_initWithDatabase_queue_(v49, v58, (uint64_t)v57, v59, v7);
    transportLog = v9->_transportLog;
    v9->_transportLog = (IDSCloudKitTransportLog *)v60;

    v62 = [IDSCloudKitKeyElectionStore alloc];
    objc_msgSend_container(v9, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateCloudDatabase(v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_initWithDatabase_queue_(v62, v71, (uint64_t)v70, v72, v7);
    keyElectionStore = v9->_keyElectionStore;
    v9->_keyElectionStore = (IDSCloudKitKeyElectionStore *)v73;

  }
  return v9;
}

- (NSString)containerIdentifier
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_container(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSCKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (IDSCloudKitKeyValueStore)keyValueStore
{
  return self->_keyValueStore;
}

- (IDSCloudKitGroupServer)publicGroupServer
{
  return self->_publicGroupServer;
}

- (IDSCloudKitGroupServer)privateGroupServer
{
  return self->_privateGroupServer;
}

- (IDSCloudKitTransportLog)transportLog
{
  return self->_transportLog;
}

- (IDSCloudKitKeyElectionStore)keyElectionStore
{
  return self->_keyElectionStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyElectionStore, 0);
  objc_storeStrong((id *)&self->_transportLog, 0);
  objc_storeStrong((id *)&self->_privateGroupServer, 0);
  objc_storeStrong((id *)&self->_publicGroupServer, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
