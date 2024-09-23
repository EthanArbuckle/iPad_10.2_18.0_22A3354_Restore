@implementation CKDetailsNavigationController

- (BOOL)isModalInPresentation
{
  void *v2;
  BOOL v3;

  -[CKDetailsNavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (BOOL)isDetached
{
  return self->_isDetached;
}

- (void)setIsDetached:(BOOL)a3
{
  self->_isDetached = a3;
}

- (CKDetailsControllerAdapter)detailsAdapter
{
  return self->_detailsAdapter;
}

- (void)setDetailsAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_detailsAdapter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsAdapter, 0);
}

@end
