@implementation FMDLostModeInfo

- (void)dealloc
{
  objc_super v3;

  -[FMDLostModeInfo setMessage:](self, "setMessage:", 0);
  -[FMDLostModeInfo setPhoneNumber:](self, "setPhoneNumber:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FMDLostModeInfo;
  -[FMDLostModeInfo dealloc](&v3, sel_dealloc);
}

- (FMDLostModeInfo)initWithCoder:(id)a3
{
  id v4;
  FMDLostModeInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FMDLostModeInfo;
  v5 = -[FMDLostModeInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLostModeInfo setLostModeEnabled:](v5, "setLostModeEnabled:", objc_msgSend(v6, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disableSlideToUnlock"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLostModeInfo setDisableSlideToUnlock:](v5, "setDisableSlideToUnlock:", objc_msgSend(v7, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLostModeInfo setMessage:](v5, "setMessage:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLostModeInfo setPhoneNumber:](v5, "setPhoneNumber:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("facetimeCapable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLostModeInfo setFacetimeCapable:](v5, "setFacetimeCapable:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footnoteText"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLostModeInfo setFootnoteText:](v5, "setFootnoteText:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDLostModeInfo setLostModeType:](v5, "setLostModeType:", objc_msgSend(v12, "unsignedIntegerValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[FMDLostModeInfo lostModeEnabled](self, "lostModeEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("lostModeEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FMDLostModeInfo disableSlideToUnlock](self, "disableSlideToUnlock"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("disableSlideToUnlock"));

  -[FMDLostModeInfo message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("message"));

  -[FMDLostModeInfo phoneNumber](self, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("phoneNumber"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FMDLostModeInfo facetimeCapable](self, "facetimeCapable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("facetimeCapable"));

  -[FMDLostModeInfo footnoteText](self, "footnoteText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("footnoteText"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FMDLostModeInfo lostModeType](self, "lostModeType"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("lostModeType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FMDLostModeInfo message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDLostModeInfo phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FMDLostModeInfo facetimeCapable](self, "facetimeCapable");
  -[FMDLostModeInfo footnoteText](self, "footnoteText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FMDLostModeInfo(0x%lx) message - %@, phoneNum - %@, facetimeCapable - %d, footnote - %@, inLostMode - %d, disableUnlock - %d, type - %ld"), self, v4, v5, v6, v7, -[FMDLostModeInfo lostModeEnabled](self, "lostModeEnabled"), -[FMDLostModeInfo disableSlideToUnlock](self, "disableSlideToUnlock"), -[FMDLostModeInfo lostModeType](self, "lostModeType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (BOOL)lostModeEnabled
{
  return self->_lostModeEnabled;
}

- (void)setLostModeEnabled:(BOOL)a3
{
  self->_lostModeEnabled = a3;
}

- (unint64_t)lostModeType
{
  return self->_lostModeType;
}

- (void)setLostModeType:(unint64_t)a3
{
  self->_lostModeType = a3;
}

- (BOOL)disableSlideToUnlock
{
  return self->_disableSlideToUnlock;
}

- (void)setDisableSlideToUnlock:(BOOL)a3
{
  self->_disableSlideToUnlock = a3;
}

- (BOOL)facetimeCapable
{
  return self->_facetimeCapable;
}

- (void)setFacetimeCapable:(BOOL)a3
{
  self->_facetimeCapable = a3;
}

- (NSString)footnoteText
{
  return self->_footnoteText;
}

- (void)setFootnoteText:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteText, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
