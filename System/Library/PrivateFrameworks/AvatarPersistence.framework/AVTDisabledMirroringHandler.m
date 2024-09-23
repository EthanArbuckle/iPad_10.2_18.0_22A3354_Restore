@implementation AVTDisabledMirroringHandler

- (void)scheduleImportChangesWithManagedObjectContext:(id)a3 workQueue:(id)a4 completionHandler:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDD0FD8];
  v11[0] = CFSTR("Disabled mirroring handler!");
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a5;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 999, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v7, 0, v9);

}

- (void)scheduleExportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0FD8];
  v12[0] = CFSTR("Disabled mirroring handler!");
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a6;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 999, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a6 + 2))(v8, 0, v10);

}

- (void)importChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0FD8];
  v12[0] = CFSTR("Disabled mirroring handler!");
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a6;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 999, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a6 + 2))(v8, 0, v10);

}

- (void)exportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0FD8];
  v12[0] = CFSTR("Disabled mirroring handler!");
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a6;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 999, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a6 + 2))(v8, 0, v10);

}

- (AVTCoreDataCloudKitMirroringHandlerDelegate)delegate
{
  return 0;
}

- (void)resetZoneWithManagedObjectContext:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDD0FD8];
  v10[0] = CFSTR("Disabled mirroring handler!");
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 999, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v6, 0, v8);

}

@end
