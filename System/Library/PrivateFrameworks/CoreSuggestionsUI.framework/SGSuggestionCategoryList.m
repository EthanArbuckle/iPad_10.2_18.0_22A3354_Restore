@implementation SGSuggestionCategoryList

- (SGSuggestionCategoryList)init
{
  SGSuggestionCategoryList *v2;
  SGSuggestionCategoryList *v3;
  NSString *listTitle;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGSuggestionCategoryList;
  v2 = -[SGSuggestionCategoryList init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    listTitle = v2->_listTitle;
    v2->_listTitle = 0;

    v3->_supportsDismissAll = 0;
  }
  return v3;
}

- (NSString)listTitle
{
  return self->_listTitle;
}

- (void)setListTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)supportsDismissAll
{
  return self->_supportsDismissAll;
}

- (void)setSupportsDismissAll:(BOOL)a3
{
  self->_supportsDismissAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listTitle, 0);
}

@end
