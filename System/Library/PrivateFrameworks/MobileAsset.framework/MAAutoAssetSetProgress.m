@implementation MAAutoAssetSetProgress

- (MAAutoAssetSetProgress)init
{
  MAAutoAssetSetProgress *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MAAutoAssetSetProgress;
  result = -[MAAutoAssetSetProgress init](&v3, sel_init);
  if (result)
  {
    result->_isStalled = 0;
    *(_OWORD *)&result->_downloadedAssetCount = 0u;
    *(_OWORD *)&result->_totalExpectedBytes = 0u;
    result->_expectedTimeRemainingSecs = 0.0;
  }
  return result;
}

- (MAAutoAssetSetProgress)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetProgress *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MAAutoAssetSetProgress;
  v5 = -[MAAutoAssetSetProgress init](&v8, sel_init);
  if (v5)
  {
    v5->_downloadedAssetCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("downloadedAssetCount"));
    v5->_remainingAssetCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("remainingAssetCount"));
    v5->_totalExpectedBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalExpectedBytes"));
    v5->_totalWrittenBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalWrittenBytes"));
    v5->_isStalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStalled"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("expectedTimeRemainingSecs"));
    v5->_expectedTimeRemainingSecs = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount"), CFSTR("downloadedAssetCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"), CFSTR("remainingAssetCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"), CFSTR("totalExpectedBytes"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"), CFSTR("totalWrittenBytes"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MAAutoAssetSetProgress isStalled](self, "isStalled"), CFSTR("isStalled"));
  -[MAAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  *(float *)&v4 = v4;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("expectedTimeRemainingSecs"), v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetSetProgress *v3;

  v3 = objc_alloc_init(MAAutoAssetSetProgress);
  -[MAAutoAssetSetProgress setDownloadedAssetCount:](v3, "setDownloadedAssetCount:", -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount"));
  -[MAAutoAssetSetProgress setRemainingAssetCount:](v3, "setRemainingAssetCount:", -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"));
  -[MAAutoAssetSetProgress setTotalExpectedBytes:](v3, "setTotalExpectedBytes:", -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"));
  -[MAAutoAssetSetProgress setTotalWrittenBytes:](v3, "setTotalWrittenBytes:", -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"));
  -[MAAutoAssetSetProgress setIsStalled:](v3, "setIsStalled:", -[MAAutoAssetSetProgress isStalled](self, "isStalled"));
  -[MAAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  -[MAAutoAssetSetProgress setExpectedTimeRemainingSecs:](v3, "setExpectedTimeRemainingSecs:");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MAAutoAssetSetProgress *v4;
  MAAutoAssetSetProgress *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  BOOL v11;
  double v13;
  double v14;
  double v15;

  v4 = (MAAutoAssetSetProgress *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MAAutoAssetSetProgress downloadedAssetCount](v5, "downloadedAssetCount");
      if (v6 == -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount")
        && (v7 = -[MAAutoAssetSetProgress remainingAssetCount](v5, "remainingAssetCount"),
            v7 == -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount"))
        && (v8 = -[MAAutoAssetSetProgress totalExpectedBytes](v5, "totalExpectedBytes"),
            v8 == -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes"))
        && (v9 = -[MAAutoAssetSetProgress totalWrittenBytes](v5, "totalWrittenBytes"),
            v9 == -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes"))
        && (v10 = -[MAAutoAssetSetProgress isStalled](v5, "isStalled"),
            v10 == -[MAAutoAssetSetProgress isStalled](self, "isStalled")))
      {
        -[MAAutoAssetSetProgress expectedTimeRemainingSecs](v5, "expectedTimeRemainingSecs");
        v14 = v13;
        -[MAAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
        v11 = v14 == v15;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)summary
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MAAutoAssetSetProgress downloadedAssetCount](self, "downloadedAssetCount");
  v5 = -[MAAutoAssetSetProgress remainingAssetCount](self, "remainingAssetCount");
  v6 = -[MAAutoAssetSetProgress totalExpectedBytes](self, "totalExpectedBytes");
  v7 = -[MAAutoAssetSetProgress totalWrittenBytes](self, "totalWrittenBytes");
  if (-[MAAutoAssetSetProgress isStalled](self, "isStalled"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  -[MAAutoAssetSetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("downloadedCount:%lld|remainingAssetCount:%lld|expectedBytes:%lld|writtenBytes:%lld|stalled:%@|timeRemainingSecs:%f"), v4, v5, v6, v7, v8, v9);
}

- (int64_t)downloadedAssetCount
{
  return self->_downloadedAssetCount;
}

- (void)setDownloadedAssetCount:(int64_t)a3
{
  self->_downloadedAssetCount = a3;
}

- (int64_t)remainingAssetCount
{
  return self->_remainingAssetCount;
}

- (void)setRemainingAssetCount:(int64_t)a3
{
  self->_remainingAssetCount = a3;
}

- (int64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void)setTotalExpectedBytes:(int64_t)a3
{
  self->_totalExpectedBytes = a3;
}

- (int64_t)totalWrittenBytes
{
  return self->_totalWrittenBytes;
}

- (void)setTotalWrittenBytes:(int64_t)a3
{
  self->_totalWrittenBytes = a3;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (double)expectedTimeRemainingSecs
{
  return self->_expectedTimeRemainingSecs;
}

- (void)setExpectedTimeRemainingSecs:(double)a3
{
  self->_expectedTimeRemainingSecs = a3;
}

@end
