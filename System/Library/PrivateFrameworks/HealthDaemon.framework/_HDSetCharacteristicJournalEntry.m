@implementation _HDSetCharacteristicJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  id obj;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v29 = *(_QWORD *)v33;
    v10 = *MEMORY[0x1E0CB49D0];
    *(_QWORD *)&v7 = 138543874;
    v27 = v7;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        v12 = v9;
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v13, "value", v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "isEqualToString:", v10))
          goto LABEL_9;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "hk_dateOfBirthDateComponentsWithDate:", v14);
          v18 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v18;
LABEL_9:

        }
        objc_msgSend(v30, "userCharacteristicsManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v12;
        v20 = objc_msgSend(v19, "setUserCharacteristic:forType:error:", v14, v15, &v31);
        v9 = v31;

        if ((v20 & 1) == 0)
        {
          _HKInitializeLogging();
          v21 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            v23 = (void *)objc_opt_class();
            v24 = v23;
            objc_msgSend(v13, "dataType");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "code");
            *(_DWORD *)buf = v27;
            v37 = v23;
            v38 = 2048;
            v39 = v26;
            v40 = 2114;
            v41 = v9;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set characteristic for type %ld, %{public}@", buf, 0x20u);

          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      if (!v8)
      {

        break;
      }
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDSetCharacteristicJournalEntry)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _HDSetCharacteristicJournalEntry *v11;
  objc_super v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)_HDSetCharacteristicJournalEntry;
  v11 = -[HDJournalEntry initWithCoder:](&v13, sel_initWithCoder_, v5);

  if (v11)
  {
    objc_storeStrong(&v11->_value, v9);
    objc_storeStrong((id *)&v11->_dataType, v10);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: encoding is not supported", (uint8_t *)&v6, 0xCu);

  }
}

- (id)value
{
  return self->_value;
}

- (HKCharacteristicType)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataType, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
