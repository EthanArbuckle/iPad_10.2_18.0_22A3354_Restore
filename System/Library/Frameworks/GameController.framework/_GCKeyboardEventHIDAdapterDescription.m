@implementation _GCKeyboardEventHIDAdapterDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCKeyboardEventHIDAdapterDescription)initWithSource:(id)a3 service:(id)a4
{
  id v7;
  id v8;
  _GCKeyboardEventHIDAdapterDescription *v9;
  _GCKeyboardEventHIDAdapterDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GCKeyboardEventHIDAdapterDescription;
  v9 = -[_GCKeyboardEventHIDAdapterDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceDescription, a3);
    objc_storeStrong((id *)&v10->_serviceDescription, a4);
  }

  return v10;
}

- (_GCKeyboardEventHIDAdapterDescription)init
{
  -[_GCKeyboardEventHIDAdapterDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (_GCKeyboardEventHIDAdapterDescription)initWithCoder:(id)a3
{
  id v4;
  _GCKeyboardEventHIDAdapterDescription *v5;
  void *v6;
  uint64_t v7;
  _GCHIDEventSourceDescription *sourceDescription;
  uint64_t v9;
  _GCCControllerHIDServiceInfoDescription *serviceDescription;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GCKeyboardEventHIDAdapterDescription;
  v5 = -[_GCKeyboardEventHIDAdapterDescription init](&v12, sel_init);
  if (v5)
  {
    _GCHIDEventSourceDescription_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("source"));
    v7 = objc_claimAutoreleasedReturnValue();
    sourceDescription = v5->_sourceDescription;
    v5->_sourceDescription = (_GCHIDEventSourceDescription *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
    v9 = objc_claimAutoreleasedReturnValue();
    serviceDescription = v5->_serviceDescription;
    v5->_serviceDescription = (_GCCControllerHIDServiceInfoDescription *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _GCCControllerHIDServiceInfoDescription *serviceDescription;
  id v5;

  serviceDescription = self->_serviceDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceDescription, CFSTR("service"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceDescription, CFSTR("source"));

}

- (id)materializeWithContext:(id)a3
{
  id v4;
  _GCKeyboardEventHIDAdapter *materializedObject;
  _GCKeyboardEventHIDAdapter *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _GCKeyboardEventHIDAdapter *v12;
  _GCKeyboardEventHIDAdapter *v13;

  v4 = a3;
  materializedObject = self->_materializedObject;
  if (materializedObject)
    goto LABEL_2;
  -[_GCHIDEventSourceDescription materializeWithContext:](self->_sourceDescription, "materializeWithContext:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v8 = (void *)v7;
  -[_GCCControllerHIDServiceInfoDescription materializeWithContext:](self->_serviceDescription, "materializeWithContext:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_serviceDescription && !v9)
  {

    goto LABEL_7;
  }
  v12 = -[_GCKeyboardEventHIDAdapter initWithSource:service:]([_GCKeyboardEventHIDAdapter alloc], "initWithSource:service:", v8, v9);
  v13 = self->_materializedObject;
  self->_materializedObject = v12;

  materializedObject = self->_materializedObject;
LABEL_2:
  v6 = materializedObject;
LABEL_8:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedObject, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_sourceDescription, 0);
}

@end
