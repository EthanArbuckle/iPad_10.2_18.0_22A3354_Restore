@implementation _MKTransitInactiveLine

- (_MKTransitInactiveLine)initWithTransitLine:(id)a3 blocked:(BOOL)a4 serviceResumesDate:(id)a5 timeZone:(id)a6 referenceDate:(id)a7 departuresSequence:(id)a8
{
  id v15;
  id v16;
  id v17;
  _MKTransitInactiveLine *v18;
  _MKTransitInactiveLine *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_MKTransitInactiveLine;
  v18 = -[_MKTransitInactiveLine init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_line, a3);
    v19->_blocked = a4;
    objc_storeStrong((id *)&v19->_serviceResumesDate, a5);
    objc_storeStrong((id *)&v19->_timeZone, a6);
    objc_storeStrong((id *)&v19->_referenceDate, a7);
    objc_storeStrong((id *)&v19->_departuresSequence, a8);
  }

  return v19;
}

- (GEOTransitLine)line
{
  return self->_line;
}

- (NSString)serviceResumesDescription
{
  return (NSString *)MKServiceGapDescription(self->_serviceResumesDate, self->_referenceDate, self->_timeZone, self->_blocked);
}

- (GEOTransitDepartureSequence)departuresSequence
{
  return self->_departuresSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departuresSequence, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_serviceResumesDate, 0);
  objc_storeStrong((id *)&self->_line, 0);
}

@end
