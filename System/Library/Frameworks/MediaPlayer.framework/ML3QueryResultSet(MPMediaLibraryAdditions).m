@implementation ML3QueryResultSet(MPMediaLibraryAdditions)

- (id)sectionIndexTitles
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "query");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedSectionIndexTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enumerateSectionHeadersUsingBlock:()MPMediaLibraryAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__ML3QueryResultSet_MPMediaLibraryAdditions__enumerateSectionHeadersUsingBlock___block_invoke;
  v9[3] = &unk_1E3157900;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(a1, "enumerateSectionsUsingBlock:", v9);

}

@end
