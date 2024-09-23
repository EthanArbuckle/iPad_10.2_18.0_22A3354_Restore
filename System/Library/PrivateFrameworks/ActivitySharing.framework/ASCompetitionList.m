@implementation ASCompetitionList

- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[ASCompetitionList systemFieldsOnlyRecord](self, "systemFieldsOnlyRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (objc_msgSend(v7, "recordID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "zoneID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqual:", v6),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:zoneID:", CFSTR("ActivitySharingCompetitionList"), v6);

    v8 = (void *)v12;
  }
  _ASUpdateSchemaVersionOnRecord(1, v8, a4);
  -[ASCompetitionList codableCompetitionList](self, "codableCompetitionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encryptedValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("EncryptedData"));

  return v8;
}

+ (id)competitionListWithRecord:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  ASCodableCloudKitCompetitionList *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v3 = a3;
  if (_ASCloudKitSchemaVersionForRecord(v3) == 1)
  {
    objc_msgSend(v3, "encryptedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EncryptedData"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6)
    {
      v8 = -[ASCodableCloudKitCompetitionList initWithData:]([ASCodableCloudKitCompetitionList alloc], "initWithData:", v6);
      +[ASCompetitionList competitionListWithCodableCompetitionList:](ASCompetitionList, "competitionListWithCodableCompetitionList:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v3, "encodeSystemFieldsWithCoder:", v9);
      objc_msgSend(v9, "finishEncoding");
      v10 = objc_alloc(MEMORY[0x24BDD1620]);
      objc_msgSend(v9, "encodedData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v12 = (void *)objc_msgSend(v10, "initForReadingFromData:error:", v11, &v16);
      v13 = v16;

      if (v13)
      {
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
          +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.5();
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithCoder:", v12);
      objc_msgSend(v7, "setSystemFieldsOnlyRecord:", v14);

    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[ASCompetitionList(CloudKitCodingSupport) competitionListWithRecord:].cold.1();
      v7 = 0;
    }

  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[ASCompetitionList(CloudKitCodingSupport) competitionListWithRecord:].cold.3();
    v7 = 0;
  }

  return v7;
}

+ (id)competitionListWithCodableCompetitionList:(id)a3
{
  id v3;
  ASCompetitionList *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v4 = objc_alloc_init(ASCompetitionList);
  objc_msgSend(v3, "competitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_map:", &__block_literal_global_349);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionList setCompetitions:](v4, "setCompetitions:", v6);

  v7 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v3, "friendUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_UUIDWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionList setFriendUUID:](v4, "setFriendUUID:", v9);

  v10 = objc_msgSend(v3, "type");
  -[ASCompetitionList setType:](v4, "setType:", v10);
  return v4;
}

ASCompetition *__86__ASCompetitionList_CloudKitCodingSupport__competitionListWithCodableCompetitionList___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ASCompetition competitionWithCodableCompetition:](ASCompetition, "competitionWithCodableCompetition:", a2);
}

- (ASCodableCloudKitCompetitionList)codableCompetitionList
{
  ASCodableCloudKitCompetitionList *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(ASCodableCloudKitCompetitionList);
  -[ASCompetitionList competitions](self, "competitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_map:", &__block_literal_global_352);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[ASCodableCloudKitCompetitionList setCompetitions:](v3, "setCompetitions:", v6);

  -[ASCompetitionList friendUUID](self, "friendUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_dataForUUIDBytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitCompetitionList setFriendUUID:](v3, "setFriendUUID:", v8);

  -[ASCodableCloudKitCompetitionList setType:](v3, "setType:", -[ASCompetitionList type](self, "type"));
  return v3;
}

uint64_t __66__ASCompetitionList_CloudKitCodingSupport__codableCompetitionList__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableCompetition");
}

+ (id)competitionListFromCodableDatabaseCompetitionList:(id)a3 codableCompetitions:(id)a4 withType:(int64_t)a5
{
  id v7;
  id v8;
  ASCompetitionList *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(ASCompetitionList);
  v10 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v7, "friendUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_UUIDWithData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionList setFriendUUID:](v9, "setFriendUUID:", v12);

  -[ASCompetitionList setType:](v9, "setType:", a5);
  v13 = (objc_class *)objc_opt_class();
  v26 = v7;
  objc_msgSend(v7, "systemFieldsOnlyRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ASSecureUnarchiveClassWithData(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCompetitionList setSystemFieldsOnlyRecord:](v9, "setSystemFieldsOnlyRecord:", v15);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    v20 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v21 = 0;
      v22 = v20;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v21), "competition");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[ASCompetition competitionWithCodableCompetition:](ASCompetition, "competitionWithCodableCompetition:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "arrayByAddingObject:", v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        ++v21;
        v22 = v20;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }
  else
  {
    v20 = (void *)MEMORY[0x24BDBD1A8];
  }

  -[ASCompetitionList setCompetitions:](v9, "setCompetitions:", v20);
  return v9;
}

- (id)codableDatabaseCompetitionListEntryForOwner:(int64_t)a3
{
  ASCodableDatabaseCompetitionListEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(ASCodableDatabaseCompetitionListEntry);
  -[ASCompetitionList friendUUID](self, "friendUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_dataForUUIDBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableDatabaseCompetitionListEntry setFriendUUID:](v5, "setFriendUUID:", v7);

  -[ASCodableDatabaseCompetitionListEntry setType:](v5, "setType:", -[ASCompetitionList type](self, "type"));
  v8 = (void *)MEMORY[0x24BDD1618];
  -[ASCompetitionList systemFieldsOnlyRecord](self, "systemFieldsOnlyRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableDatabaseCompetitionListEntry setSystemFieldsOnlyRecord:](v5, "setSystemFieldsOnlyRecord:", v10);

  -[ASCodableDatabaseCompetitionListEntry setOwner:](v5, "setOwner:", a3);
  return v5;
}

- (ASCompetitionList)init
{
  ASCompetitionList *v2;
  ASCompetitionList *v3;
  NSArray *competitions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCompetitionList;
  v2 = -[ASCompetitionList init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    competitions = v2->_competitions;
    v2->_competitions = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
}

- (ASCompetitionList)initWithFriendUUID:(id)a3 type:(int64_t)a4
{
  id v7;
  ASCompetitionList *v8;
  ASCompetitionList *v9;

  v7 = a3;
  v8 = -[ASCompetitionList init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_friendUUID, a3);
    v9->_type = a4;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CompetitionList friendUUID=%@ type=%ld competitions=%@"), self->_friendUUID, self->_type, self->_competitions);
}

- (ASCompetition)currentCompetition
{
  NSObject *v3;

  if (-[NSArray count](self->_competitions, "count") >= 2)
  {
    ASLoggingInitialize();
    v3 = ASLogCompetitions;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
      -[ASCompetitionList currentCompetition].cold.1((uint64_t)self, v3);
  }
  -[NSArray lastObject](self->_competitions, "lastObject");
  return (ASCompetition *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setFriendUUID:", self->_friendUUID);
  objc_msgSend(v5, "setType:", self->_type);
  v6 = (void *)-[NSArray copyWithZone:](self->_competitions, "copyWithZone:", a3);
  objc_msgSend(v5, "setCompetitions:", v6);

  v7 = (void *)-[CKRecord copyWithZone:](self->_systemFieldsOnlyRecord, "copyWithZone:", a3);
  objc_msgSend(v5, "setSystemFieldsOnlyRecord:", v7);

  return v5;
}

- (NSArray)competitions
{
  return self->_competitions;
}

- (void)setCompetitions:(id)a3
{
  objc_storeStrong((id *)&self->_competitions, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (CKRecord)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
  objc_storeStrong((id *)&self->_competitions, 0);
}

- (void)currentCompetition
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21381F000, a2, OS_LOG_TYPE_ERROR, "Competition list contained an unexpected number of competitions, list: %@", (uint8_t *)&v2, 0xCu);
}

@end
