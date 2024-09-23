@implementation VNWeakTypeWrapperCollection

- (id)allObjectsDroppingWeakZeroedObjects:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  -[NSRecursiveLock lock](self->_weakObjectWrappersLock, "lock");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__VNWeakTypeWrapperCollection_allObjectsDroppingWeakZeroedObjects___block_invoke;
  v9[3] = &unk_1E45436E8;
  v6 = v5;
  v10 = v6;
  -[VNWeakTypeWrapperCollection _enumerateObjectsDroppingWeakZeroedObjects:usingBlock:](self, "_enumerateObjectsDroppingWeakZeroedObjects:usingBlock:", v3, v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSRecursiveLock unlock](self->_weakObjectWrappersLock, "unlock");
  return v7;
}

- (void)_enumerateObjectsDroppingWeakZeroedObjects:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSMutableArray *weakObjectWrappers;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  _QWORD *v15;
  BOOL v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  v6 = a4;
  v7 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  if (v4)
    v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  weakObjectWrappers = self->_weakObjectWrappers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__VNWeakTypeWrapperCollection__enumerateObjectsDroppingWeakZeroedObjects_usingBlock___block_invoke;
  v11[3] = &unk_1E4543670;
  v16 = v4;
  v9 = v7;
  v12 = v9;
  v14 = &v19;
  v15 = v17;
  v10 = v6;
  v13 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](weakObjectWrappers, "enumerateObjectsUsingBlock:", v11);
  if (*((_BYTE *)v20 + 24))
    -[NSMutableArray removeObjectsAtIndexes:](self->_weakObjectWrappers, "removeObjectsAtIndexes:", v9);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

}

void __85__VNWeakTypeWrapperCollection__enumerateObjectsDroppingWeakZeroedObjects_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  objc_msgSend(a2, "objectAndReturnError:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 || !*(_BYTE *)(a1 + 64))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

uint64_t __67__VNWeakTypeWrapperCollection_allObjectsDroppingWeakZeroedObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)addObject:(id)a3 droppingWeakZeroedObjects:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  VNWeakTypeWrapper *v8;
  VNWeakTypeWrapper *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a4;
  v6 = a3;
  -[NSRecursiveLock lock](self->_weakObjectWrappersLock, "lock");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __67__VNWeakTypeWrapperCollection_addObject_droppingWeakZeroedObjects___block_invoke;
  v13 = &unk_1E4543698;
  v7 = v6;
  v14 = v7;
  v15 = &v16;
  -[VNWeakTypeWrapperCollection _enumerateObjectsDroppingWeakZeroedObjects:usingBlock:](self, "_enumerateObjectsDroppingWeakZeroedObjects:usingBlock:", v4, &v10);
  if (!*((_BYTE *)v17 + 24))
  {
    v8 = [VNWeakTypeWrapper alloc];
    v9 = -[VNWeakTypeWrapper initWithObject:](v8, "initWithObject:", v7, v10, v11, v12, v13);
    -[NSMutableArray addObject:](self->_weakObjectWrappers, "addObject:", v9);

  }
  _Block_object_dispose(&v16, 8);
  -[NSRecursiveLock unlock](self->_weakObjectWrappersLock, "unlock");

}

- (VNWeakTypeWrapperCollection)init
{
  VNWeakTypeWrapperCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *weakObjectWrappers;
  NSRecursiveLock *v5;
  NSRecursiveLock *weakObjectWrappersLock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNWeakTypeWrapperCollection;
  v2 = -[VNWeakTypeWrapperCollection init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    weakObjectWrappers = v2->_weakObjectWrappers;
    v2->_weakObjectWrappers = v3;

    v5 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    weakObjectWrappersLock = v2->_weakObjectWrappersLock;
    v2->_weakObjectWrappersLock = v5;

  }
  return v2;
}

uint64_t __67__VNWeakTypeWrapperCollection_addObject_droppingWeakZeroedObjects___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)findObjectMeetingSearchCriteria:(id)a3 droppingWeakZeroedObjects:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a4;
  v6 = a3;
  -[NSRecursiveLock lock](self->_weakObjectWrappersLock, "lock");
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2031;
  v20 = __Block_byref_object_dispose__2032;
  v21 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __89__VNWeakTypeWrapperCollection_findObjectMeetingSearchCriteria_droppingWeakZeroedObjects___block_invoke;
  v13 = &unk_1E45436C0;
  v7 = v6;
  v14 = v7;
  v15 = &v16;
  -[VNWeakTypeWrapperCollection _enumerateObjectsDroppingWeakZeroedObjects:usingBlock:](self, "_enumerateObjectsDroppingWeakZeroedObjects:usingBlock:", v4, &v10);
  v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  -[NSRecursiveLock unlock](self->_weakObjectWrappersLock, "unlock", v10, v11, v12, v13);

  return v8;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_weakObjectWrappers, "hash");
}

- (BOOL)isEqual:(id)a3
{
  VNWeakTypeWrapperCollection *v4;
  char v5;

  v4 = (VNWeakTypeWrapperCollection *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSMutableArray isEqualToArray:](self->_weakObjectWrappers, "isEqualToArray:", v4->_weakObjectWrappers);
    else
      v5 = 0;
  }

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)VNWeakTypeWrapperCollection;
  -[VNWeakTypeWrapperCollection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@: %@"), v4, self->_weakObjectWrappers);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObjectWrappersLock, 0);
  objc_storeStrong((id *)&self->_weakObjectWrappers, 0);
}

void __89__VNWeakTypeWrapperCollection_findObjectMeetingSearchCriteria_droppingWeakZeroedObjects___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

@end
