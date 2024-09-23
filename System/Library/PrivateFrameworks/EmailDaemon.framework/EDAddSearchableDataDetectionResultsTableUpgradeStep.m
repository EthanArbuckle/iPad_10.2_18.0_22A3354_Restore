@implementation EDAddSearchableDataDetectionResultsTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  int v4;
  int v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE TABLE IF NOT EXISTS searchable_data_detection_results (ROWID INTEGER PRIMARY KEY, data_detection_result INTEGER, message INTEGER, transaction_id INTEGER NOT NULL);"),
         CFSTR("Creating searchable_data_detection_results table"));
  if (v4)
    v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", CFSTR("CREATE INDEX IF NOT EXISTS searchable_data_detection_results_message_index ON searchable_data_detection_results(message); CREATE INDEX searchable_data_detection_results_data_detection_result_index ON searchable_data_detection_results(data_detection_result);"),
           CFSTR("Unable to add searchable_data_detection_results_message_index"));
  v5 = v4 ^ 1;

  return v5;
}

@end
