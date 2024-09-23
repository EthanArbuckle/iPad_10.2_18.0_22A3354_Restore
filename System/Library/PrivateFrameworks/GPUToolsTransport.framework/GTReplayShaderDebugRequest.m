@implementation GTReplayShaderDebugRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugRequest)initWithCoder:(id)a3
{
  id v4;
  GTReplayShaderDebugRequest *v5;
  uint64_t v6;
  NSData *programData;
  GTReplayShaderDebugRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayShaderDebugRequest;
  v5 = -[GTReplayRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, CFSTR("dispatchUID"));
    v5->_programDataVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ProgramDataVersion"));
    objc_msgSend(v4, "decodeDataObject");
    v6 = objc_claimAutoreleasedReturnValue();
    programData = v5->_programData;
    v5->_programData = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayShaderDebugRequest;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, CFSTR("dispatchUID"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_programDataVersion, CFSTR("ProgramDataVersion"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDataObject:", self->_programData);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (int)programDataVersion
{
  return self->_programDataVersion;
}

- (void)setProgramDataVersion:(int)a3
{
  self->_programDataVersion = a3;
}

- (NSData)programData
{
  return self->_programData;
}

- (void)setProgramData:(id)a3
{
  objc_storeStrong((id *)&self->_programData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programData, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
