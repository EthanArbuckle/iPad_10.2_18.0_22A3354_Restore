@implementation _HDDeferredFeaturePropertiesWriting

- (_HDDeferredFeaturePropertiesWriting)initWithLocalDomain:(id)a3 pairedDeviceRegistry:(id)a4
{
  id v7;
  _HDDeferredFeaturePropertiesWriting *v8;
  _HDDeferredFeaturePropertiesWriting *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HDDeferredFeaturePropertiesWriting;
  v8 = -[_HDFeaturePropertiesWriting initWithLocalDomain:](&v11, sel_initWithLocalDomain_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_pairedDeviceRegistry, a4);

  return v9;
}

- (void)synchronize
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___HDDeferredFeaturePropertiesWriting_synchronize__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  if (qword_1ED552488 != -1)
    dispatch_once(&qword_1ED552488, block);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __50___HDDeferredFeaturePropertiesWriting_synchronize__block_invoke_2;
  v4[3] = &unk_1E6CE80E8;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)_MergedGlobals_217, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
}

@end
