@implementation HMDHH2AutoMigrationEligibilityResult

- (HMDHH2AutoMigrationEligibilityResult)initWithStatus:(unint64_t)a3 iCloudAccountStatus:(unint64_t)a4 unsupportedDevices:(unint64_t)a5 hasOnlyEmptyHomes:(BOOL)a6 numberOwnedNonEmptyHomes:(unint64_t)a7 numberUnownedSharedHomes:(unint64_t)a8 numberOwnedSharedHomes:(unint64_t)a9
{
  HMDHH2AutoMigrationEligibilityResult *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HMDHH2AutoMigrationEligibilityResult;
  result = -[HMDHH2AutoMigrationEligibilityResult init](&v16, sel_init);
  if (result)
  {
    result->_status = a3;
    result->_iCloudAccountStatus = a4;
    result->_unsupportedDevices = a5;
    result->_hasOnlyEmptyHomes = a6;
    result->_numberOwnedNonEmptyHomes = a7;
    result->_numberUnownedSharedHomes = a8;
    result->_numberOwnedSharedHomes = a9;
    result->_eligible = a3 == 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BOOL4 v14;
  int v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMDHH2AutoMigrationEligibilityResult status](self, "status"), v7 == objc_msgSend(v6, "status"))
    && (v8 = -[HMDHH2AutoMigrationEligibilityResult iCloudAccountStatus](self, "iCloudAccountStatus"),
        v8 == objc_msgSend(v6, "iCloudAccountStatus"))
    && (v9 = -[HMDHH2AutoMigrationEligibilityResult unsupportedDevices](self, "unsupportedDevices"),
        v9 == objc_msgSend(v6, "unsupportedDevices"))
    && (v10 = -[HMDHH2AutoMigrationEligibilityResult hasOnlyEmptyHomes](self, "hasOnlyEmptyHomes"),
        v10 == objc_msgSend(v6, "hasOnlyEmptyHomes"))
    && (v11 = -[HMDHH2AutoMigrationEligibilityResult numberOwnedNonEmptyHomes](self, "numberOwnedNonEmptyHomes"),
        v11 == objc_msgSend(v6, "numberOwnedNonEmptyHomes"))
    && (v12 = -[HMDHH2AutoMigrationEligibilityResult numberUnownedSharedHomes](self, "numberUnownedSharedHomes"),
        v12 == objc_msgSend(v6, "numberUnownedSharedHomes"))
    && (v13 = -[HMDHH2AutoMigrationEligibilityResult numberOwnedSharedHomes](self, "numberOwnedSharedHomes"),
        v13 == objc_msgSend(v6, "numberOwnedSharedHomes")))
  {
    v14 = -[HMDHH2AutoMigrationEligibilityResult isEligible](self, "isEligible");
    v15 = v14 ^ objc_msgSend(v6, "isEligible") ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[9];

  v29[8] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHH2AutoMigrationEligibilityResult isEligible](self, "isEligible");
  HMFBooleanToString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("isEligible"), v28);
  v29[0] = v27;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult status](self, "status"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("status"), v26);
  v29[1] = v25;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult iCloudAccountStatus](self, "iCloudAccountStatus"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("iCloudAccountStatus"), v24);
  v29[2] = v23;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult unsupportedDevices](self, "unsupportedDevices"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("unsupportedDevices"), v22);
  v29[3] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHH2AutoMigrationEligibilityResult hasOnlyEmptyHomes](self, "hasOnlyEmptyHomes");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("hasOnlyEmptyHomes"), v9);
  v29[4] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult numberOwnedNonEmptyHomes](self, "numberOwnedNonEmptyHomes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("numberOwnedNonEmptyHomes"), v12);
  v29[5] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult numberUnownedSharedHomes](self, "numberUnownedSharedHomes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("numberUnownedSharedHomes"), v15);
  v29[6] = v16;
  v17 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult numberOwnedSharedHomes](self, "numberOwnedSharedHomes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("numberOwnedSharedHomes"), v18);
  v29[7] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)isEligible
{
  return self->_eligible;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)iCloudAccountStatus
{
  return self->_iCloudAccountStatus;
}

- (unint64_t)unsupportedDevices
{
  return self->_unsupportedDevices;
}

- (BOOL)hasOnlyEmptyHomes
{
  return self->_hasOnlyEmptyHomes;
}

- (unint64_t)numberOwnedNonEmptyHomes
{
  return self->_numberOwnedNonEmptyHomes;
}

- (unint64_t)numberUnownedSharedHomes
{
  return self->_numberUnownedSharedHomes;
}

- (unint64_t)numberOwnedSharedHomes
{
  return self->_numberOwnedSharedHomes;
}

@end
