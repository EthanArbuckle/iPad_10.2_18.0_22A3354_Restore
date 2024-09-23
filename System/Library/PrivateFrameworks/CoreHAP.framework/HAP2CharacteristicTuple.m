@implementation HAP2CharacteristicTuple

- (HAP2CharacteristicTuple)initWithAccessory:(id)a3
{
  id v5;
  HAP2CharacteristicTuple *v6;
  HAP2CharacteristicTuple *v7;
  uint64_t v8;
  NSMutableArray *values;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HAP2CharacteristicTuple;
  v6 = -[HAP2CharacteristicTuple init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    values = v7->_values;
    v7->_values = (NSMutableArray *)v8;

  }
  return v7;
}

- (HAP2Accessory)accessory
{
  return self->_accessory;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
