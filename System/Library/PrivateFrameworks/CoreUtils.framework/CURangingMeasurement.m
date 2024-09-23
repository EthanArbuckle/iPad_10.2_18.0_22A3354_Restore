@implementation CURangingMeasurement

- (CURangingMeasurement)initWithCoder:(id)a3
{
  id v4;
  CURangingMeasurement *v5;
  id v6;
  double v7;
  id v8;
  double v9;
  id v10;
  uint64_t v11;
  id v12;
  double v13;
  id v14;
  double v15;
  id v16;
  uint64_t v17;
  id v18;
  double v19;
  id v20;
  double v21;
  id v22;
  double v23;
  id v24;
  CURangingMeasurement *v25;
  objc_super v27;
  uint64_t v28;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CURangingMeasurement;
  v5 = -[CURangingMeasurement init](&v27, sel_init);
  if (v5)
  {
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("dM")))
    {
      objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("dM"));
      v5->_distanceMeters = v7;
    }

    v8 = v6;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("dE")))
    {
      objc_msgSend(v8, "decodeDoubleForKey:", CFSTR("dE"));
      v5->_distanceError = v9;
    }

    v10 = v8;
    v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, CFSTR("e"), v11, (void **)&v5->_error);

    v28 = 0;
    if (NSDecodeSInt64RangedIfPresent(v10, CFSTR("fl"), 0, 0xFFFFFFFFLL, &v28))
      v5->_flags = v28;
    v12 = v10;
    if (objc_msgSend(v12, "containsValueForKey:", CFSTR("hA")))
    {
      objc_msgSend(v12, "decodeDoubleForKey:", CFSTR("hA"));
      v5->_horizontalAngle = v13;
    }

    v14 = v12;
    if (objc_msgSend(v14, "containsValueForKey:", CFSTR("hE")))
    {
      objc_msgSend(v14, "decodeDoubleForKey:", CFSTR("hE"));
      v5->_horizontalError = v15;
    }

    v16 = v14;
    v17 = objc_opt_class();
    NSDecodeObjectIfPresent(v16, CFSTR("id"), v17, (void **)&v5->_identifier);

    v18 = v16;
    if (objc_msgSend(v18, "containsValueForKey:", CFSTR("vA")))
    {
      objc_msgSend(v18, "decodeDoubleForKey:", CFSTR("vA"));
      v5->_verticalAngle = v19;
    }

    v20 = v18;
    if (objc_msgSend(v20, "containsValueForKey:", CFSTR("vE")))
    {
      objc_msgSend(v20, "decodeDoubleForKey:", CFSTR("vE"));
      v5->_verticalError = v21;
    }

    v22 = v20;
    if (objc_msgSend(v22, "containsValueForKey:", CFSTR("pS")))
    {
      objc_msgSend(v22, "decodeDoubleForKey:", CFSTR("pS"));
      v5->_ptsScore = v23;
    }

    v24 = v22;
    if (objc_msgSend(v24, "containsValueForKey:", CFSTR("ts")))
      v5->_timestampTicks = objc_msgSend(v24, "decodeInt64ForKey:", CFSTR("ts"));

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSError *error;
  uint64_t flags;
  NSString *identifier;
  unint64_t timestampTicks;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_distanceMeters != 0.0)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("dM"));
    v4 = v9;
  }
  if (self->_distanceError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("dE"));
    v4 = v9;
  }
  error = self->_error;
  if (error)
  {
    objc_msgSend(v9, "encodeObject:forKey:", error, CFSTR("e"));
    v4 = v9;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    objc_msgSend(v9, "encodeInt64:forKey:", flags, CFSTR("fl"));
    v4 = v9;
  }
  if (self->_horizontalAngle != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("hA"));
    v4 = v9;
  }
  if (self->_horizontalError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("hE"));
    v4 = v9;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v9, "encodeObject:forKey:", identifier, CFSTR("id"));
    v4 = v9;
  }
  if (self->_verticalAngle != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("vA"));
    v4 = v9;
  }
  if (self->_verticalError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("vE"));
    v4 = v9;
  }
  if (self->_ptsScore != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("pS"));
    v4 = v9;
  }
  timestampTicks = self->_timestampTicks;
  if (timestampTicks)
  {
    objc_msgSend(v9, "encodeInt64:forKey:", timestampTicks, CFSTR("ts"));
    v4 = v9;
  }

}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t flags;
  __CFString *v20;
  NSError *error;
  NSError *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  CFMutableStringRef v31;
  CFMutableStringRef v32;
  CFMutableStringRef v33;
  CFMutableStringRef v34;

  v34 = 0;
  NSAppendPrintF(&v34, (uint64_t)"ID %@, D %.3f m, H %.3f, V %.3f", v2, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
  v9 = v34;
  v16 = v9;
  v17 = *(uint64_t *)&self->_ptsScore;
  if (*(double *)&v17 != 0.0)
  {
    v33 = v9;
    NSAppendPrintF(&v33, (uint64_t)", PTS %.3f", v10, v11, v12, v13, v14, v15, v17);
    v18 = v33;

    v16 = v18;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    v32 = v16;
    NSAppendPrintF(&v32, (uint64_t)", %#{flags}", v10, v11, v12, v13, v14, v15, flags);
    v20 = v32;

    v16 = v20;
  }
  error = self->_error;
  if (error)
  {
    v31 = v16;
    v22 = error;
    NSAppendPrintF(&v31, (uint64_t)", %{error}", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    v29 = v31;

    v16 = v29;
  }
  return v16;
}

- (double)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(double)a3
{
  self->_distanceMeters = a3;
}

- (double)distanceError
{
  return self->_distanceError;
}

- (void)setDistanceError:(double)a3
{
  self->_distanceError = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (double)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(double)a3
{
  self->_horizontalAngle = a3;
}

- (double)horizontalError
{
  return self->_horizontalError;
}

- (void)setHorizontalError:(double)a3
{
  self->_horizontalError = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)verticalAngle
{
  return self->_verticalAngle;
}

- (void)setVerticalAngle:(double)a3
{
  self->_verticalAngle = a3;
}

- (double)verticalError
{
  return self->_verticalError;
}

- (void)setVerticalError:(double)a3
{
  self->_verticalError = a3;
}

- (double)ptsScore
{
  return self->_ptsScore;
}

- (void)setPtsScore:(double)a3
{
  self->_ptsScore = a3;
}

- (unint64_t)timestampTicks
{
  return self->_timestampTicks;
}

- (void)setTimestampTicks:(unint64_t)a3
{
  self->_timestampTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
