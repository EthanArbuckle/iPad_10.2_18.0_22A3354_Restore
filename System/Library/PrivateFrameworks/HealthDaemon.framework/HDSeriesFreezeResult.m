@implementation HDSeriesFreezeResult

- (HDSeriesFreezeResult)initWithStatus:(int64_t)a3 frozenIdentifier:(id)a4
{
  id v6;
  HDSeriesFreezeResult *v7;
  HDSeriesFreezeResult *v8;
  uint64_t v9;
  NSUUID *frozenIdentifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSeriesFreezeResult;
  v7 = -[HDSeriesFreezeResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_status = a3;
    v9 = objc_msgSend(v6, "copy");
    frozenIdentifier = v8->_frozenIdentifier;
    v8->_frozenIdentifier = (NSUUID *)v9;

  }
  return v8;
}

- (int64_t)status
{
  return self->_status;
}

- (NSUUID)frozenIdentifier
{
  return self->_frozenIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenIdentifier, 0);
}

@end
