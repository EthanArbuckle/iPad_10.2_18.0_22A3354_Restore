@implementation AXMAudioDataSource

- (AXMAudioDataSource)init
{
  return -[AXMAudioDataSource initWithName:sampleRate:circular:](self, "initWithName:sampleRate:circular:", 0, 1, 44100.0);
}

- (AXMAudioDataSource)initWithName:(id)a3 sampleRate:(double)a4 circular:(BOOL)a5
{
  id v8;
  AXMAudioDataSource *v9;
  uint64_t v10;
  NSString *name;
  _QWORD *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMAudioDataSource;
  v9 = -[AXMAudioDataSource init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v9->_sampleRate = a4;
    v12 = (_QWORD *)operator new();
    *v12 = 0;
    v12[1] = 0;
    v12[2] = 0;
    v9->_sampleBuffer = v12;
    v9->_circular = a5;
    v9->_level = 1.0;
  }

  return v9;
}

- (void)dealloc
{
  void **sampleBuffer;
  void *v4;
  objc_super v5;

  sampleBuffer = (void **)self->_sampleBuffer;
  if (sampleBuffer)
  {
    v4 = *sampleBuffer;
    if (*sampleBuffer)
    {
      sampleBuffer[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1B5E1250C](sampleBuffer, 0x10C402FEFCB83);
  }
  v5.receiver = self;
  v5.super_class = (Class)AXMAudioDataSource;
  -[AXMAudioDataSource dealloc](&v5, sel_dealloc);
}

- (void)setCurrentSampleIndex:(unint64_t)a3
{
  unint64_t currentSampleIndex;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (!-[AXMAudioDataSource isCircular](self, "isCircular"))
    goto LABEL_10;
  currentSampleIndex = self->_currentSampleIndex;
  if (currentSampleIndex <= a3)
  {
    if (currentSampleIndex >= a3)
      goto LABEL_10;
    v8 = (void *)(*(_QWORD *)-[AXMAudioDataSource sampleBuffer](self, "sampleBuffer") + 4 * self->_currentSampleIndex);
    v9 = *(_QWORD *)-[AXMAudioDataSource sampleBuffer](self, "sampleBuffer") + 4 * a3 - (_QWORD)v8;
    if (v9 < 1)
      goto LABEL_10;
LABEL_9:
    bzero(v8, 4 * (((unint64_t)v9 >> 2) - ((unint64_t)v9 > 3)) + 4);
    goto LABEL_10;
  }
  v6 = (void *)(*(_QWORD *)-[AXMAudioDataSource sampleBuffer](self, "sampleBuffer") + 4 * self->_currentSampleIndex);
  v7 = *(_QWORD *)(-[AXMAudioDataSource sampleBuffer](self, "sampleBuffer") + 8) - (_QWORD)v6;
  if (v7 >= 1)
    bzero(v6, 4 * (((unint64_t)v7 >> 2) - ((unint64_t)v7 > 3)) + 4);
  v8 = *(void **)-[AXMAudioDataSource sampleBuffer](self, "sampleBuffer");
  v9 = *(_QWORD *)-[AXMAudioDataSource sampleBuffer](self, "sampleBuffer") + 4 * a3 - (_QWORD)v8;
  if (v9 > 0)
    goto LABEL_9;
LABEL_10:
  self->_currentSampleIndex = a3;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
  *((_QWORD *)self->_sampleBuffer + 1) = *(_QWORD *)self->_sampleBuffer;
  std::vector<int>::resize((std::vector<int> *)self->_sampleBuffer, a3);
}

- (void)setLevel:(double)a3
{
  self->_level = fmax(fmin(a3, 1.0), 0.0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMAudioDataSource name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name=%@ circular=%d currentSample=%lu length=%lu>"), v4, self, v5, -[AXMAudioDataSource isCircular](self, "isCircular"), -[AXMAudioDataSource currentSampleIndex](self, "currentSampleIndex"), -[AXMAudioDataSource length](self, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)normalizeAudio
{
  _QWORD *v3;
  unint64_t v4;
  int v5;
  double v6;
  unint64_t v7;
  double v8;

  v3 = -[AXMAudioDataSource sampleBuffer](self, "sampleBuffer");
  if (-[AXMAudioDataSource length](self, "length"))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      if (*(_DWORD *)(*v3 + 4 * v4) > v5)
        v5 = *(_DWORD *)(*v3 + 4 * v4);
      ++v4;
    }
    while (v4 < -[AXMAudioDataSource length](self, "length"));
    v6 = (double)v5;
  }
  else
  {
    v6 = 0.0;
  }
  if (-[AXMAudioDataSource length](self, "length"))
  {
    v7 = 0;
    v8 = v6 / 32500.0;
    do
    {
      *(_DWORD *)(*v3 + 4 * v7) = (int)((double)*(int *)(*v3 + 4 * v7) / v8);
      ++v7;
    }
    while (v7 < -[AXMAudioDataSource length](self, "length"));
  }
}

- (void)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)currentSampleIndex
{
  return self->_currentSampleIndex;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
}

- (double)level
{
  return self->_level;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
