@implementation BRCProblem

- (BRCProblem)initWithType:(int)a3 recordName:(id)a4
{
  id v6;
  BRCProblem *v7;
  BRCProblem *v8;
  uint64_t v9;
  NSSet *effectedRecordNames;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCProblem;
  v7 = -[BRCProblem init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    if (v6)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    effectedRecordNames = v8->_effectedRecordNames;
    v8->_effectedRecordNames = (NSSet *)v9;

  }
  return v8;
}

- (BRCProblem)initWithProblem:(id)a3
{
  id v4;
  BRCProblem *v5;
  BRCProblem *v6;
  uint64_t v7;
  NSSet *effectedRecordNames;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCProblem;
  v5 = -[BRCProblem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = *((_DWORD *)v4 + 2);
    v7 = objc_msgSend(*((id *)v4 + 2), "copy");
    effectedRecordNames = v6->_effectedRecordNames;
    v6->_effectedRecordNames = (NSSet *)v7;

  }
  return v6;
}

- (BRCProblem)initWithCoder:(id)a3
{
  id v4;
  BRCProblem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *effectedRecordNames;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCProblem;
  v5 = -[BRCProblem init](&v12, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recordNames"));
    v9 = objc_claimAutoreleasedReturnValue();
    effectedRecordNames = v5->_effectedRecordNames;
    v5->_effectedRecordNames = (NSSet *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_effectedRecordNames, CFSTR("recordNames"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProblem:", self);
}

- (void)mergeWithProblem:(id)a3
{
  _DWORD *v4;
  NSUInteger v5;
  void *v6;
  unint64_t v7;
  NSSet *v8;
  NSSet *effectedRecordNames;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (self->_type != v4[2])
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCProblem mergeWithProblem:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  }
  v5 = -[NSSet count](self->_effectedRecordNames, "count");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "zoneHealthReportedRecordNamesCount");

  if (v5 < v7)
  {
    -[NSSet setByAddingObjectsFromSet:](self->_effectedRecordNames, "setByAddingObjectsFromSet:", *((_QWORD *)v4 + 2));
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    effectedRecordNames = self->_effectedRecordNames;
    self->_effectedRecordNames = v8;

  }
}

- (int)type
{
  return self->_type;
}

- (NSSet)effectedRecordNames
{
  return self->_effectedRecordNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectedRecordNames, 0);
}

- (void)mergeWithProblem:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: _type == problem->_type%@", a5, a6, a7, a8, 2u);
}

@end
