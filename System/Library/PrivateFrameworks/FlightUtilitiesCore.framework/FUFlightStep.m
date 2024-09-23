@implementation FUFlightStep

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FUFlightStep airport](self, "airport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "airport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 != v6)
    {
      -[FUFlightStep airport](self, "airport");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "airport");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:", v8))
      {
        LOBYTE(v9) = 0;
        goto LABEL_52;
      }
      v64 = v8;
      v65 = v7;
    }
    -[FUFlightStep gate](self, "gate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      -[FUFlightStep gate](self, "gate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "gate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", v13))
      {
        LOBYTE(v9) = 0;
LABEL_50:

LABEL_51:
        v8 = v64;
        v7 = v65;
        if (v5 == v6)
        {
LABEL_53:

          goto LABEL_54;
        }
LABEL_52:

        goto LABEL_53;
      }
      v62 = v13;
      v63 = v12;
    }
    -[FUFlightStep terminal](self, "terminal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "terminal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 != v15)
    {
      -[FUFlightStep terminal](self, "terminal");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "terminal");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isEqual:"))
      {
        LOBYTE(v9) = 0;
        goto LABEL_48;
      }
      v60 = v16;
    }
    v17 = -[FUFlightStep legStatus](self, "legStatus");
    if (v17 == objc_msgSend(v4, "legStatus"))
    {
      v59 = v14;
      -[FUFlightStep delayFromSchedule](self, "delayFromSchedule");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "delayFromSchedule");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v18 == (void *)v19)
      {
        v55 = (void *)v19;
        v56 = v18;
      }
      else
      {
        -[FUFlightStep delayFromSchedule](self, "delayFromSchedule");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "delayFromSchedule");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          LOBYTE(v9) = 0;
          v16 = v60;
LABEL_46:

LABEL_47:
          v14 = v59;
          if (v59 == v15)
            goto LABEL_49;
          goto LABEL_48;
        }
        v55 = v20;
        v56 = v18;
      }
      -[FUFlightStep actualTime](self, "actualTime");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actualTime");
      v57 = (void *)v22;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v60;
      if ((void *)v22 != v58)
      {
        -[FUFlightStep actualTime](self, "actualTime");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "actualTime");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          LOBYTE(v9) = 0;
LABEL_44:

LABEL_45:
          v20 = v55;
          v18 = v56;
          if (v56 == v55)
            goto LABEL_47;
          goto LABEL_46;
        }
      }
      -[FUFlightStep scheduledTime](self, "scheduledTime");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scheduledTime");
      v25 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v24;
      v26 = v24 == v25;
      v27 = (void *)v25;
      if (v26)
      {
        v29 = (void *)v25;
      }
      else
      {
        -[FUFlightStep scheduledTime](self, "scheduledTime");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "scheduledTime");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v28;
        if (!objc_msgSend(v28, "isEqual:"))
        {
          LOBYTE(v9) = 0;
          v34 = v50;
LABEL_42:

LABEL_43:
          if (v57 == v58)
            goto LABEL_45;
          goto LABEL_44;
        }
        v29 = v27;
      }
      -[FUFlightStep runwayTime](self, "runwayTime");
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "runwayTime");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v30;
      v47 = v29;
      if (v30 != v45)
      {
        -[FUFlightStep runwayTime](self, "runwayTime");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "runwayTime");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v31;
        if (!objc_msgSend(v31, "isEqual:"))
        {
          LOBYTE(v9) = 0;
          v33 = (void *)v45;
          v32 = v46;
          goto LABEL_40;
        }
      }
      -[FUFlightStep estimatedTime](self, "estimatedTime");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "estimatedTime");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35 == v44
        || (-[FUFlightStep estimatedTime](self, "estimatedTime"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v4, "estimatedTime"),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            v40 = v36,
            objc_msgSend(v36, "isEqual:")))
      {
        v37 = -[FUFlightStep departure](self, "departure");
        v9 = v37 ^ objc_msgSend(v4, "departure") ^ 1;
        if (v35 == v44)
        {

          v33 = (void *)v45;
          v32 = v46;
          v16 = v60;
          if (v46 == (void *)v45)
          {
LABEL_41:

            v34 = v50;
            v27 = v47;
            if (v50 == v47)
              goto LABEL_43;
            goto LABEL_42;
          }
LABEL_40:

          goto LABEL_41;
        }
        v41 = v35;
        v16 = v60;
      }
      else
      {
        v41 = v35;
        LOBYTE(v9) = 0;
      }
      v33 = (void *)v45;
      v32 = v46;

      if (v46 == (void *)v45)
        goto LABEL_41;
      goto LABEL_40;
    }
    LOBYTE(v9) = 0;
    v16 = v60;
    if (v14 == v15)
    {
LABEL_49:

      v13 = v62;
      v12 = v63;
      if (v10 == v11)
        goto LABEL_51;
      goto LABEL_50;
    }
LABEL_48:

    goto LABEL_49;
  }
  LOBYTE(v9) = 0;
LABEL_54:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDeparture:", -[FUFlightStep departure](self, "departure"));
  -[FUFlightStep airport](self, "airport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAirport:", v6);

  -[FUFlightStep gate](self, "gate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setGate:", v8);

  -[FUFlightStep terminal](self, "terminal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setTerminal:", v10);

  objc_msgSend(v4, "setLegStatus:", -[FUFlightStep legStatus](self, "legStatus"));
  -[FUFlightStep actualTime](self, "actualTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setActualTime:", v12);

  -[FUFlightStep scheduledTime](self, "scheduledTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setScheduledTime:", v14);

  -[FUFlightStep plannedTime](self, "plannedTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setPlannedTime:", v16);

  -[FUFlightStep estimatedTime](self, "estimatedTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setEstimatedTime:", v18);

  -[FUFlightStep runwayTime](self, "runwayTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setRunwayTime:", v20);

  return v4;
}

- (BOOL)taxiing
{
  uint64_t v2;

  if (self->_departure)
  {
    if (self->_actualTime)
    {
      v2 = 80;
      return *(Class *)((char *)&self->super.isa + v2) == 0;
    }
  }
  else if (self->_runwayTime)
  {
    v2 = 72;
    return *(Class *)((char *)&self->super.isa + v2) == 0;
  }
  return 0;
}

- (FUStepTime)time
{
  FUStepTime *actualTime;
  FUStepTime *v3;
  FUStepTime *v4;
  FUStepTime *estimatedTime;
  void *v8;
  double v9;
  double v10;
  FUStepTime *v11;
  void *v12;

  actualTime = self->_actualTime;
  if (!actualTime)
  {
    estimatedTime = self->_estimatedTime;
    if (estimatedTime)
    {
      if (self->_departure)
      {
        -[FUStepTime date](estimatedTime, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceNow");
        v10 = v9;

        if (v10 < 0.0)
        {
          actualTime = self->_runwayTime;
          if (!actualTime)
          {
            v11 = [FUStepTime alloc];
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = -[FUStepTime initWithType:date:](v11, "initWithType:date:", 3, v12);

            return v4;
          }
          goto LABEL_2;
        }
        estimatedTime = self->_estimatedTime;
      }
      v3 = estimatedTime;
      goto LABEL_3;
    }
    actualTime = self->_scheduledTime;
  }
LABEL_2:
  v3 = actualTime;
LABEL_3:
  v4 = v3;
  return v4;
}

- (void)setDelayFromSchedule:(id)a3
{
  id v4;
  double v5;
  NSNumber *delayFromSchedule;
  NSNumber *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4 && (objc_msgSend(v4, "doubleValue"), v4 = v8, fabs(v5) < 900.0))
  {
    delayFromSchedule = self->_delayFromSchedule;
    self->_delayFromSchedule = (NSNumber *)&unk_24D21E128;
  }
  else
  {
    v7 = (NSNumber *)v4;
    delayFromSchedule = self->_delayFromSchedule;
    self->_delayFromSchedule = v7;
  }

}

- (NSNumber)delayFromSchedule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_scheduledTime && !self->_delayFromSchedule && (self->_actualTime || self->_estimatedTime))
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    -[FUFlightStep time](self, "time");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUStepTime date](self->_scheduledTime, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    objc_msgSend(v3, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightStep setDelayFromSchedule:](self, "setDelayFromSchedule:", v7);

  }
  return self->_delayFromSchedule;
}

- (unint64_t)status
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[FUFlightStep delayFromSchedule](self, "delayFromSchedule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "integerValue");
    v5 = 3;
    if (v4)
      v5 = 4;
    if (v4 >= 0)
      v6 = v5;
    else
      v6 = 2;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FUFlightStep gate](self, "gate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightStep terminal](self, "terminal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FlightEvent: gate:%@, airportTerminal:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v22;

  v22 = a3;
  -[FUFlightStep airport](self, "airport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FUFlightStep airport](self, "airport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v5, CFSTR("airport"));

  }
  -[FUFlightStep gate](self, "gate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FUFlightStep gate](self, "gate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v7, CFSTR("gate"));

  }
  -[FUFlightStep terminal](self, "terminal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FUFlightStep terminal](self, "terminal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v9, CFSTR("terminal"));

  }
  objc_msgSend(v22, "encodeInteger:forKey:", -[FUFlightStep legStatus](self, "legStatus"), CFSTR("legStatus"));
  -[FUFlightStep delayFromSchedule](self, "delayFromSchedule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FUFlightStep delayFromSchedule](self, "delayFromSchedule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v11, CFSTR("delayFromSchedule"));

  }
  -[FUFlightStep actualTime](self, "actualTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FUFlightStep actualTime](self, "actualTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v13, CFSTR("actualTime"));

  }
  -[FUFlightStep scheduledTime](self, "scheduledTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FUFlightStep scheduledTime](self, "scheduledTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v15, CFSTR("scheduledTime"));

  }
  -[FUFlightStep plannedTime](self, "plannedTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FUFlightStep plannedTime](self, "plannedTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v17, CFSTR("plannedTime"));

  }
  -[FUFlightStep estimatedTime](self, "estimatedTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[FUFlightStep estimatedTime](self, "estimatedTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v19, CFSTR("estimatedTime"));

  }
  -[FUFlightStep runwayTime](self, "runwayTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[FUFlightStep runwayTime](self, "runwayTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v21, CFSTR("runwayTime"));

  }
  objc_msgSend(v22, "encodeBool:forKey:", -[FUFlightStep departure](self, "departure"), CFSTR("departure"));

}

- (FUFlightStep)initWithCoder:(id)a3
{
  id v4;
  FUFlightStep *v5;
  uint64_t v6;
  FUAirport *airport;
  uint64_t v8;
  NSString *gate;
  uint64_t v10;
  NSString *terminal;
  uint64_t v12;
  NSNumber *delayFromSchedule;
  uint64_t v14;
  FUStepTime *actualTime;
  uint64_t v16;
  FUStepTime *scheduledTime;
  uint64_t v18;
  FUStepTime *plannedTime;
  uint64_t v20;
  FUStepTime *estimatedTime;
  uint64_t v22;
  FUStepTime *runwayTime;
  FUFlightStep *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FUFlightStep;
  v5 = -[FUFlightStep init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("airport"));
    v6 = objc_claimAutoreleasedReturnValue();
    airport = v5->_airport;
    v5->_airport = (FUAirport *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gate"));
    v8 = objc_claimAutoreleasedReturnValue();
    gate = v5->_gate;
    v5->_gate = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("terminal"));
    v10 = objc_claimAutoreleasedReturnValue();
    terminal = v5->_terminal;
    v5->_terminal = (NSString *)v10;

    v5->_legStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("legStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("delayFromSchedule"));
    v12 = objc_claimAutoreleasedReturnValue();
    delayFromSchedule = v5->_delayFromSchedule;
    v5->_delayFromSchedule = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actualTime"));
    v14 = objc_claimAutoreleasedReturnValue();
    actualTime = v5->_actualTime;
    v5->_actualTime = (FUStepTime *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduledTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    scheduledTime = v5->_scheduledTime;
    v5->_scheduledTime = (FUStepTime *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plannedTime"));
    v18 = objc_claimAutoreleasedReturnValue();
    plannedTime = v5->_plannedTime;
    v5->_plannedTime = (FUStepTime *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedTime"));
    v20 = objc_claimAutoreleasedReturnValue();
    estimatedTime = v5->_estimatedTime;
    v5->_estimatedTime = (FUStepTime *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runwayTime"));
    v22 = objc_claimAutoreleasedReturnValue();
    runwayTime = v5->_runwayTime;
    v5->_runwayTime = (FUStepTime *)v22;

    v5->_departure = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("departure"));
    v24 = v5;
  }

  return v5;
}

- (FUAirport)airport
{
  return (FUAirport *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAirport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)gate
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)terminal
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTerminal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)legStatus
{
  return self->_legStatus;
}

- (void)setLegStatus:(int64_t)a3
{
  self->_legStatus = a3;
}

- (FUStepTime)scheduledTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScheduledTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (FUStepTime)estimatedTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEstimatedTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (FUStepTime)actualTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActualTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (FUStepTime)runwayTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRunwayTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)departure
{
  return self->_departure;
}

- (void)setDeparture:(BOOL)a3
{
  self->_departure = a3;
}

- (FUStepTime)plannedTime
{
  return (FUStepTime *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPlannedTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plannedTime, 0);
  objc_storeStrong((id *)&self->_runwayTime, 0);
  objc_storeStrong((id *)&self->_actualTime, 0);
  objc_storeStrong((id *)&self->_estimatedTime, 0);
  objc_storeStrong((id *)&self->_scheduledTime, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_airport, 0);
  objc_storeStrong((id *)&self->_delayFromSchedule, 0);
}

@end
