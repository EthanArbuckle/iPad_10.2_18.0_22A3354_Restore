@implementation MKTransitIcon

- (MKTransitIcon)initWithCartoId:(unsigned int)a3 defaultTransitType:(unsigned int)a4
{
  MKTransitIcon *v6;
  MKTransitIcon *v7;
  MKTransitIcon *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MKTransitIcon;
  v6 = -[MKTransitIcon init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_cartoID = a3;
    v6->_defaultTransitType = a4;
    v8 = v6;
  }

  return v7;
}

- (int)iconType
{
  return 0;
}

- (MKTransitIcon)initWithKey:(unsigned int)a3 value:(unsigned int)a4
{
  MKTransitIcon *v6;
  MKTransitIcon *v7;
  MKTransitIcon *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MKTransitIcon;
  v6 = -[MKTransitIcon init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_iconAttributeKey = a3;
    v6->_iconAttributeValue = a4;
    v8 = v6;
  }

  return v7;
}

- (unsigned)iconAttributeKey
{
  return self->_iconAttributeKey;
}

- (unsigned)iconAttributeValue
{
  return self->_iconAttributeValue;
}

- (GEOStyleAttributes)styleAttributes
{
  GEOStyleAttributes *styleAttributes;
  id v4;
  id v5;
  GEOStyleAttributes *v6;

  styleAttributes = self->_styleAttributes;
  if (!styleAttributes)
  {
    if (self->_iconAttributeKey)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D275B0]);
      v5 = objc_alloc_init(MEMORY[0x1E0D275A8]);
      objc_msgSend(v5, "setKey:", self->_iconAttributeKey);
      objc_msgSend(v5, "setValue:", self->_iconAttributeValue);
      objc_msgSend(v4, "addAttribute:", v5);
      v6 = self->_styleAttributes;
      self->_styleAttributes = (GEOStyleAttributes *)v4;

      styleAttributes = self->_styleAttributes;
    }
    else
    {
      styleAttributes = 0;
    }
  }
  return styleAttributes;
}

- (unsigned)cartoID
{
  return self->_cartoID;
}

- (unsigned)defaultTransitType
{
  return self->_defaultTransitType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
}

@end
