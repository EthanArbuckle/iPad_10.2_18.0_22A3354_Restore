@implementation HDCarouselServicesManager

- (HDCarouselServicesManager)init
{
  HDCarouselServicesManager *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  HDAssertionManager *v5;
  HDAssertionManager *assertionManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDCarouselServicesManager;
  v2 = -[HDCarouselServicesManager init](&v8, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v5;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v2->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v2, CFSTR("HDWorkoutSessionAssertionIdentifierCarousel"), v2->_queue);
  }
  return v2;
}

- (id)takeSessionAssertionForOwnerIdentifier:(id)a3
{
  id v4;
  _HDCarouselSessionAssertion *v5;
  HDCarouselServicesManager *v6;
  HDCarouselServicesManager *v7;
  HDCarouselServicesManager *v8;
  objc_super v10;

  v4 = a3;
  v5 = [_HDCarouselSessionAssertion alloc];
  if (v5)
  {
    v10.receiver = v5;
    v10.super_class = (Class)_HDCarouselSessionAssertion;
    v6 = -[HDCarouselServicesManager initWithAssertionIdentifier:ownerIdentifier:](&v10, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDWorkoutSessionAssertionIdentifierCarousel"), v4);
  }
  else
  {
    v6 = 0;
  }
  if (-[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v6))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)takeSessionAssertionForOwnerIdentifier:(id)a3 supportsAOT:(BOOL)a4
{
  id result;

  result = -[HDCarouselServicesManager takeSessionAssertionForOwnerIdentifier:](self, "takeSessionAssertionForOwnerIdentifier:", a3);
  if (result)
    *((_BYTE *)result + 80) = a4;
  return result;
}

- (id)takeDisableAOTAssertionForOwnerIdentifier:(id)a3
{
  id v4;
  _HDDisableAOTAssertion *v5;
  HDCarouselServicesManager *v6;
  objc_super v8;

  v4 = a3;
  v5 = [_HDDisableAOTAssertion alloc];
  if (v5)
  {
    v8.receiver = v5;
    v8.super_class = (Class)_HDDisableAOTAssertion;
    v6 = -[HDCarouselServicesManager initWithAssertionIdentifier:ownerIdentifier:](&v8, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDWorkoutSessionAssertionIdentifierDisableAOT"), v4);
  }
  else
  {
    v6 = 0;
  }
  -[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v6);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
