@implementation _CDPModelTuningState

+ (id)initialTuningState
{
  id v2;
  double v3;

  v2 = objc_alloc_init((Class)a1);
  LODWORD(v3) = -1.0;
  objc_msgSend(v2, "setBestScore:", v3);
  return v2;
}

- (_CDPModelTuningState)initWithCoder:(id)a3
{
  id v3;
  _CDPModelTuningState *v4;
  int v5;
  int v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CDPModelTuningState;
  v3 = a3;
  v4 = -[_CDPModelTuningState init](&v9, sel_init);
  -[_CDPModelTuningState setI:](v4, "setI:", objc_msgSend(v3, "decodeIntForKey:", CFSTR("i"), v9.receiver, v9.super_class));
  -[_CDPModelTuningState setJ:](v4, "setJ:", objc_msgSend(v3, "decodeIntForKey:", CFSTR("j")));
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("bestLogLambda"));
  -[_CDPModelTuningState setBestLogLambda:](v4, "setBestLogLambda:");
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("bestW0"));
  -[_CDPModelTuningState setBestW0:](v4, "setBestW0:");
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("bestScore"));
  -[_CDPModelTuningState setBestScore:](v4, "setBestScore:");
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("bestThreshold"));
  v6 = v5;

  LODWORD(v7) = v6;
  -[_CDPModelTuningState setBestThreshold:](v4, "setBestThreshold:", v7);
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p:i=%d,j=%d,bestScore=%g,bestLogLambda=%g,bestW0=%g,bestThreshold=%g>"), v5, self, self->_i, self->_j, self->_bestScore, self->_bestLogLambda, self->_bestW0, self->_bestThreshold);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[_CDPModelTuningState i](self, "i"), CFSTR("i"));
  objc_msgSend(v4, "encodeInt:forKey:", -[_CDPModelTuningState j](self, "j"), CFSTR("j"));
  -[_CDPModelTuningState bestLogLambda](self, "bestLogLambda");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("bestLogLambda"));
  -[_CDPModelTuningState bestW0](self, "bestW0");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("bestW0"));
  -[_CDPModelTuningState bestScore](self, "bestScore");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("bestScore"));
  -[_CDPModelTuningState bestThreshold](self, "bestThreshold");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("bestThreshold"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  +[_CDPModelTuningState initialTuningState](_CDPModelTuningState, "initialTuningState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setI:", -[_CDPModelTuningState i](self, "i"));
  objc_msgSend(v4, "setJ:", -[_CDPModelTuningState j](self, "j"));
  -[_CDPModelTuningState bestLogLambda](self, "bestLogLambda");
  objc_msgSend(v4, "setBestLogLambda:");
  -[_CDPModelTuningState bestW0](self, "bestW0");
  objc_msgSend(v4, "setBestW0:");
  -[_CDPModelTuningState bestScore](self, "bestScore");
  objc_msgSend(v4, "setBestScore:");
  -[_CDPModelTuningState bestThreshold](self, "bestThreshold");
  objc_msgSend(v4, "setBestThreshold:");
  return v4;
}

- (float)progress
{
  int v3;

  v3 = 9 * -[_CDPModelTuningState i](self, "i");
  return (float)(-[_CDPModelTuningState j](self, "j") + v3 + 1) / 81.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)i
{
  return self->_i;
}

- (void)setI:(int)a3
{
  self->_i = a3;
}

- (int)j
{
  return self->_j;
}

- (void)setJ:(int)a3
{
  self->_j = a3;
}

- (float)bestLogLambda
{
  return self->_bestLogLambda;
}

- (void)setBestLogLambda:(float)a3
{
  self->_bestLogLambda = a3;
}

- (float)bestW0
{
  return self->_bestW0;
}

- (void)setBestW0:(float)a3
{
  self->_bestW0 = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (float)bestThreshold
{
  return self->_bestThreshold;
}

- (void)setBestThreshold:(float)a3
{
  self->_bestThreshold = a3;
}

@end
