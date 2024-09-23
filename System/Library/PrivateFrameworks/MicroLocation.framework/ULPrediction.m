@implementation ULPrediction

- (ULPrediction)initWithPlaces:(id)a3 error:(id)a4 requestIdentifier:(id)a5 time:(id)a6 confidence:(unint64_t)a7 confidenceReasons:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ULPrediction *v19;
  ULPrediction *v20;
  ULPrediction *v21;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)ULPrediction;
  v19 = -[ULPrediction init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    -[ULPrediction setPlaces:](v19, "setPlaces:", v14);
    -[ULPrediction setError:](v20, "setError:", v15);
    -[ULPrediction setRequestIdentifier:](v20, "setRequestIdentifier:", v16);
    -[ULPrediction setTime:](v20, "setTime:", v17);
    -[ULPrediction setConfidence:](v20, "setConfidence:", a7);
    -[ULPrediction setConfidenceReasons:](v20, "setConfidenceReasons:", v18);
    v21 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;

  v17 = objc_alloc((Class)objc_opt_class());
  -[ULPrediction places](self, "places");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[ULPrediction error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[ULPrediction requestIdentifier](self, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[ULPrediction time](self, "time");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  v12 = -[ULPrediction confidence](self, "confidence");
  -[ULPrediction confidenceReasons](self, "confidenceReasons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  v15 = (void *)objc_msgSend(v17, "initWithPlaces:error:requestIdentifier:time:confidence:confidenceReasons:", v5, v7, v9, v11, v12, v14);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *places;
  void *v5;
  id v6;

  places = self->_places;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", places, CFSTR("places"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("requestIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("confidence"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_confidenceReasons, CFSTR("confidenceReasons"));
}

- (ULPrediction)initWithCoder:(id)a3
{
  id v4;
  ULPrediction *v5;
  ULPrediction *v6;
  uint64_t v7;
  NSArray *places;
  void *v9;
  uint64_t v10;
  NSError *error;
  void *v12;
  uint64_t v13;
  NSUUID *requestIdentifier;
  void *v15;
  uint64_t v16;
  NSError *v17;
  void *v18;
  uint64_t v19;
  NSDate *time;
  ULPrediction *v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *confidenceReasons;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ULPrediction;
  v5 = -[ULPrediction init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("places"));
    v6 = (ULPrediction *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_self();
      v7 = objc_claimAutoreleasedReturnValue();

      places = v5->_places;
      v5->_places = (NSArray *)v7;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v10 = objc_claimAutoreleasedReturnValue();

      error = v5->_error;
      v5->_error = (NSError *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v13 = objc_claimAutoreleasedReturnValue();

      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSUUID *)v13;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = v5->_error;
      v5->_error = (NSError *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v19 = objc_claimAutoreleasedReturnValue();

      time = v5->_time;
      v5->_time = (NSDate *)v19;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidence"));
      v21 = (ULPrediction *)objc_claimAutoreleasedReturnValue();
      v6 = v21;
      if (v21)
      {
        v22 = -[ULPrediction unsignedIntegerValue](v21, "unsignedIntegerValue");

        v5->_confidence = v22;
        objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("confidenceReasons"));
        v6 = (ULPrediction *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_opt_self();
          v23 = objc_claimAutoreleasedReturnValue();

          confidenceReasons = v5->_confidenceReasons;
          v5->_confidenceReasons = (NSArray *)v23;

          v6 = v5;
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", places: %@"), self->_places);
  objc_msgSend(v6, "appendFormat:", CFSTR(", error: %@"), self->_error);
  objc_msgSend(v6, "appendFormat:", CFSTR(", requestIdentifier: %@"), self->_requestIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", time: %@"), self->_time);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_confidence);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", confidence: %@"), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR(", confidenceReasons: %@"), self->_confidenceReasons);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  BOOL v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ULPrediction places](self, "places");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "places");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[ULPrediction places](self, "places");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "places");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
        goto LABEL_21;
    }
    -[ULPrediction error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {

    }
    else
    {
      -[ULPrediction error](self, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
        goto LABEL_21;
    }
    -[ULPrediction requestIdentifier](self, "requestIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", v16))
    {

    }
    else
    {
      -[ULPrediction requestIdentifier](self, "requestIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v18)
        goto LABEL_21;
    }
    -[ULPrediction time](self, "time");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "time");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqual:", v20))
    {

    }
    else
    {
      -[ULPrediction time](self, "time");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "time");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 != v22)
        goto LABEL_21;
    }
    -[ULPrediction error](self, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqual:", v24))
    {

    }
    else
    {
      -[ULPrediction error](self, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 != v26)
        goto LABEL_21;
    }
    v27 = -[ULPrediction confidence](self, "confidence");
    if (v27 == objc_msgSend(v5, "confidence"))
    {
      -[ULPrediction confidenceReasons](self, "confidenceReasons");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "confidenceReasons");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isEqual:", v29))
      {

        v8 = 1;
      }
      else
      {
        -[ULPrediction confidenceReasons](self, "confidenceReasons");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "confidenceReasons");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v31 != v32;

        v8 = !v33;
      }
      goto LABEL_22;
    }
LABEL_21:
    v8 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v8 = 0;
LABEL_23:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSArray hash](self->_places, "hash");
  v4 = -[NSError hash](self->_error, "hash") ^ v3;
  v5 = -[NSUUID hash](self->_requestIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_time, "hash");
  v7 = -[NSError hash](self->_error, "hash") ^ self->_confidence;
  return v6 ^ v7 ^ -[NSArray hash](self->_confidenceReasons, "hash");
}

- (ULPrediction)init
{
  __assert_rtn("-[ULPrediction init]", "ULConnectionDelegateTypes.m", 822, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULPrediction new]", "ULConnectionDelegateTypes.m", 827, "NO");
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (NSArray)confidenceReasons
{
  return self->_confidenceReasons;
}

- (void)setConfidenceReasons:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceReasons, a3);
}

- (NSArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
  objc_storeStrong((id *)&self->_places, a3);
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_confidenceReasons, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
