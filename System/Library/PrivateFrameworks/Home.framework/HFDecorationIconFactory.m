@implementation HFDecorationIconFactory

+ (id)iconDescriptorForCharacteristicType:(id)a3 effectiveServiceType:(id)a4 primaryState:(int64_t)a5
{
  id v7;
  id v8;
  __CFString **v9;
  _QWORD *v10;
  int v11;
  __CFString **v12;
  __CFString *v13;
  __CFString *v14;
  HFMultistateImageIconDescriptor *v15;
  void *v16;
  HFSymbolIconConfiguration *v17;
  void *v18;
  HFMultistateImageIconDescriptor *v19;
  void *v20;
  void *v21;
  void *v23;
  __CFString *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB87C0]) & 1) != 0)
    goto LABEL_2;
  v9 = &HFSymbolIconIdentifierDecorationFan;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB89F0]) & 1) == 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB89C8]))
    {
      if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9A70]) & 1) != 0)
      {
LABEL_2:
        v9 = &HFSymbolIconIdentifierDecorationLightbulb;
        goto LABEL_21;
      }
      v10 = (_QWORD *)MEMORY[0x1E0CB9A10];
      goto LABEL_7;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8AA8]))
    {
      v11 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9A28]);
      v12 = &HFSymbolIconIdentifierDecorationGarageDoor;
LABEL_18:
      if (v11)
        v9 = v12;
      else
        v9 = &HFSymbolIconIdentifierDecorationDoor;
      goto LABEL_21;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8AF0]))
    {
      if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9B28]) & 1) != 0)
      {
        v9 = &HFSymbolIconIdentifierDecorationWindow;
        goto LABEL_21;
      }
      v11 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB9B30]);
      v12 = &HFSymbolIconIdentifierDecorationWindowCovering;
      goto LABEL_18;
    }
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8AE0]) & 1) != 0)
    {
      v9 = &HFSymbolIconIdentifierDecorationLock;
      goto LABEL_21;
    }
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB89E8]) & 1) != 0)
    {
      v9 = &HFSymbolIconIdentifierDecorationRotationDirection;
      goto LABEL_21;
    }
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8A98]) & 1) != 0)
    {
      v9 = HFImageIconIdentifierDecorationSwing;
      goto LABEL_21;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8790]))
    {
      v10 = (_QWORD *)MEMORY[0x1E0CB9B10];
LABEL_7:
      if (!objc_msgSend(v8, "isEqualToString:", *v10))
        v9 = &HFSymbolIconIdentifierDecorationPower;
      goto LABEL_21;
    }
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8AC0]) & 1) != 0)
    {
      v9 = &HFSymbolIconIdentifierDecorationPower;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8B00]))
        goto LABEL_38;
      v9 = &HFSymbolIconIdentifierDecorationSecuritySystem;
    }
  }
LABEL_21:
  v13 = *v9;
  if (!v13)
  {
LABEL_38:
    v21 = 0;
    goto LABEL_39;
  }
  v14 = v13;
  if (qword_1ED379200 != -1)
    dispatch_once(&qword_1ED379200, &__block_literal_global_120);
  objc_msgSend((id)_MergedGlobals_267, "objectForKeyedSubscript:", v14);
  v15 = (HFMultistateImageIconDescriptor *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 5, 32.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HFSymbolIconConfiguration initWithSystemImageName:configuration:]([HFSymbolIconConfiguration alloc], "initWithSystemImageName:configuration:", v14, v16);
    v25 = &unk_1EA7CC430;
    v26[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HFMultistateImageIconDescriptor initWithSymbolIconConfigurationsKeyedByPrimaryState:]([HFMultistateImageIconDescriptor alloc], "initWithSymbolIconConfigurationsKeyedByPrimaryState:", v18);

    if (!v15)
    {
      NSLog(CFSTR("iconDescriptor is nil for %@"), v14);
      v19 = [HFMultistateImageIconDescriptor alloc];
      v23 = &unk_1EA7CC430;
      v24 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HFMultistateImageIconDescriptor initWithImageIdentifiersKeyedByPrimaryState:](v19, "initWithImageIdentifiersKeyedByPrimaryState:", v20);

    }
  }

  -[HFMultistateImageIconDescriptor iconDescriptorForPrimaryState:](v15, "iconDescriptorForPrimaryState:", a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
  return v21;
}

@end
