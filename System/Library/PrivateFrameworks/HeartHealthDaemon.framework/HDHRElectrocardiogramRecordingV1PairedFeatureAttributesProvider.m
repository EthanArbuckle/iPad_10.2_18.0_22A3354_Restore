@implementation HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider

- (HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider)initWithPairedFeatureAttributesProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4
{
  id v7;
  id v8;
  HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider *v9;
  HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider;
  v9 = -[HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider init](&v12, sel_init);
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  -[HDPairedFeatureAttributesProviding currentPairedFeatureAttributes](self->_attributesProvider, "currentPairedFeatureAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_pairedDeviceProvider, "activePairedDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D516A8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51698]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51690]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB66B0]), "initWithFeatureVersion:updateVersion:UDIDeviceIdentifier:yearOfRelease:", CFSTR("1"), v7, v8, v9);

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  v10 = objc_alloc(MEMORY[0x1E0CB69D0]);
  -[HDPairedFeatureAttributesProviding currentPairedFeatureAttributes](self->_attributesProvider, "currentPairedFeatureAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithLocalAttributes:pairedAttributes:", v12, v4);

  return (HKPairedFeatureAttributes *)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceProvider, 0);
  objc_storeStrong((id *)&self->_attributesProvider, 0);
}

@end
