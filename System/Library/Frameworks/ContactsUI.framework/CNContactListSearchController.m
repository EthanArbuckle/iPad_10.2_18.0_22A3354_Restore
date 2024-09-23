@implementation CNContactListSearchController

id __42__CNContactListSearchController_searchBar__block_invoke(uint64_t a1)
{
  void *v2;
  CNContactListSearchBar *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1312);
  if (!v2)
  {
    v3 = objc_alloc_init(CNContactListSearchBar);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1312);
    *(_QWORD *)(v4 + 1312) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1312);
  }
  return v2;
}

- (id)searchBar
{
  cn_objectResultWithObjectLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end
