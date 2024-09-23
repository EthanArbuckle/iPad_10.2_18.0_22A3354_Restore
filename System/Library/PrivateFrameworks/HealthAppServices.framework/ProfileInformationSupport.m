@implementation ProfileInformationSupport

+ (id)localizedFullNameOrAccountIdentifierWithFirstName:(id)a3 lastName:(id)a4 isContact:(BOOL)a5 accountIdentifier:(id)a6 shouldDisplaySuggestedName:(BOOL)a7 newlineBetweenNames:(BOOL)a8
{
  return sub_1D7131CC8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, char))static ProfileInformationSupport.localizedFullNameOrAccountIdentifier(firstName:lastName:isContact:accountIdentifier:shouldDisplaySuggestedName:newlineBetweenNames:));
}

+ (id)localizedShortNameOrAccountIdentifierWithFirstName:(id)a3 lastName:(id)a4 isContact:(BOOL)a5 accountIdentifier:(id)a6 shouldDisplaySuggestedName:(BOOL)a7 newlineBetweenNames:(BOOL)a8
{
  return sub_1D7131CC8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, a7, a8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, char))static ProfileInformationSupport.localizedShortNameOrAccountIdentifier(firstName:lastName:isContact:accountIdentifier:shouldDisplaySuggestedName:newlineBetweenNames:));
}

- (_TtC17HealthAppServices25ProfileInformationSupport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProfileInformationSupport();
  return -[ProfileInformationSupport init](&v3, sel_init);
}

@end
