@implementation GEOExternalRequestCounterInfo

- (GEOExternalRequestCounterInfo)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5;
  GEOExternalRequestCounterInfo *v6;
  const char *string;
  uint64_t v8;
  NSString *appId;
  uint64_t v10;
  NSDate *startTime;
  uint64_t v12;
  NSDate *endTime;
  const char *v14;
  uint64_t v15;
  NSString *requestType;
  const char *v17;
  uint64_t v18;
  NSString *requestSubtype;
  const char *v20;
  uint64_t v21;
  NSString *source;
  GEOExternalRequestCounterInfo *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GEOExternalRequestCounterInfo;
  v6 = -[GEOExternalRequestCounterInfo init](&v25, sel_init);
  if (v6)
  {
    string = xpc_dictionary_get_string(v5, "appId");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v8 = objc_claimAutoreleasedReturnValue();
      appId = v6->_appId;
      v6->_appId = (NSString *)v8;

    }
    if (xpc_dictionary_get_double(v5, "startTime") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v10 = objc_claimAutoreleasedReturnValue();
      startTime = v6->_startTime;
      v6->_startTime = (NSDate *)v10;

    }
    if (xpc_dictionary_get_double(v5, "endTime") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v12 = objc_claimAutoreleasedReturnValue();
      endTime = v6->_endTime;
      v6->_endTime = (NSDate *)v12;

    }
    v6->_xmitBytes = xpc_dictionary_get_int64(v5, "xmitBytes");
    v6->_recvBytes = xpc_dictionary_get_int64(v5, "recvBytes");
    v6->_usedInterface = xpc_dictionary_get_int64(v5, "interface");
    v14 = xpc_dictionary_get_string(v5, "reqType");
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      requestType = v6->_requestType;
      v6->_requestType = (NSString *)v15;

    }
    v17 = xpc_dictionary_get_string(v5, "reqSubtype");
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      requestSubtype = v6->_requestSubtype;
      v6->_requestSubtype = (NSString *)v18;

    }
    v20 = xpc_dictionary_get_string(v5, "source");
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      source = v6->_source;
      v6->_source = (NSString *)v21;

    }
    v23 = v6;
  }

  return v6;
}

- (void)encodeToXPCDictionary:(id)a3
{
  NSString *appId;
  const char *v5;
  NSDate *startTime;
  double v7;
  NSDate *endTime;
  double v9;
  NSString *requestType;
  const char *v11;
  NSString *requestSubtype;
  const char *v13;
  NSString *source;
  const char *v15;
  xpc_object_t xdict;

  xdict = a3;
  appId = self->_appId;
  if (appId)
  {
    v5 = -[NSString UTF8String](appId, "UTF8String");
    if (v5)
      xpc_dictionary_set_string(xdict, "appId", v5);
  }
  startTime = self->_startTime;
  if (startTime)
  {
    -[NSDate timeIntervalSinceReferenceDate](startTime, "timeIntervalSinceReferenceDate");
    if (v7 != 0.0)
      xpc_dictionary_set_double(xdict, "startTime", v7);
  }
  endTime = self->_endTime;
  if (endTime)
  {
    -[NSDate timeIntervalSinceReferenceDate](endTime, "timeIntervalSinceReferenceDate");
    if (v9 != 0.0)
      xpc_dictionary_set_double(xdict, "endTime", v9);
  }
  xpc_dictionary_set_int64(xdict, "xmitBytes", self->_xmitBytes);
  xpc_dictionary_set_int64(xdict, "recvBytes", self->_recvBytes);
  xpc_dictionary_set_int64(xdict, "interface", self->_usedInterface);
  requestType = self->_requestType;
  if (requestType)
  {
    v11 = -[NSString UTF8String](requestType, "UTF8String");
    if (v11)
      xpc_dictionary_set_string(xdict, "reqType", v11);
  }
  requestSubtype = self->_requestSubtype;
  if (requestSubtype)
  {
    v13 = -[NSString UTF8String](requestSubtype, "UTF8String");
    if (v13)
      xpc_dictionary_set_string(xdict, "reqSubtype", v13);
  }
  source = self->_source;
  if (source)
  {
    v15 = -[NSString UTF8String](source, "UTF8String");
    if (v15)
      xpc_dictionary_set_string(xdict, "source", v15);
  }

}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  objc_storeStrong((id *)&self->_appId, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (int64_t)xmitBytes
{
  return self->_xmitBytes;
}

- (void)setXmitBytes:(int64_t)a3
{
  self->_xmitBytes = a3;
}

- (int64_t)recvBytes
{
  return self->_recvBytes;
}

- (void)setRecvBytes:(int64_t)a3
{
  self->_recvBytes = a3;
}

- (unint64_t)usedInterface
{
  return self->_usedInterface;
}

- (void)setUsedInterface:(unint64_t)a3
{
  self->_usedInterface = a3;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(id)a3
{
  objc_storeStrong((id *)&self->_requestType, a3);
}

- (NSString)requestSubtype
{
  return self->_requestSubtype;
}

- (void)setRequestSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_requestSubtype, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_requestSubtype, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
