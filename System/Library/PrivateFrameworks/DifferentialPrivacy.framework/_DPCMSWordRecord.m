@implementation _DPCMSWordRecord

- (_DPCMSWordRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 plainFragment:(id)a7 fragment:(id)a8 fragmentHashIndex:(unsigned __int16)a9 fragmentPosition:(unsigned __int16)a10 creationDate:(double)a11 submitted:(BOOL)a12 objectId:(id)a13
{
  uint64_t v15;
  id v20;
  _DPCMSWordRecord *v21;
  _DPCMSWordRecord *v22;
  NSString *plainFragment;
  objc_super v25;

  v15 = a6;
  v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_DPCMSWordRecord;
  v21 = -[_DPCMSSequenceRecord initWithKey:plainSequence:sequence:sequenceHashIndex:creationDate:submitted:objectId:](&v25, sel_initWithKey_plainSequence_sequence_sequenceHashIndex_creationDate_submitted_objectId_, a3, a4, a5, v15, a12, a13, a11);
  v22 = v21;
  if (v21)
  {
    plainFragment = v21->_plainFragment;
    v21->_plainFragment = 0;

    v22->_fragmentHashIndex = a9;
    v22->_fragmentPosition = a10;
    objc_storeStrong((id *)&v22->_fragment, a8);
  }

  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t fragmentPosition;
  uint64_t fragmentHashIndex;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1D8256B78](self, a2);
  v4 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: { "), v6);

  fragmentPosition = self->_fragmentPosition;
  fragmentHashIndex = self->_fragmentHashIndex;
  v9 = -[NSData hash](self->_fragment, "hash");
  v13.receiver = self;
  v13.super_class = (Class)_DPCMSWordRecord;
  -[_DPCMSSequenceRecord description](&v13, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("fragmentPosition=%d ; fragmentHashIndex=%ld ; fragment=%lu %@ }"),
    fragmentPosition,
    fragmentHashIndex,
    v9,
    v10);

  v11 = (void *)objc_msgSend(v4, "copy");
  objc_autoreleasePoolPop(v3);
  return v11;
}

+ (id)entityName
{
  return CFSTR("CMSWord");
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
        v10.super_class = (Class)_DPCMSWordRecord,
        -[_DPCMSSequenceRecord copyToManagedObject:](&v10, sel_copyToManagedObject_, v4)))
  {
    v5 = v4;
    -[_DPCMSWordRecord plainFragment](self, "plainFragment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlainFragment:", v6);

    -[_DPCMSWordRecord fragment](self, "fragment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFragment:", v7);

    objc_msgSend(v5, "setFragmentPosition:", -[_DPCMSWordRecord fragmentPosition](self, "fragmentPosition"));
    objc_msgSend(v5, "setFragmentHashIndex:", -[_DPCMSWordRecord fragmentHashIndex](self, "fragmentHashIndex"));

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
        v11.super_class = (Class)_DPCMSWordRecord,
        -[_DPCMSSequenceRecord copyFromManagedObject:](&v11, sel_copyFromManagedObject_, v4)))
  {
    v5 = v4;
    objc_msgSend(v5, "plainFragment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPCMSWordRecord setPlainFragment:](self, "setPlainFragment:", v6);

    objc_msgSend(v5, "fragment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPCMSWordRecord setFragment:](self, "setFragment:", v7);

    -[_DPCMSWordRecord setFragmentPosition:](self, "setFragmentPosition:", objc_msgSend(v5, "fragmentPosition"));
    v8 = objc_msgSend(v5, "fragmentHashIndex");

    -[_DPCMSWordRecord setFragmentHashIndex:](self, "setFragmentHashIndex:", v8);
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
  void *v5;
  objc_super v7;
  objc_super v8;

  v3 = (void *)MEMORY[0x1D8256B78](self, a2);
  v8.receiver = self;
  v8.super_class = (Class)_DPCMSWordRecord;
  -[_DPCMSSequenceRecord sequence](&v8, sel_sequence);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_DPCMSWordRecord;
  +[_DPCMSSample jsonStringFromSequence:sequenceHashIndex:fragment:fragmentHashIndex:fragmentPosition:](_DPCMSSample, "jsonStringFromSequence:sequenceHashIndex:fragment:fragmentHashIndex:fragmentPosition:", v4, (unsigned __int16)-[_DPCMSSequenceRecord sequenceHashIndex](&v7, sel_sequenceHashIndex), self->_fragment, (unsigned __int16)self->_fragmentHashIndex, (unsigned __int16)self->_fragmentPosition);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (NSData)fragment
{
  return self->_fragment;
}

- (void)setFragment:(id)a3
{
  objc_storeStrong((id *)&self->_fragment, a3);
}

- (signed)fragmentPosition
{
  return self->_fragmentPosition;
}

- (void)setFragmentPosition:(signed __int16)a3
{
  self->_fragmentPosition = a3;
}

- (signed)fragmentHashIndex
{
  return self->_fragmentHashIndex;
}

- (void)setFragmentHashIndex:(signed __int16)a3
{
  self->_fragmentHashIndex = a3;
}

- (NSString)plainFragment
{
  return self->_plainFragment;
}

- (void)setPlainFragment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainFragment, 0);
  objc_storeStrong((id *)&self->_fragment, 0);
}

@end
