@implementation ENNoteContent

- (ENNoteContent)initWithENML:(id)a3
{
  id v4;
  ENNoteContent *v5;
  ENNoteContent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENNoteContent;
  v5 = -[ENNoteContent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ENNoteContent setEmml:](v5, "setEmml:", v4);

  return v6;
}

- (id)enml
{
  return -[ENNoteContent enmlWithNote:](self, "enmlWithNote:", 0);
}

- (NSString)emml
{
  return self->_emml;
}

- (void)setEmml:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emml, 0);
}

+ (id)noteContentWithString:(id)a3
{
  id v3;
  ENPlainNoteContent *v4;

  v3 = a3;
  v4 = -[ENPlainNoteContent initWithString:]([ENPlainNoteContent alloc], "initWithString:", v3);

  return v4;
}

+ (id)noteContentWithContentArray:(id)a3
{
  id v3;
  ENPlainNoteContent *v4;

  v3 = a3;
  v4 = -[ENPlainNoteContent initWithContents:]([ENPlainNoteContent alloc], "initWithContents:", v3);

  return v4;
}

+ (id)noteContentWithSanitizedHTML:(id)a3
{
  id v3;
  ENHTMLNoteContent *v4;

  v3 = a3;
  v4 = -[ENHTMLNoteContent initWithHTML:]([ENHTMLNoteContent alloc], "initWithHTML:", v3);

  return v4;
}

+ (id)noteContentWithENML:(id)a3
{
  id v3;
  ENNoteContent *v4;

  v3 = a3;
  v4 = -[ENNoteContent initWithENML:]([ENNoteContent alloc], "initWithENML:", v3);

  return v4;
}

@end
