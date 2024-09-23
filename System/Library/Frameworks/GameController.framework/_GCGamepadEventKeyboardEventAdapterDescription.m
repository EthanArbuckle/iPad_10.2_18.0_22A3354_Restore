@implementation _GCGamepadEventKeyboardEventAdapterDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventKeyboardEventAdapterDescription)initWithConfiguration:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  _GCGamepadEventKeyboardEventAdapterDescription *v9;
  _GCGamepadEventKeyboardEventAdapterDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GCGamepadEventKeyboardEventAdapterDescription;
  v9 = -[_GCGamepadEventKeyboardEventAdapterDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    objc_storeStrong((id *)&v10->_sourceDescription, a4);
  }

  return v10;
}

- (_GCGamepadEventKeyboardEventAdapterDescription)init
{
  -[_GCGamepadEventKeyboardEventAdapterDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (_GCGamepadEventKeyboardEventAdapterDescription)initWithCoder:(id)a3
{
  id v4;
  _GCGamepadEventKeyboardEventAdapterDescription *v5;
  uint64_t v6;
  _GCGamepadEventKeyboardEventAdapterConfig *config;
  void *v8;
  uint64_t v9;
  _GCKeyboardEventSourceDescription *sourceDescription;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GCGamepadEventKeyboardEventAdapterDescription;
  v5 = -[_GCGamepadEventKeyboardEventAdapterDescription init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("config"));
    v6 = objc_claimAutoreleasedReturnValue();
    config = v5->_config;
    v5->_config = (_GCGamepadEventKeyboardEventAdapterConfig *)v6;

    _GCKeyboardEventSourceDescription_Classes();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("source"));
    v9 = objc_claimAutoreleasedReturnValue();
    sourceDescription = v5->_sourceDescription;
    v5->_sourceDescription = (_GCKeyboardEventSourceDescription *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _GCKeyboardEventSourceDescription *sourceDescription;
  id v5;

  sourceDescription = self->_sourceDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceDescription, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_config, CFSTR("config"));

}

- (id)materializeWithContext:(id)a3
{
  id v4;
  _GCGamepadEventKeyboardEventAdapter *materializedObject;
  uint64_t v6;
  void *v7;
  _GCGamepadEventKeyboardEventAdapter *v8;
  _GCGamepadEventKeyboardEventAdapter *v9;
  _GCGamepadEventKeyboardEventAdapter *v10;

  v4 = a3;
  materializedObject = self->_materializedObject;
  if (!materializedObject)
  {
    -[_GCKeyboardEventSourceDescription materializeWithContext:](self->_sourceDescription, "materializeWithContext:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = 0;
      goto LABEL_5;
    }
    v7 = (void *)v6;
    v8 = -[_GCGamepadEventKeyboardEventAdapter initWithConfiguration:source:]([_GCGamepadEventKeyboardEventAdapter alloc], "initWithConfiguration:source:", self->_config, v6);
    v9 = self->_materializedObject;
    self->_materializedObject = v8;

    materializedObject = self->_materializedObject;
  }
  v10 = materializedObject;
LABEL_5:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedObject, 0);
  objc_storeStrong((id *)&self->_sourceDescription, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
