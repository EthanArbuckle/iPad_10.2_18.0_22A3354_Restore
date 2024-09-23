@implementation GTCaptureProgressStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureProgressStatistics)initWithCoder:(id)a3
{
  id v4;
  GTCaptureProgressStatistics *v5;
  GTCaptureProgressStatistics *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureProgressStatistics;
  v5 = -[GTCaptureProgressStatistics init](&v8, sel_init);
  if (v5)
  {
    v5->_frameCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("frameCount"));
    v5->_frameOther = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("frameOther"));
    v5->_commitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("commitCount"));
    v5->_commitOther = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("commitOther"));
    v5->_resourceCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("resourceCount"));
    v5->_resourceDownloaded = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("resourceDownloaded"));
    v5->_GPUDataSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("GPUDataSize"));
    v5->_GPUDataDownloaded = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("GPUDataDownloaded"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t frameCount;
  id v5;

  frameCount = self->_frameCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", frameCount, CFSTR("frameCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_frameOther, CFSTR("frameOther"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_commitCount, CFSTR("commitCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_commitOther, CFSTR("commitOther"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_resourceCount, CFSTR("resourceCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_resourceDownloaded, CFSTR("resourceDownloaded"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_GPUDataSize, CFSTR("GPUDataSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_GPUDataDownloaded, CFSTR("GPUDataDownloaded"));

}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(unint64_t)a3
{
  self->_frameCount = a3;
}

- (unint64_t)frameOther
{
  return self->_frameOther;
}

- (void)setFrameOther:(unint64_t)a3
{
  self->_frameOther = a3;
}

- (unint64_t)commitCount
{
  return self->_commitCount;
}

- (void)setCommitCount:(unint64_t)a3
{
  self->_commitCount = a3;
}

- (unint64_t)commitOther
{
  return self->_commitOther;
}

- (void)setCommitOther:(unint64_t)a3
{
  self->_commitOther = a3;
}

- (unint64_t)resourceCount
{
  return self->_resourceCount;
}

- (void)setResourceCount:(unint64_t)a3
{
  self->_resourceCount = a3;
}

- (unint64_t)resourceDownloaded
{
  return self->_resourceDownloaded;
}

- (void)setResourceDownloaded:(unint64_t)a3
{
  self->_resourceDownloaded = a3;
}

- (unint64_t)GPUDataSize
{
  return self->_GPUDataSize;
}

- (void)setGPUDataSize:(unint64_t)a3
{
  self->_GPUDataSize = a3;
}

- (unint64_t)GPUDataDownloaded
{
  return self->_GPUDataDownloaded;
}

- (void)setGPUDataDownloaded:(unint64_t)a3
{
  self->_GPUDataDownloaded = a3;
}

@end
