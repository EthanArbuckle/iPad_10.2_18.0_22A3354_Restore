@implementation ICCRSet

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[ICCRSet dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (ICCRDictionary)dictionary
{
  return self->_dictionary;
}

- (ICCRSet)init
{
  return -[ICCRSet initWithDocument:](self, "initWithDocument:", 0);
}

- (ICCRSet)initWithDocument:(id)a3
{
  id v4;
  ICCRSet *v5;
  ICCRDictionary *v6;
  ICCRDictionary *dictionary;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCRSet;
  v5 = -[ICCRSet init](&v11, sel_init);
  if (v5)
  {
    v6 = -[ICCRDictionary initWithDocument:]([ICCRDictionary alloc], "initWithDocument:", v4);
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

  }
  return v5;
}

- (void)walkGraph:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[ICCRSet dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[ICCRSet dictionary](self, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::Dictionary *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 4)
  {
    v6 = *(CRDT::Dictionary **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 4;
    v6 = (CRDT::Dictionary *)operator new();
    CRDT::Dictionary::Dictionary(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[ICCRSet dictionary](self, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeWithICCRCoder:dictionary:elementValueCoder:", v8, v6, &__block_literal_global_55);

}

void __31__ICCRSet_encodeWithICCRCoder___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  CRDT::ObjectID *v10;
  id v11;

  v11 = a2;
  v8 = a3;
  v9 = a5;
  if (v8 && objc_msgSend(v8, "conformsToProtocol:", &unk_1EF5316F8))
  {
    *(_DWORD *)(a4 + 32) |= 2u;
    v10 = *(CRDT::ObjectID **)(a4 + 48);
    if (!v10)
    {
      v10 = (CRDT::ObjectID *)operator new();
      CRDT::ObjectID::ObjectID(v10);
      *(_QWORD *)(a4 + 48) = v10;
    }
    objc_msgSend(v9, "encodeObject:forObjectID:", v8, v10);
  }

}

- (void)encodeWithICCRCoder:(id)a3 set:(void *)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[ICCRSet dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeWithICCRCoder:dictionary:", v7, a4);

}

- (void)encodeWithICCRCoder:(id)a3 set:(void *)a4 elementValueCoder:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v9 = a5;
  -[ICCRSet dictionary](self, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__ICCRSet_encodeWithICCRCoder_set_elementValueCoder___block_invoke;
  v12[3] = &unk_1E76CE898;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "encodeWithICCRCoder:dictionary:elementValueCoder:", v8, a4, v12);

}

uint64_t __53__ICCRSet_encodeWithICCRCoder_set_elementValueCoder___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (ICCRSet)initWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  ICCRSet *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 4)
  {
    v6 = -[ICCRSet initWithICCRCoder:set:](self, "initWithICCRCoder:set:", v4, *(_QWORD *)(v5 + 40));
  }
  else
  {
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICCRSet initWithDocument:](self, "initWithDocument:", v7);

  }
  return v6;
}

- (ICCRSet)initWithICCRCoder:(id)a3 set:(const void *)a4
{
  id v6;
  void *v7;
  ICCRSet *v8;
  ICCRDictionary *v9;

  v6 = a3;
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICCRSet initWithDocument:](self, "initWithDocument:", v7);

  if (v8)
  {
    v9 = -[ICCRDictionary initWithICCRCoder:dictionary:elementValueDecoder:]([ICCRDictionary alloc], "initWithICCRCoder:dictionary:elementValueDecoder:", v6, a4, &__block_literal_global_63);
    -[ICCRSet setDictionary:](v8, "setDictionary:", v9);

  }
  return v8;
}

id __33__ICCRSet_initWithICCRCoder_set___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3, void *a4)
{
  CRDT::Dictionary_Element *v6;
  CRDT::Dictionary_Element *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = v6;
  if ((*(_BYTE *)(a2 + 32) & 2) != 0)
  {
    v9 = *(_QWORD *)(a2 + 48);
    if (!v9)
      v9 = *(_QWORD *)(CRDT::Dictionary_Element::default_instance(v6) + 48);
    -[CRDT::Dictionary_Element decodeObjectForProtobufObjectID:](v7, "decodeObjectForProtobufObjectID:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v10 = objc_retainAutorelease(v8);
  *a3 = v10;

  return v10;
}

- (ICCRSet)initWithICCRCoder:(id)a3 set:(const void *)a4 elementValueDecoder:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ICCRSet *v11;
  ICCRDictionary *v12;
  ICCRDictionary *v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICCRSet initWithDocument:](self, "initWithDocument:", v10);

  if (v11)
  {
    v12 = [ICCRDictionary alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__ICCRSet_initWithICCRCoder_set_elementValueDecoder___block_invoke;
    v15[3] = &unk_1E76CE8E0;
    v16 = v9;
    v13 = -[ICCRDictionary initWithICCRCoder:dictionary:elementValueDecoder:](v12, "initWithICCRCoder:dictionary:elementValueDecoder:", v8, a4, v15);
    -[ICCRSet setDictionary:](v11, "setDictionary:", v13);

  }
  return v11;
}

id __53__ICCRSet_initWithICCRCoder_set_elementValueDecoder___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a3 = v4;
  return v4;
}

- (id)member:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICCRSet dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[ICCRSet dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (NSArray)allObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[ICCRSet count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ICCRSet dictionary](self, "dictionary", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (id)anyObject
{
  void *v2;
  void *v3;
  void *v4;

  -[ICCRSet dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICCRSet observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)removeObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICCRSet observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

}

- (void)addObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCRSet dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v4);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICCRSet observers](self, "observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setUpdated:", self);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)removeObject:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICCRSet dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

}

- (void)removeAllObjects
{
  id v2;

  -[ICCRSet dictionary](self, "dictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)setObject:(id)a3
{
  id v4;

  v4 = a3;
  -[ICCRSet removeAllObjects](self, "removeAllObjects");
  if (v4)
    -[ICCRSet addObject:](self, "addObject:", v4);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICCRSet dictionary](self, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ICCRSet dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)mergeWith:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid merge, classes must be equal for merge."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  -[ICCRSet dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeWith:", v5);

}

- (ICCRDocument)document
{
  void *v2;
  void *v3;

  -[ICCRSet dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRDocument *)v3;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ICCRSet *v10;

  v6 = a3;
  v7 = a4;
  -[ICCRSet dictionary](self, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deltaSince:in:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[ICCRSet initWithDocument:]([ICCRSet alloc], "initWithDocument:", v7);
    -[ICCRSet setDictionary:](v10, "setDictionary:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  _QWORD v13[4];
  id v14;

  if (-[ICCRSet count](self, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CB37A0];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p (\n"), v5, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICCRSet dictionary](self, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __22__ICCRSet_description__block_invoke;
    v13[3] = &unk_1E76CE908;
    v8 = v6;
    v14 = v8;
    objc_msgSend(v7, "enumerateKeysObjectsAndTimestampsUsingBlock:", v13);

    objc_msgSend(v8, "replaceCharactersInRange:withString:", objc_msgSend(v8, "length") - 2, 2, CFSTR(")>"));
    v9 = v14;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %p>"), v9, self);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

void __22__ICCRSet_description__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(a4, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("  %@ %@,\n"), v7, v8);

}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
