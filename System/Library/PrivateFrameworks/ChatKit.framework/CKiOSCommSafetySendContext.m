@implementation CKiOSCommSafetySendContext

+ (id)contextKey
{
  return CFSTR("CKCommSafetyContextKeyiOSSend");
}

+ (id)contextWithComposition:(id)a3 sensitiveMediaObjects:(id)a4 identifiersOfShelvedImages:(id)a5
{
  id v7;
  id v8;
  id v9;
  CKiOSCommSafetySendContext *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CKiOSCommSafetySendContext initWithComposition:sensitiveMediaObjects:identifiersOfShelvedImages:]([CKiOSCommSafetySendContext alloc], "initWithComposition:sensitiveMediaObjects:identifiersOfShelvedImages:", v9, v8, v7);

  return v10;
}

- (CKiOSCommSafetySendContext)initWithComposition:(id)a3 sensitiveMediaObjects:(id)a4 identifiersOfShelvedImages:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKiOSCommSafetySendContext *v12;
  CKiOSCommSafetySendContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKiOSCommSafetySendContext;
  v12 = -[CKiOSCommSafetySendContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_composition, a3);
    objc_storeStrong((id *)&v13->_sensitiveMediaObjects, a4);
    objc_storeStrong((id *)&v13->_identifiersOfShelvedImages, a5);
  }

  return v13;
}

- (CKComposition)composition
{
  return self->_composition;
}

- (NSSet)sensitiveMediaObjects
{
  return self->_sensitiveMediaObjects;
}

- (NSArray)identifiersOfShelvedImages
{
  return self->_identifiersOfShelvedImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfShelvedImages, 0);
  objc_storeStrong((id *)&self->_sensitiveMediaObjects, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

@end
