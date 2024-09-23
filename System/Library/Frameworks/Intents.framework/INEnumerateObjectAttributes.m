@implementation INEnumerateObjectAttributes

void ___INEnumerateObjectAttributes_block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = INEnumerateObjectsInCodable(v6, *(_QWORD *)(a1 + 32));
    v4 = v6;
    if ((v3 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v4 = v6;
  if (v6)
  {
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v6;
    if (v5)
LABEL_6:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_7:

}

@end
