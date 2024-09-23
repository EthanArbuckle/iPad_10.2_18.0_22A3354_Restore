@implementation AXMActiveSoundOutputActionHandle

- (void)stop
{
  id v2;

  -[AXMActiveSoundOutputActionHandle handleProvider](self, "handleProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (float)pitch
{
  void *v2;
  float v3;
  float v4;

  -[AXMActiveSoundOutputActionHandle handleProvider](self, "handleProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pitch");
  v4 = v3;

  return v4;
}

- (void)setPitch:(float)a3
{
  double v4;
  id v5;

  -[AXMActiveSoundOutputActionHandle handleProvider](self, "handleProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setPitch:", v4);

}

- (float)rate
{
  void *v2;
  float v3;
  float v4;

  -[AXMActiveSoundOutputActionHandle handleProvider](self, "handleProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (void)setRate:(float)a3
{
  double v4;
  id v5;

  -[AXMActiveSoundOutputActionHandle handleProvider](self, "handleProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setRate:", v4);

}

- (void)setQuantizedRate:(int64_t)a3
{
  id v4;

  -[AXMActiveSoundOutputActionHandle handleProvider](self, "handleProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQuantizedRate:", a3);

}

- (AXMActiveSoundOutputActionHandleProvider)handleProvider
{
  return self->_handleProvider;
}

- (void)setHandleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_handleProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleProvider, 0);
}

@end
