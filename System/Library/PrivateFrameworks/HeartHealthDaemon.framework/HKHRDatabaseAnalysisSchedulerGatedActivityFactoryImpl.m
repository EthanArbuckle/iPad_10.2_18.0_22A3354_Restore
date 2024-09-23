@implementation HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl

- (HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl)initWithIdentifier:(id)a3 loggingCategory:(id)a4
{
  id v7;
  id v8;
  HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl *v9;
  HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl;
  v9 = -[HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_loggingCategory, a4);
  }

  return v10;
}

- (id)makeGatedActivityWithHandler:(id)a3
{
  id v4;
  xpc_object_t empty;
  void *v6;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808A8], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D298F8]), "initWithName:criteria:loggingCategory:handler:", self->_identifier, empty, self->_loggingCategory, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
