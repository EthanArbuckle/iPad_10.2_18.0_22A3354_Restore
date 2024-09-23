@implementation MPSectionedIdentifierListTailEntry

+ (id)tailEntryWithSectionHeadEntry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[MPSectionedIdentifierListEntryPositionKey positionKeyWithDeviceIdentifier:generation:](MPSectionedIdentifierListEntryPositionKey, "positionKeyWithDeviceIdentifier:generation:", &stru_1E3163D10, CFSTR("1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)objc_msgSend(v5, "initWithPositionKey:sectionIdentifier:", v6, v7);

  objc_storeWeak(v8 + 8, v4);
  return v8;
}

- (int64_t)entryType
{
  return 4;
}

- (void)setSectionHeadEntry:(id)a3
{
  objc_storeWeak((id *)&self->_sectionHeadEntry, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sectionHeadEntry);
}

- (id)previousEntry
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionHeadEntry);
  objc_msgSend(WeakRetained, "lastItemEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "nextEntries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      do
      {
        objc_msgSend(v5, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "nextEntries");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v8;
        v5 = v9;
      }
      while (v10);
      goto LABEL_9;
    }
LABEL_8:
    v9 = v5;
    v8 = v6;
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "nextEntries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "msv_suffixFromIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = WeakRetained;
  objc_msgSend(v5, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_8;
  do
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "nextEntries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v8;
    v5 = v9;
  }
  while (v13);
LABEL_9:

  return v8;
}

- (MPSectionedIdentifierListHeadEntry)sectionHeadEntry
{
  return (MPSectionedIdentifierListHeadEntry *)objc_loadWeakRetained((id *)&self->_sectionHeadEntry);
}

@end
