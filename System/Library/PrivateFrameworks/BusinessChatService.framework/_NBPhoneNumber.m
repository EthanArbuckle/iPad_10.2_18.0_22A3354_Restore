@implementation _NBPhoneNumber

- (_NBPhoneNumber)init
{
  _NBPhoneNumber *v2;
  _NBPhoneNumber *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NBPhoneNumber;
  v2 = -[_NBPhoneNumber init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_NBPhoneNumber setNationalNumber:](v2, "setNationalNumber:", &unk_24C3B8490);
    -[_NBPhoneNumber setCountryCode:](v3, "setCountryCode:", &unk_24C3B8490);
    -[_NBPhoneNumber setNumberOfLeadingZeros:](v3, "setNumberOfLeadingZeros:", &unk_24C3B84A8);
  }
  return v3;
}

- (void)clearCountryCodeSource
{
  -[_NBPhoneNumber setCountryCodeSource:](self, "setCountryCodeSource:", 0);
}

- (int64_t)getCountryCodeSourceOrDefault
{
  void *v3;
  void *v4;
  int64_t v5;

  -[_NBPhoneNumber countryCodeSource](self, "countryCodeSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[_NBPhoneNumber countryCodeSource](self, "countryCodeSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  -[_NBPhoneNumber countryCode](self, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_NBPhoneNumber nationalNumber](self, "nationalNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = ((v4 << 6) + (v4 >> 2) + objc_msgSend(v5, "hash") + 2654435769) ^ v4;

  -[_NBPhoneNumber numberOfLeadingZeros](self, "numberOfLeadingZeros");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ((v6 << 6) + (v6 >> 2) + objc_msgSend(v7, "hash") + 2654435769) ^ v6;

  -[_NBPhoneNumber extension](self, "extension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_msgSend(v9, "hash") + (v8 << 6) + (v8 >> 2) + 2654435769u) ^ v8;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_NBPhoneNumber countryCode](self, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToNumber:", v7))
    {
      v11 = 0;
LABEL_19:

      goto LABEL_20;
    }
    -[_NBPhoneNumber nationalNumber](self, "nationalNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nationalNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToNumber:", v9)
      || (v10 = -[_NBPhoneNumber italianLeadingZero](self, "italianLeadingZero"),
          v10 != objc_msgSend(v5, "italianLeadingZero")))
    {
      v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
    -[_NBPhoneNumber numberOfLeadingZeros](self, "numberOfLeadingZeros");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberOfLeadingZeros");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToNumber:", v13))
    {
      v11 = 0;
LABEL_17:

      goto LABEL_18;
    }
    -[_NBPhoneNumber extension](self, "extension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v5, "extension"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_NBPhoneNumber extension](self, "extension");
      v20 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "extension");
      v19 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "isEqualToString:", v16);

      v13 = v19;
      v12 = v20;
      if (v14)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v18 = 0;
      v11 = 1;
    }
    v14 = (void *)v18;
    goto LABEL_16;
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NBPhoneNumber *v4;
  void *v5;
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
  void *v18;

  v4 = -[_NBPhoneNumber init](+[_NBPhoneNumber allocWithZone:](_NBPhoneNumber, "allocWithZone:", a3), "init");
  -[_NBPhoneNumber countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[_NBPhoneNumber setCountryCode:](v4, "setCountryCode:", v6);

  -[_NBPhoneNumber nationalNumber](self, "nationalNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[_NBPhoneNumber setNationalNumber:](v4, "setNationalNumber:", v8);

  -[_NBPhoneNumber extension](self, "extension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[_NBPhoneNumber setExtension:](v4, "setExtension:", v10);

  -[_NBPhoneNumber setItalianLeadingZero:](v4, "setItalianLeadingZero:", -[_NBPhoneNumber italianLeadingZero](self, "italianLeadingZero"));
  -[_NBPhoneNumber numberOfLeadingZeros](self, "numberOfLeadingZeros");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[_NBPhoneNumber setNumberOfLeadingZeros:](v4, "setNumberOfLeadingZeros:", v12);

  -[_NBPhoneNumber rawInput](self, "rawInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[_NBPhoneNumber setRawInput:](v4, "setRawInput:", v14);

  -[_NBPhoneNumber countryCodeSource](self, "countryCodeSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[_NBPhoneNumber setCountryCodeSource:](v4, "setCountryCodeSource:", v16);

  -[_NBPhoneNumber preferredDomesticCarrierCode](self, "preferredDomesticCarrierCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[_NBPhoneNumber setPreferredDomesticCarrierCode:](v4, "setPreferredDomesticCarrierCode:", v18);

  return v4;
}

- (_NBPhoneNumber)initWithCoder:(id)a3
{
  id v4;
  _NBPhoneNumber *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_NBPhoneNumber;
  v5 = -[_NBPhoneNumber init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("countryCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumber setCountryCode:](v5, "setCountryCode:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("nationalNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumber setNationalNumber:](v5, "setNationalNumber:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("extension"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumber setExtension:](v5, "setExtension:", v8);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("italianLeadingZero"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumber setItalianLeadingZero:](v5, "setItalianLeadingZero:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("numberOfLeadingZeros"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumber setNumberOfLeadingZeros:](v5, "setNumberOfLeadingZeros:", v10);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("rawInput"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumber setRawInput:](v5, "setRawInput:", v11);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("countryCodeSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumber setCountryCodeSource:](v5, "setCountryCodeSource:", v12);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("preferredDomesticCarrierCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBPhoneNumber setPreferredDomesticCarrierCode:](v5, "setPreferredDomesticCarrierCode:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[_NBPhoneNumber countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("countryCode"));

  -[_NBPhoneNumber nationalNumber](self, "nationalNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("nationalNumber"));

  -[_NBPhoneNumber extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("extension"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_NBPhoneNumber italianLeadingZero](self, "italianLeadingZero"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("italianLeadingZero"));

  -[_NBPhoneNumber numberOfLeadingZeros](self, "numberOfLeadingZeros");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("numberOfLeadingZeros"));

  -[_NBPhoneNumber rawInput](self, "rawInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("rawInput"));

  -[_NBPhoneNumber countryCodeSource](self, "countryCodeSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("countryCodeSource"));

  -[_NBPhoneNumber preferredDomesticCarrierCode](self, "preferredDomesticCarrierCode");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("preferredDomesticCarrierCode"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_NBPhoneNumber countryCode](self, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumber nationalNumber](self, "nationalNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumber extension](self, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_NBPhoneNumber italianLeadingZero](self, "italianLeadingZero"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  -[_NBPhoneNumber numberOfLeadingZeros](self, "numberOfLeadingZeros");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumber rawInput](self, "rawInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumber countryCodeSource](self, "countryCodeSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBPhoneNumber preferredDomesticCarrierCode](self, "preferredDomesticCarrierCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" - countryCode[%@], nationalNumber[%@], extension[%@], italianLeadingZero[%@], numberOfLeadingZeros[%@], rawInput[%@] countryCodeSource[%@] preferredDomesticCarrierCode[%@]"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSNumber)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSNumber)nationalNumber
{
  return self->_nationalNumber;
}

- (void)setNationalNumber:(id)a3
{
  objc_storeStrong((id *)&self->_nationalNumber, a3);
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (BOOL)italianLeadingZero
{
  return self->_italianLeadingZero;
}

- (void)setItalianLeadingZero:(BOOL)a3
{
  self->_italianLeadingZero = a3;
}

- (NSNumber)numberOfLeadingZeros
{
  return self->_numberOfLeadingZeros;
}

- (void)setNumberOfLeadingZeros:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfLeadingZeros, a3);
}

- (NSString)rawInput
{
  return self->_rawInput;
}

- (void)setRawInput:(id)a3
{
  objc_storeStrong((id *)&self->_rawInput, a3);
}

- (NSNumber)countryCodeSource
{
  return self->_countryCodeSource;
}

- (void)setCountryCodeSource:(id)a3
{
  objc_storeStrong((id *)&self->_countryCodeSource, a3);
}

- (NSString)preferredDomesticCarrierCode
{
  return self->_preferredDomesticCarrierCode;
}

- (void)setPreferredDomesticCarrierCode:(id)a3
{
  objc_storeStrong((id *)&self->_preferredDomesticCarrierCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredDomesticCarrierCode, 0);
  objc_storeStrong((id *)&self->_countryCodeSource, 0);
  objc_storeStrong((id *)&self->_rawInput, 0);
  objc_storeStrong((id *)&self->_numberOfLeadingZeros, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_nationalNumber, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
