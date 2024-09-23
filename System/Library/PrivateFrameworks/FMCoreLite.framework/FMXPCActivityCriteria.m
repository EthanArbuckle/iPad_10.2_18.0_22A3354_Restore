@implementation FMXPCActivityCriteria

- (FMXPCActivityCriteria)initWithPriority:(int64_t)a3 repeating:(BOOL)a4 delay:(int64_t)a5 gracePeriod:(int64_t)a6 interval:(int64_t)a7 options:(unint64_t)a8
{
  FMXPCActivityCriteria *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FMXPCActivityCriteria;
  result = -[FMXPCActivityCriteria init](&v15, sel_init);
  if (result)
  {
    result->_repeating = a4;
    result->_priority = a3;
    result->_delay = a5;
    result->_gracePeriod = a6;
    result->_interval = a7;
    result->_options = a8;
  }
  return result;
}

- (FMXPCActivityCriteria)initWithXPCObject:(id)a3
{
  id v4;
  FMXPCActivityCriteria *v5;
  const char *string;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMXPCActivityCriteria;
  v5 = -[FMXPCActivityCriteria init](&v8, sel_init);
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C80878]);
    if (string)
    {
      v5->_priority = -[FMXPCActivityCriteria _priorityFromString:](v5, "_priorityFromString:", string);
      v5->_repeating = xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C80898]);
      v5->_delay = xpc_dictionary_get_int64(v4, (const char *)*MEMORY[0x1E0C80760]);
      v5->_gracePeriod = xpc_dictionary_get_int64(v4, (const char *)*MEMORY[0x1E0C80790]);
      v5->_interval = xpc_dictionary_get_int64(v4, (const char *)*MEMORY[0x1E0C807A8]);
      v5->_options = objc_msgSend((id)objc_opt_class(), "_optionsFromXPCObject:", v4);
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[FMXPCActivityCriteria priority](self, "priority");
    if (v6 == objc_msgSend(v5, "priority")
      && (v7 = -[FMXPCActivityCriteria repeating](self, "repeating"), v7 == objc_msgSend(v5, "repeating"))
      && (v8 = -[FMXPCActivityCriteria delay](self, "delay"), v8 == objc_msgSend(v5, "delay"))
      && (v9 = -[FMXPCActivityCriteria gracePeriod](self, "gracePeriod"), v9 == objc_msgSend(v5, "gracePeriod"))
      && (v10 = -[FMXPCActivityCriteria interval](self, "interval"), v10 == objc_msgSend(v5, "interval")))
    {
      v11 = -[FMXPCActivityCriteria options](self, "options");
      v12 = v11 == objc_msgSend(v5, "options");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[priority: %ld repeating: %d delay: %llu grace: %llu interval: %llu, options: 0x%lx]"), -[FMXPCActivityCriteria priority](self, "priority"), -[FMXPCActivityCriteria repeating](self, "repeating"), -[FMXPCActivityCriteria delay](self, "delay"), -[FMXPCActivityCriteria gracePeriod](self, "gracePeriod"), -[FMXPCActivityCriteria interval](self, "interval"), -[FMXPCActivityCriteria options](self, "options"));
}

- (id)xpcDictionary
{
  xpc_object_t v3;
  int64_t v4;
  const char **v5;
  __int16 v6;
  __int16 v7;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = -[FMXPCActivityCriteria priority](self, "priority");
  if (v4)
  {
    if (v4 != 1)
      goto LABEL_6;
    v5 = (const char **)MEMORY[0x1E0C80880];
  }
  else
  {
    v5 = (const char **)MEMORY[0x1E0C80888];
  }
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], *v5);
LABEL_6:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], -[FMXPCActivityCriteria repeating](self, "repeating"));
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80760], -[FMXPCActivityCriteria delay](self, "delay"));
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80790], -[FMXPCActivityCriteria gracePeriod](self, "gracePeriod"));
  if (-[FMXPCActivityCriteria repeating](self, "repeating"))
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], -[FMXPCActivityCriteria interval](self, "interval"));
  v6 = -[FMXPCActivityCriteria options](self, "options");
  v7 = v6;
  if ((v6 & 1) != 0)
  {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80868], 1);
    if ((v7 & 4) == 0)
    {
LABEL_10:
      if ((v7 & 2) == 0)
        goto LABEL_11;
      goto LABEL_26;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_10;
  }
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808E0], 1);
  if ((v7 & 2) == 0)
  {
LABEL_11:
    if ((v7 & 8) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808F0], 1);
  if ((v7 & 8) == 0)
  {
LABEL_12:
    if ((v7 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80908], 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_13:
    if ((v7 & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808A8], 1);
  if ((v7 & 0x20) == 0)
  {
LABEL_14:
    if ((v7 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808B0], 1);
  if ((v7 & 0x40) == 0)
  {
LABEL_15:
    if ((v7 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808B8], 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_16:
    if ((v7 & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D0], 1);
  if ((v7 & 0x100) == 0)
  {
LABEL_17:
    if ((v7 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_33;
  }
LABEL_32:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808C8], 1);
  if ((v7 & 0x2000) == 0)
  {
LABEL_18:
    if ((v7 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_34;
  }
LABEL_33:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80778], 1);
  if ((v7 & 0x200) == 0)
  {
LABEL_19:
    if ((v7 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_35;
  }
LABEL_34:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], 1);
  if ((v7 & 0x400) == 0)
  {
LABEL_20:
    if ((v7 & 0x800) == 0)
      goto LABEL_21;
LABEL_36:
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80758], 1);
    if ((v7 & 0x1000) == 0)
      return v3;
    goto LABEL_22;
  }
LABEL_35:
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80808], 1);
  if ((v7 & 0x800) != 0)
    goto LABEL_36;
LABEL_21:
  if ((v7 & 0x1000) != 0)
LABEL_22:
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80770], 1);
  return v3;
}

+ (unint64_t)_optionsFromXPCObject:(id)a3
{
  const char *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v7;

  v3 = (const char *)*MEMORY[0x1E0C80868];
  v4 = a3;
  v5 = xpc_dictionary_get_BOOL(v4, v3);
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C808E0]))
    v5 |= 4uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C808F0]))
    v5 |= 2uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C80908]))
    v5 |= 8uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C808A8]))
    v5 |= 0x10uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C808B0]))
    v5 |= 0x20uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8]))
    v5 |= 0x40uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C808D0]))
    v5 |= 0x80uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C808C8]))
    v5 |= 0x100uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C80778]))
    v5 |= 0x2000uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C80738]))
    v5 |= 0x200uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C80808]))
    v5 |= 0x400uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C80758]))
    v5 |= 0x800uLL;
  if (xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C80770]))
    v6 = v5 | 0x1000;
  else
    v6 = v5;
  v7 = xpc_dictionary_get_BOOL(v4, (const char *)*MEMORY[0x1E0C80750]);

  if (v7)
    return v6 | 0x4000;
  else
    return v6;
}

- (int64_t)_priorityFromString:(const char *)a3
{
  size_t v4;

  v4 = strlen((const char *)*MEMORY[0x1E0C80888]);
  return strncmp(a3, (const char *)*MEMORY[0x1E0C80888], v4) != 0;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)repeating
{
  return self->_repeating;
}

- (void)setRepeating:(BOOL)a3
{
  self->_repeating = a3;
}

- (int64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(int64_t)a3
{
  self->_delay = a3;
}

- (int64_t)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(int64_t)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
