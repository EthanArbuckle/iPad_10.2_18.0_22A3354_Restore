@implementation _AXObjectCacheHelper

+ (_QWORD)helperWithElement:(uint64_t)a3 uid:
{
  _QWORD *v5;

  objc_opt_self();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
  }
  return v5;
}

- (void)dealloc
{
  void *element;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  void *v9;

  element = self->_element;
  if (element)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = ___AXInternalRemoveFromElementCache_block_invoke;
    v8 = &__block_descriptor_40_e5_v8__0l;
    v9 = element;
    AX_PERFORM_WITH_LOCK();
  }
  v4.receiver = self;
  v4.super_class = (Class)_AXObjectCacheHelper;
  -[_AXObjectCacheHelper dealloc](&v4, sel_dealloc);
}

@end
