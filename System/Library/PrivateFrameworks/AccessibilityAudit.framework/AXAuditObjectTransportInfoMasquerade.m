@implementation AXAuditObjectTransportInfoMasquerade

- (AXAuditObjectTransportInfoMasquerade)init
{
  AXAuditObjectTransportInfoMasquerade *v2;
  AXAuditObjectTransportInfoMasquerade *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXAuditObjectTransportInfoMasquerade;
  v2 = -[AXAuditObjectTransportInfoMasquerade init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXAuditObjectTransportInfo setRequiresRawTransportDictionary:](v2, "setRequiresRawTransportDictionary:", 1);
    -[AXAuditObjectTransportInfoMasquerade _initializeBlocks](v3, "_initializeBlocks");
  }
  return v3;
}

- (void)_initializeBlocks
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[AXAuditObjectTransportInfo setCanEncodeObjectBlock:](self, "setCanEncodeObjectBlock:", &__block_literal_global_3);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke_2;
  v6[3] = &unk_25071A768;
  objc_copyWeak(&v7, &location);
  -[AXAuditObjectTransportInfo setCreateLocalObjectBlock:](self, "setCreateLocalObjectBlock:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke_3;
  v4[3] = &unk_25071A790;
  objc_copyWeak(&v5, &location);
  -[AXAuditObjectTransportInfo setCreateTransportObjectBlock:](self, "setCreateTransportObjectBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke()
{
  return 1;
}

id __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "masqueradeTransportInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createLocalObjectBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "createLocalObjectWithMasqueradeObjectBlock");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v9)[2](v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "createMasqueradeObjectBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "masqueradeTransportInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createTransportObjectBlock");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v9)[2](v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (Class)masqueradeAsClass
{
  return self->_masqueradeAsClass;
}

- (void)setMasqueradeAsClass:(Class)a3
{
  objc_storeStrong((id *)&self->_masqueradeAsClass, a3);
}

- (AXAuditObjectTransportInfo)masqueradeTransportInfo
{
  return self->_masqueradeTransportInfo;
}

- (void)setMasqueradeTransportInfo:(id)a3
{
  objc_storeStrong((id *)&self->_masqueradeTransportInfo, a3);
}

- (id)createMasqueradeObjectBlock
{
  return self->_createMasqueradeObjectBlock;
}

- (void)setCreateMasqueradeObjectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)createLocalObjectWithMasqueradeObjectBlock
{
  return self->_createLocalObjectWithMasqueradeObjectBlock;
}

- (void)setCreateLocalObjectWithMasqueradeObjectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createLocalObjectWithMasqueradeObjectBlock, 0);
  objc_storeStrong(&self->_createMasqueradeObjectBlock, 0);
  objc_storeStrong((id *)&self->_masqueradeTransportInfo, 0);
  objc_storeStrong((id *)&self->_masqueradeAsClass, 0);
}

@end
