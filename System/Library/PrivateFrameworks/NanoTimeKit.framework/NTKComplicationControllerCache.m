@implementation NTKComplicationControllerCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_2 != -1)
    dispatch_once(&sharedCache_onceToken_2, &__block_literal_global_137);
  return (id)sharedCache___cache;
}

void __45__NTKComplicationControllerCache_sharedCache__block_invoke()
{
  NTKComplicationControllerCache *v0;
  void *v1;

  v0 = objc_alloc_init(NTKComplicationControllerCache);
  v1 = (void *)sharedCache___cache;
  sharedCache___cache = (uint64_t)v0;

}

- (NTKComplicationControllerCache)init
{
  NTKComplicationControllerCache *v2;
  uint64_t v3;
  NSMapTable *controllers;
  uint64_t v5;
  NSMapTable *faceToControllers;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationControllerCache;
  v2 = -[NTKComplicationControllerCache init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    controllers = v2->_controllers;
    v2->_controllers = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    faceToControllers = v2->_faceToControllers;
    v2->_faceToControllers = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__purge, *MEMORY[0x1E0C93E68], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93E68], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationControllerCache;
  -[NTKComplicationControllerCache dealloc](&v4, sel_dealloc);
}

- (id)controllerForComplication:(id)a3 variant:(id)a4 device:(id)a5 create:(id)a6
{
  void (**v10)(_QWORD);
  void *v11;
  void *v12;

  v10 = (void (**)(_QWORD))a6;
  +[_NTKComplicationCacheKey keyWithVariant:complication:forDevice:](_NTKComplicationCacheKey, "keyWithVariant:complication:forDevice:", a4, a3, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_controllers, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v10[2](v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_controllers, "setObject:forKey:", v12, v11);
  }

  return v12;
}

- (void)setLibraryCollection:(id)a3
{
  NTKFaceCollection *v5;
  NTKFaceCollection *libraryCollection;
  uint64_t v7;
  NTKFaceCollection *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = (NTKFaceCollection *)a3;
  libraryCollection = self->_libraryCollection;
  if (libraryCollection != v5)
  {
    -[NTKFaceCollection removeObserver:](libraryCollection, "removeObserver:", self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = self->_libraryCollection;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__NTKComplicationControllerCache_setLibraryCollection___block_invoke;
    v10[3] = &unk_1E6BD06D8;
    v10[4] = self;
    -[NTKFaceCollection enumerateFacesUsingBlock:](v8, "enumerateFacesUsingBlock:", v10);
    objc_storeStrong((id *)&self->_libraryCollection, a3);
    -[NTKFaceCollection addObserver:](v5, "addObserver:", self);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __55__NTKComplicationControllerCache_setLibraryCollection___block_invoke_2;
    v9[3] = &unk_1E6BD06D8;
    v9[4] = self;
    -[NTKFaceCollection enumerateFacesUsingBlock:](v5, "enumerateFacesUsingBlock:", v9);
  }

}

uint64_t __55__NTKComplicationControllerCache_setLibraryCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterFace:", a2);
}

uint64_t __55__NTKComplicationControllerCache_setLibraryCollection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerFace:", a2);
}

- (void)faceCollectionDidLoad:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[NTKComplicationControllerCache _cleanupRemovedFaces](self, "_cleanupRemovedFaces");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__NTKComplicationControllerCache_faceCollectionDidLoad___block_invoke;
  v5[3] = &unk_1E6BD06D8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateFacesUsingBlock:", v5);

}

uint64_t __56__NTKComplicationControllerCache_faceCollectionDidLoad___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerFace:", a2);
}

- (void)faceCollectionDidReset:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[NTKComplicationControllerCache _cleanupRemovedFaces](self, "_cleanupRemovedFaces");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__NTKComplicationControllerCache_faceCollectionDidReset___block_invoke;
  v5[3] = &unk_1E6BD06D8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateFacesUsingBlock:", v5);

}

uint64_t __57__NTKComplicationControllerCache_faceCollectionDidReset___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerFace:", a2);
}

- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5
{
  -[NTKComplicationControllerCache _registerFace:](self, "_registerFace:", a4);
}

- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5
{
  -[NTKComplicationControllerCache _unregisterFace:](self, "_unregisterFace:", a4);
}

- (void)_registerFace:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addObserver:", self);
  -[NTKComplicationControllerCache _updateControllersForFace:](self, "_updateControllersForFace:", v4);

}

- (void)_unregisterFace:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeObserver:", self);
  -[NTKComplicationControllerCache _removeControllersForFace:](self, "_removeControllersForFace:", v4);

}

- (void)_removeControllersForFace:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_faceToControllers, "removeObjectForKey:", a3);
}

- (void)_updateControllersForFace:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSMapTable *faceToControllers;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __60__NTKComplicationControllerCache__updateControllersForFace___block_invoke;
  v13 = &unk_1E6BCF4C8;
  v14 = v4;
  v15 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v7, "enumerateComplicationSlotsWithBlock:", &v10);
  faceToControllers = self->_faceToControllers;
  v9 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);
  -[NSMapTable setObject:forKey:](faceToControllers, "setObject:forKey:", v9, v7);

}

void __60__NTKComplicationControllerCache__updateControllersForFace___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "complicationForSlot:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "complicationVariantForComplication:withSlot:", v8, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationController controllerForComplication:variant:device:](NTKComplicationController, "controllerForComplication:variant:device:", v8, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

- (void)_purge
{
  -[NSMapTable removeAllObjects](self->_controllers, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_faceToControllers, "removeAllObjects");
}

- (void)_cleanupRemovedFaces
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[NSMapTable keyEnumerator](self->_faceToControllers, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__NTKComplicationControllerCache__cleanupRemovedFaces__block_invoke;
  v5[3] = &unk_1E6BD8660;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __54__NTKComplicationControllerCache__cleanupRemovedFaces__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsFace:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_unregisterFace:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryCollection, 0);
  objc_storeStrong((id *)&self->_faceToControllers, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
}

@end
