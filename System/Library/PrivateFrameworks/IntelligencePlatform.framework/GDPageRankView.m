@implementation GDPageRankView

- (GDPageRankView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  GDPageRankView *v9;
  GDPageRankView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDPageRankView;
  v9 = -[GDPageRankView init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessAssertion, a3);
    objc_storeStrong((id *)&v10->_db, a4);
  }

  return v10;
}

- (id)pageRanksWithError:(id *)a3
{
  void *v5;
  _PASSqliteDatabase *db;
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, a2, (uint64_t)CFSTR("ViewEngine.Serving.Query"), &unk_1E5DD9780);
  v5 = (void *)objc_opt_new();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1AE908FD4;
  v20 = sub_1AE908FE4;
  v21 = 0;
  db = self->_db;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE908FEC;
  v14[3] = &unk_1E5DD9858;
  v8 = v5;
  v15 = v8;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = sub_1AE909074;
  v13[3] = &unk_1E5DD9880;
  v13[4] = &v16;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v9, (uint64_t)CFSTR("SELECT MD_ID, CAST(page_rank AS REAL) AS rank FROM page_rank"), &unk_1E5DB0F28, v14, v13);
  if (a3 && (v10 = (void *)v17[5]) != 0)
  {
    v11 = 0;
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    v11 = v8;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

@end
