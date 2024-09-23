@implementation _NUHistogramRenderResult

- (_NUHistogramRenderResult)initWithHistogram:(id)a3
{
  NUImageHistogram *v4;
  _NUHistogramRenderResult *v5;
  NUImageHistogram *histogram;
  objc_super v8;

  v4 = (NUImageHistogram *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_NUHistogramRenderResult;
  v5 = -[_NUHistogramRenderResult init](&v8, sel_init);
  histogram = v5->_histogram;
  v5->_histogram = v4;

  return v5;
}

- (NUImageHistogram)histogram
{
  return (NUImageHistogram *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogram, 0);
}

@end
