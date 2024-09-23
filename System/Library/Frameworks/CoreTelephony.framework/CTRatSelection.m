@implementation CTRatSelection

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mask=0x%08x"), -[CTRatSelection mask](self, "mask"));
  -[CTRatSelection selection](self, "selection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", selection=%@"), v4);

  -[CTRatSelection preferred](self, "preferred");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", preferred=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMask:", -[CTRatSelection mask](self, "mask"));
  -[CTRatSelection selection](self, "selection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelection:", v6);

  -[CTRatSelection preferred](self, "preferred");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPreferred:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[CTRatSelection mask](self, "mask"), CFSTR("mask"));
  -[CTRatSelection selection](self, "selection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selection"));

  -[CTRatSelection preferred](self, "preferred");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("preferred"));

}

- (CTRatSelection)initWithCoder:(id)a3
{
  id v4;
  CTRatSelection *v5;
  uint64_t v6;
  NSString *selection;
  uint64_t v8;
  NSString *preferred;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTRatSelection;
  v5 = -[CTRatSelection init](&v11, sel_init);
  if (v5)
  {
    v5->_mask = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mask"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selection"));
    v6 = objc_claimAutoreleasedReturnValue();
    selection = v5->_selection;
    v5->_selection = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferred"));
    v8 = objc_claimAutoreleasedReturnValue();
    preferred = v5->_preferred;
    v5->_preferred = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)mask
{
  return self->_mask;
}

- (void)setMask:(unsigned __int8)a3
{
  self->_mask = a3;
}

- (NSString)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
  objc_storeStrong((id *)&self->_selection, a3);
}

- (NSString)preferred
{
  return self->_preferred;
}

- (void)setPreferred:(id)a3
{
  objc_storeStrong((id *)&self->_preferred, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferred, 0);
  objc_storeStrong((id *)&self->_selection, 0);
}

@end
