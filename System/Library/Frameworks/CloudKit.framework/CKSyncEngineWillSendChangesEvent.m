@implementation CKSyncEngineWillSendChangesEvent

- (int64_t)type
{
  return 10;
}

- (CKSyncEngineWillSendChangesEvent)initWithContext:(id)a3
{
  id v5;
  char v6;
  id v7;
  id *v8;
  CKSyncEngineWillSendChangesEvent *v9;
  void *v11;
  CKException *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  objc_super v23;
  id v24;

  v5 = a3;
  v24 = 0;
  v6 = _CKCheckArgument((uint64_t)"context", v5, 0, 0, 0, &v24);
  v7 = v24;
  if ((v6 & 1) == 0)
  {
    v11 = v7;
    v12 = [CKException alloc];
    v16 = objc_msgSend_code(v11, v13, v14, v15);
    objc_msgSend_localizedDescription(v11, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend_initWithCode_format_(v12, v21, v16, (uint64_t)CFSTR("%@"), v20);

    objc_exception_throw(v22);
  }

  v23.receiver = self;
  v23.super_class = (Class)CKSyncEngineWillSendChangesEvent;
  v8 = -[CKSyncEngineEvent initInternal](&v23, sel_initInternal);
  v9 = (CKSyncEngineWillSendChangesEvent *)v8;
  if (v8)
    objc_storeStrong(v8 + 1, a3);

  return v9;
}

- (CKSyncEngineSendChangesContext)context
{
  return self->_context;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKSyncEngineWillSendChangesEvent;
  v4 = a3;
  -[CKSyncEngineEvent CKDescribePropertiesUsing:](&v10, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_context(self, v5, v6, v7, v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("context"), (uint64_t)v8, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
