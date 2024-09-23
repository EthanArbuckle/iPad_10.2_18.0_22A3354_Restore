@implementation NMSPodcastSizeInfo

- (NMSPodcastSizeInfo)init
{
  NMSPodcastSizeInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NMSPodcastSizeInfo;
  result = -[NMSPodcastSizeInfo init](&v3, sel_init);
  if (result)
  {
    result->_totalSize = 0;
    result->_totalDuration = 0.0;
    result->_count = 0;
  }
  return result;
}

- (double)sizeDurationRatio
{
  double totalDuration;
  double result;
  unint64_t totalSize;

  totalDuration = self->_totalDuration;
  result = 16000.0;
  if (fabs(totalDuration) >= 2.22044605e-16)
  {
    totalSize = self->_totalSize;
    if (totalSize)
      return (double)totalSize / totalDuration;
  }
  return result;
}

- (unint64_t)averageSize
{
  unint64_t count;
  unint64_t result;

  count = self->_count;
  result = self->_totalSize;
  if (count)
    result /= count;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NMSPodcastSizeInfo *v4;
  NMSPodcastSizeInfo *v5;
  NMSPodcastSizeInfo *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  BOOL v12;

  v4 = (NMSPodcastSizeInfo *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[NMSPodcastSizeInfo totalSize](self, "totalSize");
    if (v7 == -[NMSPodcastSizeInfo totalSize](v6, "totalSize")
      && (-[NMSPodcastSizeInfo totalDuration](self, "totalDuration"),
          v9 = v8,
          -[NMSPodcastSizeInfo totalDuration](v6, "totalDuration"),
          vabdd_f64(v9, v10) < 2.22044605e-16))
    {
      v11 = -[NMSPodcastSizeInfo count](self, "count");
      v12 = v11 == -[NMSPodcastSizeInfo count](v6, "count");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p totalSize:%llu totalDuration:%f count:%llu>"), v5, self, self->_totalSize, *(_QWORD *)&self->_totalDuration, self->_count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NMSPodcastSizeInfo)initWithCoder:(id)a3
{
  id v4;
  NMSPodcastSizeInfo *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSPodcastSizeInfo;
  v5 = -[NMSPodcastSizeInfo init](&v11, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_totalSize);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalSize = objc_msgSend(v4, "decodeInt64ForKey:", v6);

    NSStringFromSelector(sel_totalDuration);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v7);
    v5->_totalDuration = v8;

    NSStringFromSelector(sel_count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_count = objc_msgSend(v4, "decodeInt64ForKey:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t totalSize;
  id v5;
  void *v6;
  double totalDuration;
  void *v8;
  unint64_t count;
  id v10;

  totalSize = self->_totalSize;
  v5 = a3;
  NSStringFromSelector(sel_totalSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt64:forKey:", totalSize, v6);

  totalDuration = self->_totalDuration;
  NSStringFromSelector(sel_totalDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeDouble:forKey:", v8, totalDuration);

  count = self->_count;
  NSStringFromSelector(sel_count);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt64:forKey:", count, v10);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(double)a3
{
  self->_totalDuration = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end
