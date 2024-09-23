@implementation CTNetworkSelectionInfo

- (id)description
{
  void *v3;
  unint64_t v4;
  const char *v5;
  unint64_t v6;
  const char *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTNetworkSelectionInfo selectionState](self, "selectionState");
  if (v4 - 1 > 5)
    v5 = "CTNetworkSelectionStateUnknown";
  else
    v5 = off_1E1530E10[v4 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(", selectionState=%s"), v5);
  v6 = -[CTNetworkSelectionInfo selectionMode](self, "selectionMode");
  v7 = "CTNetworkSelectionModeDisabled";
  if (v6 == 2)
    v7 = "CTNetworkSelectionModeManual";
  if (v6 == 1)
    v7 = "CTNetworkSelectionModeAutomatic";
  objc_msgSend(v3, "appendFormat:", CFSTR(", selectionMode=%s"), v7);
  -[CTNetworkSelectionInfo selection](self, "selection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", selection=%@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSelectionState:", -[CTNetworkSelectionInfo selectionState](self, "selectionState"));
  objc_msgSend(v4, "setSelectionMode:", -[CTNetworkSelectionInfo selectionMode](self, "selectionMode"));
  -[CTNetworkSelectionInfo selection](self, "selection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelection:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[CTNetworkSelectionInfo selectionMode](self, "selectionMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("selection_mode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTNetworkSelectionInfo selectionState](self, "selectionState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("selection_state"));

  -[CTNetworkSelectionInfo selection](self, "selection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("selection"));

}

- (CTNetworkSelectionInfo)initWithCoder:(id)a3
{
  id v4;
  CTNetworkSelectionInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CTNetwork *selection;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTNetworkSelectionInfo;
  v5 = -[CTNetworkSelectionInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selection_mode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_selectionMode = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selection_state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_selectionState = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selection"));
    v8 = objc_claimAutoreleasedReturnValue();
    selection = v5->_selection;
    v5->_selection = (CTNetwork *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (void)setSelectionState:(unint64_t)a3
{
  self->_selectionState = a3;
}

- (unint64_t)selectionMode
{
  return self->_selectionMode;
}

- (void)setSelectionMode:(unint64_t)a3
{
  self->_selectionMode = a3;
}

- (CTNetwork)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
  objc_storeStrong((id *)&self->_selection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selection, 0);
}

@end
