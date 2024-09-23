@implementation DACActivityListEntry

- (id)_initWithActivity:(void *)a3 date:(void *)a4 reason:(void *)a5 origin:(void *)a6 changeMarker:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  objc_super v18;

  v12 = a2;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)DACActivityListEntry;
    v16 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      a1[3] = a4;
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  DACActivityDescriptor *v6;
  NSDate *v7;
  unint64_t reason;
  DACChangeMarker *changeMarker;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = self->_activity;
    v7 = self->_date;
    reason = self->_reason;
    changeMarker = self->_changeMarker;
  }
  else
  {
    reason = 0;
    v6 = 0;
    v7 = 0;
    changeMarker = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@, date(%@) reason(%lu) cm(%@)>"), v5, self, v6, v7, reason, changeMarker);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (DACActivityListEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DACActivityListEntry *v11;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) < 1)
  {
    v11 = 0;
    v5 = self;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("origin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeMarker"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[DACChangeMarker missingMarker](DACChangeMarker, "missingMarker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = (DACActivityListEntry *)-[DACActivityListEntry _initWithActivity:date:reason:origin:changeMarker:]((id *)&self->super.isa, v5, v6, v8, v9, v10);

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  void *v5;
  DACChangeMarker *changeMarker;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", 1, CFSTR("version"));
  if (self)
  {
    objc_msgSend(v8, "encodeObject:forKey:", self->_activity, CFSTR("activity"));
    date = self->_date;
  }
  else
  {
    objc_msgSend(v8, "encodeObject:forKey:", 0, CFSTR("activity"));
    date = 0;
  }
  objc_msgSend(v8, "encodeObject:forKey:", date, CFSTR("date"));
  if (self)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_reason);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("reason"));

    objc_msgSend(v8, "encodeObject:forKey:", self->_origin, CFSTR("origin"));
    changeMarker = self->_changeMarker;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("reason"));

    objc_msgSend(v8, "encodeObject:forKey:", 0, CFSTR("origin"));
    changeMarker = 0;
  }
  objc_msgSend(v8, "encodeObject:forKey:", changeMarker, CFSTR("changeMarker"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DACActivityListEntry *v4;
  DACActivityDescriptor *v5;
  NSDate *v6;
  void *reason;
  DACActivityDescriptor *v8;
  DACChangeMarker *changeMarker;
  id *v10;

  v4 = [DACActivityListEntry alloc];
  if (self)
  {
    v5 = self->_activity;
    v6 = self->_date;
    reason = (void *)self->_reason;
    v8 = self->_origin;
    changeMarker = self->_changeMarker;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v5 = 0;
    reason = 0;
    changeMarker = 0;
  }
  v10 = -[DACActivityListEntry _initWithActivity:date:reason:origin:changeMarker:]((id *)&v4->super.isa, v5, v6, reason, v8, changeMarker);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  DACActivityDescriptor *v4;
  DACActivityListEntry *v6;
  DACActivityListEntry *v7;
  id *v8;
  DACActivityDescriptor *v9;
  id v10;
  NSDate *v11;
  id v12;
  DACActivityDescriptor *v13;
  DACChangeMarker *v14;
  id v16;
  DACActivityDescriptor *v17;
  int v18;

  v6 = (DACActivityListEntry *)a3;
  v7 = v6;
  if (v6)
  {
    if (self == v6)
    {
      LOBYTE(self) = 1;
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      if (!self)
      {
LABEL_26:

        goto LABEL_27;
      }
      v9 = self->_activity;
      v10 = v8[1];
      if (!-[DACActivityDescriptor isEqual:](v9, "isEqual:", v10))
      {
        LOBYTE(self) = 0;
LABEL_25:

        goto LABEL_26;
      }
      v11 = self->_date;
      v12 = v8[2];
      if (!-[NSDate isEqual:](v11, "isEqual:", v12) || (id)self->_reason != v8[3])
      {
        LOBYTE(self) = 0;
LABEL_24:

        goto LABEL_25;
      }
      v13 = self->_origin;
      if (v13 || (v16 = v8[4]) != 0)
      {
        v4 = self->_origin;
        v3 = v8[4];
        if (!-[DACActivityDescriptor isEqual:](v4, "isEqual:", v3))
        {

          LOBYTE(self) = 0;
          if (v13)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v17 = v13;
        v18 = 1;
      }
      else
      {
        v16 = 0;
        v17 = 0;
        v18 = 0;
      }
      v14 = self->_changeMarker;
      LOBYTE(self) = -[DACChangeMarker isEqual:](v14, "isEqual:", v8[5]);

      if (v18)
      {

      }
      v13 = v17;
      if (v17)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  LOBYTE(self) = 0;
LABEL_27:

  return (char)self;
}

- (unint64_t)hash
{
  DACActivityDescriptor *activity;
  DACActivityDescriptor *v4;
  uint64_t v5;
  NSDate *date;
  unint64_t v7;

  if (self)
    activity = self->_activity;
  else
    activity = 0;
  v4 = activity;
  v5 = -[DACActivityDescriptor hash](v4, "hash");
  if (self)
    date = self->_date;
  else
    date = 0;
  v7 = -[NSDate hash](date, "hash") ^ v5;

  return v7;
}

uint64_t __34__DACActivityListEntry_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(void *, id, uint64_t);
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  _QWORD *v21;
  __int16 v22;
  _QWORD *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  +[DACActivityDescriptor comparator](DACActivityDescriptor, "comparator");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    v8 = (void *)v4[1];
    if (v5)
    {
LABEL_3:
      v9 = v5[1];
      goto LABEL_4;
    }
  }
  else
  {
    v8 = 0;
    if (v5)
      goto LABEL_3;
  }
  v9 = 0;
LABEL_4:
  v10 = *(uint64_t (**)(void *, id, uint64_t))(v6 + 16);
  v11 = v8;
  v12 = v10(v7, v11, v9);

  if (v12)
    goto LABEL_9;
  if (!v5)
  {
    v13 = 0;
    if (v4)
      goto LABEL_7;
LABEL_15:
    v14 = 0;
    goto LABEL_8;
  }
  v13 = (void *)v5[2];
  if (!v4)
    goto LABEL_15;
LABEL_7:
  v14 = v4[2];
LABEL_8:
  v15 = v13;
  v12 = objc_msgSend(v15, "compare:", v14);

LABEL_9:
  DACLogForCategory(1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134218498;
    v19 = v12;
    v20 = 2114;
    v21 = v4;
    v22 = 2114;
    v23 = v5;
    _os_log_debug_impl(&dword_224FBF000, v16, OS_LOG_TYPE_DEBUG, "Compare yielded %ld for %{public}@ and %{public}@", (uint8_t *)&v18, 0x20u);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeMarker, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
