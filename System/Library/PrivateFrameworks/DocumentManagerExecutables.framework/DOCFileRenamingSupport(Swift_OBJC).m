@implementation DOCFileRenamingSupport(Swift_OBJC)

+ (void)_workaroundWrapper_renameDocumentAtURL:()Swift_OBJC newName:hostIdentifier:completionHandler:
{
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v9 = a6;
  v10 = (void *)MEMORY[0x24BE2DDB8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __118__DOCFileRenamingSupport_Swift_OBJC___workaroundWrapper_renameDocumentAtURL_newName_hostIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_24E3277E0;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "_renameDocumentAtURL:newName:hostIdentifier:roleIdentifier:completion:", a3, a4, a5, 0, v12);

}

@end
