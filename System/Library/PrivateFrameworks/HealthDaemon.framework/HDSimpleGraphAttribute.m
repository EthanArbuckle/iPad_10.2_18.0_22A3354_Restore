@implementation HDSimpleGraphAttribute

- (HDSimpleGraphAttribute)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSimpleGraphAttribute)initWithRowID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 nodeID:(int64_t)a6 version:(int64_t)a7 slots:(unint64_t)a8
{
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  HDSimpleGraphAttribute *v17;
  HDSimpleGraphAttribute *v18;
  uint64_t v19;
  NSString *value;
  objc_super v22;

  v14 = (__CFString *)a5;
  v15 = v14;
  if (v14 == CFSTR("hgNULL"))
    v16 = 1;
  else
    v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("hgNULL"));
  v22.receiver = self;
  v22.super_class = (Class)HDSimpleGraphAttribute;
  v17 = -[HDSimpleGraphObject initWithRowID:version:slots:deleted:](&v22, sel_initWithRowID_version_slots_deleted_, a3, a7, a8, v16);
  v18 = v17;
  if (v17)
  {
    v17->_type = a4;
    v19 = -[__CFString copy](v15, "copy");
    value = v18->_value;
    v18->_value = (NSString *)v19;

    v18->_nodeID = a6;
  }

  return v18;
}

- (HDSimpleGraphAttribute)initWithRowID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 nodeID:(int64_t)a6
{
  return -[HDSimpleGraphAttribute initWithRowID:type:value:nodeID:version:slots:](self, "initWithRowID:type:value:nodeID:version:slots:", a3, a4, a5, a6, 0, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HDSimpleGraphAttribute;
  -[HDSimpleGraphObject description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %lld->%lld = %@>"), v4, self->_nodeID, self->_type, self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)nodeID
{
  return self->_nodeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
