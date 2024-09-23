@implementation SGSelfIDSupervision

- (SGSelfIDSupervision)initWithMessage:(id)a3 candidateName:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  SGSelfIDSupervision *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  _BOOL4 v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSUInteger v23;
  __int16 v24;
  NSUInteger v25;
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGSelfIDSupervision;
  v8 = -[SGSelfIDSupervision init](&v19, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SGSelfIDSupervision setCandidateNameRange:](v8, "setCandidateNameRange:", location, length);
    -[SGSelfIDSupervision setIsPositiveExample:](v8, "setIsPositiveExample:", 0);
    -[SGSelfIDSupervision setIsNegativeExample:](v8, "setIsNegativeExample:", 0);
    if (hasMessageAndValidAuthorsName(v7))
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "addObject:", *MEMORY[0x1E0C966D0]);
      objc_msgSend(v10, "addObject:", *MEMORY[0x1E0C966C0]);
      objc_msgSend(v7, "author");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGContactPipelineHelper findContactsForPerson:fetchingKeys:](SGContactPipelineHelper, "findContactsForPerson:fetchingKeys:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && objc_msgSend(v12, "count"))
      {
        v13 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v7, "textContent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "length")
          || location == 0x7FFFFFFFFFFFFFFFLL
          || location + length > objc_msgSend(v14, "length"))
        {
          sgLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v21 = v14;
            v22 = 2048;
            v23 = location;
            v24 = 2048;
            v25 = length;
            _os_log_fault_impl(&dword_1C3607000, v15, OS_LOG_TYPE_FAULT, "CandidateNameRange not in plainTextContent: %@ %tu %tu", buf, 0x20u);
          }

          if (_PASEvaluateLogFaultAndProbCrashCriteria())
            abort();
        }
        else
        {
          objc_msgSend(v14, "substringWithRange:", location, length);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = +[SGContactPipelineHelper personExistsInContacts:name:handle:](SGContactPipelineHelper, "personExistsInContacts:name:handle:", v12, v17, 0);

          if (v18)
            -[SGSelfIDSupervision setIsPositiveExample:](v8, "setIsPositiveExample:", 1);
          else
            -[SGSelfIDSupervision setIsNegativeExample:](v8, "setIsNegativeExample:", 1);
        }

        objc_autoreleasePoolPop(v13);
      }

    }
    objc_autoreleasePoolPop(v9);
  }

  return v8;
}

- (BOOL)isPositiveExample
{
  return self->_isPositiveExample;
}

- (void)setIsPositiveExample:(BOOL)a3
{
  self->_isPositiveExample = a3;
}

- (BOOL)isNegativeExample
{
  return self->_isNegativeExample;
}

- (void)setIsNegativeExample:(BOOL)a3
{
  self->_isNegativeExample = a3;
}

- (_NSRange)candidateNameRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_candidateNameRange.length;
  location = self->_candidateNameRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCandidateNameRange:(_NSRange)a3
{
  self->_candidateNameRange = a3;
}

@end
