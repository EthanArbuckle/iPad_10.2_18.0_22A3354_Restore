@implementation MIOSequenceConstraint

- (MIOSequenceConstraint)initWithSpecification:(const void *)a3
{
  char *v4;
  MIOSequenceConstraint *v5;
  int v6;
  uint64_t v7;
  CoreML::Specification::Int64FeatureType *v8;
  MIOFeatureDescription *v9;
  MIOFeatureDescription *valueDescription;
  _BYTE v12[16];
  uint64_t v13;
  CoreML::Specification::FeatureType *v14;
  objc_super v15;
  __n128 v16;
  char v17;

  v15.receiver = self;
  v15.super_class = (Class)MIOSequenceConstraint;
  v4 = -[MIOSequenceConstraint init](&v15, sel_init);
  v5 = (MIOSequenceConstraint *)v4;
  if (v4)
  {
    CoreML::Specification::SequenceFeatureType::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
    CoreML::Specification::FeatureDescription::FeatureDescription((CoreML::Specification::FeatureDescription *)v12);
    std::string::basic_string[abi:ne180100]<0>(&v16, "values");
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v13, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &v16);
    if (v17 < 0)
      operator delete((void *)v16.n128_u64[0]);
    v6 = *((_DWORD *)a3 + 9);
    if (v6 == 1)
    {
      v7 = (uint64_t)v14;
      if (!v14)
      {
        v7 = operator new();
        CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v7);
        v14 = (CoreML::Specification::FeatureType *)v7;
      }
      if (*(_DWORD *)(v7 + 36) == 1)
        goto LABEL_15;
      CoreML::Specification::FeatureType::clear_Type(v7);
      *(_DWORD *)(v7 + 36) = 1;
      v8 = (CoreML::Specification::Int64FeatureType *)operator new();
      CoreML::Specification::Int64FeatureType::Int64FeatureType(v8);
    }
    else
    {
      if (v6 != 3)
        goto LABEL_15;
      v7 = (uint64_t)v14;
      if (!v14)
      {
        v7 = operator new();
        CoreML::Specification::FeatureType::FeatureType((CoreML::Specification::FeatureType *)v7);
        v14 = (CoreML::Specification::FeatureType *)v7;
      }
      if (*(_DWORD *)(v7 + 36) == 3)
        goto LABEL_15;
      CoreML::Specification::FeatureType::clear_Type(v7);
      *(_DWORD *)(v7 + 36) = 3;
      v8 = (CoreML::Specification::Int64FeatureType *)operator new();
      CoreML::Specification::StringFeatureType::StringFeatureType(v8);
    }
    *(_QWORD *)(v7 + 24) = v8;
LABEL_15:
    v9 = -[MIOFeatureDescription initWithSpecification:]([MIOFeatureDescription alloc], "initWithSpecification:", v12);
    valueDescription = v5->_valueDescription;
    v5->_valueDescription = v9;

    CoreML::Specification::FeatureDescription::~FeatureDescription((CoreML::Specification::FeatureDescription *)v12);
  }
  return v5;
}

- (const)sequenceFeatureTypeSpecification
{
  return &self->_sequenceFeatureTypeParams;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[MIOSequenceConstraint countRange](self, "countRange");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[MIOSequenceConstraint valueDescription](self, "valueDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("MIOSequenceConstraint { countRange: [%zd, %zd], valueDescription: %@ }"), v3, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  MIOSequenceConstraint *v4;
  MIOSequenceConstraint *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (MIOSequenceConstraint *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIOSequenceConstraint countRange](self, "countRange");
      v8 = v7;
      v9 = -[MIOSequenceConstraint countRange](v5, "countRange");
      if (MIOEqualRanges(v6, v8, v9, v10))
      {
        -[MIOSequenceConstraint valueDescription](self, "valueDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOSequenceConstraint valueDescription](v5, "valueDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[MIOSequenceConstraint countRange](self, "countRange");
  -[MIOSequenceConstraint countRange](self, "countRange");
  v5 = v4;
  -[MIOSequenceConstraint valueDescription](self, "valueDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v3 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (_MIORange)countRange
{
  SizeRange *sizerange;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  _MIORange result;

  sizerange = self->_sequenceFeatureTypeParams.sizerange_;
  if (!sizerange)
    sizerange = (SizeRange *)&CoreML::Specification::_SizeRange_default_instance_;
  v3 = *((_QWORD *)sizerange + 2);
  v4 = *((_QWORD *)sizerange + 3);
  if (v4 <= 0)
    v5 = -1;
  else
    v5 = v4;
  v6 = MIOMakeRange(v3, v5);
  result.upperBound = v7;
  result.lowerBound = v6;
  return result;
}

- (MIOFeatureDescription)valueDescription
{
  return self->_valueDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDescription, 0);
  CoreML::Specification::SequenceFeatureType::~SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)&self->_sequenceFeatureTypeParams);
}

- (id).cxx_construct
{
  CoreML::Specification::SequenceFeatureType::SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)&self->_sequenceFeatureTypeParams);
  return self;
}

@end
