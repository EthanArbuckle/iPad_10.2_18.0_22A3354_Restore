@implementation BMComputeTombstonePropagator

- (BMComputeTombstonePropagator)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  BMComputeTombstonePropagator *v8;
  BMComputeTombstonePropagator *v9;
  objc_super v11;

  v6 = a3;
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR(":tombstones")) & 1) == 0)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(":tombstones"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  v11.receiver = self;
  v11.super_class = (Class)BMComputeTombstonePropagator;
  v8 = -[BMComputeTombstonePropagator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_streamIdentifier, v6);
    v9->_domain = a4;
  }

  return v9;
}

- (id)computeSource
{
  BMComputeSourceClient *computeSource;
  BMComputeSourceClient *v4;
  BMComputeSourceClient *v5;
  BMComputeSourceClient *v6;

  computeSource = self->_computeSource;
  if (!computeSource)
  {
    v4 = [BMComputeSourceClient alloc];
    v5 = -[BMComputeSourceClient initWithStreamIdentifier:domain:useCase:](v4, "initWithStreamIdentifier:domain:useCase:", self->_streamIdentifier, self->_domain, *MEMORY[0x1E0D01CA8]);
    v6 = self->_computeSource;
    self->_computeSource = v5;

    computeSource = self->_computeSource;
  }
  return computeSource;
}

- (void)didWriteTombstone:(id)a3 timestamp:(double)a4 account:(id)a5 remoteName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[BMComputeTombstonePropagator computeSource](self, "computeSource");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:account:remoteName:timestamp:signpostID:sendFullEvent:", v12, v11, v10, 0, 0, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
  objc_storeStrong((id *)&self->_computeSource, 0);
}

@end
