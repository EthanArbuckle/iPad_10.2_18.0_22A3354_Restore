@implementation HMIDataReader

- (HMIDataReader)initWithData:(id)a3
{
  id v5;
  HMIDataReader *v6;
  HMIDataReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIDataReader;
  v6 = -[HMIDataReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_position = 0;
  }

  return v7;
}

- (unint64_t)position
{
  return self->_position;
}

- (unint64_t)length
{
  return -[NSData length](self->_data, "length");
}

- (unsigned)readUInt32
{
  char *v3;
  unint64_t position;

  v3 = -[NSData bytes](self->_data, "bytes");
  position = self->_position;
  self->_position = position + 4;
  return bswap32(*(_DWORD *)&v3[position]);
}

- (unint64_t)readUInt64
{
  char *v3;
  unint64_t position;

  v3 = -[NSData bytes](self->_data, "bytes");
  position = self->_position;
  self->_position = position + 8;
  return bswap64(*(_QWORD *)&v3[position]);
}

- (void)seek:(unint64_t)a3
{
  self->_position = a3;
}

- (id)readData:(unint64_t)a3
{
  id result;

  result = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", self->_position, a3);
  self->_position += a3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
