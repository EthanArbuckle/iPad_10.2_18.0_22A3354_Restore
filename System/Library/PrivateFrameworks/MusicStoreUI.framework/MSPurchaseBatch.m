@implementation MSPurchaseBatch

- (id)copyContinuationsForPurchases:(id)a3
{
  uint64_t v5;
  MSTonePurchaseContinuation *v6;
  void *v7;

  if (objc_msgSend(a3, "count") != 1)
    return 0;
  v5 = objc_msgSend(a3, "objectAtIndex:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = -[MSTonePurchaseContinuation initWithPurchase:]([MSTonePurchaseContinuation alloc], "initWithPurchase:", v5);
  -[SUPurchaseContinuation setPurchaseManager:](v6, "setPurchaseManager:", -[SUPurchaseBatch purchaseManager](self, "purchaseManager"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v6, 0);

  return v7;
}

@end
