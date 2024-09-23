@implementation NSExtensionItem(RPExtensions)

+ (id)itemWithTitle:()RPExtensions attachmentItem:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1560];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, 0);

  objc_msgSend(v8, "setAttributedTitle:", v9);
  v10 = objc_alloc(MEMORY[0x24BDD15F0]);
  v11 = (void *)objc_msgSend(v10, "initWithItem:typeIdentifier:", v6, *MEMORY[0x24BDC1748]);

  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttachments:", v12);

  return v8;
}

@end
