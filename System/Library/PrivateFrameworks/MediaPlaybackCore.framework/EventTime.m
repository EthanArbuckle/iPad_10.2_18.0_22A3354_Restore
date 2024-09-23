@implementation EventTime

- (double)time
{
  return *(double *)self->time;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)hostTime
{
  int64_t v3;

  v3 = *(_QWORD *)&self[2].var1;
  retstr->var0 = self[1].var3;
  *(_QWORD *)&retstr->var1 = self[2].var0;
  retstr->var3 = v3;
  return self;
}

- (void)setTime:(double)a3
{
  *(double *)self->time = a3;
}

- (double)avTime
{
  return *(double *)self->avTime;
}

- (double)userSecondsSinceReferenceDate
{
  return *(double *)self->userSecondsSinceReferenceDate;
}

@end
