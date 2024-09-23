@implementation MFDiagnostics

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_2);
  return (id)sharedController_controller;
}

- (void)addDiagnosticsGenerator:(id)a3
{
  id v4;

  v4 = a3;
  -[NSLock lock](self->_diagnosticLock, "lock");
  -[MFWeakSet addObject:](self->_diagnosticsGenerators, "addObject:", v4);
  -[NSLock unlock](self->_diagnosticLock, "unlock");

}

void __33__MFDiagnostics_sharedController__block_invoke()
{
  MFDiagnostics *v0;
  void *v1;

  v0 = objc_alloc_init(MFDiagnostics);
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;

}

- (MFDiagnostics)init
{
  MFDiagnostics *v2;
  MFWeakSet *v3;
  MFWeakSet *diagnosticsGenerators;
  MFDiagnostics *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFDiagnostics;
  v2 = -[MFDiagnostics init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MFWeakSet);
    diagnosticsGenerators = v2->_diagnosticsGenerators;
    v2->_diagnosticsGenerators = v3;

    v5 = v2;
  }

  return v2;
}

- (void)removeDiagnosticsGenerator:(id)a3
{
  id v4;

  v4 = a3;
  -[NSLock lock](self->_diagnosticLock, "lock");
  -[MFWeakSet removeObject:](self->_diagnosticsGenerators, "removeObject:", v4);
  -[NSLock unlock](self->_diagnosticLock, "unlock");

}

- (id)copyDiagnosticInformation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NSLock lock](self->_diagnosticLock, "lock");
  -[MFWeakSet allObjects](self->_diagnosticsGenerators, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_diagnosticLock, "unlock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "copyDiagnosticInformation");
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLock, 0);
  objc_storeStrong((id *)&self->_diagnosticsGenerators, 0);
}

@end
