@implementation AEPersistentDeactivation

- (id)initWithScratchpadIdentifier:(void *)a3 deactivation:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)AEPersistentDeactivation;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (uint64_t)scratchpadIdentifier
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)deactivation
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deactivation, 0);
  objc_storeStrong((id *)&self->_scratchpadIdentifier, 0);
}

@end
