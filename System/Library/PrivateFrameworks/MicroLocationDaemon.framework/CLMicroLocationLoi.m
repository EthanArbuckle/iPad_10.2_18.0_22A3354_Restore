@implementation CLMicroLocationLoi

- (CLMicroLocationLoi)initWithIdentifier:(id)a3 andType:(int64_t)a4
{
  id v6;
  CLMicroLocationLoi *v7;
  uint64_t v8;
  NSUUID *loiIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLMicroLocationLoi;
  v7 = -[CLMicroLocationLoi init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    loiIdentifier = v7->_loiIdentifier;
    v7->_loiIdentifier = (NSUUID *)v8;

    v7->_type = a4;
  }

  return v7;
}

- (NSUUID)loiIdentifier
{
  return self->_loiIdentifier;
}

- (void)setLoiIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_loiIdentifier, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiIdentifier, 0);
}

@end
