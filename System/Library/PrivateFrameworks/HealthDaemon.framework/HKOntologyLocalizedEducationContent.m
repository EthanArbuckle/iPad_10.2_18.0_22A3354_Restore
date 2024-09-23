@implementation HKOntologyLocalizedEducationContent

id __72__HKOntologyLocalizedEducationContent_HDSyncSupport__createWithCodable___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v2 = a2;
  v3 = objc_opt_self();
  v4 = objc_msgSend(v2, "sectionType");
  objc_msgSend(v2, "sectionDatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HKOntologyLocalizedEducationContent_HDSyncSupport___createSectionWithCodable___block_invoke;
  v10[3] = &__block_descriptor_40_e30__16__0__HDCodableSectionData_8l;
  v10[4] = v3;
  objc_msgSend(v5, "hk_map:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_mapToDictionary:", &__block_literal_global_273_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69A8]), "initWithSectionDataTypeMapping:sectionType:", v7, v4);

  return v8;
}

id __80__HKOntologyLocalizedEducationContent_HDSyncSupport___createSectionWithCodable___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc(MEMORY[0x1E0CB6998]);
  objc_msgSend(v2, "stringValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "sectionDataType");
  v6 = objc_msgSend(v2, "version");
  objc_msgSend(v2, "timestamp");
  v8 = v7;
  v9 = objc_msgSend(v2, "deleted");

  v10 = (void *)objc_msgSend(v3, "initWithStringValues:sectionDataType:version:timestamp:deleted:", v4, v5, v6, v9, v8);
  return v10;
}

void __80__HKOntologyLocalizedEducationContent_HDSyncSupport___createSectionWithCodable___block_invoke_2(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "sectionDataType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v6, v8, v7);

}

@end
