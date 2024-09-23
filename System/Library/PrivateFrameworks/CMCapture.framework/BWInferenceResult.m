@implementation BWInferenceResult

- (BWInferenceResult)initWithInferenceType:(int)a3 preventionReason:(id)a4 atTimestamp:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a5;
  return (BWInferenceResult *)-[BWInferenceResult initWithInferenceType:inferences:preventionReason:atTimestamp:](self, a3, 0, a4, (__int128 *)&v6.var0);
}

- (char)initWithInferenceType:(void *)a3 inferences:(void *)a4 preventionReason:(__int128 *)a5 atTimestamp:
{
  char *v9;
  char *v10;
  __int128 v11;
  objc_super v13;

  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)BWInferenceResult;
  v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    *((_DWORD *)v9 + 2) = a2;
    v11 = *a5;
    *(_QWORD *)(v9 + 28) = *((_QWORD *)a5 + 2);
    *(_OWORD *)(v9 + 12) = v11;
    *((_QWORD *)v9 + 5) = objc_msgSend(a3, "copy");
    *((_QWORD *)v10 + 6) = objc_msgSend(a4, "copy");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceResult;
  -[BWInferenceResult dealloc](&v3, sel_dealloc);
}

- (NSString)preventionReason
{
  return self->_preventionReason;
}

- (BWInferenceResult)initWithInferenceType:(int)a3 inferences:(id)a4 atTimestamp:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a5;
  return (BWInferenceResult *)-[BWInferenceResult initWithInferenceType:inferences:preventionReason:atTimestamp:](self, a3, a4, 0, (__int128 *)&v6.var0);
}

- (BWInferenceResult)initWithResult:(id)a3 replacementInferences:(id)a4 replacementPreventionReason:(id)a5
{
  int v9;
  __int128 v11;
  uint64_t v12;

  v9 = objc_msgSend(a3, "inferenceType");
  if (a3)
  {
    objc_msgSend(a3, "timestamp");
  }
  else
  {
    v11 = 0uLL;
    v12 = 0;
  }
  return (BWInferenceResult *)-[BWInferenceResult initWithInferenceType:inferences:preventionReason:atTimestamp:](self, v9, a4, a5, &v11);
}

- (BOOL)isValid
{
  NSUInteger v2;

  if ((self->_timestamp.timescale & 1) != 0)
  {
    v2 = -[NSDictionary count](self->_inferences, "count");
    if (v2)
      LOBYTE(v2) = self->_preventionReason == 0;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = BWInferenceTypeDescription(self->_inferenceType);
  if (-[BWInferenceResult isValid](self, "isValid"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> inferenceType: \"%@\", isValid: %@, inferences: %lu (keys: %@), preventionReason: %@"), v4, self, v5, v6, -[NSDictionary count](self->_inferences, "count"), -[NSDictionary allKeys](self->_inferences, "allKeys"), self->_preventionReason);
}

- (int)inferenceType
{
  return self->_inferenceType;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (NSDictionary)inferences
{
  return self->_inferences;
}

@end
