@implementation EDAMAccountLimits

+ (id)structName
{
  return CFSTR("AccountLimits");
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
  _QWORD v19[14];

  v19[13] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_557;
  if (!structFields_structFields_557)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("userMailLimitDaily"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 10, 1, CFSTR("noteSizeMax"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 1, CFSTR("resourceSizeMax"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 1, CFSTR("userLinkedNotebookMax"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 10, 1, CFSTR("uploadLimit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 8, 1, CFSTR("userNoteCountMax"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[5] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 8, 1, CFSTR("userNotebookCountMax"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[6] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 8, 1, CFSTR("userTagCountMax"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[7] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 8, 1, CFSTR("noteTagCountMax"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[8] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 8, 1, CFSTR("userSavedSearchesMax"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[9] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 8, 1, CFSTR("noteResourceCountMax"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[10] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 8, 1, CFSTR("userDeviceLimit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[11] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 8, 1, CFSTR("userAdvertisedDeviceLimit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[12] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 13);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_557;
    structFields_structFields_557 = v13;

    v2 = (void *)structFields_structFields_557;
  }
  return v2;
}

- (NSNumber)userMailLimitDaily
{
  return self->_userMailLimitDaily;
}

- (void)setUserMailLimitDaily:(id)a3
{
  objc_storeStrong((id *)&self->_userMailLimitDaily, a3);
}

- (NSNumber)noteSizeMax
{
  return self->_noteSizeMax;
}

- (void)setNoteSizeMax:(id)a3
{
  objc_storeStrong((id *)&self->_noteSizeMax, a3);
}

- (NSNumber)resourceSizeMax
{
  return self->_resourceSizeMax;
}

- (void)setResourceSizeMax:(id)a3
{
  objc_storeStrong((id *)&self->_resourceSizeMax, a3);
}

- (NSNumber)userLinkedNotebookMax
{
  return self->_userLinkedNotebookMax;
}

- (void)setUserLinkedNotebookMax:(id)a3
{
  objc_storeStrong((id *)&self->_userLinkedNotebookMax, a3);
}

- (NSNumber)uploadLimit
{
  return self->_uploadLimit;
}

- (void)setUploadLimit:(id)a3
{
  objc_storeStrong((id *)&self->_uploadLimit, a3);
}

- (NSNumber)userNoteCountMax
{
  return self->_userNoteCountMax;
}

- (void)setUserNoteCountMax:(id)a3
{
  objc_storeStrong((id *)&self->_userNoteCountMax, a3);
}

- (NSNumber)userNotebookCountMax
{
  return self->_userNotebookCountMax;
}

- (void)setUserNotebookCountMax:(id)a3
{
  objc_storeStrong((id *)&self->_userNotebookCountMax, a3);
}

- (NSNumber)userTagCountMax
{
  return self->_userTagCountMax;
}

- (void)setUserTagCountMax:(id)a3
{
  objc_storeStrong((id *)&self->_userTagCountMax, a3);
}

- (NSNumber)noteTagCountMax
{
  return self->_noteTagCountMax;
}

- (void)setNoteTagCountMax:(id)a3
{
  objc_storeStrong((id *)&self->_noteTagCountMax, a3);
}

- (NSNumber)userSavedSearchesMax
{
  return self->_userSavedSearchesMax;
}

- (void)setUserSavedSearchesMax:(id)a3
{
  objc_storeStrong((id *)&self->_userSavedSearchesMax, a3);
}

- (NSNumber)noteResourceCountMax
{
  return self->_noteResourceCountMax;
}

- (void)setNoteResourceCountMax:(id)a3
{
  objc_storeStrong((id *)&self->_noteResourceCountMax, a3);
}

- (NSNumber)userDeviceLimit
{
  return self->_userDeviceLimit;
}

- (void)setUserDeviceLimit:(id)a3
{
  objc_storeStrong((id *)&self->_userDeviceLimit, a3);
}

- (NSNumber)userAdvertisedDeviceLimit
{
  return self->_userAdvertisedDeviceLimit;
}

- (void)setUserAdvertisedDeviceLimit:(id)a3
{
  objc_storeStrong((id *)&self->_userAdvertisedDeviceLimit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAdvertisedDeviceLimit, 0);
  objc_storeStrong((id *)&self->_userDeviceLimit, 0);
  objc_storeStrong((id *)&self->_noteResourceCountMax, 0);
  objc_storeStrong((id *)&self->_userSavedSearchesMax, 0);
  objc_storeStrong((id *)&self->_noteTagCountMax, 0);
  objc_storeStrong((id *)&self->_userTagCountMax, 0);
  objc_storeStrong((id *)&self->_userNotebookCountMax, 0);
  objc_storeStrong((id *)&self->_userNoteCountMax, 0);
  objc_storeStrong((id *)&self->_uploadLimit, 0);
  objc_storeStrong((id *)&self->_userLinkedNotebookMax, 0);
  objc_storeStrong((id *)&self->_resourceSizeMax, 0);
  objc_storeStrong((id *)&self->_noteSizeMax, 0);
  objc_storeStrong((id *)&self->_userMailLimitDaily, 0);
}

@end
