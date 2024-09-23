@implementation ICCollapsibleContainerView

- (void)performSetup
{
  id v3;

  -[ICCollapsibleContainerView containedView](self, "containedView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCollapsibleBaseView performSetUpWithContentView:](self, "performSetUpWithContentView:", v3);

}

- (UIView)containedView
{
  return self->_containedView;
}

- (void)setContainedView:(id)a3
{
  objc_storeStrong((id *)&self->_containedView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containedView, 0);
}

@end
