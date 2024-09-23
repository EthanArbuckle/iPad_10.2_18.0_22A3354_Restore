@implementation HKRelationshipConceptSelection

- (HKRelationshipConceptSelection)init
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

- (HKRelationshipConceptSelection)initWithDirection:(unint64_t)a3 type:(int64_t)a4 selection:(id)a5
{
  id v9;
  HKRelationshipConceptSelection *v10;
  HKRelationshipConceptSelection *v11;
  uint64_t v12;
  HKConceptSelection *selection;
  void *v15;
  objc_super v16;

  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRelationshipConceptSelection.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selection"));

  }
  v16.receiver = self;
  v16.super_class = (Class)HKRelationshipConceptSelection;
  v10 = -[HKConceptSelection init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_direction = a3;
    v10->_type = a4;
    v12 = objc_msgSend(v9, "copy");
    selection = v11->_selection;
    v11->_selection = (HKConceptSelection *)v12;

  }
  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_direction == 1)
    v5 = CFSTR("objects");
  else
    v5 = CFSTR("subjects");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %lld with %@ matching %@>"), v4, self->_type, v5, self->_selection);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKRelationshipConceptSelection)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  HKRelationshipConceptSelection *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DirectionKey"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SelectionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[HKRelationshipConceptSelection initWithDirection:type:selection:](self, "initWithDirection:type:selection:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t direction;
  id v5;

  direction = self->_direction;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", direction, CFSTR("DirectionKey"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("TypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selection, CFSTR("SelectionKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKRelationshipConceptSelection;
  if (-[HKConceptSelection isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[HKRelationshipConceptSelection direction](self, "direction");
    if (v6 != objc_msgSend(v5, "direction"))
      goto LABEL_12;
    v7 = -[HKRelationshipConceptSelection type](self, "type");
    if (v7 != objc_msgSend(v5, "type"))
      goto LABEL_12;
    -[HKRelationshipConceptSelection selection](self, "selection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      objc_msgSend(v5, "selection");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {

LABEL_12:
        v16 = 0;
        goto LABEL_13;
      }
      v12 = (void *)v11;
      -[HKRelationshipConceptSelection selection](self, "selection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "selection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) == 0)
        goto LABEL_12;
    }
    v16 = 1;
LABEL_13:

    goto LABEL_14;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (int64_t)type
{
  return self->_type;
}

- (HKConceptSelection)selection
{
  return self->_selection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selection, 0);
}

@end
