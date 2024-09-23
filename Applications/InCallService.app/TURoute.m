@implementation TURoute

+ (id)speakerAudioRouteGlyph
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage speakerRouteGlyphForDisplayStyle:](UIImage, "speakerRouteGlyphForDisplayStyle:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageFlippedForRightToLeftLayoutDirection"));

  return v3;
}

- (id)audioRouteGlyphForDisplayStyle:(int64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  dispatch_semaphore_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if ((unint64_t)(a3 - 2) >= 3)
  {
    if (a3 == 1)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = sub_10000EA24;
      v21 = sub_10000EA34;
      v22 = 0;
      v10 = dispatch_semaphore_create(0);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000EA3C;
      v14[3] = &unk_100284B20;
      v16 = &v17;
      v11 = v10;
      v15 = v11;
      -[TURoute fetchAudioControlsGlyphWithCompletion:](self, "fetchAudioControlsGlyphWithCompletion:", v14);
      v12 = dispatch_time(0, 3000000000);
      dispatch_semaphore_wait(v11, v12);
      v13 = (id)v18[5];

      _Block_object_dispose(&v17, 8);
      return v13;
    }
    if (!a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TURoute audioRouteGlyphForRoutePicker](self, "audioRouteGlyphForRoutePicker"));
      return v8;
    }
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage routeGlyphForDeviceType:displayStyle:](UIImage, "routeGlyphForDeviceType:displayStyle:", -[TURoute deviceType](self, "deviceType"), a3));
    if (!v5)
    {
      if (!-[TURoute isSpeaker](self, "isSpeaker"))
      {
        if ((-[TURoute isSpeaker](self, "isSpeaker") & 1) == 0
          && (-[TURoute isReceiver](self, "isReceiver") & 1) == 0
          && (-[TURoute isDefaultRoute](self, "isDefaultRoute") & 1) == 0)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage bluetoothAudioRouteGlyphForDisplayStyle:](UIImage, "bluetoothAudioRouteGlyphForDisplayStyle:", a3));
          return v8;
        }
        v6 = sub_1000C5588();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_1001A7F08(self, v7);

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage speakerRouteGlyphForDisplayStyle:](UIImage, "speakerRouteGlyphForDisplayStyle:", a3));
      return v8;
    }
  }
  return v5;
}

- (id)audioRouteGlyphForRoutePickerWithColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage routeGlyphForDeviceType:displayStyle:color:](UIImage, "routeGlyphForDeviceType:displayStyle:color:", -[TURoute deviceType](self, "deviceType"), 0, v4));

  if (v5)
  {
    v6 = v5;
  }
  else if (-[TURoute isCarAudio](self, "isCarAudio"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIImage carplayRouteGlyphForDisplayStyle:](UIImage, "carplayRouteGlyphForDisplayStyle:", 0));
  }
  else if (-[TURoute isPreferred](self, "isPreferred"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIImage routeGlyphForDeviceType:displayStyle:](UIImage, "routeGlyphForDeviceType:displayStyle:", 1, 0));
  }
  else if (-[TURoute isBluetooth](self, "isBluetooth"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIImage bluetoothAudioRouteGlyphForDisplayStyle:](UIImage, "bluetoothAudioRouteGlyphForDisplayStyle:", 0));
  }
  else
  {
    if (-[TURoute isReceiver](self, "isReceiver"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHDevice currentDevice](PHDevice, "currentDevice"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "audioRouteGlyphImage"));

      goto LABEL_10;
    }
    if (-[TURoute isSpeaker](self, "isSpeaker"))
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[UIImage speakerRouteGlyphForDisplayStyle:](UIImage, "speakerRouteGlyphForDisplayStyle:", 0));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributeForKey:", AVSystemController_HeadphoneJackIsConnectedAttribute));
      if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
      {

      }
      else
      {
        v13 = -[TURoute isBluetoothLE](self, "isBluetoothLE");

        if ((v13 & 1) == 0)
        {
          v7 = 0;
          goto LABEL_10;
        }
      }
      v6 = (id)objc_claimAutoreleasedReturnValue(+[UIImage headphonesRouteGlyphForDisplayStyle:](UIImage, "headphonesRouteGlyphForDisplayStyle:", 0));
    }
  }
  v7 = v6;
LABEL_10:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_imageThatSuppressesAccessibilityHairlineThickening"));

  return v8;
}

- (id)audioRouteGlyphForRoutePicker
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TURoute audioRouteGlyphForRoutePickerWithColor:](self, "audioRouteGlyphForRoutePickerWithColor:", v3));

  return v4;
}

- (id)avSystemControllerQueryQueue
{
  if (qword_1002DC670 != -1)
    dispatch_once(&qword_1002DC670, &stru_100284B40);
  return (id)qword_1002DC668;
}

- (void)fetchAudioControlsGlyphWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  void (**v11)(id, void *);
  id v12;
  id location;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage routeGlyphForDeviceType:displayStyle:](UIImage, "routeGlyphForDeviceType:displayStyle:", -[TURoute deviceType](self, "deviceType"), 1));
  if (v5)
  {
    v4[2](v4, v5);
  }
  else if (-[TURoute isSpeaker](self, "isSpeaker"))
  {
    v7 = objc_msgSend((id)objc_opt_class(self, v6), "speakerAudioRouteGlyph");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v4[2](v4, v8);

  }
  else
  {
    objc_initWeak(&location, self);
    v9 = objc_claimAutoreleasedReturnValue(-[TURoute avSystemControllerQueryQueue](self, "avSystemControllerQueryQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000EE4C;
    block[3] = &unk_100284B68;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    dispatch_async(v9, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

@end
