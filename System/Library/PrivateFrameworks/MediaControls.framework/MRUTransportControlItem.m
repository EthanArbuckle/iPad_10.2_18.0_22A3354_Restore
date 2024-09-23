@implementation MRUTransportControlItem

- (MRUTransportControlItem)initWithIdentifier:(id)a3 asset:(id)a4 mainAction:(id)a5
{
  return -[MRUTransportControlItem initWithIdentifier:asset:mainAction:holdBeganAction:holdEndAction:](self, "initWithIdentifier:asset:mainAction:holdBeganAction:holdEndAction:", a3, a4, a5, 0, 0);
}

- (MRUTransportControlItem)initWithIdentifier:(id)a3 asset:(id)a4 mainAction:(id)a5 holdBeganAction:(id)a6 holdEndAction:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MRUTransportControlItem *v18;
  MRUTransportControlItem *v19;
  void *v20;
  id mainAction;
  void *v22;
  id holdBeganAction;
  void *v24;
  id holdEndAction;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MRUTransportControlItem;
  v18 = -[MRUTransportControlItem init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_asset, a4);
    v20 = _Block_copy(v15);
    mainAction = v19->_mainAction;
    v19->_mainAction = v20;

    v22 = _Block_copy(v16);
    holdBeganAction = v19->_holdBeganAction;
    v19->_holdBeganAction = v22;

    v24 = _Block_copy(v17);
    holdEndAction = v19->_holdEndAction;
    v19->_holdEndAction = v24;

  }
  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *identifier;
  MRUAsset *asset;
  const __CFString *v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  identifier = self->_identifier;
  asset = self->_asset;
  if (-[MRUTransportControlItem isEnabled](self, "isEnabled"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[MRUTransportControlItem supportsHolding](self, "supportsHolding"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ identifier: %@ | asset: %@ | enabled: %@ | holding: %@"), v4, identifier, asset, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  MRUTransportControlItem *v4;
  MRUTransportControlItem *v5;
  NSString *v6;
  NSString *v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;

  v4 = (MRUTransportControlItem *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRUTransportControlItem identifier](v5, "identifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == self->_identifier)
        v8 = 1;
      else
        v8 = -[NSString isEqual:](v6, "isEqual:");

      -[MRUTransportControlItem asset](v5, "asset");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v8 & objc_msgSend((id)v10, "isEqual:", self->_asset);

      v12 = -[MRUTransportControlItem isEnabled](v5, "isEnabled");
      LODWORD(v10) = v12 ^ -[MRUTransportControlItem isEnabled](self, "isEnabled");
      v13 = -[MRUTransportControlItem supportsHolding](v5, "supportsHolding");

      v9 = v11 & ((v10 | v13 ^ -[MRUTransportControlItem supportsHolding](self, "supportsHolding")) ^ 1);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (BOOL)isEnabled
{
  return self->_mainAction != 0;
}

- (BOOL)supportsHolding
{
  return self->_holdBeganAction && self->_holdEndAction != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRUAsset)asset
{
  return self->_asset;
}

- (id)mainAction
{
  return self->_mainAction;
}

- (id)holdBeganAction
{
  return self->_holdBeganAction;
}

- (id)holdEndAction
{
  return self->_holdEndAction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_holdEndAction, 0);
  objc_storeStrong(&self->_holdBeganAction, 0);
  objc_storeStrong(&self->_mainAction, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
