@implementation CKAPSMachServiceConnectionDelegate

- (CKAPSMachServiceConnectionDelegate)initWithConnection:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  CKAPSMachServiceConnectionDelegate *v8;
  CKAPSMachServiceConnectionDelegate *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CKAPSMachServiceConnectionKey *key;
  const char *v15;
  uint64_t v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKAPSMachServiceConnectionDelegate;
  v8 = -[CKAPSMachServiceConnectionDelegate init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    v13 = objc_msgSend_copy(v7, v10, v11, v12);
    key = v9->_key;
    v9->_key = (CKAPSMachServiceConnectionKey *)v13;

    objc_msgSend_setDelegate_(v6, v15, (uint64_t)v9, v16);
  }

  return v9;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;

  v34 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend_dictionaryWithCapacity_(v6, v8, 3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environmentName(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v19, (uint64_t)v18, (uint64_t)CFSTR("environmentName"));

  objc_msgSend_key(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_namedDelegatePort(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v28, (uint64_t)v27, (uint64_t)CFSTR("namedDelegatePort"));

  if (v34)
    objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v34, (uint64_t)CFSTR("publicToken"));
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v32, v33, (uint64_t)CFSTR("CKAPSMachServiceConnectionDidReceivePublicTokenNotification"), (uint64_t)v7, v10);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v40;

  v40 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C99E08];
  v13 = a3;
  objc_msgSend_dictionaryWithCapacity_(v12, v14, 5, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environmentName(v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v25, (uint64_t)v24, (uint64_t)CFSTR("environmentName"));

  objc_msgSend_key(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_namedDelegatePort(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v34, (uint64_t)v33, (uint64_t)CFSTR("namedDelegatePort"));

  if (v40)
    objc_msgSend_setObject_forKeyedSubscript_(v16, v35, (uint64_t)v40, (uint64_t)CFSTR("token"));
  if (v10)
    objc_msgSend_setObject_forKeyedSubscript_(v16, v35, (uint64_t)v10, (uint64_t)CFSTR("topic"));
  if (v11)
    objc_msgSend_setObject_forKeyedSubscript_(v16, v35, (uint64_t)v11, (uint64_t)CFSTR("identifier"));
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v38, v39, (uint64_t)CFSTR("CKAPSMachServiceConnectionDidReceiveTokenNotification"), (uint64_t)v13, v16);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;

  v34 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend_dictionaryWithCapacity_(v6, v8, 3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environmentName(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v19, (uint64_t)v18, (uint64_t)CFSTR("environmentName"));

  objc_msgSend_key(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_namedDelegatePort(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v28, (uint64_t)v27, (uint64_t)CFSTR("namedDelegatePort"));

  if (v34)
    objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v34, (uint64_t)CFSTR("message"));
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v32, v33, (uint64_t)CFSTR("CKAPSMachServiceConnectionDidReceiveIncomingMessageNotification"), (uint64_t)v7, v10);

}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;

  v37 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a3;
  objc_msgSend_dictionaryWithCapacity_(v9, v11, 4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environmentName(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v22, (uint64_t)v21, (uint64_t)CFSTR("environmentName"));

  objc_msgSend_key(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_namedDelegatePort(v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v30, (uint64_t)CFSTR("namedDelegatePort"));

  if (v37)
    objc_msgSend_setObject_forKeyedSubscript_(v13, v32, (uint64_t)v37, (uint64_t)CFSTR("topic"));
  if (v8)
    objc_msgSend_setObject_forKeyedSubscript_(v13, v32, (uint64_t)v8, (uint64_t)CFSTR("userInfo"));
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v35, v36, (uint64_t)CFSTR("CKAPSMachServiceConnectionDidReceiveMessageForTopicNotification"), (uint64_t)v10, v13);

}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;

  v34 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend_dictionaryWithCapacity_(v6, v8, 5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environmentName(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v19, (uint64_t)v18, (uint64_t)CFSTR("environmentName"));

  objc_msgSend_key(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_namedDelegatePort(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v28, (uint64_t)v27, (uint64_t)CFSTR("namedDelegatePort"));

  if (v34)
    objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v34, (uint64_t)CFSTR("message"));
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v32, v33, (uint64_t)CFSTR("CKAPSMachServiceConnectionDidSendOutgoingMessageNotification"), (uint64_t)v7, v10);

}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;

  v37 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a3;
  objc_msgSend_dictionaryWithCapacity_(v9, v11, 4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environmentName(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v22, (uint64_t)v21, (uint64_t)CFSTR("environmentName"));

  objc_msgSend_key(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_namedDelegatePort(v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v30, (uint64_t)CFSTR("namedDelegatePort"));

  if (v37)
    objc_msgSend_setObject_forKeyedSubscript_(v13, v32, (uint64_t)v37, (uint64_t)CFSTR("message"));
  if (v8)
    objc_msgSend_setObject_forKeyedSubscript_(v13, v32, (uint64_t)v8, (uint64_t)CFSTR("error"));
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v35, v36, (uint64_t)CFSTR("CKAPSMachServiceConnectionDidFailToSendOutgoingMessageNotification"), (uint64_t)v10, v13);

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend_dictionaryWithCapacity_(v6, v8, 3, v9);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environmentName(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v37, v18, (uint64_t)v17, (uint64_t)CFSTR("environmentName"));

  objc_msgSend_key(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_namedDelegatePort(v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v37, v27, (uint64_t)v26, (uint64_t)CFSTR("namedDelegatePort"));

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v28, v4, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v37, v31, (uint64_t)v30, (uint64_t)CFSTR("connected"));

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v35, v36, (uint64_t)CFSTR("CKAPSMachServiceConnectionDidChangeConnectedStatusNotification"), (uint64_t)v7, v37);

}

- (void)connectionDidReconnect:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend_dictionaryWithCapacity_(v4, v6, 2, v7);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environmentName(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v31, v16, (uint64_t)v15, (uint64_t)CFSTR("environmentName"));

  objc_msgSend_key(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_namedDelegatePort(v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v31, v25, (uint64_t)v24, (uint64_t)CFSTR("namedDelegatePort"));

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v29, v30, (uint64_t)CFSTR("CKAPSMachServiceConnectionDidReconnectNotification"), (uint64_t)v5, v31);

}

- (APSConnection)connection
{
  return (APSConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (CKAPSMachServiceConnectionKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end
