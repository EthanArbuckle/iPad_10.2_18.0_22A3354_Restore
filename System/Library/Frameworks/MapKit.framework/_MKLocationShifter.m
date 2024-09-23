@implementation _MKLocationShifter

- (_MKLocationShifter)init
{
  _MKLocationShifter *v2;
  GEOLocationShifter *v3;
  GEOLocationShifter *locationShifter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKLocationShifter;
  v2 = -[_MKLocationShifter init](&v6, sel_init);
  if (v2)
  {
    v3 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E0D27178]);
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = v3;

  }
  return v2;
}

+ (BOOL)isLocationShiftRequiredForLocation:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "referenceFrame") == 2)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D27178];
    objc_msgSend(v3, "coordinate");
    v4 = objc_msgSend(v5, "isLocationShiftRequiredForCoordinate:");
  }

  return v4;
}

- (BOOL)isLocationShiftEnabled
{
  return -[GEOLocationShifter locationShiftEnabled](self->_locationShifter, "locationShiftEnabled");
}

- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58___MKLocationShifter_shiftLocation_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E20DB300;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[_MKLocationShifter _prepareShiftForLocation:withCompletionHandler:withShiftRequestBlock:](self, "_prepareShiftForLocation:withCompletionHandler:withShiftRequestBlock:", v7, a4, v8);

}

- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72___MKLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke;
  v14[3] = &unk_1E20DB328;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[_MKLocationShifter _prepareShiftForLocation:withCompletionHandler:withShiftRequestBlock:](self, "_prepareShiftForLocation:withCompletionHandler:withShiftRequestBlock:", v13, v12, v14);

}

- (void)_prepareShiftForLocation:(id)a3 withCompletionHandler:(id)a4 withShiftRequestBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, double, double);
  void *v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (v8 && v9)
  {
    if (objc_msgSend((id)objc_opt_class(), "isLocationShiftRequiredForLocation:", v7))
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __91___MKLocationShifter__prepareShiftForLocation_withCompletionHandler_withShiftRequestBlock___block_invoke;
      v19 = &unk_1E20DB350;
      v11 = v7;
      v20 = v11;
      v21 = v8;
      v12 = (void *)MEMORY[0x18D778DB8](&v16);
      v13 = objc_alloc(MEMORY[0x1E0D27168]);
      v14 = (void *)objc_msgSend(v13, "initWithCLLocation:", v11, v16, v17, v18, v19);
      objc_msgSend(v14, "latLng");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v10)[2](v10, v15, v12);

    }
    else
    {
      (*((void (**)(id, id))v8 + 2))(v8, v7);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
}

@end
