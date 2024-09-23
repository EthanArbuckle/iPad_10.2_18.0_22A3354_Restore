@implementation _DPHCMSWordRecord

- (_DPHCMSWordRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 sequenceBitIndex:(unsigned int)a7 plainFragment:(id)a8 fragment:(id)a9 fragmentHashIndex:(unsigned __int16)a10 fragmentBitIndex:(unsigned int)a11 fragmentPosition:(unsigned __int16)a12 creationDate:(double)a13 submitted:(BOOL)a14 objectId:(id)a15
{
  _DPHCMSWordRecord *result;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_DPHCMSWordRecord;
  BYTE4(v17) = a14;
  WORD1(v17) = a12;
  LOWORD(v17) = a10;
  result = -[_DPCMSWordRecord initWithKey:plainSequence:sequence:sequenceHashIndex:plainFragment:fragment:fragmentHashIndex:fragmentPosition:creationDate:submitted:objectId:](&v18, sel_initWithKey_plainSequence_sequence_sequenceHashIndex_plainFragment_fragment_fragmentHashIndex_fragmentPosition_creationDate_submitted_objectId_, a3, a4, a5, a6, a8, a9, a13, v17, a15);
  if (result)
  {
    result->_fragmentBitIndex = a11;
    result->_sequenceBitIndex = a7;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t fragmentBitIndex;
  uint64_t sequenceBitIndex;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)_DPHCMSWordRecord;
  fragmentBitIndex = self->_fragmentBitIndex;
  sequenceBitIndex = self->_sequenceBitIndex;
  -[_DPCMSWordRecord description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { fragmentBitIndex=%d ; sequenceBitIndex=%d ; %@ }"),
    v5,
    fragmentBitIndex,
    sequenceBitIndex,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entityName
{
  return CFSTR("HCMSWord");
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
        v8.super_class = (Class)_DPHCMSWordRecord,
        -[_DPCMSWordRecord copyToManagedObject:](&v8, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    objc_msgSend(v5, "setFragmentBitIndex:", -[_DPHCMSWordRecord fragmentBitIndex](self, "fragmentBitIndex"));
    objc_msgSend(v5, "setSequenceBitIndex:", -[_DPHCMSWordRecord sequenceBitIndex](self, "sequenceBitIndex"));

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
  id v5;
  uint64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)_DPHCMSWordRecord,
        -[_DPCMSWordRecord copyFromManagedObject:](&v9, sel_copyFromManagedObject_, v4)))
  {
    v5 = v4;
    -[_DPHCMSWordRecord setFragmentBitIndex:](self, "setFragmentBitIndex:", objc_msgSend(v5, "fragmentBitIndex"));
    v6 = objc_msgSend(v5, "sequenceBitIndex");

    -[_DPHCMSWordRecord setSequenceBitIndex:](self, "setSequenceBitIndex:", v6);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)jsonString
{
  void *v3;
  unsigned __int16 v4;
  uint64_t v5;
  void *v6;
  unsigned __int16 v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_DPHCMSWordRecord;
  -[_DPCMSSequenceRecord sequence](&v16, sel_sequence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)_DPHCMSWordRecord;
  v4 = -[_DPCMSSequenceRecord sequenceHashIndex](&v15, sel_sequenceHashIndex);
  v5 = -[_DPHCMSWordRecord sequenceBitIndex](self, "sequenceBitIndex");
  v14.receiver = self;
  v14.super_class = (Class)_DPHCMSWordRecord;
  -[_DPCMSWordRecord fragment](&v14, sel_fragment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)_DPHCMSWordRecord;
  v7 = -[_DPCMSWordRecord fragmentHashIndex](&v13, sel_fragmentHashIndex);
  v8 = -[_DPHCMSWordRecord fragmentBitIndex](self, "fragmentBitIndex");
  v12.receiver = self;
  v12.super_class = (Class)_DPHCMSWordRecord;
  LOWORD(v11) = -[_DPCMSWordRecord fragmentPosition](&v12, sel_fragmentPosition);
  +[_DPHCMSSample jsonStringFromSequence:sequenceHashIndex:sequencebitIndex:fragment:fragmentHashIndex:fragmentbitIndex:fragmentPosition:](_DPHCMSSample, "jsonStringFromSequence:sequenceHashIndex:sequencebitIndex:fragment:fragmentHashIndex:fragmentbitIndex:fragmentPosition:", v3, v4, v5, v6, v7, v8, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)fragmentBitIndex
{
  return self->_fragmentBitIndex;
}

- (void)setFragmentBitIndex:(int)a3
{
  self->_fragmentBitIndex = a3;
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
