@implementation MPNondurableMediaItem

- (MPNondurableMediaItem)initWithPersistentID:(unint64_t)a3
{
  MPNondurableMediaItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPNondurableMediaItem;
  result = -[MPNondurableMediaItem init](&v5, sel_init);
  if (result)
    result->_persistentID = a3;
  return result;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (BOOL)existsInLibrary
{
  return 0;
}

- (id)valuesForProperties:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__MPNondurableMediaItem_valuesForProperties___block_invoke;
  v11[3] = &unk_1E315BB80;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)valueForProperty:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultPropertyValues");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v8);

  if ((v6 & 1) != 0)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  if (!v7)
  {
    v10 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
    if (v10 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItem.m"), 1422, CFSTR("Subclass %@ must implement -%@ defined in %@."), v14, v15, CFSTR("[MPNondurableMediaItem class]"));

    }
    goto LABEL_6;
  }
  v9 = v7;
LABEL_7:

  return v9;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v6 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItem.m"), 1427, CFSTR("Subclass %@ must implement -%@ defined in %@."), v8, v9, CFSTR("[MPNondurableMediaItem class]"));

  }
}

- (MPNondurableMediaItem)initWithCoder:(id)a3
{
  id v4;
  MPNondurableMediaItem *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPNondurableMediaItem;
  v5 = -[MPMediaItem initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_persistentID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("MPPersistentID"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPNondurableMediaItem;
  v4 = a3;
  -[MPMediaItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_persistentID, CFSTR("MPPersistentID"), v5.receiver, v5.super_class);

}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__MPNondurableMediaItem_enumerateValuesForProperties_usingBlock___block_invoke;
  v8[3] = &unk_1E3158580;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

- (BOOL)isUsableAsRepresentativeItem
{
  return 0;
}

- (id)mediaLibrary
{
  return 0;
}

void __65__MPNondurableMediaItem_enumerateValuesForProperties_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForProperty:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __45__MPNondurableMediaItem_valuesForProperties___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, v4);

}

+ (BOOL)canFilterByProperty:(id)a3
{
  return 0;
}

+ (id)defaultPropertyValues
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
