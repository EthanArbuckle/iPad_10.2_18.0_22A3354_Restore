@implementation DEDataReader

- (DEDataReader)initWithData:(id)a3
{
  id v5;
  DEDataReader *v6;
  DEDataReader *v7;
  DEDataReader *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DEDataReader;
  v6 = -[DEDataReader init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_dataOffset = 0;
    v8 = v7;
  }

  return v7;
}

- (DEDataReader)init
{
  return -[DEDataReader initWithData:](self, "initWithData:", 0);
}

- (id)readDataOfLength:(unint64_t)a3
{
  void *v4;

  +[DEIO readDataOfLength:offset:from:](DEIO, "readDataOfLength:offset:from:", a3, self->_dataOffset, self->_data);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_dataOffset += objc_msgSend(v4, "length");
  return v4;
}

- (id)readData
{
  NSData *data;
  NSData **p_data;
  NSData *v5;

  p_data = &self->_data;
  data = self->_data;
  if (p_data[1])
  {
    -[DEDataReader readDataOfLength:](self, "readDataOfLength:", -[NSData length](data, "length") - self->_dataOffset);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = data;
  }
  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unint64_t)dataOffset
{
  return self->_dataOffset;
}

- (void)setDataOffset:(unint64_t)a3
{
  self->_dataOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
