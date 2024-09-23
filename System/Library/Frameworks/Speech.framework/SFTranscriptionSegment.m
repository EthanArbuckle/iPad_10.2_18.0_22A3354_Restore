@implementation SFTranscriptionSegment

- (unint64_t)hash
{
  return -[NSString hash](self->_substring, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SFVoiceAnalytics **v4;
  NSString *substring;
  NSArray *alternativeSubstrings;
  NSArray *alternativeConfidences;
  NSString *phoneSequence;
  NSString *ipaPhoneSequence;
  SFVoiceAnalytics *voiceAnalytics;
  BOOL v11;

  v4 = (SFVoiceAnalytics **)a3;
  objc_opt_class();
  v11 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (SFVoiceAnalytics *)self->_substringRange.location == v4[10]
    && (SFVoiceAnalytics *)self->_substringRange.length == v4[11]
    && self->_timestamp == *((double *)v4 + 3)
    && self->_duration == *((double *)v4 + 4)
    && self->_confidence == *((float *)v4 + 2))
  {
    substring = self->_substring;
    if (substring == (NSString *)v4[2] || -[NSString isEqual:](substring, "isEqual:"))
    {
      alternativeSubstrings = self->_alternativeSubstrings;
      if (alternativeSubstrings == (NSArray *)v4[5]
        || -[NSArray isEqual:](alternativeSubstrings, "isEqual:"))
      {
        alternativeConfidences = self->_alternativeConfidences;
        if (alternativeConfidences == (NSArray *)v4[7]
          || -[NSArray isEqual:](alternativeConfidences, "isEqual:"))
        {
          phoneSequence = self->_phoneSequence;
          if (phoneSequence == (NSString *)v4[8] || -[NSString isEqual:](phoneSequence, "isEqual:"))
          {
            ipaPhoneSequence = self->_ipaPhoneSequence;
            if (ipaPhoneSequence == (NSString *)v4[9]
              || -[NSString isEqual:](ipaPhoneSequence, "isEqual:"))
            {
              voiceAnalytics = self->_voiceAnalytics;
              if (voiceAnalytics == v4[6] || -[SFVoiceAnalytics isEqual:](voiceAnalytics, "isEqual:"))
                v11 = 1;
            }
          }
        }
      }
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFTranscriptionSegment;
  -[SFTranscriptionSegment description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_substringRange);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", substringRange=%@, timestamp=%@, duration=%@, confidence=%@, substring=%@, alternativeSubstrings=%@, phoneSequence=%@, ipaPhoneSequence=%@, voiceAnalytics=%@"), v4, v5, v6, v8, self->_substring, self->_alternativeSubstrings, self->_phoneSequence, self->_ipaPhoneSequence, self->_voiceAnalytics);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *substring;
  id v5;

  substring = self->_substring;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", substring, CFSTR("_substring"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_substringRange.location, CFSTR("_substringRange.location"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_substringRange.length, CFSTR("_substringRange.length"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_timestamp"), self->_timestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_duration"), self->_duration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_confidence"), self->_confidence);
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternativeSubstrings, CFSTR("_alternativeSubstrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternativeConfidences, CFSTR("_alternativeConfidences"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneSequence, CFSTR("_phoneSequence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipaPhoneSequence, CFSTR("_ipaPhoneSequence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceAnalytics, CFSTR("_voiceAnalytics"));

}

- (SFTranscriptionSegment)initWithCoder:(id)a3
{
  id v4;
  SFTranscriptionSegment *v5;
  uint64_t v6;
  NSString *substring;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *alternativeSubstrings;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *alternativeConfidences;
  uint64_t v21;
  id v22;
  NSArray *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *v30;
  uint64_t v31;
  NSString *phoneSequence;
  uint64_t v33;
  NSString *ipaPhoneSequence;
  uint64_t v35;
  SFVoiceAnalytics *voiceAnalytics;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SFTranscriptionSegment;
  v5 = -[SFTranscriptionSegment init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_substring"));
    v6 = objc_claimAutoreleasedReturnValue();
    substring = v5->_substring;
    v5->_substring = (NSString *)v6;

    v5->_substringRange.location = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_substringRange.location"));
    v5->_substringRange.length = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_substringRange.length"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timestamp"));
    v5->_timestamp = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_duration"));
    v5->_duration = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_confidence"));
    *(float *)&v10 = v10;
    v5->_confidence = *(float *)&v10;
    v11 = (void *)MEMORY[0x1E0C99E60];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_alternativeSubstrings"));
    v14 = objc_claimAutoreleasedReturnValue();
    alternativeSubstrings = v5->_alternativeSubstrings;
    v5->_alternativeSubstrings = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("_alternativeConfidences"));
    v19 = objc_claimAutoreleasedReturnValue();
    alternativeConfidences = v5->_alternativeConfidences;
    v5->_alternativeConfidences = (NSArray *)v19;

    v21 = -[NSArray count](v5->_alternativeConfidences, "count");
    if (v21 != -[NSArray count](v5->_alternativeSubstrings, "count"))
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v23 = v5->_alternativeSubstrings;
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v24)
      {
        v26 = v24;
        v27 = *(_QWORD *)v39;
        while (1)
        {
          if (*(_QWORD *)v39 != v27)
            objc_enumerationMutation(v23);
          *(float *)&v25 = v5->_confidence;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25, v38);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

          if (!--v26)
          {
            v26 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
            if (!v26)
              break;
          }
        }
      }

      v29 = objc_msgSend(v22, "copy");
      v30 = v5->_alternativeConfidences;
      v5->_alternativeConfidences = (NSArray *)v29;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_phoneSequence"));
    v31 = objc_claimAutoreleasedReturnValue();
    phoneSequence = v5->_phoneSequence;
    v5->_phoneSequence = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ipaPhoneSequence"));
    v33 = objc_claimAutoreleasedReturnValue();
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voiceAnalytics"));
    v35 = objc_claimAutoreleasedReturnValue();
    voiceAnalytics = v5->_voiceAnalytics;
    v5->_voiceAnalytics = (SFVoiceAnalytics *)v35;

  }
  return v5;
}

- (id)_initWithSubstring:(id)a3 range:(_NSRange)a4 timestamp:(double)a5 duration:(double)a6 confidence:(float)a7 alternativeSubstrings:(id)a8 alternativeConfidences:(id)a9 phoneSequence:(id)a10 ipaPhoneSequence:(id)a11 voiceAnalytics:(id)a12
{
  NSUInteger length;
  NSUInteger location;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  SFTranscriptionSegment *v28;
  uint64_t v29;
  NSString *substring;
  uint64_t v31;
  uint64_t v32;
  NSArray *alternativeSubstrings;
  uint64_t v34;
  NSArray *alternativeConfidences;
  uint64_t v36;
  NSString *phoneSequence;
  uint64_t v38;
  NSString *ipaPhoneSequence;
  uint64_t v40;
  SFVoiceAnalytics *voiceAnalytics;
  void *v43;
  objc_super v44;

  length = a4.length;
  location = a4.location;
  v22 = a3;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v44.receiver = self;
  v44.super_class = (Class)SFTranscriptionSegment;
  v28 = -[SFTranscriptionSegment init](&v44, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v22, "copy");
    substring = v28->_substring;
    v28->_substring = (NSString *)v29;

    v28->_substringRange.location = location;
    v28->_substringRange.length = length;
    v28->_timestamp = a5;
    v28->_duration = a6;
    v28->_confidence = a7;
    v31 = objc_msgSend(v24, "count");
    if (v31 != objc_msgSend(v23, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v28, CFSTR("SFTranscriptionSegment.m"), 96, &stru_1E6486C88);

    }
    v32 = objc_msgSend(v23, "copy");
    alternativeSubstrings = v28->_alternativeSubstrings;
    v28->_alternativeSubstrings = (NSArray *)v32;

    v34 = objc_msgSend(v24, "copy");
    alternativeConfidences = v28->_alternativeConfidences;
    v28->_alternativeConfidences = (NSArray *)v34;

    v36 = objc_msgSend(v25, "copy");
    phoneSequence = v28->_phoneSequence;
    v28->_phoneSequence = (NSString *)v36;

    v38 = objc_msgSend(v26, "copy");
    ipaPhoneSequence = v28->_ipaPhoneSequence;
    v28->_ipaPhoneSequence = (NSString *)v38;

    v40 = objc_msgSend(v27, "copy");
    voiceAnalytics = v28->_voiceAnalytics;
    v28->_voiceAnalytics = (SFVoiceAnalytics *)v40;

  }
  return v28;
}

- (NSString)substring
{
  return self->_substring;
}

- (NSRange)substringRange
{
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  length = self->_substringRange.length;
  location = self->_substringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (float)confidence
{
  return self->_confidence;
}

- (NSArray)alternativeSubstrings
{
  return self->_alternativeSubstrings;
}

- (SFVoiceAnalytics)voiceAnalytics
{
  return self->_voiceAnalytics;
}

- (NSArray)alternativeConfidences
{
  return self->_alternativeConfidences;
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_alternativeConfidences, 0);
  objc_storeStrong((id *)&self->_voiceAnalytics, 0);
  objc_storeStrong((id *)&self->_alternativeSubstrings, 0);
  objc_storeStrong((id *)&self->_substring, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
