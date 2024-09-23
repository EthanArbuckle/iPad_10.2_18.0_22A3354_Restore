@implementation EARRecognitionMetrics

- (EARRecognitionMetrics)initWithRecognitionMetrics:(id)a3 cpuInstructions:(double)a4
{
  id v6;
  EARRecognitionMetrics *v7;
  void *v8;
  uint64_t v9;
  NSArray *allItnRunIntervals;
  void *v11;
  uint64_t v12;
  NSArray *pauseDurations;
  uint64_t v14;
  NSNumber *itnDurationInNs;
  void *v16;
  uint64_t v17;
  NSArray *recognizedEmojis;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EARRecognitionMetrics;
  v7 = -[EARRecognitionMetrics init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "allItnRunIntervals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    allItnRunIntervals = v7->_allItnRunIntervals;
    v7->_allItnRunIntervals = (NSArray *)v9;

    objc_msgSend(v6, "pauseDurations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    pauseDurations = v7->_pauseDurations;
    v7->_pauseDurations = (NSArray *)v12;

    objc_msgSend(v6, "itnDurationInNs");
    v14 = objc_claimAutoreleasedReturnValue();
    itnDurationInNs = v7->_itnDurationInNs;
    v7->_itnDurationInNs = (NSNumber *)v14;

    v7->_isEmojiDisambiguationUsed = objc_msgSend(v6, "isEmojiDisambiguationUsed");
    v7->_isEmojiPersonalizationUsed = objc_msgSend(v6, "isEmojiPersonalizationUsed");
    v7->_isEmojiExpectedButNotRecognized = objc_msgSend(v6, "isEmojiExpectedButNotRecognized");
    objc_msgSend(v6, "recognizedEmojis");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    recognizedEmojis = v7->_recognizedEmojis;
    v7->_recognizedEmojis = (NSArray *)v17;

    v7->_cpuMillionInstructionsPerSecond = a4;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *allItnRunIntervals;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  allItnRunIntervals = self->_allItnRunIntervals;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", allItnRunIntervals, CFSTR("allItnRunIntervals"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_pauseDurations, CFSTR("pauseDurations"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_itnDurationInNs, CFSTR("itnDurationInNs"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEmojiDisambiguationUsed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("isEmojiDisambiguationUsed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEmojiPersonalizationUsed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("isEmojiPersonalizationUsed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEmojiExpectedButNotRecognized);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("isEmojiExpectedButNotRecognized"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_recognizedEmojis, CFSTR("recognizedEmojis"));
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("cpuMillionInstructionsPerSecond"), self->_cpuMillionInstructionsPerSecond);

}

- (EARRecognitionMetrics)initWithCoder:(id)a3
{
  id v4;
  EARRecognitionMetrics *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *allItnRunIntervals;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *pauseDurations;
  uint64_t v16;
  NSNumber *itnDurationInNs;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *recognizedEmojis;
  double v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EARRecognitionMetrics;
  v5 = -[EARRecognitionMetrics init](&v25, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("allItnRunIntervals"));
    v9 = objc_claimAutoreleasedReturnValue();
    allItnRunIntervals = v5->_allItnRunIntervals;
    v5->_allItnRunIntervals = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("pauseDurations"));
    v14 = objc_claimAutoreleasedReturnValue();
    pauseDurations = v5->_pauseDurations;
    v5->_pauseDurations = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itnDurationInNs"));
    v16 = objc_claimAutoreleasedReturnValue();
    itnDurationInNs = v5->_itnDurationInNs;
    v5->_itnDurationInNs = (NSNumber *)v16;

    v5->_isEmojiDisambiguationUsed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmojiDisambiguationUsed"));
    v5->_isEmojiPersonalizationUsed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmojiPersonalizationUsed"));
    v5->_isEmojiExpectedButNotRecognized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmojiExpectedButNotRecognized"));
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("recognizedEmojis"));
    v21 = objc_claimAutoreleasedReturnValue();
    recognizedEmojis = v5->_recognizedEmojis;
    v5->_recognizedEmojis = (NSArray *)v21;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cpuMillionInstructionsPerSecond"));
    v5->_cpuMillionInstructionsPerSecond = v23;
  }

  return v5;
}

- (NSArray)allItnRunIntervals
{
  return self->_allItnRunIntervals;
}

- (void)setAllItnRunIntervals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)pauseDurations
{
  return self->_pauseDurations;
}

- (NSNumber)itnDurationInNs
{
  return self->_itnDurationInNs;
}

- (BOOL)isEmojiPersonalizationUsed
{
  return self->_isEmojiPersonalizationUsed;
}

- (BOOL)isEmojiDisambiguationUsed
{
  return self->_isEmojiDisambiguationUsed;
}

- (BOOL)isEmojiExpectedButNotRecognized
{
  return self->_isEmojiExpectedButNotRecognized;
}

- (NSArray)recognizedEmojis
{
  return self->_recognizedEmojis;
}

- (double)cpuMillionInstructionsPerSecond
{
  return self->_cpuMillionInstructionsPerSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedEmojis, 0);
  objc_storeStrong((id *)&self->_itnDurationInNs, 0);
  objc_storeStrong((id *)&self->_pauseDurations, 0);
  objc_storeStrong((id *)&self->_allItnRunIntervals, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
