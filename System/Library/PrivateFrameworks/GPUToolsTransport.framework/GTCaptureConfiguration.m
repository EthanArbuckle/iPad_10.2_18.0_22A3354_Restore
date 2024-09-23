@implementation GTCaptureConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureConfiguration)init
{
  char *v2;
  GTCaptureConfiguration *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTCaptureConfiguration;
  v2 = -[GTCaptureConfiguration init](&v6, sel_init);
  v3 = (GTCaptureConfiguration *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 0;
    v2[10] = 0;
    *(_QWORD *)(v2 + 12) = 0x2000000005ALL;
    v4 = v2;
  }

  return v3;
}

- (GTCaptureConfiguration)initWithCoder:(id)a3
{
  id v4;
  GTCaptureConfiguration *v5;
  GTCaptureConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureConfiguration;
  v5 = -[GTCaptureConfiguration init](&v8, sel_init);
  if (v5)
  {
    v5->_enablePresentDownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enablePresentDownload"));
    v5->_enableLogErrors = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableLogErrors"));
    v5->_disableHashResources = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableHashResources"));
    v5->_waitEventTimeout = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("waitEventTimeout"));
    v5->_maxDownloadCommandBuffers = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("maxDownloadCommandBuffers"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 enablePresentDownload;
  id v5;

  enablePresentDownload = self->_enablePresentDownload;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", enablePresentDownload, CFSTR("enablePresentDownload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableLogErrors, CFSTR("enableLogErrors"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disableHashResources, CFSTR("disableHashResources"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_waitEventTimeout, CFSTR("waitEventTimeout"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_maxDownloadCommandBuffers, CFSTR("maxDownloadCommandBuffers"));

}

- (BOOL)enablePresentDownload
{
  return self->_enablePresentDownload;
}

- (void)setEnablePresentDownload:(BOOL)a3
{
  self->_enablePresentDownload = a3;
}

- (BOOL)enableLogErrors
{
  return self->_enableLogErrors;
}

- (void)setEnableLogErrors:(BOOL)a3
{
  self->_enableLogErrors = a3;
}

- (BOOL)disableHashResources
{
  return self->_disableHashResources;
}

- (void)setDisableHashResources:(BOOL)a3
{
  self->_disableHashResources = a3;
}

- (unsigned)waitEventTimeout
{
  return self->_waitEventTimeout;
}

- (void)setWaitEventTimeout:(unsigned int)a3
{
  self->_waitEventTimeout = a3;
}

- (unsigned)maxDownloadCommandBuffers
{
  return self->_maxDownloadCommandBuffers;
}

- (void)setMaxDownloadCommandBuffers:(unsigned int)a3
{
  self->_maxDownloadCommandBuffers = a3;
}

@end
