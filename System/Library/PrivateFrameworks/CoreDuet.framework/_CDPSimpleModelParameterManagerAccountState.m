@implementation _CDPSimpleModelParameterManagerAccountState

- (_CDPSimpleModelParameterManagerAccountState)init
{
  _CDPSimpleModelParameterManagerAccountState *v2;
  _CDPSimpleModelParameterManagerTuningValue *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  _CDPSimpleModelParameterManagerTuningValue *previousBestTuningValue;
  uint64_t v10;
  NSMutableArray *tuningValues;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CDPSimpleModelParameterManagerAccountState;
  v2 = -[_CDPSimpleModelParameterManagerAccountState init](&v13, sel_init);
  v3 = [_CDPSimpleModelParameterManagerTuningValue alloc];
  LODWORD(v4) = 30.0;
  LODWORD(v5) = 5.0;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 0.5;
  v8 = -[_CDPSimpleModelParameterManagerTuningValue initWithLambda:w0:threshold:score:](v3, "initWithLambda:w0:threshold:score:", v4, v5, v6, v7);
  previousBestTuningValue = v2->_previousBestTuningValue;
  v2->_previousBestTuningValue = (_CDPSimpleModelParameterManagerTuningValue *)v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = objc_claimAutoreleasedReturnValue();
  tuningValues = v2->_tuningValues;
  v2->_tuningValues = (NSMutableArray *)v10;

  return v2;
}

- (_CDPSimpleModelParameterManagerAccountState)initWithCoder:(id)a3
{
  id v4;
  _CDPSimpleModelParameterManagerAccountState *v5;
  uint64_t v6;
  _CDPSimpleModelParameterManagerTuningValue *previousBestTuningValue;
  uint64_t v8;
  NSMutableArray *tuningValues;
  uint64_t v10;
  _CDPModelTuningState *lastTuningState;

  v4 = a3;
  v5 = -[_CDPSimpleModelParameterManagerAccountState init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousBestTuningValue"));
  v6 = objc_claimAutoreleasedReturnValue();
  previousBestTuningValue = v5->_previousBestTuningValue;
  v5->_previousBestTuningValue = (_CDPSimpleModelParameterManagerTuningValue *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tuningValues"));
  v8 = objc_claimAutoreleasedReturnValue();
  tuningValues = v5->_tuningValues;
  v5->_tuningValues = (NSMutableArray *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastTuningState"));
  v10 = objc_claimAutoreleasedReturnValue();

  lastTuningState = v5->_lastTuningState;
  v5->_lastTuningState = (_CDPModelTuningState *)v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _CDPSimpleModelParameterManagerTuningValue *previousBestTuningValue;
  id v5;

  previousBestTuningValue = self->_previousBestTuningValue;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", previousBestTuningValue, CFSTR("previousBestTuningValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tuningValues, CFSTR("tuningValues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastTuningState, CFSTR("lastTuningState"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDPSimpleModelParameterManagerTuningValue)previousBestTuningValue
{
  return self->_previousBestTuningValue;
}

- (void)setPreviousBestTuningValue:(id)a3
{
  objc_storeStrong((id *)&self->_previousBestTuningValue, a3);
}

- (NSMutableArray)tuningValues
{
  return self->_tuningValues;
}

- (void)setTuningValues:(id)a3
{
  objc_storeStrong((id *)&self->_tuningValues, a3);
}

- (_CDPModelTuningState)lastTuningState
{
  return self->_lastTuningState;
}

- (void)setLastTuningState:(id)a3
{
  objc_storeStrong((id *)&self->_lastTuningState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTuningState, 0);
  objc_storeStrong((id *)&self->_tuningValues, 0);
  objc_storeStrong((id *)&self->_previousBestTuningValue, 0);
}

@end
