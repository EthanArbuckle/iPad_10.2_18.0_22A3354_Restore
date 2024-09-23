@implementation _EXSceneSessionParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _EXPromise *initializationParametersPromise;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_sceneIdentifier, CFSTR("sceneIdentifier"));
  initializationParametersPromise = self->_initializationParametersPromise;
  if (initializationParametersPromise)
    objc_msgSend(v5, "encodeObject:forKey:", initializationParametersPromise, CFSTR("initializationPromise"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sizeBridgingOptions, CFSTR("sizeBridgingOptions"));

}

- (_EXSceneSessionParameters)initWithCoder:(id)a3
{
  id v4;
  _EXSceneSessionParameters *v5;
  uint64_t v6;
  NSString *sceneIdentifier;
  uint64_t v8;
  _EXPromise *initializationParametersPromise;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EXSceneSessionParameters;
  v5 = -[_EXSceneSessionParameters init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initializationPromise"));
    v8 = objc_claimAutoreleasedReturnValue();
    initializationParametersPromise = v5->_initializationParametersPromise;
    v5->_initializationParametersPromise = (_EXPromise *)v8;

    v5->_sizeBridgingOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sizeBridgingOptions"));
  }

  return v5;
}

- (NSString)sceneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)sizeBridgingOptions
{
  return self->_sizeBridgingOptions;
}

- (void)setSizeBridgingOptions:(int64_t)a3
{
  self->_sizeBridgingOptions = a3;
}

- (_EXPromise)initializationParametersPromise
{
  return (_EXPromise *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInitializationParametersPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationParametersPromise, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end
