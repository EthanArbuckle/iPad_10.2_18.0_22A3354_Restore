@implementation _ICPortraitUtilities

+ (id)contactRecordFromPortraitContactRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _ICContactRecord *v8;
  void *v9;
  _ICContactRecord *v10;

  v4 = a3;
  objc_msgSend(a1, "contactFromPortraitContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "contactChangeTypeForPortraitChangeType:", objc_msgSend(v4, "changeType"));
  v7 = objc_msgSend(a1, "contactSourceTypeForPortraitSourceType:", objc_msgSend(v4, "source"));
  v8 = [_ICContactRecord alloc];
  objc_msgSend(v4, "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_ICContactRecord initWithIdentifier:contact:changeType:source:](v8, "initWithIdentifier:contact:changeType:source:", v9, v5, v6, v7);
  return v10;
}

+ (id)contactFromPortraitContact:(id)a3
{
  id v3;
  _ICContact *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  _ICContact *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a3;
  v4 = [_ICContact alloc];
  objc_msgSend(v3, "firstName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneticFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "middleName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneticMiddleName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneticLastName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "organizationName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jobTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relatedNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streetNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cityNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "score");
  v12 = v11;

  v16 = -[_ICContact initWithFirstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relations:streets:cities:score:](v4, "initWithFirstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relations:streets:cities:score:", v21, v5, v20, v19, v18, v17, v12, v15, v14, v6, v8, v9, v10);
  return v16;
}

+ (unsigned)contactChangeTypeForPortraitChangeType:(unsigned __int8)a3
{
  if (a3 >= 4u)
    return 0;
  else
    return a3;
}

+ (unsigned)contactSourceTypeForPortraitSourceType:(unsigned __int8)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (id)acceptedSourceBundleIds
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BE71B60];
  v8[0] = *MEMORY[0x24BE71B78];
  v8[1] = v3;
  v4 = *MEMORY[0x24BE71B68];
  v8[2] = *MEMORY[0x24BE71B70];
  v8[3] = v4;
  v8[4] = *MEMORY[0x24BE71B58];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)acceptedAlgorithms
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24EF761F8);
}

+ (id)excludedAlgorithms
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i != 18; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[_ICPortraitUtilities acceptedAlgorithms](_ICPortraitUtilities, "acceptedAlgorithms", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v2, "removeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_msgSend(v2, "copy");
  return v10;
}

+ (id)namedEntityRecordFromPortraitNamedEntityRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  _ICNamedEntityRecord *v17;
  void *v18;
  void *v19;
  _ICNamedEntityRecord *v20;
  NSObject *v21;
  _ICNamedEntityRecord *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = a3;
  if ((isTransientLexiconIngestionV2Enabled() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:toDate:options:", 16, v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "day");

    +[_ICPortraitUtilities acceptedSourceBundleIds](_ICPortraitUtilities, "acceptedSourceBundleIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", v12))
    {
      +[_ICPortraitUtilities acceptedAlgorithms](_ICPortraitUtilities, "acceptedAlgorithms");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "algorithm"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "containsObject:", v14);
      if (v9 < 8)
        v16 = v15;
      else
        v16 = 0;

    }
    else
    {
      v16 = 0;
    }

    _ICPersNamedEntityOSLogFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[_ICPortraitUtilities namedEntityRecordFromPortraitNamedEntityRecord:].cold.1(v3, v21);

    v22 = [_ICNamedEntityRecord alloc];
    objc_msgSend(v3, "entity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceReferenceDate");
    v20 = -[_ICNamedEntityRecord initWithName:timestamp:passesFilters:](v22, "initWithName:timestamp:passesFilters:", v24, v16);

  }
  else
  {
    v17 = [_ICNamedEntityRecord alloc];
    objc_msgSend(v3, "entity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_ICNamedEntityRecord initWithName:](v17, "initWithName:", v19);

  }
  return v20;
}

+ (id)filteredNamedEntitiesFromJSONDonations:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  id obj;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v3;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("namedEntities"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            continue;
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("namedEntities"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("date"));
          v16 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)objc_opt_new();
          objc_msgSend(v17, "setFormatOptions:", 1907);
          objc_msgSend(v17, "dateFromString:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          v35 = v17;
          v36 = (void *)v16;
          if (v18)
          {
            v20 = v18;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          v21 = v20;

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("algorithm"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 1;
          while (1)
          {
            objc_msgSend(MEMORY[0x24BE71B10], "describeAlgorithm:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v22, "isEqualToString:", v24);

            if ((v25 & 1) != 0)
              break;
            if (++v23 == 18)
            {
              v23 = 0;
              break;
            }
          }
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71B00]), "initWithName:category:language:", v6, 0, CFSTR("en_US"));
          v27 = v21;
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71B48]), "initWithBundleId:groupId:documentId:date:", v7, &stru_24EF71F58, &stru_24EF71F58, v21);
          v29 = objc_alloc_init(MEMORY[0x24BE71AF8]);
          objc_msgSend(v29, "setEntity:", v26);
          objc_msgSend(v29, "setSource:", v28);
          objc_msgSend(v29, "setAlgorithm:", v23);
          objc_msgSend(a1, "namedEntityRecordFromPortraitNamedEntityRecord:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "passesFilters"))
            objc_msgSend(v32, "addObject:", v6);

        }
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v38);
  }

  return v32;
}

+ (void)namedEntityRecordFromPortraitNamedEntityRecord:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "UTF8String");
  objc_msgSend(a1, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "algorithm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 136315650;
  v11 = v6;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_debug_impl(&dword_22716D000, a2, OS_LOG_TYPE_DEBUG, "Performed local filtering in InputContext on Portrait entity with name %s, %@, %@", (uint8_t *)&v10, 0x20u);

}

@end
