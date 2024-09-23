@implementation FAFetchFamilyPhotoRequest

- (FAFetchFamilyPhotoRequest)initWithFamilyMemberDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  FAFetchFamilyPhotoRequest *v10;

  v5 = a5;
  v8 = a3;
  +[_FAFamilyCircleRequestConnectionProvider sharedInstance](_FAFamilyCircleRequestConnectionProvider, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FAFetchFamilyPhotoRequest initWithFamilyMemberDSID:size:localFallback:connectionProvider:](self, "initWithFamilyMemberDSID:size:localFallback:connectionProvider:", v8, a4, v5, v9);

  return v10;
}

- (FAFetchFamilyPhotoRequest)initWithFamilyMemberDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5 connectionProvider:(id)a6
{
  id v10;
  FAFetchFamilyPhotoRequest *v11;
  FAFetchFamilyPhotoRequest *v12;
  FAFetchFamilyPhotoRequest *v13;

  v10 = a3;
  v11 = -[FAFetchFamilyPhotoRequest initWithConnectionProvider:](self, "initWithConnectionProvider:", a6);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_memberDSID, a3);
    v12->_requestedSize = a4;
    v13 = v12;
  }

  return v12;
}

- (FAFetchFamilyPhotoRequest)initWithFamilyMemberHashedDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  FAFetchFamilyPhotoRequest *v10;

  v5 = a5;
  v8 = a3;
  +[_FAFamilyCircleRequestConnectionProvider sharedInstance](_FAFamilyCircleRequestConnectionProvider, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FAFetchFamilyPhotoRequest initWithFamilyMemberHashedDSID:size:localFallback:connectionProvider:](self, "initWithFamilyMemberHashedDSID:size:localFallback:connectionProvider:", v8, a4, v5, v9);

  return v10;
}

- (FAFetchFamilyPhotoRequest)initWithFamilyMemberHashedDSID:(id)a3 size:(unint64_t)a4 localFallback:(BOOL)a5 connectionProvider:(id)a6
{
  id v10;
  FAFetchFamilyPhotoRequest *v11;
  FAFetchFamilyPhotoRequest *v12;
  FAFetchFamilyPhotoRequest *v13;

  v10 = a3;
  v11 = -[FAFetchFamilyPhotoRequest initWithConnectionProvider:](self, "initWithConnectionProvider:", a6);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_memberHashedDSID, a3);
    v12->_requestedSize = a4;
    v13 = v12;
  }

  return v12;
}

- (FAFetchFamilyPhotoRequest)init
{
  void *v3;
  FAFetchFamilyPhotoRequest *v4;

  +[_FAFamilyCircleRequestConnectionProvider sharedInstance](_FAFamilyCircleRequestConnectionProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FAFetchFamilyPhotoRequest initWithConnectionProvider:](self, "initWithConnectionProvider:", v3);

  return v4;
}

- (FAFetchFamilyPhotoRequest)initWithConnectionProvider:(id)a3
{
  FAFetchFamilyPhotoRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FAFetchFamilyPhotoRequest;
  result = -[FAFamilyCircleRequest initWithConnectionProvider:](&v4, sel_initWithConnectionProvider_, a3);
  result->_monogramDiameter = 40.0;
  result->_useMonogramAsLastResort = 1;
  return result;
}

- (id)requestOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FAFetchFamilyPhotoRequest;
  -[FAFamilyCircleRequest requestOptions](&v17, sel_requestOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FAFetchFamilyPhotoRequest backgroundType](self, "backgroundType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("backgroundType"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[FAFetchFamilyPhotoRequest monogramDiameter](self, "monogramDiameter");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("monogramDiameter"));

  -[FAFetchFamilyPhotoRequest fullname](self, "fullname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FAFetchFamilyPhotoRequest fullname](self, "fullname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("fullname"));

  }
  -[FAFetchFamilyPhotoRequest emailAddress](self, "emailAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FAFetchFamilyPhotoRequest emailAddress](self, "emailAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("emailAddress"));

  }
  -[FAFetchFamilyPhotoRequest phoneNumber](self, "phoneNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FAFetchFamilyPhotoRequest phoneNumber](self, "phoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("phoneNumber"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FAFetchFamilyPhotoRequest useMonogramAsLastResort](self, "useMonogramAsLastResort"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("useMonogramAsLastResort"));

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyPhotoRequest - startRequestWithCompletionHandler:", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__FAFetchFamilyPhotoRequest_startRequestWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E8561870;
  v7 = v4;
  v18 = v7;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFetchFamilyPhotoRequest memberDSID](self, "memberDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFetchFamilyPhotoRequest memberHashedDSID](self, "memberHashedDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FAFetchFamilyPhotoRequest requestedSize](self, "requestedSize");
  v12 = -[FAFetchFamilyPhotoRequest localFallback](self, "localFallback");
  -[FAFetchFamilyPhotoRequest requestOptions](self, "requestOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __63__FAFetchFamilyPhotoRequest_startRequestWithCompletionHandler___block_invoke_15;
  v15[3] = &unk_1E8562570;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v8, "fetchFamilyMemberPhotoWithDSID:hashedDSID:size:localFallback:options:replyBlock:", v9, v10, v11, v12, v13, v15);

}

void __63__FAFetchFamilyPhotoRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FARemoveFamilyMemberRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__FAFetchFamilyPhotoRequest_startRequestWithCompletionHandler___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSNumber)memberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)memberHashedDSID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)localFallback
{
  return self->_localFallback;
}

- (unint64_t)requestedSize
{
  return self->_requestedSize;
}

- (double)requiredWidth
{
  return self->_requiredWidth;
}

- (void)setRequiredWidth:(double)a3
{
  self->_requiredWidth = a3;
}

- (double)requiredHeight
{
  return self->_requiredHeight;
}

- (void)setRequiredHeight:(double)a3
{
  self->_requiredHeight = a3;
}

- (double)monogramDiameter
{
  return self->_monogramDiameter;
}

- (void)setMonogramDiameter:(double)a3
{
  self->_monogramDiameter = a3;
}

- (BOOL)useMonogramAsLastResort
{
  return self->_useMonogramAsLastResort;
}

- (void)setUseMonogramAsLastResort:(BOOL)a3
{
  self->_useMonogramAsLastResort = a3;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (void)setBackgroundType:(int64_t)a3
{
  self->_backgroundType = a3;
}

- (NSString)fullname
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFullname:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_fullname, 0);
  objc_storeStrong((id *)&self->_memberHashedDSID, 0);
  objc_storeStrong((id *)&self->_memberDSID, 0);
}

@end
