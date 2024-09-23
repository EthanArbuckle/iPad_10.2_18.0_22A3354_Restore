@implementation GKSavedGame

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setName:", self->_name);
    objc_msgSend(v5, "setDeviceName:", self->_deviceName);
    objc_msgSend(v5, "setModificationDate:", self->_modificationDate);
    objc_msgSend(v5, "setFileURL:", self->_fileURL);
  }
  return v5;
}

- (void)loadDataWithCompletionHandler:(void *)handler
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = handler;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__GKSavedGame_loadDataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E75B23E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __45__GKSavedGame_loadDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  +[GKSavedGameManager sharedManager](GKSavedGameManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadDataForSavedGame:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKSavedGame;
  -[GKSavedGame description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", name = %@, deviceName = %@, modificationDate = %@"), self->_name, self->_deviceName, self->_modificationDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
