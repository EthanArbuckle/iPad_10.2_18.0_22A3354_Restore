@implementation DurationGroup

- (DurationGroup)initWithStart:(id)a3 end:(id)a4
{
  id v7;
  id v8;
  DurationGroup *v9;
  DurationGroup *v10;
  uint64_t v11;

  v7 = a3;
  v8 = a4;
  v9 = -[DurationGroup init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong((id *)&v10->_end, a4);
    v11 = initWithStart_end__ident++;
    v10->_groupId = v11;
  }

  return v10;
}

- (id)description
{
  void *v3;
  unint64_t groupId;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  groupId = self->_groupId;
  -[NSDate timeIntervalSinceReferenceDate](self->_start, "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[NSDate timeIntervalSinceReferenceDate](self->_end, "timeIntervalSinceReferenceDate");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("id: %lu, start: %flll, stop: %flll"), groupId, v6, v7);
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)wasChanged
{
  return self->_wasChanged;
}

- (void)setWasChanged:(BOOL)a3
{
  self->_wasChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
