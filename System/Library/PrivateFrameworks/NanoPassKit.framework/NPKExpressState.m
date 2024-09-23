@implementation NPKExpressState

- (NPKExpressState)initWithNFCState:(unint64_t)a3 uwbState:(unint64_t)a4
{
  NPKExpressState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPKExpressState;
  result = -[NPKExpressState init](&v7, sel_init);
  if (result)
  {
    result->_nfcExpressState = a3;
    result->_uwbExpressState = a4;
  }
  return result;
}

- (NPKExpressState)initWithExpressPassConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v4 = a3;
  if (objc_msgSend(v4, "isNFCExpressEnabled"))
    v5 = 0;
  else
    v5 = 2;
  v6 = objc_msgSend(v4, "isUWBExpressEnabled");

  if (v6)
    v7 = 0;
  else
    v7 = 2;
  return -[NPKExpressState initWithNFCState:uwbState:](self, "initWithNFCState:uwbState:", v5, v7);
}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("( "));
  v4 = -[NPKExpressState nfcExpressState](self, "nfcExpressState");
  if (v4 <= 2)
    objc_msgSend(v3, "appendString:", off_24CFEB7D0[v4]);
  objc_msgSend(v3, "appendString:", CFSTR(" : "));
  v5 = -[NPKExpressState uwbExpressState](self, "uwbExpressState");
  if (v5 <= 2)
    objc_msgSend(v3, "appendString:", off_24CFEB7E8[v5]);
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

- (unint64_t)switchStateForMode:(unint64_t)a3
{
  unint64_t result;

  if (a3 == 1)
    result = -[NPKExpressState nfcExpressState](self, "nfcExpressState");
  else
    result = -[NPKExpressState uwbExpressState](self, "uwbExpressState");
  if (result != 2)
    return result != 1;
  return result;
}

- (unint64_t)nfcExpressState
{
  return self->_nfcExpressState;
}

- (unint64_t)uwbExpressState
{
  return self->_uwbExpressState;
}

@end
