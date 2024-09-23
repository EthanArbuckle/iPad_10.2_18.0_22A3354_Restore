@implementation ICImagePreviewController

- (ICImagePreviewController)initWithAttachment:(id)a3
{
  id v4;
  ICImagePreviewController *v5;
  ICImagePreviewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICImagePreviewController;
  v5 = -[ICImagePreviewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[ICImagePreviewController setAttachment:](v5, "setAttachment:", v4);

  return v6;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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
