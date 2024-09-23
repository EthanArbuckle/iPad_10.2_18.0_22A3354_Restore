@implementation ICMarkupActivityItem

- (ICMarkupActivityItem)initWithAttachment:(id)a3
{
  id v4;
  ICMarkupActivityItem *v5;
  ICMarkupActivityItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICMarkupActivityItem;
  v5 = -[ICMarkupActivityItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICMarkupActivityItem setAttachment:](v5, "setAttachment:", v4);

  return v6;
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
