@implementation _MFDAResolveRecipientsConsumer

- (_MFDAResolveRecipientsConsumer)init
{
  _MFDAResolveRecipientsConsumer *v2;
  uint64_t v3;
  MFConditionLock *conditionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFDAResolveRecipientsConsumer;
  v2 = -[_MFDAResolveRecipientsConsumer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("_MFDAResolveRecipientsConsumer_Lock"), 0, 0);
    conditionLock = v2->_conditionLock;
    v2->_conditionLock = (MFConditionLock *)v3;

  }
  return v2;
}

- (NSError)error
{
  NSError *v3;

  -[MFConditionLock lock](self->_conditionLock, "lock");
  v3 = self->_error;
  -[MFConditionLock unlock](self->_conditionLock, "unlock");
  return v3;
}

- (id)waitForResolvedRecipients
{
  NSDictionary *v3;

  -[MFConditionLock lockWhenCondition:](self->_conditionLock, "lockWhenCondition:", 1);
  v3 = self->_resolvedRecipientsByEmailAddress;
  -[MFConditionLock unlock](self->_conditionLock, "unlock");
  return v3;
}

- (void)resolvedRecipientsByEmailAddress:(id)a3
{
  NSDictionary *v4;
  NSDictionary *resolvedRecipientsByEmailAddress;
  id v6;

  v6 = a3;
  -[MFConditionLock lock](self->_conditionLock, "lock");
  v4 = (NSDictionary *)objc_msgSend(v6, "copy");
  resolvedRecipientsByEmailAddress = self->_resolvedRecipientsByEmailAddress;
  self->_resolvedRecipientsByEmailAddress = v4;

  -[MFConditionLock unlockWithCondition:](self->_conditionLock, "unlockWithCondition:", 1);
}

- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[MFConditionLock lock](self->_conditionLock, "lock");
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_ERROR, "reslove recipients task %@ failed with code %ld", (uint8_t *)&v11, 0x16u);
  }

  objc_storeStrong((id *)&self->_error, a5);
  -[MFConditionLock unlockWithCondition:](self->_conditionLock, "unlockWithCondition:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resolvedRecipientsByEmailAddress, 0);
  objc_storeStrong((id *)&self->_conditionLock, 0);
}

@end
