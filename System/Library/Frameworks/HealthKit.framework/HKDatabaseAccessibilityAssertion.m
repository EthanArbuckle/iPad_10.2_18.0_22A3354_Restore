@implementation HKDatabaseAccessibilityAssertion

- (HKDatabaseAccessibilityAssertion)initWithOwnerIdentifier:(id)a3 uuidString:(id)a4
{
  id v7;
  id v8;
  HKDatabaseAccessibilityAssertion *v9;
  HKDatabaseAccessibilityAssertion *v10;
  uint64_t v11;
  NSUUID *UUID;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKDatabaseAccessibilityAssertion;
  v9 = -[HKDatabaseAccessibilityAssertion init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ownerIdentifier, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v11;

    v10->_isValid = 0;
  }

  return v10;
}

- (void)configureAssertion:(id)a3
{
  objc_storeWeak((id *)&self->_healthStore, a3);
  self->_isValid = 1;
}

- (void)markInvalid
{
  self->_isValid = 0;
}

- (void)invalidate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Attempted to invalidate an invalid assertion %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *ownerIdentifier;
  NSUUID *UUID;
  id v7;

  v4 = a3;
  ownerIdentifier = self->_ownerIdentifier;
  v7 = v4;
  if (ownerIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", ownerIdentifier, CFSTR("OwnerIdentifier"));
    v4 = v7;
  }
  UUID = self->_UUID;
  if (UUID)
  {
    objc_msgSend(v7, "encodeObject:forKey:", UUID, CFSTR("UniqueIdentifier"));
    v4 = v7;
  }

}

- (HKDatabaseAccessibilityAssertion)initWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *v6;
  NSUUID *UUID;
  void *v8;
  HKDatabaseAccessibilityAssertion *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("OwnerIdentifier")))
  {
    _HKInitializeLogging();
    HKLogAssertions();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[HKDatabaseAccessibilityAssertion initWithCoder:].cold.2(v5, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OwnerIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UniqueIdentifier")) & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogAssertions();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[HKDatabaseAccessibilityAssertion initWithCoder:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniqueIdentifier"));
  v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  UUID = self->_UUID;
  self->_UUID = v6;

  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[HKDatabaseAccessibilityAssertion initWithOwnerIdentifier:uuidString:](self, "initWithOwnerIdentifier:uuidString:", v5, v8);

  v9 = self;
LABEL_10:

  return v9;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_loadWeakRetained((id *)&self->_healthStore);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_healthStore);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_13(&dword_19A0E6000, a1, a3, "Missing unique identifier", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_13(&dword_19A0E6000, a1, a3, "Missing ownerIdentifier", a5, a6, a7, a8, 0);
}

@end
