@implementation HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria

+ (id)criteriaIdentifier
{
  return CFSTR("HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria");
}

- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  objc_msgSend(v6, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 6, CFSTR("Protected database is inaccessible"));
    goto LABEL_5;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_2;
  v12[3] = &unk_1E6E00DB8;
  v12[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_3;
  v11[3] = &unk_1E6E01460;
  v11[4] = &v13;
  if (!objc_msgSend(v7, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &isValidWithDatabaseTransaction_error__lookupKey, a4, &__block_literal_global_12, v12, v11))
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = v14[3];
LABEL_6:

  _Block_object_dispose(&v13, 8);
  return v9;
}

id __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMedicationScheduleEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE %@ = ? AND %@ >= ? LIMIT 1"), v1, CFSTR("uuid"), CFSTR("creation_date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_2()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_3(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
  return 0;
}

- (id)_initWithUUIDString:(void *)a3 modificationTimeInterval:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v5 && v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
    v10 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = -[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria _initWithUUID:modificationDate:](a1, v9, v11);

    v8 = a1;
  }

  return v8;
}

- (id)_initWithUUID:(void *)a3 modificationDate:
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v5 && v6)
  {
    a1 = (id)objc_msgSend(a1, "initWithUUID:modificationDate:", v5, v6);
    v8 = a1;
  }

  return v8;
}

- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithUUID:(id)a3 modificationDate:(id)a4
{
  id v6;
  id v7;
  HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  NSDate *modificationDate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  v8 = -[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    UUID = v8->_UUID;
    v8->_UUID = (NSUUID *)v9;

    v11 = objc_msgSend(v7, "copy");
    modificationDate = v8->_modificationDate;
    v8->_modificationDate = (NSDate *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSUUID *UUID;
  NSUUID *v7;
  NSDate *modificationDate;
  NSDate *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  if (-[HDNotificationInstructionCriteria isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = v4;
    UUID = self->_UUID;
    v7 = (NSUUID *)v5[1];
    if (UUID != v7 && (!v7 || !-[NSUUID isEqual:](UUID, "isEqual:")))
      goto LABEL_9;
    modificationDate = self->_modificationDate;
    v9 = (NSDate *)v5[2];
    if (modificationDate == v9)
    {
      v10 = 1;
      goto LABEL_11;
    }
    if (v9)
      v10 = -[NSDate isEqual:](modificationDate, "isEqual:");
    else
LABEL_9:
      v10 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  v3 = -[HDNotificationInstructionCriteria hash](&v6, sel_hash);
  v4 = -[NSUUID hash](self->_UUID, "hash") ^ v3;
  return v4 ^ -[NSDate hash](self->_modificationDate, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %@ mtime:%@>"), objc_opt_class(), self->_UUID, self->_modificationDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModificationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *)-[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria _initWithUUID:modificationDate:](self, v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("ModificationDate"));

}

- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithMessageDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *v7;

  v4 = a3;
  objc_msgSend(v4, "hk_safeStringForKeyPath:error:", CFSTR("UUID"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_safeNumberForKeyPath:error:", CFSTR("ModificationDate"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *)-[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria _initWithUUIDString:modificationTimeInterval:](self, v5, v6);
  return v7;
}

- (id)messageDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  -[HDNotificationInstructionCriteria messageDictionary](&v10, sel_messageDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("UUID");
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ModificationDate");
  v12[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_modificationDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dictionaryByAddingEntriesFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithCodableNotificationInstructionCriteria:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *v8;

  v4 = a3;
  if (objc_msgSend(v4, "hasUUIDString"))
  {
    objc_msgSend(v4, "uUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v4, "hasModificationTimeInterval"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "modificationTimeInterval");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *)-[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria _initWithUUIDString:modificationTimeInterval:](self, v5, v7);

  return v8;
}

- (id)codableCriteria
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  -[HDNotificationInstructionCriteria codableCriteria](&v6, sel_codableCriteria);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUUIDString:", v4);

  -[NSDate timeIntervalSinceReferenceDate](self->_modificationDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setModificationTimeInterval:");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
