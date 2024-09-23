@implementation PHASEMappedMetaParameterDefinition

- (PHASEMappedMetaParameterDefinition)init
{
  -[PHASEMappedMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEMappedMetaParameterDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEMappedMetaParameterDefinition)initWithValue:(double)value identifier:(NSString *)identifier
{
  -[PHASEMappedMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, value);

  return 0;
}

- (PHASEMappedMetaParameterDefinition)initWithValue:(double)value
{
  -[PHASEMappedMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, value);

  return 0;
}

- (PHASEMappedMetaParameterDefinition)initWithValue:(double)value minimum:(double)minimum maximum:(double)maximum identifier:(NSString *)identifier
{
  -[PHASEMappedMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, value, minimum, maximum);

  return 0;
}

- (PHASEMappedMetaParameterDefinition)initWithValue:(double)value minimum:(double)minimum maximum:(double)maximum
{
  -[PHASEMappedMetaParameterDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, value, minimum, maximum);

  return 0;
}

- (PHASEMappedMetaParameterDefinition)initWithInputMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)inputMetaParameterDefinition envelope:(PHASEEnvelope *)envelope identifier:(NSString *)identifier
{
  PHASENumberMetaParameterDefinition *v8;
  PHASEEnvelope *v9;
  NSString *v10;
  PHASEMappedMetaParameterDefinition *v11;
  PHASEMappedMetaParameterDefinition *v12;
  PHASEMappedMetaParameterDefinition *v13;

  v8 = inputMetaParameterDefinition;
  v9 = envelope;
  v10 = identifier;
  v11 = -[PHASEMappedMetaParameterDefinition initWithInputMetaParameterDefinition:envelope:](self, "initWithInputMetaParameterDefinition:envelope:", v8, v9);
  v12 = v11;
  if (v11)
  {
    -[PHASEDefinition setIdentifier:](v11, "setIdentifier:", v10);
    v13 = v12;
  }

  return v12;
}

- (PHASEMappedMetaParameterDefinition)initWithInputMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)inputMetaParameterDefinition envelope:(PHASEEnvelope *)envelope
{
  PHASENumberMetaParameterDefinition *v7;
  PHASEEnvelope *v8;
  PHASEMappedMetaParameterDefinition *v9;
  PHASEMappedMetaParameterDefinition *v10;
  PHASEMappedMetaParameterDefinition *v11;
  objc_super v13;

  v7 = inputMetaParameterDefinition;
  v8 = envelope;
  v13.receiver = self;
  v13.super_class = (Class)PHASEMappedMetaParameterDefinition;
  v9 = -[PHASENumberMetaParameterDefinition initWithValue:minimum:maximum:](&v13, sel_initWithValue_minimum_maximum_, 0.0, -INFINITY, INFINITY);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputMetaParameterDefinition, inputMetaParameterDefinition);
    objc_storeStrong((id *)&v10->_envelope, envelope);
    v11 = v10;
  }

  return v10;
}

- (PHASEEnvelope)envelope
{
  return self->_envelope;
}

- (PHASENumberMetaParameterDefinition)inputMetaParameterDefinition
{
  return self->_inputMetaParameterDefinition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_envelope, 0);
}

@end
