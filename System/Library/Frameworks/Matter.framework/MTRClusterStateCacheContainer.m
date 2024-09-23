@implementation MTRClusterStateCacheContainer

- (MTRClusterStateCacheContainer)init
{
  MTRClusterStateCacheContainer *v2;
  MTRClusterStateCacheContainer *v3;
  MTRBaseDevice *baseDevice;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTRClusterStateCacheContainer;
  v2 = -[MTRClusterStateCacheContainer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    baseDevice = v2->_baseDevice;
    v2->_cppClusterStateCache = 0;
    v2->_baseDevice = 0;

    v3->_shouldUseXPC = 0;
  }
  return v3;
}

- (void)setXPCConnection:(id)a3 controllerID:(id)a4 deviceID:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_setXpcConnection_(self, v10, (uint64_t)v14);
  objc_msgSend_setXpcControllerID_(self, v11, (uint64_t)v8);
  objc_msgSend_setDeviceID_(self, v12, (uint64_t)v9);
  objc_msgSend_setShouldUseXPC_(self, v13, 1);

}

- (void)readAttributesWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  NSNumber *v12;
  NSNumber *v13;
  NSObject *v14;
  MTRDeviceResponseHandler v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  const char *v45;
  NSNumber *v46;
  _QWORD v47[4];
  void (**v48)(_QWORD, _QWORD, _QWORD);
  _QWORD v49[4];
  NSNumber *v50;
  NSNumber *v51;
  MTRClusterStateCacheContainer *v52;
  NSNumber *v53;
  void (**v54)(_QWORD, _QWORD, _QWORD);
  _QWORD v55[4];
  id v56;
  id v57;
  NSNumber *v58;
  NSNumber *v59;
  NSNumber *v60;
  void (**v61)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[8];
  _QWORD v63[4];
  NSObject *v64;
  id v65;

  v46 = endpointID;
  v12 = clusterID;
  v13 = attributeID;
  v14 = queue;
  v15 = completion;
  v16 = MEMORY[0x24BDAC760];
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = sub_23400AFA4;
  v63[3] = &unk_2505009E8;
  v17 = v14;
  v64 = v17;
  v18 = v15;
  v65 = v18;
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x23493EEA8](v63);
  if (objc_msgSend_shouldUseXPC(self, v20, v21))
  {
    objc_msgSend_xpcConnection(self, v22, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend_xpcControllerID(self, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceID(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v16;
      v55[1] = 3221225472;
      v55[2] = sub_23400B070;
      v55[3] = &unk_250500A38;
      v31 = v27;
      v56 = v31;
      v57 = v30;
      v58 = v46;
      v59 = v12;
      v60 = v13;
      v61 = v19;
      v32 = v30;
      objc_msgSend_getProxyHandleWithCompletion_(v26, v33, (uint64_t)v55);

    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v42, OS_LOG_TYPE_ERROR, "Attribute cache read failed: MTRDeviceController was already disposed", buf, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v43, (uint64_t)CFSTR("MTRErrorDomain"), 1, 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v19)[2](v19, 0, v31);
    }

  }
  else
  {
    objc_msgSend_baseDevice(self, v22, v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend_baseDevice(self, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceController(v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v16;
      v49[1] = 3221225472;
      v49[2] = sub_23400B2E0;
      v49[3] = &unk_250500A60;
      v50 = v46;
      v51 = v12;
      v54 = v19;
      v52 = self;
      v53 = v13;
      v47[0] = v16;
      v47[1] = 3221225472;
      v47[2] = sub_23400BE4C;
      v47[3] = &unk_2504F4918;
      v48 = v54;
      objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(v40, v41, (uint64_t)v49, v47);

      v26 = v50;
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v44, OS_LOG_TYPE_ERROR, "Error: No attribute cache available to read from", buf, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v45, (uint64_t)CFSTR("MTRErrorDomain"), 1, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v19)[2](v19, 0, v26);
    }
  }

}

- (void)_readKnownCachedAttributeWithEndpointID:(unsigned __int16)a3 clusterID:(unsigned int)a4 attributeID:(unsigned int)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  _QWORD v29[4];
  void (**v30)(_QWORD, _QWORD, _QWORD);
  _QWORD v31[5];
  void (**v32)(_QWORD, _QWORD, _QWORD);
  unsigned int v33;
  unsigned int v34;
  unsigned __int16 v35;
  __int128 v36;
  int v37;
  _QWORD v38[4];
  id v39;
  id v40;

  v12 = a6;
  v13 = a7;
  v14 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = sub_23400C094;
  v38[3] = &unk_250500A88;
  v15 = v12;
  v39 = v15;
  v16 = v13;
  v40 = v16;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x23493EEA8](v38);
  objc_msgSend_baseDevice(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_baseDevice(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceController(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v14;
    v31[1] = 3221225472;
    v31[2] = sub_23400C160;
    v31[3] = &unk_250500AB0;
    v31[4] = self;
    v32 = v17;
    v35 = a3;
    v33 = a4;
    v34 = a5;
    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = sub_23400C388;
    v29[3] = &unk_2504F4918;
    v30 = v32;
    objc_msgSend_asyncDispatchToMatterQueue_errorHandler_(v26, v27, (uint64_t)v31, v29);

  }
  else
  {
    LODWORD(v36) = 3;
    *((_QWORD *)&v36 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTRClusterStateCacheContainer.mm";
    v37 = 216;
    sub_2340017F0((uint64_t)MTRError, &v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v17)[2](v17, 0, v28);

  }
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MTRDeviceControllerXPCConnection)xpcConnection
{
  return (MTRDeviceControllerXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (NSCopying)xpcControllerID
{
  return self->_xpcControllerID;
}

- (void)setXpcControllerID:(id)a3
{
  objc_storeStrong((id *)&self->_xpcControllerID, a3);
}

- (BOOL)shouldUseXPC
{
  return self->_shouldUseXPC;
}

- (void)setShouldUseXPC:(BOOL)a3
{
  self->_shouldUseXPC = a3;
}

- (void)cppClusterStateCache
{
  return self->_cppClusterStateCache;
}

- (void)setCppClusterStateCache:(void *)a3
{
  self->_cppClusterStateCache = a3;
}

- (MTRBaseDevice)baseDevice
{
  return self->_baseDevice;
}

- (void)setBaseDevice:(id)a3
{
  objc_storeStrong((id *)&self->_baseDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDevice, 0);
  objc_storeStrong((id *)&self->_xpcControllerID, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
