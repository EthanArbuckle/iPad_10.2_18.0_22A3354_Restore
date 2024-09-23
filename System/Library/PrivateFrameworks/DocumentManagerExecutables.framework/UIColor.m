@implementation UIColor

void __51__UIColor_DOCTag___doc_underlyingColorForTagColor___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  +[DOCTagAppearance renderingAppearance](DOCTagAppearance, "renderingAppearance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "underlyingColorForNoneTag");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v3;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPurpleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v4;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v5;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v6;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v7;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_doc_underlyingColorForTagColor__colors;
  _doc_underlyingColorForTagColor__colors = v9;

}

@end
