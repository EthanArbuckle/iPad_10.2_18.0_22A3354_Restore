@implementation IDSFirewall

- (IDSFirewall)initWithService:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  IDSFirewall *v8;
  void *v9;
  _QWORD v11[4];
  IDSFirewall *v12;
  id v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSFirewall;
  v8 = -[IDSFirewall init](&v15, sel_init);
  if (v8)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_190722570;
    v11[3] = &unk_1E2C602B8;
    v12 = v8;
    v13 = v6;
    v14 = v7;
    objc_msgSend(v9, "performBlock:waitUntilDone:", v11, 1);

  }
  return v8;
}

- (void)setQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907226D8;
  v7[3] = &unk_1E2C607A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v7, 1);

}

- (void)populateImpactedServices:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  _BOOL4 v8;
  NSString *service;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IDSFirewall.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v8)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      v18 = (const char *)service;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "IDSFirewall populateImpactedServices for service %@", buf, 0xCu);
    }

    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1907228DC;
    v15[3] = &unk_1E2C61058;
    v15[4] = self;
    v16 = v5;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = sub_1907229EC;
    v13[3] = &unk_1E2C61618;
    v13[4] = self;
    v14 = (id)MEMORY[0x19400FE1C](v15);
    v11 = v14;
    +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v13);

  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[IDSFirewall populateImpactedServices:]";
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
    }

  }
}

- (void)addEntries:(id)a3 withCompletion:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_donateEntries_withCompletion_);
}

- (void)donateEntries:(id)a3 withCompletion:(id)a4
{
  NSObject *v6;
  id v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _BOOL4 v10;
  NSString *service;
  NSObject *v12;
  NSString *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  IDSFirewall *v20;
  id v21;
  _QWORD block[4];
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v25 = (const char *)service;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ donateEntries %@", buf, 0x16u);
    }

    -[IDSFirewall _removeInvalidEntries:](self, "_removeInvalidEntries:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v12, "count"))
    {
      v13 = self->_service;
      v14 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_190722E80;
      v18[3] = &unk_1E2C61AB0;
      v6 = v12;
      v19 = v6;
      v20 = self;
      v21 = v7;
      v16[0] = v14;
      v16[1] = 3221225472;
      v16[2] = sub_190722FB0;
      v16[3] = &unk_1E2C60E28;
      v16[4] = self;
      v17 = v21;
      sub_190722DB4(v13, v18, v16);

      v9 = v19;
    }
    else
    {
      v15 = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_190722DA4;
      block[3] = &unk_1E2C604E8;
      v23 = v7;
      dispatch_async(v15, block);
      v9 = v23;
      v6 = v12;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[IDSFirewall donateEntries:withCompletion:]";
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }

}

- (void)removeDonatedEntries:(id)a3 withCompletion:(id)a4
{
  NSObject *v6;
  id v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _BOOL4 v10;
  NSString *service;
  NSObject *v12;
  NSString *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  IDSFirewall *v20;
  id v21;
  _QWORD block[4];
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v25 = (const char *)service;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ removeDonatedEntries %@", buf, 0x16u);
    }

    -[IDSFirewall _removeInvalidEntries:](self, "_removeInvalidEntries:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v12, "count"))
    {
      v13 = self->_service;
      v14 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_1907232B0;
      v18[3] = &unk_1E2C61AB0;
      v6 = v12;
      v19 = v6;
      v20 = self;
      v21 = v7;
      v16[0] = v14;
      v16[1] = 3221225472;
      v16[2] = sub_1907233E0;
      v16[3] = &unk_1E2C60E28;
      v16[4] = self;
      v17 = v21;
      sub_190722DB4(v13, v18, v16);

      v9 = v19;
    }
    else
    {
      v15 = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1907232A0;
      block[3] = &unk_1E2C604E8;
      v23 = v7;
      dispatch_async(v15, block);
      v9 = v23;
      v6 = v12;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[IDSFirewall removeDonatedEntries:withCompletion:]";
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }

}

- (void)removeEntries:(id)a3 withCompletion:(id)a4
{
  NSObject *v6;
  id v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _BOOL4 v10;
  NSString *service;
  NSObject *v12;
  NSString *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  IDSFirewall *v20;
  id v21;
  _QWORD block[4];
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v25 = (const char *)service;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ removeEntries %@", buf, 0x16u);
    }

    -[IDSFirewall _removeInvalidEntries:](self, "_removeInvalidEntries:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v12, "count"))
    {
      v13 = self->_service;
      v14 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_1907236E0;
      v18[3] = &unk_1E2C61AB0;
      v6 = v12;
      v19 = v6;
      v20 = self;
      v21 = v7;
      v16[0] = v14;
      v16[1] = 3221225472;
      v16[2] = sub_190723810;
      v16[3] = &unk_1E2C60E28;
      v16[4] = self;
      v17 = v21;
      sub_190722DB4(v13, v18, v16);

      v9 = v19;
    }
    else
    {
      v15 = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1907236D0;
      block[3] = &unk_1E2C604E8;
      v23 = v7;
      dispatch_async(v15, block);
      v9 = v23;
      v6 = v12;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[IDSFirewall removeEntries:withCompletion:]";
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }

}

- (void)replaceEntries:(id)a3 withCompletion:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_replaceAllEntriesWithEntries_withCompletion_);
}

- (void)replaceDonatedEntriesWithEntries:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _BOOL4 v10;
  NSString *service;
  void *v12;
  NSString *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  IDSFirewall *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v22 = (const char *)service;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ replaceDonatedEntriesWithEntries %@", buf, 0x16u);
    }

    -[IDSFirewall _removeInvalidEntries:](self, "_removeInvalidEntries:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = self->_service;
      v14 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_190723AC0;
      v17[3] = &unk_1E2C61AB0;
      v6 = v12;
      v18 = v6;
      v19 = self;
      v20 = v7;
      v15[0] = v14;
      v15[1] = 3221225472;
      v15[2] = sub_190723BF4;
      v15[3] = &unk_1E2C60E28;
      v15[4] = self;
      v16 = v20;
      sub_190722DB4(v13, v17, v15);

    }
    else
    {
      -[IDSFirewall removeAllDonatedEntries:](self, "removeAllDonatedEntries:", v7);
      v6 = v12;
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[IDSFirewall replaceDonatedEntriesWithEntries:withCompletion:]";
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
    }

  }
}

- (void)replaceAllEntriesWithEntries:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _BOOL4 v10;
  NSString *service;
  void *v12;
  NSString *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  IDSFirewall *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v22 = (const char *)service;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ replaceAllEntriesWithEntries %@", buf, 0x16u);
    }

    -[IDSFirewall _removeInvalidEntries:](self, "_removeInvalidEntries:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = self->_service;
      v14 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_190723EA0;
      v17[3] = &unk_1E2C61AB0;
      v6 = v12;
      v18 = v6;
      v19 = self;
      v20 = v7;
      v15[0] = v14;
      v15[1] = 3221225472;
      v15[2] = sub_190723FD4;
      v15[3] = &unk_1E2C60E28;
      v15[4] = self;
      v16 = v20;
      sub_190722DB4(v13, v17, v15);

    }
    else
    {
      -[IDSFirewall removeAllEntries:](self, "removeAllEntries:", v7);
      v6 = v12;
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[IDSFirewall replaceAllEntriesWithEntries:withCompletion:]";
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
    }

  }
}

- (void)currentDonatedEntries:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _BOOL4 v7;
  NSString *service;
  NSString *v9;
  uint64_t v10;
  _QWORD v11[5];
  NSObject *v12;
  _QWORD v13[5];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      v16 = (const char *)service;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall currentEntries for service %@", buf, 0xCu);
    }

    v9 = self->_service;
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1907242D8;
    v13[3] = &unk_1E2C61B00;
    v13[4] = self;
    v14 = v4;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = sub_190724424;
    v11[3] = &unk_1E2C61AD8;
    v11[4] = self;
    v12 = v14;
    sub_19072420C(v9, v13, v11);

    v6 = v14;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[IDSFirewall currentDonatedEntries:]";
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }

}

- (void)currentEntries:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _BOOL4 v7;
  NSString *service;
  NSString *v9;
  uint64_t v10;
  _QWORD v11[5];
  NSObject *v12;
  _QWORD v13[5];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      v16 = (const char *)service;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall currentEntries for service %@", buf, 0xCu);
    }

    v9 = self->_service;
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_190724688;
    v13[3] = &unk_1E2C61B00;
    v13[4] = self;
    v14 = v4;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = sub_1907247D4;
    v11[3] = &unk_1E2C61AD8;
    v11[4] = self;
    v12 = v14;
    sub_19072420C(v9, v13, v11);

    v6 = v14;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[IDSFirewall currentEntries:]";
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }

}

- (void)removeAllDonatedEntries:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _BOOL4 v7;
  NSString *service;
  NSString *v9;
  uint64_t v10;
  _QWORD v11[5];
  NSObject *v12;
  _QWORD v13[5];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      v16 = (const char *)service;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ removeAllDonatedEntries", buf, 0xCu);
    }

    v9 = self->_service;
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_190724A38;
    v13[3] = &unk_1E2C61B00;
    v13[4] = self;
    v14 = v4;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = sub_190724B58;
    v11[3] = &unk_1E2C60E28;
    v11[4] = self;
    v12 = v14;
    sub_190722DB4(v9, v13, v11);

    v6 = v14;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[IDSFirewall removeAllDonatedEntries:]";
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }

}

- (void)removeAllEntries:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _BOOL4 v7;
  NSString *service;
  NSString *v9;
  uint64_t v10;
  _QWORD v11[5];
  NSObject *v12;
  _QWORD v13[5];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      v16 = (const char *)service;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ removeAllEntries", buf, 0xCu);
    }

    v9 = self->_service;
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_190724D90;
    v13[3] = &unk_1E2C61B00;
    v13[4] = self;
    v14 = v4;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = sub_190724EB0;
    v11[3] = &unk_1E2C60E28;
    v11[4] = self;
    v12 = v14;
    sub_190722DB4(v9, v13, v11);

    v6 = v14;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[IDSFirewall removeAllEntries:]";
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }

}

- (void)recentlyBlockedEntries:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _BOOL4 v7;
  NSString *service;
  NSString *v9;
  uint64_t v10;
  _QWORD v11[5];
  NSObject *v12;
  _QWORD v13[5];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->_queue;
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      v16 = (const char *)service;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall recentlyBlockedEntries for service %@", buf, 0xCu);
    }

    v9 = self->_service;
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1907250E8;
    v13[3] = &unk_1E2C61B00;
    v13[4] = self;
    v14 = v4;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = sub_190725234;
    v11[3] = &unk_1E2C61AD8;
    v11[4] = self;
    v12 = v14;
    sub_19072420C(v9, v13, v11);

    v6 = v14;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[IDSFirewall recentlyBlockedEntries:]";
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IDSFirewall service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSFirewall queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSFirewall impactedServiceIdentifiers](self, "impactedServiceIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IDSFirewall %p>: Service %@ Queue %@ ImpactedServices %@"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_removeInvalidEntries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "uri", (_QWORD)v17);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "uri");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "prefixedURI");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (NSSet)impactedServiceIdentifiers
{
  return self->_impactedServiceIdentifiers;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_impactedServiceIdentifiers, 0);
}

@end
