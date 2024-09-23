@implementation AMSCarrierOfferRegistrationPrivacyValidator

+ (id)allowedIdentifiersFrom:(id)a3 forAccount:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = sub_18CEC1774();
  swift_getObjCClassMetadata();
  v6 = a4;
  static CarrierOfferRegistrationPrivacyValidator.allowedIdentifiers(from:forAccount:)(v5, v6);

  swift_bridgeObjectRelease();
  v7 = (void *)sub_18CEC1B40();
  swift_bridgeObjectRelease();
  return v7;
}

- (AMSCarrierOfferRegistrationPrivacyValidator)init
{
  return (AMSCarrierOfferRegistrationPrivacyValidator *)CarrierOfferRegistrationPrivacyValidator.init()();
}

@end
