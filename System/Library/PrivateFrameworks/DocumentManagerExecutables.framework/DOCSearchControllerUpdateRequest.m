@implementation DOCSearchControllerUpdateRequest

- (UISearchController)searchController
{
  return (UISearchController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSearchController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
