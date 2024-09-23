@implementation EDAMNoteLockStatus

+ (id)structName
{
  return CFSTR("NoteLockStatus");
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
  _QWORD v16[8];

  v16[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1212;
  if (!structFields_structFields_1212)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("noteUpdateSequenceNumber"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("lockHolderUserId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 1, CFSTR("lockRenewBy"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("viewingUserIds"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("viewIdleExpiration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 6, 13, 1, CFSTR("unknownUsers"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[5] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("currentTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[6] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_1212;
    structFields_structFields_1212 = v12;

    v2 = (void *)structFields_structFields_1212;
  }
  return v2;
}

- (NSNumber)noteUpdateSequenceNumber
{
  return self->_noteUpdateSequenceNumber;
}

- (void)setNoteUpdateSequenceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_noteUpdateSequenceNumber, a3);
}

- (NSNumber)lockHolderUserId
{
  return self->_lockHolderUserId;
}

- (void)setLockHolderUserId:(id)a3
{
  objc_storeStrong((id *)&self->_lockHolderUserId, a3);
}

- (NSNumber)lockRenewBy
{
  return self->_lockRenewBy;
}

- (void)setLockRenewBy:(id)a3
{
  objc_storeStrong((id *)&self->_lockRenewBy, a3);
}

- (NSArray)viewingUserIds
{
  return self->_viewingUserIds;
}

- (void)setViewingUserIds:(id)a3
{
  objc_storeStrong((id *)&self->_viewingUserIds, a3);
}

- (NSNumber)viewIdleExpiration
{
  return self->_viewIdleExpiration;
}

- (void)setViewIdleExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_viewIdleExpiration, a3);
}

- (NSDictionary)unknownUsers
{
  return self->_unknownUsers;
}

- (void)setUnknownUsers:(id)a3
{
  objc_storeStrong((id *)&self->_unknownUsers, a3);
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTime, 0);
  objc_storeStrong((id *)&self->_unknownUsers, 0);
  objc_storeStrong((id *)&self->_viewIdleExpiration, 0);
  objc_storeStrong((id *)&self->_viewingUserIds, 0);
  objc_storeStrong((id *)&self->_lockRenewBy, 0);
  objc_storeStrong((id *)&self->_lockHolderUserId, 0);
  objc_storeStrong((id *)&self->_noteUpdateSequenceNumber, 0);
}

@end
