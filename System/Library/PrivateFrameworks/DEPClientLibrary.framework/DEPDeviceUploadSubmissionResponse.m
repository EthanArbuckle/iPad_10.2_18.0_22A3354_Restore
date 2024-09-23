@implementation DEPDeviceUploadSubmissionResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *requestId;
  id v5;

  requestId = self->_requestId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestId, CFSTR("requestId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestStatus, CFSTR("requestStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorMessage, CFSTR("errorMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_devices, CFSTR("devices"));

}

- (DEPDeviceUploadSubmissionResponse)initWithCoder:(id)a3
{
  id v4;
  DEPDeviceUploadSubmissionResponse *v5;
  uint64_t v6;
  NSString *requestId;
  uint64_t v8;
  NSString *requestStatus;
  uint64_t v10;
  NSString *errorMessage;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *devices;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DEPDeviceUploadSubmissionResponse;
  v5 = -[DEPDeviceUploadSubmissionResponse init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestId = v5->_requestId;
    v5->_requestId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestStatus = v5->_requestStatus;
    v5->_requestStatus = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorMessage"));
    v10 = objc_claimAutoreleasedReturnValue();
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("devices"));
    v15 = objc_claimAutoreleasedReturnValue();
    devices = v5->_devices;
    v5->_devices = (NSArray *)v15;

  }
  return v5;
}

- (DEPDeviceUploadSubmissionResponse)initWithDict:(id)a3
{
  id v4;
  DEPDeviceUploadSubmissionResponse *v5;
  uint64_t v6;
  NSString *requestId;
  uint64_t v8;
  NSString *requestStatus;
  uint64_t v10;
  NSString *errorMessage;
  void *v12;
  uint64_t v13;
  NSArray *devices;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DEPDeviceUploadSubmissionResponse;
  v5 = -[DEPDeviceUploadSubmissionResponse init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestId = v5->_requestId;
    v5->_requestId = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestStatus = v5->_requestStatus;
    v5->_requestStatus = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorMessage"));
    v10 = objc_claimAutoreleasedReturnValue();
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceDetails"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEPDeviceUploadSubmissionResponse _devicesFromDeviceArray:](v5, "_devicesFromDeviceArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    devices = v5->_devices;
    v5->_devices = (NSArray *)v13;

  }
  return v5;
}

- (id)_devicesFromDeviceArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DEPDeviceUploadDeviceDetails *v11;
  DEPDeviceUploadDeviceDetails *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [DEPDeviceUploadDeviceDetails alloc];
        v12 = -[DEPDeviceUploadDeviceDetails initWithDict:](v11, "initWithDict:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)requestStatus
{
  return self->_requestStatus;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_requestStatus, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end
