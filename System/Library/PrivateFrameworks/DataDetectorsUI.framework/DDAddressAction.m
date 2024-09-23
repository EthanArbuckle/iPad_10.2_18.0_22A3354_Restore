@implementation DDAddressAction

+ (id)actionWithURL:(id)a3 result:(__DDResult *)a4 enclosingResult:(__DDResult *)a5 context:(id)a6
{
  uint64_t v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___DDAddressAction;
  objc_msgSendSuper2(&v9, sel_actionWithURL_result_context_, a3, a4, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    *(_QWORD *)(v7 + 16) = CFRetain(a5);
    *(_BYTE *)(v7 + 80) = 1;
  }
  return (id)v7;
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  void *v4;
  char v5;

  DDDefaultAddressForContact(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(a1, "isAvailable");
  else
    v5 = 0;

  return v5;
}

- (id)iconName
{
  return CFSTR("person.crop.circle.badge.plus");
}

- (id)variantIconName
{
  return CFSTR("person.crop.circle.fill");
}

@end
