@implementation UITableView(MTUIUtil)

- (double)mtui_sectionHeaderHeightWithString:()MTUIUtil
{
  void *v4;
  id v5;
  void *v6;
  double Width;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Height;
  _QWORD v23[2];
  _QWORD v24[3];
  CGRect v25;
  CGRect v26;

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDF6E78];
  v5 = a3;
  objc_msgSend(v4, "_defaultFontForTableViewStyle:isSectionHeader:", objc_msgSend(a1, "style"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bounds");
  Width = CGRectGetWidth(v25);
  objc_msgSend(a1, "_marginWidth");
  v9 = Width + v8 * -2.0;
  v10 = *MEMORY[0x24BDF6628];
  v23[0] = *MEMORY[0x24BDF65F8];
  v23[1] = v10;
  v24[0] = v6;
  objc_msgSend(MEMORY[0x24BDF6E58], "wordWrapParagraphStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, v9, 0.0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  Height = CGRectGetHeight(v26);

  return Height;
}

+ (id)wordWrapParagraphStyle
{
  if (wordWrapParagraphStyle_onceToken != -1)
    dispatch_once(&wordWrapParagraphStyle_onceToken, &__block_literal_global_191);
  return (id)wordWrapParagraphStyle_style;
}

@end
