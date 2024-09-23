@implementation MFZeroCopyDataConsumer

- (MFZeroCopyDataConsumer)init
{
  MFZeroCopyDataConsumer *v2;
  uint64_t v3;
  MFDataHolder *dataHolder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFZeroCopyDataConsumer;
  v2 = -[MFZeroCopyDataConsumer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dataHolder = v2->_dataHolder;
    v2->_dataHolder = (MFDataHolder *)v3;

  }
  return v2;
}

- (id)data
{
  return -[MFDataHolder data](self->_dataHolder, "data");
}

- (int64_t)appendData:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (self->_done)
  {
    v5 = -1;
  }
  else
  {
    -[MFDataHolder addData:](self->_dataHolder, "addData:", v4);
    v5 = objc_msgSend(v4, "length");
  }

  return v5;
}

- (void)done
{
  self->_done = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataHolder, 0);
}

@end
