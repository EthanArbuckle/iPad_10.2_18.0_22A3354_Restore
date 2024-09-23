@implementation GTTelemetryResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryResponse)init
{
  GTTelemetryResponse *v2;
  GTTelemetryResponse *v3;
  GTTelemetryResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryResponse;
  v2 = -[GTTelemetryResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version.var0.version = 1;
    v4 = v2;
  }

  return v3;
}

- (GTTelemetryResponse)initWithCoder:(id)a3
{
  id v4;
  GTTelemetryResponse *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSError *error;
  GTTelemetryResponse *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTTelemetryResponse;
  v5 = -[GTTelemetryResponse init](&v12, sel_init);
  if (v5)
  {
    v5->_version.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("version"));
    v5->_requestID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GTDataVersion version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", version.value, CFSTR("version"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestID, CFSTR("requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (GTDataVersion)version
{
  return (GTDataVersion)self->_version.value;
}

- (void)setVersion:(GTDataVersion)a3
{
  self->_version = a3;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
