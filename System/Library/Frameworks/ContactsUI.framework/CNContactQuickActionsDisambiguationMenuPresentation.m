@implementation CNContactQuickActionsDisambiguationMenuPresentation

- (id)initBase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactQuickActionsDisambiguationMenuPresentation;
  return -[CNContactQuickActionsDisambiguationMenuPresentation init](&v3, sel_init);
}

- (id)viewControllerForPresentingActionsController:(id)a3 fromView:(id)a4 dismissDisambiguationMenuHandler:(id)a5
{
  return (id)objc_msgSend(a3, "viewController");
}

+ (CNContactQuickActionsDisambiguationMenuPresentation)modalPresentation
{
  return (CNContactQuickActionsDisambiguationMenuPresentation *)-[CNContactQuickActionsDisambiguationMenuPresentation initBase]([_CNContactQuickActionsModalDisambiguationMenuPresentation alloc], "initBase");
}

+ (CNContactQuickActionsDisambiguationMenuPresentation)alertSheetPresentation
{
  return (CNContactQuickActionsDisambiguationMenuPresentation *)-[CNContactQuickActionsDisambiguationMenuPresentation initBase]([_CNContactQuickActionsAlertSheetDisambiguationMenuPresentation alloc], "initBase");
}

@end
