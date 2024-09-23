@implementation DMCTableViewCell

- (PSViewController)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_detailViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailViewController, 0);
}

@end
