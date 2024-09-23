@implementation CBORData

- (int)fieldType
{
  return 2;
}

- (CBORData)initWith:(id)a3
{
  id v4;
  CBORData *v5;
  uint64_t v6;
  NSData *m_data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBORData;
  v5 = -[CBORData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithData:", v4);
    m_data = v5->m_data;
    v5->m_data = (NSData *)v6;

  }
  return v5;
}

- (void)write:(id)a3
{
  NSData *m_data;
  id v5;

  m_data = self->m_data;
  v5 = a3;
  -[CBORValue encodeStartItems:output:](self, "encodeStartItems:output:", -[NSData length](m_data, "length"), v5);
  objc_msgSend(v5, "appendBytes:length:", -[NSData bytes](self->m_data, "bytes"), -[NSData length](self->m_data, "length"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_data, 0);
}

@end
