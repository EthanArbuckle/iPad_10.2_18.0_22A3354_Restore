@implementation MKAddressFilter

+ (MKAddressFilter)filterIncludingAll
{
  return (MKAddressFilter *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initIncludingOptions:", -1);
}

+ (MKAddressFilter)filterExcludingAll
{
  return (MKAddressFilter *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initExcludingOptions:", -1);
}

- (MKAddressFilter)init
{
  return (MKAddressFilter *)-[MKAddressFilter initIncludingOptions:](self, "initIncludingOptions:", -1);
}

- (id)initIncludingOptions:(unint64_t)a3
{
  id result;
  uint64_t v5;
  unint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKAddressFilter;
  result = -[MKAddressFilter init](&v7, sel_init);
  if (result)
  {
    v5 = 8;
    if (a3)
    {
      v6 = a3;
    }
    else
    {
      v5 = 16;
      v6 = -1;
    }
    *(_QWORD *)((char *)result + v5) = v6;
  }
  return result;
}

- (id)initExcludingOptions:(unint64_t)a3
{
  id result;
  uint64_t v5;
  unint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKAddressFilter;
  result = -[MKAddressFilter init](&v7, sel_init);
  if (result)
  {
    v5 = 16;
    if (a3)
    {
      v6 = a3;
    }
    else
    {
      v5 = 8;
      v6 = -1;
    }
    *(_QWORD *)((char *)result + v5) = v6;
  }
  return result;
}

- (BOOL)includesOptions:(unint64_t)a3
{
  unint64_t includedOptions;

  includedOptions = self->_includedOptions;
  if (includedOptions)
    return (a3 & ~includedOptions) == 0;
  else
    return (a3 & ~self->_excludedOptions) != 0;
}

- (BOOL)excludesOptions:(unint64_t)a3
{
  unint64_t excludedOptions;

  excludedOptions = self->_excludedOptions;
  if (excludedOptions)
    return (a3 & ~excludedOptions) == 0;
  else
    return (a3 & ~self->_includedOptions) != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t includedOptions;
  id v5;

  includedOptions = self->_includedOptions;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", includedOptions, CFSTR("inclusions"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_excludedOptions, CFSTR("exclusions"));

}

- (MKAddressFilter)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  MKAddressFilter *v7;
  MKAddressFilter *v8;
  objc_class *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("inclusions"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("exclusions"));

  if (v5 | v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)MKAddressFilter;
    v8 = -[MKAddressFilter init](&v12, sel_init);
    if (v8)
    {
      if (v5)
        v9 = (objc_class *)v5;
      else
        v9 = (objc_class *)v6;
      v10 = 8;
      if (!v5)
        v10 = 16;
      *(Class *)((char *)&v8->super.isa + v10) = v9;
    }
    self = v8;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_includedOptions;
  *((_QWORD *)result + 2) = self->_excludedOptions;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MKAddressFilter isEqualToAddressFilter:](self, "isEqualToAddressFilter:", v4);

  return v5;
}

- (BOOL)isEqualToAddressFilter:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = v4 && self->_includedOptions == v4[1] && self->_excludedOptions == v4[2];

  return v5;
}

- (id)description
{
  unint64_t includedOptions;
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  includedOptions = self->_includedOptions;
  if (includedOptions == -1)
  {
    v7 = CFSTR("Include: All");
  }
  else if (self->_excludedOptions == -1)
  {
    v7 = CFSTR("Exclude: All");
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (includedOptions)
    {
      -[MKAddressFilter _commaSeparatedListOfOptions:](self, "_commaSeparatedListOfOptions:", self->_includedOptions);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("Include: %@"), v5);
    }
    else
    {
      -[MKAddressFilter _commaSeparatedListOfOptions:](self, "_commaSeparatedListOfOptions:", self->_excludedOptions);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("Exclude: %@"), v5);
    }
    v7 = (__CFString *)v6;

  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %p %@"), v10, self, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_commaSeparatedListOfOptions:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR("Country, "));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "appendString:", CFSTR("Administrative Area, "));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v5, "appendString:", CFSTR("Subadministrative Area, "));
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v5, "appendString:", CFSTR("Locality, "));
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  objc_msgSend(v5, "appendString:", CFSTR("Sublocality, "));
  if ((v3 & 0x20) != 0)
LABEL_7:
    objc_msgSend(v5, "appendString:", CFSTR("Postal Code, "));
LABEL_8:
  if ((unint64_t)objc_msgSend(v5, "length") >= 3)
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 2, 2, &stru_1E20DFC00);
  return v5;
}

- (id)_geoAddressFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D26EC0]), "initWithOptionsToInclude:optionsToExclude:", self->_includedOptions, self->_excludedOptions);
}

@end
