@implementation HUSideBarStaticItem

- (id)resultDictionary
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  const __CFString *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = -[HUSideBarStaticItem type](self, "type");
  switch(v3)
  {
    case 2uLL:
      v11[0] = *MEMORY[0x1E0D30D18];
      HFLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v4;
      v11[1] = *MEMORY[0x1E0D30C78];
      v8 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
      v9 = CFSTR("star.fill");
      if (v8)
        v9 = CFSTR("star");
      v12[1] = v9;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = v12;
      v7 = v11;
      goto LABEL_9;
    case 1uLL:
      v13[0] = *MEMORY[0x1E0D30D18];
      HFLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = *MEMORY[0x1E0D30C78];
      v14[0] = v4;
      v14[1] = CFSTR("deskclock");
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = v14;
      v7 = v13;
      goto LABEL_9;
    case 0uLL:
      v15[0] = *MEMORY[0x1E0D30D18];
      HFLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = *MEMORY[0x1E0D30C78];
      v16[0] = v4;
      v16[1] = CFSTR("house");
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = v16;
      v7 = v15;
LABEL_9:
      objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v2;
}

- (HUSideBarStaticItem)initWithSideBarStaticItemType:(unint64_t)a3
{
  HUSideBarStaticItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUSideBarStaticItem;
  result = -[HFStaticItem init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v5 = (void *)MEMORY[0x1E0D314B8];
  -[HUSideBarStaticItem resultDictionary](self, "resultDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outcomeWithResults:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v7);

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

@end
