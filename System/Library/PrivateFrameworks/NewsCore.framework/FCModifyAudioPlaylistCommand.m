@implementation FCModifyAudioPlaylistCommand

- (FCModifyAudioPlaylistCommand)initWithItems:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  FCModifyAudioPlaylistCommand *v7;

  v4 = a4;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_83);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v6, v4);

  return v7;
}

uint64_t __52__FCModifyAudioPlaylistCommand_initWithItems_merge___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
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
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("articleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("articleID"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("dateAdded"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("order"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("order"));

  }
  return v9 == 1;
}

@end
