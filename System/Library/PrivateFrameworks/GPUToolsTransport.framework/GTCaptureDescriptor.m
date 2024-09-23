@implementation GTCaptureDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureDescriptor)initWithRequestID:(unint64_t)a3
{
  GTCaptureDescriptor *v3;
  GTCaptureDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTCaptureDescriptor;
  v3 = -[GTCaptureRequest initWithRequestID:](&v6, sel_initWithRequestID_, a3);
  v4 = v3;
  if (v3)
    v3->_sessionID = -[GTCaptureRequest requestID](v3, "requestID");
  return v4;
}

- (GTCaptureDescriptor)initWithCoder:(id)a3
{
  id v4;
  GTCaptureDescriptor *v5;
  uint64_t v6;
  NSURL *outputURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTCaptureDescriptor;
  v5 = -[GTCaptureRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_sessionID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sessionID"));
    v5->_triggerHitsToStart = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("triggerHitsToStart"));
    v5->_triggerHitsToEnd = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("triggerHitsToEnd"));
    v5->_suspendAfterCapture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suspendAfterCapture"));
    v5->_ignoreUnusedResources = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreUnusedResources"));
    v5->_isToolsCapture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isToolsCapture"));
    v5->_includeBacktrace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeBacktrace"));
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("outputURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    outputURL = v5->_outputURL;
    v5->_outputURL = (NSURL *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sessionID;
  id v5;

  sessionID = self->_sessionID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_triggerHitsToStart, CFSTR("triggerHitsToStart"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_triggerHitsToEnd, CFSTR("triggerHitsToEnd"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suspendAfterCapture, CFSTR("suspendAfterCapture"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreUnusedResources, CFSTR("ignoreUnusedResources"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isToolsCapture, CFSTR("isToolsCapture"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeBacktrace, CFSTR("includeBacktrace"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_outputURL, CFSTR("outputURL"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)GTCaptureDescriptor;
  -[GTCaptureDescriptor description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n    sessionID: %llu"), v4, self->_sessionID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_sessionID = a3;
}

- (unint64_t)triggerHitsToStart
{
  return self->_triggerHitsToStart;
}

- (void)setTriggerHitsToStart:(unint64_t)a3
{
  self->_triggerHitsToStart = a3;
}

- (unint64_t)triggerHitsToEnd
{
  return self->_triggerHitsToEnd;
}

- (void)setTriggerHitsToEnd:(unint64_t)a3
{
  self->_triggerHitsToEnd = a3;
}

- (BOOL)suspendAfterCapture
{
  return self->_suspendAfterCapture;
}

- (void)setSuspendAfterCapture:(BOOL)a3
{
  self->_suspendAfterCapture = a3;
}

- (BOOL)ignoreUnusedResources
{
  return self->_ignoreUnusedResources;
}

- (void)setIgnoreUnusedResources:(BOOL)a3
{
  self->_ignoreUnusedResources = a3;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (BOOL)includeBacktrace
{
  return self->_includeBacktrace;
}

- (void)setIncludeBacktrace:(BOOL)a3
{
  self->_includeBacktrace = a3;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_storeStrong((id *)&self->_outputURL, a3);
}

- (BOOL)isToolsCapture
{
  return self->_isToolsCapture;
}

- (void)setIsToolsCapture:(BOOL)a3
{
  self->_isToolsCapture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputURL, 0);
}

@end
