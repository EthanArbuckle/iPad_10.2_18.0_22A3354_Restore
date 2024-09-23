@implementation HDOntologyBrandNameProvider

+ (id)brandNamesForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;
  uint64_t v13;

  v5 = *MEMORY[0x1E0D29308];
  v12 = 0;
  v13 = v5;
  v6 = objc_msgSend(MEMORY[0x1E0D29520], "followRelationshipsWithTypes:startingIdentifier:options:ontologyTransaction:conceptOut:deletedRelationshipVersionOut:error:", &unk_1E6E115F8, a3, 12, a4, &v12, &v13, a5);
  v7 = v12;
  v8 = 0;
  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D29530], "localizedOntologyPreferredNamesForConcept:withUserDomainConceptPropertyType:", v7, 160007);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = (void *)v9;
      objc_msgSend(v8, "addObjectsFromArray:", v9);

      goto LABEL_7;
    }
    if (v13 != v5)
    {
      objc_msgSend(MEMORY[0x1E0D29530], "nullLocalizedOntologyPreferredNamesWithVersion:withUserDomainConceptPropertyType:", v13, 160007);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v8;
}

@end
