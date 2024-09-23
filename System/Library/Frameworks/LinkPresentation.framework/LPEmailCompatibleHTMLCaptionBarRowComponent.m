@implementation LPEmailCompatibleHTMLCaptionBarRowComponent

- (LPEmailCompatibleHTMLCaptionBarRowComponent)initWithThemePath:(id)a3 generator:(id)a4
{
  LPEmailCompatibleHTMLCaptionBarRowComponent *v4;
  LPEmailCompatibleHTMLCaptionBarRowComponent *v5;
  LPEmailCompatibleHTMLCaptionBarRowComponent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LPEmailCompatibleHTMLCaptionBarRowComponent;
  v4 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v8, sel_initWithTagName_themePath_generator_, CFSTR("tr"), a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
