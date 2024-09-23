@implementation VNRecognizedHandPointsSpecifier

- (VNRecognizedHandPointsSpecifier)initWithVCPHandObservation:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  int v21;
  __CFString *v22;
  __CFString *v23;
  VNRecognizedPoint *v24;
  double v25;
  _UNKNOWN **v26;
  VNRecognizedPoint *v27;
  id v28;
  double v29;
  VNRecognizedHandPointsSpecifier *v30;
  uint64_t v31;
  NSArray *orderedHandKeypoints;
  int v33;
  uint64_t v34;
  VNRecognizedHandPointsSpecifier *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v36 = self;
  v5 = a3;
  v6 = a4;
  v38 = v5;
  objc_msgSend(v5, "keypoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8);
  v37 = v6;
  v10 = objc_msgSend(v6, "requestRevision");
  if (v8)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = &off_1E4529000;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v13, v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "location");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v15, "confidence");
      v21 = v20;
      if (v11 == 1
        && v13 <= 0x14
        && (v22 = **(__CFString ***)((char *)off_1E4547910 + (v12 >> 29))) != 0)
      {
        v23 = v22;
        v24 = [VNRecognizedPoint alloc];
        LODWORD(v25) = v21;
        v26 = v14;
        v27 = -[VNRecognizedPoint initWithLocation:confidence:identifier:](v24, "initWithLocation:confidence:identifier:", v23, v17, v19, v25);
        objc_msgSend(v9, "addObject:", v27);
        objc_msgSend(v39, "setObject:forKey:", v27, v23);

        v14 = v26;
      }
      else
      {
        v28 = objc_alloc((Class)v14[390]);
        LODWORD(v29) = v21;
        v23 = (__CFString *)objc_msgSend(v28, "initWithLocation:confidence:", v17, v19, v29);
        objc_msgSend(v9, "addObject:", v23);
      }

      ++v13;
      v12 += 0x100000000;
    }
    while (v8 != v13);
  }
  v40.receiver = v36;
  v40.super_class = (Class)VNRecognizedHandPointsSpecifier;
  v30 = -[VNRecognizedPointsSpecifier initWithOriginatingRequestSpecifier:allRecognizedPoints:](&v40, sel_initWithOriginatingRequestSpecifier_allRecognizedPoints_, v37, v39, v36);
  if (v30)
  {
    v31 = objc_msgSend(v9, "copy");
    orderedHandKeypoints = v30->_orderedHandKeypoints;
    v30->_orderedHandKeypoints = (NSArray *)v31;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v33 = objc_msgSend(v38, "chirality");
      if (v33 == -1)
      {
        v34 = -1;
        goto LABEL_15;
      }
      if (v33 == 1)
      {
        v34 = 1;
LABEL_15:
        v30->_chirality = v34;
      }
    }
  }

  return v30;
}

- (int64_t)chirality
{
  return self->_chirality;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedHandPointsSpecifier;
  return -[NSArray hash](self->_orderedHandKeypoints, "hash") ^ __ROR8__(-[VNRecognizedPointsSpecifier hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNRecognizedHandPointsSpecifier *v4;
  BOOL v5;
  objc_super v7;

  v4 = (VNRecognizedHandPointsSpecifier *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNRecognizedHandPointsSpecifier;
    v5 = -[VNRecognizedPointsSpecifier isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NSArray isEqualToArray:](self->_orderedHandKeypoints, "isEqualToArray:", v4->_orderedHandKeypoints);
  }

  return v5;
}

- (id)availableGroupKeys
{
  if (availableGroupKeys_onceToken_26555 != -1)
    dispatch_once(&availableGroupKeys_onceToken_26555, &__block_literal_global_26556);
  return (id)availableGroupKeys_groupKeys_26557;
}

- (id)pointKeyGroupLabelsMapping
{
  if (pointKeyGroupLabelsMapping_onceToken_26552 != -1)
    dispatch_once(&pointKeyGroupLabelsMapping_onceToken_26552, &__block_literal_global_29_26553);
  return (id)pointKeyGroupLabelsMapping_groupKeys;
}

- (id)populatedMLMultiArrayAndReturnError:(id *)a3
{
  void *v5;
  NSUInteger v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  void *v26;
  void *v28;
  id v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  -[VNRecognizedPointsSpecifier originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "specifiesRequestClass:", objc_opt_class())
    || objc_msgSend(v5, "requestRevision") != 1)
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v5);
      v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    v26 = 0;
    goto LABEL_11;
  }
  v6 = -[NSArray count](self->_orderedHandKeypoints, "count");
  v7 = objc_alloc(MEMORY[0x1E0C9E970]);
  v30[0] = &unk_1E459CE50;
  v30[1] = &unk_1E459CE68;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithShape:dataType:error:", v9, 65600, a3);

  if (!v10)
    goto LABEL_10;
  v11 = objc_retainAutorelease(v10);
  v12 = (_QWORD *)objc_msgSend(v11, "dataPointer");
  v29 = v11;
  objc_msgSend(v11, "strides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  v28 = v13;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  if (v6)
  {
    v18 = 0;
    v19 = v17;
    v20 = 2 * v17;
    v21 = 8 * v15;
    do
    {
      -[NSArray objectAtIndex:](self->_orderedHandKeypoints, "objectAtIndex:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "location");
      *v12 = v23;
      v12[v19] = v24;
      objc_msgSend(v22, "confidence");
      *(double *)&v12[v20] = v25;

      ++v18;
      v12 = (_QWORD *)((char *)v12 + v21);
    }
    while (v6 != v18);
  }

  v26 = v29;
LABEL_11:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedHandPointsSpecifier;
  v4 = a3;
  -[VNRecognizedPointsSpecifier encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_orderedHandKeypoints, CFSTR("OrderedKeypoints"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_chirality, CFSTR("Chirality"));

}

- (VNRecognizedHandPointsSpecifier)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedHandPointsSpecifier *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *orderedHandKeypoints;
  uint64_t v12;
  VNRecognizedHandPointsSpecifier *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNRecognizedHandPointsSpecifier;
  v5 = -[VNRecognizedPointsSpecifier initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_7;
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("OrderedKeypoints"));
  v10 = objc_claimAutoreleasedReturnValue();
  orderedHandKeypoints = v5->_orderedHandKeypoints;
  v5->_orderedHandKeypoints = (NSArray *)v10;

  if (!v5->_orderedHandKeypoints)
  {
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("ordered keypoints are not available"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v14);
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Chirality")))
  {
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Chirality"));
    if ((unint64_t)(v12 + 1) <= 2)
    {
      v5->_chirality = v12;
      goto LABEL_6;
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ has an invalid value of %@"), CFSTR("Chirality"), v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:](VNError, "errorForOutOfBoundsErrorWithLocalizedDescription:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v18);

LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
LABEL_6:

LABEL_7:
  v13 = v5;
LABEL_10:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedHandKeypoints, 0);
}

void __61__VNRecognizedHandPointsSpecifier_pointKeyGroupLabelsMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("VNHLRKT");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("VNHLKTCMC"), CFSTR("VNHLKTMP"), CFSTR("VNHLKTIP"), CFSTR("VNHLKTTIP"), 0);
  v8[0] = v0;
  v7[1] = CFSTR("VNHLRKM");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("VNHLKMMCP"), CFSTR("VNHLKMPIP"), CFSTR("VNHLKMDIP"), CFSTR("VNHLKMTIP"), 0);
  v8[1] = v1;
  v7[2] = CFSTR("VNHLRKI");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("VNHLKIMCP"), CFSTR("VNHLKIPIP"), CFSTR("VNHLKIDIP"), CFSTR("VNHLKITIP"), 0);
  v8[2] = v2;
  v7[3] = CFSTR("VNHLRKR");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("VNHLKRMCP"), CFSTR("VNHLKRPIP"), CFSTR("VNHLKRDIP"), CFSTR("VNHLKRTIP"), 0);
  v8[3] = v3;
  v7[4] = CFSTR("VNHLRKP");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("VNHLKPMCP"), CFSTR("VNHLKPPIP"), CFSTR("VNHLKPDIP"), CFSTR("VNHLKPTIP"), 0);
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)pointKeyGroupLabelsMapping_groupKeys;
  pointKeyGroupLabelsMapping_groupKeys = v5;

}

void __53__VNRecognizedHandPointsSpecifier_availableGroupKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNHLRKT");
  v2[1] = CFSTR("VNHLRKM");
  v2[2] = CFSTR("VNHLRKI");
  v2[3] = CFSTR("VNHLRKR");
  v2[4] = CFSTR("VNHLRKP");
  v2[5] = CFSTR("VNIPOAll");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)availableGroupKeys_groupKeys_26557;
  availableGroupKeys_groupKeys_26557 = v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
