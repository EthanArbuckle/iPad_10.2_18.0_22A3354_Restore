@implementation CNiOSABPredicateRunner

- (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 ranked:(BOOL)a5 inAddressBook:(void *)a6 withDelegate:(id)a7
{
  objc_msgSend(MEMORY[0x1E0CF5D80], "searchPeopleWithPredicate:sortOrder:ranked:inAddressBook:withDelegate:", a3, *(_QWORD *)&a4, a5, a6, a7);
}

- (id)personPredicateWithNameLike:(id)a3 inSource:(id)a4 addressBook:(void *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CF5D90], "personPredicateWithNameLike:inSource:addressBook:", a3, a4, a5);
}

- (id)personPredicateWithNameLike:(id)a3 inGroups:(id)a4 sources:(id)a5 addressBook:(void *)a6
{
  return (id)objc_msgSend(MEMORY[0x1E0CF5D90], "personPredicateWithNameLike:inGroups:sources:addressBook:", a3, a4, a5, a6);
}

@end
