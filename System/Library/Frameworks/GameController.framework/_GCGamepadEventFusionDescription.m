@implementation _GCGamepadEventFusionDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventFusionDescription)initWithConfiguration:(id)a3 sources:(id)a4
{
  id v7;
  id v8;
  _GCGamepadEventFusionDescription *v9;
  _GCGamepadEventFusionDescription *v10;
  uint64_t v11;
  NSArray *sourcesDescription;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCGamepadEventFusionDescription;
  v9 = -[_GCGamepadEventFusionDescription init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    v11 = objc_msgSend(v8, "copy");
    sourcesDescription = v10->_sourcesDescription;
    v10->_sourcesDescription = (NSArray *)v11;

  }
  return v10;
}

- (_GCGamepadEventFusionDescription)init
{
  -[_GCGamepadEventFusionDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (_GCGamepadEventFusionDescription)initWithCoder:(id)a3
{
  id v4;
  _GCGamepadEventFusionDescription *v5;
  uint64_t v6;
  _GCGamepadEventFusionConfig *config;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *sourcesDescription;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GCGamepadEventFusionDescription;
  v5 = -[_GCGamepadEventFusionDescription init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("config"));
    v6 = objc_claimAutoreleasedReturnValue();
    config = v5->_config;
    v5->_config = (_GCGamepadEventFusionConfig *)v6;

    _GCGamepadEventSourceDescription_Classes();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByAddingObject:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sources"));
    v10 = objc_claimAutoreleasedReturnValue();
    sourcesDescription = v5->_sourcesDescription;
    v5->_sourcesDescription = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sourcesDescription;
  id v5;

  sourcesDescription = self->_sourcesDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourcesDescription, CFSTR("sources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_config, CFSTR("config"));

}

- (id)materializeWithContext:(id)a3
{
  id v4;
  _GCGamepadEventFusion *materializedObject;
  _GCGamepadEventFusion *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _GCGamepadEventFusion *v15;
  _GCGamepadEventFusion *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  materializedObject = self->_materializedObject;
  if (!materializedObject)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", -[NSArray count](self->_sourcesDescription, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_sourcesDescription;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "materializeWithContext:", v4, (_QWORD)v18);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

            v6 = 0;
            goto LABEL_13;
          }
          v14 = (void *)v13;
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }

    v15 = -[_GCGamepadEventFusion initWithConfiguration:sources:]([_GCGamepadEventFusion alloc], "initWithConfiguration:sources:", self->_config, v7);
    v16 = self->_materializedObject;
    self->_materializedObject = v15;

    materializedObject = self->_materializedObject;
  }
  v6 = materializedObject;
LABEL_13:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedObject, 0);
  objc_storeStrong((id *)&self->_sourcesDescription, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
