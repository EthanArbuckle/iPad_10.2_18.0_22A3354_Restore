@implementation EDAMNotebookRestrictions

+ (id)structName
{
  return CFSTR("NotebookRestrictions");
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
  _QWORD v28[24];

  v28[22] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1864;
  if (!structFields_structFields_1864)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("noReadNotes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v27;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("noCreateNotes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v26;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("noUpdateNotes"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v25;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("noExpungeNotes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v24;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("noShareNotes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("noEmailNotes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 1, CFSTR("noSendMessageToRecipients"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[6] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("noUpdateNotebook"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[7] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 2, 1, CFSTR("noExpungeNotebook"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[8] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 2, 1, CFSTR("noSetDefaultNotebook"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[9] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 2, 1, CFSTR("noSetNotebookStack"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[10] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 2, 1, CFSTR("noPublishToPublic"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[11] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 2, 1, CFSTR("noPublishToBusinessLibrary"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v28[12] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 2, 1, CFSTR("noCreateTags"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28[13] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 15, 2, 1, CFSTR("noUpdateTags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[14] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 16, 2, 1, CFSTR("noExpungeTags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[15] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 17, 2, 1, CFSTR("noSetParentTag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[16] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 18, 2, 1, CFSTR("noCreateSharedNotebooks"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[17] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 19, 8, 1, CFSTR("updateWhichSharedNotebookRestrictions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[18] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 20, 8, 1, CFSTR("expungeWhichSharedNotebookRestrictions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[19] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 21, 2, 1, CFSTR("noShareNotesWithBusiness"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[20] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 22, 2, 1, CFSTR("noRenameNotebook"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[21] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 22);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_1864;
    structFields_structFields_1864 = v13;

    v2 = (void *)structFields_structFields_1864;
  }
  return v2;
}

- (NSNumber)noReadNotes
{
  return self->_noReadNotes;
}

- (void)setNoReadNotes:(id)a3
{
  objc_storeStrong((id *)&self->_noReadNotes, a3);
}

- (NSNumber)noCreateNotes
{
  return self->_noCreateNotes;
}

- (void)setNoCreateNotes:(id)a3
{
  objc_storeStrong((id *)&self->_noCreateNotes, a3);
}

- (NSNumber)noUpdateNotes
{
  return self->_noUpdateNotes;
}

- (void)setNoUpdateNotes:(id)a3
{
  objc_storeStrong((id *)&self->_noUpdateNotes, a3);
}

- (NSNumber)noExpungeNotes
{
  return self->_noExpungeNotes;
}

- (void)setNoExpungeNotes:(id)a3
{
  objc_storeStrong((id *)&self->_noExpungeNotes, a3);
}

- (NSNumber)noShareNotes
{
  return self->_noShareNotes;
}

- (void)setNoShareNotes:(id)a3
{
  objc_storeStrong((id *)&self->_noShareNotes, a3);
}

- (NSNumber)noEmailNotes
{
  return self->_noEmailNotes;
}

- (void)setNoEmailNotes:(id)a3
{
  objc_storeStrong((id *)&self->_noEmailNotes, a3);
}

- (NSNumber)noSendMessageToRecipients
{
  return self->_noSendMessageToRecipients;
}

- (void)setNoSendMessageToRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_noSendMessageToRecipients, a3);
}

- (NSNumber)noUpdateNotebook
{
  return self->_noUpdateNotebook;
}

- (void)setNoUpdateNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_noUpdateNotebook, a3);
}

- (NSNumber)noExpungeNotebook
{
  return self->_noExpungeNotebook;
}

- (void)setNoExpungeNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_noExpungeNotebook, a3);
}

- (NSNumber)noSetDefaultNotebook
{
  return self->_noSetDefaultNotebook;
}

- (void)setNoSetDefaultNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_noSetDefaultNotebook, a3);
}

- (NSNumber)noSetNotebookStack
{
  return self->_noSetNotebookStack;
}

- (void)setNoSetNotebookStack:(id)a3
{
  objc_storeStrong((id *)&self->_noSetNotebookStack, a3);
}

- (NSNumber)noPublishToPublic
{
  return self->_noPublishToPublic;
}

- (void)setNoPublishToPublic:(id)a3
{
  objc_storeStrong((id *)&self->_noPublishToPublic, a3);
}

- (NSNumber)noPublishToBusinessLibrary
{
  return self->_noPublishToBusinessLibrary;
}

- (void)setNoPublishToBusinessLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_noPublishToBusinessLibrary, a3);
}

- (NSNumber)noCreateTags
{
  return self->_noCreateTags;
}

- (void)setNoCreateTags:(id)a3
{
  objc_storeStrong((id *)&self->_noCreateTags, a3);
}

- (NSNumber)noUpdateTags
{
  return self->_noUpdateTags;
}

- (void)setNoUpdateTags:(id)a3
{
  objc_storeStrong((id *)&self->_noUpdateTags, a3);
}

- (NSNumber)noExpungeTags
{
  return self->_noExpungeTags;
}

- (void)setNoExpungeTags:(id)a3
{
  objc_storeStrong((id *)&self->_noExpungeTags, a3);
}

- (NSNumber)noSetParentTag
{
  return self->_noSetParentTag;
}

- (void)setNoSetParentTag:(id)a3
{
  objc_storeStrong((id *)&self->_noSetParentTag, a3);
}

- (NSNumber)noCreateSharedNotebooks
{
  return self->_noCreateSharedNotebooks;
}

- (void)setNoCreateSharedNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_noCreateSharedNotebooks, a3);
}

- (NSNumber)updateWhichSharedNotebookRestrictions
{
  return self->_updateWhichSharedNotebookRestrictions;
}

- (void)setUpdateWhichSharedNotebookRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_updateWhichSharedNotebookRestrictions, a3);
}

- (NSNumber)expungeWhichSharedNotebookRestrictions
{
  return self->_expungeWhichSharedNotebookRestrictions;
}

- (void)setExpungeWhichSharedNotebookRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_expungeWhichSharedNotebookRestrictions, a3);
}

- (NSNumber)noShareNotesWithBusiness
{
  return self->_noShareNotesWithBusiness;
}

- (void)setNoShareNotesWithBusiness:(id)a3
{
  objc_storeStrong((id *)&self->_noShareNotesWithBusiness, a3);
}

- (NSNumber)noRenameNotebook
{
  return self->_noRenameNotebook;
}

- (void)setNoRenameNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_noRenameNotebook, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noRenameNotebook, 0);
  objc_storeStrong((id *)&self->_noShareNotesWithBusiness, 0);
  objc_storeStrong((id *)&self->_expungeWhichSharedNotebookRestrictions, 0);
  objc_storeStrong((id *)&self->_updateWhichSharedNotebookRestrictions, 0);
  objc_storeStrong((id *)&self->_noCreateSharedNotebooks, 0);
  objc_storeStrong((id *)&self->_noSetParentTag, 0);
  objc_storeStrong((id *)&self->_noExpungeTags, 0);
  objc_storeStrong((id *)&self->_noUpdateTags, 0);
  objc_storeStrong((id *)&self->_noCreateTags, 0);
  objc_storeStrong((id *)&self->_noPublishToBusinessLibrary, 0);
  objc_storeStrong((id *)&self->_noPublishToPublic, 0);
  objc_storeStrong((id *)&self->_noSetNotebookStack, 0);
  objc_storeStrong((id *)&self->_noSetDefaultNotebook, 0);
  objc_storeStrong((id *)&self->_noExpungeNotebook, 0);
  objc_storeStrong((id *)&self->_noUpdateNotebook, 0);
  objc_storeStrong((id *)&self->_noSendMessageToRecipients, 0);
  objc_storeStrong((id *)&self->_noEmailNotes, 0);
  objc_storeStrong((id *)&self->_noShareNotes, 0);
  objc_storeStrong((id *)&self->_noExpungeNotes, 0);
  objc_storeStrong((id *)&self->_noUpdateNotes, 0);
  objc_storeStrong((id *)&self->_noCreateNotes, 0);
  objc_storeStrong((id *)&self->_noReadNotes, 0);
}

@end
