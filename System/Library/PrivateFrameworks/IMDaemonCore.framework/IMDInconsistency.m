@implementation IMDInconsistency

- (IMDInconsistency)init
{
  IMDInconsistency *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMDInconsistency;
  v2 = -[IMDInconsistency init](&v4, sel_init);
  if (v2)
    v2->_firstOccurrence = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  return v2;
}

- (void)setContext:(id)a3
{

  self->_contextWeakReference = 0;
  if (a3)
    self->_contextWeakReference = (CUTWeakReference *)(id)objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", a3);
}

- (id)context
{
  return (id)-[CUTWeakReference object](self->_contextWeakReference, "object");
}

- (BOOL)shouldJettison:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  __CFString *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = -[IMDInconsistency context](self, "context");
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = v6;
    if (qword_1EFC63DC8
      && (objc_msgSend(v6, "timeIntervalSinceReferenceDate"),
          v9 = v8,
          objc_msgSend((id)qword_1EFC63DC8, "timeIntervalSinceReferenceDate"),
          v9 - v10 < 600.0))
    {
      LOBYTE(v5) = 0;
      if (a3)
      {
        v11 = CFSTR("Not enough time passed since last jettison");
LABEL_14:
        *a3 = v11;
      }
    }
    else if (-[IMDInconsistency count](self, "count") < 6)
    {
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v13 = v12;
      -[NSDate timeIntervalSinceReferenceDate](-[IMDInconsistency firstOccurrence](self, "firstOccurrence"), "timeIntervalSinceReferenceDate");
      v15 = v13 - v14;
      LOBYTE(v5) = v15 > 60.0;
      v11 = CFSTR("Max time or occurrences not yet met");
      if (v15 > 60.0)
        v11 = CFSTR("Max time since failure occurrence exceeded");
      if (a3)
        goto LABEL_14;
    }
    else
    {
      LOBYTE(v5) = 1;
      if (a3)
      {
        v11 = CFSTR("Max number of failure occurrences exceeded");
        goto LABEL_14;
      }
    }
  }
  else if (a3)
  {
    v11 = CFSTR("Context has expired");
    goto LABEL_14;
  }
  return (char)v5;
}

- (NSDate)firstOccurrence
{
  return self->_firstOccurrence;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end
