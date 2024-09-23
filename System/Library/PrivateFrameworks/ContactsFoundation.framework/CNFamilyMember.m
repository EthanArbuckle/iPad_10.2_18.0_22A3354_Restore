@implementation CNFamilyMember

+ (BOOL)isDelegateChildFamilyMember:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isParent") & 1) == 0
    && (objc_msgSend(v3, "isOrganizer") & 1) == 0
    && (unint64_t)(objc_msgSend(v3, "memberType") - 1) < 2;

  return v4;
}

+ (BOOL)isAdministrativeGuardianFamilyMember:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isParent") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isOrganizer");

  return v4;
}

@end
