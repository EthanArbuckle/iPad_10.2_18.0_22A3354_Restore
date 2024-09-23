@implementation MPAVBatteryLevel

- (MPAVBatteryLevel)initWithOutputDevice:(void *)a3
{
  MPAVBatteryLevel *v4;
  void *v5;
  uint64_t v6;
  NSNumber *leftPercentage;
  uint64_t v8;
  NSNumber *rightPercentage;
  uint64_t v10;
  NSNumber *casePercentage;
  uint64_t v12;
  NSNumber *singlePercentage;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MPAVBatteryLevel;
  v4 = -[MPAVBatteryLevel init](&v15, sel_init);
  if (v4)
  {
    v5 = (void *)MRAVOutputDeviceCopyModelSpecificInformation();
    MPAVGetBatteryLevelFromAVODDS((uint64_t)a3, v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    leftPercentage = v4->_leftPercentage;
    v4->_leftPercentage = (NSNumber *)v6;

    MPAVGetBatteryLevelFromAVODDS((uint64_t)a3, v5, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    rightPercentage = v4->_rightPercentage;
    v4->_rightPercentage = (NSNumber *)v8;

    MPAVGetBatteryLevelFromAVODDS((uint64_t)a3, v5, 2);
    v10 = objc_claimAutoreleasedReturnValue();
    casePercentage = v4->_casePercentage;
    v4->_casePercentage = (NSNumber *)v10;

    MPAVGetBatteryLevelFromAVODDS((uint64_t)a3, v5, 3);
    v12 = objc_claimAutoreleasedReturnValue();
    singlePercentage = v4->_singlePercentage;
    v4->_singlePercentage = (NSNumber *)v12;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casePercentage, 0);
  objc_storeStrong((id *)&self->_singlePercentage, 0);
  objc_storeStrong((id *)&self->_rightPercentage, 0);
  objc_storeStrong((id *)&self->_leftPercentage, 0);
}

- (MPAVBatteryLevel)initWithRouteDescription:(id)a3
{
  id v4;
  MPAVBatteryLevel *v5;
  uint64_t v6;
  NSNumber *leftPercentage;
  uint64_t v8;
  NSNumber *rightPercentage;
  uint64_t v10;
  NSNumber *casePercentage;
  uint64_t v12;
  NSNumber *singlePercentage;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPAVBatteryLevel;
  v5 = -[MPAVBatteryLevel init](&v15, sel_init);
  if (v5)
  {
    MPAVGetBatteryLevelFromRouteDescription(v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    leftPercentage = v5->_leftPercentage;
    v5->_leftPercentage = (NSNumber *)v6;

    MPAVGetBatteryLevelFromRouteDescription(v4, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    rightPercentage = v5->_rightPercentage;
    v5->_rightPercentage = (NSNumber *)v8;

    MPAVGetBatteryLevelFromRouteDescription(v4, 2);
    v10 = objc_claimAutoreleasedReturnValue();
    casePercentage = v5->_casePercentage;
    v5->_casePercentage = (NSNumber *)v10;

    MPAVGetBatteryLevelFromRouteDescription(v4, 3);
    v12 = objc_claimAutoreleasedReturnValue();
    singlePercentage = v5->_singlePercentage;
    v5->_singlePercentage = (NSNumber *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  NSNumber *leftPercentage;
  BOOL v6;
  NSNumber *singlePercentage;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  leftPercentage = self->_leftPercentage;
  v6 = leftPercentage != 0;
  if (leftPercentage)
    objc_msgSend(v3, "appendFormat:", CFSTR(" left=%@"), self->_leftPercentage);
  if (self->_rightPercentage)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" right=%@"), self->_rightPercentage);
    v6 = 1;
  }
  if (self->_casePercentage)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" case=%@"), self->_casePercentage);
    singlePercentage = self->_singlePercentage;
    if (!singlePercentage)
      goto LABEL_10;
    goto LABEL_9;
  }
  singlePercentage = self->_singlePercentage;
  if (singlePercentage)
  {
LABEL_9:
    objc_msgSend(v4, "appendFormat:", CFSTR(" single=%@"), singlePercentage);
    goto LABEL_10;
  }
  if (!v6)
    objc_msgSend(v4, "appendString:", CFSTR(" none"));
LABEL_10:
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  NSNumber *leftPercentage;
  NSNumber *v8;
  NSNumber *v9;
  char v10;
  NSNumber *rightPercentage;
  NSNumber *v12;
  NSNumber *v13;
  void *v14;
  NSNumber *casePercentage;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *singlePercentage;
  uint64_t v19;
  void *v20;
  NSNumber *v21;
  void *v22;
  NSNumber *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSNumber *v30;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    leftPercentage = self->_leftPercentage;
    objc_msgSend(v6, "leftPercentage");
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (leftPercentage != v8)
    {
      v9 = self->_leftPercentage;
      objc_msgSend(v6, "leftPercentage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSNumber isEqual:](v9, "isEqual:", v3))
      {
        v10 = 0;
        goto LABEL_23;
      }
    }
    rightPercentage = self->_rightPercentage;
    objc_msgSend(v6, "rightPercentage");
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (rightPercentage != v12)
    {
      v13 = self->_rightPercentage;
      objc_msgSend(v6, "rightPercentage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSNumber isEqual:](v13, "isEqual:", v14))
      {
        v10 = 0;
LABEL_21:

LABEL_22:
        if (leftPercentage == v8)
        {
LABEL_24:

          goto LABEL_25;
        }
LABEL_23:

        goto LABEL_24;
      }
      v29 = v14;
    }
    casePercentage = self->_casePercentage;
    objc_msgSend(v6, "casePercentage");
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v30 = rightPercentage;
    if (casePercentage == v16)
    {
      v26 = v3;
    }
    else
    {
      v17 = self->_casePercentage;
      objc_msgSend(v6, "casePercentage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSNumber isEqual:](v17, "isEqual:"))
      {
        v10 = 0;
        v14 = v29;
        v23 = v30;
        goto LABEL_19;
      }
      v26 = v3;
    }
    singlePercentage = self->_singlePercentage;
    objc_msgSend(v6, "singlePercentage", v26);
    v19 = objc_claimAutoreleasedReturnValue();
    if (singlePercentage == (NSNumber *)v19)
    {

      v10 = 1;
    }
    else
    {
      v20 = (void *)v19;
      v21 = self->_singlePercentage;
      objc_msgSend(v6, "singlePercentage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSNumber isEqual:](v21, "isEqual:", v22);

    }
    v24 = casePercentage == v16;
    v3 = v27;
    v14 = v29;
    v23 = v30;
    if (v24)
    {
LABEL_20:

      if (v23 == v12)
        goto LABEL_22;
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  v10 = 0;
LABEL_25:

  return v10;
}

- (NSNumber)leftPercentage
{
  return self->_leftPercentage;
}

- (NSNumber)rightPercentage
{
  return self->_rightPercentage;
}

- (NSNumber)singlePercentage
{
  return self->_singlePercentage;
}

- (NSNumber)casePercentage
{
  return self->_casePercentage;
}

@end
