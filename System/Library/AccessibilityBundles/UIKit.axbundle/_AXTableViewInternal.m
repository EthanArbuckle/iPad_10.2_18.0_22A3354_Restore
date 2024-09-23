@implementation _AXTableViewInternal

- (_AXTableViewInternal)init
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  SEL v12;
  id v13;
  _AXTableViewInternal *v14;

  v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)_AXTableViewInternal;
  v13 = -[_AXTableViewInternal init](&v11, sel_init);
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");
    v3 = (void *)*((_QWORD *)v13 + 1);
    *((_QWORD *)v13 + 1) = v2;

    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");
    v5 = (void *)*((_QWORD *)v13 + 2);
    *((_QWORD *)v13 + 2) = v4;

    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");
    v7 = (void *)*((_QWORD *)v13 + 3);
    *((_QWORD *)v13 + 3) = v6;

    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");
    v9 = (void *)*((_QWORD *)v13 + 4);
    *((_QWORD *)v13 + 4) = v8;

    v14 = (_AXTableViewInternal *)v13;
  }
  else
  {
    v14 = 0;
  }
  objc_storeStrong(&v13, 0);
  return v14;
}

- (uint64_t)searchControllerDimmingViewVisible
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 42) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)setSearchControllerDimmingViewVisible:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 42) = a2 & 1;
  return result;
}

- (uint64_t)searchTableViewVisible
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 41) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)setSearchTableViewVisible:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 41) = a2 & 1;
  return result;
}

- (uint64_t)accessibleElementCount
{
  if (a1)
    return *(_QWORD *)(a1 + 48);
  else
    return 0;
}

- (uint64_t)setAccessibleElementCount:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 48) = a2;
  return result;
}

- (uint64_t)children
{
  if (a1)
    return *(_QWORD *)(a1 + 8);
  else
    return 0;
}

- (uint64_t)indexMap
{
  if (a1)
    return *(_QWORD *)(a1 + 16);
  else
    return 0;
}

- (uint64_t)setReusableCellsEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

- (uint64_t)sectionHeaders
{
  if (a1)
    return *(_QWORD *)(a1 + 24);
  else
    return 0;
}

- (uint64_t)sectionFooters
{
  if (a1)
    return *(_QWORD *)(a1 + 32);
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFooters, 0);
  objc_storeStrong((id *)&self->_sectionHeaders, 0);
  objc_storeStrong((id *)&self->_indexMap, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
