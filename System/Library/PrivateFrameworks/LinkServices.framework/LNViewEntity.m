@implementation LNViewEntity

- (LNViewEntity)initWithValue:(id)a3 interactionID:(id)a4 location:(LNViewLocation *)a5 structuredDataRepresentations:(int64_t)a6 displayRepresentation:(id)a7 state:(int64_t)a8
{
  id v16;
  NSNumber *v17;
  id v18;
  LNViewEntity *v19;
  LNViewEntity *v20;
  __int128 v21;
  __int128 v22;
  LNViewEntity *v23;
  void *v25;
  void *v26;
  objc_super v27;

  v16 = a3;
  v17 = (NSNumber *)a4;
  v18 = a7;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNViewEntity.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNViewEntity.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionId"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)LNViewEntity;
  v19 = -[LNViewEntity init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_value, a3);
    v20->_interactionId = v17;
    v21 = *(_OWORD *)&a5->x;
    v22 = *(_OWORD *)&a5->height;
    *(_OWORD *)&v20->_location.z = *(_OWORD *)&a5->z;
    *(_OWORD *)&v20->_location.height = v22;
    *(_OWORD *)&v20->_location.x = v21;
    v20->_structuredDataRepresentations = a6;
    objc_storeStrong((id *)&v20->_displayRepresentation, a7);
    v20->_state = a8;
    v23 = v20;
  }

  return v20;
}

- (LNViewEntity)initWithIdentifier:(id)a3 interactionId:(id)a4 location:(LNViewLocation *)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)&a5->z;
  v7[0] = *(_OWORD *)&a5->x;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->height;
  return -[LNViewEntity initWithIdentifier:interactionId:location:structuredDataRepresentations:](self, "initWithIdentifier:interactionId:location:structuredDataRepresentations:", a3, a4, v7, 0);
}

- (LNViewEntity)initWithIdentifier:(id)a3 interactionId:(id)a4 location:(LNViewLocation *)a5 structuredDataRepresentations:(int64_t)a6
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  LNViewEntity *v19;
  _OWORD v21[3];

  v10 = (objc_class *)MEMORY[0x1E0D43DF0];
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithKey:table:bundleURL:", &stru_1E45DFA60, 0, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C58]), "initWithTitle:subtitle:image:", v13, 0, 0);
  v15 = objc_alloc(MEMORY[0x1E0D43E30]);
  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_msgSend(v15, "initWithValue:valueType:", v12, v16);

  v18 = *(_OWORD *)&a5->z;
  v21[0] = *(_OWORD *)&a5->x;
  v21[1] = v18;
  v21[2] = *(_OWORD *)&a5->height;
  v19 = -[LNViewEntity initWithValue:interactionID:location:structuredDataRepresentations:displayRepresentation:state:](self, "initWithValue:interactionID:location:structuredDataRepresentations:displayRepresentation:state:", v17, v11, v21, a6, v14, 0);

  return v19;
}

- (LNEntityIdentifier)identifier
{
  void *v3;
  char isKindOfClass;
  LNValue *value;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[LNValue valueType](self->_value, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  value = self->_value;
  if ((isKindOfClass & 1) != 0)
  {
    -[LNValue value](value, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LNValue valueType](value, "valueType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) != 0)
    {
      -[LNValue value](self->_value, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }
  return (LNEntityIdentifier *)v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[LNViewEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LNViewLocationAsString((uint64_t *)&self->_location);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\" @ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (LNViewEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  LNViewEntity *v9;
  __int128 *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  _OWORD v23[3];
  uint64_t v24;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_2;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_8;
  v19 = (void *)v18;
  v20 = objc_alloc(MEMORY[0x1E0D43E30]);
  v21 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v20, "initWithValue:valueType:", v19, v21);

  if (v5)
  {
LABEL_2:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v24 = 0;
      v7 = objc_retainAutorelease(v4);
      v8 = objc_msgSend(v7, "decodeBytesForKey:returnedLength:", CFSTR("location"), &v24);
      v9 = 0;
      if (v8 && v24 == 48)
      {
        v10 = (__int128 *)v8;
        objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("structuredDataRepresentations"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntValue");

        objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayRepresentation"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntValue");

        v16 = *v10;
        v17 = v10[2];
        v23[1] = v10[1];
        v23[2] = v17;
        v23[0] = v16;
        self = -[LNViewEntity initWithValue:interactionID:location:structuredDataRepresentations:displayRepresentation:state:](self, "initWithValue:interactionID:location:structuredDataRepresentations:displayRepresentation:state:", v5, v6, v23, v12, v13, v15);

        v9 = self;
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
LABEL_8:
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[LNViewEntity value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("value"));

  -[LNViewEntity interactionId](self, "interactionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("interactionId"));

  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_location, 48, CFSTR("location"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LNViewEntity structuredDataRepresentations](self, "structuredDataRepresentations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("structuredDataRepresentations"));

  -[LNViewEntity displayRepresentation](self, "displayRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("displayRepresentation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LNViewEntity state](self, "state"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("state"));

}

- (LNValue)value
{
  return self->_value;
}

- (LNViewLocation)location
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].z;
  *(_OWORD *)&retstr->x = *(_OWORD *)&self[1].x;
  *(_OWORD *)&retstr->z = v3;
  *(_OWORD *)&retstr->height = *(_OWORD *)&self[1].height;
  return self;
}

- (NSNumber)interactionId
{
  return self->_interactionId;
}

- (int64_t)structuredDataRepresentations
{
  return self->_structuredDataRepresentations;
}

- (int64_t)state
{
  return self->_state;
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
