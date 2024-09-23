@implementation _IDSCurrentServerTimeProvider

- (_IDSCurrentServerTimeProvider)init
{
  _IDSCurrentServerTimeProvider *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  id apsConnection;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_IDSCurrentServerTimeProvider;
  v2 = -[_IDSCurrentServerTimeProvider init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc((Class)sub_19BAE3344());
    if (qword_1EE40AF38 != -1)
      dispatch_once(&qword_1EE40AF38, &unk_1E3C1C0F0);
    v4 = qword_1EE40AF48;
    v5 = (id)qword_1EE40AF30;
    if (v4 != -1)
      dispatch_once(&qword_1EE40AF48, &unk_1E3C222C8);
    v6 = (id)qword_1EE40AF40;
    im_primary_queue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v3, v8, (uint64_t)v5, v9, v6, v7);
    apsConnection = v2->_apsConnection;
    v2->_apsConnection = (id)v10;

  }
  return v2;
}

- (BOOL)isAccurate
{
  uint64_t v2;
  double v3;

  return objc_msgSend_isConnected(self->_apsConnection, a2, v2, v3);
}

- (unint64_t)serverTimeInNanoSeconds
{
  const char *v2;
  uint64_t v3;
  double v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  unint64_t v19;

  if (sub_19BAE3344())
  {
    v5 = sub_19BAE3344();
    return objc_msgSend_serverTimeInNanoSeconds(v5, v6, v7, v8);
  }
  else
  {
    objc_msgSend_utilities(IDSFoundationLog, v2, v3, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_19BAFA758(v10);

    objc_msgSend_date(MEMORY[0x1E0C99D68], v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v14, v15, v16, v17);
    v19 = (unint64_t)v18;

    return v19;
  }
}

- (id)apsConnection
{
  return self->_apsConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_apsConnection, 0);
}

@end
