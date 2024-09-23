@implementation ECNWActivity

- (void)startActivity
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  nw_activity_activate();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_ECNWActivityCurrentActivity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECNWActivity.m"), 49, CFSTR("We don't currently support nesting activities"));

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self, CFSTR("_ECNWActivityCurrentActivity"));

}

- (void)stopActivityWithSuccess:(BOOL)a3
{
  void *v4;
  ECNWActivity *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_ECNWActivityCurrentActivity"));
  v5 = (ECNWActivity *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("_ECNWActivityCurrentActivity"));
  nw_activity_complete_with_reason();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (ECNWActivity)initWithDomain:(unsigned int)a3 type:(unsigned int)a4
{
  ECNWActivity *v4;
  uint64_t v5;
  OS_nw_activity *activity;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ECNWActivity;
  v4 = -[ECNWActivity init](&v8, sel_init);
  if (v4)
  {
    v5 = nw_activity_create();
    activity = v4->_activity;
    v4->_activity = (OS_nw_activity *)v5;

  }
  return v4;
}

+ (void)attachCurrentActivityToConnection:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_ECNWActivityCurrentActivity"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id *)v6;
  if (v6 && !*(_QWORD *)(v6 + 16))
  {
    nw_connection_start_activity();
    objc_storeStrong(v7 + 2, a3);
  }

}

+ (void)detachCurrentActivityFromConnection:(id)a3
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_ECNWActivityCurrentActivity"));
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5 && (id)v5[2] == v7)
  {
    nw_connection_end_activity();
    v6 = (void *)v5[2];
    v5[2] = 0;

  }
}

@end
