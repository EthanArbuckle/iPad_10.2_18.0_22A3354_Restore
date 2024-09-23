@implementation CreateTablesAndIndexes

void __CreateTablesAndIndexes_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v15 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("transactions"),
    CFSTR("(t_tid integer primary key autoincrement, t_identifier text, t_service_identifier text, t_finance_transaction_id text, t_payment_hash text, t_source_identifier text, t_amount integer, t_currencycode text, t_timezone integer, t_date integer, t_status integer, t_status_changed_date integer, t_source integer, t_card_type integer, t_type integer, a_type integer, t_altDSID text, t_receipt_identifier text, t_fh_internal_state integer, m_merchant_identifier text, m_industrycode integer, m_name text, m_raw_name text, m_category integer, m_detailed_category text, m_displayname text, m_street text, m_city text, m_state text, m_zip text, m_country_code text, m_country text, m_maps_merchant_id text, m_maps_merchant_result_id integer, m_maps_merchant_brand_id text, m_maps_merchant_brand_result_id integer, lat real, long real, v_accuracy real, h_accuracy real, dispute_type integer, dispute_status integer, peer_pay_counterpart text, peer_pay_type integer, t_description text, peer_pay_is_recurring integer, dispute_open_date integer, dispute_last_updated_date integer)"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("transaction_features"),
    CFSTR("(t_identifier text primary key, t_features text, t_compound_features text, locale text, t_mark_for_delete integer, t_finance_transaction_id text)"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_deterministic_realtime"),
    CFSTR("(f1_tid integer primary key autoincrement, t_identifier text UNIQUE, a integer, b integer, c integer, f integer, g integer)"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_predicted_realtime"),
    CFSTR("(f2_tid integer primary key autoincrement, identifier text, feature_name text, feature_predicted_class integer, version text, data_type integer, predicted_score real, UNIQUE(identifier, feature_name, feature_predicted_class, version))"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_prediction_labels"),
    CFSTR("(feature_label_id integer primary key autoincrement, feature_name text, feature_predicted_class integer, smart_feature_name text, UNIQUE(feature_name, feature_predicted_class, smart_feature_name))"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_compound_realtime"),
    CFSTR("(f3_tid integer primary key autoincrement, t_identifier text UNIQUE, t_compound_feature_value text)"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_merchant"),
    CFSTR("(merchant_aggregate_id integer primary key autoincrement, merchant_aggregate_type text, merchant_aggregate_value text, start_date integer, end_date integer, UNIQUE(merchant_aggregate_type, start_date, end_date))"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_detailed_category"),
    CFSTR("(category_aggregate_id integer primary key autoincrement, detailed_category text, amount integer, transaction_count integer, country_code text, recurring_transaction_ratio real, time_of_day integer, time_window integer, start_date real, end_date real,  UNIQUE(detailed_category, time_of_day, time_window, country_code))"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_datetime"),
    CFSTR("(datetime_aggregate_id integer primary key autoincrement, datetime_aggregate_type text, datetime_aggregate_value_start_date integer, datetime_aggregate_value_end_date integer, start_date integer, end_date integer, UNIQUE(datetime_aggregate_type, start_date, end_date))"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_amount"),
    CFSTR("(amount_aggregate_id integer primary key autoincrement, amount_aggregate_type text, amount_aggregate_value integer, comparison_operator text, start_date integer, end_date integer, UNIQUE(amount_aggregate_type, start_date, end_date))"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("fh_schema"),
    CFSTR("(sch_id integer primary key autoincrement, sch_version_id text, sch_upgrade_status integer, sch_date integer, sch_getall_status integer)"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_heuristics"),
    CFSTR("(h_id integer primary key autoincrement, t_identifier text , t_heuristics_identifier text, t_heuristics_value integer, t_heuristics_score real, UNIQUE(t_identifier, t_heuristics_identifier))"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_instrumentation"),
    CFSTR("(inst_id integer primary key autoincrement, tag_source integer, tag_type integer, tag_click_date integer, pass_type integer, heuristics_identifier text, account_state integer, paid_using_ring integer)"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_events"),
    CFSTR("(e_id integer primary key autoincrement, e_identifier text, start_date integer, end_date integer, UNIQUE(e_identifier, start_date, end_date))"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("fh_processing_history"),
    CFSTR("(fh_processing_history_id integer primary key autoincrement, feature_name text, feature_processing_date integer, feature_data text, UNIQUE(feature_name))"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_peer_payments"),
    CFSTR("(p1_tid integer primary key autoincrement, source_identifier text, peer_pay_counterpart text, amount integer, frequency real, peer_pay_type integer, forecast_date integer, forecast_signal_type integer, heuristics_identifier text, UNIQUE(heuristics_identifier))"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("features_insight_trends"),
    CFSTR("(trend_pid integer primary key autoincrement, trend_date real, trend_direction integer, trend_feature_name text, trend_feature_type text, trend_spend real, trend_window integer, trend_average real, trend_readable_description text)"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create index %@ on %@(%@);"),
    CFSTR("t_date_index"),
    CFSTR("transactions"),
    CFSTR("t_date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create index %@ on %@(%@);"),
    CFSTR("t_identifier_index"),
    CFSTR("transactions"),
    CFSTR("t_identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create index %@ on %@(%@);"),
    CFSTR("t_finance_transaction_id_index"),
    CFSTR("transactions"),
    CFSTR("t_finance_transaction_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create index %@ on %@(%@);"),
    CFSTR("identifier_index"),
    CFSTR("features_predicted_realtime"),
    CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create index %@ on %@(%@);"),
    CFSTR("pattern_class_index"),
    CFSTR("features_predicted_realtime"),
    CFSTR("feature_predicted_class"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("fh_account_information"),
    CFSTR("(source_identifier text primary key, account_type integer, account_balance integer, source_type, account_currency_code text, account_date integer, account_category integer, account_description text, account_status integer, credit_limit integer, next_payment_date real, minimum_payment_amount integer, overdue_payment_amount integer, institution_name text, institution_id text, unique_account_id text, UNIQUE(institution_id, unique_account_id))"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("CREATE VIRTUAL TABLE fts_transactions USING fts5(t_identifier UNINDEXED, t_source_identifier UNINDEXED, a_type UNINDEXED, t_description, content=transactions, content_rowid=t_tid);"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("fh_grouping"),
    CFSTR("(g_id integer primary key autoincrement,t_identifier text, group_id integer, similarity_score text, group_type integer, UNIQUE(t_identifier, group_id))"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("CREATE TRIGGER transactions_ai AFTER INSERT ON transactions BEGIN INSERT INTO fts_transactions(rowid, t_identifier, t_source_identifier, a_type, t_description) VALUES (new.t_tid, new.t_identifier, new.t_source_identifier, new.a_type, new.t_description); END;"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("CREATE TRIGGER transactions_bu BEFORE UPDATE ON transactions BEGIN INSERT INTO fts_transactions(fts_transactions, rowid, t_identifier, t_source_identifier, a_type, t_description) VALUES('delete', old.t_tid, old.t_identifier, old.t_source_identifier, old.a_type, old.t_description); END;"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("CREATE TRIGGER transactions_bd BEFORE DELETE ON transactions BEGIN INSERT INTO fts_transactions(fts_transactions, rowid, t_identifier, t_source_identifier, a_type, t_description) VALUES('delete', old.t_tid, old.t_identifier, old.t_source_identifier, old.a_type, old.t_description); END;"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("CREATE TRIGGER transactions_au AFTER UPDATE ON transactions BEGIN INSERT INTO fts_transactions(rowid, t_identifier, t_source_identifier, a_type, t_description) VALUES (new.t_tid, new.t_identifier, new.t_source_identifier, new.a_type, new.t_description); END;"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("create table %@ %@;"),
    CFSTR("fh_card_recurring_predictions"),
    CFSTR("(source_identifier text, merchant text, detailed_category text, amount integer, frequency real, transaction_type integer, transaction_source integer, forecast_date real, forecast_signal_type integer, heuristic_identifier text, UNIQUE(heuristic_identifier))"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithObjects:", v32, v31, v30, v29, v28, v27, v26, v25, v22, v24, v23, v14, v21, v13, v12, v20, v19,
    v11,
    v18,
    v10,
    v17,
    v16,
    v9,
    v8,
    v7,
    v0,
    v1,
    v2,
    v3,
    v4,
    0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)CreateTablesAndIndexes__ddlCreateTables;
  CreateTablesAndIndexes__ddlCreateTables = v5;

}

@end
