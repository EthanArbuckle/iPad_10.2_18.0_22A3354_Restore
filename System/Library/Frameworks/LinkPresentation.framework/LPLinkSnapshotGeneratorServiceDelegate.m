@implementation LPLinkSnapshotGeneratorServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5ED908);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_snapshotForMetadata_configurations_completionHandler_, 1, 0);

  objc_msgSend(v4, "setExportedInterface:", v5);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v4, "setExportedObject:", v9);

  objc_msgSend(v4, "resume");
  return 1;
}

@end
