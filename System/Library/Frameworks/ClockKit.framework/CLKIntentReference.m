@implementation CLKIntentReference

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inflatedIntent);
  objc_storeStrong((id *)&self->_intentData, 0);
}

- (CLKIntentReference)initWithIntent:(id)a3
{
  id v4;
  void *v5;
  NSData *v6;
  id v7;
  NSData *intentData;
  CLKIntentReference *v9;
  NSObject *v10;
  id v12;
  objc_super v13;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  v13.receiver = self;
  v13.super_class = (Class)CLKIntentReference;
  self = -[CLKIntentReference init](&v13, sel_init);
  if (self)
  {
    INIntentWithTypedIntent();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_inflatedIntent, v5);
    self->_indexingHash = objc_msgSend(v4, "_indexingHash");
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
    {
      intentData = self->_intentData;
      self->_intentData = v6;

      self->_lock._os_unfair_lock_opaque = 0;
      goto LABEL_5;
    }
    CLKLoggingObjectForDomain(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[CLKIntentReference initWithIntent:].cold.1((uint64_t)v4, (uint64_t)v7, v10);

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
LABEL_5:
  self = self;
  v9 = self;
LABEL_10:

  return v9;
}

- (INIntent)intent
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CLKIntentReference _lock_intent](self, "_lock_intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (INIntent *)v4;
}

- (id)_lock_intent
{
  INIntent **p_inflatedIntent;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSData *intentData;
  id v10;
  id v11;
  NSObject *v12;
  id v14;

  p_inflatedIntent = &self->_inflatedIntent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inflatedIntent);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    v8 = objc_opt_class();
    intentData = self->_intentData;
    v14 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, intentData, &v14);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v6)
    {
      objc_storeWeak((id *)p_inflatedIntent, v6);
      v11 = v6;
    }
    else
    {
      CLKLoggingObjectForDomain(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[CLKIntentReference _lock_intent].cold.1((uint64_t)v10, v12);

    }
  }

  return v6;
}

- (NSData)keyedArchiverEncodedData
{
  return self->_intentData;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt64:withName:", self->_indexingHash, CFSTR("indexingHash"));
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_indexingHash == v4[4];

  return v5;
}

- (unint64_t)hash
{
  return self->_indexingHash;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t indexingHash;
  uint64_t v5;
  id v6;

  indexingHash = self->_indexingHash;
  v5 = _CLKIntentReferenceIndexingHashKey;
  v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", indexingHash, v5);
  objc_msgSend(v6, "encodeObject:forKey:", self->_intentData, _CLKIntentReferenceIntentDataKey);

}

- (CLKIntentReference)initWithCoder:(id)a3
{
  id v4;
  CLKIntentReference *v5;
  uint64_t v6;
  NSData *intentData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKIntentReference;
  v5 = -[CLKIntentReference init](&v9, sel_init);
  if (v5)
  {
    v5->_indexingHash = objc_msgSend(v4, "decodeInt64ForKey:", _CLKIntentReferenceIndexingHashKey);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), _CLKIntentReferenceIntentDataKey);
    v6 = objc_claimAutoreleasedReturnValue();
    intentData = v5->_intentData;
    v5->_intentData = (NSData *)v6;

  }
  return v5;
}

- (int64_t)indexingHash
{
  return self->_indexingHash;
}

- (void)initWithIntent:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_2114F4000, log, OS_LOG_TYPE_FAULT, "Failed to encode intent %@, error %@", (uint8_t *)&v3, 0x16u);
}

- (void)_lock_intent
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "Failed to decode intent: %@", (uint8_t *)&v2, 0xCu);
}

@end
