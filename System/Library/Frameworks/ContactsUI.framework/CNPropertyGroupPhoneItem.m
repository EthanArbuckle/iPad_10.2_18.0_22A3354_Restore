@implementation CNPropertyGroupPhoneItem

- (id)displayStringForValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "formattedStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNPhoneNumber)phoneNumber
{
  void *v2;
  void *v3;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNPhoneNumber *)v3;
}

- (id)normalizedValue
{
  void *v2;
  void *v3;

  -[CNPropertyGroupPhoneItem phoneNumber](self, "phoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultActionURL
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (-[CNPropertyGroupItem allowsPhone](self, "allowsPhone"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D13C68]);
    -[CNPropertyGroupPhoneItem phoneNumber](self, "phoneNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithStringValue:type:", v5, 2);

    -[CNPropertyGroupItem delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNPropertyGroupItem delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "geminiDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "channelIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      {

      }
      else
      {
        v12 = (void *)MEMORY[0x1E0C99E98];
        -[CNPropertyGroupItem contactProperty](self, "contactProperty");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sourceContact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_cnui_telephonyURLWithHandle:contact:channelIdentifier:", v6, v14, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
LABEL_8:

          return v11;
        }
      }
    }
    v15 = (void *)MEMORY[0x1E0C99E98];
    -[CNPropertyGroupItem contactProperty](self, "contactProperty");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sourceContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_cnui_telephonyURLWithHandle:contact:", v6, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v11 = 0;
  return v11;
}

- (id)bestLabel:(id)a3
{
  CNPropertyGroupPhoneItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  CNPropertyGroupPhoneItem *v14;
  void *v15;
  objc_super v17;

  v4 = (CNPropertyGroupPhoneItem *)a3;
  v17.receiver = self;
  v17.super_class = (Class)CNPropertyGroupPhoneItem;
  -[CNPropertyGroupItem bestLabel:](&v17, sel_bestLabel_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C97058];
  -[CNPropertyGroupItem labeledValue](v4, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:options:", v8, 1);

  if (!v9)
  {
    v14 = v4;
LABEL_6:
    -[CNPropertyGroupItem labeledValue](v14, "labeledValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "label");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "compare:options:", v11, 1);

  if (!v12)
  {
    v14 = self;
    goto LABEL_6;
  }
  v13 = v5;
LABEL_7:

  return v13;
}

- (id)valueForDisplayString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", a3);
}

+ (id)emptyValueForLabel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", &stru_1E20507A8);
}

@end
