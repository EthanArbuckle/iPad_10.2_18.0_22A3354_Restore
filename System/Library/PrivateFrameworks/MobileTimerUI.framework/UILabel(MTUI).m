@implementation UILabel(MTUI)

- (void)mtui_setText:()MTUI hyphenationFactor:
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (a2 <= 0.0)
  {
    v9 = a4;
    objc_msgSend(a1, "setText:", v9);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDF6750];
    v7 = a4;
    objc_msgSend(v6, "defaultParagraphStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "mutableCopy");

    *(float *)&v10 = a2;
    objc_msgSend(v9, "setHyphenationFactor:", v10);
    v11 = objc_alloc(MEMORY[0x24BDD1458]);
    v14 = *MEMORY[0x24BDF6628];
    v15[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v7, v12);

    objc_msgSend(a1, "setAttributedText:", v13);
  }

}

@end
