@implementation ITIdleTimerDescriptor

- (void)setTimeouts:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *timeouts;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerDescriptor.m"), 38, CFSTR("<%p> - timeouts must have at least one timeout."), v5);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v10 = 0;
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "duration");
        v10 = v13;
        if (!BSFloatGreaterThanFloat() || BSFloatEqualToFloat())
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerDescriptor.m"), 43, CFSTR("<%g> - timeout must be positive and valid"), v10);

        }
        if ((BSFloatGreaterThanFloat() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerDescriptor.m"), 44, CFSTR("<%g>, <%g> - timeouts must be strictly increasing"), v12, v10, (_QWORD)v20);

        }
        ++v11;
        v12 = v10;
      }
      while (v8 != v11);
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v8 = v16;
    }
    while (v16);
  }

  v17 = (NSArray *)objc_msgSend(v6, "copy");
  timeouts = self->_timeouts;
  self->_timeouts = v17;

}

- (void)setAttentionSamplingStartDelay:(double)a3
{
  void *v6;

  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerDescriptor.m"), 52, CFSTR("Attention sample start delay must be nonnegative."));

  }
  self->_attentionSamplingStartDelay = a3;
}

- (double)attentionSamplingStartBeforeFirstTimeout
{
  void *v4;
  double v5;
  double v6;
  void *v8;

  if (!-[NSArray count](self->_timeouts, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerDescriptor.m"), 58, CFSTR("<%p> - timeouts must have at least one timeout."), self->_timeouts);

  }
  -[NSArray firstObject](self->_timeouts, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v6 = v5;

  return v6 - self->_attentionSamplingStartDelay;
}

- (void)setAttentionSamplingStartBeforeFirstTimeout:(double)a3
{
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  if (!-[NSArray count](self->_timeouts, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerDescriptor.m"), 66, CFSTR("<%p> - timeouts must have at least one timeout."), self->_timeouts);

  }
  -[NSArray firstObject](self->_timeouts, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duration");
  v8 = v7;

  v9 = v8 - a3;
  if (v8 - a3 < 0.0)
    v9 = 0.0;
  -[ITIdleTimerDescriptor setAttentionSamplingStartDelay:](self, "setAttentionSamplingStartDelay:", v9);
}

- (void)setAttentionEventMaintenanceMask:(unint64_t)a3 recoveryMask:(unint64_t)a4
{
  self->_attentionMaintenanceEventMask = a3;
  self->_attentionRecoveryEventMask = a4;
}

- (void)setAttentionEventMask:(unint64_t)a3
{
  -[ITIdleTimerDescriptor setAttentionEventMaintenanceMask:recoveryMask:](self, "setAttentionEventMaintenanceMask:recoveryMask:", a3, a3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[ITIdleTimerDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_attentionMaintenanceEventMask, CFSTR("attentionMaintenanceEventMask"));
  v5 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_attentionRecoveryEventMask, CFSTR("attentionRecoveryEventMask"));
  objc_msgSend(v3, "itidletimerdescriptor_appendTimeInterval:withName:", CFSTR("attentionSamplingPeriod"), self->_attentionSamplingPeriod);
  objc_msgSend(v3, "itidletimerdescriptor_appendTimeInterval:withName:", CFSTR("attentionSamplingStartDelay"), self->_attentionSamplingStartDelay);
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_timeouts, CFSTR("timeouts"), 0);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[ITIdleTimerDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ITIdleTimerDescriptor *v5;
  uint64_t v6;
  NSArray *timeouts;

  v5 = -[ITIdleTimerDescriptor init](+[ITIdleTimerDescriptor allocWithZone:](ITIdleTimerDescriptor, "allocWithZone:"), "init");
  v5->_attentionMaintenanceEventMask = self->_attentionMaintenanceEventMask;
  v5->_attentionRecoveryEventMask = self->_attentionRecoveryEventMask;
  v5->_attentionSamplingPeriod = self->_attentionSamplingPeriod;
  v5->_attentionSamplingStartDelay = self->_attentionSamplingStartDelay;
  v6 = -[NSArray copyWithZone:](self->_timeouts, "copyWithZone:", a3);
  timeouts = v5->_timeouts;
  v5->_timeouts = (NSArray *)v6;

  return v5;
}

- (unint64_t)attentionMaintenanceEventMask
{
  return self->_attentionMaintenanceEventMask;
}

- (unint64_t)attentionRecoveryEventMask
{
  return self->_attentionRecoveryEventMask;
}

- (double)attentionSamplingPeriod
{
  return self->_attentionSamplingPeriod;
}

- (void)setAttentionSamplingPeriod:(double)a3
{
  self->_attentionSamplingPeriod = a3;
}

- (double)attentionSamplingStartDelay
{
  return self->_attentionSamplingStartDelay;
}

- (NSArray)timeouts
{
  return self->_timeouts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeouts, 0);
}

@end
