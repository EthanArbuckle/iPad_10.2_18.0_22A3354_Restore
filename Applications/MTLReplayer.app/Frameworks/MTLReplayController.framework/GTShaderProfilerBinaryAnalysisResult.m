@implementation GTShaderProfilerBinaryAnalysisResult

- (GTShaderProfilerBinaryAnalysisResult)init
{
  GTShaderProfilerBinaryAnalysisResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTShaderProfilerBinaryAnalysisResult;
  result = -[GTShaderProfilerBinaryAnalysisResult init](&v3, "init");
  if (result)
    result->_version = 2;
  return result;
}

- (GTShaderProfilerBinaryAnalysisResult)initWithCoder:(id)a3
{
  id v4;
  GTShaderProfilerBinaryAnalysisResult *v5;
  int v6;
  GTShaderProfilerBinaryAnalysisResult *v7;
  int v8;
  uint32_t *v9;
  segment_command_64 *v10;
  int *v11;
  int *v12;
  int *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSData *instructionData;
  uint64_t v18;
  NSData *clauseData;
  uint64_t v20;
  NSData *branchTargetData;
  uint64_t v22;
  NSData *binaryRangeData;
  uint64_t v24;
  NSData *binaryLocationData;
  uint64_t v26;
  NSData *registerInfoData;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *strings;
  const $3FF9FA8D714CB2339D683D7D65AEC080 *v32;
  unint64_t v33;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v36;
  unint64_t *begin;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  objc_super v46;
  _QWORD v47[3];
  _QWORD v48[2];

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)GTShaderProfilerBinaryAnalysisResult;
  v5 = -[GTShaderProfilerBinaryAnalysisResult init](&v46, "init");
  if (!v5)
  {
LABEL_34:
    v7 = v5;
    goto LABEL_35;
  }
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("version"));
  if (v6 > 2)
  {
LABEL_3:
    v7 = 0;
    goto LABEL_35;
  }
  v8 = v6;
  if ((v6 - 1) > 1)
  {
LABEL_12:
    v48[0] = objc_opt_class(NSData);
    v48[1] = objc_opt_class(NSMutableData);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("instructionData")));
    instructionData = v5->_instructionData;
    v5->_instructionData = (NSData *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("clauseData")));
    clauseData = v5->_clauseData;
    v5->_clauseData = (NSData *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("branchTargetData")));
    branchTargetData = v5->_branchTargetData;
    v5->_branchTargetData = (NSData *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("binaryRangeData")));
    binaryRangeData = v5->_binaryRangeData;
    v5->_binaryRangeData = (NSData *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("binaryLocationData")));
    binaryLocationData = v5->_binaryLocationData;
    v5->_binaryLocationData = (NSData *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("registerInfoData")));
    registerInfoData = v5->_registerInfoData;
    v5->_registerInfoData = (NSData *)v26;

    v47[0] = objc_opt_class(NSArray);
    v47[1] = objc_opt_class(NSMutableArray);
    v47[2] = objc_opt_class(NSString);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v28));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("strings")));
    strings = v5->_strings;
    v5->_strings = (NSArray *)v30;

    if (v8 >= 2)
    {
      if (v5->_registerInfoData)
      {
        v32 = -[GTShaderProfilerBinaryAnalysisResult instructions](v5, "instructions");
        if (v32 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](v5, "lastInstruction"))
        {
          v33 = 0;
          do
          {
            end = v5->_registerOffsets.__end_;
            value = v5->_registerOffsets.__end_cap_.__value_;
            if (end >= value)
            {
              begin = v5->_registerOffsets.__begin_;
              v38 = end - begin;
              v39 = v38 + 1;
              if ((unint64_t)(v38 + 1) >> 61)
                abort();
              v40 = (char *)value - (char *)begin;
              if (v40 >> 2 > v39)
                v39 = v40 >> 2;
              if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
                v41 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v41 = v39;
              if (v41)
              {
                v41 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v41);
                begin = v5->_registerOffsets.__begin_;
                end = v5->_registerOffsets.__end_;
              }
              else
              {
                v42 = 0;
              }
              v43 = (unint64_t *)(v41 + 8 * v38);
              *v43 = v33;
              v36 = v43 + 1;
              while (end != begin)
              {
                v44 = *--end;
                *--v43 = v44;
              }
              v5->_registerOffsets.__begin_ = v43;
              v5->_registerOffsets.__end_ = v36;
              v5->_registerOffsets.__end_cap_.__value_ = (unint64_t *)(v41 + 8 * v42);
              if (begin)
                operator delete(begin);
            }
            else
            {
              *end = v33;
              v36 = end + 1;
            }
            v5->_registerOffsets.__end_ = v36;
            v33 += v32->var7;
            v32 = (const $3FF9FA8D714CB2339D683D7D65AEC080 *)((char *)v32 + 36);
          }
          while (v32 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](v5, "lastInstruction"));
        }
      }
    }

    goto LABEL_34;
  }
  v9 = (uint32_t *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("instructionSize"));
  v10 = (segment_command_64 *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clauseSize"));
  v11 = (int *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("branchTargetSize"));
  v12 = (int *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("binaryRangeSize"));
  v13 = (int *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("binaryLocationSize"));
  v7 = 0;
  if (v9 == &stru_20.cmdsize && v10 == &stru_20 && v11 == &dword_8 && v12 == &dword_18 && v13 == &dword_10)
  {
    if (v8 == 2 && objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("registerInfoSize")) != &dword_8)
      goto LABEL_3;
    goto LABEL_12;
  }
LABEL_35:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeInteger:forKey:", 36, CFSTR("instructionSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", 32, CFSTR("clauseSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", 8, CFSTR("branchTargetSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", 24, CFSTR("binaryRangeSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", 16, CFSTR("binaryLocationSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", 8, CFSTR("registerInfoSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult instructionData](self, "instructionData"));
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("instructionData"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult clauseData](self, "clauseData"));
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("clauseData"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult branchTargetData](self, "branchTargetData"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("branchTargetData"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult binaryRangeData](self, "binaryRangeData"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("binaryRangeData"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult binaryLocationData](self, "binaryLocationData"));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("binaryLocationData"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult registerInfoData](self, "registerInfoData"));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("registerInfoData"));

  v12 = (id)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult strings](self, "strings"));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("strings"));

}

- (const)instructions
{
  return (const $3FF9FA8D714CB2339D683D7D65AEC080 *)-[NSData bytes](self->_instructionData, "bytes");
}

- (const)clauses
{
  return (const $A0BB0C84700A1F9917ADF19F83391813 *)-[NSData bytes](self->_clauseData, "bytes");
}

- (const)binaryRanges
{
  return (const $6A62C185A4D2045C0BA5E18B70292D31 *)-[NSData bytes](self->_binaryRangeData, "bytes");
}

- (const)binaryLocations
{
  return (const $5E5F304956FB491AF6F034FDF0808287 *)-[NSData bytes](self->_binaryLocationData, "bytes");
}

- (const)branchTargets
{
  return (const $61A80719B04F7407D3E47539F1B23CAA *)-[NSData bytes](self->_branchTargetData, "bytes");
}

- (const)registerInfo
{
  return (const $85CD2974BE96D4886BB301820D1C36C2 *)-[NSData bytes](self->_registerInfoData, "bytes");
}

- (unint64_t)instructionCount
{
  return -[NSData length](self->_instructionData, "length") / 0x24;
}

- (unint64_t)clauseCount
{
  return -[NSData length](self->_clauseData, "length") >> 5;
}

- (unint64_t)binaryRangeCount
{
  return -[NSData length](self->_binaryRangeData, "length") / 0x18;
}

- (unint64_t)binaryLocationCount
{
  return -[NSData length](self->_binaryLocationData, "length") >> 4;
}

- (unint64_t)branchTargetCount
{
  return -[NSData length](self->_branchTargetData, "length") >> 3;
}

- (unint64_t)registerInfoCount
{
  return -[NSData length](self->_registerInfoData, "length") >> 3;
}

- (const)lastInstruction
{
  const $3FF9FA8D714CB2339D683D7D65AEC080 *result;
  char *v4;

  result = -[GTShaderProfilerBinaryAnalysisResult instructionCount](self, "instructionCount");
  if (result)
  {
    v4 = -[NSData bytes](self->_instructionData, "bytes");
    return (const $3FF9FA8D714CB2339D683D7D65AEC080 *)&v4[36
                                                        * -[GTShaderProfilerBinaryAnalysisResult instructionCount](self, "instructionCount")- 36];
  }
  return result;
}

- (const)lastClause
{
  const $A0BB0C84700A1F9917ADF19F83391813 *result;
  char *v4;

  result = -[GTShaderProfilerBinaryAnalysisResult clauseCount](self, "clauseCount");
  if (result)
  {
    v4 = -[NSData bytes](self->_clauseData, "bytes");
    return (const $A0BB0C84700A1F9917ADF19F83391813 *)&v4[32
                                                        * -[GTShaderProfilerBinaryAnalysisResult clauseCount](self, "clauseCount")- 32];
  }
  return result;
}

- (const)lastBinaryRange
{
  const $6A62C185A4D2045C0BA5E18B70292D31 *result;
  char *v4;

  result = -[GTShaderProfilerBinaryAnalysisResult binaryRangeCount](self, "binaryRangeCount");
  if (result)
  {
    v4 = -[NSData bytes](self->_binaryRangeData, "bytes");
    return (const $6A62C185A4D2045C0BA5E18B70292D31 *)&v4[24
                                                        * -[GTShaderProfilerBinaryAnalysisResult binaryRangeCount](self, "binaryRangeCount")- 24];
  }
  return result;
}

- (const)lastBinaryLocation
{
  const $5E5F304956FB491AF6F034FDF0808287 *result;
  char *v4;

  result = -[GTShaderProfilerBinaryAnalysisResult binaryLocationCount](self, "binaryLocationCount");
  if (result)
  {
    v4 = -[NSData bytes](self->_binaryLocationData, "bytes");
    return (const $5E5F304956FB491AF6F034FDF0808287 *)&v4[16
                                                        * -[GTShaderProfilerBinaryAnalysisResult binaryLocationCount](self, "binaryLocationCount")- 16];
  }
  return result;
}

- (const)lastBranchTarget
{
  const $61A80719B04F7407D3E47539F1B23CAA *result;
  char *v4;

  result = -[GTShaderProfilerBinaryAnalysisResult branchTargetCount](self, "branchTargetCount");
  if (result)
  {
    v4 = -[NSData bytes](self->_branchTargetData, "bytes");
    return (const $61A80719B04F7407D3E47539F1B23CAA *)&v4[8
                                                        * -[GTShaderProfilerBinaryAnalysisResult branchTargetCount](self, "branchTargetCount")- 8];
  }
  return result;
}

- (const)lastRegisterInfo
{
  const $85CD2974BE96D4886BB301820D1C36C2 *result;
  char *v4;

  result = -[GTShaderProfilerBinaryAnalysisResult registerInfoCount](self, "registerInfoCount");
  if (result)
  {
    v4 = -[NSData bytes](self->_registerInfoData, "bytes");
    return (const $85CD2974BE96D4886BB301820D1C36C2 *)&v4[8
                                                        * -[GTShaderProfilerBinaryAnalysisResult registerInfoCount](self, "registerInfoCount")- 8];
  }
  return result;
}

- (void)setStrings:(id)a3
{
  objc_storeStrong((id *)&self->_strings, a3);
}

- (void)setClauseData:(id)a3
{
  objc_storeStrong((id *)&self->_clauseData, a3);
}

- (void)setInstructionData:(id)a3
{
  const $3FF9FA8D714CB2339D683D7D65AEC080 *v5;
  unint64_t v6;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v9;
  unint64_t *begin;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  id v18;

  v18 = a3;
  objc_storeStrong((id *)&self->_instructionData, a3);
  if (self->_registerInfoData)
  {
    self->_registerOffsets.__end_ = self->_registerOffsets.__begin_;
    v5 = -[GTShaderProfilerBinaryAnalysisResult instructions](self, "instructions");
    if (v5 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction"))
    {
      v6 = 0;
      do
      {
        end = self->_registerOffsets.__end_;
        value = self->_registerOffsets.__end_cap_.__value_;
        if (end >= value)
        {
          begin = self->_registerOffsets.__begin_;
          v11 = end - begin;
          v12 = v11 + 1;
          if ((unint64_t)(v11 + 1) >> 61)
            abort();
          v13 = (char *)value - (char *)begin;
          if (v13 >> 2 > v12)
            v12 = v13 >> 2;
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
            v14 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v14 = v12;
          if (v14)
          {
            v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v14);
            begin = self->_registerOffsets.__begin_;
            end = self->_registerOffsets.__end_;
          }
          else
          {
            v15 = 0;
          }
          v16 = (unint64_t *)(v14 + 8 * v11);
          *v16 = v6;
          v9 = v16 + 1;
          while (end != begin)
          {
            v17 = *--end;
            *--v16 = v17;
          }
          self->_registerOffsets.__begin_ = v16;
          self->_registerOffsets.__end_ = v9;
          self->_registerOffsets.__end_cap_.__value_ = (unint64_t *)(v14 + 8 * v15);
          if (begin)
            operator delete(begin);
        }
        else
        {
          *end = v6;
          v9 = end + 1;
        }
        self->_registerOffsets.__end_ = v9;
        v6 += v5->var7;
        v5 = (const $3FF9FA8D714CB2339D683D7D65AEC080 *)((char *)v5 + 36);
      }
      while (v5 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction"));
    }
  }

}

- (void)setBinaryRangeData:(id)a3
{
  objc_storeStrong((id *)&self->_binaryRangeData, a3);
}

- (void)setBinaryLocationData:(id)a3
{
  objc_storeStrong((id *)&self->_binaryLocationData, a3);
}

- (void)setBranchTargetData:(id)a3
{
  objc_storeStrong((id *)&self->_branchTargetData, a3);
}

- (void)setRegisterInfoData:(id)a3
{
  const $3FF9FA8D714CB2339D683D7D65AEC080 *v5;
  unint64_t v6;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v9;
  unint64_t *begin;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  id v18;

  v18 = a3;
  objc_storeStrong((id *)&self->_registerInfoData, a3);
  if (self->_instructionData)
  {
    self->_registerOffsets.__end_ = self->_registerOffsets.__begin_;
    v5 = -[GTShaderProfilerBinaryAnalysisResult instructions](self, "instructions");
    if (v5 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction"))
    {
      v6 = 0;
      do
      {
        end = self->_registerOffsets.__end_;
        value = self->_registerOffsets.__end_cap_.__value_;
        if (end >= value)
        {
          begin = self->_registerOffsets.__begin_;
          v11 = end - begin;
          v12 = v11 + 1;
          if ((unint64_t)(v11 + 1) >> 61)
            abort();
          v13 = (char *)value - (char *)begin;
          if (v13 >> 2 > v12)
            v12 = v13 >> 2;
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
            v14 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v14 = v12;
          if (v14)
          {
            v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v14);
            begin = self->_registerOffsets.__begin_;
            end = self->_registerOffsets.__end_;
          }
          else
          {
            v15 = 0;
          }
          v16 = (unint64_t *)(v14 + 8 * v11);
          *v16 = v6;
          v9 = v16 + 1;
          while (end != begin)
          {
            v17 = *--end;
            *--v16 = v17;
          }
          self->_registerOffsets.__begin_ = v16;
          self->_registerOffsets.__end_ = v9;
          self->_registerOffsets.__end_cap_.__value_ = (unint64_t *)(v14 + 8 * v15);
          if (begin)
            operator delete(begin);
        }
        else
        {
          *end = v6;
          v9 = end + 1;
        }
        self->_registerOffsets.__end_ = v9;
        v6 += v5->var7;
        v5 = (const $3FF9FA8D714CB2339D683D7D65AEC080 *)((char *)v5 + 36);
      }
      while (v5 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction"));
    }
  }

}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unint64_t)maxOffset
{
  unint64_t result;
  uint64_t v4;

  result = -[GTShaderProfilerBinaryAnalysisResult instructionCount](self, "instructionCount");
  if (result)
  {
    v4 = *((_QWORD *)-[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction") + 1);
    return *((_QWORD *)-[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction") + 2) + v4;
  }
  return result;
}

- (unint64_t)registerInfoOffsetForInstructionIndex:(unint64_t)a3
{
  unint64_t *begin;

  if (-[GTShaderProfilerBinaryAnalysisResult instructionCount](self, "instructionCount") <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  begin = self->_registerOffsets.__begin_;
  if (a3 >= self->_registerOffsets.__end_ - begin)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return begin[a3];
}

- (unsigned)version
{
  return self->_version;
}

- (NSArray)strings
{
  return self->_strings;
}

- (NSData)instructionData
{
  return self->_instructionData;
}

- (NSData)clauseData
{
  return self->_clauseData;
}

- (NSData)branchTargetData
{
  return self->_branchTargetData;
}

- (NSData)binaryRangeData
{
  return self->_binaryRangeData;
}

- (NSData)binaryLocationData
{
  return self->_binaryLocationData;
}

- (NSData)registerInfoData
{
  return self->_registerInfoData;
}

- (void).cxx_destruct
{
  unint64_t *begin;

  objc_storeStrong((id *)&self->_registerInfoData, 0);
  objc_storeStrong((id *)&self->_binaryLocationData, 0);
  objc_storeStrong((id *)&self->_binaryRangeData, 0);
  objc_storeStrong((id *)&self->_branchTargetData, 0);
  objc_storeStrong((id *)&self->_clauseData, 0);
  objc_storeStrong((id *)&self->_instructionData, 0);
  begin = self->_registerOffsets.__begin_;
  if (begin)
  {
    self->_registerOffsets.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_strings, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)analyzeBinary:(id)a3 targetIndex:(int)a4 isaPrinter:(id)a5
{
  id v5;

  if (a4 > 4)
    return 0;
  v5 = GTShaderProfilerAnalyzeBinaryLLVM(a3, *(uint64_t *)&a4, a5);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

+ (id)dataFromArchivedDataURL:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v9;
  id v10;

  v10 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", a3, 0, &v10));
  v4 = v10;
  if (v4)
  {
    v5 = v4;
    v6 = 0;
  }
  else
  {
    v9 = 0;
    v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GTShaderProfilerBinaryAnalysisResult), v3, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v5 = v9;
  }

  return v6;
}

@end
