@implementation HKAllConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  if (objc_msgSend(a1, "value"))
    objc_msgSend(MEMORY[0x1E0D29890], "truePredicate");
  else
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
