@implementation CUPowerSourceLEDInfo

- (CUPowerSourceLEDInfo)initWithCoder:(id)a3
{
  id v4;
  CUPowerSourceLEDInfo *v5;
  CUPowerSourceLEDInfo *v6;
  objc_super v8;
  uint64_t v9;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CUPowerSourceLEDInfo;
  v5 = -[CUPowerSourceLEDInfo init](&v8, sel_init);
  if (v5)
  {
    v9 = 0;
    if (NSDecodeSInt64RangedIfPresent(v4, CFSTR("state"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v9))
      v5->_LEDState = v9;
    v9 = 0;
    if (NSDecodeSInt64RangedIfPresent(v4, CFSTR("color"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v9))
      v5->_LEDColor = v9;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t LEDState;
  uint64_t LEDColor;
  id v7;

  v4 = a3;
  LEDState = self->_LEDState;
  v7 = v4;
  if ((_DWORD)LEDState)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", LEDState, CFSTR("state"));
    v4 = v7;
  }
  LEDColor = self->_LEDColor;
  if ((_DWORD)LEDColor)
  {
    objc_msgSend(v7, "encodeInteger:forKey:", LEDColor, CFSTR("color"));
    v4 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int LEDState;
  int LEDColor;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (LEDState = self->_LEDState, LEDState == objc_msgSend(v4, "LEDState")))
  {
    LEDColor = self->_LEDColor;
    v7 = LEDColor == objc_msgSend(v4, "LEDColor");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_LEDColor ^ self->_LEDState;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  CFMutableStringRef v25;
  CFMutableStringRef v26;
  CFMutableStringRef v27;

  v27 = 0;
  NSAppendPrintF(&v27, (uint64_t)"CUPowerSourceLEDInfo %{ptr}", v2, v3, v4, v5, v6, v7, (uint64_t)self);
  v9 = v27;
  v26 = v9;
  NSAppendPrintF(&v26, (uint64_t)", St %d (%s)", v10, v11, v12, v13, v14, v15, self->_LEDState);
  v16 = v26;

  v25 = v16;
  NSAppendPrintF(&v25, (uint64_t)", Cl %d (%s)", v17, v18, v19, v20, v21, v22, self->_LEDColor);
  v23 = v25;

  return v23;
}

- (int)LEDColor
{
  return self->_LEDColor;
}

- (void)setLEDColor:(int)a3
{
  self->_LEDColor = a3;
}

- (int)LEDState
{
  return self->_LEDState;
}

- (void)setLEDState:(int)a3
{
  self->_LEDState = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
