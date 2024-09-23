@implementation PDFMarkupMenuColorForMenuIcon

void __PDFMarkupMenuColorForMenuIcon_block_invoke()
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
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x24BDAC8D0];
  v14[0] = &unk_24C27D790;
  +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  v14[1] = &unk_24C27D7A8;
  +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectAtIndex:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v1;
  v14[2] = &unk_24C27D7C0;
  +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v3;
  v14[3] = &unk_24C27D7D8;
  +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = &unk_24C27D7F0;
  +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = &unk_24C27D808;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = &unk_24C27D820;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)PDFMarkupMenuColorForMenuIcon_colors;
  PDFMarkupMenuColorForMenuIcon_colors = v10;

}

@end
