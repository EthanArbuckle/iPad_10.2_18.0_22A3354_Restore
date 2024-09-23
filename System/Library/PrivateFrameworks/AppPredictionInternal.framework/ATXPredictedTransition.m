@implementation ATXPredictedTransition

- (id)transitionArrayForDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
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
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXPredictedTransition date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0D15C58], "locationOfInterestUUIDKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  -[ATXPredictedTransition loi](self, "loi");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0D15C58], "locationOfInterestTypeKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXPredictedTransition loi](self, "loi");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  objc_msgSend(MEMORY[0x1E0D15C58], "transitionWithinTimeIntervalKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (ATXPredictedTransition)initWithDate:(id)a3 loi:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ATXPredictedTransition *v10;
  ATXPredictedTransition *v11;
  id *p_isa;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    if (objc_msgSend(v8, "type") && objc_msgSend(v9, "type") != 1)
    {
      v10 = 0;
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)ATXPredictedTransition;
      v11 = -[ATXPredictedTransition init](&v14, sel_init);
      p_isa = (id *)&v11->super.isa;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_date, a3);
        objc_storeStrong(p_isa + 2, a4);
      }
      self = p_isa;
      v10 = self;
    }
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D80DC8], "stringForLOIType:", -[ATXLocationOfInterest type](self->_loi, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transition to %@ at %@"), v3, self->_date);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)date
{
  return self->_date;
}

- (ATXLocationOfInterest)loi
{
  return self->_loi;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loi, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
