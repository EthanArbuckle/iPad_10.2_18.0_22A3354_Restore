@implementation _LTSpeechRecognitionSausage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_bins, CFSTR("bins"));
}

- (_LTSpeechRecognitionSausage)initWithCoder:(id)a3
{
  id v4;
  _LTSpeechRecognitionSausage *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *bins;
  _LTSpeechRecognitionSausage *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTSpeechRecognitionSausage;
  v5 = -[_LTSpeechRecognitionSausage init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bins"));
    v9 = objc_claimAutoreleasedReturnValue();
    bins = v5->_bins;
    v5->_bins = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (NSArray)bins
{
  return self->_bins;
}

- (void)setBins:(id)a3
{
  objc_storeStrong((id *)&self->_bins, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bins, 0);
}

@end
