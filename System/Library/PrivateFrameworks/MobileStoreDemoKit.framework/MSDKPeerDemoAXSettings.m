@implementation MSDKPeerDemoAXSettings

- (MSDKPeerDemoAXSettings)init
{
  MSDKPeerDemoAXSettings *v2;
  MSDKPeerDemoAXSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDKPeerDemoAXSettings;
  v2 = -[MSDKPeerDemoAXSettings init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSDKPeerDemoAXSettings setPointerControl:](v2, "setPointerControl:", 0);
    -[MSDKPeerDemoAXSettings setGazeAccessibility:](v3, "setGazeAccessibility:", 0);
    -[MSDKPeerDemoAXSettings setStaticFoveation:](v3, "setStaticFoveation:", 0);
    -[MSDKPeerDemoAXSettings setPointerControlHandChirality:](v3, "setPointerControlHandChirality:", 0);
    -[MSDKPeerDemoAXSettings setDwellControl:](v3, "setDwellControl:", 0);
    -[MSDKPeerDemoAXSettings setVoiceOver:](v3, "setVoiceOver:", 0);
    -[MSDKPeerDemoAXSettings setClosedCaptions:](v3, "setClosedCaptions:", 0);
    -[MSDKPeerDemoAXSettings setAssistiveTouch:](v3, "setAssistiveTouch:", 0);
    -[MSDKPeerDemoAXSettings setAudioDescriptions:](v3, "setAudioDescriptions:", 0);
  }
  return v3;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v7;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@[%p]: PointerControl=%lu GazeAccessibility=%lu StaticFoveation=%lu HandChirality=%lu DwellControll=%lu VoiceOver=%lu ClosedCaptions=%lu AssistiveTouch=%lu AudioDescriptions=%lu>"), v4, self, -[MSDKPeerDemoAXSettings pointerControl](self, "pointerControl"), -[MSDKPeerDemoAXSettings gazeAccessibility](self, "gazeAccessibility"), -[MSDKPeerDemoAXSettings staticFoveation](self, "staticFoveation"), -[MSDKPeerDemoAXSettings pointerControlHandChirality](self, "pointerControlHandChirality"), -[MSDKPeerDemoAXSettings dwellControl](self, "dwellControl"), -[MSDKPeerDemoAXSettings voiceOver](self, "voiceOver"), -[MSDKPeerDemoAXSettings closedCaptions](self, "closedCaptions"), -[MSDKPeerDemoAXSettings assistiveTouch](self, "assistiveTouch"), -[MSDKPeerDemoAXSettings audioDescriptions](self, "audioDescriptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoAXSettings)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoAXSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSDKPeerDemoAXSettings;
  v5 = -[MSDKPeerDemoAXSettings init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointerControl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoAXSettings setPointerControl:](v5, "setPointerControl:", objc_msgSend(v6, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gazeAccessibility"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoAXSettings setGazeAccessibility:](v5, "setGazeAccessibility:", objc_msgSend(v7, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staticFoveation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoAXSettings setStaticFoveation:](v5, "setStaticFoveation:", objc_msgSend(v8, "unsignedIntegerValue"));

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pointerControlHandChirality")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointerControlHandChirality"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoAXSettings setPointerControlHandChirality:](v5, "setPointerControlHandChirality:", objc_msgSend(v9, "unsignedIntegerValue"));

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("dwellControl")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dwellControl"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoAXSettings setDwellControl:](v5, "setDwellControl:", objc_msgSend(v10, "unsignedIntegerValue"));

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("voiceOver")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voiceOver"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoAXSettings setVoiceOver:](v5, "setVoiceOver:", objc_msgSend(v11, "unsignedIntegerValue"));

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("closedCaptions")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closedCaptions"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoAXSettings setClosedCaptions:](v5, "setClosedCaptions:", objc_msgSend(v12, "unsignedIntegerValue"));

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("assistiveTouch")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assistiveTouch"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoAXSettings setAssistiveTouch:](v5, "setAssistiveTouch:", objc_msgSend(v13, "unsignedIntegerValue"));

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("audioDescriptions")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioDescriptions"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoAXSettings setAudioDescriptions:](v5, "setAudioDescriptions:", objc_msgSend(v14, "unsignedIntegerValue"));

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings pointerControl](self, "pointerControl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("pointerControl"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings gazeAccessibility](self, "gazeAccessibility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("gazeAccessibility"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings staticFoveation](self, "staticFoveation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("staticFoveation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings pointerControlHandChirality](self, "pointerControlHandChirality"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("pointerControlHandChirality"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings dwellControl](self, "dwellControl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("dwellControl"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings voiceOver](self, "voiceOver"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("voiceOver"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings closedCaptions](self, "closedCaptions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("closedCaptions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings assistiveTouch](self, "assistiveTouch"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("assistiveTouch"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings audioDescriptions](self, "audioDescriptions"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("audioDescriptions"));

}

- (unint64_t)pointerControl
{
  return self->_pointerControl;
}

- (void)setPointerControl:(unint64_t)a3
{
  self->_pointerControl = a3;
}

- (unint64_t)gazeAccessibility
{
  return self->_gazeAccessibility;
}

- (void)setGazeAccessibility:(unint64_t)a3
{
  self->_gazeAccessibility = a3;
}

- (unint64_t)staticFoveation
{
  return self->_staticFoveation;
}

- (void)setStaticFoveation:(unint64_t)a3
{
  self->_staticFoveation = a3;
}

- (unint64_t)pointerControlHandChirality
{
  return self->_pointerControlHandChirality;
}

- (void)setPointerControlHandChirality:(unint64_t)a3
{
  self->_pointerControlHandChirality = a3;
}

- (unint64_t)dwellControl
{
  return self->_dwellControl;
}

- (void)setDwellControl:(unint64_t)a3
{
  self->_dwellControl = a3;
}

- (unint64_t)voiceOver
{
  return self->_voiceOver;
}

- (void)setVoiceOver:(unint64_t)a3
{
  self->_voiceOver = a3;
}

- (unint64_t)closedCaptions
{
  return self->_closedCaptions;
}

- (void)setClosedCaptions:(unint64_t)a3
{
  self->_closedCaptions = a3;
}

- (unint64_t)assistiveTouch
{
  return self->_assistiveTouch;
}

- (void)setAssistiveTouch:(unint64_t)a3
{
  self->_assistiveTouch = a3;
}

- (unint64_t)audioDescriptions
{
  return self->_audioDescriptions;
}

- (void)setAudioDescriptions:(unint64_t)a3
{
  self->_audioDescriptions = a3;
}

@end
