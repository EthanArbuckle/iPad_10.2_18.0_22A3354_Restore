@implementation ETDataSourceWithExtractor

- (ETDataSourceWithExtractor)initWithDataSource:(id)a3 extractor:(id)a4
{
  id v7;
  id v8;
  ETDataSourceWithExtractor *v9;
  ETDataSourceWithExtractor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ETDataSourceWithExtractor;
  v9 = -[ETDataSourceWithExtractor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (id)dataPointAtIndex:(int)a3
{
  void *v4;

  -[ETDataSource dataPointAtIndex:](self->_source, "dataPointAtIndex:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETImageDescriptorExtractor extractForDataPoint:](self->_extractor, "extractForDataPoint:", v4);
  return v4;
}

- (int)numberOfDataPoints
{
  return -[ETDataSource numberOfDataPoints](self->_source, "numberOfDataPoints");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
