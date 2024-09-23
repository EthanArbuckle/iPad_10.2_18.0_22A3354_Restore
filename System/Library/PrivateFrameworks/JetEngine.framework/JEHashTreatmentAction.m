@implementation JEHashTreatmentAction

- (JEHashTreatmentAction)initWithField:(id)a3 configuration:(id)a4 topic:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  JEHashTreatmentAction *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)JEHashTreatmentAction;
  v12 = -[JETreatmentAction initWithField:configuration:](&v21, sel_initWithField_configuration_, v9, v10);
  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("scheme"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("namespace"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "processName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%lx"), v19, objc_msgSend(v9, "hash"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {

      }
    }
    -[JEHashTreatmentAction setNamespace:](v12, "setNamespace:", v15);
    -[JEHashTreatmentAction setConfiguration:](v12, "setConfiguration:", v10);
    -[JEHashTreatmentAction setTopic:](v12, "setTopic:", v11);

  }
  return v12;
}

- (id)hashOf:(id)a3 userId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  -[JEHashTreatmentAction namespace](self, "namespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JEHashTreatmentAction topic](self, "topic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFDB78], "keyWithName:crossDeviceSync:", CFSTR("userID"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[JEHashTreatmentAction configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __39__JEHashTreatmentAction_hashOf_userId___block_invoke;
  v19[3] = &unk_1E3DDF0F0;
  v21 = &v22;
  v13 = v8;
  v20 = v13;
  +[JEMetricsSecretMigrator migrateSecretIfNecessaryAndReturnSecretValueWithNamespace:topic:secretKey:configuration:completionHandler:](_TtC9JetEngine23JEMetricsSecretMigrator, "migrateSecretIfNecessaryAndReturnSecretValueWithNamespace:topic:secretKey:configuration:completionHandler:", v9, v10, v11, v12, v19);

  v14 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v13, v14);
  if (v23[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@\n%@"), v6, v23[5], v7);
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject je_SHA1Base62String](v15, "je_SHA1Base62String");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    JEMetricsOSLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[JEHashTreatmentAction namespace](self, "namespace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v17;
      _os_log_impl(&dword_19CCBB000, v15, OS_LOG_TYPE_ERROR, "JetEngine: Failed to retrieve secret salt for namespace %@", buf, 0xCu);

    }
    v16 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v16;
}

void __39__JEHashTreatmentAction_hashOf_userId___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)performAction:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)JEHashTreatmentAction;
  -[JETreatmentAction performAction:context:](&v15, sel_performAction_context_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v13 = 0;
          goto LABEL_12;
        }
      }
      objc_msgSend(v7, "description");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = v8;
  -[JETreatmentContext metrics]((uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  -[JEHashTreatmentAction hashOf:userId:](self, "hashOf:userId:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v13;
}

- (JEHashTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  return -[JEHashTreatmentAction initWithField:configuration:topic:](self, "initWithField:configuration:topic:", a3, a4, 0);
}

- (NSString)namespace
{
  return self->_namespace;
}

- (void)setNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_namespace, a3);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
}

@end
