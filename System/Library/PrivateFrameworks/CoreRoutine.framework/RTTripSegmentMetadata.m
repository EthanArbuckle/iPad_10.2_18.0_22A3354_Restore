@implementation RTTripSegmentMetadata

- (RTTripSegmentMetadata)initWithRoadClass:(id)a3 formOfWay:(id)a4 locationType:(id)a5 startLocationName:(id)a6 endLocationName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RTTripSegmentMetadata *v17;
  RTTripSegmentMetadata *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RTTripSegmentMetadata;
  v17 = -[RTTripSegmentMetadata init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_roadClass, a3);
    objc_storeStrong((id *)&v18->_formOfWay, a4);
    objc_storeStrong((id *)&v18->_locationType, a5);
    objc_storeStrong((id *)&v18->_startLocationName, a6);
    objc_storeStrong((id *)&v18->_endLocationName, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *roadClass;
  id v5;

  roadClass = self->_roadClass;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", roadClass, CFSTR("roadClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formOfWay, CFSTR("formOfWay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationType, CFSTR("locationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startLocationName, CFSTR("startLocationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endLocationName, CFSTR("endLocationName"));

}

- (RTTripSegmentMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RTTripSegmentMetadata *v19;

  v4 = a3;
  objc_opt_class();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("roadClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("formOfWay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("locationType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startLocationName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endLocationName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[RTTripSegmentMetadata initWithRoadClass:formOfWay:locationType:startLocationName:endLocationName:](self, "initWithRoadClass:formOfWay:locationType:startLocationName:endLocationName:", v8, v12, v16, v17, v18);
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSArray *roadClass;
  NSArray *v8;
  char v9;
  NSArray *formOfWay;
  NSArray *v11;
  char v12;
  NSArray *locationType;
  NSArray *v14;
  char v15;
  NSString *startLocationName;
  NSString *v17;
  void *v18;
  char v19;
  NSString *endLocationName;
  NSString *v21;
  void *v22;
  char v23;
  char v25;

  v6 = a3;
  v25 = objc_msgSend(v6, "isMemberOfClass:", objc_opt_class());
  roadClass = self->_roadClass;
  v8 = roadClass;
  if (roadClass)
  {
LABEL_4:
    objc_msgSend(v6, "roadClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSArray isEqualToArray:](v8, "isEqualToArray:", v4);

    if (roadClass)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v6, "roadClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = self->_roadClass;
    goto LABEL_4;
  }
  v9 = 1;
LABEL_7:

LABEL_8:
  formOfWay = self->_formOfWay;
  v11 = formOfWay;
  if (formOfWay)
    goto LABEL_11;
  objc_msgSend(v6, "formOfWay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = self->_formOfWay;
LABEL_11:
    objc_msgSend(v6, "formOfWay");
    roadClass = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSArray isEqualToArray:](v11, "isEqualToArray:", roadClass);

    if (formOfWay)
      goto LABEL_15;
    goto LABEL_14;
  }
  v12 = 1;
LABEL_14:

LABEL_15:
  locationType = self->_locationType;
  v14 = locationType;
  if (locationType)
    goto LABEL_18;
  objc_msgSend(v6, "locationType");
  roadClass = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (roadClass)
  {
    v14 = self->_locationType;
LABEL_18:
    objc_msgSend(v6, "locationType");
    formOfWay = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSArray isEqualToArray:](v14, "isEqualToArray:", formOfWay);

    if (locationType)
      goto LABEL_22;
    goto LABEL_21;
  }
  v15 = 1;
LABEL_21:

LABEL_22:
  startLocationName = self->_startLocationName;
  v17 = startLocationName;
  if (startLocationName)
    goto LABEL_25;
  objc_msgSend(v6, "startLocationName");
  formOfWay = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (formOfWay)
  {
    v17 = self->_startLocationName;
LABEL_25:
    objc_msgSend(v6, "startLocationName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NSString isEqualToString:](v17, "isEqualToString:", v18);

    if (startLocationName)
      goto LABEL_29;
    goto LABEL_28;
  }
  v19 = 1;
LABEL_28:

LABEL_29:
  endLocationName = self->_endLocationName;
  v21 = endLocationName;
  if (!endLocationName)
  {
    objc_msgSend(v6, "endLocationName");
    formOfWay = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (!formOfWay)
    {
      v23 = 1;
LABEL_35:

      goto LABEL_36;
    }
    v21 = self->_endLocationName;
  }
  objc_msgSend(v6, "endLocationName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[NSString isEqualToString:](v21, "isEqualToString:", v22);

  if (!endLocationName)
    goto LABEL_35;
LABEL_36:

  return v25 & v9 & v12 & v15 & v19 & v23;
}

- (NSArray)roadClass
{
  return self->_roadClass;
}

- (NSArray)formOfWay
{
  return self->_formOfWay;
}

- (NSArray)locationType
{
  return self->_locationType;
}

- (NSString)startLocationName
{
  return self->_startLocationName;
}

- (NSString)endLocationName
{
  return self->_endLocationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endLocationName, 0);
  objc_storeStrong((id *)&self->_startLocationName, 0);
  objc_storeStrong((id *)&self->_locationType, 0);
  objc_storeStrong((id *)&self->_formOfWay, 0);
  objc_storeStrong((id *)&self->_roadClass, 0);
}

@end
