@implementation ML3QueryResultSet

void __80__ML3QueryResultSet_MPMediaLibraryAdditions__enumerateSectionHeadersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "localizedSectionHeaderForSectionIndex:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIndexTitleIndexForSectionIndex:", a4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
