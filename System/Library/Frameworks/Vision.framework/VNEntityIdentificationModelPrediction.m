@implementation VNEntityIdentificationModelPrediction

- (VNEntityIdentificationModelPrediction)initWithObservation:(id)a3 entityUniqueIdentifier:(id)a4 confidence:(float)a5
{
  id v9;
  id v10;
  VNEntityIdentificationModelPrediction *v11;
  VNEntityIdentificationModelPrediction *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNEntityIdentificationModelPrediction;
  v11 = -[VNEntityIdentificationModelPrediction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_observation, a3);
    objc_storeStrong((id *)&v12->_entityUniqueIdentifier, a4);
    v12->_confidence = a5;
  }

  return v12;
}

- (VNEntityIdentificationModelPrediction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VNEntityIdentificationModelPrediction *v7;

  v4 = a3;
  objc_msgSend(v4, "vn_decodeEntityUniqueIdentifierForKey:", CFSTR("entityUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("observation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("confidence"));
      self = -[VNEntityIdentificationModelPrediction initWithObservation:entityUniqueIdentifier:confidence:](self, "initWithObservation:entityUniqueIdentifier:confidence:", v6, v5);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  VNEntityIdentificationModelObservation *observation;
  double v5;
  id v6;

  observation = self->_observation;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", observation, CFSTR("observation"));
  objc_msgSend(v6, "vn_encodeEntityUniqueIdentifier:forKey:", self->_entityUniqueIdentifier, CFSTR("entityUID"));
  *(float *)&v5 = self->_confidence;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("confidence"), v5);

}

- (BOOL)isEqual:(id)a3
{
  VNEntityIdentificationModelPrediction *v4;
  VNEntityIdentificationModelPrediction *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (VNEntityIdentificationModelPrediction *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNEntityIdentificationModelPrediction confidence](self, "confidence");
      v7 = v6;
      -[VNEntityIdentificationModelPrediction confidence](v5, "confidence");
      if (v7 == v8
        && (-[VNEntityIdentificationModelPrediction entityUniqueIdentifier](self, "entityUniqueIdentifier"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[VNEntityIdentificationModelPrediction entityUniqueIdentifier](v5, "entityUniqueIdentifier"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqual:", v10),
            v10,
            v9,
            v11))
      {
        -[VNEntityIdentificationModelPrediction observation](self, "observation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNEntityIdentificationModelPrediction observation](v5, "observation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

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

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  float confidence;
  uint64_t v5;

  v3 = -[NSObject hash](self->_entityUniqueIdentifier, "hash") ^ __ROR8__(-[VNEntityIdentificationModelObservation hash](self->_observation, "hash"), 51);
  confidence = self->_confidence;
  v5 = LODWORD(confidence);
  if (confidence == 0.0)
    v5 = 0;
  return v5 ^ __ROR8__(v3, 51);
}

- (id)description
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNEntityIdentificationModelPrediction;
  -[VNEntityIdentificationModelPrediction description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNEntityIdentificationModelPrediction entityUniqueIdentifier](self, "entityUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNEntityIdentificationModelPrediction confidence](self, "confidence");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" '%@' confidence %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VNEntityIdentificationModelObservation)observation
{
  return (VNEntityIdentificationModelObservation *)objc_getProperty(self, a2, 8, 1);
}

- (NSObject)entityUniqueIdentifier
{
  return objc_getProperty(self, a2, 16, 1);
}

- (float)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_observation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
