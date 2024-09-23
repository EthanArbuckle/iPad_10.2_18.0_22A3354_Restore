@implementation FSItemGetAttributesRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  objc_msgSend(v5, "encodeInt64:forKey:", self->attrsWanted, CFSTR("FSItemAttrWanted"));

}

- (FSItemGetAttributesRequest)initWithCoder:(id)a3
{
  id v4;
  id v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  self->attrsWanted = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("FSItemAttrWanted"));

  return self;
}

- (FSItemGetAttributesRequest)init
{
  FSItemGetAttributesRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FSItemGetAttributesRequest;
  result = -[FSItemGetAttributesRequest init](&v3, sel_init);
  if (result)
    result->attrsWanted = 0;
  return result;
}

- (FSItemGetAttributesRequest)initWithWantedLIAttributes:(unint64_t)a3
{
  FSItemGetAttributesRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FSItemGetAttributesRequest;
  result = -[FSItemGetAttributesRequest init](&v5, sel_init);
  if (result)
    result->attrsWanted = a3;
  return result;
}

- (BOOL)isWanted:(int64_t)a3
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
      else if (a3 == 0x4000)
      {
        a3 = 4096;
      }
      else
      {
        if (a3 != 0x8000)
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
    return (self->attrsWanted & a3) != 0;
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
    return (self->attrsWanted & a3) != 0;
  }
  v4 = a3 - 1;
  a3 = 8;
  switch(v4)
  {
    case 0:
      return (self->attrsWanted & a3) != 0;
    case 1:
      a3 = 16;
      return (self->attrsWanted & a3) != 0;
    case 3:
      a3 = 2;
      return (self->attrsWanted & a3) != 0;
    case 7:
      a3 = 1;
      return (self->attrsWanted & a3) != 0;
    default:
      return v3;
  }
  return v3;
}

- (void)setWantedAttributes:(int64_t)a3
{
  self->_wantedAttributes = a3;
  if ((a3 & 1) != 0)
  {
    self->attrsWanted |= 8uLL;
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->attrsWanted |= 0x10uLL;
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->attrsWanted |= 2uLL;
  if ((a3 & 8) == 0)
  {
LABEL_5:
    if ((a3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  self->attrsWanted |= 1uLL;
  if ((a3 & 0x10) == 0)
  {
LABEL_6:
    if ((a3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  self->attrsWanted |= 4uLL;
  if ((a3 & 0x20) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  self->attrsWanted |= 0x20uLL;
  if ((a3 & 0x40) == 0)
  {
LABEL_8:
    if ((a3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  self->attrsWanted |= 0x40uLL;
  if ((a3 & 0x80) == 0)
  {
LABEL_9:
    if ((a3 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  self->attrsWanted |= 0x80uLL;
  if ((a3 & 0x100) == 0)
  {
LABEL_10:
    if ((a3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  self->attrsWanted |= 0x100uLL;
  if ((a3 & 0x200) == 0)
  {
LABEL_11:
    if ((a3 & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  self->attrsWanted |= 0x200uLL;
  if ((a3 & 0x8000) == 0)
  {
LABEL_12:
    if ((a3 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  self->attrsWanted |= 0x400uLL;
  if ((a3 & 0x2000) == 0)
  {
LABEL_13:
    if ((a3 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  self->attrsWanted |= 0x8000uLL;
  if ((a3 & 0x4000) == 0)
  {
LABEL_14:
    if ((a3 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  self->attrsWanted |= 0x1000uLL;
  if ((a3 & 0x1000) == 0)
  {
LABEL_15:
    if ((a3 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  self->attrsWanted |= 0x800uLL;
  if ((a3 & 0x20000) == 0)
  {
LABEL_16:
    if ((a3 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  self->attrsWanted |= 0x4000uLL;
  if ((a3 & 0x10000) == 0)
  {
LABEL_17:
    if ((a3 & 0x20000) == 0)
      return;
LABEL_35:
    self->attrsWanted |= 0x10000uLL;
    return;
  }
LABEL_34:
  self->attrsWanted |= 0x2000uLL;
  if ((a3 & 0x20000) != 0)
    goto LABEL_35;
}

- (int64_t)wantedAttributes
{
  return self->_wantedAttributes;
}

@end
