@implementation ENDownloadEndpointState

- (ENDownloadEndpointState)initWithEndpoint:(id)a3
{
  id v5;
  ENDownloadEndpointState *v6;
  ENDownloadEndpointState *v7;
  uint64_t v8;
  NSUUID *identifier;
  void *v10;
  uint64_t v11;
  NSString *shortIdentifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ENDownloadEndpointState;
  v6 = -[ENDownloadEndpointState init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    objc_msgSend(MEMORY[0x1E0CB3A30], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    -[NSUUID UUIDString](v7->_identifier, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringToIndex:", 8);
    v11 = objc_claimAutoreleasedReturnValue();
    shortIdentifier = v7->_shortIdentifier;
    v7->_shortIdentifier = (NSString *)v11;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ENDownloadEndpoint *endpoint;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  endpoint = self->_endpoint;
  v10 = a3;
  -[ENDownloadEndpoint serverBaseURL](endpoint, "serverBaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("url"));

  -[ENDownloadEndpoint serverIndexURL](self->_endpoint, "serverIndexURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("indexURL"));

  -[ENDownloadEndpoint downloadInterval](self->_endpoint, "downloadInterval");
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("interval"));
  objc_msgSend(v10, "encodeBool:forKey:", -[ENDownloadEndpoint enabled](self->_endpoint, "enabled"), CFSTR("enable"));
  -[ENDownloadEndpoint region](self->_endpoint, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("region"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_identifier, CFSTR("id"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_lastFetchAttemptDate, CFSTR("lastAttempt"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_lastSuccessfulFetchDate, CFSTR("lastSuccess"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_lastDownloadedFilePath, CFSTR("lastFile"));

}

- (ENDownloadEndpointState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  ENDownloadEndpoint *v15;
  ENDownloadEndpointState *v16;
  uint64_t v17;
  NSUUID *identifier;
  uint64_t v19;
  NSDate *lastFetchAttemptDate;
  uint64_t v21;
  NSDate *lastSuccessfulFetchDate;
  uint64_t v23;
  NSString *lastDownloadedFilePath;
  ENDownloadEndpointState *v25;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regionPath"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v25 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v10 = (void *)v9;
      objc_msgSend(v6, "URLByAppendingPathComponent:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("index.txt"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("interval"));
      v15 = -[ENDownloadEndpoint initWithBaseURL:indexURL:interval:enabled:region:]([ENDownloadEndpoint alloc], "initWithBaseURL:indexURL:interval:enabled:region:", v6, v8, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enable")), v13, v14);
      v16 = -[ENDownloadEndpointState initWithEndpoint:](self, "initWithEndpoint:", v15);
      if (v16)
      {
        v17 = objc_msgSend(v12, "copy");
        identifier = v16->_identifier;
        v16->_identifier = (NSUUID *)v17;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastAttempt"));
        v19 = objc_claimAutoreleasedReturnValue();
        lastFetchAttemptDate = v16->_lastFetchAttemptDate;
        v16->_lastFetchAttemptDate = (NSDate *)v19;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSuccess"));
        v21 = objc_claimAutoreleasedReturnValue();
        lastSuccessfulFetchDate = v16->_lastSuccessfulFetchDate;
        v16->_lastSuccessfulFetchDate = (NSDate *)v21;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFile"));
        v23 = objc_claimAutoreleasedReturnValue();
        lastDownloadedFilePath = v16->_lastDownloadedFilePath;
        v16->_lastDownloadedFilePath = (NSString *)v23;

      }
      self = v16;

      v25 = self;
    }
    else
    {
      v25 = 0;
    }

    goto LABEL_12;
  }
  v25 = 0;
LABEL_13:

  return v25;
}

- (ENDownloadEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)lastFetchAttemptDate
{
  return self->_lastFetchAttemptDate;
}

- (void)setLastFetchAttemptDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastSuccessfulFetchDate
{
  return self->_lastSuccessfulFetchDate;
}

- (void)setLastSuccessfulFetchDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)lastDownloadedFilePath
{
  return self->_lastDownloadedFilePath;
}

- (void)setLastDownloadedFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)shortIdentifier
{
  return self->_shortIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortIdentifier, 0);
  objc_storeStrong((id *)&self->_lastDownloadedFilePath, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulFetchDate, 0);
  objc_storeStrong((id *)&self->_lastFetchAttemptDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
