@implementation MTLBinaryKey

- (MTLBinaryKey)initWithHash:(const void *)a3
{
  MTLBinaryKey *v4;
  MTLHashKey *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLBinaryKey;
  v4 = -[MTLBinaryKey init](&v7, sel_init);
  if (v4)
  {
    v5 = (MTLHashKey *)operator new();
    MTLHashKey::MTLHashKey(v5, (const MTLHashKey *)a3);
    v4->_id = v5;
  }
  return v4;
}

- (void)dealloc
{
  MTLHashKey *id;
  objc_super v4;

  id = (MTLHashKey *)self->_id;
  if (id)
  {
    MTLHashKey::~MTLHashKey(id);
    MEMORY[0x186DABFBC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLBinaryKey;
  -[MTLBinaryKey dealloc](&v4, sel_dealloc);
}

- (const)value
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)((char *)self->_id + 24);
}

- (unint64_t)hash
{
  return MTLHashKey::hash((MTLHashKey *)self->_id);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && -[MTLBinaryKey isEqualToKey:](self, "isEqualToKey:", a3);
}

- (BOOL)isEqualToKey:(id)a3
{
  return MTLHashKey::operator==((_QWORD *)self->_id, (_QWORD *)objc_msgSend(a3, "getFunctionId"));
}

- (const)getFunctionId
{
  return self->_id;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MTLBinaryKey initWithHash:]([MTLBinaryKey alloc], "initWithHash:", self->_id);
}

- (id)description
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLBinaryKey;
  v3 = -[MTLBinaryKey description](&v5, sel_description);
  return (id)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), MTLHashKey::description((MTLHashKey *)self->_id));
}

@end
