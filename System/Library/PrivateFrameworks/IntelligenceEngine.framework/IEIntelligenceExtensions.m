@implementation IEIntelligenceExtensions

- (IEDirectInvocationBuilderHandler)directInvocationBuilder
{
  return self->_directInvocationBuilder;
}

- (void)setDirectInvocationBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_directInvocationBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directInvocationBuilder, 0);
}

@end
