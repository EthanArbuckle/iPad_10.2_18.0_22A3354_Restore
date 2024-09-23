@implementation FKContactTransactionInsight

- (FKContactTransactionInsight)initWithPeerPaymentCounterpartHandle:(id)a3
{
  id v4;
  FKContactTransactionInsight *v5;
  uint64_t v6;
  NSString *peerPaymentCounterpartHandle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKContactTransactionInsight;
  v5 = -[FKContactTransactionInsight init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    peerPaymentCounterpartHandle = v5->_peerPaymentCounterpartHandle;
    v5->_peerPaymentCounterpartHandle = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_peerPaymentCounterpartHandle, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_peerPaymentCounterpartHandle);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKContactTransactionInsight *v4;
  void **p_isa;
  char v6;

  v4 = (FKContactTransactionInsight *)a3;
  p_isa = (void **)&v4->super.isa;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = FKEqualObjects(self->_peerPaymentCounterpartHandle, p_isa[1]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)peerPaymentCounterpartHandle
{
  return self->_peerPaymentCounterpartHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentCounterpartHandle, 0);
}

@end
