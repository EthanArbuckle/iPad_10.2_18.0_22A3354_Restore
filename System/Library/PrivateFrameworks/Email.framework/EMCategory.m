@implementation EMCategory

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken != -1)
    dispatch_once(&cachedSelf_onceToken, &__block_literal_global_3);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock);
  return v3;
}

void __37__EMCategory_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs;
  cachedSelf_sUniqueObjectIDs = v0;

}

- (EMCategory)initWithType:(unint64_t)a3 state:(unint64_t)a4
{
  return -[EMCategory initWithType:subtype:isHighImpact:state:](self, "initWithType:subtype:isHighImpact:state:", a3, 0, 0, a4);
}

- (EMCategory)initWithType:(unint64_t)a3 subtype:(unint64_t)a4 isHighImpact:(BOOL)a5 state:(unint64_t)a6
{
  EMCategory *v10;
  EMCategory *v11;
  EMCategory *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EMCategory;
  v10 = -[EMCategory init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_subtype = a4;
    v10->_isHighImpact = a5;
    v10->_state = a6;
  }
  -[EMCategory cachedSelf](v10, "cachedSelf");
  v12 = (EMCategory *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isPrimary
{
  unint64_t v3;

  v3 = -[EMCategory state](self, "state");
  if (v3)
  {
    if (-[EMCategory type](self, "type"))
      LOBYTE(v3) = -[EMCategory isHighImpact](self, "isHighImpact");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  EMStringFromCategoryType(-[EMCategory type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  EMStringFromSubtype(-[EMCategory subtype](self, "subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMCategory state](self, "state");
  if (v7 - 1 > 3)
    v8 = CFSTR("Uncategorized");
  else
    v8 = off_1E70F24B8[v7 - 1];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p Category:%@ subtype:%@ categorizationState:%@>"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)_shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  EMShortStringFromCategoryType(-[EMCategory type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EMShortStringFromSubtype(-[EMCategory subtype](self, "subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@,%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[EMCategory type](self, "type");
  v4 = 33 * (33 * v3 + -[EMCategory subtype](self, "subtype"));
  v5 = 33 * (v4 + -[EMCategory state](self, "state"));
  return v5 + -[EMCategory isHighImpact](self, "isHighImpact") + 1185921;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[EMCategory type](self, "type"), v5 == objc_msgSend(v4, "type"))
    && (v6 = -[EMCategory subtype](self, "subtype"), v6 == objc_msgSend(v4, "subtype"))
    && (v7 = -[EMCategory state](self, "state"), v7 == objc_msgSend(v4, "state")))
  {
    v8 = -[EMCategory isHighImpact](self, "isHighImpact");
    v9 = v8 ^ objc_msgSend(v4, "isHighImpact") ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMCategory)initWithCoder:(id)a3
{
  id v4;
  EMCategory *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMCategory;
  v5 = -[EMCategory init](&v7, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_type"));
    v5->_subtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_subtype"));
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_state"));
    v5->_isHighImpact = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isHighImpact"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMCategory type](self, "type"), CFSTR("EFPropertyKey_type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMCategory subtype](self, "subtype"), CFSTR("EFPropertyKey_subtype"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMCategory state](self, "state"), CFSTR("EFPropertyKey_state"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMCategory isHighImpact](self, "isHighImpact"), CFSTR("EFPropertyKey_isHighImpact"));

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)isHighImpact
{
  return self->_isHighImpact;
}

@end
