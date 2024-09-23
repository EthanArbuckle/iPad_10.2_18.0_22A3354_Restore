@implementation EDAMClientSyncRateConfig

+ (id)structName
{
  return CFSTR("ClientSyncRateConfig");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields;
  if (!structFields_structFields)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 1, CFSTR("syncStateIntervalMillis"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 10, 1, CFSTR("updateNoteWhenIdleForMillis"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 1, CFSTR("updateNoteDuringEditIntervalMillis"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields;
    structFields_structFields = v6;

    v2 = (void *)structFields_structFields;
  }
  return v2;
}

- (NSNumber)syncStateIntervalMillis
{
  return self->_syncStateIntervalMillis;
}

- (void)setSyncStateIntervalMillis:(id)a3
{
  objc_storeStrong((id *)&self->_syncStateIntervalMillis, a3);
}

- (NSNumber)updateNoteWhenIdleForMillis
{
  return self->_updateNoteWhenIdleForMillis;
}

- (void)setUpdateNoteWhenIdleForMillis:(id)a3
{
  objc_storeStrong((id *)&self->_updateNoteWhenIdleForMillis, a3);
}

- (NSNumber)updateNoteDuringEditIntervalMillis
{
  return self->_updateNoteDuringEditIntervalMillis;
}

- (void)setUpdateNoteDuringEditIntervalMillis:(id)a3
{
  objc_storeStrong((id *)&self->_updateNoteDuringEditIntervalMillis, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateNoteDuringEditIntervalMillis, 0);
  objc_storeStrong((id *)&self->_updateNoteWhenIdleForMillis, 0);
  objc_storeStrong((id *)&self->_syncStateIntervalMillis, 0);
}

@end
