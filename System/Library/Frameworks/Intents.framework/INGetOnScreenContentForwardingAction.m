@implementation INGetOnScreenContentForwardingAction

- (INGetOnScreenContentForwardingAction)initWithSceneIdentifier:(id)a3 serviceOptions:(id)a4
{
  id v7;
  id v8;
  INIntent *v9;
  INGetOnScreenContentForwardingAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(INIntent);
  v12.receiver = self;
  v12.super_class = (Class)INGetOnScreenContentForwardingAction;
  v10 = -[INIntentForwardingAction initWithIntent:](&v12, sel_initWithIntent_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_sceneIdentifier, a3);
    objc_storeStrong((id *)&v10->_serviceOptions, a4);
  }

  return v10;
}

- (INGetOnScreenContentForwardingAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  INGetOnScreenContentForwardingAction *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v6 = (void *)getWFOnScreenContentServiceOptionsClass_softClass;
  v15 = getWFOnScreenContentServiceOptionsClass_softClass;
  if (!getWFOnScreenContentServiceOptionsClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getWFOnScreenContentServiceOptionsClass_block_invoke;
    v11[3] = &unk_1E22953C0;
    v11[4] = &v12;
    __getWFOnScreenContentServiceOptionsClass_block_invoke((uint64_t)v11);
    v6 = (void *)v13[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("serviceOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[INGetOnScreenContentForwardingAction initWithSceneIdentifier:serviceOptions:](self, "initWithSceneIdentifier:serviceOptions:", v5, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetOnScreenContentForwardingAction;
  v4 = a3;
  -[INIntentForwardingAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneIdentifier, CFSTR("sceneIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceOptions, CFSTR("serviceOptions"));

}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (WFOnScreenContentServiceOptions)serviceOptions
{
  return self->_serviceOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOptions, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
