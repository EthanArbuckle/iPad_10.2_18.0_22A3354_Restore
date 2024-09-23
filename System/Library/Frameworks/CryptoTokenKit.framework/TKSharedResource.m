@implementation TKSharedResource

- (TKSharedResource)initWithSlot:(id)a3
{
  id v5;
  TKSharedResource *v6;
  TKSharedResource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSharedResource;
  v6 = -[TKSharedResource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_slot, a3);

  return v7;
}

- (id)object
{
  return -[TKSharedResourceSlot object](self->_slot, "object");
}

- (void)dealloc
{
  objc_super v3;

  -[TKSharedResourceSlot releaseResourceImmediatelly:](self->_slot, "releaseResourceImmediatelly:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TKSharedResource;
  -[TKSharedResource dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  TKSharedResourceSlot *slot;

  -[TKSharedResourceSlot releaseResourceImmediatelly:](self->_slot, "releaseResourceImmediatelly:", 1);
  slot = self->_slot;
  self->_slot = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slot, 0);
}

@end
