@implementation MOWebContentFilterPolicySettingMetadata

- (MOWebContentFilterPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 maximumAutoAllowCount:(unint64_t)a5 maximumNeverAllowCount:(unint64_t)a6 maximumOnlyAllowCount:(unint64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10
{
  MOWebContentFilterPolicySettingMetadata *result;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MOWebContentFilterPolicySettingMetadata;
  result = -[MOSettingMetadata initWithSettingName:defaultValue:isPublic:scope:isPrivacySensitive:](&v14, sel_initWithSettingName_defaultValue_isPublic_scope_isPrivacySensitive_, a3, a4, a8, a9, a10);
  result->_maximumNeverAllowCount = a6;
  result->_maximumAutoAllowCount = a5;
  result->_maximumOnlyAllowCount = a7;
  return result;
}

- (MOWebContentFilterPolicy)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOWebContentFilterPolicySettingMetadata;
  -[MOSettingMetadata defaultValue](&v3, sel_defaultValue);
  return (MOWebContentFilterPolicy *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)persistableValueFromValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "persistableValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)valueFromPersistableValue:(id)a3
{
  return +[MOWebContentFilterPolicy initializeWithPersistableValue:](MOWebContentFilterPolicy, "initializeWithPersistableValue:", a3);
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  unint64_t v11;
  unint64_t maximumOnlyAllowCount;

  v4 = a3;
  if (!+[MOWebContentFilterPolicy isValidPersistableRepresentation:](MOWebContentFilterPolicy, "isValidPersistableRepresentation:", v4))
  {
    v8 = 0;
    goto LABEL_9;
  }
  +[MOWebContentFilterPolicy initializeWithPersistableValue:](MOWebContentFilterPolicy, "initializeWithPersistableValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autoAllow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") > self->_maximumAutoAllowCount)
    goto LABEL_5;
  objc_msgSend(v5, "neverAllow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") > self->_maximumNeverAllowCount)
  {

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v5, "onlyAllow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  maximumOnlyAllowCount = self->_maximumOnlyAllowCount;

  if (v11 <= maximumOnlyAllowCount)
  {
    v8 = v4;
    goto LABEL_7;
  }
LABEL_6:
  v8 = 0;
LABEL_7:

LABEL_9:
  return v8;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[MOWebContentFilterPolicySettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOWebContentFilterPolicySettingMetadata sanitizePersistableValue:](self, "sanitizePersistableValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!v8)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v13 = v8;
    goto LABEL_7;
  }
  if (!v8)
  {
    v13 = v7;
LABEL_7:
    v12 = v13;
    goto LABEL_9;
  }
  +[MOWebContentFilterPolicy initializeWithPersistableValue:](MOWebContentFilterPolicy, "initializeWithPersistableValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOWebContentFilterPolicy initializeWithPersistableValue:](MOWebContentFilterPolicy, "initializeWithPersistableValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOWebContentFilterPolicySettingMetadata _combine:with:](self, "_combine:with:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistableValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  MOWebContentFilterPolicy *v7;
  void *v8;
  void *v9;
  void *v10;
  MOWebContentFilterPolicy *v11;
  void *v12;
  void *v13;
  MOWebContentFilterPolicy *v14;
  void *v15;
  MOWebContentFilterPolicy *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MOWebContentFilterPolicy *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  MOWebContentFilterPolicy *v41;
  void *v42;
  void *v43;
  void *v44;
  MOWebContentFilterPolicy *v45;

  v5 = a3;
  v6 = a4;
  switch(objc_msgSend(v5, "policy"))
  {
    case 0:
      v7 = (MOWebContentFilterPolicy *)v6;
      goto LABEL_11;
    case 1:
      switch(objc_msgSend(v6, "policy"))
      {
        case 0:
          goto LABEL_10;
        case 1:
          objc_msgSend(v5, "neverAllow");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "neverAllow");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = -[MOWebContentFilterPolicy initWithAutoAllow:neverAllow:onlyAllow:]([MOWebContentFilterPolicy alloc], "initWithAutoAllow:neverAllow:onlyAllow:", 0, v10, 0);
          goto LABEL_22;
        case 2:
          v27 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v6, "autoAllow");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setWithSet:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "neverAllow");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "neverAllow");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setByAddingObjectsFromSet:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "minusSet:", v32);
          v33 = [MOWebContentFilterPolicy alloc];
          v34 = (void *)objc_msgSend(v29, "copy");
          v11 = -[MOWebContentFilterPolicy initWithAutoAllow:neverAllow:onlyAllow:](v33, "initWithAutoAllow:neverAllow:onlyAllow:", v34, v32, 0);

          goto LABEL_18;
        case 3:
          goto LABEL_13;
        default:
          goto LABEL_12;
      }
    case 2:
      switch(objc_msgSend(v6, "policy"))
      {
        case 0:
          goto LABEL_10;
        case 1:
          objc_msgSend(v5, "neverAllow");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "neverAllow");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setByAddingObjectsFromSet:", v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = [MOWebContentFilterPolicy alloc];
          objc_msgSend(v5, "autoAllow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v14;
          v17 = v15;
          v18 = v10;
          v19 = 0;
          goto LABEL_21;
        case 2:
          v35 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v5, "autoAllow");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setWithSet:", v36);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "neverAllow");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "neverAllow");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setByAddingObjectsFromSet:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "autoAllow");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "intersectSet:", v40);

          objc_msgSend(v29, "minusSet:", v39);
          v41 = [MOWebContentFilterPolicy alloc];
          v42 = (void *)objc_msgSend(v29, "copy");
          v11 = -[MOWebContentFilterPolicy initWithAutoAllow:neverAllow:onlyAllow:](v41, "initWithAutoAllow:neverAllow:onlyAllow:", v42, v39, 0);

LABEL_18:
          break;
        case 3:
LABEL_13:
          v21 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v6, "onlyAllow");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setWithSet:", v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v5;
          goto LABEL_15;
        default:
          goto LABEL_12;
      }
      goto LABEL_23;
    case 3:
      v20 = objc_msgSend(v6, "policy");
      if ((unint64_t)(v20 - 1) < 2)
      {
        v24 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(v5, "onlyAllow");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setWithSet:", v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v6;
LABEL_15:
        objc_msgSend(v23, "neverAllow");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "minusSet:", v26);
LABEL_20:

        v45 = [MOWebContentFilterPolicy alloc];
        v15 = (void *)objc_msgSend(v10, "copy");
        v16 = v45;
        v17 = 0;
        v18 = 0;
        v19 = v15;
LABEL_21:
        v11 = -[MOWebContentFilterPolicy initWithAutoAllow:neverAllow:onlyAllow:](v16, "initWithAutoAllow:neverAllow:onlyAllow:", v17, v18, v19);

LABEL_22:
        goto LABEL_23;
      }
      if (v20 == 3)
      {
        v43 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(v5, "onlyAllow");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setWithSet:", v44);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "onlyAllow");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "intersectSet:", v26);
        goto LABEL_20;
      }
      if (v20)
      {
LABEL_12:
        v11 = 0;
      }
      else
      {
LABEL_10:
        v7 = (MOWebContentFilterPolicy *)v5;
LABEL_11:
        v11 = v7;
      }
LABEL_23:

      return v11;
    default:
      goto LABEL_12;
  }
}

- (unint64_t)maximumAutoAllowCount
{
  return self->_maximumAutoAllowCount;
}

- (unint64_t)maximumNeverAllowCount
{
  return self->_maximumNeverAllowCount;
}

- (unint64_t)maximumOnlyAllowCount
{
  return self->_maximumOnlyAllowCount;
}

@end
