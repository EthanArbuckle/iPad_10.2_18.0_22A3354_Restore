@implementation CSAudioStopStreamOption

- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5 holdRequest:(id)a6 supportsMagus:(BOOL)a7 requestId:(id)a8
{
  id v15;
  id v16;
  CSAudioStopStreamOption *v17;
  CSAudioStopStreamOption *v18;
  objc_super v20;

  v15 = a6;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)CSAudioStopStreamOption;
  v17 = -[CSAudioStopStreamOption init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_stopRecordingReason = a3;
    v17->_expectedStopHostTime = a4;
    v17->_trailingSilenceDurationAtEndpoint = a5;
    objc_storeStrong((id *)&v17->_holdRequest, a6);
    v18->_supportsMagus = a7;
    objc_storeStrong((id *)&v18->_requestId, a8);
  }

  return v18;
}

- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5 holdRequest:(id)a6 supportsMagus:(BOOL)a7
{
  return -[CSAudioStopStreamOption initWithStopRecordingReason:expectedStopHostTime:trailingSilenceDurationAtEndpoint:holdRequest:supportsMagus:requestId:](self, "initWithStopRecordingReason:expectedStopHostTime:trailingSilenceDurationAtEndpoint:holdRequest:supportsMagus:requestId:", a3, a4, a6, a7, 0, a5);
}

- (CSAudioStopStreamOption)initWithStopRecordingReason:(unint64_t)a3 expectedStopHostTime:(unint64_t)a4 trailingSilenceDurationAtEndpoint:(double)a5
{
  return -[CSAudioStopStreamOption initWithStopRecordingReason:expectedStopHostTime:trailingSilenceDurationAtEndpoint:holdRequest:supportsMagus:](self, "initWithStopRecordingReason:expectedStopHostTime:trailingSilenceDurationAtEndpoint:holdRequest:supportsMagus:", a3, a4, 0, 0, a5);
}

- (CSAudioStopStreamOption)initWithXPCObject:(id)a3
{
  id v4;
  CSAudioStopStreamOption *v5;
  const char *string;
  uint64_t v7;
  NSString *requestId;
  void *v9;
  CSAudioStreamHoldRequestOption *v10;
  void *v11;
  uint64_t v12;
  CSAudioStreamHoldRequestOption *holdRequest;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSAudioStopStreamOption;
  v5 = -[CSAudioStopStreamOption init](&v15, sel_init);
  if (v5)
  {
    v5->_stopRecordingReason = xpc_dictionary_get_uint64(v4, "stopRecordingReason");
    v5->_expectedStopHostTime = xpc_dictionary_get_uint64(v4, "expectedStopHostTime");
    v5->_trailingSilenceDurationAtEndpoint = xpc_dictionary_get_double(v4, "trailingSilenceDurationAtEndpoint");
    v5->_supportsMagus = xpc_dictionary_get_BOOL(v4, "supportsMagus");
    string = xpc_dictionary_get_string(v4, "requestId");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v7 = objc_claimAutoreleasedReturnValue();
      requestId = v5->_requestId;
      v5->_requestId = (NSString *)v7;
    }
    else
    {
      requestId = v5->_requestId;
      v5->_requestId = 0;
    }

    xpc_dictionary_get_dictionary(v4, "holdRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [CSAudioStreamHoldRequestOption alloc];
      xpc_dictionary_get_dictionary(v4, "holdRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CSAudioStreamHoldRequestOption initWithXPCObject:](v10, "initWithXPCObject:", v11);
      holdRequest = v5->_holdRequest;
      v5->_holdRequest = (CSAudioStreamHoldRequestOption *)v12;

    }
  }

  return v5;
}

- (id)xpcObject
{
  xpc_object_t v3;
  CSAudioStreamHoldRequestOption *holdRequest;
  void *v5;
  NSString *requestId;
  xpc_object_t v7;
  uint64_t i;
  xpc_object_t values[4];
  char *keys[5];

  keys[4] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "stopRecordingReason";
  keys[1] = "expectedStopHostTime";
  keys[2] = "trailingSilenceDurationAtEndpoint";
  keys[3] = "supportsMagus";
  values[0] = xpc_uint64_create(self->_stopRecordingReason);
  values[1] = xpc_uint64_create(self->_expectedStopHostTime);
  values[2] = xpc_double_create(self->_trailingSilenceDurationAtEndpoint);
  values[3] = xpc_BOOL_create(self->_supportsMagus);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  holdRequest = self->_holdRequest;
  if (holdRequest)
  {
    -[CSAudioStreamHoldRequestOption xpcObject](holdRequest, "xpcObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v3, "holdRequest", v5);

  }
  requestId = self->_requestId;
  if (requestId)
  {
    v7 = xpc_string_create(-[NSString UTF8String](requestId, "UTF8String"));
    xpc_dictionary_set_value(v3, "requestId", v7);

  }
  for (i = 3; i != -1; --i)

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t stopRecordingReason;
  CSAudioStreamHoldRequestOption *holdRequest;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  stopRecordingReason = self->_stopRecordingReason;
  if (stopRecordingReason <= 7)
    objc_msgSend(v3, "appendString:", off_1E6880950[stopRecordingReason]);
  objc_msgSend(v4, "appendFormat:", CFSTR(", %llu"), self->_expectedStopHostTime);
  objc_msgSend(v4, "appendFormat:", CFSTR(", %f"), *(_QWORD *)&self->_trailingSilenceDurationAtEndpoint);
  objc_msgSend(v4, "appendFormat:", CFSTR(", %d"), self->_supportsMagus);
  holdRequest = self->_holdRequest;
  if (holdRequest)
  {
    -[CSAudioStreamHoldRequestOption description](holdRequest, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), v7);

  }
  objc_msgSend(v4, "appendFormat:", CFSTR("}"));
  return v4;
}

- (unint64_t)stopRecordingReason
{
  return self->_stopRecordingReason;
}

- (BOOL)supportsMagus
{
  return self->_supportsMagus;
}

- (unint64_t)expectedStopHostTime
{
  return self->_expectedStopHostTime;
}

- (double)trailingSilenceDurationAtEndpoint
{
  return self->_trailingSilenceDurationAtEndpoint;
}

- (CSAudioStreamHoldRequestOption)holdRequest
{
  return self->_holdRequest;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_holdRequest, 0);
}

@end
