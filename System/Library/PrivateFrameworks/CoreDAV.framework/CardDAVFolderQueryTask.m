@implementation CardDAVFolderQueryTask

- (CardDAVFolderQueryTask)initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6
{
  id *v6;
  CardDAVFolderQueryTask *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CardDAVFolderQueryTask;
  v6 = -[CoreDAVContainerQueryTask _initWithSearchTerms:searchLimit:atURL:appSpecificDataItemClass:](&v9, sel__initWithSearchTerms_searchLimit_atURL_appSpecificDataItemClass_, a3, a4, a5, a6);
  v7 = (CardDAVFolderQueryTask *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 39, CFSTR("urn:ietf:params:xml:ns:carddav"));
    objc_storeStrong((id *)&v7->super._appSpecificQueryCommand, CFSTR("addressbook-query"));
    objc_storeStrong((id *)&v7->super._appSpecificDataProp, CFSTR("address-data"));
  }
  return v7;
}

- (void)addFiltersToXMLData:(id)a3
{
  id v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  CardDAVFolderQueryTask *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = CFSTR("urn:ietf:params:xml:ns:carddav");
  objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("anyof"), 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("NICKNAME"), CFSTR("FN"), CFSTR("EMAIL"), CFSTR("ADR"), CFSTR("IMPP"), CFSTR("ORG"), CFSTR("TEL"), 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v26;
    v18 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v20 = v6;
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v6);
        v7 = v4;
        v8 = v5;
        objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop-filter"), v5, CFSTR("name"), v15, CFSTR("test"), CFSTR("allof"), 0);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v9 = self->super._searchTerms;
        v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v7, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("text-match"), v8, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), CFSTR("collation"), CFSTR("i;unicode-casemap"),
                CFSTR("match-type"),
                CFSTR("contains"),
                0);
            }
            v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v11);
        }

        v4 = v7;
        v5 = v8;
        objc_msgSend(v7, "endElement:inNamespace:", CFSTR("prop-filter"), v8);
        v6 = v20 + 1;
        self = v18;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }

  objc_msgSend(v4, "endElement:inNamespace:", CFSTR("filter"), v5);
  if (self->super._searchLimit)
  {
    objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("limit"), v5, 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), self->super._searchLimit);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("nresults"), v5, v14, 0);

    objc_msgSend(v4, "endElement:inNamespace:", CFSTR("limit"), v5);
  }

}

@end
