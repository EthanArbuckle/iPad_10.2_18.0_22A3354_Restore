@implementation APTestingRig

+ (id)sharedInstance
{
  if (qword_1ED2BC980 != -1)
    dispatch_once(&qword_1ED2BC980, &unk_1E8C480D0);
  return (id)qword_1ED2BC768;
}

- (APTestingRig)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  APTestingRig *v5;
  uint64_t v6;
  NSMutableDictionary *handlers;
  APUnfairLock *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  APUnfairLock *theLock;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APTestingRig;
  v5 = -[APTestingRig init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    handlers = v5->_handlers;
    v5->_handlers = (NSMutableDictionary *)v6;

    v8 = [APUnfairLock alloc];
    v11 = objc_msgSend_initWithOptions_(v8, v9, 1, v10);
    theLock = v5->_theLock;
    v5->_theLock = (APUnfairLock *)v11;

  }
  return v5;
}

- (void)subscribeForDictMessage:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1CF285128;
  v9[3] = &unk_1E8C48AE8;
  v10 = v6;
  v7 = v6;
  objc_msgSend_subscribeForMessage_handler_(self, v8, (uint64_t)a3, (uint64_t)v9);

}

- (void)subscribeForMessage:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
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
  id v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend_theLock(self, v8, v9, v10);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v23, v11, v12, v13);
  v14 = _Block_copy(v6);

  objc_msgSend_handlers(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v14, (uint64_t)v7);

  objc_msgSend_unlock(v23, v20, v21, v22);
}

- (void)invokeHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, const __CFString *);
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = a4;
  v8 = (void (**)(id, const __CFString *))a5;
  v9 = a3;
  objc_msgSend_theLock(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v13, v14, v15, v16);
  objc_msgSend_handlers(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v20, v21, (uint64_t)v9, v22);
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend_unlock(v13, v24, v25, v26);
  if (v23)
    ((void (**)(_QWORD, id, void (**)(id, const __CFString *)))v23)[2](v23, v27, v8);
  else
    v8[2](v8, CFSTR("Message was not registered"));

}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (APUnfairLock)theLock
{
  return self->_theLock;
}

- (void)setTheLock:(id)a3
{
  objc_storeStrong((id *)&self->_theLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theLock, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
