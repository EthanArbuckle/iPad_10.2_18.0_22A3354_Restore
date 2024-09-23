@implementation CADisplayPersistedLatency

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayPersistedLatency;
  -[CADisplayPersistedLatency dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p; "), NSStringFromClass(v4), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("uuid: %@, mode: %@, latency:%g"), self->_uuid, self->_mode, *(_QWORD *)&self->_latency);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CADisplayPersistedLatency)initWithCoder:(id)a3
{
  CADisplayPersistedLatency *v4;
  double v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CADisplayPersistedLatency;
  v4 = -[CADisplayPersistedLatency init](&v7, sel_init);
  if (v4)
  {
    v4->_uuid = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    if (mode_dictionary_classes(void)::once != -1)
      dispatch_once(&mode_dictionary_classes(void)::once, &__block_literal_global_115);
    v4->_mode = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", mode_dictionary_classes(void)::set, CFSTR("mode"));
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latency")), "doubleValue");
    v4->_latency = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latency), CFSTR("latency"));
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
