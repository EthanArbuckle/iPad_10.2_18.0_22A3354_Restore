@implementation _EARPerformanceMarkers

- (_EARPerformanceMarkers)initWithCorrectPartialResultIndexList:(id)a3 correctAlignedPartialResultIndexList:(id)a4 tokenDelayInMilliseconds:(id)a5
{
  id v9;
  id v10;
  id v11;
  _EARPerformanceMarkers *v12;
  _EARPerformanceMarkers *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_EARPerformanceMarkers;
  v12 = -[_EARPerformanceMarkers init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_correctPartialResultIndexList, a3);
    objc_storeStrong((id *)&v13->_correctAlignedPartialResultIndexList, a4);
    objc_storeStrong((id *)&v13->_tokenDelayInMilliSeconds, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_correctPartialResultIndexList, CFSTR("correctPartialResultIndexList"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correctAlignedPartialResultIndexList, CFSTR("correctAlignedPartialResultIndexList"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tokenDelayInMilliSeconds, CFSTR("tokenDelayInMilliSeconds"));

}

- (_EARPerformanceMarkers)initWithCoder:(id)a3
{
  id v4;
  _EARPerformanceMarkers *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *correctPartialResultIndexList;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *correctAlignedPartialResultIndexList;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *tokenDelayInMilliSeconds;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_EARPerformanceMarkers;
  v5 = -[_EARPerformanceMarkers init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("correctPartialResultIndexList"));
    v9 = objc_claimAutoreleasedReturnValue();
    correctPartialResultIndexList = v5->_correctPartialResultIndexList;
    v5->_correctPartialResultIndexList = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("correctAlignedPartialResultIndexList"));
    v14 = objc_claimAutoreleasedReturnValue();
    correctAlignedPartialResultIndexList = v5->_correctAlignedPartialResultIndexList;
    v5->_correctAlignedPartialResultIndexList = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("tokenDelayInMilliSeconds"));
    v19 = objc_claimAutoreleasedReturnValue();
    tokenDelayInMilliSeconds = v5->_tokenDelayInMilliSeconds;
    v5->_tokenDelayInMilliSeconds = (NSArray *)v19;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  _EARPerformanceMarkers *v5;
  _EARPerformanceMarkers *v6;
  _EARPerformanceMarkers *v7;
  NSArray *correctPartialResultIndexList;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  char v12;
  NSArray *correctAlignedPartialResultIndexList;
  NSArray *v14;
  NSArray *v15;
  NSArray *tokenDelayInMilliSeconds;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  void *v21;

  v5 = (_EARPerformanceMarkers *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        correctPartialResultIndexList = self->_correctPartialResultIndexList;
        -[_EARPerformanceMarkers correctPartialResultIndexList](v7, "correctPartialResultIndexList");
        v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
        if (correctPartialResultIndexList != v9)
        {
          v10 = self->_correctPartialResultIndexList;
          -[_EARPerformanceMarkers correctPartialResultIndexList](v7, "correctPartialResultIndexList");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSArray isEqualToArray:](v10, "isEqualToArray:", v11))
          {
            v12 = 0;
            goto LABEL_19;
          }
          v21 = v11;
        }
        correctAlignedPartialResultIndexList = self->_correctAlignedPartialResultIndexList;
        -[_EARPerformanceMarkers correctAlignedPartialResultIndexList](v7, "correctAlignedPartialResultIndexList");
        v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
        if (correctAlignedPartialResultIndexList == v14
          || (v15 = self->_correctAlignedPartialResultIndexList,
              -[_EARPerformanceMarkers correctAlignedPartialResultIndexList](v7, "correctAlignedPartialResultIndexList"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSArray isEqualToArray:](v15, "isEqualToArray:", v3)))
        {
          tokenDelayInMilliSeconds = self->_tokenDelayInMilliSeconds;
          -[_EARPerformanceMarkers tokenDelayInMilliSeconds](v7, "tokenDelayInMilliSeconds");
          v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
          if (tokenDelayInMilliSeconds == v17)
          {

            v12 = 1;
          }
          else
          {
            v18 = self->_tokenDelayInMilliSeconds;
            -[_EARPerformanceMarkers tokenDelayInMilliSeconds](v7, "tokenDelayInMilliSeconds");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[NSArray isEqualToArray:](v18, "isEqualToArray:", v19);

          }
          if (correctAlignedPartialResultIndexList == v14)
          {
LABEL_18:

            v11 = v21;
            if (correctPartialResultIndexList == v9)
            {
LABEL_20:

              goto LABEL_21;
            }
LABEL_19:

            goto LABEL_20;
          }
        }
        else
        {
          v12 = 0;
        }

        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (NSArray)correctPartialResultIndexList
{
  return self->_correctPartialResultIndexList;
}

- (NSArray)correctAlignedPartialResultIndexList
{
  return self->_correctAlignedPartialResultIndexList;
}

- (NSArray)tokenDelayInMilliSeconds
{
  return self->_tokenDelayInMilliSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenDelayInMilliSeconds, 0);
  objc_storeStrong((id *)&self->_correctAlignedPartialResultIndexList, 0);
  objc_storeStrong((id *)&self->_correctPartialResultIndexList, 0);
}

@end
