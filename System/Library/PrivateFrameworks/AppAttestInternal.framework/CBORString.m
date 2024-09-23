@implementation CBORString

- (int)fieldType
{
  return 3;
}

- (CBORString)initWith:(id)a3
{
  id v4;
  CBORString *v5;
  uint64_t v6;
  NSString *m_data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBORString;
  v5 = -[CBORString init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v4);
    m_data = v5->m_data;
    v5->m_data = (NSString *)v6;

  }
  return v5;
}

- (void)write:(id)a3
{
  NSString *m_data;
  id v5;
  id v6;

  m_data = self->m_data;
  v5 = a3;
  -[CBORValue encodeStartItems:output:](self, "encodeStartItems:output:", -[NSString length](m_data, "length"), v5);
  -[NSString dataUsingEncoding:](self->m_data, "dataUsingEncoding:", 4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "appendBytes:length:", objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

}

- (int64_t)compare:(id)a3
{
  id *v4;
  NSUInteger v5;
  unint64_t v6;
  NSComparisonResult v7;

  v4 = (id *)a3;
  v5 = -[NSString length](self->m_data, "length");
  v6 = objc_msgSend(v4[1], "length");
  if (v5 >= v6)
  {
    if (v5 > v6)
      v7 = NSOrderedDescending;
    else
      v7 = -[NSString compare:](self->m_data, "compare:", v4[1]);
  }
  else
  {
    v7 = NSOrderedAscending;
  }

  return v7;
}

- (id)getLabel
{
  return self->m_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_data, 0);
}

@end
