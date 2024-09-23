@implementation CKLRUCache

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKLRUCache;
  -[CPLRUDictionary dealloc](&v4, sel_dealloc);
}

- (CKLRUCache)initWithMaximumCapacity:(unint64_t)a3
{
  CKLRUCache *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKLRUCache;
  v3 = -[CPLRUDictionary initWithMaximumCapacity:](&v8, sel_initWithMaximumCapacity_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_removeAllObjects, *MEMORY[0x1E0CEB288], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_removeAllObjects, *MEMORY[0x1E0CEB298], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_removeAllObjects, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v3;
}

@end
