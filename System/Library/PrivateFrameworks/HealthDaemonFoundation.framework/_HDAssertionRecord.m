@implementation _HDAssertionRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_assertionIdentifier, 0);
}

- (_QWORD)initWithAssertionIdentifier:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_HDAssertionRecord;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)a1[2];
      a1[2] = v6;

    }
  }

  return a1;
}

@end
