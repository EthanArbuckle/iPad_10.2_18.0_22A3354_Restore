@implementation HUDashboardActionSetItemModuleController

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  v21 = v9;
  if (!v9)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v21;
  else
    v10 = 0;
  v11 = v10;
  v9 = v21;
  v12 = v21;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

    v9 = v21;
LABEL_7:
    v12 = 0;
  }

  objc_msgSend(v12, "setItem:", v7);
  objc_opt_class();
  -[HUItemModuleController host](self, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_msgSend(v17, "layoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "gridSizeForItem:", v7);
    objc_msgSend(v12, "setGridSize:", v19, v20);

  }
}

- (Class)collectionCellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

@end
