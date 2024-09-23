@implementation GDTopicView

- (GDTopicView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  GDTopicView *v9;
  GDTopicView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDTopicView;
  v9 = -[GDTopicView init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessAssertion, a3);
    objc_storeStrong((id *)&v10->_db, a4);
  }

  return v10;
}

- (NSString)databaseFilePath
{
  return (NSString *)((uint64_t (*)(_PASSqliteDatabase *, char *))MEMORY[0x1E0DE7D20])(self->_db, sel_filename);
}

- (void)enumerateTopicsWithBlock:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  const char *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1AE90F58C;
  v8[3] = &unk_1E5DD9A18;
  v9 = v4;
  v7 = v4;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v6, (uint64_t)CFSTR("SELECT topicId, score, most_recent_documentId FROM topics ORDER BY score DESC"), 0, v8, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

@end
