@implementation VCEncryptionRules

+ (id)supportedCipherSuitesForStreamGroupID:(unsigned int)a3 isOneToOne:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = v6;
  v8 = &unk_1E9EF4AA8;
  if ((int)a3 > 1835623281)
  {
    if ((int)a3 > 1935897188)
    {
      if (a3 != 1937339233)
      {
        v9 = 1935897189;
        goto LABEL_13;
      }
    }
    else if (a3 != 1835623282)
    {
      if (a3 != 1835623287)
        goto LABEL_19;
      goto LABEL_20;
    }
    if (v4)
    {
      v10 = &unk_1E9EF9FB0;
      goto LABEL_18;
    }
LABEL_19:
    v8 = &unk_1E9EF4AC0;
    goto LABEL_20;
  }
  if ((int)a3 <= 1667329398)
  {
    if (a3 == 1650745716)
    {
LABEL_14:
      if (v4)
      {
        v10 = &unk_1E9EF9F98;
LABEL_18:
        objc_msgSend(v6, "addObjectsFromArray:", v10);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    v9 = 1667329381;
LABEL_13:
    if (a3 != v9)
      goto LABEL_19;
    goto LABEL_14;
  }
  if (a3 != 1667329399)
  {
    v9 = 1718909044;
    goto LABEL_13;
  }
LABEL_20:
  objc_msgSend(v7, "addObject:", v8);
  return v7;
}

@end
