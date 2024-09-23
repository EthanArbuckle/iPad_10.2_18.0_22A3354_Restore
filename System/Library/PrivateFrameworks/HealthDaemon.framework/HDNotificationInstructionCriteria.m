@implementation HDNotificationInstructionCriteria

+ (NSString)criteriaIdentifier
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_1E6D11BB8;
}

- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 125, CFSTR("Only valid to call on a subclass"));
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend((id)objc_opt_class(), "criteriaIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDNotificationInstructionCriteria)initWithCoder:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return -[HDNotificationInstructionCriteria init](self, "init");
}

- (HDNotificationInstructionCriteria)initWithMessageDictionary:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();

  return 0;
}

- (id)messageDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (HDNotificationInstructionCriteria)initWithCodableNotificationInstructionCriteria:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();

  return 0;
}

- (id)codableCriteria
{
  HDCodableNotificationInstructionCriteria *v2;
  void *v3;

  v2 = objc_alloc_init(HDCodableNotificationInstructionCriteria);
  objc_msgSend((id)objc_opt_class(), "criteriaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNotificationInstructionCriteria setIdentifier:](v2, "setIdentifier:", v3);

  return v2;
}

@end
