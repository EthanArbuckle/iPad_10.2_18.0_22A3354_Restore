@implementation PARSyncCard

+ (id)cardWithTitle:(id)a3 sections:(id)a4
{
  id v5;
  id v6;
  PARSyncCard *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PARSyncCard);
  -[PARSyncCard setTitle:](v7, "setTitle:", v6);

  -[PARSyncCard setCardSections:](v7, "setCardSections:", v5);
  return v7;
}

@end
