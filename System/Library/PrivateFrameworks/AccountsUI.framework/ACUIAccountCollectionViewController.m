@implementation ACUIAccountCollectionViewController

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location;
  BOOL v7;
  SEL v8;
  ACUIAccountCollectionViewController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v4 = (id)-[ACUIAccountCollectionViewController specifier](self, "specifier");
  location = (id)objc_msgSend(v4, "propertyForKey:", CFSTR("ACUIAccountCollectionTitle"));

  if (location)
  {
    v3 = (id)-[ACUIAccountCollectionViewController navigationItem](v9, "navigationItem");
    objc_msgSend(v3, "setTitle:", location);

  }
  v5.receiver = v9;
  v5.super_class = (Class)ACUIAccountCollectionViewController;
  -[ACUIAccountCollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_, v7);
  objc_storeStrong(&location, 0);
}

- (id)specifiers
{
  id v3;
  id location;
  id v5[2];
  ACUIAccountCollectionViewController *v6;

  v6 = self;
  v5[1] = (id)a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]))
  {
    v5[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = (id)-[ACUIAccountCollectionViewController specifier](v6, "specifier");
    location = (id)objc_msgSend(v3, "propertyForKey:", CFSTR("ACUIAccountCollectionSpecifiers"));

    if (location)
      objc_msgSend(v5[0], "addObjectsFromArray:", location);
    objc_storeStrong((id *)((char *)&v6->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), v5[0]);
    objc_storeStrong(&location, 0);
    objc_storeStrong(v5, 0);
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&v6->super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E0D80590]));
}

- (void)removeContiguousSpecifiers:(id)a3 animated:(BOOL)a4
{
  id v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v13;
  _QWORD __b[8];
  uint64_t v15;
  char v16;
  objc_super v17;
  BOOL v18;
  id location[2];
  ACUIAccountCollectionViewController *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v17.receiver = v20;
  v17.super_class = (Class)ACUIAccountCollectionViewController;
  -[ACUIAccountCollectionViewController removeContiguousSpecifiers:animated:](&v17, sel_removeContiguousSpecifiers_animated_, location[0], a4);
  v16 = 0;
  memset(__b, 0, sizeof(__b));
  obj = -[ACUIAccountCollectionViewController specifiers](v20, "specifiers");
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
  if (v13)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v13;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v15 = *(_QWORD *)(__b[1] + 8 * v9);
      if (*(_QWORD *)(v15 + (int)*MEMORY[0x1E0D805B0]))
        break;
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
        if (!v10)
          goto LABEL_9;
      }
    }
    v16 = 1;
  }
LABEL_9:

  if ((v16 & 1) == 0)
  {
    v6 = (id)-[ACUIAccountCollectionViewController navigationController](v20, "navigationController");
    WeakRetained = objc_loadWeakRetained((id *)((char *)&v20->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E0D80618]));
    v4 = (id)objc_msgSend(v6, "popToViewController:animated:");

  }
  objc_storeStrong(location, 0);
}

@end
