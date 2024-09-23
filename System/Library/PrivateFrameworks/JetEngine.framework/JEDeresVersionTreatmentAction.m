@implementation JEDeresVersionTreatmentAction

- (JEDeresVersionTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  id v6;
  JEDeresVersionTreatmentAction *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)JEDeresVersionTreatmentAction;
  v7 = -[JETreatmentAction initWithField:configuration:](&v14, sel_initWithField_configuration_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("precision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v8, "length"))
    {
      v9 = objc_msgSend(v8, "integerValue");
    }
    else
    {
      JEMetricsOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_impl(&dword_19CCBB000, v10, OS_LOG_TYPE_ERROR, "JetEngine: Deres version precision is unsupported %@", buf, 0xCu);

      }
      v9 = -1;
    }
    v7->_precision = v9;

  }
  return v7;
}

- (id)performAction:(id)a3 context:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)JEDeresVersionTreatmentAction;
  -[JETreatmentAction performAction:context:](&v12, sel_performAction_context_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (self)
    {
      if (v8 > self->_precision)
      {
LABEL_7:
        objc_msgSend(v7, "subarrayWithRange:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
        v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
    }
    else if (v8)
    {
      goto LABEL_7;
    }
    v10 = v6;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

@end
