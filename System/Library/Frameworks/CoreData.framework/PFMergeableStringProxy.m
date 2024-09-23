@implementation PFMergeableStringProxy

- (PFMergeableStringProxy)init
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is unsupported. Use %@"), NSStringFromSelector(sel_initWithContainer_key_mergeableString_)), 0);
  objc_exception_throw(v2);
}

- (PFMergeableStringProxy)initWithContainer:(id)a3 key:(id)a4 mergeableString:(id)a5
{
  PFMergeableStringProxy *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFMergeableStringProxy;
  v8 = -[PFMergeableStringProxy init](&v10, sel_init);
  if (v8)
  {
    v8->_container = (NSManagedObject *)a3;
    v8->_key = (NSString *)objc_msgSend(a4, "copy");
    v8->_mergeableString = (NSMergeableTransformableStringAttributeValue *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_container = 0;
  self->_key = 0;

  self->_mergeableString = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFMergeableStringProxy;
  -[PFMergeableStringProxy dealloc](&v3, sel_dealloc);
}

- (uint64_t)performOperation:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 8), "willChangeValueForKey:", *(_QWORD *)(result + 16));
    v4 = (void *)objc_msgSend(*(id *)(v3 + 24), "copy");

    *(_QWORD *)(v3 + 24) = 0;
    *(_QWORD *)(v3 + 24) = v4;

    if (a2)
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    objc_msgSend(*(id *)(v3 + 8), "setPrimitiveValue:forKey:", *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 16));
    return objc_msgSend(*(id *)(v3 + 8), "didChangeValueForKey:", *(_QWORD *)(v3 + 16));
  }
  return result;
}

- (void)appendString:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__PFMergeableStringProxy_appendString___block_invoke;
  v3[3] = &unk_1E1EDD430;
  v3[4] = self;
  v3[5] = a3;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v3);
}

uint64_t __39__PFMergeableStringProxy_appendString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "appendString:", *(_QWORD *)(a1 + 40));
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PFMergeableStringProxy_insertString_atIndex___block_invoke;
  v4[3] = &unk_1E1EDD8A8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __47__PFMergeableStringProxy_insertString_atIndex___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "insertString:atIndex:", a1[5], a1[6]);
}

- (void)removeSubrange:(_NSRange)a3
{
  _QWORD v3[5];
  _NSRange v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__PFMergeableStringProxy_removeSubrange___block_invoke;
  v3[3] = &unk_1E1EDD8D0;
  v3[4] = self;
  v4 = a3;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v3);
}

uint64_t __41__PFMergeableStringProxy_removeSubrange___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "removeSubrange:", a1[5], a1[6]);
}

- (void)replaceSubrange:(_NSRange)a3 withString:(id)a4
{
  _QWORD v4[6];
  _NSRange v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PFMergeableStringProxy_replaceSubrange_withString___block_invoke;
  v4[3] = &unk_1E1EDD8F8;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __53__PFMergeableStringProxy_replaceSubrange_withString___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "replaceSubrange:withString:", a1[6], a1[7], a1[5]);
}

- (void)setString:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PFMergeableStringProxy_setString___block_invoke;
  v3[3] = &unk_1E1EDD430;
  v3[4] = self;
  v3[5] = a3;
  -[PFMergeableStringProxy performOperation:]((uint64_t)self, (uint64_t)v3);
}

uint64_t __36__PFMergeableStringProxy_setString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setString:", *(_QWORD *)(a1 + 40));
}

- (id)computedValue
{
  return (id)-[NSMergeableTransformableStringAttributeValue computedValue](self->_mergeableString, "computedValue");
}

- (void)merge:(id)a3
{
  -[NSMergeableTransformableStringAttributeValue merge:](self->_mergeableString, "merge:", a3);
}

+ (BOOL)supportsMergeableTransformable
{
  return 1;
}

@end
