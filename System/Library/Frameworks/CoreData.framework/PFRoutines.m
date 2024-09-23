@implementation PFRoutines

uint64_t __42___PFRoutines_plistClassesForSecureCoding__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  qword_1ECD8D940 = result;
  return result;
}

uint64_t __46___PFRoutines_attributeClassesForSecureCoding__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  result = objc_msgSend(v15, "initWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  qword_1ECD8D900 = result;
  return result;
}

uint64_t __25___PFRoutines_initialize__block_invoke()
{
  return objc_opt_self();
}

void __29___PFRoutines__frameworkHash__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint32_t v16;
  uint32_t v17;
  const char *image_name;
  size_t v19;
  const mach_header *image_header;
  uint32_t ncmds;
  _DWORD *v22;

  v9 = _dyld_image_count();
  if (!v9)
    goto LABEL_6;
  v16 = v9;
  v17 = 0;
  while (1)
  {
    image_name = _dyld_get_image_name(v17);
    v19 = strlen(image_name);
    if (v19 >= 8 && !strncmp("CoreData", &image_name[v19 - 8], 8uLL))
      break;
    if (v16 == ++v17)
      goto LABEL_6;
  }
  image_header = _dyld_get_image_header(v17);
  if (!image_header)
  {
LABEL_6:
    _NSCoreDataLog(1, (uint64_t)CFSTR(" Can't find CoreData image header."), v10, v11, v12, v13, v14, v15, a9);
    return;
  }
  ncmds = image_header->ncmds;
  if (!ncmds)
  {
LABEL_12:
    if (qword_1ECD8D8F8)
      return;
    goto LABEL_13;
  }
  v22 = (_DWORD *)(((unint64_t)&image_header[1].cputype + 3) & 0xFFFFFFFFFFFFFFF8);
  while (*v22 != 27)
  {
    v22 = (_DWORD *)((char *)v22 + v22[1]);
    if (!--ncmds)
      goto LABEL_12;
  }
  qword_1ECD8D8F8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v22 + 2, (v22[1] - 8));
  if (!qword_1ECD8D8F8)
  {
LABEL_13:
    NSLog((NSString *)CFSTR("Can't find the hash for some reason, using empty data"));
    qword_1ECD8D8F8 = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  }
}

uint64_t __41___PFRoutines__groupObjectsByRootEntity___block_invoke()
{
  return 1;
}

uint64_t __61___PFRoutines_xpcStoreArchiverObjectIDClassesForSecureCoding__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  qword_1ECD8D910 = result;
  return result;
}

uint64_t __56___PFRoutines_historyChangesArrayClassesForSecureCoding__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  qword_1ECD8D920 = result;
  return result;
}

uint64_t __56___PFRoutines_historyQueryGenDataClassesForSecureCoding__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  qword_1ECD8D930 = result;
  return result;
}

void __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSFetchRequest *v7;
  _QWORD v8[4];
  id v9;
  NSFetchRequest *v10;
  uint64_t v11;

  if (a2)
  {
    v7 = objc_alloc_init(NSFetchRequest);
    -[NSFetchRequest setEntity:](v7, "setEntity:", a2);
    -[NSFetchRequest setIncludesSubentities:](v7, "setIncludesSubentities:", 1);
    -[NSFetchRequest setIncludesPendingChanges:](v7, "setIncludesPendingChanges:", 0);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v7, "setReturnsObjectsAsFaults:", 0);
    -[NSFetchRequest setPredicate:](v7, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a3));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke_2;
    v8[3] = &unk_1E1EDD138;
    v6 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    v10 = v7;
    v11 = v6;
    if (objc_msgSend(v9, "concurrencyType") == 1 || objc_msgSend(*(id *)(a1 + 32), "concurrencyType") == 2)
      objc_msgSend(*(id *)(a1 + 32), "performBlockAndWait:", v8);
    else
      __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke_2((uint64_t)v8);

  }
}

uint64_t __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), &v5);
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v3);
  return objc_msgSend(v2, "drain");
}

@end
