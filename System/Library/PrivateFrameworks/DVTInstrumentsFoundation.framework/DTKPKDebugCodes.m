@implementation DTKPKDebugCodes

+ (void)initialize
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;

  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_semaphore_create(1);
    v3 = (void *)qword_25576FC18;
    qword_25576FC18 = (uint64_t)v2;

    v4 = (void *)qword_25576FC20;
    qword_25576FC20 = 0;

    DTKPSetupLogging();
  }
}

+ (id)localKDebugCodes:(id *)a3
{
  void *v4;
  void *v5;
  DTKPKDebugCodes *v6;
  void *v7;

  dispatch_semaphore_wait((dispatch_semaphore_t)qword_25576FC18, 0xFFFFFFFFFFFFFFFFLL);
  if ((byte_25576FC28 & 1) == 0)
  {
    byte_25576FC28 = 1;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/usr/share/misc/trace.codes"));
    sub_222B9325C(v4, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DTKPKDebugCodes initWithCodes:]([DTKPKDebugCodes alloc], "initWithCodes:", v5);
    v7 = (void *)qword_25576FC20;
    qword_25576FC20 = (uint64_t)v6;

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_25576FC18);
  return (id)qword_25576FC20;
}

+ (id)codesFromURL:(id)a3 error:(id *)a4
{
  void *v4;
  DTKPKDebugCodes *v5;

  sub_222B9325C(a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DTKPKDebugCodes initWithCodes:]([DTKPKDebugCodes alloc], "initWithCodes:", v4);

  return v5;
}

- (DTKPKDebugCodes)initWithCodeMapping:(id)a3
{
  id v4;
  DTKPKDebugCodes *v5;
  uint64_t v6;
  XRIntKeyedDictionary *codeMap;
  void *v8;
  DTKPKDebugCodes *v9;
  id v10;
  uint64_t v11;
  NSSet *allKDebugCodes;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  DTKPKDebugCodes *v18;
  id v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DTKPKDebugCodes;
  v5 = -[DTKPKDebugCodes init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    codeMap = v5->_codeMap;
    v5->_codeMap = (XRIntKeyedDictionary *)v6;

    v8 = (void *)objc_opt_new();
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = sub_222B935C8;
    v17 = &unk_24EB2ADC8;
    v9 = v5;
    v18 = v9;
    v19 = v8;
    v10 = v8;
    objc_msgSend(v4, "enumerateObjectsAndIntegerKeys:", &v14);
    v11 = objc_msgSend(v10, "copy", v14, v15, v16, v17);
    allKDebugCodes = v9->_allKDebugCodes;
    v9->_allKDebugCodes = (NSSet *)v11;

  }
  return v5;
}

- (DTKPKDebugCodes)initWithCodes:(id)a3
{
  id v4;
  DTKPKDebugCodes *v5;
  uint64_t v6;
  XRIntKeyedDictionary *codeMap;
  uint64_t v8;
  NSSet *allKDebugCodes;
  _QWORD v11[4];
  DTKPKDebugCodes *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTKPKDebugCodes;
  v5 = -[DTKPKDebugCodes init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    codeMap = v5->_codeMap;
    v5->_codeMap = (XRIntKeyedDictionary *)v6;

    v8 = objc_msgSend(v4, "copy");
    allKDebugCodes = v5->_allKDebugCodes;
    v5->_allKDebugCodes = (NSSet *)v8;

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_222B93714;
    v11[3] = &unk_24EB2ADF0;
    v12 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  }
  return v5;
}

- (id)kdebugCodeWithNameForValue:(unsigned int)a3
{
  return (id)-[XRIntKeyedDictionary objectForIntegerKey:](self->_codeMap, "objectForIntegerKey:", a3 & 0xFFFFFFFC);
}

- (NSSet)allKDebugCodes
{
  return self->_allKDebugCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKDebugCodes, 0);
  objc_storeStrong((id *)&self->_codeMap, 0);
}

@end
