@implementation VNPersonsModelPrediction

- (VNPersonsModelPrediction)initWithFaceObservation:(id)a3 predictedPersonUniqueIdentifier:(id)a4 confidence:(float)a5
{
  id v9;
  id v10;
  VNPersonsModelPrediction *v11;
  VNPersonsModelPrediction *v12;
  VNPersonsModelPrediction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VNPersonsModelPrediction;
  v11 = -[VNPersonsModelPrediction init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_faceObservation, a3);
    objc_storeStrong((id *)&v12->_predictedPersonUniqueIdentifier, a4);
    v12->_confidence = a5;
    v13 = v12;
  }

  return v12;
}

- (VNPersonsModelPrediction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VNPersonsModelPrediction *v7;

  v4 = a3;
  objc_msgSend(v4, "vn_decodePersonUniqueIdentifierForKey:", CFSTR("personUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("face"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("confidence"));
      self = -[VNPersonsModelPrediction initWithFaceObservation:predictedPersonUniqueIdentifier:confidence:](self, "initWithFaceObservation:predictedPersonUniqueIdentifier:confidence:", v6, v5);
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
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_faceObservation, CFSTR("face"));
  objc_msgSend(v5, "vn_encodePersonUniqueIdentifier:forKey:", self->_predictedPersonUniqueIdentifier, CFSTR("personUID"));
  *(float *)&v4 = self->_confidence;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("confidence"), v4);

}

- (BOOL)isEqual:(id)a3
{
  VNPersonsModelPrediction *v4;
  VNPersonsModelPrediction *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (VNPersonsModelPrediction *)a3;
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
      -[VNPersonsModelPrediction confidence](self, "confidence");
      v7 = v6;
      -[VNPersonsModelPrediction confidence](v5, "confidence");
      if (v7 == v8
        && (-[VNPersonsModelPrediction predictedPersonUniqueIdentifier](self, "predictedPersonUniqueIdentifier"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[VNPersonsModelPrediction predictedPersonUniqueIdentifier](v5, "predictedPersonUniqueIdentifier"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqual:", v10),
            v10,
            v9,
            (v11 & 1) != 0))
      {
        -[VNPersonsModelPrediction faceObservation](self, "faceObservation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNPersonsModelPrediction faceObservation](v5, "faceObservation");
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
  unint64_t v3;
  float confidence;
  uint64_t v5;

  v3 = -[VNFaceObservation hash](self->_faceObservation, "hash") ^ __ROR8__(-[NSObject hash](self->_predictedPersonUniqueIdentifier, "hash") ^ __ROR8__(-[VNFaceObservation hash](self->_faceObservation, "hash"), 51), 51);
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
  v8.super_class = (Class)VNPersonsModelPrediction;
  -[VNPersonsModelPrediction description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNPersonsModelPrediction predictedPersonUniqueIdentifier](self, "predictedPersonUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNPersonsModelPrediction confidence](self, "confidence");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" '%@' confidence %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VNFaceObservation)faceObservation
{
  return self->_faceObservation;
}

- (NSObject)predictedPersonUniqueIdentifier
{
  return self->_predictedPersonUniqueIdentifier;
}

- (float)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedPersonUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_faceObservation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
