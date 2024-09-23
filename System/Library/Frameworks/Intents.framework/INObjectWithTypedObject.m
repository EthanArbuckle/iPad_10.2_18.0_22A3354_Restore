@implementation INObjectWithTypedObject

id ___INObjectWithTypedObject_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    _INObjectWithTypedObject(v3, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = v3;
  }
  else
  {

    v7 = 0;
    v5 = 0;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v6 = 1;
  }
  objc_msgSend(v4, "if_arrayWithObjectIfNonNil:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v8;

  if ((v6 & 1) == 0)
  return v10;
}

@end
