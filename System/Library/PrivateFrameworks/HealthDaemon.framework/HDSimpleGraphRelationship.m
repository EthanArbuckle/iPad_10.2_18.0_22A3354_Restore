@implementation HDSimpleGraphRelationship

- (HDSimpleGraphRelationship)init
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

- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("The -%@ method is not available on %@"), v9, objc_opt_class());

  return 0;
}

- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 subjectID:(int64_t)a4 type:(int64_t)a5 objectID:(int64_t)a6 version:(int64_t)a7 slots:(unint64_t)a8
{
  HDSimpleGraphRelationship *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HDSimpleGraphRelationship;
  result = -[HDSimpleGraphObject initWithRowID:version:slots:deleted:](&v12, sel_initWithRowID_version_slots_deleted_, a3, a7, a8, a6 == 204);
  if (result)
  {
    result->_subjectID = a4;
    result->_type = a5;
    result->_objectID = a6;
  }
  return result;
}

- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 subjectID:(int64_t)a4 type:(int64_t)a5 objectID:(int64_t)a6
{
  return -[HDSimpleGraphRelationship initWithRowID:subjectID:type:objectID:version:slots:](self, "initWithRowID:subjectID:type:objectID:version:slots:", a3, a4, a5, a6, 0, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HDSimpleGraphRelationship;
  -[HDSimpleGraphObject description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %lld (%lld) %lld>"), v4, self->_subjectID, self->_type, self->_objectID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[HDSimpleGraphRelationship type](self, "type");
  v5 = v4 ^ -[HDSimpleGraphRelationship subjectID](self, "subjectID") ^ v3;
  return v5 ^ -[HDSimpleGraphRelationship objectID](self, "objectID");
}

- (BOOL)isEqual:(id)a3
{
  HDSimpleGraphRelationship *v4;
  HDSimpleGraphRelationship *v5;
  BOOL v6;

  v4 = (HDSimpleGraphRelationship *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_type == v5->_type && self->_subjectID == v5->_subjectID && self->_objectID == v5->_objectID;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)subjectID
{
  return self->_subjectID;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)objectID
{
  return self->_objectID;
}

@end
