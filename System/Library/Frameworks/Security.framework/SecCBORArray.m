@implementation SecCBORArray

- (int)fieldType
{
  return 4;
}

- (SecCBORArray)init
{
  SecCBORArray *v2;
  NSMutableArray *v3;
  NSMutableArray *m_data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SecCBORArray;
  v2 = -[SecCBORArray init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    m_data = v2->m_data;
    v2->m_data = v3;

  }
  return v2;
}

- (SecCBORArray)initWith:(id)a3
{
  id v4;
  SecCBORArray *v5;
  uint64_t v6;
  NSMutableArray *m_data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecCBORArray;
  v5 = -[SecCBORArray init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
    m_data = v5->m_data;
    v5->m_data = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)addObject:(id)a3
{
  -[NSMutableArray addObject:](self->m_data, "addObject:", a3);
}

- (void)write:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SecCBORValue encodeStartItems:output:](self, "encodeStartItems:output:", -[NSMutableArray count](self->m_data, "count"), v6);
  if (-[NSMutableArray count](self->m_data, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->m_data, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "write:", v6);

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->m_data, "count"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_data, 0);
}

@end
