@implementation HKSignedClinicalDataQRSegment

- (HKSignedClinicalDataQRSegment)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSignedClinicalDataQRSegment)initWithDataValue:(id)a3 position:(int64_t)a4 numberOfExpectedSiblings:(int64_t)a5
{
  id v8;
  HKSignedClinicalDataQRSegment *v9;
  uint64_t v10;
  NSString *dataValue;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSignedClinicalDataQRSegment;
  v9 = -[HKSignedClinicalDataQRSegment init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    dataValue = v9->_dataValue;
    v9->_dataValue = (NSString *)v10;

    v9->_position = a4;
    v9->_numberOfExpectedSiblings = a5;
  }

  return v9;
}

+ (id)segmentFromQRCodeValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;

  v6 = a3;
  if (!objc_msgSend(v6, "hasPrefix:", CFSTR("HC1:")))
  {
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("shc:/")) & 1) == 0)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "substringToIndex:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hk_assignError:code:format:", a4, 3, CFSTR("unsupported code value \"%@\"), v16);

      v7 = 0;
      goto LABEL_19;
    }
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 2)
    {
      v9 = objc_alloc((Class)a1);
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = v10;
      v13 = 1;
      v14 = 1;
LABEL_6:
      v7 = (void *)objc_msgSend(v11, "initWithDataValue:position:numberOfExpectedSiblings:", v12, v13, v14);

LABEL_18:
      goto LABEL_19;
    }
    if (objc_msgSend(v8, "count") == 4)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      if (v18 <= 0)
      {
        v24 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "hk_assignError:code:format:", a4, 3, CFSTR("invalid chunk position \"%@\"), v22);
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");

        if (v20 <= 0)
        {
          v25 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "hk_assignError:code:format:", a4, 3, CFSTR("invalid number of chunks \"%@\"), v22);
        }
        else
        {
          if (v18 <= (unint64_t)v20)
          {
            v27 = objc_alloc((Class)a1);
            objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v27;
            v12 = v10;
            v13 = v18;
            v14 = v20;
            goto LABEL_6;
          }
          v21 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "hk_assignError:code:format:", a4, 3, CFSTR("invalid number of chunks \"%@\" for total \"%@\"), v22, v23);

        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("invalid QR code segment with %ld segments"), objc_msgSend(v8, "count"));
    }
    v7 = 0;
    goto LABEL_18;
  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataValue:position:numberOfExpectedSiblings:", v6, 1, 1);
LABEL_19:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKSignedClinicalDataQRSegment *v4;
  HKSignedClinicalDataQRSegment *v5;
  HKSignedClinicalDataQRSegment *v6;
  NSString *dataValue;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  BOOL v14;
  int64_t position;
  int64_t numberOfExpectedSiblings;

  v4 = (HKSignedClinicalDataQRSegment *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      dataValue = self->_dataValue;
      -[HKSignedClinicalDataQRSegment dataValue](v6, "dataValue");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (dataValue == v8)
      {
        position = self->_position;
        if (position == -[HKSignedClinicalDataQRSegment position](v6, "position"))
        {
          numberOfExpectedSiblings = self->_numberOfExpectedSiblings;
          v14 = numberOfExpectedSiblings == -[HKSignedClinicalDataQRSegment numberOfExpectedSiblings](v6, "numberOfExpectedSiblings");
        }
        else
        {
          v14 = 0;
        }
      }
      else
      {
        -[HKSignedClinicalDataQRSegment dataValue](v6, "dataValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = self->_dataValue;
          -[HKSignedClinicalDataQRSegment dataValue](v6, "dataValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](v10, "isEqualToString:", v11)
            && (v12 = self->_position, v12 == -[HKSignedClinicalDataQRSegment position](v6, "position")))
          {
            v13 = self->_numberOfExpectedSiblings;
            v14 = v13 == -[HKSignedClinicalDataQRSegment numberOfExpectedSiblings](v6, "numberOfExpectedSiblings");
          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (NSString)fullQRCodeValue
{
  NSString *v3;
  uint64_t v5;
  uint64_t v6;

  if (-[NSString hasPrefix:](self->_dataValue, "hasPrefix:", CFSTR("HC1:")))
  {
    v3 = self->_dataValue;
  }
  else
  {
    if (self->_numberOfExpectedSiblings < 2)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("shc:/"), self->_dataValue, v5, v6);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%lu/%lu/%@"), CFSTR("shc:/"), self->_position, self->_numberOfExpectedSiblings, self->_dataValue);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *dataValue;
  id v5;

  dataValue = self->_dataValue;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dataValue, CFSTR("DataValue"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_position, CFSTR("Position"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfExpectedSiblings, CFSTR("NumberOfExpectedSiblings"));

}

- (HKSignedClinicalDataQRSegment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKSignedClinicalDataQRSegment *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("Position"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("NumberOfExpectedSiblings")) & 1) != 0)
  {
    v6 = (HKSignedClinicalDataQRSegment *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDataValue:position:numberOfExpectedSiblings:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Position")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfExpectedSiblings")));
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v6 = 0;
  }

  return v6;
}

- (NSString)dataValue
{
  return self->_dataValue;
}

- (int64_t)position
{
  return self->_position;
}

- (int64_t)numberOfExpectedSiblings
{
  return self->_numberOfExpectedSiblings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end
