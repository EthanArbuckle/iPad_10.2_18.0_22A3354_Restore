@implementation MNTrafficIncidentTriggerRange

- (MNTrafficIncidentTriggerRange)initWithTriggerPointShow:(id)a3 hide:(id)a4 displayTime:(double)a5
{
  id v9;
  id v10;
  MNTrafficIncidentTriggerRange *v11;
  MNTrafficIncidentTriggerRange *v12;
  double v13;
  MNTrafficIncidentTriggerRange *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MNTrafficIncidentTriggerRange;
  v11 = -[MNTrafficIncidentTriggerRange init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_showTriggerPoint, a3);
    objc_storeStrong((id *)&v12->_hideTriggerPoint, a4);
    v13 = 1.79769313e308;
    if (a5 > 0.0)
      v13 = a5;
    v12->_displayTime = v13;
    v14 = v12;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ displayTime %lf, | showTriggerPoint: %@ | hideTriggerPoint: [%@] }"), *(_QWORD *)&self->_displayTime, self->_showTriggerPoint, self->_hideTriggerPoint);
}

- (MNTrafficIncidentTriggerRange)initWithCoder:(id)a3
{
  id v4;
  MNTrafficIncidentTriggerRange *v5;
  uint64_t v6;
  MNTrafficIncidentTriggerPoint *showTriggerPoint;
  uint64_t v8;
  MNTrafficIncidentTriggerPoint *hideTriggerPoint;
  double v10;
  MNTrafficIncidentTriggerRange *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MNTrafficIncidentTriggerRange;
  v5 = -[MNTrafficIncidentTriggerRange init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_showTriggerPoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    showTriggerPoint = v5->_showTriggerPoint;
    v5->_showTriggerPoint = (MNTrafficIncidentTriggerPoint *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hideTriggerPoint"));
    v8 = objc_claimAutoreleasedReturnValue();
    hideTriggerPoint = v5->_hideTriggerPoint;
    v5->_hideTriggerPoint = (MNTrafficIncidentTriggerPoint *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_displayTime"));
    v5->_displayTime = v10;
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MNTrafficIncidentTriggerPoint *showTriggerPoint;
  id v5;

  showTriggerPoint = self->_showTriggerPoint;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", showTriggerPoint, CFSTR("_showTriggerPoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hideTriggerPoint, CFSTR("_hideTriggerPoint"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_displayTime"), self->_displayTime);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTrafficIncidentTriggerPoint)showTriggerPoint
{
  return self->_showTriggerPoint;
}

- (MNTrafficIncidentTriggerPoint)hideTriggerPoint
{
  return self->_hideTriggerPoint;
}

- (double)displayTime
{
  return self->_displayTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideTriggerPoint, 0);
  objc_storeStrong((id *)&self->_showTriggerPoint, 0);
}

@end
