@implementation WFSetParkedCarAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 buf;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "numberOfItems"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke;
    v9[3] = &unk_24F8B1ED8;
    v9[4] = self;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v5 = (void *)getCLLocationClass_softClass_10419;
    v13 = getCLLocationClass_softClass_10419;
    if (!getCLLocationClass_softClass_10419)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v15 = __getCLLocationClass_block_invoke_10420;
      v16 = &unk_24F8BB430;
      v17 = &v10;
      __getCLLocationClass_block_invoke_10420((uint64_t)&buf);
      v5 = (void *)v11[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v4, "getObjectRepresentation:forClass:", v9, objc_opt_class());
  }
  else
  {
    getWFActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]";
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s No input provided to WFSetParkedCarAction", (uint8_t *)&buf, 0xCu);
    }

    -[WFSetParkedCarAction missingLocationError](self, "missingLocationError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetParkedCarAction finishRunningWithError:](self, "finishRunningWithError:", v8);

  }
}

- (id)missingLocationError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("No Car Location Provided"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Please provide a location for the parked car."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEC4270];
  v6 = *MEMORY[0x24BDD0FC8];
  v10[0] = *MEMORY[0x24BDD0FD8];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)resizedCompressedJPEGImageDataWithWFImage:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double width;
  double height;
  double v24;
  CGFloat v25;
  UIImage *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int v32;
  const char *v33;
  uint64_t v34;
  CGSize v35;
  CGRect v36;
  CGRect v37;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "UIImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  if (v6 >= v9)
    v10 = v6;
  else
    v10 = v9;
  objc_msgSend(v3, "size");
  v12 = v11;
  objc_msgSend(v3, "size");
  v14 = v13;
  objc_msgSend(v3, "size");
  if (v12 <= v14)
    v15 = v16;
  v17 = v15 / v10 * 0.5;
  if (v17 >= 1.0)
    v18 = v17;
  else
    v18 = 1.0;
  objc_msgSend(v3, "size");
  v20 = v19 / v18;
  objc_msgSend(v3, "size");
  v36.size.height = v21 / v18;
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = v20;
  v37 = CGRectIntegral(v36);
  width = v37.size.width;
  height = v37.size.height;
  objc_msgSend(v3, "scale", v37.origin.x, v37.origin.y);
  v25 = v24;
  v35.width = width;
  v35.height = height;
  UIGraphicsBeginImageContextWithOptions(v35, 1, v25);
  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  if (!v26)
  {
    getWFActionsLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v32 = 136315138;
      v33 = "-[WFSetParkedCarAction resizedCompressedJPEGImageDataWithWFImage:]";
      _os_log_impl(&dword_22D353000, v28, OS_LOG_TYPE_ERROR, "%s Failed to resize UIImage for save.", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_17;
  }
  UIImageJPEGRepresentation(v26, 0.699999988);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    getWFActionsLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v32 = 136315138;
      v33 = "-[WFSetParkedCarAction resizedCompressedJPEGImageDataWithWFImage:]";
      _os_log_impl(&dword_22D353000, v30, OS_LOG_TYPE_ERROR, "%s Failed to convert UIImage to JPEG data.", (uint8_t *)&v32, 0xCu);
    }

    v28 = 0;
LABEL_17:
    v29 = 0;
    goto LABEL_18;
  }
  v28 = v27;
  v29 = v28;
LABEL_18:

  return v29;
}

- (void)fetchLastParkedCarContentItemWithCompletionHandler:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 500000000);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__WFSetParkedCarAction_fetchLastParkedCarContentItemWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F8BB5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v7);

}

- (BOOL)locationParameterIsCurrentLocation
{
  void *v2;
  void *v3;
  char v4;

  -[WFSetParkedCarAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFLocation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentLocation");

  return v4;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __75__WFSetParkedCarAction_fetchLastParkedCarContentItemWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(getRTRoutineManagerClass(), "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __75__WFSetParkedCarAction_fetchLastParkedCarContentItemWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_24F8BABC0;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "fetchLastVehicleEventsWithHandler:", v4);

}

void __75__WFSetParkedCarAction_fetchLastParkedCarContentItemWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BE19450];
    v8 = (void *)MEMORY[0x24BE19390];
    objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationWithAppDescriptor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemWithObject:origin:disclosureLevel:", v6, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    getWFActionsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[WFSetParkedCarAction fetchLastParkedCarContentItemWithCompletionHandler:]_block_invoke_2";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_ERROR, "%s No RTVehicleEvent found, error = %@", (uint8_t *)&v13, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSetParkedCarNotes"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getRTRoutineManagerClass(), "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_109;
    v11[3] = &unk_24F8BB370;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "vehicleEventAtLocation:notes:handler:", v6, v8, v11);

  }
  else
  {
    getWFActionsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_ERROR, "%s Failed to coerce location content collection to CLLocation.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getWFActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_ERROR, "%s CoreRoutine error setting vehicle event: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v3);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_110;
    v6[3] = &unk_24F8B1E88;
    v6[4] = v5;
    objc_msgSend(v5, "fetchLastParkedCarContentItemWithCompletionHandler:", v6);
  }

}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImage"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "numberOfItems"))
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_113;
      v11[3] = &unk_24F8B1EB0;
      v11[4] = *(_QWORD *)(a1 + 32);
      v12 = v7;
      objc_msgSend(v8, "getObjectRepresentation:forClass:", v11, objc_opt_class());

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addItem:", v7);

      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    }

  }
  else
  {

    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_ERROR, "%s No car content item found after saving it: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }

}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_113(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "resizedCompressedJPEGImageDataWithWFImage:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(getRTRoutineManagerClass(), "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "vehicleEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateVehicleEventWithIdentifier:photo:", v10, v7);

      v11 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_114;
      v16[3] = &unk_24F8B1E88;
      v16[4] = v11;
      objc_msgSend(v11, "fetchLastParkedCarContentItemWithCompletionHandler:", v16);
    }
    else
    {
      getWFActionsLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
        _os_log_impl(&dword_22D353000, v14, OS_LOG_TYPE_ERROR, "%s Failed to resize/compress parked car image.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "output");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addItem:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    }

  }
  else
  {
    getWFActionsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFSetParkedCarAction runAsynchronouslyWithInput:]_block_invoke";
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_ERROR, "%s Failed to coerce imageCollection to WFImage with error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "output");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addItem:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }

}

void __51__WFSetParkedCarAction_runAsynchronouslyWithInput___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addItem:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);

}

@end
