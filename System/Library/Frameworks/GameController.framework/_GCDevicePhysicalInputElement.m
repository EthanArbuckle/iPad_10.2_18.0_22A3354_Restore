@implementation _GCDevicePhysicalInputElement

- (_GCDevicePhysicalInputElement)init
{
  -[_GCDevicePhysicalInputElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (_GCDevicePhysicalInputElement)initWithParameters:(id)a3
{
  _QWORD *v5;
  id v6;
  _GCDevicePhysicalInputElement *v7;
  id v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;
  NSString *v19;
  objc_super v20;

  v5 = a3;
  v6 = v5;
  if (!v5 || !v5[1])
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputElement.m"), 35, CFSTR("Invalid parameter not satisfying: %s"), "parameters.identifier != nil");

  }
  v20.receiver = self;
  v20.super_class = (Class)_GCDevicePhysicalInputElement;
  v7 = -[_GCDevicePhysicalInputView initWithParameters:](&v20, sel_initWithParameters_, v6);
  if (v6)
  {
    v8 = *((id *)v6 + 1);
    v9 = objc_msgSend(v8, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = (void *)*((_QWORD *)v6 + 2);
  }
  else
  {
    v18 = objc_msgSend(0, "copy");
    v19 = v7->_identifier;
    v7->_identifier = (NSString *)v18;

    v11 = 0;
  }
  v12 = v11;
  v13 = (void *)objc_msgSend(v12, "copy");
  v14 = v13;
  if (!v13)
    v14 = (void *)objc_opt_new();
  objc_storeStrong((id *)&v7->_aliases, v14);
  if (!v13)

  if (v6)
  {
    -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)v7, *((_QWORD *)v6 + 3), (uint64_t)&v7->_localizedNameSlot, 771);
    v15 = *((_QWORD *)v6 + 4);
  }
  else
  {
    -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)v7, 0, (uint64_t)&v7->_localizedNameSlot, 771);
    v15 = 0;
  }
  -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)v7, v15, (uint64_t)&v7->_symbolSlot, 771);

  return v7;
}

- (uint64_t)_setLocalizedName:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](result, a2, result + 24, 771);
  return result;
}

- (uint64_t)_setSymbol:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](result, a2, result + 32, 771);
  return result;
}

- (_GCDevicePhysicalInputElement)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputElement *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSSet *aliases;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_GCDevicePhysicalInputElement;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputView initWithTemplate:context:](&v14, sel_initWithTemplate_context_, v6, v5);
  objc_msgSend(v6, "identifier", v14.receiver, v14.super_class);
  v8 = objc_claimAutoreleasedReturnValue();
  identifier = v7->_identifier;
  v7->_identifier = (NSString *)v8;

  objc_msgSend(v6, "aliases");
  v10 = objc_claimAutoreleasedReturnValue();
  aliases = v7->_aliases;
  v7->_aliases = (NSSet *)v10;

  v7->_localizedNameSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[3]);
  v12 = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[4]);

  v7->_symbolSlot = v12;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6;
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  char v16;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputElement;
  v9 = -[_GCDevicePhysicalInputView update:forUsages:with:](&v18, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_10;
  if (MyUpdateContext_Offset_10 == -1)
  {
    v10 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_10 = v10;
    if ((v6 & 2) == 0)
      return v9;
  }
  else if ((v6 & 2) == 0)
  {
    return v9;
  }
  v11 = v10;
  v12 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)a5);
  if (self)
    v13 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v12, (uint64_t)&self->_localizedNameSlot, 771);
  else
    v13 = 0;
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFE | v13;

  v14 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)a5);
  if (self)
  {
    v15 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v14, (uint64_t)&self->_symbolSlot, 771);
    if (v15)
      v16 = 2;
    else
      v16 = 0;
  }
  else
  {
    LOBYTE(v15) = 0;
    v16 = 0;
  }
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFD | v16;
  v9 |= v13 | v15;

  return v9;
}

- (uint64_t)_localizedName
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 24);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_symbol
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 32);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  char v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputElement;
  -[_GCDevicePhysicalInputView preCommit:sender:](&v9, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_10;
  if (MyUpdateContext_Offset_10 == -1)
  {
    v6 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_10 = v6;
  }
  v7 = *((_BYTE *)a3 + v6);
  if ((v7 & 1) != 0)
  {
    v8 = v6;
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("localizedName"));
    v7 = *((_BYTE *)a3 + v8);
  }
  if ((v7 & 2) != 0)
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("sfSymbolsName"));
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  char v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputElement;
  -[_GCDevicePhysicalInputView postCommit:sender:](&v9, sel_postCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_10;
  if (MyUpdateContext_Offset_10 == -1)
  {
    v6 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_10 = v6;
  }
  v7 = *((_BYTE *)a3 + v6);
  if ((v7 & 1) != 0)
  {
    v8 = v6;
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("localizedName"));
    v7 = *((_BYTE *)a3 + v8);
  }
  if ((v7 & 2) != 0)
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sfSymbolsName"));
}

- (BOOL)isEqualToElement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputElement.m"), 111, CFSTR("Invalid parameter not satisfying: %s"), "[otherElement isKindOfClass:_GCDevicePhysicalInputElement.class]");
    v15 = 0;
    goto LABEL_20;
  }
  v6 = (void *)objc_opt_class();
  if (objc_msgSend(v6, "isEqual:", objc_opt_class()))
  {
    -[_GCDevicePhysicalInputElement identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v15 = 0;
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    -[_GCDevicePhysicalInputElement aliases](self, "aliases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aliases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v15 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v11 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)self);
    v12 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)v5);
    if (v11 != v12)
    {
      v13 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)self);
      v14 = (void *)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)v5);
      if (!objc_msgSend(v13, "isEqual:", v14))
      {
        v15 = 0;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      v24 = v14;
      v25 = v13;
    }
    v16 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)self);
    v17 = -[_GCDevicePhysicalInputElement _symbol]((uint64_t)v5);
    if (v16 == (void *)v17)
    {

      v15 = 1;
    }
    else
    {
      v18 = (void *)v17;
      v23 = v11;
      v19 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)self);
      v22 = v12;
      v20 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)v5);
      v15 = objc_msgSend(v19, "isEqual:", v20);

      v12 = v22;
      v11 = v23;

    }
    v14 = v24;
    v13 = v25;
    if (v11 == v12)
      goto LABEL_17;
    goto LABEL_16;
  }
  v15 = 0;
LABEL_21:

  return v15;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_GCDevicePhysicalInputElement identifier](self, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    v7 = objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputView physicalInput]((uint64_t)v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8)
    {
      objc_msgSend((id)v7, "physicalInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "physicalInput");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v7 == v8 || v9 == (void *)v10)
      {
        -[_GCDevicePhysicalInputElement identifier](self, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v12, "isEqualToString:", v13);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = -[_GCDevicePhysicalInputElement isEqualToElement:](self, "isEqualToElement:", v5);
    }

    goto LABEL_12;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (NSString)localizedName
{
  return (NSString *)(id)-[_GCDevicePhysicalInputElement _localizedName]((uint64_t)self);
}

- (id)symbol
{
  return (id)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)self);
}

- (NSString)sfSymbolsName
{
  void *v2;
  void *v3;

  v2 = (void *)-[_GCDevicePhysicalInputElement _symbol]((uint64_t)self);
  objc_msgSend(v2, "sfSymbolsName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)aliases
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  return 0;
}

- (BOOL)update:(void *)a3 forMouseEvent:(id *)a4 withTimestamp:(double)a5
{
  return 0;
}

@end
