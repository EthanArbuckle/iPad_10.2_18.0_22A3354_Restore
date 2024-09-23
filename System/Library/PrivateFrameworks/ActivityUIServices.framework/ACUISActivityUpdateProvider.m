@implementation ACUISActivityUpdateProvider

- (ACUISActivityUpdateProvider)initWithActivityUpdateProviding:(id)a3
{
  id v5;
  ACUISActivityUpdateProvider *v6;
  ACUISActivityUpdateProvider *v7;
  uint64_t v8;
  NSString *activityIdentifier;
  uint64_t v10;
  ACActivityDescriptor *descriptor;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACUISActivityUpdateProvider;
  v6 = -[ACUISActivityUpdateProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_updateProviding, a3);
    objc_msgSend(v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    activityIdentifier = v7->_activityIdentifier;
    v7->_activityIdentifier = (NSString *)v8;

    objc_msgSend(v5, "descriptor");
    v10 = objc_claimAutoreleasedReturnValue();
    descriptor = v7->_descriptor;
    v7->_descriptor = (ACActivityDescriptor *)v10;

    v7->_state = -[ACUISActivityUpdateProvider _activityState:](v7, "_activityState:", objc_msgSend(v5, "activityState"));
  }

  return v7;
}

- (int64_t)_activityState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (ACActivityDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_updateProviding, 0);
}

@end
