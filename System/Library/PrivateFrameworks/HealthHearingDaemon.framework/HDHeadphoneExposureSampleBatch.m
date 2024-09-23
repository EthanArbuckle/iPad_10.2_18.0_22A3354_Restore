@implementation HDHeadphoneExposureSampleBatch

+ (id)batchWithJournaledSamples:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithSamples:journaled:anchor:", v3, 1, 0);

  return v4;
}

+ (id)batchWithAddedSamples:(id)a3 anchor:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithSamples:journaled:anchor:", v6, 0, v5);

  return v7;
}

- (id)_initWithSamples:(id)a3 journaled:(BOOL)a4 anchor:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HDHeadphoneExposureSampleBatch *v13;
  uint64_t v14;
  NSArray *samples;
  HDHeadphoneExposureSampleBatch *v16;
  objc_super v18;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v6)
  {
    if (!v10)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneExposureSampleBatch.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchor == nil"));
  }
  else
  {
    if (v10)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneExposureSampleBatch.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchor != nil"));
  }

LABEL_5:
  v18.receiver = self;
  v18.super_class = (Class)HDHeadphoneExposureSampleBatch;
  v13 = -[HDHeadphoneExposureSampleBatch init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v9, "copy");
    samples = v13->_samples;
    v13->_samples = (NSArray *)v14;

    v13->_journaled = v6;
    objc_storeStrong((id *)&v13->_anchor, a5);
    v13->_canTriggerUserNotification = objc_msgSend(v9, "hk_containsObjectPassingTest:", &__block_literal_global_0);
    v16 = v13;
  }

  return v13;
}

uint64_t __68__HDHeadphoneExposureSampleBatch__initWithSamples_journaled_anchor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_canTriggerHeadphoneExposureNotification");
}

- (NSArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
  objc_storeStrong((id *)&self->_samples, a3);
}

- (BOOL)isJournaled
{
  return self->_journaled;
}

- (void)setJournaled:(BOOL)a3
{
  self->_journaled = a3;
}

- (NSNumber)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (BOOL)canTriggerUserNotification
{
  return self->_canTriggerUserNotification;
}

- (void)setCanTriggerUserNotification:(BOOL)a3
{
  self->_canTriggerUserNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_samples, 0);
}

@end
