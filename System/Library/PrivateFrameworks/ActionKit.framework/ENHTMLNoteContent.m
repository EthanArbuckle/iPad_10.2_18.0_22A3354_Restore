@implementation ENHTMLNoteContent

- (ENHTMLNoteContent)initWithHTML:(id)a3
{
  id v4;
  ENHTMLNoteContent *v5;
  ENHTMLNoteContent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENHTMLNoteContent;
  v5 = -[ENHTMLNoteContent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ENHTMLNoteContent setHtml:](v5, "setHtml:", v4);

  return v6;
}

- (id)enmlWithNote:(id)a3
{
  ENHTMLtoENMLConverter *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(ENHTMLtoENMLConverter);
  -[ENHTMLNoteContent html](self, "html");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENHTMLtoENMLConverter enmlFromHTMLContent:](v4, "enmlFromHTMLContent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)html
{
  return self->_html;
}

- (void)setHtml:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_html, 0);
}

@end
