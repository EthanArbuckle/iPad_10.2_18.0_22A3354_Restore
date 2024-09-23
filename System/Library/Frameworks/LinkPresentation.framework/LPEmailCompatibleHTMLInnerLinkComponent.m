@implementation LPEmailCompatibleHTMLInnerLinkComponent

- (LPEmailCompatibleHTMLInnerLinkComponent)initWithThemePath:(id)a3 generator:(id)a4
{
  id v6;
  id v7;
  LPEmailCompatibleHTMLInnerLinkComponent *v8;
  LPEmailCompatibleHTMLInnerLinkComponent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  LPEmailCompatibleHTMLInnerLinkComponent *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LPEmailCompatibleHTMLInnerLinkComponent;
  v8 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v18, sel_initWithTagName_themePath_generator_, CFSTR("a"), v6, v7);
  v9 = v8;
  if (v8)
  {
    -[LPHTMLComponent element](v8, "element");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttribute:value:", CFSTR("rel"), CFSTR("nofollow"));

    -[LPHTMLComponent element](v9, "element");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPHTMLComponent generator](v9, "generator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttribute:value:", CFSTR("href"), v14);

    -[LPHTMLComponent element](v9, "element");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAttribute:value:", CFSTR("draggable"), CFSTR("false"));

    v16 = v9;
  }

  return v9;
}

@end
