@implementation MPRadioStation

- (MPRadioStation)initWithPlayParameters:(id)a3
{
  id v4;
  MPRadioStation *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSString *stationStringID;
  MPRadioStation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPRadioStation;
  v5 = -[MPRadioStation init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "itemKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("radioStation"));

    if (!v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "itemID");
    v8 = objc_claimAutoreleasedReturnValue();
    stationStringID = v5->_stationStringID;
    v5->_stationStringID = (NSString *)v8;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (MPRadioStation)initWithModelStation:(id)a3
{
  id v4;
  MPRadioStation *v5;
  MPRadioStation *v6;
  _QWORD v8[4];
  MPRadioStation *v9;
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPRadioStation;
  v5 = -[MPRadioStation init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__MPRadioStation_initWithModelStation___block_invoke;
    v8[3] = &unk_1E31635F8;
    v9 = v5;
    v10 = v4;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v8);

  }
  return v6;
}

- (MPRadioStation)initWithStation:(id)a3
{
  id v4;
  MPRadioStation *v5;
  uint64_t v6;
  NSString *localizedName;
  uint64_t v8;
  NSString *localizedDescription;
  uint64_t v10;
  NSString *stationStringID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPRadioStation;
  v5 = -[MPRadioStation init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    objc_msgSend(v4, "stationDescription");
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    v5->_uniqueIdentifier = objc_msgSend(v4, "stationID");
    objc_msgSend(v4, "stationStringID");
    v10 = objc_claimAutoreleasedReturnValue();
    stationStringID = v5->_stationStringID;
    v5->_stationStringID = (NSString *)v10;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[MPRadioStation uniqueIdentifier](self, "uniqueIdentifier");
    v6 = v5 == objc_msgSend(v4, "uniqueIdentifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_stationStringID, CFSTR("stationStringID"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_localizedName, CFSTR("localizedName"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C78], CFSTR("only keyed coding is supported"));
  }

}

- (MPRadioStation)initWithCoder:(id)a3
{
  id v4;
  MPRadioStation *v5;
  uint64_t v6;
  NSString *stationStringID;
  uint64_t v8;
  NSString *localizedName;
  uint64_t v10;
  NSString *localizedDescription;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPRadioStation;
  v5 = -[MPRadioStation init](&v13, sel_init);
  if (v5)
  {
    v5->_uniqueIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("uniqueIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stationStringID"));
    v6 = objc_claimAutoreleasedReturnValue();
    stationStringID = v5->_stationStringID;
    v5->_stationStringID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_localizedName, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSString copyWithZone:](self->_stationStringID, "copyWithZone:", a3);
    v9 = (void *)v5[4];
    v5[4] = v8;

    v10 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v5[1] = self->_uniqueIdentifier;
  }
  return v5;
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  self->_uniqueIdentifier = a3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void)setStationStringID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

void __39__MPRadioStation_initWithModelStation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(a1 + 40), "editorNotes");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  objc_msgSend(*(id *)(a1 + 40), "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "radio");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v9, "stationID");

  objc_msgSend(*(id *)(a1 + 40), "identifiers");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "radio");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stationStringID");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v11;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
