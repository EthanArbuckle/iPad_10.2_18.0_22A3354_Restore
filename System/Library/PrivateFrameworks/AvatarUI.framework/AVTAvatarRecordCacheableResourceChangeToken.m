@implementation AVTAvatarRecordCacheableResourceChangeToken

- (AVTAvatarRecordCacheableResourceChangeToken)initWithEnvironment:(id)a3 recordIdentifier:(id)a4 changeHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTAvatarRecordCacheableResourceChangeToken *v11;
  uint64_t v12;
  NSString *recordID;
  uint64_t v14;
  id changeHandler;
  uint64_t v16;
  NSNotificationCenter *notificationCenter;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarRecordCacheableResourceChangeToken;
  v11 = -[AVTAvatarRecordCacheableResourceChangeToken init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    recordID = v11->_recordID;
    v11->_recordID = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    changeHandler = v11->_changeHandler;
    v11->_changeHandler = (id)v14;

    objc_msgSend(v8, "notificationCenter");
    v16 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v11->_notificationCenter;
    v11->_notificationCenter = (NSNotificationCenter *)v16;

  }
  return v11;
}

- (void)handleNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void (**v9)(void);
  id v10;

  v10 = a3;
  objc_msgSend(v10, "_avtui_changedRecordIdentifiers");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  v5 = (void *)v4;
  objc_msgSend(v10, "_avtui_changedRecordIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarRecordCacheableResourceChangeToken recordID](self, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
LABEL_3:
    -[AVTAvatarRecordCacheableResourceChangeToken changeHandler](self, "changeHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
}

- (void)startObservingChanges
{
  id v3;

  -[AVTAvatarRecordCacheableResourceChangeToken notificationCenter](self, "notificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleNotification_, *MEMORY[0x1E0D006D8], 0);

}

- (void)stopObservingChanges
{
  id v3;

  -[AVTAvatarRecordCacheableResourceChangeToken notificationCenter](self, "notificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (NSString)recordID
{
  return self->_recordID;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
