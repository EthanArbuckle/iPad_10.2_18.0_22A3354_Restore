@implementation MRTextEditingSession

- (MRTextEditingSession)initWithText:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  MRTextEditingSession *v8;
  uint64_t v9;
  NSString *text;
  uint64_t v11;
  MRTextEditingAttributes *attributes;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRTextEditingSession;
  v8 = -[MRTextEditingSession init](&v14, sel_init);
  if (v8)
  {
    v8->_uniqueIdentifier = arc4random();
    v9 = objc_msgSend(v6, "copy");
    text = v8->_text;
    v8->_text = (NSString *)v9;

    v8->_editing = 0;
    v11 = objc_msgSend(v7, "copy");
    attributes = v8->_attributes;
    v8->_attributes = (MRTextEditingAttributes *)v11;

  }
  return v8;
}

- (MRTextEditingSession)init
{
  return -[MRTextEditingSession initWithText:attributes:](self, "initWithText:attributes:", 0, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p text=\"%@\", attribs=%@>"), v5, self, self->_text, self->_attributes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)objc_opt_class();
  return -[MRTextEditingSession _copyWithZone:usingConcreteClass:]((uint64_t)self, v5, v4);
}

- (id)_copyWithZone:(objc_class *)a3 usingConcreteClass:
{
  id v4;
  uint64_t v5;
  void *v6;

  if (!a1)
    return 0;
  v4 = objc_alloc_init(a3);
  *((_QWORD *)v4 + 4) = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 8), "copy");
  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  *((_BYTE *)v4 + 16) = *(_BYTE *)(a1 + 16);
  objc_storeStrong((id *)v4 + 3, *(id *)(a1 + 24));
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)objc_opt_class();
  return -[MRTextEditingSession _copyWithZone:usingConcreteClass:]((uint64_t)self, v5, v4);
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (MRTextEditingAttributes)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
