@implementation _CHSWidgetHostForConnection

- (_CHSWidgetHostForConnection)initWithIdentifier:(id)a3 configuration:(id)a4 activationState:(unint64_t)a5
{
  id v8;
  id v9;
  _CHSWidgetHostForConnection *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  CHSWidgetConfiguration *configuration;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_CHSWidgetHostForConnection;
  v10 = -[_CHSWidgetHostForConnection init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    configuration = v10->_configuration;
    v10->_configuration = (CHSWidgetConfiguration *)v13;

    v10->_activationState = a5;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CHSWidgetConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)activationState
{
  return self->_activationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
