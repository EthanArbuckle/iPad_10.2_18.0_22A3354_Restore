@implementation MTStopwatch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTStopwatch)init
{
  void *v3;
  void *v4;
  MTStopwatch *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTStopwatch initWithId:](self, "initWithId:", v4);

  return v5;
}

- (MTStopwatch)initWithId:(id)a3
{
  id v4;
  MTStopwatch *v5;
  MTStopwatch *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTStopwatch;
  v5 = -[MTStopwatch init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MTStopwatch setIdentifier:](v5, "setIdentifier:", v4);
    -[MTStopwatch commonInit](v6, "commonInit");
  }

  return v6;
}

- (void)commonInit
{
  void *v3;

  -[MTStopwatch setOffset:](self, "setOffset:", 0.0);
  -[MTStopwatch setCurrentInterval:](self, "setCurrentInterval:", 0.0);
  -[MTStopwatch setPreviousLapsTotalInterval:](self, "setPreviousLapsTotalInterval:", 0.0);
  v3 = (void *)objc_opt_new();
  -[MTStopwatch setLaps:](self, "setLaps:", v3);

  -[MTStopwatch setState:](self, "setState:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MTStopwatch identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("MTStopwatchIdentifier"));

  -[MTStopwatch title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("MTStopwatchTitle"));

  -[MTStopwatch startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("MTStopwatchStartDate"));

  -[MTStopwatch offset](self, "offset");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("MTStopwatchOffset"));
  -[MTStopwatch currentInterval](self, "currentInterval");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("MTStopwatchCurrentInterval"));
  -[MTStopwatch previousLapsTotalInterval](self, "previousLapsTotalInterval");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("MTStopwatchPreviousLapsTotalInterval"));
  -[MTStopwatch laps](self, "laps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("MTStopwatchLaps"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[MTStopwatch state](self, "state"), CFSTR("MTStopwatchState"));
}

- (MTStopwatch)initWithCoder:(id)a3
{
  id v4;
  MTStopwatch *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTStopwatch;
  v5 = -[MTStopwatch init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTStopwatchIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStopwatch setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTStopwatchTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStopwatch setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTStopwatchStartDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStopwatch setStartDate:](v5, "setStartDate:", v8);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MTStopwatchOffset"));
    -[MTStopwatch setOffset:](v5, "setOffset:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MTStopwatchCurrentInterval"));
    -[MTStopwatch setCurrentInterval:](v5, "setCurrentInterval:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MTStopwatchPreviousLapsTotalInterval"));
    -[MTStopwatch setPreviousLapsTotalInterval:](v5, "setPreviousLapsTotalInterval:");
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("MTStopwatchLaps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStopwatch setLaps:](v5, "setLaps:", v12);

    -[MTStopwatch setState:](v5, "setState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTStopwatchState")));
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MTMutableStopwatch *v4;
  void *v5;

  v4 = -[MTStopwatch init](+[MTMutableStopwatch allocWithZone:](MTMutableStopwatch, "allocWithZone:", a3), "init");
  -[MTStopwatch identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStopwatch setIdentifier:](v4, "setIdentifier:", v5);

  -[MTStopwatch _copyStateOntoStopwatch:](self, "_copyStateOntoStopwatch:", v4);
  return v4;
}

- (void)_copyStateOntoStopwatch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MTStopwatch title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v4);

  -[MTStopwatch startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStartDate:", v5);

  -[MTStopwatch offset](self, "offset");
  objc_msgSend(v7, "setOffset:");
  -[MTStopwatch currentInterval](self, "currentInterval");
  objc_msgSend(v7, "setCurrentInterval:");
  -[MTStopwatch previousLapsTotalInterval](self, "previousLapsTotalInterval");
  objc_msgSend(v7, "setPreviousLapsTotalInterval:");
  -[MTStopwatch laps](self, "laps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLaps:", v6);

  objc_msgSend(v7, "setState:", -[MTStopwatch state](self, "state"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = -[MTStopwatch _isEqualToStopwatch:](self, "_isEqualToStopwatch:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)_isEqualToStopwatch:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  BOOL v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStopwatch identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStopwatch identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      v14 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v44 = v9;
    v45 = v8;
  }
  objc_msgSend(v5, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStopwatch title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
  {
LABEL_8:
    objc_msgSend(v5, "laps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStopwatch laps](self, "laps");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {
      v40 = v15;
    }
    else
    {
      objc_msgSend(v5, "laps");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTStopwatch laps](self, "laps");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "isEqual:", v3))
      {
        v14 = 0;
LABEL_27:

LABEL_28:
        v13 = v42;
        v12 = v43;
        if (v10 == v11)
          goto LABEL_30;
        goto LABEL_29;
      }
      v39 = v17;
      v40 = v15;
    }
    objc_msgSend(v5, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStopwatch startDate](self, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v3;
    if (v18 != v19)
    {
      v36 = v11;
      v20 = v18;
      v21 = v10;
      v22 = v16;
      objc_msgSend(v5, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTStopwatch startDate](self, "startDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v23;
      if (!objc_msgSend(v23, "isEqual:"))
      {
        v14 = 0;
        v16 = v22;
        v10 = v21;
        v18 = v20;
        v11 = v36;
        goto LABEL_25;
      }
      v16 = v22;
      v10 = v21;
      v18 = v20;
      v11 = v36;
    }
    objc_msgSend(v5, "offset");
    v25 = v24;
    -[MTStopwatch offset](self, "offset");
    if (v25 == v26
      && (objc_msgSend(v5, "currentInterval"),
          v28 = v27,
          -[MTStopwatch currentInterval](self, "currentInterval"),
          v28 == v29)
      && (objc_msgSend(v5, "previousLapsTotalInterval"),
          v31 = v30,
          -[MTStopwatch previousLapsTotalInterval](self, "previousLapsTotalInterval"),
          v31 == v32))
    {
      v33 = objc_msgSend(v5, "state");
      v14 = v33 == -[MTStopwatch state](self, "state");
      v34 = v14;
    }
    else
    {
      v14 = 0;
      v34 = 0;
    }
    if (v18 == v19)
    {

      v14 = v34;
      goto LABEL_26;
    }
LABEL_25:

LABEL_26:
    v17 = v39;
    v15 = v40;
    v3 = v41;
    if (v40 == v16)
      goto LABEL_28;
    goto LABEL_27;
  }
  objc_msgSend(v5, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStopwatch title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqual:", v13))
  {
    v42 = v13;
    v43 = v12;
    goto LABEL_8;
  }
  v14 = 0;
LABEL_29:

LABEL_30:
  v9 = v44;
  v8 = v45;
  if (v6 != v7)
    goto LABEL_31;
LABEL_32:

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTStopwatch hashString](self, "hashString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTStopwatch identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "descriptionForState:", -[MTStopwatch state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStopwatch startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStopwatch offset](self, "offset");
  v9 = v8;
  -[MTStopwatch currentInterval](self, "currentInterval");
  v11 = v10;
  -[MTStopwatch previousLapsTotalInterval](self, "previousLapsTotalInterval");
  v13 = v12;
  -[MTStopwatch laps](self, "laps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStopwatch title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, id:%@, state:%@, startDate:%@, offset:%f, currentInterval:%f, previousLapsTotalInterval:%f, laps:%@, title:%@>"), v4, self, v5, v6, v7, v9, v11, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

+ (id)descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Invalid State");
  else
    return off_1E39CDAC8[a3];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (void)setCurrentInterval:(double)a3
{
  self->_currentInterval = a3;
}

- (double)previousLapsTotalInterval
{
  return self->_previousLapsTotalInterval;
}

- (void)setPreviousLapsTotalInterval:(double)a3
{
  self->_previousLapsTotalInterval = a3;
}

- (NSArray)laps
{
  return self->_laps;
}

- (void)setLaps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laps, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
