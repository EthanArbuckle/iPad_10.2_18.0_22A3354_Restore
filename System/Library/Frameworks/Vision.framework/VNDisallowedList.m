@implementation VNDisallowedList

+ (id)sceneNetV3
{
  if (sceneNetV3_onceToken != -1)
    dispatch_once(&sceneNetV3_onceToken, &__block_literal_global_699);
  return (id)sceneNetV3_ourPublicDisallowedList;
}

void __40__VNDisallowedList_SceneNet__sceneNetV3__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VNDisallowedList disallowedListFromUTF8StringArray:](VNDisallowedList, "disallowedListFromUTF8StringArray:", _block_invoke_disallowedList);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sceneNetV3_ourPublicDisallowedList;
  sceneNetV3_ourPublicDisallowedList = v0;

}

- (VNDisallowedList)initWithIdentifiers:(id)a3
{
  id v4;
  VNDisallowedList *v5;
  uint64_t v6;
  NSSet *identifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNDisallowedList;
  v5 = -[VNDisallowedList init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSSet *)v6;

  }
  return v5;
}

- (unint64_t)identifierCount
{
  return -[NSSet count](self->_identifiers, "count");
}

- (NSSet)allIdentifiers
{
  return (NSSet *)(id)-[NSSet copy](self->_identifiers, "copy");
}

- (BOOL)containsIdentifier:(id)a3
{
  return -[NSSet containsObject:](self->_identifiers, "containsObject:", a3);
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_identifiers, "hash");
}

- (BOOL)isEqual:(id)a3
{
  VNDisallowedList *v4;
  BOOL v5;

  v4 = (VNDisallowedList *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSSet isEqualToSet:](self->_identifiers, "isEqualToSet:", v4->_identifiers);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

+ (id)disallowedListFromUTF8StringArray:(const char *)a3
{
  id v5;
  const char **v6;
  void *v7;
  void *v9;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (a3 && *a3)
  {
    v6 = a3 + 1;
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *(v6 - 1));
      objc_msgSend(v5, "addObject:", v7);

    }
    while (*v6++);
  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifiers:", v5);

  return v9;
}

@end
