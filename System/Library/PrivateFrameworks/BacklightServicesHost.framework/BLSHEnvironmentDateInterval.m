@implementation BLSHEnvironmentDateInterval

+ (id)intervalWithPresentationInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 environment:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPresentationInterval:previousPresentationDate:shouldReset:environment:", v12, v11, v6, v10);

  return v13;
}

- (BLSHEnvironmentDateInterval)initWithPresentationInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 environment:(id)a6
{
  id v11;
  id v12;
  id v13;
  BLSHEnvironmentDateInterval *v14;
  BLSHEnvironmentDateInterval *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BLSHEnvironmentDateInterval;
  v14 = -[BLSHEnvironmentDateInterval init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_presentationInterval, a3);
    objc_storeStrong((id *)&v15->_previousPresentationDate, a4);
    v15->_shouldReset = a5;
    objc_storeStrong((id *)&v15->_environment, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSHEnvironmentDateInterval *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __42__BLSHEnvironmentDateInterval_description__block_invoke;
  v10 = &unk_24D1BBE80;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __42__BLSHEnvironmentDateInterval_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "bls_shortLoggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "bls_shortLoggingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:skipIfEmpty:", v6, CFSTR("prev"), 1);

  v7 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v7 + 8))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("shouldReset"), 0);
    v7 = *(_QWORD *)(a1 + 40);
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(v7 + 32), "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v9;
  if (v9)
    v10 = (const __CFString *)v9;
  else
    v10 = CFSTR("<NULL>");
  objc_msgSend(v8, "appendString:withName:", v10, 0);

}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_presentationInterval);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_previousPresentationDate);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_shouldReset);
  v7 = (id)objc_msgSend(v3, "appendPointer:", self->_environment);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSDateInterval *presentationInterval;
  uint64_t v7;
  id v8;
  id v9;
  NSDate *previousPresentationDate;
  id v11;
  id v12;
  _BOOL8 shouldReset;
  id v14;
  id v15;
  BLSHBacklightSceneHostEnvironment *environment;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  presentationInterval = self->_presentationInterval;
  v7 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __39__BLSHEnvironmentDateInterval_isEqual___block_invoke;
  v29[3] = &unk_24D1BC410;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", presentationInterval, v29);
  previousPresentationDate = self->_previousPresentationDate;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_2;
  v27[3] = &unk_24D1BC410;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", previousPresentationDate, v27);
  shouldReset = self->_shouldReset;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_3;
  v25[3] = &unk_24D1BDB28;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", shouldReset, v25);
  environment = self->_environment;
  v20 = v7;
  v21 = 3221225472;
  v22 = __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_4;
  v23 = &unk_24D1BC110;
  v24 = v14;
  v17 = v14;
  v18 = (id)objc_msgSend(v5, "appendPointer:counterpart:", environment, &v20);
  LOBYTE(environment) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  return (char)environment;
}

uint64_t __39__BLSHEnvironmentDateInterval_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationInterval");
}

uint64_t __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previousPresentationDate");
}

uint64_t __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldReset");
}

uint64_t __39__BLSHEnvironmentDateInterval_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "environment");
}

- (NSDateInterval)presentationInterval
{
  return self->_presentationInterval;
}

- (NSDate)previousPresentationDate
{
  return self->_previousPresentationDate;
}

- (BOOL)shouldReset
{
  return self->_shouldReset;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_previousPresentationDate, 0);
  objc_storeStrong((id *)&self->_presentationInterval, 0);
}

@end
