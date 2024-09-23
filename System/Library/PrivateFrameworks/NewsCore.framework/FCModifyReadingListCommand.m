@implementation FCModifyReadingListCommand

- (FCModifyReadingListCommand)initWithReadingListEntries:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  FCModifyReadingListCommand *v7;

  v4 = a4;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_140);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v6, v4);

  return v7;
}

id __63__FCModifyReadingListCommand_initWithReadingListEntries_merge___block_invoke(uint64_t a1, _QWORD *a2)
{
  return -[FCReadingListEntry asCKRecord](a2);
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);
  if (v9 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("dateAdded"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("articleID"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("origin"));

  }
  return v9 == 1;
}

@end
