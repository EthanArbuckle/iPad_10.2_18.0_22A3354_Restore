@implementation FCRemoveFromAudioPlaylistCommand

- (FCRemoveFromAudioPlaylistCommand)initWithItemID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FCRemoveFromAudioPlaylistCommand *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("AudioPlaylist"), *MEMORY[0x1E0C94730]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v5, v7);

  if (v8)
  {
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCRemoveRecordsCommand initWithRecordIDs:](self, "initWithRecordIDs:", v9);

  }
  else
  {
    v10 = -[FCRemoveRecordsCommand initWithRecordIDs:](self, "initWithRecordIDs:", MEMORY[0x1E0C9AA60]);
  }

  return v10;
}

- (FCRemoveFromAudioPlaylistCommand)initWithArticleID:(id)a3
{
  void *v4;
  FCRemoveFromAudioPlaylistCommand *v5;

  objc_msgSend(MEMORY[0x1E0D62650], "identifierFromArticleID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCRemoveFromAudioPlaylistCommand initWithItemID:](self, "initWithItemID:", v4);

  return v5;
}

@end
