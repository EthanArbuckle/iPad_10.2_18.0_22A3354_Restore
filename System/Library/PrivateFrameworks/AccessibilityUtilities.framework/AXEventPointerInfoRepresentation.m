@implementation AXEventPointerInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXEventPointerInfoRepresentation)initWithCoder:(id)a3
{
  id v4;
  AXEventPointerInfoRepresentation *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXEventPointerInfoRepresentation;
  v5 = -[AXEventPointerInfoRepresentation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerX"));
    -[AXEventPointerInfoRepresentation setPointerX:](v5, "setPointerX:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerY"));
    -[AXEventPointerInfoRepresentation setPointerY:](v5, "setPointerY:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerZ"));
    -[AXEventPointerInfoRepresentation setPointerZ:](v5, "setPointerZ:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerAccelX"));
    -[AXEventPointerInfoRepresentation setPointerAccelX:](v5, "setPointerAccelX:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerAccelY"));
    -[AXEventPointerInfoRepresentation setPointerAccelY:](v5, "setPointerAccelY:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerAccelZ"));
    -[AXEventPointerInfoRepresentation setPointerAccelZ:](v5, "setPointerAccelZ:");
    -[AXEventPointerInfoRepresentation setIsPointerMove:](v5, "setIsPointerMove:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPointerMove")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerButtonMask"));
    -[AXEventPointerInfoRepresentation setPointerButtonMask:](v5, "setPointerButtonMask:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerButtonNumber"));
    -[AXEventPointerInfoRepresentation setPointerButtonNumber:](v5, "setPointerButtonNumber:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerButtonClickCount"));
    -[AXEventPointerInfoRepresentation setPointerButtonClickCount:](v5, "setPointerButtonClickCount:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerButtonPressure"));
    -[AXEventPointerInfoRepresentation setPointerButtonPressure:](v5, "setPointerButtonPressure:");
    -[AXEventPointerInfoRepresentation setPointerIsAbsolute:](v5, "setPointerIsAbsolute:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pointerIsAbsolute")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceTypeHint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventPointerInfoRepresentation setDeviceTypeHint:](v5, "setDeviceTypeHint:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scrollEvent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXEventPointerInfoRepresentation setScrollEvent:](v5, "setScrollEvent:", v7);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXEventPointerInfoRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init(AXEventPointerInfoRepresentation);
  -[AXEventPointerInfoRepresentation pointerX](self, "pointerX");
  -[AXEventPointerInfoRepresentation setPointerX:](v5, "setPointerX:");
  -[AXEventPointerInfoRepresentation pointerY](self, "pointerY");
  -[AXEventPointerInfoRepresentation setPointerY:](v5, "setPointerY:");
  -[AXEventPointerInfoRepresentation pointerZ](self, "pointerZ");
  -[AXEventPointerInfoRepresentation setPointerZ:](v5, "setPointerZ:");
  -[AXEventPointerInfoRepresentation pointerAccelX](self, "pointerAccelX");
  -[AXEventPointerInfoRepresentation setPointerAccelX:](v5, "setPointerAccelX:");
  -[AXEventPointerInfoRepresentation pointerAccelY](self, "pointerAccelY");
  -[AXEventPointerInfoRepresentation setPointerAccelY:](v5, "setPointerAccelY:");
  -[AXEventPointerInfoRepresentation pointerAccelZ](self, "pointerAccelZ");
  -[AXEventPointerInfoRepresentation setPointerAccelZ:](v5, "setPointerAccelZ:");
  -[AXEventPointerInfoRepresentation setIsPointerMove:](v5, "setIsPointerMove:", -[AXEventPointerInfoRepresentation isPointerMove](self, "isPointerMove"));
  -[AXEventPointerInfoRepresentation pointerButtonMask](self, "pointerButtonMask");
  -[AXEventPointerInfoRepresentation setPointerButtonMask:](v5, "setPointerButtonMask:");
  -[AXEventPointerInfoRepresentation pointerButtonNumber](self, "pointerButtonNumber");
  -[AXEventPointerInfoRepresentation setPointerButtonNumber:](v5, "setPointerButtonNumber:");
  -[AXEventPointerInfoRepresentation pointerButtonClickCount](self, "pointerButtonClickCount");
  -[AXEventPointerInfoRepresentation setPointerButtonClickCount:](v5, "setPointerButtonClickCount:");
  -[AXEventPointerInfoRepresentation pointerButtonPressure](self, "pointerButtonPressure");
  -[AXEventPointerInfoRepresentation setPointerButtonPressure:](v5, "setPointerButtonPressure:");
  -[AXEventPointerInfoRepresentation setPointerIsAbsolute:](v5, "setPointerIsAbsolute:", -[AXEventPointerInfoRepresentation pointerIsAbsolute](self, "pointerIsAbsolute"));
  -[AXEventPointerInfoRepresentation deviceTypeHint](self, "deviceTypeHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[AXEventPointerInfoRepresentation setDeviceTypeHint:](v5, "setDeviceTypeHint:", v7);

  -[AXEventPointerInfoRepresentation scrollEvent](self, "scrollEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[AXEventPointerInfoRepresentation setScrollEvent:](v5, "setScrollEvent:", v9);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXEventPointerInfoRepresentation pointerX](self, "pointerX");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerX"));
  -[AXEventPointerInfoRepresentation pointerY](self, "pointerY");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerY"));
  -[AXEventPointerInfoRepresentation pointerZ](self, "pointerZ");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerZ"));
  -[AXEventPointerInfoRepresentation pointerAccelX](self, "pointerAccelX");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerAccelX"));
  -[AXEventPointerInfoRepresentation pointerAccelY](self, "pointerAccelY");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerAccelY"));
  -[AXEventPointerInfoRepresentation pointerAccelZ](self, "pointerAccelZ");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerAccelZ"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXEventPointerInfoRepresentation isPointerMove](self, "isPointerMove"), CFSTR("isPointerMove"));
  -[AXEventPointerInfoRepresentation pointerButtonMask](self, "pointerButtonMask");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerButtonMask"));
  -[AXEventPointerInfoRepresentation pointerButtonNumber](self, "pointerButtonNumber");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerButtonNumber"));
  -[AXEventPointerInfoRepresentation pointerButtonClickCount](self, "pointerButtonClickCount");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerButtonClickCount"));
  -[AXEventPointerInfoRepresentation pointerButtonPressure](self, "pointerButtonPressure");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointerButtonPressure"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXEventPointerInfoRepresentation pointerIsAbsolute](self, "pointerIsAbsolute"), CFSTR("pointerIsAbsolute"));
  -[AXEventPointerInfoRepresentation deviceTypeHint](self, "deviceTypeHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deviceTypeHint"));

  -[AXEventPointerInfoRepresentation scrollEvent](self, "scrollEvent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("scrollEvent"));

}

- (id)accessibilityEventRepresentationTabularDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXEventPointerInfoRepresentation pointerX](self, "pointerX");
  v27 = v4;
  -[AXEventPointerInfoRepresentation pointerY](self, "pointerY");
  v26 = v5;
  -[AXEventPointerInfoRepresentation pointerZ](self, "pointerZ");
  v7 = v6;
  -[AXEventPointerInfoRepresentation pointerAccelX](self, "pointerAccelX");
  v9 = v8;
  -[AXEventPointerInfoRepresentation pointerAccelY](self, "pointerAccelY");
  v11 = v10;
  -[AXEventPointerInfoRepresentation pointerAccelZ](self, "pointerAccelZ");
  v13 = v12;
  -[AXEventPointerInfoRepresentation isPointerMove](self, "isPointerMove");
  NSStringFromBOOL();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventPointerInfoRepresentation pointerButtonMask](self, "pointerButtonMask");
  v16 = v15;
  -[AXEventPointerInfoRepresentation pointerButtonNumber](self, "pointerButtonNumber");
  v18 = v17;
  -[AXEventPointerInfoRepresentation pointerButtonClickCount](self, "pointerButtonClickCount");
  v20 = v19;
  -[AXEventPointerInfoRepresentation pointerButtonPressure](self, "pointerButtonPressure");
  v22 = v21;
  -[AXEventPointerInfoRepresentation pointerIsAbsolute](self, "pointerIsAbsolute");
  NSStringFromBOOL();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" Pointer Info:\n   X: %.2f\n   Y: %.2f\n   Z: %.2f\n   accelX: %.2f\n   accelY: %.2f\n   accelZ: %.2f\n   isMove: %@\n   Button Mask: %.2f\n   Button Number: %.2f\n   Click Count: %.2f\n   Pressure: %.2f\n   isAbsolute: %@\n"), v27, v26, v7, v9, v11, v13, v14, v16, v18, v20, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
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
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  BOOL v38;
  void *v40;
  void *v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[AXEventPointerInfoRepresentation pointerX](self, "pointerX");
    v7 = v6;
    objc_msgSend(v5, "pointerX");
    if (v7 != v8)
      goto LABEL_14;
    -[AXEventPointerInfoRepresentation pointerY](self, "pointerY");
    v10 = v9;
    objc_msgSend(v5, "pointerY");
    if (v10 != v11)
      goto LABEL_14;
    -[AXEventPointerInfoRepresentation pointerZ](self, "pointerZ");
    v13 = v12;
    objc_msgSend(v5, "pointerZ");
    if (v13 != v14)
      goto LABEL_14;
    -[AXEventPointerInfoRepresentation pointerAccelX](self, "pointerAccelX");
    v16 = v15;
    objc_msgSend(v5, "pointerAccelX");
    if (v16 != v17)
      goto LABEL_14;
    -[AXEventPointerInfoRepresentation pointerAccelY](self, "pointerAccelY");
    v19 = v18;
    objc_msgSend(v5, "pointerAccelY");
    if (v19 != v20)
      goto LABEL_14;
    -[AXEventPointerInfoRepresentation pointerAccelZ](self, "pointerAccelZ");
    v22 = v21;
    objc_msgSend(v5, "pointerAccelZ");
    if (v22 != v23)
      goto LABEL_14;
    v24 = -[AXEventPointerInfoRepresentation isPointerMove](self, "isPointerMove");
    if (v24 != objc_msgSend(v5, "isPointerMove"))
      goto LABEL_14;
    -[AXEventPointerInfoRepresentation pointerButtonMask](self, "pointerButtonMask");
    v26 = v25;
    objc_msgSend(v5, "pointerButtonMask");
    if (v26 != v27)
      goto LABEL_14;
    -[AXEventPointerInfoRepresentation pointerButtonNumber](self, "pointerButtonNumber");
    v29 = v28;
    objc_msgSend(v5, "pointerButtonNumber");
    if (v29 != v30)
      goto LABEL_14;
    -[AXEventPointerInfoRepresentation pointerButtonClickCount](self, "pointerButtonClickCount");
    v32 = v31;
    objc_msgSend(v5, "pointerButtonClickCount");
    if (v32 == v33
      && (-[AXEventPointerInfoRepresentation pointerButtonPressure](self, "pointerButtonPressure"),
          v35 = v34,
          objc_msgSend(v5, "pointerButtonPressure"),
          v35 == v36)
      && (v37 = -[AXEventPointerInfoRepresentation pointerIsAbsolute](self, "pointerIsAbsolute"),
          v37 == objc_msgSend(v5, "pointerIsAbsolute")))
    {
      -[AXEventPointerInfoRepresentation scrollEvent](self, "scrollEvent");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scrollEvent");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v40 == v41;

    }
    else
    {
LABEL_14:
      v38 = 0;
    }

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AXEventPointerInfoRepresentation;
  -[AXEventPointerInfoRepresentation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEventPointerInfoRepresentation accessibilityEventRepresentationTabularDescription](self, "accessibilityEventRepresentationTabularDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (double)pointerX
{
  return self->_pointerX;
}

- (void)setPointerX:(double)a3
{
  self->_pointerX = a3;
}

- (double)pointerY
{
  return self->_pointerY;
}

- (void)setPointerY:(double)a3
{
  self->_pointerY = a3;
}

- (double)pointerZ
{
  return self->_pointerZ;
}

- (void)setPointerZ:(double)a3
{
  self->_pointerZ = a3;
}

- (double)pointerAccelX
{
  return self->_pointerAccelX;
}

- (void)setPointerAccelX:(double)a3
{
  self->_pointerAccelX = a3;
}

- (double)pointerAccelY
{
  return self->_pointerAccelY;
}

- (void)setPointerAccelY:(double)a3
{
  self->_pointerAccelY = a3;
}

- (double)pointerAccelZ
{
  return self->_pointerAccelZ;
}

- (void)setPointerAccelZ:(double)a3
{
  self->_pointerAccelZ = a3;
}

- (BOOL)isPointerMove
{
  return self->_isPointerMove;
}

- (void)setIsPointerMove:(BOOL)a3
{
  self->_isPointerMove = a3;
}

- (double)pointerButtonMask
{
  return self->_pointerButtonMask;
}

- (void)setPointerButtonMask:(double)a3
{
  self->_pointerButtonMask = a3;
}

- (double)pointerButtonNumber
{
  return self->_pointerButtonNumber;
}

- (void)setPointerButtonNumber:(double)a3
{
  self->_pointerButtonNumber = a3;
}

- (double)pointerButtonClickCount
{
  return self->_pointerButtonClickCount;
}

- (void)setPointerButtonClickCount:(double)a3
{
  self->_pointerButtonClickCount = a3;
}

- (double)pointerButtonPressure
{
  return self->_pointerButtonPressure;
}

- (void)setPointerButtonPressure:(double)a3
{
  self->_pointerButtonPressure = a3;
}

- (BOOL)pointerIsAbsolute
{
  return self->_pointerIsAbsolute;
}

- (void)setPointerIsAbsolute:(BOOL)a3
{
  self->_pointerIsAbsolute = a3;
}

- (NSString)deviceTypeHint
{
  return self->_deviceTypeHint;
}

- (void)setDeviceTypeHint:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTypeHint, a3);
}

- (AXEventRepresentation)scrollEvent
{
  return self->_scrollEvent;
}

- (void)setScrollEvent:(id)a3
{
  objc_storeStrong((id *)&self->_scrollEvent, a3);
}

- (AXEventRepresentation)trackpadHandEvent
{
  return self->_trackpadHandEvent;
}

- (void)setTrackpadHandEvent:(id)a3
{
  objc_storeStrong((id *)&self->_trackpadHandEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackpadHandEvent, 0);
  objc_storeStrong((id *)&self->_scrollEvent, 0);
  objc_storeStrong((id *)&self->_deviceTypeHint, 0);
}

@end
