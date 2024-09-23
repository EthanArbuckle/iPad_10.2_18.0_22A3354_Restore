@implementation BWInferenceSimpleTextureStorage

- (BWInferenceSimpleTextureStorage)init
{
  BWInferenceSimpleTextureStorage *v2;
  void *v3;
  NSMapTable *v4;
  NSMapTable *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWInferenceSimpleTextureStorage;
  v2 = -[BWInferenceSimpleTextureStorage init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 1027);
    objc_msgSend(v3, "setSizeFunction:", BWInferenceTextureStorageEntrySize);
    objc_msgSend(v3, "setRelinquishFunction:", BWInferenceTextureStorageEntryRelinquish);
    v4 = (NSMapTable *)objc_msgSend(MEMORY[0x1E0CB3748], "bw_strongVideoRequirementToMapTableWithValueFunctions:", v3);
    v2->_entriesByRequirement = v4;
    v5 = v4;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSimpleTextureStorage;
  -[BWInferenceSimpleTextureStorage dealloc](&v3, sel_dealloc);
}

- ($95D4E385FD83359993E7565DC9C2EA0D)entryForRequirement:(id)a3
{
  return ($95D4E385FD83359993E7565DC9C2EA0D *)-[NSMapTable objectForKey:](self->_entriesByRequirement, "objectForKey:", a3);
}

- (void)setEntry:(id *)a3 forRequirement:(id)a4
{
  id v7;
  id v8;

  v7 = a3->var0.var0;
  v8 = a3->var1;
  -[NSMapTable setObject:forKey:](self->_entriesByRequirement, "setObject:forKey:", a3, a4);
}

- (void)setTexture:(id)a3 forRequirement:(id)a4
{
  _QWORD v6[2];

  v6[0] = a3;
  v6[1] = 0;
  -[NSMapTable setObject:forKey:](self->_entriesByRequirement, "setObject:forKey:", v6, a4);
}

- (void)clear
{
  -[NSMapTable removeAllObjects](self->_entriesByRequirement, "removeAllObjects");
}

@end
