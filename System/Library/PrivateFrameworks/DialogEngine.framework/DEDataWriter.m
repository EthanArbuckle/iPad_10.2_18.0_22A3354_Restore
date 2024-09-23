@implementation DEDataWriter

- (DEDataWriter)init
{
  DEDataWriter *v2;
  uint64_t v3;
  NSMutableData *data;
  DEDataWriter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DEDataWriter;
  v2 = -[DEDataWriter init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)writeData:(id)a3
{
  -[NSMutableData appendData:](self->_data, "appendData:", a3);
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
