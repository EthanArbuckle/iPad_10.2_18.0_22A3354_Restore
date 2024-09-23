@implementation HAP2EncodedCharacteristicResponse

- (HAP2EncodedCharacteristicResponse)initWithCharacteristics:(id)a3
{
  id v5;
  HAP2EncodedCharacteristicResponse *v6;
  HAP2EncodedCharacteristicResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2EncodedCharacteristicResponse;
  v6 = -[HAP2EncodedCharacteristicResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_responses, a3);

  return v7;
}

- (BOOL)isEncrypted
{
  return 1;
}

- (NSArray)characteristics
{
  if (self)
    self = (HAP2EncodedCharacteristicResponse *)self->_responses;
  return (NSArray *)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
}

@end
