@implementation HFServiceIconFactory

uint64_t __48__HFServiceIconFactory_iconModifiersForService___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicType");
}

+ (id)defaultIconDescriptorForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "hf_isTelevision"))
  {
    objc_msgSend(v4, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFServiceIconFactory iconDescriptorForAccessory:](HFServiceIconFactory, "iconDescriptorForAccessory:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "hf_effectiveServiceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceSubtype");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "defaultIconDescriptorForServiceType:serviceSubtype:", v5, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)_defaultIconDescriptorForServiceType:(id)a3 serviceSubtype:(id)a4 fallbackToPlaceholderIcon:(BOOL)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_iconSetForServiceType:serviceSubtype:fallbackToPlaceholderIcon:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_iconSetForServiceType:(id)a3 serviceSubtype:(id)a4 fallbackToPlaceholderIcon:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (qword_1ED378D40 != -1)
    dispatch_once(&qword_1ED378D40, &__block_literal_global_27_1);
  objc_msgSend(a1, "_multiSubtypeIconSetForServiceType:serviceSubtype:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend((id)qword_1ED378D38, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 && v5)
    {
      +[HFServiceIconSet placeholderIconSet](HFServiceIconSet, "placeholderIconSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

+ (id)_multiSubtypeIconSetForServiceType:(id)a3 serviceSubtype:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (_MergedGlobals_219 != -1)
    dispatch_once(&_MergedGlobals_219, &__block_literal_global_21);
  v7 = (id)qword_1ED378D30;
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_10;
  v10 = *MEMORY[0x1E0CB9988];
  if (v6)
    v11 = v6;
  else
    v11 = (id)*MEMORY[0x1E0CB9988];
  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CBA7E0], "localizedDescriptionForServiceType:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Service type %@ is missing a fallback icon set for an Unknown subtype! A fallback icon set is required."), v13);

LABEL_10:
      v12 = 0;
    }
  }

  return v12;
}

+ (id)defaultIconDescriptorForServiceType:(id)a3 serviceSubtype:(id)a4
{
  return (id)objc_msgSend(a1, "_defaultIconDescriptorForServiceType:serviceSubtype:fallbackToPlaceholderIcon:", a3, a4, 1);
}

+ (id)iconModifiersForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_103_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CB88E8];
  if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CB88E8]))
  {
    objc_msgSend(v3, "hf_characteristicOfType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hf_percentageForCharacteristicValue:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("HFIconModifierHue"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("HFIconModifierHue"));
    }

  }
  v13 = *MEMORY[0x1E0CB8A00];
  if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CB8A00]))
  {
    objc_msgSend(v3, "hf_characteristicOfType:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hf_percentageForCharacteristicValue:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("HFIconModifierSaturation"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("HFIconModifierSaturation"));
    }

  }
  v19 = *MEMORY[0x1E0CB87C0];
  if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CB87C0]))
  {
    objc_msgSend(v3, "hf_characteristicOfType:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hf_percentageForCharacteristicValue:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("HFIconModifierBrightness"));

  }
  v24 = *MEMORY[0x1E0CB8810];
  if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CB8810]))
  {
    objc_msgSend(v3, "hf_characteristicOfType:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hf_percentageForCharacteristicValue:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("HFIconModifierColorTemperature"));

  }
  return v4;
}

void __74__HFServiceIconFactory__multiSubtypeIconSetForServiceType_serviceSubtype___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  HFCAPackageIconDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0CB9B08];
  v11[0] = *MEMORY[0x1E0CB9988];
  _HFFaucetIconSet();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v0;
  v11[1] = *MEMORY[0x1E0CB9970];
  _HFFaucetIconSet();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v1;
  v11[2] = *MEMORY[0x1E0CB9990];
  _HFFaucetIconSet();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v2;
  v11[3] = *MEMORY[0x1E0CB9980];
  v14[0] = CFSTR("HFCAPackageIconIdentifierValveCeilingJet");
  v14[1] = CFSTR("HFCAPackageIconIdentifierValveSideJets");
  v14[2] = CFSTR("HFCAPackageIconIdentifierValveHandheldShowerHead");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierValveShowerHead"));
  objc_msgSend(v3, "na_map:", &__block_literal_global_148);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[3] = v6;
  v11[4] = *MEMORY[0x1E0CB9978];
  _HFSprinklerIconSet();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)qword_1ED378D30;
  qword_1ED378D30 = v9;

}

+ (id)iconDescriptorForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "hf_categoryOrPrimaryServiceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "iconDescriptorForAccessoryCategoryOrServiceType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFServiceIconFactory overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:](HFServiceIconFactory, "overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)overrideIconDescriptorForMultiServiceAccessory:(id)a3 iconDescriptor:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  HFCAPackageIconDescriptor *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  HFCAPackageIconDescriptor *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "hf_isMultiServiceAccessory") & 1) != 0)
  {
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      if (objc_msgSend(v5, "hf_isCeilingFanWithLight"))
      {
        objc_msgSend(v7, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("HFCAPackageIconIdentifierCeilingFanWithLight"));

        if ((v11 & 1) == 0)
        {
          v12 = [HFCAPackageIconDescriptor alloc];
          objc_msgSend(v9, "state");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "iconModifiers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:modifiers:](v12, "initWithPackageIdentifier:state:modifiers:", CFSTR("HFCAPackageIconIdentifierCeilingFanWithLight"), v13, v14);

          v7 = (id)v15;
        }
      }
      if (objc_msgSend(v5, "hf_isPowerStrip"))
      {
        objc_msgSend(v7, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("HFCAPackageIconIdentifierPowerStrip"));

        if ((v17 & 1) == 0)
        {
          v18 = [HFCAPackageIconDescriptor alloc];
          objc_msgSend(v9, "state");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "iconModifiers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:modifiers:](v18, "initWithPackageIdentifier:state:modifiers:", CFSTR("HFCAPackageIconIdentifierPowerStrip"), v19, v20);

          v7 = (id)v21;
        }
      }
    }
    v22 = v7;

  }
  else
  {
    v22 = v6;
  }

  return v22;
}

+ (id)iconDescriptorForAccessoryCategoryOrServiceType:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  HFImageIconDescriptor *v9;
  void *v10;
  id v11;
  void *v12;
  HFImageIconDescriptor *v13;
  HFCAPackageIconDescriptor *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v4 = a3;
  if (qword_1ED378D58 != -1)
    dispatch_once(&qword_1ED378D58, &__block_literal_global_91);
  v5 = (id)qword_1ED378D60;
  if (qword_1ED378D68 != -1)
    dispatch_once(&qword_1ED378D68, &__block_literal_global_94);
  v6 = (id)qword_1ED378D70;
  if (qword_1ED378D78 != -1)
    dispatch_once(&qword_1ED378D78, &__block_literal_global_97);
  v7 = (id)qword_1ED378D80;
  +[HFServiceIconFactory _defaultIconDescriptorForServiceType:serviceSubtype:fallbackToPlaceholderIcon:](HFServiceIconFactory, "_defaultIconDescriptorForServiceType:serviceSubtype:fallbackToPlaceholderIcon:", v4, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = (void *)*MEMORY[0x1E0CB7A70];
    if (v4)
      v10 = v4;
    v11 = v10;
    objc_msgSend(v6, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", v12);
      if (v13)
        goto LABEL_27;
    }
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB7A98]))
    {
      v14 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierGenericSensor"));
      +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "defaultIcon");
      v13 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_27;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(a1, "defaultIconDescriptorForServiceType:serviceSubtype:", v16, 0);
      v13 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_27;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_26;
    v19 = v18;
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("point.3.filled.connected.trianglepath.dotted")))
    {
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationPreferringMulticolor");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB7A18]) & 1) == 0
        && (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB7A58]) & 1) == 0
        && !objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB7AA8]))
      {
        v13 = -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", v19);
LABEL_25:

        if (v13)
        {
LABEL_27:
          v9 = v13;

          goto LABEL_28;
        }
LABEL_26:
        v13 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", CFSTR("HFImageIconIdentifierGeneric"));
        goto LABEL_27;
      }
      +[HFMediaHelper mediaContainerSymbolConfiguration](HFMediaHelper, "mediaContainerSymbolConfiguration");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v20;
    v13 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", v19, v20);

    goto LABEL_25;
  }
  v9 = v8;
LABEL_28:

  return v9;
}

void __88__HFServiceIconFactory__iconSetForServiceType_serviceSubtype_fallbackToPlaceholderIcon___block_invoke()
{
  HFCAPackageIconDescriptor *v0;
  HFCAPackageIconDescriptor *v1;
  HFCAPackageIconDescriptor *v2;
  HFCAPackageIconDescriptor *v3;
  void *v4;
  HFCAPackageIconDescriptor *v5;
  void *v6;
  void *v7;
  HFCAPackageIconDescriptor *v8;
  void *v9;
  HFCAPackageIconDescriptor *v10;
  HFCAPackageIconDescriptor *v11;
  void *v12;
  HFCAPackageIconDescriptor *v13;
  void *v14;
  HFCAPackageIconDescriptor *v15;
  void *v16;
  HFCAPackageIconDescriptor *v17;
  void *v18;
  HFCAPackageIconDescriptor *v19;
  HFCAPackageIconDescriptor *v20;
  void *v21;
  HFCAPackageIconDescriptor *v22;
  void *v23;
  HFCAPackageIconDescriptor *v24;
  HFCAPackageIconDescriptor *v25;
  void *v26;
  HFCAPackageIconDescriptor *v27;
  void *v28;
  HFCAPackageIconDescriptor *v29;
  void *v30;
  HFCAPackageIconDescriptor *v31;
  void *v32;
  void *v33;
  HFCAPackageIconDescriptor *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HFCAPackageIconDescriptor *v39;
  void *v40;
  void *v41;
  void *v42;
  HFCAPackageIconDescriptor *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[32];
  _QWORD v75[32];
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v74[0] = *MEMORY[0x1E0CB99B0];
  v0 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierAirQualitySensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v75[0] = v73;
  v74[1] = *MEMORY[0x1E0CB99E0];
  v1 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierCarbonDioxideSensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v75[1] = v72;
  v74[2] = *MEMORY[0x1E0CB99E8];
  v2 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierCarbonMonoxideSensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v75[2] = v71;
  v74[3] = *MEMORY[0x1E0CB99F0];
  v3 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierContactSensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v3);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v75[3] = v70;
  v74[4] = *MEMORY[0x1E0CB9A00];
  v76 = CFSTR("HFCAPackageIconIdentifierSlidingDoor");
  v77 = CFSTR("HFCAPackageIconIdentifierGate");
  v78 = CFSTR("HFCAPackageIconIdentifierFrenchDoor");
  v79 = CFSTR("HFCAPackageIconIdentifierSlidingDoorRightHand");
  v80 = CFSTR("HFCAPackageIconIdentifierDoorLeftHand");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierDoor"));
  objc_msgSend(v4, "na_map:", &__block_literal_global_148);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v5, v6);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v75[4] = v69;
  v74[5] = *MEMORY[0x1E0CB9A10];
  _HFFanServiceIconSet();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v75[5] = v68;
  v74[6] = *MEMORY[0x1E0CB9B10];
  _HFFanServiceIconSet();
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v75[6] = v67;
  v74[7] = *MEMORY[0x1E0CB9A28];
  v76 = CFSTR("HFCAPackageIconIdentifierGarageDoorDoubleBay");
  v77 = CFSTR("HFCAPackageIconIdentifierGate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierGarageDoor"));
  objc_msgSend(v7, "na_map:", &__block_literal_global_148);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v8, v9);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v75[7] = v66;
  v74[8] = *MEMORY[0x1E0CB9A40];
  v10 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierHumiditySensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v10);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v75[8] = v65;
  v74[9] = *MEMORY[0x1E0CB9A60];
  v11 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierLeakSensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v11);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v75[9] = v64;
  v74[10] = *MEMORY[0x1E0CB9A70];
  v76 = CFSTR("HFCAPackageIconIdentifierDeskLamp");
  v77 = CFSTR("HFCAPackageIconIdentifierCeilingLight");
  v78 = CFSTR("HFCAPackageIconIdentifierFloorLamp");
  v79 = CFSTR("HFCAPackageIconIdentifierTableLight");
  v80 = CFSTR("HFCAPackageIconIdentifierRecessedLight");
  v81 = CFSTR("HFCAPackageIconIdentifierLightPanel");
  v82 = CFSTR("HFCAPackageIconIdentifierCylindricalLight");
  v83 = CFSTR("HFCAPackageIconIdentifierLightStrip");
  v84 = CFSTR("HFCAPackageIconIdentifierChandelier");
  v85 = CFSTR("HFCAPackageIconIdentifierLightBulb2");
  v86 = CFSTR("HFCAPackageIconIdentifierLightbulbLED");
  v87 = CFSTR("HFCAPackageIconIdentifierLightbulbLEDWide");
  v88 = CFSTR("HFCAPackageIconIdentifierRecessedLight3");
  v89 = CFSTR("HFCAPackageIconIdentifierLightRibbon");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierLightbulb"));
  objc_msgSend(v12, "na_map:", &__block_literal_global_148);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v13, v14);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v75[10] = v63;
  v74[11] = *MEMORY[0x1E0CB9A68];
  v15 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierLightSensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v15);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v75[11] = v62;
  v74[12] = *MEMORY[0x1E0CB9A80];
  v76 = CFSTR("HFCAPackageIconIdentifierPINEntryDoorLock");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierDoorLock"));
  objc_msgSend(v16, "na_map:", &__block_literal_global_148);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v17, v18);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v75[12] = v61;
  v74[13] = *MEMORY[0x1E0CB9A90];
  v19 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierMotionSensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v19);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v75[13] = v60;
  v74[14] = *MEMORY[0x1E0CB9A98];
  v20 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierOccupancySensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v20);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v75[14] = v59;
  v74[15] = *MEMORY[0x1E0CB9AA0];
  v76 = CFSTR("HFCAPackageIconIdentifierOutletTypeA");
  v77 = CFSTR("HFCAPackageIconIdentifierOutletTypeC");
  v78 = CFSTR("HFCAPackageIconIdentifierOutletTypeG");
  v79 = CFSTR("HFCAPackageIconIdentifierOutletTypeI");
  v80 = CFSTR("HFCAPackageIconIdentifierOutletTypeK");
  v81 = CFSTR("HFCAPackageIconIdentifierOutletTypeN");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierOutletTypeB"));
  objc_msgSend(v21, "na_map:", &__block_literal_global_148);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v22, v23);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v75[15] = v58;
  v74[16] = *MEMORY[0x1E0CB9AA8];
  v24 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierSecuritySystem"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v24);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v75[16] = v57;
  v74[17] = *MEMORY[0x1E0CB9AB8];
  v25 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierSmokeSensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v25);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v75[17] = v56;
  v74[18] = *MEMORY[0x1E0CB9AD8];
  v76 = CFSTR("HFCAPackageIconIdentifierSwitch2");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierSwitch"));
  objc_msgSend(v26, "na_map:", &__block_literal_global_148);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v27, v28);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v75[18] = v55;
  v74[19] = *MEMORY[0x1E0CB9AF8];
  v29 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierTemperatureSensor"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v29);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v75[19] = v54;
  v74[20] = *MEMORY[0x1E0CB9B00];
  _HFThermostatIconSet();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v75[20] = v53;
  v74[21] = *MEMORY[0x1E0CB9B28];
  v76 = CFSTR("HFCAPackageIconIdentifierWindowHorizontal");
  v77 = CFSTR("HFCAPackageIconIdentifierWindowCeiling");
  v78 = CFSTR("HFCAPackageIconIdentifierWindowCasement");
  v79 = CFSTR("HFCAPackageIconIdentifierWindowAwning");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierWindowVertical"));
  objc_msgSend(v30, "na_map:", &__block_literal_global_148);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v31, v32);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v75[21] = v52;
  v74[22] = *MEMORY[0x1E0CB9B30];
  v76 = CFSTR("HFCAPackageIconIdentifierWindowCoveringBlindsVertical");
  v77 = CFSTR("HFCAPackageIconIdentifierWindowCoveringRollerShade");
  v78 = CFSTR("HFCAPackageIconIdentifierWindowCoveringRomanShade");
  v79 = CFSTR("HFCAPackageIconIdentifierWindowCoveringCurtains");
  v80 = CFSTR("HFCAPackageIconIdentifierWindowCoveringAwning");
  v81 = CFSTR("HFCAPackageIconIdentifierWindowCoveringGenericShade");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierWindowCoveringBlindsHorizontal"));
  objc_msgSend(v33, "na_map:", &__block_literal_global_148);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v75[22] = v36;
  v74[23] = *MEMORY[0x1E0CB9AD0];
  _HFProgrammableSwitchIconSet();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v75[23] = v37;
  v74[24] = *MEMORY[0x1E0CB9AC8];
  _HFProgrammableSwitchIconSet();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v75[24] = v38;
  v74[25] = *MEMORY[0x1E0CB99A8];
  v39 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierAirPurifier"));
  +[HFServiceIconSet setWithDefaultIcon:](HFServiceIconSet, "setWithDefaultIcon:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v75[25] = v40;
  v74[26] = *MEMORY[0x1E0CB9A30];
  _HFThermostatIconSet();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v75[26] = v41;
  v74[27] = *MEMORY[0x1E0CB9A38];
  v76 = CFSTR("HFCAPackageIconIdentifierDehumidifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierHumidifier"));
  objc_msgSend(v42, "na_map:", &__block_literal_global_148);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconSet setWithDefaultIcon:alternateIcons:](HFServiceIconSet, "setWithDefaultIcon:alternateIcons:", v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v75[27] = v45;
  v74[28] = *MEMORY[0x1E0CB9A50];
  _HFSprinklerIconSet();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v75[28] = v46;
  v74[29] = *MEMORY[0x1E0CB9A18];
  _HFFaucetIconSet();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v75[29] = v47;
  v74[30] = *MEMORY[0x1E0CB9B18];
  _HFNetworkRouterIconSet();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v75[30] = v48;
  v74[31] = *MEMORY[0x1E0CB9B20];
  _HFNetworkRouterIconSet();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v75[31] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 32);
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)qword_1ED378D38;
  qword_1ED378D38 = v50;

}

void __72__HFServiceIconFactory_iconDescriptorForAccessoryCategoryOrServiceType___block_invoke_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB7A18];
  v4[0] = *MEMORY[0x1E0CB7A28];
  v4[1] = v0;
  v5[0] = CFSTR("point.3.filled.connected.trianglepath.dotted");
  v5[1] = CFSTR("appletv.fill");
  v1 = *MEMORY[0x1E0CB7AA8];
  v4[2] = *MEMORY[0x1E0CB7A58];
  v4[3] = v1;
  v5[2] = CFSTR("homepod.fill");
  v5[3] = CFSTR("hifispeaker.fill");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378D80;
  qword_1ED378D80 = v2;

}

void __72__HFServiceIconFactory_iconDescriptorForAccessoryCategoryOrServiceType___block_invoke_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[10];
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB7A20];
  v6[0] = *MEMORY[0x1E0CB7A60];
  v6[1] = v0;
  v7[0] = CFSTR("HFCAPackageIconIdentifierIPCamera");
  v7[1] = CFSTR("HFCAPackageIconIdentifierReceiver");
  v1 = *MEMORY[0x1E0CB7AC8];
  v6[2] = *MEMORY[0x1E0CB7AC0];
  v6[3] = v1;
  v7[2] = CFSTR("HFCAPackageIconIdentifierRemoteControl");
  v7[3] = CFSTR("HFCAPackageIconIdentifierTelevision");
  v2 = *MEMORY[0x1E0CB7AE0];
  v6[4] = *MEMORY[0x1E0CB7AD8];
  v6[5] = v2;
  v7[4] = CFSTR("HFCAPackageIconIdentifierTelevisionSetTopBox");
  v7[5] = CFSTR("HFCAPackageIconIdentifierTelevisionStreamingStick");
  v6[6] = *MEMORY[0x1E0CB7AF0];
  v6[7] = CFSTR("9D302CDA-1467-4E19-ABC9-9ED36BE34508");
  v7[6] = CFSTR("HFCAPackageIconIdentifierVideoDoorbell");
  v7[7] = CFSTR("HFCAPackageIconIdentifierCeilingFanWithLight");
  v3 = *MEMORY[0x1E0CB7A08];
  v6[8] = CFSTR("3047A1A5-8BFC-4112-9888-21314F438FF3");
  v6[9] = v3;
  v7[8] = CFSTR("HFCAPackageIconIdentifierPowerStrip");
  v7[9] = CFSTR("HFCAPackageIconIdentifierAirport");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED378D70;
  qword_1ED378D70 = v4;

}

void __72__HFServiceIconFactory_iconDescriptorForAccessoryCategoryOrServiceType___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[23];
  _QWORD v32[24];

  v32[23] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB9AA8];
  v1 = *MEMORY[0x1E0CB7A30];
  v31[0] = *MEMORY[0x1E0CB7A90];
  v31[1] = v1;
  v2 = *MEMORY[0x1E0CB9A00];
  v32[0] = v0;
  v32[1] = v2;
  v3 = *MEMORY[0x1E0CB9A80];
  v4 = *MEMORY[0x1E0CB7A40];
  v31[2] = *MEMORY[0x1E0CB7A38];
  v31[3] = v4;
  v5 = *MEMORY[0x1E0CB9A10];
  v32[2] = v3;
  v32[3] = v5;
  v6 = *MEMORY[0x1E0CB9A28];
  v7 = *MEMORY[0x1E0CB7A60];
  v31[4] = *MEMORY[0x1E0CB7A50];
  v31[5] = v7;
  v8 = *MEMORY[0x1E0CB99D0];
  v32[4] = v6;
  v32[5] = v8;
  v9 = *MEMORY[0x1E0CB7A68];
  v31[6] = *MEMORY[0x1E0CB7AF0];
  v31[7] = v9;
  v10 = *MEMORY[0x1E0CB9A70];
  v32[6] = v8;
  v32[7] = v10;
  v11 = *MEMORY[0x1E0CB9AA0];
  v12 = *MEMORY[0x1E0CB7A80];
  v31[8] = *MEMORY[0x1E0CB7A78];
  v31[9] = v12;
  v13 = *MEMORY[0x1E0CB9AD0];
  v32[8] = v11;
  v32[9] = v13;
  v14 = *MEMORY[0x1E0CB9AD8];
  v15 = *MEMORY[0x1E0CB7AE8];
  v31[10] = *MEMORY[0x1E0CB7AB8];
  v31[11] = v15;
  v16 = *MEMORY[0x1E0CB9B00];
  v32[10] = v14;
  v32[11] = v16;
  v17 = *MEMORY[0x1E0CB9B28];
  v18 = *MEMORY[0x1E0CB7B08];
  v31[12] = *MEMORY[0x1E0CB7B00];
  v31[13] = v18;
  v19 = *MEMORY[0x1E0CB9B30];
  v32[12] = v17;
  v32[13] = v19;
  v20 = *MEMORY[0x1E0CB9A30];
  v21 = *MEMORY[0x1E0CB7A10];
  v31[14] = *MEMORY[0x1E0CB79E8];
  v31[15] = v21;
  v22 = *MEMORY[0x1E0CB99A8];
  v32[14] = v20;
  v32[15] = v22;
  v23 = *MEMORY[0x1E0CB7A00];
  v31[16] = *MEMORY[0x1E0CB79F8];
  v31[17] = v23;
  v24 = *MEMORY[0x1E0CB9A38];
  v32[16] = v20;
  v32[17] = v24;
  v25 = *MEMORY[0x1E0CB7AB0];
  v31[18] = *MEMORY[0x1E0CB79F0];
  v31[19] = v25;
  v26 = *MEMORY[0x1E0CB9A50];
  v32[18] = v24;
  v32[19] = v26;
  v27 = *MEMORY[0x1E0CB9A18];
  v28 = *MEMORY[0x1E0CB7AA0];
  v31[20] = *MEMORY[0x1E0CB7A48];
  v31[21] = v28;
  v32[20] = v27;
  v32[21] = v27;
  v31[22] = *MEMORY[0x1E0CB7AF8];
  v32[22] = *MEMORY[0x1E0CB9B18];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 23);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)qword_1ED378D60;
  qword_1ED378D60 = v29;

}

+ (id)defaultSymbolIconIdentifierForServiceType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED378D50;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED378D50, &__block_literal_global_28_2);
  objc_msgSend((id)qword_1ED378D48, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __66__HFServiceIconFactory_defaultSymbolIconIdentifierForServiceType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[32];
  _QWORD v19[33];

  v19[32] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB99B0];
  v18[0] = *MEMORY[0x1E0CB99A8];
  v18[1] = v0;
  v19[0] = CFSTR("air.purifier.fill");
  v19[1] = CFSTR("aqi.medium");
  v1 = *MEMORY[0x1E0CB99E8];
  v18[2] = *MEMORY[0x1E0CB99E0];
  v18[3] = v1;
  v19[2] = CFSTR("carbon.dioxide.cloud.fill");
  v19[3] = CFSTR("carbon.monoxide.cloud.fill");
  v2 = *MEMORY[0x1E0CB9A00];
  v18[4] = *MEMORY[0x1E0CB99F0];
  v18[5] = v2;
  v19[4] = CFSTR("contact.sensor.fill");
  v19[5] = CFSTR("door.right.hand.open");
  v3 = *MEMORY[0x1E0CB9A18];
  v18[6] = *MEMORY[0x1E0CB9A10];
  v18[7] = v3;
  v19[6] = CFSTR("fan.desk");
  v19[7] = CFSTR("faucet.fill");
  v4 = *MEMORY[0x1E0CB9A30];
  v18[8] = *MEMORY[0x1E0CB9A28];
  v18[9] = v4;
  v19[8] = CFSTR("door.garage.open");
  v19[9] = CFSTR("heater.vertical.fill");
  v5 = *MEMORY[0x1E0CB9A40];
  v18[10] = *MEMORY[0x1E0CB9A38];
  v18[11] = v5;
  v19[10] = CFSTR("humidifier.fill");
  v19[11] = CFSTR("humidity.fill");
  v6 = *MEMORY[0x1E0CB9A60];
  v18[12] = *MEMORY[0x1E0CB9A50];
  v18[13] = v6;
  v19[12] = CFSTR("sprinkler.water");
  v19[13] = CFSTR("pipe.and.drop.fill");
  v7 = *MEMORY[0x1E0CB9A70];
  v18[14] = *MEMORY[0x1E0CB9A68];
  v18[15] = v7;
  v19[14] = CFSTR("sun.max.fill");
  v19[15] = CFSTR("lightbulb.fill");
  v8 = *MEMORY[0x1E0CB9A90];
  v18[16] = *MEMORY[0x1E0CB9A80];
  v18[17] = v8;
  v19[16] = CFSTR("lock.open.fill");
  v19[17] = CFSTR("figure.walk.motion");
  v9 = *MEMORY[0x1E0CB9AA0];
  v18[18] = *MEMORY[0x1E0CB9A98];
  v18[19] = v9;
  v19[18] = CFSTR("figure.walk");
  v19[19] = CFSTR("poweroutlet.type.b.square.fill");
  v10 = *MEMORY[0x1E0CB9AB8];
  v18[20] = *MEMORY[0x1E0CB9AA8];
  v18[21] = v10;
  v19[20] = CFSTR("light.beacon.min.fill");
  v19[21] = CFSTR("smoke.fill");
  v11 = *MEMORY[0x1E0CB9AD0];
  v18[22] = *MEMORY[0x1E0CB9AC8];
  v18[23] = v11;
  v19[22] = CFSTR("switch.programmable.square.fill");
  v19[23] = CFSTR("switch.programmable.square.fill");
  v12 = *MEMORY[0x1E0CB9AF8];
  v18[24] = *MEMORY[0x1E0CB9AD8];
  v18[25] = v12;
  v19[24] = CFSTR("lightswitch.on.square.fill");
  v19[25] = CFSTR("thermometer.medium");
  v13 = *MEMORY[0x1E0CB9B10];
  v18[26] = *MEMORY[0x1E0CB9B00];
  v18[27] = v13;
  v19[26] = CFSTR("dial.medium.fill");
  v19[27] = CFSTR("fan.desk");
  v14 = *MEMORY[0x1E0CB9B20];
  v18[28] = *MEMORY[0x1E0CB9B18];
  v18[29] = v14;
  v19[28] = CFSTR("wifi.router.fill");
  v19[29] = CFSTR("wifi.router.fill");
  v15 = *MEMORY[0x1E0CB9B30];
  v18[30] = *MEMORY[0x1E0CB9B28];
  v18[31] = v15;
  v19[30] = CFSTR("window.vertical.open");
  v19[31] = CFSTR("blinds.horizontal.open");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 32);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_1ED378D48;
  qword_1ED378D48 = v16;

}

+ (id)iconDescriptorWithIdentifier:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "hf_effectiveServiceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceSubtype");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "iconDescriptorWithIdentifier:forServiceType:serviceSubtype:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)iconDescriptorWithIdentifier:(id)a3 forServiceType:(id)a4 serviceSubtype:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_replacementIdentifierForIconIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    HFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Replacing deprecated icon identifier %@ with %@", buf, 0x16u);
    }

    v13 = v11;
    v8 = v13;
  }
  objc_msgSend(a1, "allIconDescriptorsForServiceType:serviceSubtype:", v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__HFServiceIconFactory_iconDescriptorWithIdentifier_forServiceType_serviceSubtype___block_invoke;
  v19[3] = &unk_1EA729410;
  v15 = v8;
  v20 = v15;
  objc_msgSend(v14, "na_firstObjectPassingTest:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(a1, "defaultIconDescriptorForServiceType:serviceSubtype:", v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[HFServiceIconSet placeholderIconSet](HFServiceIconSet, "placeholderIconSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "defaultIcon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v16;
}

uint64_t __83__HFServiceIconFactory_iconDescriptorWithIdentifier_forServiceType_serviceSubtype___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)allIconDescriptorsForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "hf_effectiveServiceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSubtype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "allIconDescriptorsForServiceType:serviceSubtype:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)allIconDescriptorsForServiceType:(id)a3 serviceSubtype:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_iconSetForServiceType:serviceSubtype:fallbackToPlaceholderIcon:", a3, a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)iconDescriptorForAccessoryCategory:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "iconDescriptorForAccessoryCategoryOrServiceType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_replacementIdentifierForIconIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (qword_1ED378D88 != -1)
    dispatch_once(&qword_1ED378D88, &__block_literal_global_106_0);
  v4 = (id)qword_1ED378D90;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __64__HFServiceIconFactory__replacementIdentifierForIconIdentifier___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[62];
  _QWORD v3[63];

  v3[62] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HFImageIconIdentifierServiceLightbulb");
  v2[1] = CFSTR("HFImageIconIdentifierServiceCeilingLight");
  v3[0] = CFSTR("HFCAPackageIconIdentifierLightbulb");
  v3[1] = CFSTR("HFCAPackageIconIdentifierCeilingLight");
  v2[2] = CFSTR("HFImageIconIdentifierServiceDeskLamp");
  v2[3] = CFSTR("HFImageIconIdentifierServiceFloorLamp");
  v3[2] = CFSTR("HFCAPackageIconIdentifierDeskLamp");
  v3[3] = CFSTR("HFCAPackageIconIdentifierFloorLamp");
  v2[4] = CFSTR("HFImageIconIdentifierServiceFan");
  v2[5] = CFSTR("HFImageIconIdentifierServiceCeilingFan");
  v3[4] = CFSTR("HFCAPackageIconIdentifierDeskFan");
  v3[5] = CFSTR("HFCAPackageIconIdentifierCeilingFan");
  v2[6] = CFSTR("HFImageIconIdentifierServiceGarageDoor");
  v2[7] = CFSTR("HFImageIconIdentifierServiceLock");
  v3[6] = CFSTR("HFCAPackageIconIdentifierGarageDoor");
  v3[7] = CFSTR("HFCAPackageIconIdentifierDoorLock");
  v2[8] = CFSTR("HFImageIconIdentifierServiceSwitch");
  v2[9] = CFSTR("HFImageIconIdentifierServiceDoor");
  v3[8] = CFSTR("HFCAPackageIconIdentifierSwitch");
  v3[9] = CFSTR("HFCAPackageIconIdentifierDoor");
  v2[10] = CFSTR("HFImageIconIdentifierIPCamera");
  v2[11] = CFSTR("HFImageIconIdentifierVideoDoorbell");
  v3[10] = CFSTR("HFCAPackageIconIdentifierIPCamera");
  v3[11] = CFSTR("HFCAPackageIconIdentifierVideoDoorbell");
  v2[12] = CFSTR("HFImageIconIdentifierProgrammableSwitch");
  v2[13] = CFSTR("HFImageIconIdentifierServiceAirPurifier");
  v3[12] = CFSTR("HFCAPackageIconIdentifierProgrammableSwitch");
  v3[13] = CFSTR("HFCAPackageIconIdentifierAirPurifier");
  v2[14] = CFSTR("HFImageIconIdentifierServiceHumidifierDehumidifier");
  v2[15] = CFSTR("HFImageIconIdentifierServiceTelevisionOn");
  v3[14] = CFSTR("HFCAPackageIconIdentifierHumidifier");
  v3[15] = CFSTR("HFCAPackageIconIdentifierTelevision");
  v2[16] = CFSTR("HFImageIconIdentifierServiceTelevisionOff");
  v2[17] = CFSTR("HFImageIconIdentifierRemoteControl");
  v3[16] = CFSTR("HFCAPackageIconIdentifierTelevision");
  v3[17] = CFSTR("HFCAPackageIconIdentifierRemoteControl");
  v2[18] = CFSTR("HFImageIconIdentifierAppleTV");
  v2[19] = CFSTR("HFImageIconIdentifierServiceLightSensor");
  v3[18] = CFSTR("appletv.fill");
  v3[19] = CFSTR("HFCAPackageIconIdentifierLightSensor");
  v2[20] = CFSTR("HFImageIconIdentifierServiceTemperatureSensor");
  v2[21] = CFSTR("HFImageIconIdentifierServiceHumiditySensor");
  v3[20] = CFSTR("HFCAPackageIconIdentifierTemperatureSensor");
  v3[21] = CFSTR("HFCAPackageIconIdentifierHumiditySensor");
  v2[22] = CFSTR("HFImageIconIdentifierServiceAirQualitySensorOn");
  v2[23] = CFSTR("HFImageIconIdentifierServiceAirQualitySensorOff");
  v3[22] = CFSTR("HFCAPackageIconIdentifierAirQualitySensor");
  v3[23] = CFSTR("HFCAPackageIconIdentifierAirQualitySensor");
  v2[24] = CFSTR("HFImageIconIdentifierServiceContactSensorOpen");
  v2[25] = CFSTR("HFImageIconIdentifierServiceContactSensorClosed");
  v3[24] = CFSTR("HFCAPackageIconIdentifierContactSensor");
  v3[25] = CFSTR("HFCAPackageIconIdentifierContactSensor");
  v2[26] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOn");
  v2[27] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOff");
  v3[26] = CFSTR("HFCAPackageIconIdentifierCarbonDioxideSensor");
  v3[27] = CFSTR("HFCAPackageIconIdentifierCarbonDioxideSensor");
  v2[28] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOn");
  v2[29] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOff");
  v3[28] = CFSTR("HFCAPackageIconIdentifierCarbonMonoxideSensor");
  v3[29] = CFSTR("HFCAPackageIconIdentifierCarbonMonoxideSensor");
  v2[30] = CFSTR("HFImageIconIdentifierServiceLeakSensorOn");
  v2[31] = CFSTR("HFImageIconIdentifierServiceLeakSensorOff");
  v3[30] = CFSTR("HFCAPackageIconIdentifierLeakSensor");
  v3[31] = CFSTR("HFCAPackageIconIdentifierLeakSensor");
  v2[32] = CFSTR("HFImageIconIdentifierServiceMotionSensorOn");
  v2[33] = CFSTR("HFImageIconIdentifierServiceMotionSensorOff");
  v3[32] = CFSTR("HFCAPackageIconIdentifierMotionSensor");
  v3[33] = CFSTR("HFCAPackageIconIdentifierMotionSensor");
  v2[34] = CFSTR("HFImageIconIdentifierServiceOccupancySensorOn");
  v2[35] = CFSTR("HFImageIconIdentifierServiceOccupancySensorOff");
  v3[34] = CFSTR("HFCAPackageIconIdentifierOccupancySensor");
  v3[35] = CFSTR("HFCAPackageIconIdentifierOccupancySensor");
  v2[36] = CFSTR("HFImageIconIdentifierServiceSmokeSensorOn");
  v2[37] = CFSTR("HFImageIconIdentifierServiceSmokeSensorOff");
  v3[36] = CFSTR("HFCAPackageIconIdentifierSmokeSensor");
  v3[37] = CFSTR("HFCAPackageIconIdentifierSmokeSensor");
  v2[38] = CFSTR("HFImageIconIdentifierServiceWindowOpen");
  v2[39] = CFSTR("HFImageIconIdentifierServiceWindowClosed");
  v3[38] = CFSTR("HFCAPackageIconIdentifierWindowVertical");
  v3[39] = CFSTR("HFCAPackageIconIdentifierWindowVertical");
  v2[40] = CFSTR("HFImageIconIdentifierSecuritySystemOff");
  v2[41] = CFSTR("HFImageIconIdentifierSecuritySystemOn");
  v3[40] = CFSTR("HFCAPackageIconIdentifierSecuritySystem");
  v3[41] = CFSTR("HFCAPackageIconIdentifierSecuritySystem");
  v2[42] = CFSTR("HFImageIconIdentifierBlindsClosed");
  v2[43] = CFSTR("HFImageIconIdentifierBlindsOpen");
  v3[42] = CFSTR("HFCAPackageIconIdentifierWindowCoveringBlindsHorizontal");
  v3[43] = CFSTR("HFCAPackageIconIdentifierWindowCoveringBlindsHorizontal");
  v2[44] = CFSTR("HFImageIconIdentifierServiceFaucetOff");
  v2[45] = CFSTR("HFImageIconIdentifierServiceFaucetOn");
  v3[44] = CFSTR("HFCAPackageIconIdentifierFaucet");
  v3[45] = CFSTR("HFCAPackageIconIdentifierFaucet");
  v2[46] = CFSTR("HFImageIconIdentifierServiceSprinklerOff");
  v2[47] = CFSTR("HFImageIconIdentifierServiceSprinklerOn");
  v3[46] = CFSTR("HFCAPackageIconIdentifierSprinkler");
  v3[47] = CFSTR("HFCAPackageIconIdentifierSprinkler");
  v2[48] = CFSTR("HFImageIconIdentifierValveGenericOn");
  v2[49] = CFSTR("HFImageIconIdentifierValveGenericOff");
  v3[48] = CFSTR("HFCAPackageIconIdentifierFaucet");
  v3[49] = CFSTR("HFCAPackageIconIdentifierFaucet");
  v2[50] = CFSTR("HFImageIconIdentifierValveShowerHeadOn");
  v2[51] = CFSTR("HFImageIconIdentifierValveShowerHeadOff");
  v3[50] = CFSTR("HFCAPackageIconIdentifierValveCeilingJet");
  v3[51] = CFSTR("HFCAPackageIconIdentifierValveCeilingJet");
  v2[52] = CFSTR("HFImageIconIdentifierServiceOutlet");
  v2[53] = CFSTR("HFCAPackageIconIdentifierOutlet");
  v3[52] = CFSTR("HFCAPackageIconIdentifierOutletTypeB");
  v3[53] = CFSTR("HFCAPackageIconIdentifierOutletTypeB");
  v2[54] = CFSTR("HFCAPackageIconIdentifierOutletAustraliaNewZealand");
  v2[55] = CFSTR("HFCAPackageIconIdentifierOutletEurope");
  v2[56] = CFSTR("HFCAPackageIconIdentifierOutletUnitedKingdom");
  v2[57] = CFSTR("HFCAPackageIconIdentifierOutletJapan");
  v3[56] = CFSTR("HFCAPackageIconIdentifierOutletTypeG");
  v3[57] = CFSTR("HFCAPackageIconIdentifierOutletTypeA");
  v3[54] = CFSTR("HFCAPackageIconIdentifierOutletTypeI");
  v3[55] = CFSTR("HFCAPackageIconIdentifierOutletTypeC");
  v2[58] = CFSTR("HFCAPackageIconIdentifierOutletKorea");
  v2[59] = CFSTR("HFCAPackageIconIdentifierOutletHongKong");
  v3[58] = CFSTR("HFCAPackageIconIdentifierOutletTypeC");
  v3[59] = CFSTR("HFCAPackageIconIdentifierOutletTypeG");
  v2[60] = CFSTR("HFCAPackageIconIdentifierOutletChina");
  v2[61] = CFSTR("HFCAPackageIconIdentifierOutletBrazil");
  v3[60] = CFSTR("HFCAPackageIconIdentifierOutletTypeI");
  v3[61] = CFSTR("HFCAPackageIconIdentifierOutletTypeN");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 62);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378D90;
  qword_1ED378D90 = v0;

}

+ (id)displayIconDescriptorFromIconDescriptor:(id)a3 symbolName:(id)a4
{
  id v5;
  id v6;
  HFImageIconDescriptor *v7;
  HFImageIconDescriptor *v8;
  HFImageIconDescriptor *v9;
  HFCAPackageIconDescriptor *v10;
  void *v11;
  HFImageIconDescriptor *v12;
  HFImageIconDescriptor *v13;
  HFImageIconDescriptor *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v7 = (HFImageIconDescriptor *)v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = [HFCAPackageIconDescriptor alloc];
    -[HFImageIconDescriptor packageIdentifier](v9, "packageIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:](v10, "initWithPackageIdentifier:state:", v11, HFCAPackageStateDisplay);
LABEL_14:

    v7 = v12;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB5B8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v7 = v14;

    -[HFImageIconDescriptor imageSymbolConfiguration](v7, "imageSymbolConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "configurationByApplyingConfiguration:", v11);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v11;
    }
    v12 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", v6, v17);

    goto LABEL_14;
  }
LABEL_15:

  return v7;
}

@end
