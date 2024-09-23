@implementation CNChangeHistoryContactChange

- (CNChangeHistoryContactChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6
{
  return -[CNChangeHistoryContactChange initWithIdentifier:changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:](self, "initWithIdentifier:changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:", a3, a4, a5, a6, 0, 0, 0, 0);
}

- (CNChangeHistoryContactChange)initWithIdentifier:(id)a3 changeType:(int64_t)a4 changeAnchor:(id)a5 changeID:(id)a6 externalID:(id)a7 imagesChanged:(id)a8 linkToPersonUUID:(id)a9 personLinkUUID:(id)a10
{
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CNChangeHistoryContactChange *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  NSString *contactIdentifier;
  uint64_t v28;
  CNChangeHistoryAnchor *changeAnchor;
  uint64_t v30;
  NSNumber *changeID;
  uint64_t v32;
  NSString *externalID;
  uint64_t v34;
  NSNumber *imagesChanged;
  uint64_t v36;
  NSString *linkToPersonUUID;
  uint64_t v38;
  NSString *personLinkUUID;
  CNChangeHistoryContactChange *v40;
  objc_super v42;

  v16 = (__CFString *)a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v42.receiver = self;
  v42.super_class = (Class)CNChangeHistoryContactChange;
  v23 = -[CNChangeHistoryContactChange init](&v42, sel_init);
  if (v23)
  {
    v24 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))();
    if (a4 != 10 || v24)
    {
      if ((v24 & 1) != 0)
      {
LABEL_9:
        v26 = -[__CFString copy](v16, "copy");
        contactIdentifier = v23->_contactIdentifier;
        v23->_contactIdentifier = (NSString *)v26;

        v23->_changeType = a4;
        v28 = objc_msgSend(v17, "copy");
        changeAnchor = v23->_changeAnchor;
        v23->_changeAnchor = (CNChangeHistoryAnchor *)v28;

        v30 = objc_msgSend(v18, "copy");
        changeID = v23->_changeID;
        v23->_changeID = (NSNumber *)v30;

        v32 = objc_msgSend(v19, "copy");
        externalID = v23->_externalID;
        v23->_externalID = (NSString *)v32;

        v34 = objc_msgSend(v20, "copy");
        imagesChanged = v23->_imagesChanged;
        v23->_imagesChanged = (NSNumber *)v34;

        v36 = objc_msgSend(v21, "copy");
        linkToPersonUUID = v23->_linkToPersonUUID;
        v23->_linkToPersonUUID = (NSString *)v36;

        v38 = objc_msgSend(v22, "copy");
        personLinkUUID = v23->_personLinkUUID;
        v23->_personLinkUUID = (NSString *)v38;

        v40 = v23;
        goto LABEL_10;
      }
      +[CNChangeHistory os_log](CNChangeHistory, "os_log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        -[CNChangeHistoryContactChange initWithIdentifier:changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:].cold.1((uint64_t)v18, a4, v25);
    }
    else
    {
      v25 = v16;
      v16 = &stru_1E29FF900;
    }

    goto LABEL_9;
  }
LABEL_10:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryContactChange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNChangeHistoryContactChange *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_changeType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_changeAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_changeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imagesChanged"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_linkToPersonUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_personLinkUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CNChangeHistoryContactChange initWithIdentifier:changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:](self, "initWithIdentifier:changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactIdentifier;
  id v5;

  contactIdentifier = self->_contactIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, CFSTR("_contactIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeType, CFSTR("_changeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeAnchor, CFSTR("_changeAnchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeID, CFSTR("_changeID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalID, CFSTR("_externalID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imagesChanged, CFSTR("_imagesChanged"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkToPersonUUID, CFSTR("_linkToPersonUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personLinkUUID, CFSTR("_personLinkUUID"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0D13A08];
  -[CNChangeHistoryContactChange contactIdentifier](self, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNChangeHistoryContactChange changeType](self, "changeType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryContactChange changeAnchor](self, "changeAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryContactChange changeID](self, "changeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryContactChange externalID](self, "externalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryContactChange imagesChanged](self, "imagesChanged");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryContactChange linkToPersonUUID](self, "linkToPersonUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryContactChange personLinkUUID](self, "personLinkUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNChangeHistoryContactChange contact](self, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptionForObject:withNamesAndObjects:", self, CFSTR("contactIdentifier"), v3, CFSTR("changeType"), v4, CFSTR("changeAnchor"), v5, CFSTR("changeID"), v6, CFSTR("externalID"), v7, CFSTR("imagesChanged"), v8, CFSTR("linkToPersonUUID"), v9, CFSTR("personLinkUUID"), v10,
    CFSTR("contact"),
    v11,
    0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD aBlock[5];
  id v35;
  _QWORD v36[5];
  id v37;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v21 = (void *)MEMORY[0x1E0D13A40];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke;
  v36[3] = &unk_1E29F7D70;
  v36[4] = self;
  v37 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v6 = v37;
  v35 = v6;
  v7 = _Block_copy(aBlock);
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_3;
  v32[3] = &unk_1E29F7D70;
  v32[4] = self;
  v8 = v6;
  v33 = v8;
  v9 = _Block_copy(v32);
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_4;
  v30[3] = &unk_1E29F7D70;
  v30[4] = self;
  v10 = v8;
  v31 = v10;
  v11 = _Block_copy(v30);
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_5;
  v28[3] = &unk_1E29F7D70;
  v28[4] = self;
  v12 = v10;
  v29 = v12;
  v13 = _Block_copy(v28);
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_6;
  v26[3] = &unk_1E29F7D70;
  v26[4] = self;
  v14 = v12;
  v27 = v14;
  v15 = _Block_copy(v26);
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_7;
  v24[3] = &unk_1E29F7D70;
  v24[4] = self;
  v16 = v14;
  v25 = v16;
  v17 = _Block_copy(v24);
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __40__CNChangeHistoryContactChange_isEqual___block_invoke_8;
  v22[3] = &unk_1E29F7D70;
  v22[4] = self;
  v23 = v16;
  v18 = v16;
  v19 = _Block_copy(v22);
  LOBYTE(self) = objc_msgSend(v21, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v18, self, v36, v7, v9, v11, v13, v15, v17, v19, 0);

  return (char)self;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "changeType"), objc_msgSend(*(id *)(a1 + 40), "changeType"));
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "changeAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "changeAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "changeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "changeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "externalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "externalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "imagesChanged");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "imagesChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "linkToPersonUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "linkToPersonUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __40__CNChangeHistoryContactChange_isEqual___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "personLinkUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "personLinkUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD aBlock[5];
  _QWORD v21[6];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __36__CNChangeHistoryContactChange_hash__block_invoke;
  v21[3] = &unk_1E29F7D98;
  v21[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v5 = _Block_copy(aBlock);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_3;
  v19[3] = &unk_1E29F7D98;
  v19[4] = self;
  v6 = _Block_copy(v19);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_4;
  v18[3] = &unk_1E29F7D98;
  v18[4] = self;
  v7 = _Block_copy(v18);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_5;
  v17[3] = &unk_1E29F7D98;
  v17[4] = self;
  v8 = _Block_copy(v17);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_6;
  v16[3] = &unk_1E29F7D98;
  v16[4] = self;
  v9 = _Block_copy(v16);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_7;
  v15[3] = &unk_1E29F7D98;
  v15[4] = self;
  v10 = _Block_copy(v15);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __36__CNChangeHistoryContactChange_hash__block_invoke_8;
  v14[3] = &unk_1E29F7D98;
  v14[4] = self;
  v11 = _Block_copy(v14);
  v12 = objc_msgSend(v3, "hashWithBlocks:", v21, v5, v6, v7, v8, v9, v10, v11, 0);

  return v12;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "integerHash:", objc_msgSend(*(id *)(a1 + 32), "changeType"));
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "changeAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "changeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "externalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "imagesChanged");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_7(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "linkToPersonUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __36__CNChangeHistoryContactChange_hash__block_invoke_8(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "personLinkUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSArray)linkedContactIdentifiers
{
  return self->_linkedContactIdentifiers;
}

- (void)setLinkedContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CNChangeHistoryAnchor)changeAnchor
{
  return self->_changeAnchor;
}

- (void)setChangeAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_changeAnchor, a3);
}

- (NSNumber)changeID
{
  return self->_changeID;
}

- (void)setChangeID:(id)a3
{
  objc_storeStrong((id *)&self->_changeID, a3);
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
  objc_storeStrong((id *)&self->_externalID, a3);
}

- (NSNumber)imagesChanged
{
  return self->_imagesChanged;
}

- (void)setImagesChanged:(id)a3
{
  objc_storeStrong((id *)&self->_imagesChanged, a3);
}

- (NSString)linkToPersonUUID
{
  return self->_linkToPersonUUID;
}

- (void)setLinkToPersonUUID:(id)a3
{
  objc_storeStrong((id *)&self->_linkToPersonUUID, a3);
}

- (NSString)personLinkUUID
{
  return self->_personLinkUUID;
}

- (void)setPersonLinkUUID:(id)a3
{
  objc_storeStrong((id *)&self->_personLinkUUID, a3);
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
  objc_storeStrong((id *)&self->_externalURI, a3);
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
  objc_storeStrong((id *)&self->_externalModificationTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_personLinkUUID, 0);
  objc_storeStrong((id *)&self->_linkToPersonUUID, 0);
  objc_storeStrong((id *)&self->_imagesChanged, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_changeID, 0);
  objc_storeStrong((id *)&self->_changeAnchor, 0);
  objc_storeStrong((id *)&self->_linkedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_fault_impl(&dword_18F8BD000, log, OS_LOG_TYPE_FAULT, "Attempt to create a change history event without an expected contact identifier! Change id: %{public}@, type: %ld", (uint8_t *)&v3, 0x16u);
}

@end
