@implementation _NSISVariableObservable

+ (id)observableForVariable:(id)a3 inEngine:(id)a4
{
  return -[_NSISVariableObservable initWithVariable:inEngine:]([_NSISVariableObservable alloc], a3, (uint64_t)a4);
}

- (_QWORD)initWithVariable:(uint64_t)a3 inEngine:
{
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_NSISVariableObservable;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[9] = a3;
    v5[8] = a2;
    v6[7] = 0x7FF8000000000000;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSISVariableObservable;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

- (void)receiveObservedValue:(id)a3
{
  *((_BYTE *)self + 80) |= 2u;
}

- (BOOL)valueHasChanged
{
  return (*((unsigned __int8 *)self + 80) >> 1) & 1;
}

- (void)emitValueIfNeeded
{
  double lastValue;
  double v4;
  char v5;
  uint64_t v6;
  objc_super v7;
  double v8;

  if ((*((_BYTE *)self + 80) & 2) != 0)
  {
    v8 = 0.0;
    if (!-[NSISEngine hasValue:forVariable:](self->_associatedEngine, "hasValue:forVariable:", &v8, self->_variable))
    {
      self->_lastValue = NAN;
      v5 = *((_BYTE *)self + 80) | 2;
LABEL_13:
      *((_BYTE *)self + 80) = v5;
      return;
    }
    lastValue = self->_lastValue;
    if (lastValue == 0.0)
    {
      v4 = fabs(v8);
    }
    else
    {
      if (v8 != 0.0)
      {
        if (vabdd_f64(lastValue, v8) < fabs(lastValue) * *(double *)&NSISEpsilon)
          goto LABEL_9;
        goto LABEL_11;
      }
      v4 = fabs(lastValue);
    }
    if (v4 < *(double *)&NSISEpsilon)
    {
LABEL_9:
      self->_lastValue = v8;
LABEL_12:
      v5 = *((_BYTE *)self + 80) & 0xFD;
      goto LABEL_13;
    }
LABEL_11:
    self->_lastValue = v8;
    v6 = *MEMORY[0x1E0C9AE50];
    v7.receiver = self;
    v7.super_class = (Class)_NSISVariableObservable;
    -[_NSISVariableObservable receiveObservedValue:](&v7, sel_receiveObservedValue_, v6);
    goto LABEL_12;
  }
}

@end
