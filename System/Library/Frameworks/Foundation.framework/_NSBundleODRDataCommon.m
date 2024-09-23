@implementation _NSBundleODRDataCommon

- (_NSBundleODRDataCommon)initWithBundle:(id)a3
{
  _NSBundleODRDataCommon *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_NSBundleODRDataCommon;
  v4 = -[_NSBundleODRDataCommon init](&v6, sel_init);
  v4->_bundle = (NSBundle *)a3;
  v4->_assetPackToURL = (NSMutableDictionary *)objc_opt_new();
  v4->_lock = (NSLock *)objc_opt_new();
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  if (self->_sandboxToken >= 1)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)_NSBundleODRDataCommon;
  -[_NSBundleODRDataCommon dealloc](&v3, sel_dealloc);
}

- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4
{
  uint64_t *v7;
  void *v8;
  char v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  -[NSLock lock](self->_lock, "lock");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58___NSBundleODRDataCommon_assetPacksBecameAvailable_error___block_invoke;
  v11[3] = &unk_1E0F50CD8;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v11);
  -[NSLock unlock](self->_lock, "unlock");
  v7 = v13;
  if (a4)
  {
    if (!*((_BYTE *)v19 + 24))
    {
      v8 = (void *)v13[5];
      if (v8)
      {
        *a4 = v8;
        v7 = v13;
      }
    }
  }

  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4
{
  uint64_t *v7;
  void *v8;
  char v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  -[NSLock lock](self->_lock, "lock");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60___NSBundleODRDataCommon_assetPacksBecameUnavailable_error___block_invoke;
  v11[3] = &unk_1E0F50CD8;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v11);
  -[NSLock unlock](self->_lock, "unlock");
  v7 = v13;
  if (a4)
  {
    if (!*((_BYTE *)v19 + 24))
    {
      v8 = (void *)v13[5];
      if (v8)
      {
        *a4 = v8;
        v7 = v13;
      }
    }
  }

  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

@end
