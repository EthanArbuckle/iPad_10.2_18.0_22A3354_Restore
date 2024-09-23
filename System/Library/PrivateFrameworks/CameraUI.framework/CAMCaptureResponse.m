@implementation CAMCaptureResponse

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (CAMCaptureResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("CAMCaptureResponse must be initialized using -initWithType:captureSession:"));

  return 0;
}

- (CAMCaptureResponse)initWithType:(int64_t)a3 captureSession:(unsigned __int16)a4 coordinationInfo:(id)a5
{
  id v9;
  CAMCaptureResponse *v10;
  CAMCaptureResponse *v11;
  CAMCaptureResponse *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CAMCaptureResponse;
  v10 = -[CAMCaptureResponse init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_sessionIdentifier = a4;
    objc_storeStrong((id *)&v10->_coordinationInfo, a5);
    v12 = v11;
  }

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationInfo, 0);
}

@end
