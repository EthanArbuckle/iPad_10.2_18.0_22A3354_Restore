@implementation DSSharingPerson

void __52__DSSharingPerson_DigitalSeparationUI__iconForTable__block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  void *v3;

  LODWORD(a2) = 1108344832;
  objc_msgSend(*(id *)(a1 + 32), "iconWithSize:", a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)iconForTable_contactLessIcon;
  iconForTable_contactLessIcon = v2;

}

void __53__DSSharingPerson_DigitalSeparationUI__iconForDetail__block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  void *v3;

  LODWORD(a2) = 1114636288;
  objc_msgSend(*(id *)(a1 + 32), "iconWithSize:", a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)iconForDetail_contactLessIcon;
  iconForDetail_contactLessIcon = v2;

}

@end
