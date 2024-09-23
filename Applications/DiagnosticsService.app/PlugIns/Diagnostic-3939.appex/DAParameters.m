@implementation DAParameters

- (DAParameters)initWithDictionary:(id)a3
{
  id v4;
  DAParameters *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  objc_class *v12;
  uint64_t v13;
  objc_super v15;
  char v16;

  v4 = a3;
  v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)DAParameters;
  v5 = -[DASpecification initWithDictionary:](&v15, "initWithDictionary:", v4);
  if (!v5)
    goto LABEL_20;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("totalPressEvents"), &off_1000110F0, &off_100011108, 0, &v16));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("listenForInputTimeout"), &off_100011270, &off_100011280, 0, &v16));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("noInputTimeout"), &off_100011270, &off_100011280, 0, &v16));
  v9 = (void *)v8;
  if (v6)
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = !v10;
  if (!v10 && v7)
    goto LABEL_15;
  if (v11)
  {
    v5->_resetTimer = 1;
    v5->_totalPressEvents = objc_msgSend(v6, "intValue");
LABEL_12:
    objc_msgSend(v9, "doubleValue");
    v13 = 24;
LABEL_17:
    *(Class *)((char *)&v5->super.super.isa + v13) = v12;
    goto LABEL_18;
  }
  if (v6 && v7)
  {
LABEL_15:
    v5->_totalPressEvents = objc_msgSend(v6, "intValue");
    goto LABEL_16;
  }
  if (v8 && v7)
    goto LABEL_16;
  if (v6)
  {
    v5->_totalPressEvents = objc_msgSend(v6, "intValue");
  }
  else
  {
    if (v8)
    {
      v5->_resetTimer = 1;
      v5->_totalPressEvents = 1;
      goto LABEL_12;
    }
    if (v7)
    {
LABEL_16:
      objc_msgSend(v7, "doubleValue");
      v13 = 16;
      goto LABEL_17;
    }
    v5->_totalPressEvents = 1;
  }
LABEL_18:

  if (v16)
  {

    v5 = 0;
  }
LABEL_20:

  return v5;
}

- (int)totalPressEvents
{
  return self->_totalPressEvents;
}

- (void)setTotalPressEvents:(int)a3
{
  self->_totalPressEvents = a3;
}

- (double)listenForInputTimeout
{
  return self->_listenForInputTimeout;
}

- (void)setListenForInputTimeout:(double)a3
{
  self->_listenForInputTimeout = a3;
}

- (double)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(double)a3
{
  self->_noInputTimeout = a3;
}

- (BOOL)resetTimer
{
  return self->_resetTimer;
}

- (void)setResetTimer:(BOOL)a3
{
  self->_resetTimer = a3;
}

@end
