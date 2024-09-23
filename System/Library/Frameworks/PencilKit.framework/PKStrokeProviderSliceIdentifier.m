@implementation PKStrokeProviderSliceIdentifier

- (PKStrokeProviderSliceIdentifier)initWithUUID:(id)a3 tStart:(double)a4 tEnd:(double)a5
{
  NSUUID *v8;
  PKStrokeProviderSliceIdentifier *v9;
  NSUUID *strokeUUID;
  objc_super v12;

  v8 = (NSUUID *)a3;
  v12.receiver = self;
  v12.super_class = (Class)PKStrokeProviderSliceIdentifier;
  v9 = -[PKStrokeProviderSliceIdentifier init](&v12, sel_init);
  strokeUUID = v9->_strokeUUID;
  v9->_strokeUUID = v8;

  v9->_tStart = a4;
  v9->_tEnd = a5;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKStrokeProviderSliceIdentifier *v4;
  PKStrokeProviderSliceIdentifier *v5;
  PKStrokeProviderSliceIdentifier *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = (PKStrokeProviderSliceIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKStrokeProviderSliceIdentifier strokeUUID](self, "strokeUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStrokeProviderSliceIdentifier strokeUUID](v6, "strokeUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8)
        && ((-[PKStrokeProviderSliceIdentifier tStart](self, "tStart"),
             v10 = v9,
             -[PKStrokeProviderSliceIdentifier tStart](v6, "tStart"),
             v10 == v11)
         || vabdd_f64(v10, v11) < fabs(v11 * 0.000000999999997)))
      {
        -[PKStrokeProviderSliceIdentifier tEnd](self, "tEnd");
        v13 = v12;
        -[PKStrokeProviderSliceIdentifier tEnd](v6, "tEnd");
        v15 = v13 == v14 || vabdd_f64(v13, v14) < fabs(v14 * 0.000000999999997);
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[PKStrokeProviderSliceIdentifier strokeUUID](self, "strokeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = PKHashBytes((uint64_t)&self->_tStart, 8);
  v6 = v5 ^ v4 ^ PKHashBytes((uint64_t)&self->_tEnd, 8);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKStrokeProviderSliceIdentifier strokeUUID](self, "strokeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("strokeUUIDKey"));

  -[PKStrokeProviderSliceIdentifier tStart](self, "tStart");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tStart"));
  -[PKStrokeProviderSliceIdentifier tEnd](self, "tEnd");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tEnd"));

}

- (PKStrokeProviderSliceIdentifier)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSUUID *strokeUUID;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("strokeUUIDKey"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tStart"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tEnd"));
  v9 = v8;
  strokeUUID = self->_strokeUUID;
  self->_strokeUUID = v5;

  self->_tStart = v7;
  self->_tEnd = v9;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)strokeUUID
{
  return self->_strokeUUID;
}

- (double)tStart
{
  return self->_tStart;
}

- (double)tEnd
{
  return self->_tEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeUUID, 0);
}

@end
