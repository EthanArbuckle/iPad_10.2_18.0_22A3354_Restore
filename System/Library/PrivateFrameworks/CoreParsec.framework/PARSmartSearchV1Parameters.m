@implementation PARSmartSearchV1Parameters

- (PARSmartSearchV1Parameters)init
{
  PARSmartSearchV1Parameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PARSmartSearchV1Parameters;
  result = -[PARSmartSearchV1Parameters init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_weightLast1hour = xmmword_19A8CF860;
    *(_OWORD *)&result->_weightLast1week = xmmword_19A8CF870;
    *(_OWORD *)&result->_weightAll = xmmword_19A8CF880;
    result->_weightMinThresholdToSend = 0.0;
  }
  return result;
}

- (id)initFromBag:(id)a3
{
  id v4;
  PARSmartSearchV1Parameters *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  v5 = -[PARSmartSearchV1Parameters init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "safariLast1hour");
    v5->_weightLast1hour = v6;
    objc_msgSend(v4, "safariLast1day");
    v5->_weightLast1day = v7;
    objc_msgSend(v4, "safariLast1week");
    v5->_weightLast1week = v8;
    objc_msgSend(v4, "safariLast1month");
    v5->_weightLast1month = v9;
    objc_msgSend(v4, "safariAll");
    v5->_weightAll = v10;
    objc_msgSend(v4, "safariMostRecent");
    v5->_weightMostRecent = v11;
    objc_msgSend(v4, "safariDecay");
    v5->_weightMinThresholdToSend = v12;
  }

  return v5;
}

- (id)initFromLast1hour:(double)a3 last1day:(double)a4 last1week:(double)a5 last1month:(double)a6 all:(double)a7 mostRecent:(double)a8 minThresholdToSend:(double)a9
{
  id result;

  result = -[PARSmartSearchV1Parameters init](self, "init");
  if (result)
  {
    *((double *)result + 1) = a3;
    *((double *)result + 2) = a4;
    *((double *)result + 3) = a5;
    *((double *)result + 4) = a6;
    *((double *)result + 5) = a7;
    *((double *)result + 6) = a8;
    *((double *)result + 7) = a9;
  }
  return result;
}

- (PARSmartSearchV1Parameters)initWithCoder:(id)a3
{
  id v4;
  PARSmartSearchV1Parameters *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  v5 = -[PARSmartSearchV1Parameters init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_weightLast1hour"));
    v5->_weightLast1hour = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_weightLast1day"));
    v5->_weightLast1day = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_weightLast1week"));
    v5->_weightLast1week = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_weightLast1month"));
    v5->_weightLast1month = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_weightAll"));
    v5->_weightAll = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_weightMostRecent"));
    v5->_weightMostRecent = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_weightMinThresholdToSend"));
    v5->_weightMinThresholdToSend = v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double weightLast1hour;
  id v5;

  weightLast1hour = self->_weightLast1hour;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_weightLast1hour"), weightLast1hour);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_weightLast1day"), self->_weightLast1day);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_weightLast1week"), self->_weightLast1week);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_weightLast1month"), self->_weightLast1month);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_weightAll"), self->_weightAll);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_weightMostRecent"), self->_weightMostRecent);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_weightMinThresholdToSend"), self->_weightMinThresholdToSend);

}

- (double)weightLast1hour
{
  return self->_weightLast1hour;
}

- (double)weightLast1day
{
  return self->_weightLast1day;
}

- (double)weightLast1week
{
  return self->_weightLast1week;
}

- (double)weightLast1month
{
  return self->_weightLast1month;
}

- (double)weightAll
{
  return self->_weightAll;
}

- (double)weightMostRecent
{
  return self->_weightMostRecent;
}

- (double)weightMinThresholdToSend
{
  return self->_weightMinThresholdToSend;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
