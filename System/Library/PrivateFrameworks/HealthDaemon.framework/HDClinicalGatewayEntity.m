@implementation HDClinicalGatewayEntity

+ (id)databaseTable
{
  return CFSTR("clinical_gateways");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_12;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("external_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncAnchor
{
  return CFSTR("sync_anchor");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = CFSTR("country");
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("country"))
    || (v5 = CFSTR("fhirVersion"), objc_msgSend(v4, "isEqualToString:", CFSTR("fhirVersion"))))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("json_extract(%@.raw_content, '$.%@')"), v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDClinicalGatewayEntity;
    objc_msgSendSuper2(&v10, sel_disambiguatedSQLForProperty_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
