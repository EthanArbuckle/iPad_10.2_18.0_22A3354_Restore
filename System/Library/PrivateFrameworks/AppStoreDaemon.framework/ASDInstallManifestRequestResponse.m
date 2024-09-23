@implementation ASDInstallManifestRequestResponse

- (ASDInstallManifestRequestResponse)init
{
  void *v3;
  ASDInstallManifestRequestResponse *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ASDInstallManifestRequestResponse initWithResults:](self, "initWithResults:", v3);

  return v4;
}

- (ASDInstallManifestRequestResponse)initWithResults:(id)a3
{
  id v4;
  ASDInstallManifestRequestResponse *v5;
  uint64_t v6;
  NSArray *results;
  NSArray *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDInstallManifestRequestResponse;
  v5 = -[ASDInstallManifestRequestResponse init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
    results = v5->_results;
    v5->_results = (NSArray *)v6;

    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    v8 = v5->_results;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__ASDInstallManifestRequestResponse_initWithResults___block_invoke;
    v10[3] = &unk_1E37BEE88;
    v10[4] = &v11;
    -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v10);
    -[ASDRequestResponse setSuccess:](v5, "setSuccess:", *((unsigned __int8 *)v12 + 24));
    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

uint64_t __53__ASDInstallManifestRequestResponse_initWithResults___block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v6;
  char v7;

  v5 = result;
  v6 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v7 = *(_BYTE *)(v6 + 24);
  if (v7)
  {
    result = objc_msgSend(a2, "status");
    v7 = result == 2;
    v6 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8);
  }
  *(_BYTE *)(v6 + 24) = v7;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) ^ 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASDInstallManifestRequestResponse initWithResults:](+[ASDInstallManifestRequestResponse allocWithZone:](ASDInstallManifestRequestResponse, "allocWithZone:", a3), "initWithResults:", self->_results);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDInstallManifestRequestResponse)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ASDInstallManifestRequestResponse *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("results"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ASDInstallManifestRequestResponse initWithResults:](self, "initWithResults:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_results, CFSTR("results"));
}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
