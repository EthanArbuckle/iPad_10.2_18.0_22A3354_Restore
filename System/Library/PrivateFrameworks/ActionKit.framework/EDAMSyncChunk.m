@implementation EDAMSyncChunk

+ (id)structName
{
  return CFSTR("SyncChunk");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[20];

  v38[18] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_134;
  if (!structFields_structFields_134)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 0, CFSTR("currentTime"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v37;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("chunkHighUSN"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v36;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("updateCount"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v35;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("notes"), v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v33;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 5, 15, 1, CFSTR("notebooks"), v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v31;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 6, 15, 1, CFSTR("tags"), v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[5] = v29;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 7, 15, 1, CFSTR("searches"), v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[6] = v27;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 8, 15, 1, CFSTR("resources"), v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[7] = v25;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 9, 15, 1, CFSTR("expungedNotes"), v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[8] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 10, 15, 1, CFSTR("expungedNotebooks"), v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[9] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 11, 15, 1, CFSTR("expungedTags"), v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[10] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 12, 15, 1, CFSTR("expungedSearches"), v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[11] = v17;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 13, 15, 1, CFSTR("linkedNotebooks"), v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v38[12] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 14, 15, 1, CFSTR("expungedLinkedNotebooks"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v38[13] = v5;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 15, 12, 1, CFSTR("preferences"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v38[14] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 16, 15, 1, CFSTR("notesNoLongerSharedWithMe"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38[15] = v8;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 17, 15, 1, CFSTR("linkedAccounts"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[16] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 18, 15, 1, CFSTR("expungedLinkedAccounts"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[17] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 18);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_134;
    structFields_structFields_134 = v13;

    v2 = (void *)structFields_structFields_134;
  }
  return v2;
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (NSNumber)chunkHighUSN
{
  return self->_chunkHighUSN;
}

- (void)setChunkHighUSN:(id)a3
{
  objc_storeStrong((id *)&self->_chunkHighUSN, a3);
}

- (NSNumber)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(id)a3
{
  objc_storeStrong((id *)&self->_updateCount, a3);
}

- (NSArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSArray)notebooks
{
  return self->_notebooks;
}

- (void)setNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_notebooks, a3);
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (NSArray)searches
{
  return self->_searches;
}

- (void)setSearches:(id)a3
{
  objc_storeStrong((id *)&self->_searches, a3);
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (NSArray)expungedNotes
{
  return self->_expungedNotes;
}

- (void)setExpungedNotes:(id)a3
{
  objc_storeStrong((id *)&self->_expungedNotes, a3);
}

- (NSArray)expungedNotebooks
{
  return self->_expungedNotebooks;
}

- (void)setExpungedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_expungedNotebooks, a3);
}

- (NSArray)expungedTags
{
  return self->_expungedTags;
}

- (void)setExpungedTags:(id)a3
{
  objc_storeStrong((id *)&self->_expungedTags, a3);
}

- (NSArray)expungedSearches
{
  return self->_expungedSearches;
}

- (void)setExpungedSearches:(id)a3
{
  objc_storeStrong((id *)&self->_expungedSearches, a3);
}

- (NSArray)linkedNotebooks
{
  return self->_linkedNotebooks;
}

- (void)setLinkedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_linkedNotebooks, a3);
}

- (NSArray)expungedLinkedNotebooks
{
  return self->_expungedLinkedNotebooks;
}

- (void)setExpungedLinkedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_expungedLinkedNotebooks, a3);
}

- (EDAMPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (NSArray)notesNoLongerSharedWithMe
{
  return self->_notesNoLongerSharedWithMe;
}

- (void)setNotesNoLongerSharedWithMe:(id)a3
{
  objc_storeStrong((id *)&self->_notesNoLongerSharedWithMe, a3);
}

- (NSArray)linkedAccounts
{
  return self->_linkedAccounts;
}

- (void)setLinkedAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_linkedAccounts, a3);
}

- (NSArray)expungedLinkedAccounts
{
  return self->_expungedLinkedAccounts;
}

- (void)setExpungedLinkedAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_expungedLinkedAccounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expungedLinkedAccounts, 0);
  objc_storeStrong((id *)&self->_linkedAccounts, 0);
  objc_storeStrong((id *)&self->_notesNoLongerSharedWithMe, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_expungedLinkedNotebooks, 0);
  objc_storeStrong((id *)&self->_linkedNotebooks, 0);
  objc_storeStrong((id *)&self->_expungedSearches, 0);
  objc_storeStrong((id *)&self->_expungedTags, 0);
  objc_storeStrong((id *)&self->_expungedNotebooks, 0);
  objc_storeStrong((id *)&self->_expungedNotes, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_searches, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_notebooks, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_updateCount, 0);
  objc_storeStrong((id *)&self->_chunkHighUSN, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

@end
