@implementation CRKCertificateExchangeBroadcastHandler

- (CRKCertificateExchangeBroadcastHandler)initWithIDSPrimitives:(id)a3 appleIDProvider:(id)a4
{
  id v7;
  id v8;
  CRKCertificateExchangeBroadcastHandler *v9;
  CRKCertificateExchangeBroadcastHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKCertificateExchangeBroadcastHandler;
  v9 = -[CRKCertificateExchangeBroadcastHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_IDSPrimitives, a3);
    objc_storeStrong((id *)&v10->_appleIDProvider, a4);
  }

  return v10;
}

- (void)processMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  NSObject *v31;
  _BOOL4 v32;
  objc_class *v33;
  void *v34;
  CRKRequestCertificatesResponseIDSMessage *v35;
  void *v36;
  void *v37;
  CRKIDSMessageCannon *v38;
  void *v39;
  CRKIDSMessageCannon *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  CRKCertificateExchangeBroadcastHandler *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  +[CRKIDSMessagePayload instanceWithDictionary:](CRKIDSMessagePayload, "instanceWithDictionary:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCertificateExchangeBroadcastHandler appleIDProvider](self, "appleIDProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "messageMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "messageType") != 1 || v12 == 0)
    {
LABEL_22:

      goto LABEL_23;
    }
    -[CRKCertificateExchangeBroadcastHandler delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v10, "messageContent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRKRequestCertificatesIDSMessage instanceWithDictionary:](CRKRequestCertificatesIDSMessage, "instanceWithDictionary:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v44 = v9;
        _CRKLogASM();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v49 = v19;
          v50 = 2048;
          v51 = self;
          v52 = 2114;
          v53 = v8;
          _os_log_impl(&dword_218C99000, v17, OS_LOG_TYPE_INFO, "%{public}@ - %p: Received certificate request from (%{public}@)", buf, 0x20u);

        }
        -[CRKCertificateExchangeBroadcastHandler delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v13, "sourceRole");
        v22 = objc_msgSend(v13, "destinationRole");
        objc_msgSend(v13, "controlGroupIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "destinationDeviceIdentifier");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v13;
        v26 = (void *)v24;
        v45 = v25;
        objc_msgSend(v25, "requesterCertificate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        objc_msgSend(v20, "certificateExchangeHandler:needsCertificatesForRequester:sourceRole:destinationRole:controlGroupIdentifier:destinationDeviceIdentifier:requesterCertificate:error:", self, v8, v21, v22, v23, v26, v27, &v47);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v47;

        if (v28)
        {
          v30 = objc_msgSend(v28, "isValidRequest");
          _CRKLogASM();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
          if ((v30 & 1) != 0)
          {
            if (v32)
            {
              v33 = (objc_class *)objc_opt_class();
              NSStringFromClass(v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v49 = v34;
              v50 = 2048;
              v51 = self;
              _os_log_impl(&dword_218C99000, v31, OS_LOG_TYPE_INFO, "%{public}@ - %p: Valid cert request processed. Replying with cert.", buf, 0x16u);

            }
            v35 = [CRKRequestCertificatesResponseIDSMessage alloc];
            objc_msgSend(v45, "requestIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "certificateDataCollection");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[CRKRequestCertificatesResponseIDSMessage initWithRequestIdentifier:certificateDataCollection:error:](v35, "initWithRequestIdentifier:certificateDataCollection:error:", v36, v37, v29);

            v38 = [CRKIDSMessageCannon alloc];
            -[CRKCertificateExchangeBroadcastHandler IDSPrimitives](self, "IDSPrimitives");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[CRKIDSMessageCannon initWithIDSPrimitives:](v38, "initWithIDSPrimitives:", v39);

            v41 = (void *)objc_opt_new();
            objc_msgSend(v41, "setFireAndForget:", 1);
            v46[0] = MEMORY[0x24BDAC760];
            v46[1] = 3221225472;
            v46[2] = __85__CRKCertificateExchangeBroadcastHandler_processMessage_senderAppleID_senderAddress___block_invoke;
            v46[3] = &unk_24D9C6E18;
            v46[4] = self;
            -[CRKIDSMessageCannon sendIDSMessage:destinationAddress:sourceAppleID:options:completion:](v40, "sendIDSMessage:destinationAddress:sourceAppleID:options:completion:", v31, v44, v12, v41, v46);

            v13 = v45;
            v9 = v44;
          }
          else
          {
            v13 = v45;
            if (v32)
            {
              v42 = (objc_class *)objc_opt_class();
              NSStringFromClass(v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v49 = v43;
              v50 = 2048;
              v51 = self;
              _os_log_impl(&dword_218C99000, v31, OS_LOG_TYPE_INFO, "%{public}@ - %p: Cert request is invalid. Dropping message.", buf, 0x16u);

            }
            v9 = v44;
          }
        }
        else
        {
          _CRKLogASM();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[CRKCertificateExchangeBroadcastHandler processMessage:senderAppleID:senderAddress:].cold.1((uint64_t)self, v29);
          v9 = v44;
          v13 = v45;
        }

      }
      goto LABEL_22;
    }
  }
LABEL_23:

}

void __85__CRKCertificateExchangeBroadcastHandler_processMessage_senderAppleID_senderAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _CRKLogASM();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __85__CRKCertificateExchangeBroadcastHandler_processMessage_senderAppleID_senderAddress___block_invoke_cold_1(a1, v3);

  }
}

- (CRKCertificateExchangeBroadcastHandlerDelegate)delegate
{
  return (CRKCertificateExchangeBroadcastHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKAppleIDProviding)appleIDProvider
{
  return self->_appleIDProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDProvider, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)processMessage:(uint64_t)a1 senderAppleID:(void *)a2 senderAddress:.cold.1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_218C99000, v6, v7, "%{public}@ - %p: Failed to acquire certificate to exchange. Error = %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

void __85__CRKCertificateExchangeBroadcastHandler_processMessage_senderAppleID_senderAddress___block_invoke_cold_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_218C99000, v6, v7, "%{public}@ - %p: Failed to respond to request cert message. Error = %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

@end
