@implementation AGXA10FamilyResourceGroup

- (AGXA10FamilyResourceGroup)initWithDevice:(void *)a3 resources:(const void *)a4 count:(unint64_t)a5
{
  AGXA10FamilyResourceGroup *v8;
  AGXA10FamilyResourceGroup *v9;
  _QWORD v11[8];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AGXA10FamilyResourceGroup;
  v8 = -[AGXA10FamilyResourceGroup init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_initedResourceGroup = 0;
    if (!a5)
      goto LABEL_6;
    if (resource_group_queue(void)::onceToken != -1)
      dispatch_once(&resource_group_queue(void)::onceToken, &__block_literal_global_1586);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__AGXA10FamilyResourceGroup_initWithDevice_resources_count___block_invoke;
    v11[3] = &unk_250400548;
    v11[4] = v9;
    v11[5] = a3;
    v11[6] = a4;
    v11[7] = a5;
    dispatch_sync((dispatch_queue_t)resource_group_queue(void)::_resourceGroupQueue, v11);
    if (!v9->_initedResourceGroup)
    {
LABEL_6:

      return 0;
    }
  }
  return v9;
}

- (BOOL)containsResource:(id)a3
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD block[5];

  if (resource_group_queue(void)::onceToken != -1)
    dispatch_once(&resource_group_queue(void)::onceToken, &__block_literal_global_1586);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__AGXA10FamilyResourceGroup_dealloc__block_invoke;
  block[3] = &unk_2504028D8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)resource_group_queue(void)::_resourceGroupQueue, block);
  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyResourceGroup;
  -[AGXA10FamilyResourceGroup dealloc](&v3, sel_dealloc);
}

void __36__AGXA10FamilyResourceGroup_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 32))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(void **)(v1 + 16);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "backingResource");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

uint64_t __60__AGXA10FamilyResourceGroup_initWithDevice_resources_count___block_invoke(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;
  unsigned int v3;

  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = *(_QWORD *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 32))
  {
    v1 = (_QWORD *)result;
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", v1[6], v1[7]);
    *(_QWORD *)(v1[4] + 16) = result;
    if (v1[7])
    {
      v2 = 0;
      v3 = 1;
      do
      {
        result = objc_msgSend(*(id *)(v1[6] + 8 * v2), "backingResource");
        v2 = v3++;
      }
      while (v1[7] > v2);
    }
  }
  return result;
}

@end
