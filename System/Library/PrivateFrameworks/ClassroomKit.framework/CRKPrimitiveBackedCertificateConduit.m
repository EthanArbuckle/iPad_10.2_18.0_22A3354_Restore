@implementation CRKPrimitiveBackedCertificateConduit

- (CRKPrimitiveBackedCertificateConduit)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CRKPrimitiveBackedCertificateConduit *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "makePrimitives");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CRKPrimitiveBackedCertificateConduit initWithIDSPrimitives:addressTranslator:timerPrimitives:operationQueue:](self, "initWithIDSPrimitives:addressTranslator:timerPrimitives:operationQueue:", v10, v9, v12, v8);

  return v13;
}

- (CRKPrimitiveBackedCertificateConduit)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 timerPrimitives:(id)a5 operationQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRKPrimitiveBackedCertificateConduit *v15;
  CRKPrimitiveBackedCertificateConduit *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CRKPrimitiveBackedCertificateConduit;
  v15 = -[CRKPrimitiveBackedCertificateConduit init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_IDSPrimitives, a3);
    objc_storeStrong((id *)&v16->_addressTranslator, a4);
    objc_storeStrong((id *)&v16->_timerPrimitives, a5);
    objc_storeStrong((id *)&v16->_operationQueue, a6);
  }

  return v16;
}

- (id)operationToFetchCertificateForDestinationAppleID:(id)a3 sourceAppleID:(id)a4 destinationDeviceIdentifier:(id)a5 controlGroupIdentifier:(id)a6 sourceRole:(int64_t)a7 destinationRole:(int64_t)a8 requesterCertificate:(id)a9 timeout:(double)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  CRKFetchASMCertificatesOperation *v28;
  void *v29;
  void *v30;
  CRKFetchASMCertificatesOperation *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v37 = a6;
  v38 = v19;
  v20 = a9;
  v21 = v18;
  v22 = v17;
  v23 = a7;
  if (_CRKLogASM_onceToken_26 != -1)
    dispatch_once(&_CRKLogASM_onceToken_26, &__block_literal_global_92);
  v24 = (void *)_CRKLogASM_logObj_26;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_26, OS_LOG_TYPE_INFO))
  {
    v25 = v24;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v27;
    _os_log_impl(&dword_218C99000, v25, OS_LOG_TYPE_INFO, "%@: Received request to build cert-fetching operation", buf, 0xCu);

  }
  v28 = [CRKFetchASMCertificatesOperation alloc];
  -[CRKPrimitiveBackedCertificateConduit IDSPrimitives](self, "IDSPrimitives");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKPrimitiveBackedCertificateConduit addressTranslator](self, "addressTranslator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[CRKFetchASMCertificatesOperation initWithIDSPrimitives:addressTranslator:controlGroupIdentifier:destinationAppleID:sourceAppleID:destinationDeviceIdentifier:sourceRole:destinationRole:requesterCertificate:](v28, "initWithIDSPrimitives:addressTranslator:controlGroupIdentifier:destinationAppleID:sourceAppleID:destinationDeviceIdentifier:sourceRole:destinationRole:requesterCertificate:", v29, v30, v37, v22, v21, v38, v23, a8, v20);

  -[CRKPrimitiveBackedCertificateConduit timerPrimitives](self, "timerPrimitives");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKPrimitiveBackedCertificateConduit operationQueue](self, "operationQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "fetchOperationTimerIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATOperation crk_timingOutOperationWithTimerPrimitives:operationQueue:timerIdentifier:timeout:](v31, "crk_timingOutOperationWithTimerPrimitives:operationQueue:timerIdentifier:timeout:", v32, v33, v34, a10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)fetchOperationTimerIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-certificateFetchTimer"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSAddressTranslator)addressTranslator
{
  return self->_addressTranslator;
}

- (CRKTimerPrimitives)timerPrimitives
{
  return self->_timerPrimitives;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_timerPrimitives, 0);
  objc_storeStrong((id *)&self->_addressTranslator, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

@end
