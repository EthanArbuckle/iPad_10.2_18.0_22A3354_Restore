@implementation _CDPSimpleModelParameterManagerTuningValue

- (_CDPSimpleModelParameterManagerTuningValue)initWithLambda:(float)a3 w0:(float)a4 threshold:(float)a5 score:(float)a6
{
  _CDPSimpleModelParameterManagerTuningValue *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_CDPSimpleModelParameterManagerTuningValue;
  result = -[_CDPSimpleModelParameterManagerTuningValue init](&v11, sel_init);
  result->_lambda = a3;
  result->_w0 = a4;
  result->_threshold = a5;
  result->_score = a6;
  return result;
}

- (_CDPSimpleModelParameterManagerTuningValue)initWithCoder:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("lambda"));
  v6 = v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("w0"));
  v8 = v7;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("threshold"));
  v10 = v9;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("score"));
  v12 = v11;

  LODWORD(v13) = v6;
  LODWORD(v14) = v8;
  LODWORD(v15) = v10;
  LODWORD(v16) = v12;
  return -[_CDPSimpleModelParameterManagerTuningValue initWithLambda:w0:threshold:score:](self, "initWithLambda:w0:threshold:score:", v13, v14, v15, v16);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p: lambda=%g, w0=%g, t=%g, s=%g>"), self, self->_lambda, self->_w0, self->_threshold, self->_score);
}

- (void)encodeWithCoder:(id)a3
{
  float lambda;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  lambda = self->_lambda;
  v9 = a3;
  *(float *)&v5 = lambda;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("lambda"), v5);
  *(float *)&v6 = self->_w0;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("w0"), v6);
  *(float *)&v7 = self->_threshold;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("threshold"), v7);
  *(float *)&v8 = self->_score;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("score"), v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)lambda
{
  return self->_lambda;
}

- (float)w0
{
  return self->_w0;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)score
{
  return self->_score;
}

@end
