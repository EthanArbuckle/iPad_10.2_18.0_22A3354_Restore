@implementation HMDHAPMetricsLogEvent

- (void)updateWithHAPAccessoryServer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EFB9F7B8))
    v4 = v16;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "readAndResetHAPMetrics:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (objc_msgSend(v16, "linkType") == 1)
      {
        p_lock = &self->_lock;
        os_unfair_lock_lock_with_options();
        objc_msgSend(v6, "hmf_numberForKey:", &unk_1E8B335E8);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        self->_accessoryServerInvalidations += objc_msgSend(v8, "unsignedIntegerValue");

        objc_msgSend(v6, "hmf_numberForKey:", &unk_1E8B33600);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        self->_sentHTTPRequests += objc_msgSend(v9, "unsignedIntegerValue");

        objc_msgSend(v6, "hmf_numberForKey:", &unk_1E8B33618);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self->_receivedHTTPResponses += objc_msgSend(v10, "unsignedIntegerValue");

        objc_msgSend(v6, "hmf_numberForKey:", &unk_1E8B33630);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");
        v13 = &OBJC_IVAR___HMDHAPMetricsLogEvent__receivedHTTPEvents;
LABEL_10:
        *(Class *)((char *)&self->super.super.isa + *v13) = (Class)(*(char **)((char *)&self->super.super.isa + *v13)
                                                                  + v12);

        os_unfair_lock_unlock(p_lock);
        goto LABEL_11;
      }
      if (objc_msgSend(v16, "linkType") == 2)
      {
        p_lock = &self->_lock;
        os_unfair_lock_lock_with_options();
        objc_msgSend(v6, "hmf_numberForKey:", &unk_1E8B335E8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self->_btleConnections += objc_msgSend(v14, "unsignedIntegerValue");

        objc_msgSend(v6, "hmf_numberForKey:", &unk_1E8B33600);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        self->_btleDiscoveries += objc_msgSend(v15, "unsignedIntegerValue");

        objc_msgSend(v6, "hmf_numberForKey:", &unk_1E8B33618);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");
        v13 = &OBJC_IVAR___HMDHAPMetricsLogEvent__btleConnectionPerReasons;
        goto LABEL_10;
      }
    }
LABEL_11:

  }
}

- (unint64_t)sentHTTPRequests
{
  return self->_sentHTTPRequests;
}

- (unint64_t)receivedHTTPResponses
{
  return self->_receivedHTTPResponses;
}

- (unint64_t)receivedHTTPEvents
{
  return self->_receivedHTTPEvents;
}

- (unint64_t)accessoryServerInvalidations
{
  return self->_accessoryServerInvalidations;
}

- (unint64_t)btleConnections
{
  return self->_btleConnections;
}

- (unint64_t)btleDiscoveries
{
  return self->_btleDiscoveries;
}

- (unint64_t)btleConnectionPerReasons
{
  return self->_btleConnectionPerReasons;
}

@end
