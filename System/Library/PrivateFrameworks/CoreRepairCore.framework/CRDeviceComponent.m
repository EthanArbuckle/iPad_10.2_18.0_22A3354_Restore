@implementation CRDeviceComponent

- (CRDeviceComponent)initWithType:(int)a3 spc:(id)a4 name:(id)a5 secure:(BOOL)a6 fdrKeys:(id)a7
{
  id v13;
  NSString *v14;
  id v15;
  CRDeviceComponent *v16;
  CRDeviceComponent *v17;
  objc_super v19;

  v13 = a4;
  v14 = (NSString *)a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CRDeviceComponent;
  v16 = -[CRDeviceComponent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v16->_name = v14;
    objc_storeStrong((id *)&v16->_spc, a4);
    v17->_secure = a6;
    objc_storeStrong((id *)&v17->_fdrKeys, a7);
  }

  return v17;
}

- (CRDeviceComponent)initWithType:(int)a3 name:(id)a4 spc:(id)a5 fdrKeys:(id)a6
{
  return (CRDeviceComponent *)MEMORY[0x24BEDD108](self, sel_initWithType_spc_name_secure_fdrKeys_, *(_QWORD *)&a3, 0);
}

- (CRDeviceComponent)initWithType:(int)a3 name:(id)a4
{
  return (CRDeviceComponent *)MEMORY[0x24BEDD108](self, sel_initWithType_spc_name_secure_fdrKeys_, *(_QWORD *)&a3, 0);
}

- (NSString)spc
{
  return self->_spc;
}

- (void)setSpc:(id)a3
{
  objc_storeStrong((id *)&self->_spc, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)secure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (NSArray)fdrKeys
{
  return self->_fdrKeys;
}

- (void)setFdrKeys:(id)a3
{
  objc_storeStrong((id *)&self->_fdrKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fdrKeys, 0);
  objc_storeStrong((id *)&self->_spc, 0);
}

@end
