@implementation GTReplaySessionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplaySessionInfo)initWithCoder:(id)a3
{
  id v4;
  GTReplaySessionInfo *v5;
  uint64_t v6;
  NSURL *gputraceURL;
  GTReplaySessionInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplaySessionInfo;
  v5 = -[GTReplaySessionInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gputraceURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    gputraceURL = v5->_gputraceURL;
    v5->_gputraceURL = (NSURL *)v6;

    v5->_shaderDebuggerVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("shaderDebuggerVersion"));
    v5->_shaderProfilerVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("shaderProfilerVersion"));
    v5->_accelerationViewerVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("accelerationViewerVersion"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *gputraceURL;
  id v5;

  gputraceURL = self->_gputraceURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", gputraceURL, CFSTR("gputraceURL"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_shaderDebuggerVersion, CFSTR("shaderDebuggerVersion"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_shaderProfilerVersion, CFSTR("shaderProfilerVersion"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_accelerationViewerVersion, CFSTR("accelerationViewerVersion"));

}

- (NSURL)gputraceURL
{
  return self->_gputraceURL;
}

- (void)setGputraceURL:(id)a3
{
  objc_storeStrong((id *)&self->_gputraceURL, a3);
}

- (unint64_t)shaderDebuggerVersion
{
  return self->_shaderDebuggerVersion;
}

- (void)setShaderDebuggerVersion:(unint64_t)a3
{
  self->_shaderDebuggerVersion = a3;
}

- (unint64_t)shaderProfilerVersion
{
  return self->_shaderProfilerVersion;
}

- (void)setShaderProfilerVersion:(unint64_t)a3
{
  self->_shaderProfilerVersion = a3;
}

- (unint64_t)accelerationViewerVersion
{
  return self->_accelerationViewerVersion;
}

- (void)setAccelerationViewerVersion:(unint64_t)a3
{
  self->_accelerationViewerVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gputraceURL, 0);
}

@end
