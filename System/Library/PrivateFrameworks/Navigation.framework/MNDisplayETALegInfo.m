@implementation MNDisplayETALegInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNDisplayETALegInfo)initWithCoder:(id)a3
{
  id v4;
  MNDisplayETALegInfo *v5;
  uint64_t v6;
  NSUUID *waypointID;
  uint64_t v8;
  NSDate *eta;
  uint64_t v10;
  NSTimeZone *timeZone;
  MNDisplayETALegInfo *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNDisplayETALegInfo;
  v5 = -[MNDisplayETALegInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_waypointID"));
    v6 = objc_claimAutoreleasedReturnValue();
    waypointID = v5->_waypointID;
    v5->_waypointID = (NSUUID *)v6;

    v5->_legIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_legIndex"));
    v5->_remainingMinutes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_remainingMinutes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eta"));
    v8 = objc_claimAutoreleasedReturnValue();
    eta = v5->_eta;
    v5->_eta = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timeZone"));
    v10 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *waypointID;
  id v5;

  waypointID = self->_waypointID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", waypointID, CFSTR("_waypointID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_legIndex, CFSTR("_legIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remainingMinutes, CFSTR("_remainingMinutes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eta, CFSTR("_eta"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("_timeZone"));

}

- (id)description
{
  void *v3;
  unint64_t legIndex;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  legIndex = self->_legIndex;
  +[MNDisplayETAInfo dateFormatter](MNDisplayETAInfo, "dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", self->_eta);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%d]: %@ / %d min | %@"), legIndex, v6, self->_remainingMinutes, self->_waypointID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[NSUUID isEqual:](self->_waypointID, "isEqual:", v5[1])
      && self->_legIndex == v5[2]
      && self->_remainingMinutes == v5[3]
      && +[MNDisplayETAInfo isDisplayDate:equalTo:](MNDisplayETAInfo, "isDisplayDate:equalTo:", self->_eta, v5[4]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSUUID)waypointID
{
  return self->_waypointID;
}

- (void)setWaypointID:(id)a3
{
  objc_storeStrong((id *)&self->_waypointID, a3);
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (void)setLegIndex:(unint64_t)a3
{
  self->_legIndex = a3;
}

- (unint64_t)remainingMinutes
{
  return self->_remainingMinutes;
}

- (void)setRemainingMinutes:(unint64_t)a3
{
  self->_remainingMinutes = a3;
}

- (NSDate)eta
{
  return self->_eta;
}

- (void)setEta:(id)a3
{
  objc_storeStrong((id *)&self->_eta, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_eta, 0);
  objc_storeStrong((id *)&self->_waypointID, 0);
}

@end
