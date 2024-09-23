@implementation BLSHEnvironmentDateSpecifier

+ (BLSHEnvironmentDateSpecifier)specifierWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5 userObject:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPresentationDate:fidelity:environment:userObject:", v12, a4, v11, v10);

  return (BLSHEnvironmentDateSpecifier *)v13;
}

+ (BLSHEnvironmentDateSpecifier)specifierWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPresentationDate:fidelity:environment:userObject:", v9, a4, v8, 0);

  return (BLSHEnvironmentDateSpecifier *)v10;
}

- (BLSHEnvironmentDateSpecifier)initWithPresentationDate:(id)a3 fidelity:(int64_t)a4 environment:(id)a5 userObject:(id)a6
{
  id v10;
  id v11;
  id v12;
  BLSHEnvironmentDateSpecifier *v13;
  uint64_t v14;
  BLSAlwaysOnDateSpecifier *dateSpecifier;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BLSHEnvironmentDateSpecifier;
  v13 = -[BLSHEnvironmentDateSpecifier init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE0B818]), "initWithDate:fidelity:userObject:", v10, a4, v12);
    dateSpecifier = v13->_dateSpecifier;
    v13->_dateSpecifier = (BLSAlwaysOnDateSpecifier *)v14;

    objc_storeStrong((id *)&v13->_environment, a5);
  }

  return v13;
}

- (NSString)environmentIdentifier
{
  return (NSString *)-[BLSHBacklightSceneHostEnvironment identifier](self->_environment, "identifier");
}

- (id)userObject
{
  return (id)-[BLSAlwaysOnDateSpecifier userObject](self->_dateSpecifier, "userObject");
}

- (id)bls_shortLoggingString
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  BLSHEnvironmentDateSpecifier *v11;
  id v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __54__BLSHEnvironmentDateSpecifier_bls_shortLoggingString__block_invoke;
  v10 = &unk_24D1BBE80;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __54__BLSHEnvironmentDateSpecifier_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v9 = v2;
  if (v2)
  {
    objc_msgSend(v2, "bls_shortLoggingString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v4, 0);

  }
  else
  {
    objc_msgSend(v3, "appendString:withName:", CFSTR("<NULL>"), 0);
  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fidelity");
  NSStringFromBLSUpdateFidelity();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, 0);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, 0);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BLSHBacklightSceneHostEnvironment *environment;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSAlwaysOnDateSpecifier date](self->_dateSpecifier, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("presentationDate"));

  -[BLSAlwaysOnDateSpecifier fidelity](self->_dateSpecifier, "fidelity");
  NSStringFromBLSUpdateFidelity();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("fidelity"));

  v7 = (void *)MEMORY[0x24BDD17C8];
  environment = self->_environment;
  -[BLSHBacklightSceneHostEnvironment identifier](environment, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%p:%@>"), environment, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("environment"));

  -[BLSHEnvironmentDateSpecifier userObject](self, "userObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[BLSHEnvironmentDateSpecifier userObject](self, "userObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHEnvironmentDateSpecifier userObject](self, "userObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<%p:%@>"), v13, objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v15, CFSTR("userObject"));

  }
  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_dateSpecifier);
  v5 = (id)objc_msgSend(v3, "appendPointer:", self->_environment);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BLSAlwaysOnDateSpecifier *dateSpecifier;
  uint64_t v7;
  id v8;
  id v9;
  BLSHBacklightSceneHostEnvironment *environment;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dateSpecifier = self->_dateSpecifier;
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __40__BLSHEnvironmentDateSpecifier_isEqual___block_invoke;
  v19[3] = &unk_24D1BC410;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", dateSpecifier, v19);
  environment = self->_environment;
  v14 = v7;
  v15 = 3221225472;
  v16 = __40__BLSHEnvironmentDateSpecifier_isEqual___block_invoke_2;
  v17 = &unk_24D1BC110;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendPointer:counterpart:", environment, &v14);
  LOBYTE(environment) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)environment;
}

uint64_t __40__BLSHEnvironmentDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dateSpecifier");
}

uint64_t __40__BLSHEnvironmentDateSpecifier_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "environment");
}

- (BLSAlwaysOnDateSpecifier)dateSpecifier
{
  return self->_dateSpecifier;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_dateSpecifier, 0);
}

@end
