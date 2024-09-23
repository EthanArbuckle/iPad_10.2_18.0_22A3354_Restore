@implementation _DPCMSSequenceRecord

- (_DPCMSSequenceRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9
{
  _BOOL8 v10;
  id v16;
  _DPCMSSequenceRecord *v17;
  _DPCMSSequenceRecord *v18;
  NSString *plainSequence;
  objc_super v21;

  v10 = a8;
  v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_DPCMSSequenceRecord;
  v17 = -[_DPCMSRecord initWithKey:creationDate:submitted:objectId:](&v21, sel_initWithKey_creationDate_submitted_objectId_, a3, v10, a9, a7);
  v18 = v17;
  if (v17)
  {
    plainSequence = v17->_plainSequence;
    v17->_plainSequence = 0;

    objc_storeStrong((id *)&v18->_sequence, a5);
    v18->_sequenceHashIndex = a6;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t sequenceHashIndex;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1D8256B78](self, a2);
  v4 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: { "), v6);

  sequenceHashIndex = self->_sequenceHashIndex;
  v8 = -[NSData hash](self->_sequence, "hash");
  v12.receiver = self;
  v12.super_class = (Class)_DPCMSSequenceRecord;
  -[_DPCMSRecord description](&v12, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("sequenceHashIndex=%d ; sequence=%ld  ; %@ }"), sequenceHashIndex, v8, v9);

  v10 = (void *)objc_msgSend(v4, "copy");
  objc_autoreleasePoolPop(v3);
  return v10;
}

+ (id)entityName
{
  return CFSTR("CMSSequence");
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)_DPCMSSequenceRecord,
        -[_DPCMSRecord copyToManagedObject:](&v10, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    -[_DPCMSSequenceRecord plainSequence](self, "plainSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlainSequence:", v6);

    -[_DPCMSSequenceRecord sequence](self, "sequence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSequence:", v7);

    objc_msgSend(v5, "setSequenceHashIndex:", -[_DPCMSSequenceRecord sequenceHashIndex](self, "sequenceHashIndex"));
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v11.receiver = self,
        v11.super_class = (Class)_DPCMSSequenceRecord,
        -[_DPCMSRecord copyFromManagedObject:](&v11, sel_copyFromManagedObject_, v4)))
  {
    v5 = v4;
    objc_msgSend(v5, "plainSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPCMSSequenceRecord setPlainSequence:](self, "setPlainSequence:", v6);

    objc_msgSend(v5, "sequence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPCMSSequenceRecord setSequence:](self, "setSequence:", v7);

    v8 = objc_msgSend(v5, "sequenceHashIndex");
    -[_DPCMSSequenceRecord setSequenceHashIndex:](self, "setSequenceHashIndex:", v8);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)jsonString
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1D8256B78](self, a2);
  +[_DPCMSSample jsonStringFrom:hashIndex:](_DPCMSSample, "jsonStringFrom:hashIndex:", self->_sequence, self->_sequenceHashIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (NSData)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
  objc_storeStrong((id *)&self->_sequence, a3);
}

- (signed)sequenceHashIndex
{
  return self->_sequenceHashIndex;
}

- (void)setSequenceHashIndex:(signed __int16)a3
{
  self->_sequenceHashIndex = a3;
}

- (NSString)plainSequence
{
  return self->_plainSequence;
}

- (void)setPlainSequence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainSequence, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
