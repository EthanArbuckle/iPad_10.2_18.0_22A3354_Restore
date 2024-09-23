@implementation AXCollectionViewData

- (AXCollectionViewData)init
{
  id v2;
  void *v3;
  objc_super v5;
  SEL v6;
  id v7;
  AXCollectionViewData *v8;

  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)AXCollectionViewData;
  v7 = -[AXCollectionViewData init](&v5, sel_init);
  objc_storeStrong(&v7, v7);
  if (v7)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v2;

    v8 = (AXCollectionViewData *)v7;
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(&v7, 0);
  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  AXCollectionViewData *v8;

  v8 = self;
  v7 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v6.receiver = self;
  v6.super_class = (Class)AXCollectionViewData;
  v4 = -[AXCollectionViewData description](&v6, sel_description);
  v5 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v8->_children);

  return v5;
}

- (uint64_t)children
{
  if (a1)
    return *(_QWORD *)(a1 + 8);
  else
    return 0;
}

- (uint64_t)childCount
{
  if (a1)
    return *(_QWORD *)(a1 + 16);
  else
    return 0;
}

- (uint64_t)setChildCount:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 16) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
