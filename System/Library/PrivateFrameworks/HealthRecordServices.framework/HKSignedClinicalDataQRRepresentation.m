@implementation HKSignedClinicalDataQRRepresentation

- (HKSignedClinicalDataQRRepresentation)init
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

- (HKSignedClinicalDataQRRepresentation)initWithSourceType:(int64_t)a3
{
  HKSignedClinicalDataQRRepresentation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSignedClinicalDataQRRepresentation;
  result = -[HKSignedClinicalDataQRRepresentation init](&v5, sel_init);
  if (result)
    result->_sourceType = a3;
  return result;
}

+ (HKSignedClinicalDataQRRepresentation)representationWithQRSegment:(id)a3
{
  id v5;
  void *v6;
  int v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSignedClinicalDataQRRepresentation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("segment"));

  }
  objc_msgSend(v5, "dataValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("HC1:"));

  v8 = objc_alloc((Class)a1);
  if (v7)
  {
    v9 = (_QWORD *)objc_msgSend(v8, "initWithSourceType:", 2);
    v17[0] = v5;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = (id *)v17;
  }
  else
  {
    v9 = (_QWORD *)objc_msgSend(v8, "initWithSourceType:", 1);
    v16 = v5;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v16;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v9[2];
  v9[2] = v12;

  return (HKSignedClinicalDataQRRepresentation *)v9;
}

+ (HKSignedClinicalDataQRRepresentation)representationWithSMARTHealthCardQRSegmentData:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  HKSignedClinicalDataQRSegment *v7;
  void *v8;
  HKSignedClinicalDataQRSegment *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      v7 = [HKSignedClinicalDataQRSegment alloc];
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HKSignedClinicalDataQRSegment initWithDataValue:position:numberOfExpectedSiblings:](v7, "initWithDataValue:position:numberOfExpectedSiblings:", v8, ++v6, objc_msgSend(v4, "count"));

      objc_msgSend(v5, "addObject:", v9);
    }
    while (v6 < objc_msgSend(v4, "count"));
  }
  v10 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithSourceType:", 1);
  v11 = objc_msgSend(v5, "copy");
  v12 = (void *)v10[2];
  v10[2] = v11;

  return (HKSignedClinicalDataQRRepresentation *)v10;
}

- (id)representationByAddingQRSegment:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  HKSignedClinicalDataQRRepresentation *v12;
  NSArray *alreadyScannedSegments;
  uint64_t v14;
  NSArray *v15;
  void *v17;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSignedClinicalDataQRRepresentation.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("segment"));

  }
  -[NSArray firstObject](self->_alreadyScannedSegments, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_7;
  v10 = objc_msgSend(v8, "numberOfExpectedSiblings");
  if (v10 != objc_msgSend(v7, "numberOfExpectedSiblings"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("attempting to add a segment with a different number of expected siblings, aborting"));
    v12 = 0;
    goto LABEL_12;
  }
  v11 = objc_msgSend(v9, "position");
  if (v11 == objc_msgSend(v7, "position"))
  {
    v12 = self;
  }
  else
  {
LABEL_7:
    v12 = (HKSignedClinicalDataQRRepresentation *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSourceType:", self->_sourceType);
    if (self->_alreadyScannedSegments)
      alreadyScannedSegments = self->_alreadyScannedSegments;
    else
      alreadyScannedSegments = (NSArray *)MEMORY[0x24BDBD1A8];
    -[NSArray arrayByAddingObject:](alreadyScannedSegments, "arrayByAddingObject:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v12->_alreadyScannedSegments;
    v12->_alreadyScannedSegments = (NSArray *)v14;

  }
LABEL_12:

  return v12;
}

- (NSNumber)expectedNumberOfSegments
{
  void *v2;
  void *v3;
  void *v4;

  -[NSArray firstObject](self->_alreadyScannedSegments, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v2, "numberOfExpectedSiblings"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (BOOL)hasAllExpectedSegments
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;

  -[HKSignedClinicalDataQRRepresentation expectedNumberOfSegments](self, "expectedNumberOfSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (int)objc_msgSend(v3, "intValue") >= 1)
  {
    v5 = objc_msgSend(v4, "intValue");
    v6 = -[NSArray count](self->_alreadyScannedSegments, "count") == v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)orderedSegmentsWithError:(id *)a3
{
  void *v5;

  if (-[HKSignedClinicalDataQRRepresentation hasAllExpectedSegments](self, "hasAllExpectedSegments"))
  {
    -[NSArray sortedArrayUsingComparator:](self->_alreadyScannedSegments, "sortedArrayUsingComparator:", &__block_literal_global_4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 118, CFSTR("not all segments have been scanned yet"));
    v5 = 0;
  }
  return v5;
}

uint64_t __65__HKSignedClinicalDataQRRepresentation_orderedSegmentsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "position");
  if (v6 >= objc_msgSend(v5, "position"))
  {
    v8 = objc_msgSend(v4, "position");
    v7 = v8 > objc_msgSend(v5, "position");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKSignedClinicalDataQRRepresentation *v4;
  HKSignedClinicalDataQRRepresentation *v5;
  HKSignedClinicalDataQRRepresentation *v6;
  NSArray *alreadyScannedSegments;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  char v12;

  v4 = (HKSignedClinicalDataQRRepresentation *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      alreadyScannedSegments = self->_alreadyScannedSegments;
      -[HKSignedClinicalDataQRRepresentation alreadyScannedSegments](v6, "alreadyScannedSegments");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (alreadyScannedSegments == v8)
      {
        v12 = 1;
      }
      else
      {
        -[HKSignedClinicalDataQRRepresentation alreadyScannedSegments](v6, "alreadyScannedSegments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = self->_alreadyScannedSegments;
          -[HKSignedClinicalDataQRRepresentation alreadyScannedSegments](v6, "alreadyScannedSegments");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSArray isEqualToArray:](v10, "isEqualToArray:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *alreadyScannedSegments;
  id v5;

  alreadyScannedSegments = self->_alreadyScannedSegments;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alreadyScannedSegments, CFSTR("AlreadyScannedSegments"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceType, CFSTR("SourceType"));

}

- (HKSignedClinicalDataQRRepresentation)initWithCoder:(id)a3
{
  id v4;
  HKSignedClinicalDataQRRepresentation *v5;
  HKSignedClinicalDataQRRepresentation *v6;
  void *v7;
  uint64_t v8;
  NSArray *alreadyScannedSegments;
  HKSignedClinicalDataQRRepresentation *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("SourceType")) & 1) != 0)
  {
    v5 = -[HKSignedClinicalDataQRRepresentation initWithSourceType:](self, "initWithSourceType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SourceType")));
    if (!v5)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("AlreadyScannedSegments"));
    v8 = objc_claimAutoreleasedReturnValue();
    alreadyScannedSegments = v6->_alreadyScannedSegments;
    v6->_alreadyScannedSegments = (NSArray *)v8;

    self = v6;
    v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

LABEL_7:
  return v10;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (NSArray)alreadyScannedSegments
{
  return self->_alreadyScannedSegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alreadyScannedSegments, 0);
}

+ (id)representationForRawContent:(id)a3 sourceType:(int64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  if (a4 == 2)
  {
    objc_msgSend(a1, "representationForEUDCCPayloadData:error:", v8, a5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      NSStringForSignedClinicalDataSourceType();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hk_assignError:code:format:", a5, 3, CFSTR("source type \"%@\" (%lld) is not supported for QR representation generation"), v12, a4);

      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "representationForJWSPayloadData:error:", v8, a5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

+ (id)representationForJWSPayloadData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithData:encoding:", v7, 4);

  if (v8)
  {
    objc_msgSend(a1, "representationForJWSPayload:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("failed to convert JWS data to NSString"));
    v9 = 0;
  }

  return v9;
}

+ (id)representationForJWSPayload:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned __int16 v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id *v24;
  void *v25;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if ((unint64_t)objc_msgSend(v5, "length") < 0x4AC)
    v7 = 2390;
  else
    v7 = (int)(2
             * vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v5, "length") / (double)(int)vcvtpd_s64_f64((double)v6 / 1191.0)));
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v25 = v8;
  if (objc_msgSend(v5, "length"))
  {
    v24 = a4;
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", v10);
      v13 = v12;
      if (v12)
        break;
LABEL_13:
      v10 += v13;
      if (v10 >= objc_msgSend(v5, "length"))
        goto LABEL_14;
    }
    v14 = v11;
    v15 = v12;
    while (1)
    {
      v16 = objc_msgSend(v5, "characterAtIndex:", v14);
      if (v16 <= 0x2C)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", v24, 3, CFSTR("JWS character at index %d cannot be represented an a SMART Health Card QR code because its ASCII value of %0d is below the offset"), v10 + v13 + 0xFFFFFFFF, v16);
        goto LABEL_19;
      }
      v17 = v16 - 45;
      if (v16 - 45 >= 0x64)
        break;
      if (objc_msgSend(v9, "length") >= v7)
      {
        v18 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v25, "addObject:", v18);

        v19 = objc_alloc_init(MEMORY[0x24BDD16A8]);
        v9 = v19;
      }
      objc_msgSend(v9, "appendFormat:", CFSTR("%02d"), v17);
      ++v14;
      if (!--v15)
        goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", v24, 3, CFSTR("JWS character at index %d cannot be represented an a SMART Health Card QR code because its ASCII value of %0d is unexpectedly high"), v10 + v13 + 0xFFFFFFFF, v16);
LABEL_19:
    v22 = 0;
    v20 = v25;
  }
  else
  {
LABEL_14:
    v20 = v25;
    if (objc_msgSend(v9, "length"))
    {
      v21 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v25, "addObject:", v21);

    }
    +[HKSignedClinicalDataQRRepresentation representationWithSMARTHealthCardQRSegmentData:](HKSignedClinicalDataQRRepresentation, "representationWithSMARTHealthCardQRSegmentData:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

+ (id)representationForEUDCCPayloadData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  objc_msgSend(a3, "hk_zlibCompressedIncludingHeaderAndTrailer:errorOut:", 1, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (!v6)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v7, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_assignError:code:format:", a4, 3, CFSTR("%@: error zlib compressing data: %@"), a1, v9);
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "hk_base45Encoded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("%@: error base45 encoding data"), a1, v15);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("HC1:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v9);
  v17[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSignedClinicalDataQRRepresentation representationWithSMARTHealthCardQRSegmentData:](HKSignedClinicalDataQRRepresentation, "representationWithSMARTHealthCardQRSegmentData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v12;
}

@end
