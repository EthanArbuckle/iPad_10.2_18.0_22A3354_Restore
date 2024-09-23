@implementation ICCROrderedSetElement

+ (id)temporaryElementWithValue:(id)a3
{
  id v3;
  ICCROrderedSetElement *v4;

  v3 = a3;
  v4 = objc_alloc_init(ICCROrderedSetElement);
  -[ICCROrderedSetElement setValue:](v4, "setValue:", v3);

  return v4;
}

- (ICCROrderedSetElement)initWithProtobufSetElement:(const void *)a3 decoder:(id)a4
{
  id v6;
  ICCROrderedSetElement *v7;
  ICCROrderedSetElement *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  ICCRDataType *value;
  ICCRRegisterLatest *v13;
  ICCRRegisterLatest *v14;
  uint64_t v15;
  uint64_t v16;
  ICCRRegisterLatest *index;

  v6 = a4;
  v7 = -[ICCROrderedSetElement init](self, "init");
  v8 = v7;
  if (v7)
  {
    v9 = *((_DWORD *)a3 + 8);
    if ((v9 & 2) != 0)
    {
      v10 = *((_QWORD *)a3 + 6);
      if (!v10)
        v10 = *(_QWORD *)(CRDT::Dictionary_Element::default_instance((CRDT::Dictionary_Element *)v7) + 48);
      objc_msgSend(v6, "decodeObjectForProtobufObjectID:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      value = v8->_value;
      v8->_value = (ICCRDataType *)v11;

      v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 8) != 0)
    {
      v13 = [ICCRRegisterLatest alloc];
      v14 = v13;
      v15 = *((_QWORD *)a3 + 8);
      if (!v15)
        v15 = *(_QWORD *)(CRDT::Dictionary_Element::default_instance((CRDT::Dictionary_Element *)v13) + 64);
      v16 = -[ICCRRegisterLatest initWithProtobufRegisterLatest:decoder:](v14, "initWithProtobufRegisterLatest:decoder:", v15, v6);
      index = v8->_index;
      v8->_index = (ICCRRegisterLatest *)v16;

    }
  }

  return v8;
}

- (void)encodeIntoProtobufSetElement:(void *)a3 coder:(id)a4
{
  void *v6;
  void *v7;
  CRDT::ObjectID *v8;
  void *v9;
  CRDT::RegisterLatest *v10;
  id v11;

  v11 = a4;
  -[ICCROrderedSetElement value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICCROrderedSetElement value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)a3 + 8) |= 2u;
    v8 = (CRDT::ObjectID *)*((_QWORD *)a3 + 6);
    if (!v8)
    {
      v8 = (CRDT::ObjectID *)operator new();
      CRDT::ObjectID::ObjectID(v8);
      *((_QWORD *)a3 + 6) = v8;
    }
    objc_msgSend(v11, "encodeObject:forObjectID:", v7, v8);

  }
  -[ICCROrderedSetElement index](self, "index");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)a3 + 8) |= 8u;
  v10 = (CRDT::RegisterLatest *)*((_QWORD *)a3 + 8);
  if (!v10)
  {
    v10 = (CRDT::RegisterLatest *)operator new();
    CRDT::RegisterLatest::RegisterLatest(v10);
    *((_QWORD *)a3 + 8) = v10;
  }
  objc_msgSend(v9, "encodeIntoProtobufRegisterLatest:coder:", v10, v11);

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ICCROrderedSetElement value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
    -[ICCROrderedSetElement value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICCROrderedSetElement *v4;
  void *v5;
  void *v6;

  v4 = -[ICCROrderedSetElement init](+[ICCROrderedSetElement allocWithZone:](ICCROrderedSetElement, "allocWithZone:", a3), "init");
  -[ICCROrderedSetElement value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCROrderedSetElement setValue:](v4, "setValue:", v5);

  -[ICCROrderedSetElement index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCROrderedSetElement setIndex:](v4, "setIndex:", v6);

  return v4;
}

- (void)mergeWith:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ICCROrderedSetElement index](self, "index");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeWith:", v5);

  -[ICCROrderedSetElement value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mergeWith:", v7);

}

- (void)walkGraph:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[ICCROrderedSetElement index](self, "index");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v4);

  -[ICCROrderedSetElement value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5);

}

- (void)setDocument:(id)a3
{
  void *v4;
  ICCRDataType *v5;
  ICCRDataType *value;
  id v7;

  v7 = a3;
  -[ICCROrderedSetElement value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localObject:", v4);
  v5 = (ICCRDataType *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  self->_value = v5;

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCROrderedSetElement index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCROrderedSetElement value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (ICCRDataType)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (ICCRRegisterLatest)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
