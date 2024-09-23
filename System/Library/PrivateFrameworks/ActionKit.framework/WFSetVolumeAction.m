@implementation WFSetVolumeAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v5;
  int v6;
  int v7;
  double v8;
  id v9;

  -[WFSetVolumeAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFVolume"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  -[WFSetVolumeAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFVolumeSetting"), objc_opt_class());
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Ringtone")))
  {
    LODWORD(v8) = v7;
    -[WFSetVolumeAction setRingtoneVolume:](self, "setRingtoneVolume:", v8);
  }
  else
  {
    LODWORD(v8) = v7;
    -[WFSetVolumeAction setMediaVolume:](self, "setMediaVolume:", v8);
  }

}

- (void)setRingtoneVolume:(float)a3
{
  double v4;
  id v5;

  objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setVolumeTo:forCategory:", CFSTR("Ringtone"), v4);

}

- (void)setMediaVolume:(float)a3
{
  double v4;
  id v5;

  objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setVolumeTo:forCategory:", CFSTR("Audio/Video"), v4);

}

@end
