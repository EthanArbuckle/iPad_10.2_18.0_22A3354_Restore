@implementation ICSafariViewController

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
