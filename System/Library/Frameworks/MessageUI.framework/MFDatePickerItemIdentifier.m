@implementation MFDatePickerItemIdentifier

- (MFDatePickerItemIdentifier)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v7;
  MFDatePickerItemIdentifier *v8;
  MFDatePickerItemIdentifier *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFDatePickerItemIdentifier;
  v8 = -[MFDatePickerItemIdentifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MFDatePickerItemIdentifier *v4;
  MFDatePickerItemIdentifier *v5;
  void *v6;
  void *v7;
  BOOL v8;
  unint64_t v9;

  v4 = (MFDatePickerItemIdentifier *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MFDatePickerItemIdentifier identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFDatePickerItemIdentifier identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v9 = -[MFDatePickerItemIdentifier type](self, "type");
        v8 = v9 == -[MFDatePickerItemIdentifier type](v5, "type");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[MFDatePickerItemIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return 33 * v4 + -[MFDatePickerItemIdentifier type](self, "type") + 1089;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
