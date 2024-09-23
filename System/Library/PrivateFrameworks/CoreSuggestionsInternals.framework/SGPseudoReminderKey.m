@implementation SGPseudoReminderKey

- (SGPseudoReminderKey)initWithGroupId:(id)a3
{
  id v6;
  SGPseudoReminderKey *v7;
  SGPseudoReminderKey *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPseudoReminderKey.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupId"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGPseudoReminderKey;
  v7 = -[SGPseudoReminderKey init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_groupId, a3);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SGPseudoReminderKey *v4;
  SGPseudoReminderKey *v5;
  BOOL v6;

  v4 = (SGPseudoReminderKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGPseudoReminderKey isEqualToPseudoReminderKey:](self, "isEqualToPseudoReminderKey:", v5);

  return v6;
}

- (BOOL)isEqualToPseudoReminderKey:(id)a3
{
  NSString *v4;
  NSString *v5;
  char v6;

  v4 = self->_groupId;
  v5 = v4;
  if (v4 == *((NSString **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSString isEqual:](v4, "isEqual:");

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_groupId, "hash");
}

- (id)serialize
{
  return self->_groupId;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SGPseudoReminderKey groupId:%@"), self->_groupId);
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 < 0x1C)
    return (a3 & 0xFFFFFFF) == 22;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGPseudoReminderKey.m"), 85, CFSTR("Unknown entity type: %lu"), a3);

  return 0;
}

@end
