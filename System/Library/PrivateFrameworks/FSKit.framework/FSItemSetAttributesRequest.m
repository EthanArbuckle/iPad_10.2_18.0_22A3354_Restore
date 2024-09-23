@implementation FSItemSetAttributesRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FSItemSetAttributesRequest;
  v4 = a3;
  -[FSItemAttributes encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->attrsConsumed, CFSTR("FSItemAttrConsumed"), v5.receiver, v5.super_class);

}

- (FSItemSetAttributesRequest)initWithCoder:(id)a3
{
  id v4;
  FSItemSetAttributesRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FSItemSetAttributesRequest;
  v5 = -[FSItemAttributes initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->attrsConsumed = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("FSItemAttrConsumed"));

  return v5;
}

- (FSItemSetAttributesRequest)init
{
  FSItemSetAttributesRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FSItemSetAttributesRequest;
  result = -[FSItemAttributes init](&v3, sel_init);
  if (result)
    result->attrsConsumed = 0;
  return result;
}

- (BOOL)wasConsumed:(int64_t)a3
{
  BOOL v3;
  int64_t v4;

  v3 = 0;
  if (a3 > 255)
  {
    if (a3 >= 0x4000)
    {
      if (a3 >= 0x10000)
      {
        if (a3 == 0x10000)
        {
          a3 = 0x2000;
        }
        else
        {
          if (a3 != 0x20000)
            return v3;
          a3 = 0x4000;
        }
      }
      else
      {
        if (a3 != 0x4000 && a3 != 0x8000)
          return v3;
        a3 = 1024;
      }
    }
    else if (a3 > 4095)
    {
      if (a3 == 4096)
      {
        a3 = 2048;
      }
      else
      {
        if (a3 != 0x2000)
          return v3;
        a3 = 0x8000;
      }
    }
    else if (a3 != 256 && a3 != 512)
    {
      return v3;
    }
    return (self->attrsConsumed & a3) != 0;
  }
  if (a3 > 15)
  {
    if (a3 > 63)
    {
      if (a3 != 64 && a3 != 128)
        return v3;
    }
    else if (a3 == 16)
    {
      a3 = 4;
    }
    else if (a3 != 32)
    {
      return v3;
    }
    return (self->attrsConsumed & a3) != 0;
  }
  v4 = a3 - 1;
  a3 = 8;
  switch(v4)
  {
    case 0:
      return (self->attrsConsumed & a3) != 0;
    case 1:
      a3 = 16;
      return (self->attrsConsumed & a3) != 0;
    case 3:
      a3 = 2;
      return (self->attrsConsumed & a3) != 0;
    case 7:
      a3 = 1;
      return (self->attrsConsumed & a3) != 0;
    default:
      return v3;
  }
  return v3;
}

- (void)setConsumedAttributes:(int64_t)a3
{
  self->_consumedAttributes = a3;
  if ((a3 & 1) != 0)
  {
    self->attrsConsumed |= 8uLL;
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->attrsConsumed |= 0x10uLL;
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  self->attrsConsumed |= 2uLL;
  if ((a3 & 8) == 0)
  {
LABEL_5:
    if ((a3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  self->attrsConsumed |= 1uLL;
  if ((a3 & 0x10) == 0)
  {
LABEL_6:
    if ((a3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  self->attrsConsumed |= 4uLL;
  if ((a3 & 0x20) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  self->attrsConsumed |= 0x20uLL;
  if ((a3 & 0x40) == 0)
  {
LABEL_8:
    if ((a3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  self->attrsConsumed |= 0x40uLL;
  if ((a3 & 0x80) == 0)
  {
LABEL_9:
    if ((a3 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  self->attrsConsumed |= 0x80uLL;
  if ((a3 & 0x100) == 0)
  {
LABEL_10:
    if ((a3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  self->attrsConsumed |= 0x100uLL;
  if ((a3 & 0x200) == 0)
  {
LABEL_11:
    if ((a3 & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  self->attrsConsumed |= 0x200uLL;
  if ((a3 & 0x8000) == 0)
  {
LABEL_12:
    if ((a3 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  self->attrsConsumed |= 0x400uLL;
  if ((a3 & 0x1000) == 0)
  {
LABEL_13:
    if ((a3 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  self->attrsConsumed |= 0x800uLL;
  if ((a3 & 0x4000) == 0)
  {
LABEL_14:
    if ((a3 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  self->attrsConsumed |= 0x1000uLL;
  if ((a3 & 0x2000) == 0)
  {
LABEL_15:
    if ((a3 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  self->attrsConsumed |= 0x8000uLL;
  if ((a3 & 0x10000) == 0)
  {
LABEL_16:
    if ((a3 & 0x20000) == 0)
      return;
LABEL_33:
    self->attrsConsumed |= 0x4000uLL;
    return;
  }
LABEL_32:
  self->attrsConsumed |= 0x2000uLL;
  if ((a3 & 0x20000) != 0)
    goto LABEL_33;
}

- (int64_t)consumedAttributes
{
  return self->_consumedAttributes;
}

@end
