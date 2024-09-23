@implementation IRNearbyDeviceDO

- (id)exportAsDictionary
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MMM-dd HH:mm:ss.SSSSSS"));
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[IRNearbyDeviceDO range](self, "range");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("range"));

  -[IRNearbyDeviceDO idsIdentifier](self, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("idsIdentifier"));

  -[IRNearbyDeviceDO mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mediaRemoteIdentifier"));

  -[IRNearbyDeviceDO proximityType](self, "proximityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("proximityType"));

  -[IRNearbyDeviceDO measurementDate](self, "measurementDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("measurementDate"));

  return v3;
}

- (IRNearbyDeviceDO)initWithRange:(double)a3 idsIdentifier:(id)a4 mediaRemoteIdentifier:(id)a5 proximityType:(id)a6 measurementDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IRNearbyDeviceDO *v17;
  IRNearbyDeviceDO *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IRNearbyDeviceDO;
  v17 = -[IRNearbyDeviceDO init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_range = a3;
    objc_storeStrong((id *)&v17->_idsIdentifier, a4);
    objc_storeStrong((id *)&v18->_mediaRemoteIdentifier, a5);
    objc_storeStrong((id *)&v18->_proximityType, a6);
    objc_storeStrong((id *)&v18->_measurementDate, a7);
  }

  return v18;
}

+ (id)miLoNearbyDeviceDOWithRange:(double)a3 idsIdentifier:(id)a4 mediaRemoteIdentifier:(id)a5 proximityType:(id)a6 measurementDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", v15, v14, v13, v12, a3);

  return v16;
}

- (id)copyWithReplacementRange:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", self->_idsIdentifier, self->_mediaRemoteIdentifier, self->_proximityType, self->_measurementDate, a3);
}

- (id)copyWithReplacementIdsIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", v4, self->_mediaRemoteIdentifier, self->_proximityType, self->_measurementDate, self->_range);

  return v5;
}

- (id)copyWithReplacementMediaRemoteIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", self->_idsIdentifier, v4, self->_proximityType, self->_measurementDate, self->_range);

  return v5;
}

- (id)copyWithReplacementProximityType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", self->_idsIdentifier, self->_mediaRemoteIdentifier, v4, self->_measurementDate, self->_range);

  return v5;
}

- (id)copyWithReplacementMeasurementDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", self->_idsIdentifier, self->_mediaRemoteIdentifier, self->_proximityType, v4, self->_range);

  return v5;
}

- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3
{
  id v4;
  void *v5;
  double range;
  double v7;
  int v8;
  void *v9;
  int v10;
  NSString *idsIdentifier;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  NSString *mediaRemoteIdentifier;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  NSString *proximityType;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  NSDate *measurementDate;
  void *v30;
  char v31;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  range = self->_range;
  objc_msgSend(v4, "range");
  if (range != v7)
    goto LABEL_15;
  v8 = self->_idsIdentifier != 0;
  objc_msgSend(v5, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v8 == v10)
    goto LABEL_15;
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
  {
    objc_msgSend(v5, "idsIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSString isEqual:](idsIdentifier, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  v14 = self->_mediaRemoteIdentifier != 0;
  objc_msgSend(v5, "mediaRemoteIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v14 == v16)
    goto LABEL_15;
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier)
  {
    objc_msgSend(v5, "mediaRemoteIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NSString isEqual:](mediaRemoteIdentifier, "isEqual:", v18);

    if (!v19)
      goto LABEL_15;
  }
  v20 = self->_proximityType != 0;
  objc_msgSend(v5, "proximityType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v20 == v22)
    goto LABEL_15;
  proximityType = self->_proximityType;
  if (proximityType)
  {
    objc_msgSend(v5, "proximityType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[NSString isEqual:](proximityType, "isEqual:", v24);

    if (!v25)
      goto LABEL_15;
  }
  v26 = self->_measurementDate != 0;
  objc_msgSend(v5, "measurementDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (v26 == v28)
  {
LABEL_15:
    v31 = 0;
  }
  else
  {
    measurementDate = self->_measurementDate;
    if (measurementDate)
    {
      objc_msgSend(v5, "measurementDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[NSDate isEqual:](measurementDate, "isEqual:", v30);

    }
    else
    {
      v31 = 1;
    }
  }

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  IRNearbyDeviceDO *v4;
  IRNearbyDeviceDO *v5;
  BOOL v6;

  v4 = (IRNearbyDeviceDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRNearbyDeviceDO isEqualToMiLoNearbyDeviceDO:](self, "isEqualToMiLoNearbyDeviceDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t range;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  range = (unint64_t)self->_range;
  v4 = -[NSString hash](self->_idsIdentifier, "hash") - range + 32 * range;
  v5 = -[NSString hash](self->_mediaRemoteIdentifier, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_proximityType, "hash") - v5 + 32 * v5;
  return -[NSDate hash](self->_measurementDate, "hash") - v6 + 32 * v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRNearbyDeviceDO)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IRNearbyDeviceDO *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  void *v25;
  objc_class *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("range"));
  if (v5)
    goto LABEL_2;
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("range")) & 1) == 0)
    {
      v42 = *MEMORY[0x24BDD0FC8];
      v43[0] = CFSTR("Missing serialized value for IRNearbyDeviceDO.range");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNearbyDeviceDOOCNTErrorDomain"), 1, v6);
      objc_msgSend(v4, "failWithError:", v8);
      goto LABEL_15;
    }
LABEL_2:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRNearbyDeviceDO key \"idsIdentifier\" (expected %@, decoded %@)"), v8, v10, 0);
        v40 = *MEMORY[0x24BDD0FC8];
        v41 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNearbyDeviceDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v13);
LABEL_20:

LABEL_21:
        v15 = 0;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v15 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaRemoteIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRNearbyDeviceDO key \"mediaRemoteIdentifier\" (expected %@, decoded %@)"), v10, v11, 0);
        v38 = *MEMORY[0x24BDD0FC8];
        v39 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNearbyDeviceDOOCNTErrorDomain"), 3, v13);
        objc_msgSend(v4, "failWithError:", v19);
LABEL_19:

        goto LABEL_20;
      }
LABEL_16:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proximityType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRNearbyDeviceDO key \"proximityType\" (expected %@, decoded %@)"), v11, v12, 0);
          v36 = *MEMORY[0x24BDD0FC8];
          v37 = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNearbyDeviceDOOCNTErrorDomain"), 3, v19);
          objc_msgSend(v4, "failWithError:", v23);

          goto LABEL_19;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v15 = 0;
          goto LABEL_23;
        }
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("measurementDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRNearbyDeviceDO key \"measurementDate\" (expected %@, decoded %@)"), v33, v28, 0);
          v34 = *MEMORY[0x24BDD0FC8];
          v35 = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNearbyDeviceDOOCNTErrorDomain"), 3, v30);
          objc_msgSend(v4, "failWithError:", v31);

          goto LABEL_21;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
          goto LABEL_21;
      }
      self = -[IRNearbyDeviceDO initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:](self, "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", v6, v8, v10, v11, (double)v5);
      v15 = self;
      goto LABEL_22;
    }
    objc_msgSend(v4, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_16;
LABEL_15:
    v15 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v15 = 0;
LABEL_26:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *idsIdentifier;
  NSString *mediaRemoteIdentifier;
  NSString *proximityType;
  void *v7;
  NSDate *measurementDate;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInt64:forKey:", (uint64_t)self->_range, CFSTR("range"));
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
    objc_msgSend(v9, "encodeObject:forKey:", idsIdentifier, CFSTR("idsIdentifier"));
  mediaRemoteIdentifier = self->_mediaRemoteIdentifier;
  if (mediaRemoteIdentifier)
    objc_msgSend(v9, "encodeObject:forKey:", mediaRemoteIdentifier, CFSTR("mediaRemoteIdentifier"));
  proximityType = self->_proximityType;
  v7 = v9;
  if (proximityType)
  {
    objc_msgSend(v9, "encodeObject:forKey:", proximityType, CFSTR("proximityType"));
    v7 = v9;
  }
  measurementDate = self->_measurementDate;
  if (measurementDate)
  {
    objc_msgSend(v9, "encodeObject:forKey:", measurementDate, CFSTR("measurementDate"));
    v7 = v9;
  }

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_range);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<IRNearbyDeviceDO | range:%@ idsIdentifier:%@ mediaRemoteIdentifier:%@ proximityType:%@ measurementDate:%@>"), v4, self->_idsIdentifier, self->_mediaRemoteIdentifier, self->_proximityType, self->_measurementDate);

  return v5;
}

- (double)range
{
  return self->_range;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)mediaRemoteIdentifier
{
  return self->_mediaRemoteIdentifier;
}

- (NSString)proximityType
{
  return self->_proximityType;
}

- (NSDate)measurementDate
{
  return self->_measurementDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementDate, 0);
  objc_storeStrong((id *)&self->_proximityType, 0);
  objc_storeStrong((id *)&self->_mediaRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end
