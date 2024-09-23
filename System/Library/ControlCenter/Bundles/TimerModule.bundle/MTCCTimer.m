@implementation MTCCTimer

- (void)setFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MTCCTimer)initWithMTTimer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  MTCCTimer *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;

  v4 = a3;
  v7 = objc_msgSend_state(v4, v5, v6);
  objc_msgSend_duration(v4, v8, v9);
  v13 = (MTCCTimer *)objc_msgSend_initWithState_duration_(self, v10, v7);
  if (v13)
  {
    objc_msgSend_timerID(v4, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimerID_(v13, v15, (uint64_t)v14);

    objc_msgSend_fireDate(v4, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFireDate_(v13, v19, (uint64_t)v18);

    objc_msgSend_remainingTime(v4, v20, v21);
    objc_msgSend_setRemainingTime_(v13, v22, v23);
    objc_msgSend_title(v4, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend_copy(v26, v27, v28);
    objc_msgSend_setTimerLabel_(v13, v30, (uint64_t)v29);

  }
  return v13;
}

- (MTCCTimer)initWithState:(unint64_t)a3 duration:(double)a4
{
  MTCCTimer *v6;
  const char *v7;
  MTCCTimer *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTCCTimer;
  v6 = -[MTCCTimer init](&v14, sel_init);
  v8 = v6;
  if (v6)
  {
    objc_msgSend_setState_(v6, v7, a3);
    objc_msgSend_setDuration_(v8, v9, v10, a4);
    objc_msgSend_setRemainingTime_(v8, v11, v12, a4);
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MTCCTimer *v4;
  MTCCTimer *v5;
  MTCCTimer *v6;
  MTCCTimer *v7;
  MTCCTimer *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  char isEqual;

  v4 = (MTCCTimer *)a3;
  v5 = v4;
  if (self == v4)
  {
    isEqual = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v11 = objc_msgSend_state(self, v9, v10);
    if (v11 == objc_msgSend_state(v8, v12, v13)
      && (objc_msgSend_duration(self, v14, v15), v17 = v16, objc_msgSend_duration(v8, v18, v19), v17 == v22)
      && (objc_msgSend_remainingTime(self, v20, v21), v24 = v23, objc_msgSend_remainingTime(v8, v25, v26), v24 == v29))
    {
      objc_msgSend_timerID(self, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timerID(v8, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v30, v34, (uint64_t)v33))
      {
        objc_msgSend_fireDate(self, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fireDate(v8, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v37, v41, (uint64_t)v40);

      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;

  objc_msgSend_duration(self, a2, v2);
  v5 = v4;
  objc_msgSend_remainingTime(self, v6, v7);
  v9 = v8;
  objc_msgSend_timerID(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_timerID(self, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_hash(v15, v16, v17);

  }
  else
  {
    v18 = 0;
  }

  objc_msgSend_fireDate(self, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend_fireDate(self, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_hash(v24, v25, v26);

  }
  else
  {
    v27 = 0;
  }
  v28 = (unint64_t)(v9 + (double)(31 * (unint64_t)(v5 + 31.0)));
  v29 = v27 - (v18 - v28 + 32 * v28) + 32 * (v18 - v28 + 32 * v28);

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;

  v4 = (void *)objc_opt_new();
  v7 = objc_msgSend_state(self, v5, v6);
  objc_msgSend_setState_(v4, v8, v7);
  objc_msgSend_duration(self, v9, v10);
  objc_msgSend_setDuration_(v4, v11, v12);
  objc_msgSend_fireDate(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFireDate_(v4, v16, (uint64_t)v15);

  objc_msgSend_remainingTime(self, v17, v18);
  objc_msgSend_setRemainingTime_(v4, v19, v20);
  objc_msgSend_timerLabel(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_copy(v23, v24, v25);
  objc_msgSend_setTimerLabel_(v4, v27, (uint64_t)v26);

  objc_msgSend_timerID(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimerID_(v4, v31, (uint64_t)v30);

  objc_msgSend_editingTimer(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEditingTimer_(v4, v35, (uint64_t)v34);

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (void)setTimerID:(id)a3
{
  objc_storeStrong((id *)&self->_timerID, a3);
}

- (NSString)timerLabel
{
  return self->_timerLabel;
}

- (void)setTimerLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MTCCTimer)editingTimer
{
  return self->_editingTimer;
}

- (void)setEditingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_editingTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingTimer, 0);
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
}

@end
