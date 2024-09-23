@implementation _DPHCMSSequenceRecord

- (_DPHCMSSequenceRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 sequenceBitIndex:(unsigned int)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10
{
  _DPHCMSSequenceRecord *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DPHCMSSequenceRecord;
  result = -[_DPCMSSequenceRecord initWithKey:plainSequence:sequence:sequenceHashIndex:creationDate:submitted:objectId:](&v12, sel_initWithKey_plainSequence_sequence_sequenceHashIndex_creationDate_submitted_objectId_, a3, a4, a5, a6, a9, a10, a8);
  if (result)
    result->_sequenceBitIndex = a7;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t sequenceBitIndex;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)_DPHCMSSequenceRecord;
  sequenceBitIndex = self->_sequenceBitIndex;
  -[_DPCMSSequenceRecord description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { sequenceBitIndex=%d ; %@ }"), v5, sequenceBitIndex, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entityName
{
  return CFSTR("HCMSSequence");
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)_DPHCMSSequenceRecord,
        -[_DPCMSSequenceRecord copyToManagedObject:](&v8, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    objc_msgSend(v5, "setSequenceBitIndex:", -[_DPHCMSSequenceRecord sequenceBitIndex](self, "sequenceBitIndex"));

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)_DPHCMSSequenceRecord,
        -[_DPCMSSequenceRecord copyFromManagedObject:](&v7, sel_copyFromManagedObject_, v4)))
  {
    -[_DPHCMSSequenceRecord setSequenceBitIndex:](self, "setSequenceBitIndex:", objc_msgSend(v4, "sequenceBitIndex"));
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)jsonString
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DPHCMSSequenceRecord;
  -[_DPCMSSequenceRecord sequence](&v7, sel_sequence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)_DPHCMSSequenceRecord;
  +[_DPHCMSSample jsonStringFrom:hashIndex:bitIndex:](_DPHCMSSample, "jsonStringFrom:hashIndex:bitIndex:", v3, -[_DPCMSSequenceRecord sequenceHashIndex](&v6, sel_sequenceHashIndex), -[_DPHCMSSequenceRecord sequenceBitIndex](self, "sequenceBitIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)sequenceBitIndex
{
  return self->_sequenceBitIndex;
}

- (void)setSequenceBitIndex:(int)a3
{
  self->_sequenceBitIndex = a3;
}

@end
