@implementation EDSearchableMessagesIndexReindexTypeUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("DROP INDEX IF EXISTS searchable_messages_message_id_reindex_type_index;"),
         CFSTR("Unable to drop index searchable_messages_message_id_reindex_type_index index to searchable_messages"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("reindex_type"));
  objc_msgSend(v5, "notEqualTo:", &unk_1E94E4A60);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFF8]), "initWithTableName:columnNames:where:unique:", CFSTR("searchable_messages"), &unk_1E94E5608, v6, 0);
  objc_msgSend(v7, "definitionWithDatabaseName:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "executeStatementString:errorMessage:", v8, CFSTR("Unable to add index searchable_messages_reindex_type_message_id_index to searchable_messages"));

  return v4 ^ 1;
}

@end
