@implementation ACCOOBBTPairingAccessory

- (ACCOOBBTPairingAccessory)initWithAccessoryUID:(id)a3
{
  id v5;
  ACCOOBBTPairingAccessory *v6;
  ACCOOBBTPairingAccessory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCOOBBTPairingAccessory;
  v6 = -[ACCOOBBTPairingAccessory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessoryUID, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCOOBBTPairingAccessory>[%@]"), self->_accessoryUID);
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end
