@implementation WFConcreteStatisticsSampleProvider

- (WFConcreteStatisticsSampleProvider)initWithSampleProvider:(id)a3
{
  -[WFConcreteStatisticsSampleProvider setSampleProvider:](self, "setSampleProvider:", a3);
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[WFConcreteStatisticsSampleProvider sampleProvider](self, "sampleProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "methodSignatureForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFConcreteStatisticsSampleProvider sampleProvider](self, "sampleProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invokeWithTarget:", v5);

}

- (WFStatisticsSampleProvider)sampleProvider
{
  return self->_sampleProvider;
}

- (void)setSampleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sampleProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleProvider, 0);
}

@end
