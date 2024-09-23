@implementation NSManagedObjectModelReference

- (NSManagedObjectModelReference)initWithFileURL:(NSURL *)fileURL versionChecksum:(NSString *)versionChecksum
{
  NSManagedObjectModelReference *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSManagedObjectModelReference;
  v6 = -[NSManagedObjectModelReference init](&v8, sel_init);
  if (v6)
  {
    v6->_fileURL = (NSURL *)-[NSURL copy](fileURL, "copy");
    v6->_versionChecksum = (NSString *)-[NSString copy](versionChecksum, "copy");
  }
  return v6;
}

- (NSManagedObjectModelReference)initWithEntityVersionHashes:(NSDictionary *)versionHash inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum
{
  NSManagedObjectModelReference *v8;
  NSBundle *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSManagedObjectModelReference;
  v8 = -[NSManagedObjectModelReference init](&v11, sel_init);
  if (v8)
  {
    v8->_entityVersionHashes = (NSDictionary *)-[NSDictionary copy](versionHash, "copy");
    if (bundle)
      v9 = bundle;
    else
      v9 = (NSBundle *)(id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8->_bundle = v9;
    v8->_versionChecksum = (NSString *)-[NSString copy](versionChecksum, "copy");
  }
  return v8;
}

- (NSManagedObjectModelReference)initWithName:(NSString *)modelName inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum
{
  NSManagedObjectModelReference *v8;
  NSBundle *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSManagedObjectModelReference;
  v8 = -[NSManagedObjectModelReference init](&v11, sel_init);
  if (v8)
  {
    v8->_modelName = (NSString *)-[NSString copy](modelName, "copy");
    if (bundle)
      v9 = bundle;
    else
      v9 = (NSBundle *)(id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8->_bundle = v9;
    v8->_versionChecksum = (NSString *)-[NSString copy](versionChecksum, "copy");
  }
  return v8;
}

- (NSManagedObjectModelReference)initWithModel:(NSManagedObjectModel *)model versionChecksum:(NSString *)versionChecksum
{
  NSManagedObjectModelReference *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSManagedObjectModelReference;
  v6 = -[NSManagedObjectModelReference init](&v8, sel_init);
  if (v6)
  {
    v6->_model = (NSManagedObjectModel *)-[NSManagedObjectModel copy](model, "copy");
    v6->_versionChecksum = (NSString *)-[NSString copy](versionChecksum, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_fileURL = 0;
  self->_versionChecksum = 0;

  self->_bundle = 0;
  self->_modelName = 0;

  self->_entityVersionHashes = 0;
  self->_model = 0;

  self->_resolvedModel = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSManagedObjectModelReference;
  -[NSManagedObjectModelReference dealloc](&v3, sel_dealloc);
}

- (BOOL)resolve:(id *)a3
{
  NSManagedObjectModel *model;
  NSManagedObjectModel *bundle;
  id v8;
  NSString *modelName;
  void *v10;
  NSDictionary *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSManagedObjectModel *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSManagedObjectModel *resolvedModel;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  uint64_t *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[128];
  NSManagedObjectModel *v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (self->_resolvedModel)
    return 1;
  v41 = 0;
  model = self->_model;
  if (model)
  {
    bundle = model;
LABEL_7:
    self->_resolvedModel = bundle;
    goto LABEL_8;
  }
  if (self->_fileURL)
  {
    bundle = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", self->_fileURL);
    goto LABEL_7;
  }
  bundle = (NSManagedObjectModel *)self->_bundle;
  if (!bundle)
  {
LABEL_8:
    -[NSManagedObjectModel _setIsEditable:](bundle, "_setIsEditable:", 0);
    if (!-[NSString isEqualToString:](-[NSManagedObjectModel versionChecksum](self->_resolvedModel, "versionChecksum"), "isEqualToString:", self->_versionChecksum))
    {
      v41 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134100, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("The version hash (and associated hashes) are incompatible with the current Core Data version."), CFSTR("reason"), -[NSManagedObjectModel versionHash](self->_resolvedModel, "versionHash"), CFSTR("versionHash"), self->_versionChecksum, CFSTR("checksum"), 0));

      self->_resolvedModel = 0;
    }
    goto LABEL_10;
  }
  modelName = self->_modelName;
  if (!modelName)
  {
    if (!self->_entityVersionHashes)
    {
      bundle = 0;
      goto LABEL_8;
    }
    v45 = bundle;
    v19 = +[NSManagedObjectModel _modelPathsFromBundles:]((uint64_t)NSManagedObjectModel, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
LABEL_30:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v23));
        v25 = +[NSManagedObjectModel versionsHashesForModelAtURL:error:](NSManagedObjectModel, "versionsHashesForModelAtURL:error:", v24, &v41);
        if (v41)
          break;
        if (objc_msgSend(v25, "isEqualToDictionary:", self->_entityVersionHashes))
        {
          resolvedModel = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", v24);
          self->_resolvedModel = resolvedModel;
          goto LABEL_44;
        }
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          if (v21)
            goto LABEL_30;
          break;
        }
      }
    }
    resolvedModel = self->_resolvedModel;
LABEL_44:
    if (resolvedModel)
    {
      v12 = v41;
      goto LABEL_49;
    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB28A8];
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A model with version hashes %@ could not be found in the bundle at %@."), self->_entityVersionHashes, -[NSBundle bundlePath](self->_bundle, "bundlePath"));
    v29 = (void *)MEMORY[0x1E0C99D80];
    v30 = &v43;
    v31 = &v42;
    goto LABEL_47;
  }
  v10 = (void *)-[NSManagedObjectModel URLForResource:withExtension:](bundle, "URLForResource:withExtension:", modelName, CFSTR("momd"));
  v40 = 0;
  v11 = +[NSManagedObjectModel checksumsForVersionedModelAtURL:error:](NSManagedObjectModel, "checksumsForVersionedModelAtURL:error:", v10, &v40);
  v12 = v40;
  if (!v40)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", v17), "isEqualToString:", self->_versionChecksum))
          {
            v18 = -[NSManagedObjectModel initWithContentsOfURL:]([NSManagedObjectModel alloc], "initWithContentsOfURL:", objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", v17), "URLByAppendingPathExtension:", CFSTR("mom")));
            self->_resolvedModel = v18;
            goto LABEL_39;
          }
        }
        v14 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v14)
          continue;
        break;
      }
    }
    v18 = self->_resolvedModel;
LABEL_39:
    if (v18)
    {
      v12 = 0;
      goto LABEL_49;
    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB28A8];
    v46 = *MEMORY[0x1E0CB2D50];
    v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A model with version checksum %@ could not be found in the bundle at %@."), self->_versionChecksum, -[NSBundle bundlePath](self->_bundle, "bundlePath"));
    v29 = (void *)MEMORY[0x1E0C99D80];
    v30 = &v47;
    v31 = &v46;
LABEL_47:
    v12 = (id)objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 134504, objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1));
  }
  v41 = v12;
LABEL_49:
  if (!v12)
  {
    bundle = self->_resolvedModel;
    goto LABEL_8;
  }
LABEL_10:
  v8 = v41;
  if (a3)
  {
    if (v41)
    {
      *a3 = v41;
      v8 = v41;
    }
  }
  return v8 == 0;
}

- (void)unresolve
{

  self->_resolvedModel = 0;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)versionChecksum
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModelName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)entityVersionHashes
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEntityVersionHashes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSManagedObjectModel)model
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSManagedObjectModel)resolvedModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 56, 1);
}

@end
