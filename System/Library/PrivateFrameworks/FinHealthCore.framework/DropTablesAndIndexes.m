@implementation DropTablesAndIndexes

void __DropTablesAndIndexes_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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

  v14 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("fh_schema"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("transactions"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("transaction_features"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_deterministic_realtime"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_prediction_labels"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_compound_realtime"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_predicted_realtime"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("features_merchant"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_detailed_category"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("features_datetime"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("features_amount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_heuristics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("features_events"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_instrumentation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("fh_processing_history"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_peer_payments"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("features_insight_trends"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("fh_account_information"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("fh_grouping"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"), CFSTR("fts_transactions"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop trigger %@;"), CFSTR("transactions_au"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop trigger %@;"), CFSTR("transactions_ai"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop trigger %@;"), CFSTR("transactions_bd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop trigger %@;"), CFSTR("transactions_bu"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drop table if exists %@;"),
    CFSTR("fh_card_recurring_predictions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithObjects:", v27, v26, v25, v23, v24, v21, v22, v20, v13, v19, v12, v11, v10, v18, v17, v16, v15,
    v9,
    v8,
    v0,
    v1,
    v2,
    v3,
    v4,
    v5,
    0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)DropTablesAndIndexes__ddlDropTables;
  DropTablesAndIndexes__ddlDropTables = v6;

}

@end
