@implementation CLMiLoConnection

- (CLMiLoConnection)init
{
  return (CLMiLoConnection *)MEMORY[0x1E0DE7D20](self, sel_initWithDelegate_delegateQueue_, 0, 0);
}

- (CLMiLoConnection)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  CLMiLoConnection *v6;
  CLMiLoConnectionInternal *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLMiLoConnection;
  v6 = -[CLMiLoConnection init](&v13, sel_init);
  if (v6)
  {
    v7 = [CLMiLoConnectionInternal alloc];
    v9 = objc_msgSend_initWithInfo_delegate_delegateQueue_(v7, v8, (uint64_t)v6, (uint64_t)a3, a4);
    v6->_internal = (CLMiLoConnectionInternal *)v9;
    v10 = *(NSObject **)(v9 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F7197F8;
    block[3] = &unk_1E2990DE0;
    block[4] = v6;
    dispatch_sync(v10, block);
  }
  return v6;
}

- (void)dealloc
{
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  objc_super v5;
  _QWORD block[5];

  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F7198C4;
  block[3] = &unk_1E2990DE0;
  block[4] = internal;
  dispatch_sync(internalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CLMiLoConnection;
  -[CLMiLoConnection dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  self->_internal->_delegate = (CLMiLoConnectionDelegate *)a3;
}

- (CLMiLoConnectionDelegate)delegate
{
  return self->_internal->_delegate;
}

- (void)createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4
{
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD block[7];

  if (!a4)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationTypes"));
  }
  if (a3 - 5 <= 0xFFFFFFFFFFFFFFFBLL)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceType > CLMiLoServiceTypeNone && serviceType < CLMiLoServiceTypeMax"));
  }
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F7199E8;
  block[3] = &unk_1E2992D88;
  block[5] = a4;
  block[6] = a3;
  block[4] = internal;
  dispatch_async(internalQueue, block);
}

- (void)deleteServiceWithIdentifier:(id)a3
{
  uint64_t v3;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v9;
  const char *v10;
  _QWORD block[6];

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceIdentifier"));
  }
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F719AAC;
  block[3] = &unk_1E2991118;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(internalQueue, block);
}

- (void)queryMyServices
{
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD block[5];

  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F719B10;
  block[3] = &unk_1E2990DE0;
  block[4] = internal;
  dispatch_async(internalQueue, block);
}

- (void)queryMiLoConnectionStatus
{
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD block[5];

  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F719B70;
  block[3] = &unk_1E2990DE0;
  block[4] = internal;
  dispatch_async(internalQueue, block);
}

- (void)connectServiceWithIdentifier:(id)a3
{
  uint64_t v3;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v9;
  const char *v10;
  _QWORD block[6];

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceIdentifier"));
  }
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F719C2C;
  block[3] = &unk_1E2991118;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(internalQueue, block);
}

- (void)disconnectServiceWithIdentifier:(id)a3
{
  uint64_t v3;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v9;
  const char *v10;
  _QWORD block[6];

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceIdentifier"));
  }
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F719CEC;
  block[3] = &unk_1E2991118;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(internalQueue, block);
}

- (id)requestMiLoPrediction
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD v9[6];

  v5 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F719D70;
  v9[3] = &unk_1E2991118;
  v9[4] = internal;
  v9[5] = v5;
  dispatch_async(internalQueue, v9);
  return v5;
}

- (id)requestObservation:(id)a3
{
  uint64_t v3;
  void *v6;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD block[7];

  v6 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F719E04;
  block[3] = &unk_1E29911F8;
  block[4] = internal;
  block[5] = v6;
  block[6] = a3;
  dispatch_async(internalQueue, block);
  return v6;
}

- (id)labelObservationWithRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4
{
  void *v8;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD block[8];

  if (!a3)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observationIdentifier"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeLabel"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, (uint64_t)a4);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F719F24;
  block[3] = &unk_1E2992DB0;
  block[4] = internal;
  block[5] = v8;
  block[6] = a4;
  block[7] = a3;
  dispatch_async(internalQueue, block);
  return v8;
}

- (id)labelEventWithRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_labelObservationWithRequestIdentifier_withPlaceIdentifier_, a3, a4);
}

- (id)labelObservationsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5
{
  void *v10;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  _QWORD block[9];

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1443, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeLabel"));
    goto LABEL_4;
  }
  v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));
  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v10 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, (uint64_t)a4);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F71A098;
  block[3] = &unk_1E2992DD8;
  block[4] = internal;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = v10;
  dispatch_async(internalQueue, block);
  return v10;
}

- (id)labelEventsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_labelObservationsWithStartDate_endDate_placeIdentifier_, a3, a4);
}

- (id)removeLabels:(id)a3
{
  uint64_t v3;
  void *v6;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v11;
  const char *v12;
  _QWORD block[7];

  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labels"));
  }
  v6 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F71A17C;
  block[3] = &unk_1E29911F8;
  block[4] = internal;
  block[5] = a3;
  block[6] = v6;
  dispatch_async(internalQueue, block);
  return v6;
}

- (id)removeCustomLocationOfInterestWithIdentifier:(id)a3
{
  uint64_t v3;
  void *v6;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v11;
  const char *v12;
  _QWORD block[7];

  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));
  }
  v6 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F71A258;
  block[3] = &unk_1E29911F8;
  block[4] = internal;
  block[5] = a3;
  block[6] = v6;
  dispatch_async(internalQueue, block);
  return v6;
}

- (id)startUpdatingMicroLocationWithConfiguration:(id)a3
{
  uint64_t v3;
  void *v6;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  void *v11;
  const char *v12;
  _QWORD block[7];

  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLMiLoConnection.mm"), 1483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));
  }
  v6 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F71A334;
  block[3] = &unk_1E29911F8;
  block[4] = internal;
  block[5] = a3;
  block[6] = v6;
  dispatch_async(internalQueue, block);
  return v6;
}

- (id)stopUpdatingMicroLocation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD v9[6];

  v5 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F71A3BC;
  v9[3] = &unk_1E2991118;
  v9[4] = internal;
  v9[5] = v5;
  dispatch_async(internalQueue, v9);
  return v5;
}

- (id)requestModelLearning
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD v9[6];

  v5 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F71A440;
  v9[3] = &unk_1E2991118;
  v9[4] = internal;
  v9[5] = v5;
  dispatch_async(internalQueue, v9);
  return v5;
}

- (id)purgeAllMiLoData
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD v9[6];

  v5 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F71A4C4;
  v9[3] = &unk_1E2991118;
  v9[4] = internal;
  v9[5] = v5;
  dispatch_async(internalQueue, v9);
  return v5;
}

- (id)requestExportDatabase
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD v9[6];

  v5 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F71A548;
  v9[3] = &unk_1E2991118;
  v9[4] = internal;
  v9[5] = v5;
  dispatch_async(internalQueue, v9);
  return v5;
}

- (id)createCustomLocationOfInterestAtCurrentLocation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CLMiLoConnectionInternal *internal;
  NSObject *internalQueue;
  _QWORD v9[6];

  v5 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3);
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F71A5CC;
  v9[3] = &unk_1E2991118;
  v9[4] = internal;
  v9[5] = v5;
  dispatch_async(internalQueue, v9);
  return v5;
}

- (CLMiLoConnectionInternal)_internal
{
  return self->_internal;
}

@end
