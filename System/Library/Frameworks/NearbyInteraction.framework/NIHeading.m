@implementation NIHeading

- (NIHeading)initWithTimestamp:(id)a3 trueHeading:(double)a4 magneticHeading:(double)a5 headingAccuracy:(double)a6
{
  id v10;
  NIHeading *v11;
  uint64_t v12;
  NSDate *timestamp;
  objc_super v15;

  v10 = a3;
  if (!v10)
    __assert_rtn("-[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:]", "NILocation.mm", 235, "timestamp");
  v15.receiver = self;
  v15.super_class = (Class)NIHeading;
  v11 = -[NIHeading init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    timestamp = v11->_timestamp;
    v11->_timestamp = (NSDate *)v12;

    v11->_trueHeading = a4;
    v11->_magneticHeading = a5;
    v11->_headingAccuracy = a6;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:](+[NIHeading allocWithZone:](NIHeading, "allocWithZone:", a3), "initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:", self->_timestamp, self->_trueHeading, self->_magneticHeading, self->_headingAccuracy);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("trueHeading"), self->_trueHeading);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("magneticHeading"), self->_magneticHeading);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("headingAccuracy"), self->_headingAccuracy);

}

- (NIHeading)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NIHeading *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("trueHeading"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("magneticHeading"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("headingAccuracy"));
    v11 = -[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:]([NIHeading alloc], "initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:", v5, v7, v9, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIHeading *v5;
  NIHeading *v6;
  NSDate *timestamp;
  void *v8;
  void *v9;
  char v10;
  double trueHeading;
  double v12;
  double v13;
  double magneticHeading;
  double v15;
  double v16;
  double headingAccuracy;
  double v18;
  char v19;
  BOOL v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIHeading *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v20 = 1;
LABEL_17:

      goto LABEL_18;
    }
    timestamp = self->_timestamp;
    if (!timestamp)
    {
      -[NIHeading timestamp](v5, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v10 = 1;
        goto LABEL_7;
      }
      timestamp = self->_timestamp;
    }
    -[NIHeading timestamp](v6, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSDate isEqual:](timestamp, "isEqual:", v9);

LABEL_7:
    trueHeading = self->_trueHeading;
    -[NIHeading trueHeading](v6, "trueHeading");
    v13 = v12;
    magneticHeading = self->_magneticHeading;
    -[NIHeading magneticHeading](v6, "magneticHeading");
    v16 = v15;
    headingAccuracy = self->_headingAccuracy;
    -[NIHeading headingAccuracy](v6, "headingAccuracy");
    if (trueHeading == v13)
      v19 = v10;
    else
      v19 = 0;
    if (magneticHeading != v16)
      v19 = 0;
    if (headingAccuracy == v18)
      v20 = v19;
    else
      v20 = 0;
    goto LABEL_17;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (unint64_t)hash
{
  NSDate *timestamp;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  timestamp = self->_timestamp;
  if (timestamp)
    v4 = -[NSDate hash](timestamp, "hash");
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_trueHeading);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_magneticHeading);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_headingAccuracy);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v4 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NIHeading descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_trueHeading);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_magneticHeading);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_headingAccuracy);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Time: %@. TrueHeading: %@. MagHeading: %@. HeadingAcc: %@"), self->_timestamp, v3, v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("***");
  }
  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)trueHeading
{
  return self->_trueHeading;
}

- (void)setTrueHeading:(double)a3
{
  self->_trueHeading = a3;
}

- (double)magneticHeading
{
  return self->_magneticHeading;
}

- (void)setMagneticHeading:(double)a3
{
  self->_magneticHeading = a3;
}

- (double)headingAccuracy
{
  return self->_headingAccuracy;
}

- (void)setHeadingAccuracy:(double)a3
{
  self->_headingAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
