@implementation EDAMNoteFilter

+ (id)structName
{
  return CFSTR("NoteFilter");
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
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[11];

  v17[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_402;
  if (!structFields_structFields_402)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("order"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("ascending"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("words"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("notebookGuid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 5, 15, 1, CFSTR("tagGuids"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("timeZone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 1, CFSTR("inactive"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 11, 1, CFSTR("emphasized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 2, 1, CFSTR("includeAllReadableNotebooks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 11, 1, CFSTR("context"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 10);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_402;
    structFields_structFields_402 = v12;

    v2 = (void *)structFields_structFields_402;
  }
  return v2;
}

- (NSNumber)order
{
  return self->_order;
}

- (void)setOrder:(id)a3
{
  objc_storeStrong((id *)&self->_order, a3);
}

- (NSNumber)ascending
{
  return self->_ascending;
}

- (void)setAscending:(id)a3
{
  objc_storeStrong((id *)&self->_ascending, a3);
}

- (NSString)words
{
  return self->_words;
}

- (void)setWords:(id)a3
{
  objc_storeStrong((id *)&self->_words, a3);
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (void)setNotebookGuid:(id)a3
{
  objc_storeStrong((id *)&self->_notebookGuid, a3);
}

- (NSArray)tagGuids
{
  return self->_tagGuids;
}

- (void)setTagGuids:(id)a3
{
  objc_storeStrong((id *)&self->_tagGuids, a3);
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSNumber)inactive
{
  return self->_inactive;
}

- (void)setInactive:(id)a3
{
  objc_storeStrong((id *)&self->_inactive, a3);
}

- (NSString)emphasized
{
  return self->_emphasized;
}

- (void)setEmphasized:(id)a3
{
  objc_storeStrong((id *)&self->_emphasized, a3);
}

- (NSNumber)includeAllReadableNotebooks
{
  return self->_includeAllReadableNotebooks;
}

- (void)setIncludeAllReadableNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_includeAllReadableNotebooks, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_includeAllReadableNotebooks, 0);
  objc_storeStrong((id *)&self->_emphasized, 0);
  objc_storeStrong((id *)&self->_inactive, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_tagGuids, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_ascending, 0);
  objc_storeStrong((id *)&self->_order, 0);
}

@end
