@implementation _LTSpeechRecognitionBin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *alternatives;
  id v5;

  alternatives = self->_alternatives;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alternatives, CFSTR("alternatives"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bestAlternativeIndex, CFSTR("bestIndex"));

}

- (_LTSpeechRecognitionBin)initWithCoder:(id)a3
{
  id v4;
  _LTSpeechRecognitionBin *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *alternatives;
  _LTSpeechRecognitionBin *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTSpeechRecognitionBin;
  v5 = -[_LTSpeechRecognitionBin init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("alternatives"));
    v9 = objc_claimAutoreleasedReturnValue();
    alternatives = v5->_alternatives;
    v5->_alternatives = (NSArray *)v9;

    v5->_bestAlternativeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bestIndex"));
    v11 = v5;

  }
  return v5;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
  objc_storeStrong((id *)&self->_alternatives, a3);
}

- (unint64_t)bestAlternativeIndex
{
  return self->_bestAlternativeIndex;
}

- (void)setBestAlternativeIndex:(unint64_t)a3
{
  self->_bestAlternativeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternatives, 0);
}

@end
