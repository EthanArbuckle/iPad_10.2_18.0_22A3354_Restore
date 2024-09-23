@implementation DSSharingPerson(DigitalSeparationUI)

- (id)iconWithSize:()DigitalSeparationUI
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BDBAE38]);
  objc_msgSend(MEMORY[0x24BDBAE40], "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSettings:", v5);

  v7 = objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") == 1;
  v8 = (void *)MEMORY[0x24BDBAE48];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  objc_msgSend(v8, "scopeWithPointSize:scale:rightToLeft:style:", v7, 0, a2, a2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = objc_alloc_init(MEMORY[0x24BDBAD50]);
  v15 = v14;

  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarImageForContacts:scope:", v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)iconForTable
{
  void *v2;
  double v3;
  id v4;
  _QWORD block[5];

  objc_msgSend(a1, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    LODWORD(v3) = 1108344832;
    objc_msgSend(a1, "iconWithSize:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__DSSharingPerson_DigitalSeparationUI__iconForTable__block_invoke;
    block[3] = &unk_24EFF33A0;
    block[4] = a1;
    if (iconForTable_onceToken != -1)
      dispatch_once(&iconForTable_onceToken, block);
    v4 = (id)iconForTable_contactLessIcon;
  }
  return v4;
}

- (id)iconForDetail
{
  void *v2;
  double v3;
  id v4;
  _QWORD block[5];

  objc_msgSend(a1, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    LODWORD(v3) = 1114636288;
    objc_msgSend(a1, "iconWithSize:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__DSSharingPerson_DigitalSeparationUI__iconForDetail__block_invoke;
    block[3] = &unk_24EFF33A0;
    block[4] = a1;
    if (iconForDetail_onceToken != -1)
      dispatch_once(&iconForDetail_onceToken, block);
    v4 = (id)iconForDetail_contactLessIcon;
  }
  return v4;
}

@end
