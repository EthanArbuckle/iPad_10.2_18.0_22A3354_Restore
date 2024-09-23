@implementation NTKAnalogUtilitarianFaceViewComplicationFactory

- (id)initForDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKAnalogUtilitarianFaceViewComplicationFactory;
  v5 = -[NTKFaceViewComplicationFactory initForDevice:](&v13, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = -[NTKUtilityComplicationFactory initForDevice:]([NTKUtilityComplicationFactory alloc], "initForDevice:", v4);
    v7 = (void *)v5[9];
    v5[9] = v6;

    v8 = (void *)v5[9];
    objc_msgSend(v5, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setForegroundAlpha:", NTKUtilityComplicationNormalForegroundAlpha());

    v10 = (void *)v5[9];
    objc_msgSend(v5, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setForegroundImageAlpha:", NTKUtilityComplicationNormalForegroundAlpha());

  }
  return v5;
}

- (void)loadLayoutRulesForFaceView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[NTKAnalogUtilitarianFaceViewComplicationFactory _utilityComplicationSlots](self, "_utilityComplicationSlots");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v4, "complicationLayoutforSlot:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v19, -[NTKAnalogUtilitarianFaceViewComplicationFactory _utilitarianUtilitySlotForSlot:](self, "_utilitarianUtilitySlotForSlot:", v18), v6, v8, v10, v12);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  NTKUtilityComplicationFactory *complicationFactory;
  id v10;
  id v11;

  complicationFactory = self->_complicationFactory;
  v10 = a3;
  v11 = -[NTKUtilityComplicationFactory newViewForComplication:family:forSlot:](complicationFactory, "newViewForComplication:family:forSlot:", v10, a4, -[NTKAnalogUtilitarianFaceViewComplicationFactory _utilitarianUtilitySlotForSlot:](self, "_utilitarianUtilitySlotForSlot:", a5));

  return v11;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 faceView:(id)a5
{
  NTKUtilityComplicationFactory *complicationFactory;
  id v9;
  id v10;
  NTKUtilityComplicationFactory *v11;
  uint64_t v12;
  int64_t v13;
  id v14;

  complicationFactory = self->_complicationFactory;
  v9 = a5;
  v10 = a4;
  v14 = a3;
  -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](complicationFactory, "foregroundAlphaForEditing:", objc_msgSend(v9, "editing"));
  objc_msgSend(v14, "setForegroundAlpha:");
  v11 = self->_complicationFactory;
  v12 = objc_msgSend(v9, "editing");

  -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](v11, "foregroundImageAlphaForEditing:", v12);
  objc_msgSend(v14, "setForegroundImageAlpha:");
  v13 = -[NTKAnalogUtilitarianFaceViewComplicationFactory _utilitarianUtilitySlotForSlot:](self, "_utilitarianUtilitySlotForSlot:", v10);

  objc_msgSend(v14, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", v13));
}

- (id)_utilityComplicationSlots
{
  if (_utilityComplicationSlots_onceToken_0 != -1)
    dispatch_once(&_utilityComplicationSlots_onceToken_0, &__block_literal_global_126);
  return (id)_utilityComplicationSlots___slots;
}

void __76__NTKAnalogUtilitarianFaceViewComplicationFactory__utilityComplicationSlots__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("top-left");
  v2[1] = CFSTR("top-right");
  v2[2] = CFSTR("bottom-center");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_utilityComplicationSlots___slots;
  _utilityComplicationSlots___slots = v0;

}

- (int64_t)_utilitarianUtilitySlotForSlot:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-left")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-right")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-center")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationFactory, 0);
}

@end
