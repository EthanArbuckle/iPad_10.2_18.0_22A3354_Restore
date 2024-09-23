@implementation FIUIClientToken

- (FIUIClientToken)init
{
  void *v3;
  FIUIClientToken *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FIUIClientToken _initWithUUID:](self, "_initWithUUID:", v3);

  return v4;
}

- (id)_initWithUUID:(id)a3
{
  id v5;
  FIUIClientToken *v6;
  FIUIClientToken *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIClientToken;
  v6 = -[FIUIClientToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_UUID, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FIUIClientToken _initWithUUID:]([FIUIClientToken alloc], "_initWithUUID:", self->_UUID);
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSUUID isEqual:](self->_UUID, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
