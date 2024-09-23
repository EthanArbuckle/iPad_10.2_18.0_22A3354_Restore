@implementation AXAuditObjectTransportInfo

- (AXAuditObjectTransportInfo)initWithTransportKey:(id)a3
{
  id v5;
  AXAuditObjectTransportInfo *v6;
  AXAuditObjectTransportInfo *v7;

  v5 = a3;
  v6 = -[AXAuditObjectTransportInfo init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transportKey, a3);

  return v7;
}

- (NSString)transportKey
{
  return self->_transportKey;
}

- (void)setTransportKey:(id)a3
{
  objc_storeStrong((id *)&self->_transportKey, a3);
}

- (id)canEncodeObjectBlock
{
  return self->_canEncodeObjectBlock;
}

- (void)setCanEncodeObjectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)createTransportObjectBlock
{
  return self->_createTransportObjectBlock;
}

- (void)setCreateTransportObjectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)createLocalObjectBlock
{
  return self->_createLocalObjectBlock;
}

- (void)setCreateLocalObjectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)requiresRawTransportDictionary
{
  return self->_requiresRawTransportDictionary;
}

- (void)setRequiresRawTransportDictionary:(BOOL)a3
{
  self->_requiresRawTransportDictionary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createLocalObjectBlock, 0);
  objc_storeStrong(&self->_createTransportObjectBlock, 0);
  objc_storeStrong(&self->_canEncodeObjectBlock, 0);
  objc_storeStrong((id *)&self->_transportKey, 0);
}

@end
