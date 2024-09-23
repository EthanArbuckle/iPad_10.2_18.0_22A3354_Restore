@implementation CNPRUISPosterAttachment

- (CNPRUISPosterAttachment)initWithAttachment:(id)a3
{
  id v5;
  CNPRUISPosterAttachment *v6;
  CNPRUISPosterAttachment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRUISPosterAttachment;
  v6 = -[CNPRUISPosterAttachment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attachment, a3);

  return v7;
}

- (PRUISPosterAttachment)attachment
{
  return self->_attachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
