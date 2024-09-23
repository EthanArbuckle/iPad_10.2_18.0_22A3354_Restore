@implementation _CNCacheFixedCapacityBoundingStrategy

- (void)willUpdateCacheBy:(unint64_t)a3 forKey:(id)a4 keysToEvict:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[_CNCacheFixedCapacityBoundingStrategy keys](self, "keys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueObject:", v16);

  if (a3 == 1)
  {
    -[_CNCacheFixedCapacityBoundingStrategy keys](self, "keys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enqueue:", v16);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (1)
  {
    -[_CNCacheFixedCapacityBoundingStrategy keys](self, "keys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = -[_CNCacheFixedCapacityBoundingStrategy capacity](self, "capacity");

    if (v12 <= v13)
      break;
    -[_CNCacheFixedCapacityBoundingStrategy keys](self, "keys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dequeue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

  }
  *a5 = (id)objc_msgSend(v10, "copy");

}

- (CNQueue)keys
{
  return self->_keys;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (BOOL)shouldEvictKey:(id)a3
{
  return 0;
}

- (_CNCacheFixedCapacityBoundingStrategy)initWithCapacity:(unint64_t)a3
{
  _CNCacheFixedCapacityBoundingStrategy *v4;
  CNQueue *v5;
  CNQueue *keys;
  _CNCacheFixedCapacityBoundingStrategy *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CNCacheFixedCapacityBoundingStrategy;
  v4 = -[_CNCacheFixedCapacityBoundingStrategy init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(CNQueue);
    keys = v4->_keys;
    v4->_keys = v5;

    v4->_capacity = a3;
    v7 = v4;
  }

  return v4;
}

- (_CNCacheFixedCapacityBoundingStrategy)init
{
  return -[_CNCacheFixedCapacityBoundingStrategy initWithCapacity:](self, "initWithCapacity:", 100);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("capacity"), self->_capacity);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
