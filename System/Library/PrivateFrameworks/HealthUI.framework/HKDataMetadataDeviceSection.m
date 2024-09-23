@implementation HKDataMetadataDeviceSection

- (HKDataMetadataDeviceSection)initWithSample:(id)a3
{
  return -[HKDataMetadataDeviceSection initWithSample:regulatedFeatureInfoProvider:](self, "initWithSample:regulatedFeatureInfoProvider:", a3, 0);
}

- (HKDataMetadataDeviceSection)initWithSample:(id)a3 regulatedFeatureInfoProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HKDataMetadataDeviceSection *v10;
  HKDataMetadataDeviceSection *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DEVICE_DETAILS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)HKDataMetadataDeviceSection;
  v10 = -[HKDataMetadataSimpleSection initWithTitle:](&v13, sel_initWithTitle_, v9);

  if (!v10)
    goto LABEL_5;
  objc_msgSend(v6, "device");
  v11 = (HKDataMetadataDeviceSection *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HKDataMetadataDeviceSection _loadDetailsForSample:regulatedFeatureInfoProvider:](v10, "_loadDetailsForSample:regulatedFeatureInfoProvider:", v6, v7);
    if (-[HKDataMetadataSimpleSection numberOfRowsInSection](v10, "numberOfRowsInSection"))
    {
      v11 = v10;
      goto LABEL_6;
    }
LABEL_5:
    v11 = 0;
  }
LABEL_6:

  return v11;
}

- (void)_loadDetailsForSample:(id)a3 regulatedFeatureInfoProvider:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[4];

  v74[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v65 = a4;
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sampleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DEVICE_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v9;
    v74[1] = CFSTR("DeviceName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v11, v13, v15);

  }
  objc_msgSend(v7, "manufacturer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v7, "manufacturer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DEVICE_MANUFACTURER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v9;
    v73[1] = CFSTR("DeviceManufacturer");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v17, v19, v21);

  }
  objc_msgSend(v7, "model");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v7, "_connectedGymDeviceTypeName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(v7, "model");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DEVICE_MODEL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v9;
    v72[1] = CFSTR("DeviceModel");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v26, v28, v30);

  }
  objc_msgSend(v7, "hardwareVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v7, "hardwareVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("DEVICE_HARDWARE_VERS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v9;
    v71[1] = CFSTR("DeviceHardwareVersion");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v32, v34, v36);

  }
  objc_msgSend(v7, "firmwareVersion");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v7, "firmwareVersion");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("DEVICE_FIRMWARE_VERS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v9;
    v70[1] = CFSTR("DeviceFirmwareVersion");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v38, v40, v42);

  }
  objc_msgSend(v7, "softwareVersion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v7, "softwareVersion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("DEVICE_SOFTWARE_VERS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v9;
    v69[1] = CFSTR("DeviceSoftwareVersion");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v44, v46, v48);

  }
  objc_msgSend(v7, "UDIDeviceIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v7, "UDIDeviceIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("DEVICE_FDA_UDI"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v9;
    v68[1] = CFSTR("DeviceUDI");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v50, v52, v54);

  }
  objc_msgSend(v65, "featureVersionForSample:", v6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("DEVICE_REGULATED_FEATURE_VERS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v9;
    v67[1] = CFSTR("DeviceFeatureVersion");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v55, v57, v59);

  }
  objc_msgSend(v65, "updateVersionForSample:", v6);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("DEVICE_REGULATED_UPDATE_VERS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v9;
    v66[1] = CFSTR("DeviceUpdateVersion");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleSection addText:detail:baseIdentifier:](self, "addText:detail:baseIdentifier:", v60, v62, v64);

  }
}

@end
