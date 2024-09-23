@implementation _HFItemUpdateRequestContext

- (HFUpdateLogger)logger
{
  return self->_logger;
}

- (NSDictionary)updateOptions
{
  if (self->_updateOptions)
    return self->_updateOptions;
  else
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (SEL)senderSelector
{
  return self->_senderSelector;
}

- (HFCharacteristicReadPolicy)readPolicy
{
  return self->_readPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readPolicy, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_updateOptions, 0);
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void)setSenderSelector:(SEL)a3
{
  self->_senderSelector = a3;
}

- (void)setReadPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_readPolicy, a3);
}

- (void)setUpdateOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSenderSelector:", -[_HFItemUpdateRequestContext senderSelector](self, "senderSelector"));
  -[_HFItemUpdateRequestContext updateOptions](self, "updateOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpdateOptions:", v5);

  -[_HFItemUpdateRequestContext logger](self, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLogger:", v6);

  -[_HFItemUpdateRequestContext readPolicy](self, "readPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReadPolicy:", v7);

  return v4;
}

@end
