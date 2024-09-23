@implementation CADEntityWrapper

- (id)loadedValues
{
  return self->_loadedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_loadedValues, 0);
}

- (id)objectID
{
  return self->_objectID;
}

- (CADEntityWrapper)initWithCalEntity:(void *)a3 loadedValues:(id)a4
{
  id v6;
  CADEntityWrapper *v7;
  uint64_t v8;
  CADObjectID *objectID;
  CADEntityWrapper *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CADEntityWrapper;
  v7 = -[CADEntityWrapper init](&v12, sel_init);
  if (v7)
  {
    v7->_entityType = CalEntityGetType();
    v7->_rowID = CalEntityGetID();
    CADEntityCopyObjectID();
    v8 = objc_claimAutoreleasedReturnValue();
    objectID = v7->_objectID;
    v7->_objectID = (CADObjectID *)v8;

    v7->_databaseID = -[CADObjectID databaseID](v7->_objectID, "databaseID");
    if (!v7->_objectID)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v7->_loadedValues, a4);
  }
  v10 = v7;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t databaseID;
  NSArray *loadedValues;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CADEntityWrapper.m"), 83, CFSTR("wha!"));

  }
  objc_msgSend(v8, "encodeInt:forKey:", self->_entityType, CFSTR("entityType"));
  objc_msgSend(v8, "encodeInt:forKey:", self->_rowID, CFSTR("rowID"));
  databaseID = self->_databaseID;
  if ((_DWORD)databaseID)
    objc_msgSend(v8, "encodeInt:forKey:", databaseID, CFSTR("dbID"));
  loadedValues = self->_loadedValues;
  if (loadedValues)
    objc_msgSend(v8, "encodeObject:forKey:", loadedValues, CFSTR("objects"));

}

- (CADEntityWrapper)initWithCoder:(id)a3
{
  id v5;
  CADEntityWrapper *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *loadedValues;
  uint64_t v12;
  CADObjectID *objectID;
  void *v15;
  objc_super v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CADEntityWrapper.m"), 60, CFSTR("wha!"));

  }
  v16.receiver = self;
  v16.super_class = (Class)CADEntityWrapper;
  v6 = -[CADEntityWrapper init](&v16, sel_init);
  if (v6)
  {
    if (initWithCoder__onceToken_1 != -1)
      dispatch_once(&initWithCoder__onceToken_1, &__block_literal_global_26);
    v7 = objc_msgSend(v5, "decodeIntForKey:", CFSTR("entityType"));
    v8 = objc_msgSend(v5, "decodeIntForKey:", CFSTR("rowID"));
    v9 = objc_msgSend(v5, "decodeIntForKey:", CFSTR("dbID"));
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", initWithCoder__allowedObjectClasses, CFSTR("objects"));
    v10 = objc_claimAutoreleasedReturnValue();
    loadedValues = v6->_loadedValues;
    v6->_loadedValues = (NSArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", v7, v8, v9);
    objectID = v6->_objectID;
    v6->_objectID = (CADObjectID *)v12;

  }
  return v6;
}

void __34__CADEntityWrapper_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__allowedKeyClasses;
  initWithCoder__allowedKeyClasses = v2;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)initWithCoder__allowedObjectClasses;
  initWithCoder__allowedObjectClasses = v11;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADEntityWrapper)initWithCalEntity:(void *)a3
{
  return -[CADEntityWrapper initWithCalEntity:loadedValues:](self, "initWithCalEntity:loadedValues:", a3, 0);
}

@end
