@implementation CoreThemeConstantHelper

- (int64_t)identifier
{
  return self->_identifier;
}

- (id)label
{
  return self->_label;
}

- (id)displayName
{
  return self->_displayName;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CoreThemeConstantHelper;
  -[CoreThemeConstantHelper dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CoreThemeConstantHelper;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - identifier: %ld, constantName: %@, displayName: %@"), -[CoreThemeConstantHelper description](&v3, sel_description), self->_identifier, self->_label, self->_displayName);
}

+ (id)helperForStructAtIndex:(int64_t)a3 inAssociatedGlobalList:(void *)a4
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  int *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  objc_class *v15;
  _QWORD *v16;

  v6 = objc_alloc_init((Class)a1);
  v7 = v6;
  if (a4 == (void *)MEMORY[0x24BE28D38])
  {
    v10 = (int *)(MEMORY[0x24BE28D38] + 32 * a3);
    if (!*((_QWORD *)v10 + 1))
      goto LABEL_47;
    goto LABEL_35;
  }
  v8 = MEMORY[0x24BE28D18];
  if (a4 == (void *)MEMORY[0x24BE28D18]
    || (v8 = MEMORY[0x24BE28D70], a4 == (void *)MEMORY[0x24BE28D70])
    || (v8 = MEMORY[0x24BE28D58], a4 == (void *)MEMORY[0x24BE28D58])
    || (v8 = MEMORY[0x24BE28D68], a4 == (void *)MEMORY[0x24BE28D68])
    || (v8 = MEMORY[0x24BE28DA0], a4 == (void *)MEMORY[0x24BE28DA0])
    || (v8 = MEMORY[0x24BE28D28], a4 == (void *)MEMORY[0x24BE28D28]))
  {
    if (!*(_QWORD *)(v8 + 24 * a3 + 8))
      goto LABEL_47;
    v10 = (int *)(v8 + 24 * a3);
    goto LABEL_35;
  }
  if (a4 == (void *)MEMORY[0x24BE28DA8]
    || a4 == (void *)MEMORY[0x24BE28DB8]
    || a4 == (void *)MEMORY[0x24BE28DB0]
    || a4 == (void *)MEMORY[0x24BE28D88]
    || a4 == (void *)MEMORY[0x24BE28D80]
    || a4 == (void *)MEMORY[0x24BE28D90]
    || a4 == (void *)MEMORY[0x24BE28D08]
    || a4 == (void *)MEMORY[0x24BE28D10]
    || a4 == (void *)MEMORY[0x24BE28D20]
    || a4 == (void *)MEMORY[0x24BE28D40]
    || a4 == (void *)MEMORY[0x24BE28D78]
    || a4 == (void *)MEMORY[0x24BE28D98]
    || a4 == (void *)MEMORY[0x24BE28CD8]
    || a4 == (void *)MEMORY[0x24BE28CE0]
    || a4 == (void *)MEMORY[0x24BE28D60]
    || a4 == (void *)MEMORY[0x24BE28D50]
    || a4 == (void *)MEMORY[0x24BE28CF0]
    || a4 == (void *)MEMORY[0x24BE28CE8]
    || a4 == (void *)MEMORY[0x24BE28CC8]
    || a4 == (void *)MEMORY[0x24BE28CF8])
  {
    if (!*((_QWORD *)a4 + 3 * a3 + 1))
      goto LABEL_47;
    v10 = (int *)((char *)a4 + 24 * a3);
LABEL_35:
    v11 = *(_QWORD *)v10;
    goto LABEL_36;
  }
  if (a4 != gThemeIterationTypes)
  {
    if (a4 == (void *)MEMORY[0x24BE28D00])
    {
      v13 = *(_QWORD *)(MEMORY[0x24BE28D00] + 24 * a3 + 8);
      if (v13)
      {
        v14 = (_QWORD *)(MEMORY[0x24BE28D00] + 24 * a3);
        v6[1] = *v14;
        v6[2] = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v13);
        v15 = (objc_class *)MEMORY[0x24BDD17C8];
LABEL_46:
        v12 = (id)objc_msgSend([v15 alloc], "initWithUTF8String:", v14[2]);
        goto LABEL_37;
      }
    }
    else
    {
      if (a4 != &gSchemaCategories)
      {

        return 0;
      }
      v16 = (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", 0), "elementCategoryAtIndex:", a3);
      if (v16[1])
      {
        v14 = v16;
        v7[1] = *v16;
        v7[2] = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v16[1]);
        v15 = (objc_class *)MEMORY[0x24BDD17C8];
        goto LABEL_46;
      }
    }
LABEL_47:

    v7 = 0;
    return v7;
  }
  if (!*(_QWORD *)&gThemeIterationTypes[6 * a3 + 2])
    goto LABEL_47;
  v10 = &gThemeIterationTypes[6 * a3];
  v11 = *v10;
LABEL_36:
  v6[1] = v11;
  v6[2] = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
  v12 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v10 + 2));
LABEL_37:
  v7[3] = v12;
  return v7;
}

@end
