@implementation MAAutoAssetProgress

- (MAAutoAssetProgress)init
{
  MAAutoAssetProgress *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MAAutoAssetProgress;
  result = -[MAAutoAssetProgress init](&v3, sel_init);
  if (result)
  {
    result->_isStalled = 0;
    result->_totalWrittenBytes = 0;
    result->_expectedTimeRemainingSecs = 0.0;
    result->_totalExpectedBytes = 0;
  }
  return result;
}

- (MAAutoAssetProgress)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetProgress *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MAAutoAssetProgress;
  v5 = -[MAAutoAssetProgress init](&v8, sel_init);
  if (v5)
  {
    v5->_totalExpectedBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalExpectedBytes"));
    v5->_totalWrittenBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalWrittenBytes"));
    v5->_isStalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStalled"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("expectedTimeRemainingSecs"));
    v5->_expectedTimeRemainingSecs = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes"), CFSTR("totalExpectedBytes"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes"), CFSTR("totalWrittenBytes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetProgress isStalled](self, "isStalled"), CFSTR("isStalled"));
  -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("expectedTimeRemainingSecs"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetProgress *v3;

  v3 = objc_alloc_init(MAAutoAssetProgress);
  -[MAAutoAssetProgress setTotalExpectedBytes:](v3, "setTotalExpectedBytes:", -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes"));
  -[MAAutoAssetProgress setTotalWrittenBytes:](v3, "setTotalWrittenBytes:", -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes"));
  -[MAAutoAssetProgress setIsStalled:](v3, "setIsStalled:", -[MAAutoAssetProgress isStalled](self, "isStalled"));
  -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  -[MAAutoAssetProgress setExpectedTimeRemainingSecs:](v3, "setExpectedTimeRemainingSecs:");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MAAutoAssetProgress *v4;
  MAAutoAssetProgress *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  double v11;
  double v12;
  double v13;

  v4 = (MAAutoAssetProgress *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MAAutoAssetProgress totalExpectedBytes](v5, "totalExpectedBytes");
      if (v6 == -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes")
        && (v7 = -[MAAutoAssetProgress totalWrittenBytes](v5, "totalWrittenBytes"),
            v7 == -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes"))
        && (v8 = -[MAAutoAssetProgress isStalled](v5, "isStalled"),
            v8 == -[MAAutoAssetProgress isStalled](self, "isStalled")))
      {
        -[MAAutoAssetProgress expectedTimeRemainingSecs](v5, "expectedTimeRemainingSecs");
        v12 = v11;
        -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
        v9 = v12 == v13;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)summary
{
  void *v3;
  int64_t v4;
  int64_t v5;
  const __CFString *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes");
  v5 = -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes");
  if (-[MAAutoAssetProgress isStalled](self, "isStalled"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("expectedBytes:%lld|writtenBytes:%lld|stalled:%@|timeRemainingSecs:%f"), v4, v5, v6, v7);
}

- (id)newSummaryDictionary
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MAAutoAssetProgress totalExpectedBytes](self, "totalExpectedBytes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("totalExpectedBytes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MAAutoAssetProgress totalWrittenBytes](self, "totalWrittenBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("totalWrittenBytes"));

  if (-[MAAutoAssetProgress isStalled](self, "isStalled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("isStalled"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[MAAutoAssetProgress expectedTimeRemainingSecs](self, "expectedTimeRemainingSecs");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("expectedTimeRemainingSecs"));

  return v3;
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
