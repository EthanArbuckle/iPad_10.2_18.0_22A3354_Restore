@implementation GDPersonView

- (GDPersonView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v8;
  id v9;
  GDPersonView *v10;
  GDPersonView *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  GDSQLGraphObjectRetriever *v17;
  _PASSqliteDatabase *db;
  void *v19;
  id *v20;
  GDSQLGraphObjectRetriever *personRetriever;
  void *v23;
  const char *v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)GDPersonView;
  v10 = -[GDPersonView init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accessAssertion, a3);
    objc_storeStrong((id *)&v11->_db, a4);
    objc_msgSend_viewArtifactTableName(v8, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, v11, CFSTR("GDPersonView.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

    }
    v17 = [GDSQLGraphObjectRetriever alloc];
    db = v11->_db;
    v19 = (void *)objc_opt_class();
    v20 = sub_1AE90DD34((id *)&v17->super.isa, db, v16, CFSTR("SB104"), (void *)2, v19);
    personRetriever = v11->_personRetriever;
    v11->_personRetriever = (GDSQLGraphObjectRetriever *)v20;

  }
  return v11;
}

- (void)enumeratePeopleWithBlock:(id)a3
{
  const char *v4;
  const char *v5;
  id v6;

  v6 = a3;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v4, (uint64_t)CFSTR("ViewEngine.Serving.Query"), &unk_1E5DD97A0);
  objc_msgSend_enumerateObjectsWithBlock_(self->_personRetriever, v5, (uint64_t)v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_personRetriever, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

@end
