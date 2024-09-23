@implementation _HDPeriodicCountryMonitorPairedBuildIdentifiers

- (_HDPeriodicCountryMonitorPairedBuildIdentifiers)initWithPairingIdentifier:(id)a3 buildIdentifier:(id)a4
{
  id v6;
  id v7;
  _HDPeriodicCountryMonitorPairedBuildIdentifiers *v8;
  uint64_t v9;
  NSString *pairingIdentifier;
  uint64_t v11;
  NSString *buildIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HDPeriodicCountryMonitorPairedBuildIdentifiers;
  v8 = -[_HDPeriodicCountryMonitorPairedBuildIdentifiers init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    pairingIdentifier = v8->_pairingIdentifier;
    v8->_pairingIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    buildIdentifier = v8->_buildIdentifier;
    v8->_buildIdentifier = (NSString *)v11;

  }
  return v8;
}

- (NSString)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (NSString)buildIdentifier
{
  return self->_buildIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildIdentifier, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
}

@end
