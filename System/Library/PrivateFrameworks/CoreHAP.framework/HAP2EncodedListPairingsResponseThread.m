@implementation HAP2EncodedListPairingsResponseThread

- (HAP2EncodedListPairingsResponseThread)initWithBTLEResponse:(id)a3 pairings:(id)a4
{
  id v7;
  HAP2EncodedListPairingsResponseThread *v8;
  HAP2EncodedListPairingsResponseThread *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2EncodedListPairingsResponseThread;
  v8 = -[HAP2EncodedResponseThread initWithBTLEResponse:](&v11, sel_initWithBTLEResponse_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_pairings, a4);

  return v9;
}

- (NSArray)pairings
{
  return self->_pairings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairings, 0);
}

@end
