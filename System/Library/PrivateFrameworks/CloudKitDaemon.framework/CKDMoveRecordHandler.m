@implementation CKDMoveRecordHandler

- (id)_initWithMoveChange:(id)a3 operation:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  const char *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDMoveRecordHandler;
  v8 = -[CKDModifyRecordHandler _initCommonWithOperation:](&v12, sel__initCommonWithOperation_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 18, a3);
    objc_msgSend_setState_(v9, v10, 0);
  }

  return v9;
}

+ (id)moveHandlerWithMoveChange:(id)a3 operation:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v10 = (void *)objc_msgSend__initWithMoveChange_operation_(v8, v9, (uint64_t)v7, v6);

  return v10;
}

- (id)record
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_moveChange(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_destinationRecord(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKMovePhotosChange)moveChange
{
  return self->_moveChange;
}

- (void)setMoveChange:(id)a3
{
  objc_storeStrong((id *)&self->_moveChange, a3);
}

- (CKRecord)serverMoveMarkerRecord
{
  return self->_serverMoveMarkerRecord;
}

- (void)setServerMoveMarkerRecord:(id)a3
{
  objc_storeStrong((id *)&self->_serverMoveMarkerRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverMoveMarkerRecord, 0);
  objc_storeStrong((id *)&self->_moveChange, 0);
}

@end
