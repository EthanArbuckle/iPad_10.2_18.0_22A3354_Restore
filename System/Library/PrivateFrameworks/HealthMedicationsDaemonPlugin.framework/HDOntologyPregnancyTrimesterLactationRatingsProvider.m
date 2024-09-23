@implementation HDOntologyPregnancyTrimesterLactationRatingsProvider

+ (id)pregnancyTrimesterLactationRatingsForConcept:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "firstAttributeForType:", 665);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D29530], "localizedUserDomainConceptPropertyStringForConceptAttribute:locale:propertyType:", v3, CFSTR("en_US"), 180000);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
