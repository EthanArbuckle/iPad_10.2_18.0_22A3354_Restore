@implementation EDAMSyncChunkFilter

+ (id)structName
{
  return CFSTR("SyncChunkFilter");
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
  _QWORD v27[22];

  v27[20] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_255;
  if (!structFields_structFields_255)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("includeNotes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v26;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("includeNoteResources"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v25;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("includeNoteAttributes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v24;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("includeNotebooks"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("includeTags"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("includeSearches"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 1, CFSTR("includeResources"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[6] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("includeLinkedNotebooks"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[7] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 2, 1, CFSTR("includeExpunged"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[8] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 2, 1, CFSTR("includeNoteApplicationDataFullMap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[9] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 2, 1, CFSTR("includeResourceApplicationDataFullMap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[10] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 2, 1, CFSTR("includeNoteResourceApplicationDataFullMap"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v27[11] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 2, 1, CFSTR("includePreferences"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27[12] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 17, 2, 1, CFSTR("includeSharedNotes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[13] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 18, 2, 1, CFSTR("includeNotesSharedWithMe"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[14] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 20, 2, 1, CFSTR("includeLinkedAccounts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[15] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 16, 2, 1, CFSTR("omitSharedNotebooks"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[16] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 11, 1, CFSTR("requireNoteContentClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[17] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 15, 14, 1, CFSTR("notebookGuids"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[18] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 19, 8, 1, CFSTR("inAccountUserId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[19] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 20);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_255;
    structFields_structFields_255 = v13;

    v2 = (void *)structFields_structFields_255;
  }
  return v2;
}

- (NSNumber)includeNotes
{
  return self->_includeNotes;
}

- (void)setIncludeNotes:(id)a3
{
  objc_storeStrong((id *)&self->_includeNotes, a3);
}

- (NSNumber)includeNoteResources
{
  return self->_includeNoteResources;
}

- (void)setIncludeNoteResources:(id)a3
{
  objc_storeStrong((id *)&self->_includeNoteResources, a3);
}

- (NSNumber)includeNoteAttributes
{
  return self->_includeNoteAttributes;
}

- (void)setIncludeNoteAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_includeNoteAttributes, a3);
}

- (NSNumber)includeNotebooks
{
  return self->_includeNotebooks;
}

- (void)setIncludeNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_includeNotebooks, a3);
}

- (NSNumber)includeTags
{
  return self->_includeTags;
}

- (void)setIncludeTags:(id)a3
{
  objc_storeStrong((id *)&self->_includeTags, a3);
}

- (NSNumber)includeSearches
{
  return self->_includeSearches;
}

- (void)setIncludeSearches:(id)a3
{
  objc_storeStrong((id *)&self->_includeSearches, a3);
}

- (NSNumber)includeResources
{
  return self->_includeResources;
}

- (void)setIncludeResources:(id)a3
{
  objc_storeStrong((id *)&self->_includeResources, a3);
}

- (NSNumber)includeLinkedNotebooks
{
  return self->_includeLinkedNotebooks;
}

- (void)setIncludeLinkedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_includeLinkedNotebooks, a3);
}

- (NSNumber)includeExpunged
{
  return self->_includeExpunged;
}

- (void)setIncludeExpunged:(id)a3
{
  objc_storeStrong((id *)&self->_includeExpunged, a3);
}

- (NSNumber)includeNoteApplicationDataFullMap
{
  return self->_includeNoteApplicationDataFullMap;
}

- (void)setIncludeNoteApplicationDataFullMap:(id)a3
{
  objc_storeStrong((id *)&self->_includeNoteApplicationDataFullMap, a3);
}

- (NSNumber)includeResourceApplicationDataFullMap
{
  return self->_includeResourceApplicationDataFullMap;
}

- (void)setIncludeResourceApplicationDataFullMap:(id)a3
{
  objc_storeStrong((id *)&self->_includeResourceApplicationDataFullMap, a3);
}

- (NSNumber)includeNoteResourceApplicationDataFullMap
{
  return self->_includeNoteResourceApplicationDataFullMap;
}

- (void)setIncludeNoteResourceApplicationDataFullMap:(id)a3
{
  objc_storeStrong((id *)&self->_includeNoteResourceApplicationDataFullMap, a3);
}

- (NSNumber)includePreferences
{
  return self->_includePreferences;
}

- (void)setIncludePreferences:(id)a3
{
  objc_storeStrong((id *)&self->_includePreferences, a3);
}

- (NSNumber)includeSharedNotes
{
  return self->_includeSharedNotes;
}

- (void)setIncludeSharedNotes:(id)a3
{
  objc_storeStrong((id *)&self->_includeSharedNotes, a3);
}

- (NSNumber)includeNotesSharedWithMe
{
  return self->_includeNotesSharedWithMe;
}

- (void)setIncludeNotesSharedWithMe:(id)a3
{
  objc_storeStrong((id *)&self->_includeNotesSharedWithMe, a3);
}

- (NSNumber)includeLinkedAccounts
{
  return self->_includeLinkedAccounts;
}

- (void)setIncludeLinkedAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_includeLinkedAccounts, a3);
}

- (NSNumber)omitSharedNotebooks
{
  return self->_omitSharedNotebooks;
}

- (void)setOmitSharedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_omitSharedNotebooks, a3);
}

- (NSString)requireNoteContentClass
{
  return self->_requireNoteContentClass;
}

- (void)setRequireNoteContentClass:(id)a3
{
  objc_storeStrong((id *)&self->_requireNoteContentClass, a3);
}

- (NSSet)notebookGuids
{
  return self->_notebookGuids;
}

- (void)setNotebookGuids:(id)a3
{
  objc_storeStrong((id *)&self->_notebookGuids, a3);
}

- (NSNumber)inAccountUserId
{
  return self->_inAccountUserId;
}

- (void)setInAccountUserId:(id)a3
{
  objc_storeStrong((id *)&self->_inAccountUserId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inAccountUserId, 0);
  objc_storeStrong((id *)&self->_notebookGuids, 0);
  objc_storeStrong((id *)&self->_requireNoteContentClass, 0);
  objc_storeStrong((id *)&self->_omitSharedNotebooks, 0);
  objc_storeStrong((id *)&self->_includeLinkedAccounts, 0);
  objc_storeStrong((id *)&self->_includeNotesSharedWithMe, 0);
  objc_storeStrong((id *)&self->_includeSharedNotes, 0);
  objc_storeStrong((id *)&self->_includePreferences, 0);
  objc_storeStrong((id *)&self->_includeNoteResourceApplicationDataFullMap, 0);
  objc_storeStrong((id *)&self->_includeResourceApplicationDataFullMap, 0);
  objc_storeStrong((id *)&self->_includeNoteApplicationDataFullMap, 0);
  objc_storeStrong((id *)&self->_includeExpunged, 0);
  objc_storeStrong((id *)&self->_includeLinkedNotebooks, 0);
  objc_storeStrong((id *)&self->_includeResources, 0);
  objc_storeStrong((id *)&self->_includeSearches, 0);
  objc_storeStrong((id *)&self->_includeTags, 0);
  objc_storeStrong((id *)&self->_includeNotebooks, 0);
  objc_storeStrong((id *)&self->_includeNoteAttributes, 0);
  objc_storeStrong((id *)&self->_includeNoteResources, 0);
  objc_storeStrong((id *)&self->_includeNotes, 0);
}

@end
