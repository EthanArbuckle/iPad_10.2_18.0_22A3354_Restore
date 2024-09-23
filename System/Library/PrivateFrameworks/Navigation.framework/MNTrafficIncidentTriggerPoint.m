@implementation MNTrafficIncidentTriggerPoint

- (MNTrafficIncidentTriggerPoint)initWithReferenceCoordinate:(id)a3 allowsShifting:(BOOL)a4
{
  char *v6;
  MNTrafficIncidentTriggerPoint *v7;
  char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MNTrafficIncidentTriggerPoint;
  v6 = -[MNTrafficIncidentTriggerPoint init](&v10, sel_init);
  v7 = (MNTrafficIncidentTriggerPoint *)v6;
  if (v6)
  {
    *($212C09783140BCCD23384160D545CE0D *)(v6 + 12) = a3;
    v6[8] = a4;
    v8 = v6;
  }

  return v7;
}

- (void)setReferenceCoordinate:(id)a3
{
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_allowsShifting)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attemped to change referenceCoordinate of MNTrafficIncidentTriggerPoint when shifting is now allowed. Ignoring change."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136316162;
    v8 = "-[MNTrafficIncidentTriggerPoint setReferenceCoordinate:]";
    v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTrafficIncidentTriggerPoint.m";
    v11 = 1024;
    v12 = 34;
    v13 = 2080;
    v14 = "_allowsShifting";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v7, 0x30u);
  }

  if (self->_allowsShifting)
LABEL_2:
    self->_referenceCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (BOOL)shouldActivateForLocation:(id)a3
{
  void *v4;

  objc_msgSend(a3, "routeMatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeCoordinate");

  -[MNTrafficIncidentTriggerPoint referenceCoordinate](self, "referenceCoordinate");
  return GEOPolylineCoordinateIsABeforeOrEqualToB();
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  GEOPolylineCoordinateAsShortString();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_allowsShifting)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("coordinate: [%@] | allowsShifting: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MNTrafficIncidentTriggerPoint)initWithCoder:(id)a3
{
  id v4;
  MNTrafficIncidentTriggerPoint *v5;
  id v6;
  const void *v7;
  size_t v8;
  MNTrafficIncidentTriggerPoint *v9;
  unint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNTrafficIncidentTriggerPoint;
  v5 = -[MNTrafficIncidentTriggerPoint init](&v12, sel_init);
  if (v5)
  {
    v11 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("_referenceCoordinate"), &v11);
    if (v11 && v7)
    {
      if (v11 >= 8)
        v8 = 8;
      else
        v8 = v11;
      memcpy(&v5->_referenceCoordinate, v7, v8);
    }
    v5->_allowsShifting = objc_msgSend(v6, "decodeBoolForKey:", CFSTR("_allowsShifting"));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  $604ECB7A8067A7300F159AE8ED6889F8 *p_referenceCoordinate;
  id v5;

  p_referenceCoordinate = &self->_referenceCoordinate;
  v5 = a3;
  objc_msgSend(v5, "encodeBytes:length:forKey:", p_referenceCoordinate, 8, CFSTR("_referenceCoordinate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsShifting, CFSTR("_allowsShifting"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- ($212C09783140BCCD23384160D545CE0D)referenceCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_referenceCoordinate;
}

- (BOOL)allowsShifting
{
  return self->_allowsShifting;
}

@end
