@implementation DEPDeviceUploadDeviceDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serialNumber;
  id v5;

  serialNumber = self->_serialNumber;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUploadStatus, CFSTR("deviceUploadStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorMessage, CFSTR("errorMessage"));

}

- (DEPDeviceUploadDeviceDetails)initWithCoder:(id)a3
{
  id v4;
  DEPDeviceUploadDeviceDetails *v5;
  uint64_t v6;
  NSString *serialNumber;
  uint64_t v8;
  NSString *deviceUploadStatus;
  uint64_t v10;
  NSString *errorMessage;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEPDeviceUploadDeviceDetails;
  v5 = -[DEPDeviceUploadDeviceDetails init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceUploadStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceUploadStatus = v5->_deviceUploadStatus;
    v5->_deviceUploadStatus = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorMessage"));
    v10 = objc_claimAutoreleasedReturnValue();
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v10;

  }
  return v5;
}

- (DEPDeviceUploadDeviceDetails)initWithDict:(id)a3
{
  id v4;
  DEPDeviceUploadDeviceDetails *v5;
  uint64_t v6;
  NSString *serialNumber;
  uint64_t v8;
  NSString *deviceUploadStatus;
  uint64_t v10;
  NSString *errorMessage;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEPDeviceUploadDeviceDetails;
  v5 = -[DEPDeviceUploadDeviceDetails init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serialNo"));
    v6 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceUploadStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceUploadStatus = v5->_deviceUploadStatus;
    v5->_deviceUploadStatus = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorMessage"));
    v10 = objc_claimAutoreleasedReturnValue();
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v10;

  }
  return v5;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)deviceUploadStatus
{
  return self->_deviceUploadStatus;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_deviceUploadStatus, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
