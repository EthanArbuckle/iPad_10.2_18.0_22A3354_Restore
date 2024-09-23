@implementation _DPOBHSequenceRecord

- (_DPOBHSequenceRecord)initWithKey:(id)a3 sequence:(id)a4 bitPosition:(int64_t)a5 bitValue:(BOOL)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9
{
  _DPOBHSequenceRecord *v11;
  _DPOBHSequenceRecord *v12;
  NSString *plainSequence;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_DPOBHSequenceRecord;
  v11 = -[_DPOBHRecord initWithKey:creationDate:submitted:objectId:](&v15, sel_initWithKey_creationDate_submitted_objectId_, a3, a8, a9, a7);
  v12 = v11;
  if (v11)
  {
    v11->_sequenceBitPosition = a5;
    v11->_sequenceBitValue = a6;
    plainSequence = v11->_plainSequence;
    v11->_plainSequence = 0;

  }
  return v12;
}

+ (id)recordWithKey:(id)a3 sequence:(id)a4 bitPosition:(int64_t)a5 bitValue:(BOOL)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  void *v19;

  v9 = a8;
  v11 = a6;
  v16 = a9;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:sequence:bitPosition:bitValue:creationDate:submitted:objectId:", v18, v17, a5, v11, v9, v16, a7);

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1D8256B78](self, a2);
  v4 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: { "), v6);

  if (self->_sequenceBitValue)
    v7 = CFSTR("+1");
  else
    v7 = CFSTR("-1");
  objc_msgSend(v4, "appendFormat:", CFSTR("sequenceBitPosition=%lld ; sequenceBitValue=%@ ; "),
    self->_sequenceBitPosition,
    v7);
  v11.receiver = self;
  v11.super_class = (Class)_DPOBHSequenceRecord;
  -[_DPOBHRecord description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@ }"), v8);

  v9 = (void *)objc_msgSend(v4, "copy");
  objc_autoreleasePoolPop(v3);
  return v9;
}

+ (id)entityName
{
  return CFSTR("OBHSequence");
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)_DPOBHSequenceRecord,
        -[_DPOBHRecord copyToManagedObject:](&v9, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    -[_DPOBHSequenceRecord plainSequence](self, "plainSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlainSequence:", v6);

    objc_msgSend(v5, "setSequenceBitPosition:", -[_DPOBHSequenceRecord sequenceBitPosition](self, "sequenceBitPosition"));
    objc_msgSend(v5, "setSequenceBitValue:", -[_DPOBHSequenceRecord sequenceBitValue](self, "sequenceBitValue"));

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)_DPOBHSequenceRecord,
        -[_DPOBHRecord copyFromManagedObject:](&v10, sel_copyFromManagedObject_, v4)))
  {
    v5 = v4;
    objc_msgSend(v5, "plainSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPOBHSequenceRecord setPlainSequence:](self, "setPlainSequence:", v6);

    -[_DPOBHSequenceRecord setSequenceBitPosition:](self, "setSequenceBitPosition:", objc_msgSend(v5, "sequenceBitPosition"));
    v7 = objc_msgSend(v5, "sequenceBitValue");

    -[_DPOBHSequenceRecord setSequenceBitValue:](self, "setSequenceBitValue:", v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)jsonString
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[_DPOBHSequenceRecord sequenceBitPosition](self, "sequenceBitPosition");
  v5 = -[_DPOBHSequenceRecord sequenceBitValue](self, "sequenceBitValue");
  v6 = CFSTR("-1");
  if (v5)
    v6 = CFSTR("+1");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%lld,%@\"), v4, v6);
}

- (int64_t)sequenceBitPosition
{
  return self->_sequenceBitPosition;
}

- (void)setSequenceBitPosition:(int64_t)a3
{
  self->_sequenceBitPosition = a3;
}

- (BOOL)sequenceBitValue
{
  return self->_sequenceBitValue;
}

- (void)setSequenceBitValue:(BOOL)a3
{
  self->_sequenceBitValue = a3;
}

- (NSString)plainSequence
{
  return self->_plainSequence;
}

- (void)setPlainSequence:(id)a3
{
  objc_storeStrong((id *)&self->_plainSequence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainSequence, 0);
}

@end
