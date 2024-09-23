@implementation _LTWordTimingInfo

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t sampleIndex;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t offset;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t length;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_word, CFSTR("word"));
  sampleIndex = self->_sampleIndex;
  if ((sampleIndex & 0x80000000) != 0)
  {
    v6 = _LTOSLogXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_LTWordTimingInfo encodeWithCoder:].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);
    sampleIndex = self->_sampleIndex;
  }
  objc_msgSend(v4, "encodeInt32:forKey:", sampleIndex, CFSTR("sampleIndex"));
  offset = self->_offset;
  if ((offset & 0x80000000) != 0)
  {
    v15 = _LTOSLogXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[_LTWordTimingInfo encodeWithCoder:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    offset = self->_offset;
  }
  objc_msgSend(v4, "encodeInt32:forKey:", offset, CFSTR("offset"));
  length = self->_length;
  if ((length & 0x80000000) != 0)
  {
    v24 = _LTOSLogXPC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[_LTWordTimingInfo encodeWithCoder:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    length = self->_length;
  }
  objc_msgSend(v4, "encodeInt32:forKey:", length, CFSTR("length"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_textRange.location, self->_textRange.length);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("textRange"));

}

- (_LTWordTimingInfo)initWithCoder:(id)a3
{
  id v4;
  _LTWordTimingInfo *v5;
  uint64_t v6;
  NSString *word;
  double v8;
  void *v9;
  NSUInteger v10;
  _LTWordTimingInfo *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTWordTimingInfo;
  v5 = -[_LTWordTimingInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("word"));
    v6 = objc_claimAutoreleasedReturnValue();
    word = v5->_word;
    v5->_word = (NSString *)v6;

    v5->_sampleIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sampleIndex"));
    v5->_offset = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("offset"));
    v5->_length = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("length"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
    v5->_startTime = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textRange"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_textRange.location = objc_msgSend(v9, "rangeValue");
    v5->_textRange.length = v10;

    v11 = v5;
  }

  return v5;
}

- (NSString)unredactedDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *word;
  uint64_t sampleIndex;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  word = self->_word;
  sampleIndex = self->_sampleIndex;
  NSStringFromRange(self->_textRange);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; _sampleIndex: [%u]; _word: \"%@\"; _textRange: %@; _length: %u; _offset %u; _startTime %f>"),
    v5,
    self,
    sampleIndex,
    word,
    v8,
    self->_length,
    self->_offset,
    *(_QWORD *)&self->_startTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t sampleIndex;
  NSUInteger v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sampleIndex = self->_sampleIndex;
  v7 = -[NSString length](self->_word, "length");
  NSStringFromRange(self->_textRange);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; _sampleIndex: [%u]; _word length: %zu; _textRange: %@; _length: %u; _offset %u; _startTime %f>"),
    v5,
    self,
    sampleIndex,
    v7,
    v8,
    self->_length,
    self->_offset,
    *(_QWORD *)&self->_startTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)word
{
  return self->_word;
}

- (void)setWord:(id)a3
{
  objc_storeStrong((id *)&self->_word, a3);
}

- (unsigned)sampleIndex
{
  return self->_sampleIndex;
}

- (void)setSampleIndex:(unsigned int)a3
{
  self->_sampleIndex = a3;
}

- (unsigned)offset
{
  return self->_offset;
}

- (void)setOffset:(unsigned int)a3
{
  self->_offset = a3;
}

- (unsigned)length
{
  return self->_length;
}

- (void)setLength:(unsigned int)a3
{
  self->_length = a3;
}

- (_NSRange)textRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textRange.length;
  location = self->_textRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_word, 0);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_235438000, a1, a3, "LTWordTimingInfo encode overflow on _length", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_235438000, a1, a3, "LTWordTimingInfo encode overflow on _offset", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_235438000, a1, a3, "LTWordTimingInfo encode overflow on _sampleIndex", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

@end
