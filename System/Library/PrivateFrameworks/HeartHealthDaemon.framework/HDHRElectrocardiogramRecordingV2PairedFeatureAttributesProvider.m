@implementation HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider

- (HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider)initWithPairedFeatureAttributesProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4
{
  id v7;
  id v8;
  HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider *v9;
  HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider;
  v9 = -[HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributesProvider, a3);
    objc_storeStrong((id *)&v10->_pairedDeviceProvider, a4);
  }

  return v10;
}

- (HKPairedFeatureAttributes)currentPairedFeatureAttributes
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  __CFString **v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  -[HDPairedFeatureAttributesProviding currentPairedFeatureAttributes](self->_attributesProvider, "currentPairedFeatureAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAppleWatch");

    v7 = &HKHRElectrocardiogramRecordingV2PhoneUDIDeviceIdentifier;
    if (v6)
      v7 = HKHRElectrocardiogramRecordingV2WatchUDIDeviceIdentifier;
    v8 = *v7;
    -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceProvider, "activePairedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D516A0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D51760]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HKFeatureUpdateVersionFromMajorVersionAndBuildVersion();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        HKUDIDeviceIdentifierFromDeviceIdentifierAndBatchNumber();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D51690]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66B0]), "initWithFeatureVersion:updateVersion:UDIDeviceIdentifier:yearOfRelease:", CFSTR("2"), v12, v13, v14);

      }
    }
    else
    {
      v4 = 0;
    }

  }
  v15 = objc_alloc(MEMORY[0x1E0CB69D0]);
  -[HDPairedFeatureAttributesProviding currentPairedFeatureAttributes](self->_attributesProvider, "currentPairedFeatureAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithLocalAttributes:pairedAttributes:", v17, v4);

  return (HKPairedFeatureAttributes *)v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceProvider, 0);
  objc_storeStrong((id *)&self->_attributesProvider, 0);
}

@end
