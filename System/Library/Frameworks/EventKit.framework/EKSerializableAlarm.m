@implementation EKSerializableAlarm

+ (id)classesForKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("relativeOffset");
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("absoluteDate");
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("isAbsolute");
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  v12[3] = CFSTR("isDefaultAlarm");
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (EKSerializableAlarm)initWithAlarm:(id)a3
{
  id v4;
  EKSerializableAlarm *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKSerializableAlarm;
  v5 = -[EKSerializableAlarm init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "relativeOffset");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableAlarm setRelativeOffset:](v5, "setRelativeOffset:", v7);

    objc_msgSend(v4, "absoluteDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableAlarm setAbsoluteDate:](v5, "setAbsoluteDate:", v8);

    -[EKSerializableAlarm setIsAbsolute:](v5, "setIsAbsolute:", objc_msgSend(v4, "isAbsolute"));
    -[EKSerializableAlarm setIsDefaultAlarm:](v5, "setIsDefaultAlarm:", objc_msgSend(v4, "isDefaultAlarm"));
  }

  return v5;
}

- (id)createAlarm:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[EKSerializableAlarm isDefaultAlarm](self, "isDefaultAlarm"))
  {
LABEL_5:
    if (-[EKSerializableAlarm isAbsolute](self, "isAbsolute"))
    {
      -[EKSerializableAlarm absoluteDate](self, "absoluteDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKAlarm alarmWithAbsoluteDate:](EKAlarm, "alarmWithAbsoluteDate:", v7);
    }
    else
    {
      -[EKSerializableAlarm relativeOffset](self, "relativeOffset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      +[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:");
    }
    a3 = (id *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a3, "setDefaultAlarm:", -[EKSerializableAlarm isDefaultAlarm](self, "isDefaultAlarm"));
    return a3;
  }
  -[EKSerializableAlarm relativeOffset](self, "relativeOffset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    goto LABEL_5;
  }
  -[EKSerializableAlarm absoluteDate](self, "absoluteDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_5;
  if (!a3)
    return a3;
  v10 = *MEMORY[0x1E0CB2D60];
  v11[0] = CFSTR("Either the relative offset or absolute date must be set.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, v9);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (NSNumber)relativeOffset
{
  return self->_relativeOffset;
}

- (void)setRelativeOffset:(id)a3
{
  objc_storeStrong((id *)&self->_relativeOffset, a3);
}

- (NSDate)absoluteDate
{
  return self->_absoluteDate;
}

- (void)setAbsoluteDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isAbsolute
{
  return self->_isAbsolute;
}

- (void)setIsAbsolute:(BOOL)a3
{
  self->_isAbsolute = a3;
}

- (BOOL)isDefaultAlarm
{
  return self->_isDefaultAlarm;
}

- (void)setIsDefaultAlarm:(BOOL)a3
{
  self->_isDefaultAlarm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absoluteDate, 0);
  objc_storeStrong((id *)&self->_relativeOffset, 0);
}

@end
