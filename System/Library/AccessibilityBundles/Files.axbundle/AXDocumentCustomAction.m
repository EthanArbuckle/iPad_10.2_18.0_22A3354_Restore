@implementation AXDocumentCustomAction

- (UIAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
