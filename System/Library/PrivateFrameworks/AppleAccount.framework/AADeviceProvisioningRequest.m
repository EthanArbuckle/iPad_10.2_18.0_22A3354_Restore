@implementation AADeviceProvisioningRequest

- (AADeviceProvisioningRequest)initWithDSID:(id)a3 URLString:(id)a4 requestData:(id)a5
{
  id v9;
  id v10;
  id v11;
  AADeviceProvisioningRequest *v12;
  AADeviceProvisioningRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AADeviceProvisioningRequest;
  v12 = -[AADeviceProvisioningRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dsid, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_data, a5);
  }

  return v13;
}

- (id)urlString
{
  return self->_url;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  NSString *dsid;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)AADeviceProvisioningRequest;
  -[AARequest urlRequest](&v18, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  -[NSData base64EncodedStringWithOptions:](self->_data, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("clientData");
  v21[1] = CFSTR("dsId");
  dsid = self->_dsid;
  v22[0] = v5;
  v22[1] = dsid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 100, 0, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    objc_msgSend(v4, "setHTTPBody:", v8);
  }
  else
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[AADeviceInfo apnsToken](AADeviceInfo, "apnsToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithData:encoding:", v13, 4);

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("text/plist"), CFSTR("Content-Type"));
  +[AADeviceInfo udid](AADeviceInfo, "udid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v15, CFSTR("Device-UDID"));

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", v14, CFSTR("Device-apnsToken"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
