@implementation _LSInstaller

- (void)performShimmedInstallOfArtifact:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_LSInstaller xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = _LSValidateEntitlementsOfConnectionForVanillaInstall(v11, v9, &v17);
  v13 = v17;

  if (v12)
  {
    _LSInstallLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "shimming install of %@ with options %@", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67___LSInstaller_performShimmedInstallOfArtifact_options_completion___block_invoke;
    v15[3] = &unk_1E1040A40;
    v16 = v10;
    _LSInvokeMIForShimmedInstall(v8, v9, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v13);
  }

}

- (void)performShimmedUninstallOfApplicationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_LSInstaller xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = _LSValidateEntitlementsOfConnectionForUninstall(v11, (uint64_t)v9, &v16);
  v13 = v16;

  if (v12)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86___LSInstaller_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke;
    v14[3] = &unk_1E1040A40;
    v15 = v10;
    _LSInvokeMIForShimmedUninstall(v8, v9, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v13);
  }

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end
