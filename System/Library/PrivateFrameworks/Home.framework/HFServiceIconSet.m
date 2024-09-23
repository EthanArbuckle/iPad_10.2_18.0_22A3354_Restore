@implementation HFServiceIconSet

- (HFIconDescriptor)defaultIcon
{
  return self->_defaultIcon;
}

+ (id)setWithDefaultIcon:(id)a3 alternateIcons:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  v9 = v5;

  if (v6)
    v10 = v6;
  else
    v10 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setByAddingObject:", v9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v7[1];
  v7[1] = v12;

  return v7;
}

+ (id)setWithDefaultIcon:(id)a3
{
  return (id)objc_msgSend(a1, "setWithDefaultIcon:alternateIcons:", a3, MEMORY[0x1E0C9AA60]);
}

+ (id)placeholderIconSet
{
  HFImageIconDescriptor *v3;
  void *v4;

  v3 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", CFSTR("HFImageIconIdentifierGeneric"));
  objc_msgSend(a1, "setWithDefaultIcon:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)setWithImageIdentifier:(id)a3
{
  id v4;
  HFImageIconDescriptor *v5;
  void *v6;

  v4 = a3;
  v5 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", v4);

  objc_msgSend(a1, "setWithDefaultIcon:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)allIcons
{
  return self->_allIcons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultIcon, 0);
  objc_storeStrong((id *)&self->_allIcons, 0);
}

@end
