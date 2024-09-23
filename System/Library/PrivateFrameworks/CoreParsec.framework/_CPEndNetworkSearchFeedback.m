@implementation _CPEndNetworkSearchFeedback

- (_CPEndNetworkSearchFeedback)init
{
  _CPEndNetworkSearchFeedback *v2;
  _CPEndNetworkSearchFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPEndNetworkSearchFeedback;
  v2 = -[_CPEndNetworkSearchFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPEndNetworkSearchFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPEndNetworkSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[_CPEndNetworkSearchFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPEndNetworkSearchFeedback responseSize](self, "responseSize"))
    PBDataWriterWriteInt64Field();
  if (-[_CPEndNetworkSearchFeedback statusCode](self, "statusCode"))
    PBDataWriterWriteInt32Field();
  -[_CPEndNetworkSearchFeedback uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPEndNetworkSearchFeedback parsecStatus](self, "parsecStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPEndNetworkSearchFeedback fbq](self, "fbq");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_CPEndNetworkSearchFeedback duration](self, "duration");
  if (v7 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_CPEndNetworkSearchFeedback partialClientIp](self, "partialClientIp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_CPEndNetworkSearchFeedback timingData](self, "timingData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_CPEndNetworkSearchFeedback timingData](self, "timingData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPEndNetworkSearchFeedback endpointType](self, "endpointType"))
    PBDataWriterWriteInt32Field();
  if (-[_CPEndNetworkSearchFeedback rawResponseSize](self, "rawResponseSize"))
    PBDataWriterWriteUint64Field();
  v11 = -[_CPEndNetworkSearchFeedback decompressedResponseSize](self, "decompressedResponseSize");
  v12 = v13;
  if (v11)
  {
    PBDataWriterWriteUint64Field();
    v12 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  int64_t responseSize;
  int statusCode;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  double duration;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  int endpointType;
  unint64_t rawResponseSize;
  unint64_t decompressedResponseSize;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_31;
  responseSize = self->_responseSize;
  if (responseSize != objc_msgSend(v4, "responseSize"))
    goto LABEL_31;
  statusCode = self->_statusCode;
  if (statusCode != objc_msgSend(v4, "statusCode"))
    goto LABEL_31;
  -[_CPEndNetworkSearchFeedback uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_30;
  -[_CPEndNetworkSearchFeedback uuid](self, "uuid");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[_CPEndNetworkSearchFeedback uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_31;
  }
  else
  {

  }
  -[_CPEndNetworkSearchFeedback parsecStatus](self, "parsecStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parsecStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_30;
  -[_CPEndNetworkSearchFeedback parsecStatus](self, "parsecStatus");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[_CPEndNetworkSearchFeedback parsecStatus](self, "parsecStatus");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parsecStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_31;
  }
  else
  {

  }
  -[_CPEndNetworkSearchFeedback fbq](self, "fbq");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbq");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_30;
  -[_CPEndNetworkSearchFeedback fbq](self, "fbq");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[_CPEndNetworkSearchFeedback fbq](self, "fbq");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fbq");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_31;
  }
  else
  {

  }
  duration = self->_duration;
  objc_msgSend(v4, "duration");
  if (duration != v26)
    goto LABEL_31;
  -[_CPEndNetworkSearchFeedback partialClientIp](self, "partialClientIp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partialClientIp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_30;
  -[_CPEndNetworkSearchFeedback partialClientIp](self, "partialClientIp");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_CPEndNetworkSearchFeedback partialClientIp](self, "partialClientIp");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "partialClientIp");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_31;
  }
  else
  {

  }
  -[_CPEndNetworkSearchFeedback timingData](self, "timingData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timingData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  -[_CPEndNetworkSearchFeedback timingData](self, "timingData");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_CPEndNetworkSearchFeedback timingData](self, "timingData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timingData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_31;
  }
  else
  {

  }
  endpointType = self->_endpointType;
  if (endpointType == objc_msgSend(v4, "endpointType"))
  {
    rawResponseSize = self->_rawResponseSize;
    if (rawResponseSize == objc_msgSend(v4, "rawResponseSize"))
    {
      decompressedResponseSize = self->_decompressedResponseSize;
      v37 = decompressedResponseSize == objc_msgSend(v4, "decompressedResponseSize");
      goto LABEL_32;
    }
  }
LABEL_31:
  v37 = 0;
LABEL_32:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  double duration;
  NSUInteger v9;
  double v10;
  long double v11;
  unint64_t v12;
  NSUInteger v13;

  v3 = (2654435761 * self->_responseSize) ^ (2654435761u * self->_timestamp);
  v4 = 2654435761 * self->_statusCode;
  v5 = v3 ^ v4 ^ -[NSString hash](self->_uuid, "hash");
  v6 = -[NSString hash](self->_parsecStatus, "hash");
  v7 = -[NSString hash](self->_fbq, "hash");
  duration = self->_duration;
  v9 = v6 ^ v7;
  v10 = -duration;
  if (duration >= 0.0)
    v10 = self->_duration;
  v11 = round(v10);
  v12 = (unint64_t)(fmod(v11, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v10 - v11, 0x40uLL);
  v13 = -[NSString hash](self->_partialClientIp, "hash");
  return v5 ^ v9 ^ v13 ^ -[_CPNetworkTimingData hash](self->_timingData, "hash") ^ (2654435761 * self->_endpointType) ^ (2654435761u * self->_rawResponseSize) ^ (2654435761u * self->_decompressedResponseSize) ^ v12;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (int64_t)responseSize
{
  return self->_responseSize;
}

- (void)setResponseSize:(int64_t)a3
{
  self->_responseSize = a3;
}

- (int)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int)a3
{
  self->_statusCode = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)parsecStatus
{
  return self->_parsecStatus;
}

- (void)setParsecStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)fbq
{
  return self->_fbq;
}

- (void)setFbq:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)partialClientIp
{
  return self->_partialClientIp;
}

- (void)setPartialClientIp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_CPNetworkTimingData)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
  objc_storeStrong((id *)&self->_timingData, a3);
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
}

- (unint64_t)rawResponseSize
{
  return self->_rawResponseSize;
}

- (void)setRawResponseSize:(unint64_t)a3
{
  self->_rawResponseSize = a3;
}

- (unint64_t)decompressedResponseSize
{
  return self->_decompressedResponseSize;
}

- (void)setDecompressedResponseSize:(unint64_t)a3
{
  self->_decompressedResponseSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_partialClientIp, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_parsecStatus, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (_CPEndNetworkSearchFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPEndNetworkSearchFeedback *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _CPNetworkTimingData *v9;
  void *v10;
  _CPNetworkTimingData *v11;
  _CPEndNetworkSearchFeedback *v12;

  v4 = a3;
  v5 = -[_CPEndNetworkSearchFeedback init](self, "init");
  if (v5)
  {
    -[_CPEndNetworkSearchFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPEndNetworkSearchFeedback setUuid:](v5, "setUuid:", v6);

    if (objc_msgSend(v4, "responseSize"))
      -[_CPEndNetworkSearchFeedback setResponseSize:](v5, "setResponseSize:", objc_msgSend(v4, "responseSize"));
    if (objc_msgSend(v4, "statusCode"))
      -[_CPEndNetworkSearchFeedback setStatusCode:](v5, "setStatusCode:", objc_msgSend(v4, "statusCode"));
    objc_msgSend(v4, "networkTimingData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = [_CPNetworkTimingData alloc];
      objc_msgSend(v4, "networkTimingData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_CPNetworkTimingData initWithTelemetryDictionary:](v9, "initWithTelemetryDictionary:", v10);
      -[_CPEndNetworkSearchFeedback setTimingData:](v5, "setTimingData:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (_CPEndNetworkSearchFeedback)initWithStartSearch:(id)a3 responseSize:(int64_t)a4 statusCode:(int64_t)a5 parsecStatus:(id)a6 parsecDuration:(double)a7 fbq:(id)a8 partialClientIp:(id)a9 networkTimingData:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _CPEndNetworkSearchFeedback *v22;
  void *v23;
  void *v24;
  _CPNetworkTimingData *v25;
  _CPEndNetworkSearchFeedback *v26;

  v17 = a3;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = -[_CPEndNetworkSearchFeedback init](self, "init");
  if (v22)
  {
    objc_msgSend(v17, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v17, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPEndNetworkSearchFeedback setUuid:](v22, "setUuid:", v24);

    }
    if (a4)
      -[_CPEndNetworkSearchFeedback setResponseSize:](v22, "setResponseSize:", a4);
    if (a5)
      -[_CPEndNetworkSearchFeedback setStatusCode:](v22, "setStatusCode:", a5);
    -[_CPEndNetworkSearchFeedback setParsecStatus:](v22, "setParsecStatus:", v18);
    if (a7 != 0.0)
      -[_CPEndNetworkSearchFeedback setDuration:](v22, "setDuration:", a7);
    -[_CPEndNetworkSearchFeedback setFbq:](v22, "setFbq:", v19);
    -[_CPEndNetworkSearchFeedback setPartialClientIp:](v22, "setPartialClientIp:", v20);
    if (objc_msgSend(v21, "count"))
    {
      v25 = -[_CPNetworkTimingData initWithTelemetryDictionary:]([_CPNetworkTimingData alloc], "initWithTelemetryDictionary:", v21);
      -[_CPEndNetworkSearchFeedback setTimingData:](v22, "setTimingData:", v25);

    }
    -[_CPEndNetworkSearchFeedback setEndpointType:](v22, "setEndpointType:", objc_msgSend(v17, "endpointType"));
    v26 = v22;
  }

  return v22;
}

@end
