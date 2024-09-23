@implementation DMCProfileSummaryCell

+ (id)cellIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DMCProfileSummaryCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6B80], "cellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendlyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  +[DMCIconFactory largeGearIcon](DMCIconFactory, "largeGearIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v7);

  objc_msgSend(v4, "organization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(v4, "organization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BDF6950], "DMCProfileSecondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v12);
    objc_msgSend(v5, "setSecondaryAttributedText:", v13);

  }
  -[DMCProfileSummaryCell setContentConfiguration:](self, "setContentConfiguration:", v5);

}

@end
