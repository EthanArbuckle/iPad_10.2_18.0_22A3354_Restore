@implementation QLAnimatedImage

- (void)dealloc
{
  objc_super v3;

  free(self->_durations);
  v3.receiver = self;
  v3.super_class = (Class)QLAnimatedImage;
  -[QLAnimatedImage dealloc](&v3, sel_dealloc);
}

- (QLAnimatedImage)initWithImageSource:(CGImageSource *)a3
{
  QLAnimatedImage *v4;
  QLImageData *v5;
  QLImageData *imageData;
  uint64_t v7;
  UIImage *lastImage;
  QLAnimatedImage *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QLAnimatedImage;
  v4 = -[QLAnimatedImage init](&v11, sel_init);
  if (v4)
  {
    v5 = -[QLImageData initWithImageSource:]([QLImageData alloc], "initWithImageSource:", a3);
    imageData = v4->_imageData;
    v4->_imageData = v5;

    v4->_lastImageIndex = 0;
    -[QLImageData imageAtIndex:](v4->_imageData, "imageAtIndex:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    lastImage = v4->_lastImage;
    v4->_lastImage = (UIImage *)v7;

    -[QLAnimatedImage generateDurations](v4, "generateDurations");
    v9 = v4;
  }

  return v4;
}

- (void)generateDurations
{
  unint64_t v3;
  QLFrameDurationInformation *durations;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  float v8;
  double var1;
  unint64_t durationsCount;
  uint64_t v11;
  double v12;
  id v13;

  if (!self->_durations)
  {
    -[QLImageData durations](self->_imageData, "durations");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v13, "count");
    self->_durationsCount = v3;
    if (v3)
    {
      durations = (QLFrameDurationInformation *)malloc_type_malloc(16 * v3, 0x1000040451B5BE8uLL);
      self->_durations = durations;
      if (self->_durationsCount)
      {
        v5 = 0;
        v6 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "floatValue");
          self->_durations[v5].var0 = v8;

          durations = self->_durations;
          if (v6)
            var1 = durations[(v6 - 1)].var1;
          else
            var1 = 0.0;
          durations[v5].var1 = var1 + durations[v5].var0;
          ++v6;
          durationsCount = self->_durationsCount;
          ++v5;
        }
        while (durationsCount > v6);
        v11 = durationsCount - 1;
      }
      else
      {
        v11 = -1;
      }
      v12 = durations[v11].var1;
    }
    else
    {
      v12 = 0.0;
    }
    self->_duration = v12;

  }
}

- (unint64_t)frameCount
{
  return self->_durationsCount;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)indexForTime:(double)a3
{
  unint64_t durationsCount;
  int64_t result;
  double *i;

  durationsCount = self->_durationsCount;
  if (!durationsCount)
    return durationsCount - 1;
  result = 0;
  for (i = &self->_durations->var1; *i <= a3; i += 2)
  {
    if (durationsCount == ++result)
      return durationsCount - 1;
  }
  return result;
}

- (BOOL)time:(double)a3 belongsToIndex:(unint64_t)a4
{
  QLFrameDurationInformation *durations;
  double var1;
  BOOL result;

  result = self->_durationsCount > a4
        && (durations = self->_durations, var1 = durations[a4].var1, var1 > a3)
        && var1 - durations[a4].var0 < a3;
  return result;
}

- (id)frameAtTime:(double)a3
{
  id *p_lastImage;
  unint64_t lastImageIndex;
  unint64_t v7;
  uint64_t v8;
  UIImage *lastImage;

  if (-[QLAnimatedImage time:belongsToIndex:](self, "time:belongsToIndex:", self->_lastImageIndex))
  {
    p_lastImage = (id *)&self->_lastImage;
  }
  else
  {
    lastImageIndex = self->_lastImageIndex;
    if (lastImageIndex < self->_durationsCount - 1
      && -[QLAnimatedImage time:belongsToIndex:](self, "time:belongsToIndex:", lastImageIndex + 1, a3))
    {
      v7 = self->_lastImageIndex + 1;
    }
    else
    {
      v7 = -[QLAnimatedImage indexForTime:](self, "indexForTime:", a3);
    }
    self->_lastImageIndex = v7;
    -[QLImageData imageAtIndex:](self->_imageData, "imageAtIndex:");
    v8 = objc_claimAutoreleasedReturnValue();
    lastImage = self->_lastImage;
    p_lastImage = (id *)&self->_lastImage;
    *p_lastImage = (id)v8;

  }
  return *p_lastImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastImage, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
