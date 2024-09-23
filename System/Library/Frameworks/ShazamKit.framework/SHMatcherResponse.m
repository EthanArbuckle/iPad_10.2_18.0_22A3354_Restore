@implementation SHMatcherResponse

+ (id)errorResponseForSignature:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  SHMatcherResponse *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:]([SHMatcherResponse alloc], "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:", 0, v6, 0, 3, v5, 0.0, 0.0, 0.0);

  return v7;
}

+ (id)noMatchWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 signature:(id)a6
{
  id v9;
  SHMatcherResponse *v10;

  v9 = a6;
  v10 = -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:]([SHMatcherResponse alloc], "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:", 0, v9, 0, 2, 0, a3, a4, a5);

  return v10;
}

+ (id)matchWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6
{
  id v9;
  SHMatcherResponse *v10;
  void *v11;
  SHMatcherResponse *v12;

  v9 = a6;
  v10 = [SHMatcherResponse alloc];
  objc_msgSend(v9, "querySignature");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:](v10, "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:", v9, v11, 0, 1, 0, a3, a4, a5);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMatcherResponse)initWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6 signature:(id)a7 runningAssociatedRequestID:(id)a8 error:(id)a9
{
  return -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:](self, "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:", a3, a4, a5);
}

- (SHMatcherResponse)initWithRecordingIntermission:(double)a3 recordingSignatureOffset:(double)a4 retrySeconds:(double)a5 match:(id)a6 signature:(id)a7 associatedRequestID:(id)a8 result:(int64_t)a9 error:(id)a10
{
  id v19;
  id v20;
  id v21;
  id v22;
  SHMatcherResponse *v23;
  SHMatcherResponse *v24;
  objc_super v26;

  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  v26.receiver = self;
  v26.super_class = (Class)SHMatcherResponse;
  v23 = -[SHMatcherResponse init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_recordingSignatureOffset = a4;
    v23->_recordingIntermission = a3;
    v23->_retrySeconds = a5;
    objc_storeStrong((id *)&v23->_match, a6);
    objc_storeStrong((id *)&v24->_signature, a7);
    objc_storeStrong((id *)&v24->_runningAssociatedRequestID, a8);
    v24->_result = a9;
    objc_storeStrong((id *)&v24->_error, a10);
    -[SHMatcherResponse validate](v24, "validate");
  }

  return v24;
}

- (BOOL)isStillRunningAssociatedRequest
{
  void *v2;
  BOOL v3;

  -[SHMatcherResponse runningAssociatedRequestID](self, "runningAssociatedRequestID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SHSignature)signature
{
  SHSignature *signature;

  signature = self->_signature;
  if (signature)
    return signature;
  -[SHMatch querySignature](self->_match, "querySignature");
  return (SHSignature *)(id)objc_claimAutoreleasedReturnValue();
}

- (SHMatcherResponse)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  SHMatcherResponse *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("recordingIntermission"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("recordingSignatureOffset"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("retrySeconds"));
  v10 = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("match"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedRequestID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resultType"));

  v16 = -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:](self, "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:associatedRequestID:result:error:", v11, v12, v14, v15, v13, v6, v8, v10);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  SHMatch *match;
  void *v5;
  id v6;

  match = self->_match;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", match, CFSTR("match"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  +[SHError normalizedError:](SHError, "normalizedError:", self->_error);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("error"));

  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("recordingIntermission"), self->_recordingIntermission);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("recordingSignatureOffset"), self->_recordingSignatureOffset);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("retrySeconds"), self->_retrySeconds);
  objc_msgSend(v6, "encodeObject:forKey:", self->_runningAssociatedRequestID, CFSTR("associatedRequestID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_result, CFSTR("resultType"));

}

- (double)recordingSignatureOffset
{
  return self->_recordingSignatureOffset;
}

- (double)recordingIntermission
{
  return self->_recordingIntermission;
}

- (double)retrySeconds
{
  return self->_retrySeconds;
}

- (SHMatch)match
{
  return self->_match;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)result
{
  return self->_result;
}

- (NSUUID)runningAssociatedRequestID
{
  return self->_runningAssociatedRequestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningAssociatedRequestID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
