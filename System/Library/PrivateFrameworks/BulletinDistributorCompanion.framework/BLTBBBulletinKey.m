@implementation BLTBBBulletinKey

+ (id)bulletinKeyWithSectionID:(id)a3 publisherMatchID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSectionID:publisherMatchID:", v7, v6);

  return v8;
}

- (BLTBBBulletinKey)initWithSectionID:(id)a3 publisherMatchID:(id)a4
{
  id v6;
  id v7;
  BLTBBBulletinKey *v8;
  uint64_t v9;
  NSString *sectionID;
  uint64_t v11;
  NSString *publisherMatchID;
  NSObject *v13;
  BLTBBBulletinKey *v14;
  void *v15;
  BLTBBBulletinKey *v16;
  BLTBBBulletinKey *v17;
  BLTBBBulletinKey *v18;
  _QWORD v20[4];
  BLTBBBulletinKey *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  if (initWithSectionID_publisherMatchID__onceToken != -1)
    dispatch_once(&initWithSectionID_publisherMatchID__onceToken, &__block_literal_global_7);
  v29.receiver = self;
  v29.super_class = (Class)BLTBBBulletinKey;
  v8 = -[BLTBBBulletinKey init](&v29, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sectionID = v8->_sectionID;
    v8->_sectionID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    publisherMatchID = v8->_publisherMatchID;
    v8->_publisherMatchID = (NSString *)v11;

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v13 = initWithSectionID_publisherMatchID__cacheQueue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __55__BLTBBBulletinKey_initWithSectionID_publisherMatchID___block_invoke_2;
  v20[3] = &unk_24D761CF8;
  v22 = &v23;
  v14 = v8;
  v21 = v14;
  dispatch_sync(v13, v20);
  v15 = (void *)v24[5];
  if (v15)
  {
    v16 = v15;

    v14 = v16;
  }
  v17 = v21;
  v18 = v14;

  _Block_object_dispose(&v23, 8);
  return v18;
}

void __55__BLTBBBulletinKey_initWithSectionID_publisherMatchID___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithSectionID_publisherMatchID__cache;
  initWithSectionID_publisherMatchID__cache = v0;

  v2 = dispatch_queue_create("com.apple.Carousel.bulletinKeyCache", 0);
  v3 = (void *)initWithSectionID_publisherMatchID__cacheQueue;
  initWithSectionID_publisherMatchID__cacheQueue = (uint64_t)v2;

}

void __55__BLTBBBulletinKey_initWithSectionID_publisherMatchID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)initWithSectionID_publisherMatchID__cache, "member:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    objc_msgSend((id)initWithSectionID_publisherMatchID__cache, "addObject:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_sectionID, "hash");
  return -[NSString hash](self->_publisherMatchID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[BLTBBBulletinKey sectionID](self, "sectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      -[BLTBBBulletinKey sectionID](self, "sectionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sectionID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToString:", v3))
      {
        v10 = 0;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      v16 = v9;
    }
    -[BLTBBBulletinKey publisherMatchID](self, "publisherMatchID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publisherMatchID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v10 = 1;
    }
    else
    {
      -[BLTBBBulletinKey publisherMatchID](self, "publisherMatchID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "publisherMatchID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "isEqualToString:", v14);

    }
    v9 = v16;
    if (v7 == v8)
      goto LABEL_12;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTBBBulletinKey sectionID](self, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTBBBulletinKey publisherMatchID](self, "publisherMatchID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p sectionID=%@; publisherMatchID=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)keyString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BLTBBBulletinKey sectionID](self, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTBBBulletinKey publisherMatchID](self, "publisherMatchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@--%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blt_sanitizeForURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSString)publisherMatchID
{
  return self->_publisherMatchID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherMatchID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
