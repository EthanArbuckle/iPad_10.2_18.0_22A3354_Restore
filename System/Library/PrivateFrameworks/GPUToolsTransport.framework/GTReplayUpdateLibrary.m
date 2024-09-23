@implementation GTReplayUpdateLibrary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateLibrary)initWithCoder:(id)a3
{
  id v4;
  GTReplayUpdateLibrary *v5;
  uint64_t v6;
  NSURL *shaderURL;
  uint64_t v8;
  NSData *shaderIR;
  uint64_t v10;
  NSString *shaderSource;
  GTReplayUpdateLibrary *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GTReplayUpdateLibrary;
  v5 = -[GTReplayRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shaderURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    shaderURL = v5->_shaderURL;
    v5->_shaderURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shaderIR"));
    v8 = objc_claimAutoreleasedReturnValue();
    shaderIR = v5->_shaderIR;
    v5->_shaderIR = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shaderSource"));
    v10 = objc_claimAutoreleasedReturnValue();
    shaderSource = v5->_shaderSource;
    v5->_shaderSource = (NSString *)v10;

    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, CFSTR("dispatchUID"));
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayUpdateLibrary;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_shaderURL, CFSTR("shaderURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shaderIR, CFSTR("shaderIR"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shaderSource, CFSTR("shaderSource"));
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, CFSTR("dispatchUID"));

}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (NSURL)shaderURL
{
  return self->_shaderURL;
}

- (void)setShaderURL:(id)a3
{
  objc_storeStrong((id *)&self->_shaderURL, a3);
}

- (NSData)shaderIR
{
  return self->_shaderIR;
}

- (void)setShaderIR:(id)a3
{
  objc_storeStrong((id *)&self->_shaderIR, a3);
}

- (NSString)shaderSource
{
  return self->_shaderSource;
}

- (void)setShaderSource:(id)a3
{
  objc_storeStrong((id *)&self->_shaderSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaderSource, 0);
  objc_storeStrong((id *)&self->_shaderIR, 0);
  objc_storeStrong((id *)&self->_shaderURL, 0);
}

@end
