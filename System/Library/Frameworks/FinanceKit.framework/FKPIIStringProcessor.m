@implementation FKPIIStringProcessor

- (FKPIIStringProcessor)init
{
  FKPIIStringProcessor *v2;
  uint64_t v3;
  _TtC10FinanceKit25PIIStringProcessorWrapper *wrappedProcessor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKPIIStringProcessor;
  v2 = -[FKPIIStringProcessor init](&v6, sel_init);
  if (v2)
  {
    +[PIIStringProcessorWrapper makeProcessor](_TtC10FinanceKit25PIIStringProcessorWrapper, "makeProcessor");
    v3 = objc_claimAutoreleasedReturnValue();
    wrappedProcessor = v2->_wrappedProcessor;
    v2->_wrappedProcessor = (_TtC10FinanceKit25PIIStringProcessorWrapper *)v3;

  }
  return v2;
}

- (id)redactFromString:(id)a3
{
  return -[PIIStringProcessorWrapper redactFromString:](self->_wrappedProcessor, "redactFromString:", a3);
}

- (id)redactFromString:(id)a3 forCountryCodes:(id)a4
{
  return -[PIIStringProcessorWrapper redactFromString:forCountryCodes:](self->_wrappedProcessor, "redactFromString:forCountryCodes:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedProcessor, 0);
}

@end
