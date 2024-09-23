@implementation NTKComplicationControllerDisplayProperties

- (NTKComplicationControllerDisplayProperties)init
{
  NTKComplicationControllerDisplayProperties *v2;
  NTKComplicationControllerDisplayProperties *v3;
  NSString *launchLocation;
  NSString *widgetConfigurationIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKComplicationControllerDisplayProperties;
  v2 = -[NTKComplicationControllerDisplayProperties init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    launchLocation = v2->_launchLocation;
    v2->_faceDataMode = 0;
    v2->_launchLocation = 0;

    *(_WORD *)&v3->_tapEnabled = 257;
    v3->_supportsWatchGestureInteraction = 0;
    v3->_visibility = 0;
    *(_WORD *)&v3->_supportsTinting = 257;
    v3->_showsInLowLuminance = 1;
    widgetConfigurationIdentifier = v3->_widgetConfigurationIdentifier;
    v3->_widgetConfigurationIdentifier = 0;

    *(_WORD *)&v3->_widgetShowsSnapshot = 1;
    v3->_showPreview = 0;
  }
  return v3;
}

- (id)_initWithDisplayProperties:(id)a3
{
  id v4;
  NTKComplicationControllerDisplayProperties *v5;
  NTKComplicationControllerDisplayProperties *v6;
  uint64_t v7;
  NSString *launchLocation;
  uint64_t v9;
  NSString *widgetConfigurationIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKComplicationControllerDisplayProperties;
  v5 = -[NTKComplicationControllerDisplayProperties init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_faceDataMode = *((_QWORD *)v4 + 1);
    v7 = objc_msgSend(*((id *)v4 + 2), "copy");
    launchLocation = v6->_launchLocation;
    v6->_launchLocation = (NSString *)v7;

    v6->_tapEnabled = *((_BYTE *)v4 + 24);
    v6->_defaultTapAnimationEnabled = *((_BYTE *)v4 + 25);
    v6->_supportsWatchGestureInteraction = *((_BYTE *)v4 + 26);
    v6->_visibility = *((_QWORD *)v4 + 4);
    v6->_supportsTinting = *((_BYTE *)v4 + 40);
    v6->_showsWhenLocked = *((_BYTE *)v4 + 41);
    v6->_showsInLowLuminance = *((_BYTE *)v4 + 42);
    v9 = objc_msgSend(*((id *)v4 + 6), "copy");
    widgetConfigurationIdentifier = v6->_widgetConfigurationIdentifier;
    v6->_widgetConfigurationIdentifier = (NSString *)v9;

    v6->_widgetShowsSnapshot = *((_BYTE *)v4 + 56);
    v6->_widgetRequiresSnapshot = *((_BYTE *)v4 + 57);
    v6->_showPreview = *((_BYTE *)v4 + 58);
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NTKComplicationControllerDisplayProperties _initWithDisplayProperties:](+[NTKMutableComplicationControllerDisplayProperties allocWithZone:](NTKMutableComplicationControllerDisplayProperties, "allocWithZone:", a3), "_initWithDisplayProperties:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (-[NTKComplicationControllerDisplayProperties isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))return self;
  else
    return -[NTKComplicationControllerDisplayProperties _initWithDisplayProperties:](+[NTKComplicationControllerDisplayProperties allocWithZone:](NTKComplicationControllerDisplayProperties, "allocWithZone:", a3), "_initWithDisplayProperties:", self);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_faceDataMode);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_launchLocation);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_tapEnabled);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_defaultTapAnimationEnabled);
  v8 = (id)objc_msgSend(v3, "appendBool:", self->_supportsWatchGestureInteraction);
  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_visibility);
  v10 = (id)objc_msgSend(v3, "appendBool:", self->_supportsTinting);
  v11 = (id)objc_msgSend(v3, "appendBool:", self->_showsWhenLocked);
  v12 = (id)objc_msgSend(v3, "appendBool:", self->_showsInLowLuminance);
  v13 = (id)objc_msgSend(v3, "appendString:", self->_widgetConfigurationIdentifier);
  v14 = (id)objc_msgSend(v3, "appendBool:", self->_widgetShowsSnapshot);
  v15 = (id)objc_msgSend(v3, "appendBool:", self->_widgetRequiresSnapshot);
  v16 = (id)objc_msgSend(v3, "appendBool:", self->_showPreview);
  v17 = objc_msgSend(v3, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t faceDataMode;
  uint64_t v7;
  id v8;
  id v9;
  NSString *launchLocation;
  id v11;
  id v12;
  _BOOL8 tapEnabled;
  id v14;
  id v15;
  _BOOL8 defaultTapAnimationEnabled;
  id v17;
  id v18;
  _BOOL8 supportsWatchGestureInteraction;
  id v20;
  id v21;
  unint64_t visibility;
  id v23;
  id v24;
  _BOOL8 supportsTinting;
  id v26;
  id v27;
  _BOOL8 showsWhenLocked;
  id v29;
  id v30;
  _BOOL8 showsInLowLuminance;
  id v32;
  id v33;
  NSString *widgetConfigurationIdentifier;
  id v35;
  id v36;
  _BOOL8 widgetShowsSnapshot;
  id v38;
  id v39;
  _BOOL8 widgetRequiresSnapshot;
  id v41;
  id v42;
  _BOOL8 showPreview;
  id v44;
  id v45;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  faceDataMode = self->_faceDataMode;
  v7 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke;
  v71[3] = &unk_1E6BD0380;
  v8 = v4;
  v72 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", faceDataMode, v71);
  launchLocation = self->_launchLocation;
  v69[0] = v7;
  v69[1] = 3221225472;
  v69[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_2;
  v69[3] = &unk_1E6BD2410;
  v11 = v8;
  v70 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", launchLocation, v69);
  tapEnabled = self->_tapEnabled;
  v67[0] = v7;
  v67[1] = 3221225472;
  v67[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_3;
  v67[3] = &unk_1E6BCEAC8;
  v14 = v11;
  v68 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", tapEnabled, v67);
  defaultTapAnimationEnabled = self->_defaultTapAnimationEnabled;
  v65[0] = v7;
  v65[1] = 3221225472;
  v65[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_4;
  v65[3] = &unk_1E6BCEAC8;
  v17 = v14;
  v66 = v17;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", defaultTapAnimationEnabled, v65);
  supportsWatchGestureInteraction = self->_supportsWatchGestureInteraction;
  v63[0] = v7;
  v63[1] = 3221225472;
  v63[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_5;
  v63[3] = &unk_1E6BCEAC8;
  v20 = v17;
  v64 = v20;
  v21 = (id)objc_msgSend(v5, "appendBool:counterpart:", supportsWatchGestureInteraction, v63);
  visibility = self->_visibility;
  v61[0] = v7;
  v61[1] = 3221225472;
  v61[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_6;
  v61[3] = &unk_1E6BD2438;
  v23 = v20;
  v62 = v23;
  v24 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", visibility, v61);
  supportsTinting = self->_supportsTinting;
  v59[0] = v7;
  v59[1] = 3221225472;
  v59[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_7;
  v59[3] = &unk_1E6BCEAC8;
  v26 = v23;
  v60 = v26;
  v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", supportsTinting, v59);
  showsWhenLocked = self->_showsWhenLocked;
  v57[0] = v7;
  v57[1] = 3221225472;
  v57[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_8;
  v57[3] = &unk_1E6BCEAC8;
  v29 = v26;
  v58 = v29;
  v30 = (id)objc_msgSend(v5, "appendBool:counterpart:", showsWhenLocked, v57);
  showsInLowLuminance = self->_showsInLowLuminance;
  v55[0] = v7;
  v55[1] = 3221225472;
  v55[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_9;
  v55[3] = &unk_1E6BCEAC8;
  v32 = v29;
  v56 = v32;
  v33 = (id)objc_msgSend(v5, "appendBool:counterpart:", showsInLowLuminance, v55);
  widgetConfigurationIdentifier = self->_widgetConfigurationIdentifier;
  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_10;
  v53[3] = &unk_1E6BD2410;
  v35 = v32;
  v54 = v35;
  v36 = (id)objc_msgSend(v5, "appendString:counterpart:", widgetConfigurationIdentifier, v53);
  widgetShowsSnapshot = self->_widgetShowsSnapshot;
  v51[0] = v7;
  v51[1] = 3221225472;
  v51[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_11;
  v51[3] = &unk_1E6BCEAC8;
  v38 = v35;
  v52 = v38;
  v39 = (id)objc_msgSend(v5, "appendBool:counterpart:", widgetShowsSnapshot, v51);
  widgetRequiresSnapshot = self->_widgetRequiresSnapshot;
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_12;
  v49[3] = &unk_1E6BCEAC8;
  v41 = v38;
  v50 = v41;
  v42 = (id)objc_msgSend(v5, "appendBool:counterpart:", widgetRequiresSnapshot, v49);
  showPreview = self->_showPreview;
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_13;
  v47[3] = &unk_1E6BCEAC8;
  v48 = v41;
  v44 = v41;
  v45 = (id)objc_msgSend(v5, "appendBool:counterpart:", showPreview, v47);
  LOBYTE(v41) = objc_msgSend(v5, "isEqual");

  return (char)v41;
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

id __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 26);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_6(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_7(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_8(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 41);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 42);
}

id __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_10(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_11(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_12(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 57);
}

uint64_t __54__NTKComplicationControllerDisplayProperties_isEqual___block_invoke_13(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 58);
}

- (int64_t)faceDataMode
{
  return self->_faceDataMode;
}

- (NSString)launchLocation
{
  return self->_launchLocation;
}

- (BOOL)tapEnabled
{
  return self->_tapEnabled;
}

- (BOOL)defaultTapAnimationEnabled
{
  return self->_defaultTapAnimationEnabled;
}

- (BOOL)supportsWatchGestureInteraction
{
  return self->_supportsWatchGestureInteraction;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (BOOL)supportsTinting
{
  return self->_supportsTinting;
}

- (BOOL)showsWhenLocked
{
  return self->_showsWhenLocked;
}

- (BOOL)showsInLowLuminance
{
  return self->_showsInLowLuminance;
}

- (NSString)widgetConfigurationIdentifier
{
  return self->_widgetConfigurationIdentifier;
}

- (BOOL)widgetShowsSnapshot
{
  return self->_widgetShowsSnapshot;
}

- (BOOL)widgetRequiresSnapshot
{
  return self->_widgetRequiresSnapshot;
}

- (BOOL)showPreview
{
  return self->_showPreview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_launchLocation, 0);
}

@end
