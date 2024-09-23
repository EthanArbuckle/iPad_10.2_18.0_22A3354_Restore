@implementation FPDMoveAtom

- (FPDMoveAtom)initWithKind:(unsigned __int8)a3 source:(id)a4 targetName:(id)a5 targetFolder:(id)a6 root:(id)a7 atomically:(BOOL)a8 sourceMaterializeOption:(unint64_t)a9 targetMaterializeOption:(unint64_t)a10 useDiskWriter:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  FPDMoveAtom *v22;
  FPDMoveAtom *v23;
  uint64_t v24;
  NSString *targetName;
  objc_super v27;

  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v27.receiver = self;
  v27.super_class = (Class)FPDMoveAtom;
  v22 = -[FPDMoveAtom init](&v27, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_kind = a3;
    objc_storeStrong((id *)&v22->_source, a4);
    objc_msgSend(v19, "fp_filenameFromDisplayNameWithExtension:", 0);
    v24 = objc_claimAutoreleasedReturnValue();
    targetName = v23->_targetName;
    v23->_targetName = (NSString *)v24;

    objc_storeStrong((id *)&v23->_targetFolder, a6);
    objc_storeStrong((id *)&v23->_root, a7);
    v23->_useAtomicMove = a8;
    v23->_useDiskWriter = a11;
    v23->_materializeOption = a9;
    v23->_targetMaterializeOption = a10;
  }

  return v23;
}

+ (id)atomForMoving:(id)a3 toTargetFolder:(id)a4 as:(id)a5 root:(id)a6 atomically:(BOOL)a7 sourceMaterializeOption:(unint64_t)a8 targetMaterializeOption:(unint64_t)a9 useDiskWriter:(BOOL)a10
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  FPDMoveAtom *v20;
  uint64_t v21;
  FPDMoveAtom *v22;
  uint64_t v24;

  v11 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_msgSend(v18, "isFolder");
  v20 = [FPDMoveAtom alloc];
  LOBYTE(v24) = a10;
  if (v19)
    v21 = 0;
  else
    v21 = 2;
  v22 = -[FPDMoveAtom initWithKind:source:targetName:targetFolder:root:atomically:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:](v20, "initWithKind:source:targetName:targetFolder:root:atomically:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:", v21, v18, v16, v17, v15, v11, a8, a9, v24);

  return v22;
}

+ (id)atomForPostFolderUnderRoot:(id)a3 atomically:(BOOL)a4 useDiskWriter:(BOOL)a5
{
  _BOOL8 v6;
  id v7;
  FPDMoveAtom *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  LOBYTE(v10) = a5;
  v8 = -[FPDMoveAtom initWithKind:source:targetName:targetFolder:root:atomically:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:]([FPDMoveAtom alloc], "initWithKind:source:targetName:targetFolder:root:atomically:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:", 1, 0, 0, 0, v7, v6, 0, 0, v10);

  return v8;
}

- (BOOL)shouldAccountForDownloadOfSourceItemForMoveInfo:(id)a3 extensionManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (-[FPDMoveAtom kind](self, "kind") == 2)
  {
    -[FPDMoveAtom source](self, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetFolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "materializeOptionForDestinationItem:recursively:isCopy:extensionManager:", v9, 0, objc_msgSend(v6, "byCopy"), v7);

    v11 = v10 == 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;
  __CFString *v4;

  if (self->_kind == 2)
  {
    v2 = CFSTR("<item-atom %@ -> %@ as %@; useDiskWriter %@>");
  }
  else
  {
    if (self->_kind)
    {
      v4 = CFSTR("<post-folder-atom>");
      return v4;
    }
    v2 = CFSTR("<folder-atom %@ -> %@ as %@; useDiskWriter %@>");
  }
  if (self->_useDiskWriter)
    v3 = CFSTR("yes");
  else
    v3 = CFSTR("no");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v2, self->_source, self->_targetFolder, self->_targetName, v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (unsigned)kind
{
  return self->_kind;
}

- (FPActionOperationLocator)root
{
  return self->_root;
}

- (FPActionOperationLocator)source
{
  return self->_source;
}

- (NSString)targetName
{
  return self->_targetName;
}

- (FPActionOperationLocator)targetFolder
{
  return self->_targetFolder;
}

- (BOOL)useAtomicMove
{
  return self->_useAtomicMove;
}

- (BOOL)useDiskWriter
{
  return self->_useDiskWriter;
}

- (unint64_t)materializeOption
{
  return self->_materializeOption;
}

- (unint64_t)targetMaterializeOption
{
  return self->_targetMaterializeOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetFolder, 0);
  objc_storeStrong((id *)&self->_targetName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

@end
