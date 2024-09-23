@implementation _HDWorkoutCondenserBufferDatum

- (_HDWorkoutCondenserBufferDatum)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_HDWorkoutCondenserBufferDatum;
  -[_HDWorkoutCondenserBufferDatum description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_UUIDBytes);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@, %f, %f, %f, %d>"), v4, v5, *(_QWORD *)&self->_startTime, *(_QWORD *)&self->_endTime, *(_QWORD *)&self->_value, self->_isSeries);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
