@implementation GEOReferenceTimeData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)currentReferenceTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[GEOReferenceTimeData refTime](self, "refTime");
  v4 = v3;
  geoTMGetKernelMonotonicClock();
  v6 = v4 + v5;
  -[GEOReferenceTimeData kernTime](self, "kernTime");
  return v6 - v7;
}

- (double)refTime
{
  return self->_refTime;
}

- (double)kernTime
{
  return self->_kernTime;
}

- (timeval)kernBootTime
{
  uint64_t v2;
  __darwin_time_t tv_sec;
  timeval result;

  v2 = *(_QWORD *)&self->_kernBoottime.tv_usec;
  tv_sec = self->_kernBoottime.tv_sec;
  result.tv_usec = v2;
  result.tv_sec = tv_sec;
  return result;
}

- (GEOReferenceTimeData)initWithCoder:(id)a3
{
  id v4;
  GEOReferenceTimeData *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOReferenceTimeData;
  v5 = -[GEOReferenceTimeData init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    v5->_refTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("e"));
    v5->_refError = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("k"));
    v5->_kernTime = v8;
    v5->_kernBoottime.tv_sec = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bs"));
    v5->_kernBoottime.tv_usec = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bu"));
  }

  return v5;
}

- (GEOReferenceTimeData)initWithRefTime:(double)a3 refError:(double)a4 kernTime:(double)a5 bootTime:(timeval)a6
{
  uint64_t v6;
  __darwin_time_t tv_sec;
  GEOReferenceTimeData *result;
  objc_super v12;

  v6 = *(_QWORD *)&a6.tv_usec;
  tv_sec = a6.tv_sec;
  v12.receiver = self;
  v12.super_class = (Class)GEOReferenceTimeData;
  result = -[GEOReferenceTimeData init](&v12, sel_init);
  if (result)
  {
    result->_refTime = a3;
    result->_refError = a4;
    result->_kernTime = a5;
    result->_kernBoottime.tv_sec = tv_sec;
    *(_QWORD *)&result->_kernBoottime.tv_usec = v6;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double refTime;
  id v5;

  refTime = self->_refTime;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("t"), refTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("e"), self->_refError);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("k"), self->_kernTime);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_kernBoottime.tv_sec, CFSTR("bs"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_kernBoottime.tv_usec, CFSTR("bu"));

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GEOReferenceTimeData(%p) :\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("refTime = %f, kernTime = %f, kernBootTime = %ld.%d>"), *(_QWORD *)&self->_refTime, *(_QWORD *)&self->_kernTime, self->_kernBoottime.tv_sec, self->_kernBoottime.tv_usec);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)refError
{
  return self->_refError;
}

@end
